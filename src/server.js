const express = require('express');

const app = express();
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  res.json({
    message: 'Hello from DevOps Intern Task!',
    status: 'running'
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
