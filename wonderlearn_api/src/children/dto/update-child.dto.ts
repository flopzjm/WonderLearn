import { IsString, IsInt, Min, Max, IsOptional, IsIn } from 'class-validator';
import { ApiPropertyOptional } from '@nestjs/swagger';

export class UpdateChildDto {
  @ApiPropertyOptional({ example: 'Lucas' })
  @IsOptional()
  @IsString()
  name?: string;

  @ApiPropertyOptional({ example: 5 })
  @IsOptional()
  @IsInt()
  @Min(2)
  @Max(8)
  age?: number;

  @ApiPropertyOptional({ example: 'cat', enum: ['dragon', 'cat', 'robot'] })
  @IsOptional()
  @IsIn(['dragon', 'cat', 'robot'])
  avatarType?: string;

  @ApiPropertyOptional({ example: '{"color":"blue","accessories":["hat"]}' })
  @IsOptional()
  @IsString()
  avatarCustomization?: string;

  @ApiPropertyOptional({ example: 45 })
  @IsOptional()
  @IsInt()
  @Min(15)
  @Max(120)
  dailyTimeLimit?: number;
}
