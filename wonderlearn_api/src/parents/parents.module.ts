import { Module } from '@nestjs/common';
import { ParentsController } from './parents.controller';
import { ParentsService } from './parents.service';
import { PrismaService } from '../prisma/prisma.service';
import { MailModule } from '../mail/mail.module';

@Module({
  imports: [MailModule],
  controllers: [ParentsController],
  providers: [ParentsService, PrismaService],
  exports: [ParentsService],
})
export class ParentsModule {}
