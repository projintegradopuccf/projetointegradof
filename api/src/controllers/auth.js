module.exports = {
  async signin(req, res) {
    const { email, password } = req.body;

    const user = await req.mongoClient
      .db("projf")
      .collection("user")
      .findOne({ email, password });

    if (!user) {
      res.status(404).json({ message: "Incorret user or password" });
    } else {
      res.status(200).json(user);
    }
  },

  async signup(req, res) {
    const { email, password } = req.body;

    try {
      const newUser = await req.mongoClient
        .db("projf")
        .collection("user")
        .insertOne({ email, password });

      return res.status(200).json(newUser);
    } catch (err) {
      return next(err);
    }
  }
};
