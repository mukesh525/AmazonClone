const express = require("express");
const app = express();
const mongoose = require("mongoose");

const authRouter = require("./router/auth");
const PORT = 3000;
app.use(authRouter);
mongoose
  .connect("mongodb://localhost:27017/amazon")
  .then(() => {
    console.log("Coonected");
  })
  .catch((e) => {
    console.log(e);
  });
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});
