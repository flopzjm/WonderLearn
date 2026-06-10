import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication, ValidationPipe } from '@nestjs/common';
import * as request from 'supertest';
import { AppModule } from '../src/app.module';

describe('Progress (e2e)', () => {
  let app: INestApplication;
  let accessToken: string;
  let childId: string;

  beforeAll(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    app.useGlobalPipes(new ValidationPipe({ whitelist: true }));
    await app.init();

    // Login with demo account to get access token
    const loginResponse = await request(app.getHttpServer())
      .post('/auth/login')
      .send({
        email: 'demo@wonderlearn.app',
        password: 'password123',
      });
    accessToken = loginResponse.body.accessToken;

    // Get existing children or create one
    const childrenResponse = await request(app.getHttpServer())
      .get('/children')
      .set('Authorization', `Bearer ${accessToken}`);

    if (childrenResponse.body.length > 0) {
      childId = childrenResponse.body[0].id;
    } else {
      // Create a child for testing
      const childResponse = await request(app.getHttpServer())
        .post('/children')
        .set('Authorization', `Bearer ${accessToken}`)
        .send({
          name: 'Progress Test Child',
          age: 5,
          avatarType: 'dragon',
        });
      childId = childResponse.body.id;
    }
  });

  afterAll(async () => {
    await app.close();
  });

  describe('/progress/events (POST)', () => {
    it('should submit lesson progress event', () => {
      return request(app.getHttpServer())
        .post('/progress/events')
        .set('Authorization', `Bearer ${accessToken}`)
        .send({
          lessonId: 'phonics-a',
          status: 'completed',
          score: 3,
          correctAnswers: 10,
          totalQuestions: 10,
          timeSpentSeconds: 120,
        })
        .expect(201)
        .expect((res) => {
          expect(res.body).toHaveProperty('id');
          expect(res.body.status).toBe('completed');
          expect(res.body.score).toBe(3);
        });
    });

    it('should submit started lesson progress', () => {
      return request(app.getHttpServer())
        .post('/progress/events')
        .set('Authorization', `Bearer ${accessToken}`)
        .send({
          lessonId: 'math-counting-1',
          status: 'started',
          score: 0,
          correctAnswers: 0,
          totalQuestions: 5,
          timeSpentSeconds: 30,
        })
        .expect(201);
    });

    it('should submit abandoned lesson progress', () => {
      return request(app.getHttpServer())
        .post('/progress/events')
        .set('Authorization', `Bearer ${accessToken}`)
        .send({
          lessonId: 'sel-happy',
          status: 'abandoned',
          score: 1,
          correctAnswers: 3,
          totalQuestions: 10,
          timeSpentSeconds: 60,
        })
        .expect(201);
    });

    it('should return 401 without auth token', () => {
      return request(app.getHttpServer())
        .post('/progress/events')
        .send({
          lessonId: 'test',
          status: 'completed',
          score: 1,
          correctAnswers: 5,
          totalQuestions: 5,
          timeSpentSeconds: 60,
        })
        .expect(401);
    });
  });

  describe('/progress/:childId (GET)', () => {
    it('should return child progress', () => {
      return request(app.getHttpServer())
        .get(`/progress/${childId}`)
        .set('Authorization', `Bearer ${accessToken}`)
        .expect(200)
        .expect((res) => {
          expect(res.body).toHaveProperty('lessons');
          expect(res.body).toHaveProperty('skills');
          expect(res.body).toHaveProperty('badges');
          expect(res.body).toHaveProperty('stats');
          expect(Array.isArray(res.body.lessons)).toBe(true);
          expect(Array.isArray(res.body.skills)).toBe(true);
        });
    });

    it('should return progress with stats', () => {
      return request(app.getHttpServer())
        .get(`/progress/${childId}`)
        .set('Authorization', `Bearer ${accessToken}`)
        .expect(200)
        .expect((res) => {
          expect(res.body.stats).toHaveProperty('totalLessonsCompleted');
          expect(res.body.stats).toHaveProperty('totalStars');
          expect(res.body.stats).toHaveProperty('totalMinutes');
        });
    });
  });
});
