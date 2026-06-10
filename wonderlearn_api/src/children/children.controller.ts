import { Controller, Get, Post, Patch, Delete, Body, Param, UseGuards, Request } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { ChildrenService } from './children.service';
import { CreateChildDto } from './dto/create-child.dto';
import { UpdateChildDto } from './dto/update-child.dto';

@ApiTags('Children')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('children')
export class ChildrenController {
  constructor(private childrenService: ChildrenService) {}

  @Post()
  @ApiOperation({ summary: 'Create a child profile' })
  async create(@Request() req, @Body() dto: CreateChildDto) {
    return this.childrenService.create(req.user.userId, dto);
  }

  @Get()
  @ApiOperation({ summary: 'Get all child profiles' })
  async findAll(@Request() req) {
    return this.childrenService.findAll(req.user.userId);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get child profile with progress' })
  async findOne(@Param('id') id: string, @Request() req) {
    return this.childrenService.findOne(id, req.user.userId);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Update child profile' })
  async update(@Param('id') id: string, @Request() req, @Body() dto: UpdateChildDto) {
    return this.childrenService.update(id, req.user.userId, dto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Delete child profile' })
  async remove(@Param('id') id: string, @Request() req) {
    return this.childrenService.remove(id, req.user.userId);
  }
}
