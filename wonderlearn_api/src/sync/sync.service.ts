import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class SyncService {
  constructor(private prisma: PrismaService) {}

  async syncOfflineEvents(childId: string, events: any[]) {
    const results = [];

    for (const event of events) {
      try {
        // Process each event based on type
        switch (event.eventType) {
          case 'lesson_progress':
            await this.processLessonProgress(childId, event.payload);
            break;
          case 'skill_update':
            await this.processSkillUpdate(childId, event.payload);
            break;
          case 'badge_earned':
            await this.processBadgeEarned(childId, event.payload);
            break;
        }

        // Mark as synced
        await this.prisma.offlineEvent.update({
          where: { id: event.id },
          data: { syncedAt: new Date() },
        });

        results.push({ id: event.id, status: 'synced' });
      } catch (error) {
        results.push({ id: event.id, status: 'error', error: error.message });
      }
    }

    return { synced: results.filter((r) => r.status === 'synced').length, errors: results.filter((r) => r.status === 'error').length };
  }

  async getPendingEvents(childId: string) {
    return this.prisma.offlineEvent.findMany({
      where: {
        childId,
        syncedAt: null,
      },
      orderBy: { timestamp: 'asc' },
    });
  }

  async createOfflineEvent(childId: string, eventType: string, payload: any) {
    return this.prisma.offlineEvent.create({
      data: {
        childId,
        eventType,
        payload: JSON.stringify(payload),
        timestamp: new Date(),
      },
    });
  }

  private async processLessonProgress(childId: string, payload: any) {
    await this.prisma.lessonProgress.upsert({
      where: {
        childId_lessonId: {
          childId,
          lessonId: payload.lessonId,
        },
      },
      update: {
        status: payload.status,
        score: payload.score,
        correctAnswers: payload.correctAnswers,
        totalQuestions: payload.totalQuestions,
        timeSpentSeconds: payload.timeSpentSeconds,
        completedAt: payload.status === 'completed' ? new Date() : null,
        deviceSyncStatus: 'synced',
      },
      create: {
        childId,
        lessonId: payload.lessonId,
        status: payload.status,
        score: payload.score,
        correctAnswers: payload.correctAnswers,
        totalQuestions: payload.totalQuestions,
        timeSpentSeconds: payload.timeSpentSeconds,
        completedAt: payload.status === 'completed' ? new Date() : null,
      },
    });
  }

  private async processSkillUpdate(childId: string, payload: any) {
    await this.prisma.skillTracking.upsert({
      where: {
        childId_skillName: {
          childId,
          skillName: payload.skillName,
        },
      },
      update: {
        masteryLevel: payload.masteryLevel,
        consecutiveSuccesses: payload.consecutiveSuccesses,
        consecutiveFailures: payload.consecutiveFailures,
        lastPracticed: new Date(),
      },
      create: {
        childId,
        skillName: payload.skillName,
        masteryLevel: payload.masteryLevel,
        consecutiveSuccesses: payload.consecutiveSuccesses,
        consecutiveFailures: payload.consecutiveFailures,
        lastPracticed: new Date(),
      },
    });
  }

  private async processBadgeEarned(childId: string, payload: any) {
    await this.prisma.childBadge.upsert({
      where: {
        childId_badgeId: {
          childId,
          badgeId: payload.badgeId,
        },
      },
      update: {},
      create: {
        childId,
        badgeId: payload.badgeId,
      },
    });
  }
}
