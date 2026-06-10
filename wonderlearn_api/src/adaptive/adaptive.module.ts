import { Module } from '@nestjs/common';
import { AdaptiveService } from './adaptive.service';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  providers: [AdaptiveService, PrismaService],
  exports: [AdaptiveService],
})
export class AdaptiveModule {}
