const base = require("./base");
module.exports = {
  async findAll(req, res) {
    const { skip, limit } = req.query;

    const response = await base.findAll(
      req.mongoClient,
      "olist_products_dataset",
      {},
      { limit: 100, skip: 0 }
    );
    const cursor = await req.mongoClient
      .db("projf")
      .collection("olist_products_dataset")
      .find({})
      .limit(!limit ? 100 : Number(limit))
      .skip(!skip ? 0 : Number(skip))
      .toArray(function(err, result) {
        if (err) throw err;
        res.json(result);
      });
    // console.log(response);
    // res.json(response);
  }
};
