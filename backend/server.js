const express = require('express');
const { Pool } = require('pg');
const redis = require('redis');

// PostgreSQL connection pool (replace with env vars in production)
const pool = new Pool({
  connectionString: process.env.DATABASE_URL || 'postgres://user:pass@localhost:5432/lifeos'
});

// Redis client for caching
const redisClient = redis.createClient({
  url: process.env.REDIS_URL || 'redis://localhost:6379'
});
redisClient.connect().catch(console.error);

const app = express();
app.use(express.json());

// Simple user endpoint
app.post('/api/signup', async (req, res) => {
  const { email, password } = req.body;
  try {
    const result = await pool.query('INSERT INTO users(email, password) VALUES($1,$2) RETURNING id', [email, password]);
    res.status(201).json({ id: result.rows[0].id });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

app.get('/api/user/:id', async (req, res) => {
  const { id } = req.params;
  const cacheKey = `user:${id}`;
  try {
    const cached = await redisClient.get(cacheKey);
    if (cached) {
      return res.json(JSON.parse(cached));
    }
    const result = await pool.query('SELECT id, email FROM users WHERE id=$1', [id]);
    if (result.rows.length === 0) return res.status(404).json({ error: 'Not found' });
    const user = result.rows[0];
    await redisClient.set(cacheKey, JSON.stringify(user), { EX: 60 }); // cache for 60s
    res.json(user);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

// Journal entry endpoint
app.post('/api/journal', async (req, res) => {
  const { userId, text, type } = req.body; // type = 'morning' or 'evening'
  try {
    await pool.query('INSERT INTO journal(user_id, type, text) VALUES($1,$2,$3)', [userId, type, text]);
    res.status(201).json({ status: 'ok' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});


const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server running on ${port}`));
