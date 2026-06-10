import { IsString, IsInt, IsEnum, IsOptional, IsArray, ValidateNested, Min, Max } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';

export class SkillUpdateDto {
  @ApiProperty()
  @IsString()
  skillName: string;

  @ApiProperty()
  @IsString()
  success: boolean;
}

export class SubmitLessonDto {
  @ApiProperty()
  @IsString()
  lessonId: string;

  @ApiProperty({ enum: ['started', 'completed', 'abandoned'] })
  @IsEnum(['started', 'completed', 'abandoned'])
  status: string;

  @ApiProperty({ minimum: 0, maximum: 3 })
  @IsInt()
  @Min(0)
  @Max(3)
  score: number;

  @ApiProperty()
  @IsInt()
  correctAnswers: number;

  @ApiProperty()
  @IsInt()
  totalQuestions: number;

  @ApiProperty()
  @IsInt()
  timeSpentSeconds: number;

  @ApiPropertyOptional()
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => SkillUpdateDto)
  skillUpdates?: SkillUpdateDto[];
}
