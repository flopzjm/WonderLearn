import { Module } from '@nestjs/common';
import { ChildrenController } from './children.controller';
import { ChildrenService } from './children.service';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [ChildrenController],
  providers: [ChildrenService, PrismaService],
  exports: [ChildrenService],
})
export class ChildrenModule {}
