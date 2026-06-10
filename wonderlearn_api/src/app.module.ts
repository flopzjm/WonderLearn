import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { ChildrenModule } from './children/children.module';
import { ContentModule } from './content/content.module';
import { ProgressModule } from './progress/progress.module';
import { ParentsModule } from './parents/parents.module';
import { AdaptiveModule } from './adaptive/adaptive.module';
import { SyncModule } from './sync/sync.module';
import { MailModule } from './mail/mail.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    AuthModule,
    UsersModule,
    ChildrenModule,
    ContentModule,
    ProgressModule,
    ParentsModule,
    AdaptiveModule,
    SyncModule,
    MailModule,
  ],
})
export class AppModule {}
