import { Controller, Get, Patch, Post, Param, Body, UseGuards, Request } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { ParentsService } from './parents.service';

@ApiTags('Parents')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('parents')
export class ParentsController {
  constructor(private parentsService: ParentsService) {}

  @Get('dashboard/:childId')
  @ApiOperation({ summary: 'Get parent dashboard for child' })
  async getDashboard(@Request() req, @Param('childId') childId: string) {
    return this.parentsService.getDashboard(req.userId, childId);
  }

  @Patch('settings/:childId/time-limit')
  @ApiOperation({ summary: 'Update child time limit' })
  async updateTimeLimit(
    @Request() req,
    @Param('childId') childId: string,
    @Body('timeLimit') timeLimit: number,
  ) {
    return this.parentsService.updateTimeLimit(req.userId, childId, timeLimit);
  }

  @Post('reports/:childId/weekly')
  @ApiOperation({ summary: 'Send weekly report email' })
  async sendWeeklyReport(@Request() req, @Param('childId') childId: string) {
    return this.parentsService.sendWeeklyReport(req.userId, childId);
  }
}
