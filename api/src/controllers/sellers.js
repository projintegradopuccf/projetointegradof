module.exports = {
  async findAll(req, res) {
    const { skip, limit } = req.query;

    const cursor = await req.mongoClient
      .db("projf")
      .collection("olist_sellers_dataset")
      .find({})
      .limit(!limit ? 100 : Number(limit))
      .skip(!skip ? 0 : Number(skip))
      .toArray(function(err, result) {
        if (err) throw err;
        res.json(result);
      });
  }
};
