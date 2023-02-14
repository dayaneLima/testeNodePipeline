import app from "../../src/app";
import request from "supertest";

describe('IntegrationTest', () => {
  it('should create a new post', async () => {
    const res = await request(app)
      .post('/login')
      .send({
        userId: 1,
        title: 'test is cool',
      })
    expect(res.statusCode).toEqual(200);
    // expect(res.body).toHaveProperty('post')
  });
});
