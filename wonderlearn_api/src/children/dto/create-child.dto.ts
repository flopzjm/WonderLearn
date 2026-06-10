import { IsString, IsInt, Min, Max, IsOptional, IsIn } from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateChildDto {
  @ApiProperty({ example: 'Lucas' })
  @IsString()
  name: string;

  @ApiProperty({ example: 5 })
  @IsInt()
  @Min(2)
  @Max(8)
  age: number;

  @ApiPropertyOptional({ example: 'dragon', enum: ['dragon', 'cat', 'robot'] })
  @IsOptional()
  @IsIn(['dragon', 'cat', 'robot'])
  avatarType?: string;

  @ApiPropertyOptional({ example: 30 })
  @IsOptional()
  @IsInt()
  @Min(15)
  @Max(120)
  dailyTimeLimit?: number;
}
