const app = require("./server");

const port = 3333;

app.listen(3333, () => {
  console.log(`Server listen on ${port}`);
});
