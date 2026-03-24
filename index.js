import express from 'express';

const app = express();
const PORT = process.env.PORT || 3000;


app.get('/', (req, res) => {
  res.json({
      message: 'Hello, World!' ,
      service: 'hello-node',
      pod: process.env.POD_NAME || 'unknown',
      time: new Date().toISOString(),
    });
});

app.get('/ready', (req, res) => {
  res.status(200).json({
      status: 'ready',
  });
});

app.get('/health', (req, res) => {
  res.json({
      status: 'ok',
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});