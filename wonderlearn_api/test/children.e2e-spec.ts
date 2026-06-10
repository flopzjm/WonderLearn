import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication, ValidationPipe } from '@nestjs/common';
import * as request from 'supertest';
import { AppModule } from '../src/app.module';

describe('Children (e2e)', () => {
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
  });

  afterAll(async () => {
    await app.close();
  });

  describe('/children (POST)', () => {
    it('should create a child profile', () => {
      return request(app.getHttpServer())
        .post('/children')
        .set('Authorization', `Bearer ${accessToken}`)
        .send({
          name: 'TestChild',
          age: 5,
          avatarType: 'dragon',
        })
        .expect(201)
        .expect((res) => {
          expect(res.body).toHaveProperty('id');
          expect(res.body.name).toBe('TestChild');
          expect(res.body.avatarType).toBe('dragon');
          childId = res.body.id;
        });
    });

    it('should return 401 without auth token', () => {
      return request(app.getHttpServer())
        .post('/children')
        .send({
          name: 'Test',
          age: 4,
          avatarType: 'cat',
        })
        .expect(401);
    });

    it('should return 400 for missing required fields', () => {
      return request(app.getHttpServer())
        .post('/children')
        .set('Authorization', `Bearer ${accessToken}`)
        .send({
          name: 'Test',
        })
        .expect(400);
    });
  });

  describe('/children (GET)', () => {
    it('should return all children for user', () => {
      return request(app.getHttpServer())
        .get('/children')
        .set('Authorization', `Bearer ${accessToken}`)
        .expect(200)
        .expect((res) => {
          expect(Array.isArray(res.body)).toBe(true);
        });
    });
  });

  describe('/children/:id (GET)', () => {
    it('should return child by id', () => {
      if (!childId) return;
      return request(app.getHttpServer())
        .get(`/children/${childId}`)
        .set('Authorization', `Bearer ${accessToken}`)
        .expect(200)
        .expect((res) => {
          expect(res.body.id).toBe(childId);
          expect(res.body.name).toBe('TestChild');
        });
    });

    it('should return 404 for non-existent child', () => {
      return request(app.getHttpServer())
        .get('/children/non-existent-id')
        .set('Authorization', `Bearer ${accessToken}`)
        .expect(404);
    });
  });

  describe('/children/:id (PATCH)', () => {
    it('should update child profile', () => {
      if (!childId) return;
      return request(app.getHttpServer())
        .patch(`/children/${childId}`)
        .set('Authorization', `Bearer ${accessToken}`)
        .send({
          name: 'TestChild Updated',
          avatarType: 'robot',
        })
        .expect(200)
        .expect((res) => {
          expect(res.body.name).toBe('TestChild Updated');
          expect(res.body.avatarType).toBe('robot');
        });
    });
  });

  describe('/children/:id (DELETE)', () => {
    it('should delete child profile', () => {
      if (!childId) return;
      return request(app.getHttpServer())
        .delete(`/children/${childId}`)
        .set('Authorization', `Bearer ${accessToken}`)
        .expect(200);
    });

    it('should return 404 after deletion', () => {
      if (!childId) return;
      return request(app.getHttpServer())
        .get(`/children/${childId}`)
        .set('Authorization', `Bearer ${accessToken}`)
        .expect(404);
    });
  });
});
