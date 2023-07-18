const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
  res.send(`Running in ${process.env.ENVIRONMENT} environment. Commit SHA: ${process.env.COMMIT_SHA}`);
});

app.get('/healthz', (req, res) => {
  res.send('I am alive!');
});

app.get('/ready', (req, res) => {
  res.send('I am ready!');
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${port}`);
});
