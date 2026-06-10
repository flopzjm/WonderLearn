import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateChildDto } from './dto/create-child.dto';
import { UpdateChildDto } from './dto/update-child.dto';

@Injectable()
export class ChildrenService {
  constructor(private prisma: PrismaService) {}

  async create(userId: string, dto: CreateChildDto) {
    // Calculate initial level based on age
    let initialLevel = 1;
    if (dto.age >= 4 && dto.age <= 5) initialLevel = 3;
    if (dto.age >= 6 && dto.age <= 8) initialLevel = 6;

    return this.prisma.childProfile.create({
      data: {
        parentId: userId,
        name: dto.name,
        age: dto.age,
        avatarType: dto.avatarType || 'dragon',
        levelGlobal: initialLevel,
        dailyTimeLimit: dto.dailyTimeLimit || 30,
      },
    });
  }

  async findAll(userId: string) {
    return this.prisma.childProfile.findMany({
      where: { parentId: userId },
      orderBy: { createdAt: 'asc' },
    });
  }

  async findOne(childId: string, userId: string) {
    const child = await this.prisma.childProfile.findFirst({
      where: { id: childId, parentId: userId },
      include: {
        lessonProgress: true,
        skillTracking: true,
        badges: { include: { badge: true } },
      },
    });

    if (!child) {
      throw new NotFoundException('Child profile not found');
    }

    return child;
  }

  async update(childId: string, userId: string, dto: UpdateChildDto) {
    const child = await this.prisma.childProfile.findFirst({
      where: { id: childId, parentId: userId },
    });

    if (!child) {
      throw new NotFoundException('Child profile not found');
    }

    return this.prisma.childProfile.update({
      where: { id: childId },
      data: dto,
    });
  }

  async remove(childId: string, userId: string) {
    const child = await this.prisma.childProfile.findFirst({
      where: { id: childId, parentId: userId },
    });

    if (!child) {
      throw new NotFoundException('Child profile not found');
    }

    return this.prisma.childProfile.delete({
      where: { id: childId },
    });
  }
}
