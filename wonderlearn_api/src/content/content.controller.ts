import { Controller, Get, Param, Query, UseGuards } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth, ApiQuery } from '@nestjs/swagger';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { ContentService } from './content.service';

@ApiTags('Content')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('content')
export class ContentController {
  constructor(private contentService: ContentService) {}

  @Get('lessons')
  @ApiOperation({ summary: 'Get all available lessons' })
  @ApiQuery({ name: 'module', required: false, enum: ['wonderbooks', 'wondermath', 'wondergrow'] })
  @ApiQuery({ name: 'difficulty', required: false, type: Number })
  async findAll(
    @Query('module') moduleId?: string,
    @Query('difficulty') difficulty?: string,
  ) {
    return this.contentService.findAllLessons(moduleId, difficulty ? parseInt(difficulty) : undefined);
  }

  @Get('lessons/:id')
  @ApiOperation({ summary: 'Get lesson details with assets' })
  async findOne(@Param('id') id: string) {
    return this.contentService.findOneLesson(id);
  }

  @Get('phonics')
  @ApiOperation({ summary: 'Get phonics lessons (A-Z)' })
  async findPhonics() {
    return this.contentService.findPhonicsLessons();
  }

  @Get('sight-words')
  @ApiOperation({ summary: 'Get sight words lessons' })
  async findSightWords() {
    return this.contentService.findSightWords();
  }

  @Get('stories')
  @ApiOperation({ summary: 'Get interactive stories' })
  @ApiQuery({ name: 'category', required: false })
  async findStories(@Query('category') category?: string) {
    return this.contentService.findStories(category);
  }

  @Get('math')
  @ApiOperation({ summary: 'Get math lessons' })
  @ApiQuery({ name: 'type', required: false, enum: ['counting', 'addition', 'shape', 'pattern'] })
  async findMath(@Query('type') type?: string) {
    return this.contentService.findMathLessons(type);
  }

  @Get('sel')
  @ApiOperation({ summary: 'Get social-emotional learning lessons' })
  async findSEL() {
    return this.contentService.findSELLessons();
  }
}
