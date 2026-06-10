import { Injectable, CanActivate, ExecutionContext, UnauthorizedException } from '@nestjs/common';

@Injectable()
export class ParentalPinGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest();
    const pin = request.headers['x-parental-pin'];

    // In production, verify against stored hash
    // For MVP, accept "1234" as default
    if (pin === '1234') {
      return true;
    }

    throw new UnauthorizedException('Invalid parental PIN');
  }
}
