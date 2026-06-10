import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class ContentService {
  constructor(private prisma: PrismaService) {}

  async findAllLessons(moduleId?: string, difficulty?: number) {
    const where: any = {};
    if (moduleId) where.moduleId = moduleId;
    if (difficulty) where.difficulty = difficulty;

    return this.prisma.lesson.findMany({
      where,
      orderBy: { orderIndex: 'asc' },
      select: {
        id: true,
        moduleId: true,
        lessonType: true,
        title: true,
        description: true,
        difficulty: true,
        durationMin: true,
        orderIndex: true,
      },
    });
  }

  async findOneLesson(lessonId: string) {
    const lesson = await this.prisma.lesson.findUnique({
      where: { id: lessonId },
    });

    if (!lesson) {
      throw new NotFoundException('Lesson not found');
    }

    return lesson;
  }

  async findPhonicsLessons() {
    return this.prisma.lesson.findMany({
      where: {
        moduleId: 'wonderbooks',
        lessonType: 'phonics',
      },
      orderBy: { orderIndex: 'asc' },
    });
  }

  async findSightWords() {
    return this.prisma.lesson.findMany({
      where: {
        moduleId: 'wonderbooks',
        lessonType: 'sight_word',
      },
      orderBy: { orderIndex: 'asc' },
    });
  }

  async findStories(category?: string) {
    const where: any = {
      moduleId: 'wonderbooks',
      lessonType: 'story',
    };

    // Category filtering would be done via contentJson
    return this.prisma.lesson.findMany({
      where,
      orderBy: { difficulty: 'asc' },
    });
  }

  async findMathLessons(type?: string) {
    const where: any = {
      moduleId: 'wondermath',
    };

    if (type) where.lessonType = type;

    return this.prisma.lesson.findMany({
      where,
      orderBy: { orderIndex: 'asc' },
    });
  }

  async findSELLessons() {
    return this.prisma.lesson.findMany({
      where: {
        moduleId: 'wondergrow',
      },
      orderBy: { orderIndex: 'asc' },
    });
  }
}
