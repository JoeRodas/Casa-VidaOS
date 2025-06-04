# LifeOS Backend Microservice

This Node.js service provides user management endpoints for Casa-VidaOS.
It demonstrates a scalable pattern using PostgreSQL for persistent storage
and Redis as a caching layer. Deploy multiple instances behind a load
balancer for horizontal scaling.

## Setup
1. Install dependencies with `npm install`.
2. Set environment variables `DATABASE_URL` and `REDIS_URL`.
3. Start the service using `node server.js`.
