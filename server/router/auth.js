const express = require("express");

const authRouter = express.Router();

authRouter.get("/api/signup", (req, res) => {
  res.json({ msg: "mukesh" });
});

module.exports = authRouter;
