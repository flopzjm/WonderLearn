import { Controller, Post, Get, Body, Param, UseGuards, Request } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { SyncService } from './sync.service';

@ApiTags('Sync')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('sync')
export class SyncController {
  constructor(private syncService: SyncService) {}

  @Post(':childId')
  @ApiOperation({ summary: 'Sync offline events batch' })
  async sync(
    @Request() req,
    @Param('childId') childId: string,
    @Body('events') events: any[],
  ) {
    return this.syncService.syncOfflineEvents(childId, events);
  }

  @Get(':childId/pending')
  @ApiOperation({ summary: 'Get pending offline events' })
  async getPending(@Param('childId') childId: string) {
    return this.syncService.getPendingEvents(childId);
  }
}
