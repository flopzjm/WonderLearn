import { Controller, Post, Get, Body, Param, UseGuards, Request } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { ProgressService } from './progress.service';
import { SubmitLessonDto } from './dto/submit-lesson.dto';

@ApiTags('Progress')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('progress')
export class ProgressController {
  constructor(private progressService: ProgressService) {}

  @Post('events')
  @ApiOperation({ summary: 'Submit lesson progress event' })
  async submitLesson(@Request() req, @Body() dto: SubmitLessonDto & { childId?: string }) {
    // Use childId from body, or find the first child of the user
    const childId = dto.childId || await this.progressService.getFirstChildId(req.user.userId);
    return this.progressService.submitLessonProgress(childId, dto);
  }

  @Get(':childId')
  @ApiOperation({ summary: 'Get complete child progress' })
  async getProgress(@Param('childId') childId: string) {
    return this.progressService.getChildProgress(childId);
  }
}
