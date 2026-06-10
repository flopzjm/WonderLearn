import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { MailService } from '../mail/mail.service';

@Injectable()
export class ParentsService {
  constructor(
    private prisma: PrismaService,
    private mailService: MailService,
  ) {}

  async getDashboard(userId: string, childId: string) {
    const child = await this.prisma.childProfile.findFirst({
      where: { id: childId, parentId: userId },
      include: {
        lessonProgress: {
          include: { lesson: true },
          orderBy: { createdAt: 'desc' },
          take: 20,
        },
        skillTracking: true,
        dailyUsage: {
          orderBy: { date: 'desc' },
          take: 7,
        },
        badges: {
          include: { badge: true },
          orderBy: { earnedAt: 'desc' },
        },
      },
    });

    if (!child) {
      throw new NotFoundException('Child not found');
    }

    const today = new Date();
    today.setHours(0, 0, 0, 0);

    const todayUsage = child.dailyUsage.find(
      (u) => new Date(u.date).toDateString() === today.toDateString(),
    );

    return {
      child: {
        id: child.id,
        name: child.name,
        age: child.age,
        level: child.levelGlobal,
        avatarType: child.avatarType,
      },
      todayStats: {
        minutesUsed: todayUsage?.totalMinutes || 0,
        lessonsCompleted: todayUsage?.lessonsCompleted || 0,
        timeLimit: child.dailyTimeLimit,
        timeRemaining: Math.max(0, child.dailyTimeLimit - (todayUsage?.totalMinutes || 0)),
      },
      weeklyStats: this.calculateWeeklyStats(child.dailyUsage),
      skills: this.calculateSkillsSummary(child.skillTracking),
      recentLessons: child.lessonProgress.slice(0, 10).map((lp) => ({
        title: lp.lesson.title,
        module: lp.lesson.moduleId,
        score: lp.score,
        completedAt: lp.completedAt,
      })),
      badges: child.badges.map((b) => ({
        name: b.badge.name,
        title: b.badge.title,
        iconUrl: b.badge.iconUrl,
        earnedAt: b.earnedAt,
      })),
    };
  }

  async updateTimeLimit(userId: string, childId: string, timeLimit: number) {
    const child = await this.prisma.childProfile.findFirst({
      where: { id: childId, parentId: userId },
    });

    if (!child) {
      throw new NotFoundException('Child not found');
    }

    return this.prisma.childProfile.update({
      where: { id: childId },
      data: { dailyTimeLimit: timeLimit },
    });
  }

  async sendWeeklyReport(userId: string, childId: string) {
    const child = await this.prisma.childProfile.findFirst({
      where: { id: childId, parentId: userId },
      include: { parent: true },
    });

    if (!child) {
      throw new NotFoundException('Child not found');
    }

    const weeklyData = await this.getDashboard(userId, childId);

    await this.mailService.sendWeeklyReport(
      child.parent.email,
      child.name,
      weeklyData,
    );

    return { sent: true, email: child.parent.email };
  }

  private calculateWeeklyStats(dailyUsage: any[]) {
    const now = new Date();
    const weekAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000);

    const thisWeek = dailyUsage.filter(
      (u) => new Date(u.date) >= weekAgo,
    );

    const prevWeekStart = new Date(weekAgo.getTime() - 7 * 24 * 60 * 60 * 1000);
    const prevWeek = dailyUsage.filter(
      (u) => new Date(u.date) >= prevWeekStart && new Date(u.date) < weekAgo,
    );

    const thisWeekTotal = thisWeek.reduce((sum, u) => sum + u.totalMinutes, 0);
    const prevWeekTotal = prevWeek.reduce((sum, u) => sum + u.totalMinutes, 0);

    return {
      thisWeekMinutes: thisWeekTotal,
      prevWeekMinutes: prevWeekTotal,
      changePercent: prevWeekTotal > 0
        ? Math.round(((thisWeekTotal - prevWeekTotal) / prevWeekTotal) * 100)
        : 0,
    };
  }

  private calculateSkillsSummary(skills: any[]) {
    const summary: Record<string, number> = {
      phonics: 0,
      math: 0,
      sel: 0,
    };

    skills.forEach((s) => {
      if (s.skillName.startsWith('phonics_')) {
        summary.phonics += this.masteryToScore(s.masteryLevel);
      } else if (s.skillName.startsWith('counting_') || s.skillName.startsWith('addition_') || s.skillName.startsWith('shape_')) {
        summary.math += this.masteryToScore(s.masteryLevel);
      } else if (s.skillName.startsWith('emotion_') || s.skillName.startsWith('empathy_')) {
        summary.sel += this.masteryToScore(s.masteryLevel);
      }
    });

    return summary;
  }

  private masteryToScore(mastery: string): number {
    switch (mastery) {
      case 'mastered': return 100;
      case 'proficient': return 75;
      case 'developing': return 50;
      case 'novice': return 25;
      default: return 0;
    }
  }
}
