import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { SubmitLessonDto } from './dto/submit-lesson.dto';

@Injectable()
export class ProgressService {
  constructor(private prisma: PrismaService) {}

  async getFirstChildId(userId: string): Promise<string> {
    const child = await this.prisma.childProfile.findFirst({
      where: { parentId: userId },
      select: { id: true },
    });
    if (!child) {
      throw new Error('No child profile found for this user');
    }
    return child.id;
  }

  async submitLessonProgress(childId: string, dto: SubmitLessonDto) {
    // Upsert lesson progress
    const progress = await this.prisma.lessonProgress.upsert({
      where: {
        childId_lessonId: {
          childId,
          lessonId: dto.lessonId,
        },
      },
      update: {
        status: dto.status,
        score: dto.score,
        attempts: { increment: 1 },
        correctAnswers: dto.correctAnswers,
        totalQuestions: dto.totalQuestions,
        timeSpentSeconds: dto.timeSpentSeconds,
        completedAt: dto.status === 'completed' ? new Date() : null,
        deviceSyncStatus: 'synced',
      },
      create: {
        childId,
        lessonId: dto.lessonId,
        status: dto.status,
        score: dto.score,
        attempts: 1,
        correctAnswers: dto.correctAnswers,
        totalQuestions: dto.totalQuestions,
        timeSpentSeconds: dto.timeSpentSeconds,
        completedAt: dto.status === 'completed' ? new Date() : null,
      },
    });

    // Update daily usage
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    await this.prisma.dailyUsage.upsert({
      where: {
        childId_date: {
          childId,
          date: today,
        },
      },
      update: {
        totalMinutes: { increment: Math.ceil(dto.timeSpentSeconds / 60) },
        lessonsCompleted: dto.status === 'completed' ? { increment: 1 } : undefined,
      },
      create: {
        childId,
        date: today,
        totalMinutes: Math.ceil(dto.timeSpentSeconds / 60),
        lessonsCompleted: dto.status === 'completed' ? 1 : 0,
      },
    });

    // Update skill tracking if lesson completed
    if (dto.status === 'completed' && dto.skillUpdates) {
      for (const skill of dto.skillUpdates) {
        const skillRecord = await this.prisma.skillTracking.findFirst({
          where: {
            childId,
            skillName: skill.skillName,
          },
        });

        if (skillRecord) {
          await this.prisma.skillTracking.update({
            where: { id: skillRecord.id },
            data: {
              consecutiveSuccesses: skill.success
                ? { increment: 1 }
                : 0,
              consecutiveFailures: skill.success
                ? 0
                : { increment: 1 },
              totalAttempts: { increment: 1 },
              lastPracticed: new Date(),
              masteryLevel: this.calculateMastery(
                skillRecord.consecutiveSuccesses + (skill.success ? 1 : 0),
              ),
            },
          });
        } else {
          await this.prisma.skillTracking.create({
            data: {
              childId,
              skillName: skill.skillName,
              consecutiveSuccesses: skill.success ? 1 : 0,
              consecutiveFailures: skill.success ? 0 : 1,
              totalAttempts: 1,
              lastPracticed: new Date(),
              masteryLevel: skill.success ? 'developing' : 'novice',
            },
          });
        }
      }
    }

    return progress;
  }

  async getChildProgress(childId: string) {
    const [lessons, skills, dailyUsage, badges] = await Promise.all([
      this.prisma.lessonProgress.findMany({
        where: { childId },
        include: { lesson: true },
        orderBy: { createdAt: 'desc' },
      }),
      this.prisma.skillTracking.findMany({
        where: { childId },
        orderBy: { skillName: 'asc' },
      }),
      this.prisma.dailyUsage.findMany({
        where: { childId },
        orderBy: { date: 'desc' },
        take: 30,
      }),
      this.prisma.childBadge.findMany({
        where: { childId },
        include: { badge: true },
        orderBy: { earnedAt: 'desc' },
      }),
    ]);

    return {
      lessons,
      skills,
      dailyUsage,
      badges,
      stats: {
        totalLessonsCompleted: lessons.filter((l) => l.status === 'completed').length,
        totalStars: lessons.reduce((sum, l) => sum + l.score, 0),
        totalMinutes: dailyUsage.reduce((sum, d) => sum + d.totalMinutes, 0),
      },
    };
  }

  private calculateMastery(consecutiveSuccesses: number): string {
    if (consecutiveSuccesses >= 5) return 'mastered';
    if (consecutiveSuccesses >= 3) return 'proficient';
    if (consecutiveSuccesses >= 1) return 'developing';
    return 'novice';
  }
}
