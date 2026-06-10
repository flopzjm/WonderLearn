import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import * as adaptiveRules from './rules/adaptive-rules.json';

@Injectable()
export class AdaptiveService {
  constructor(private prisma: PrismaService) {}

  async getAdaptiveDifficulty(childId: string, skillName: string) {
    const skill = await this.prisma.skillTracking.findFirst({
      where: { childId, skillName },
    });

    if (!skill) {
      return { difficulty: 1, hint: false };
    }

    const rules = adaptiveRules;

    // Increase difficulty after consecutive successes
    if (skill.consecutiveSuccesses >= rules.consecutiveSuccessToIncrease) {
      const currentDifficulty = this.getDifficultyFromMastery(skill.masteryLevel);
      return {
        difficulty: Math.min(currentDifficulty + 1, 5),
        hint: false,
        message: '¡Excelente! Aumentando dificultad...',
      };
    }

    // Decrease difficulty after consecutive failures
    if (skill.consecutiveFailures >= rules.consecutiveFailureToDecrease) {
      const currentDifficulty = this.getDifficultyFromMastery(skill.masteryLevel);
      return {
        difficulty: Math.max(currentDifficulty - 1, 1),
        hint: true,
        message: 'Vamos a practicar algo más fácil...',
      };
    }

    return {
      difficulty: this.getDifficultyFromMastery(skill.masteryLevel),
      hint: false,
    };
  }

  async detectFrustration(childId: string, recentErrors: number, timeWindowMs: number) {
    const rules = adaptiveRules;

    // Check for frustration indicators
    if (recentErrors >= rules.frustrationErrorThreshold) {
      const withinTimeWindow = timeWindowMs <= rules.frustrationTimeWindowMs;

      if (withinTimeWindow) {
        return {
          frustrated: true,
          suggestion: 'mindfulness',
          message: '¡Tu mascota quiere tomar una pausa contigo!',
        };
      }
    }

    return {
      frustrated: false,
      suggestion: null,
    };
  }

  async shouldSuggestMindfulness(childId: string, sessionMinutes: number) {
    const rules = adaptiveRules;

    if (sessionMinutes >= rules.mindfulnessSuggestionMinutes) {
      return {
        suggest: true,
        message: '¡Hiciste un gran esfuerzo! ¿Qué tal una respiración?',
      };
    }

    return { suggest: false };
  }

  private getDifficultyFromMastery(masteryLevel: string): number {
    switch (masteryLevel) {
      case 'mastered': return 5;
      case 'proficient': return 4;
      case 'developing': return 2;
      case 'novice': return 1;
      default: return 1;
    }
  }
}
