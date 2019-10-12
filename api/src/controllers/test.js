module.exports = {
  async testeController(req, res) {
    const response = await req.mongoClient
      .db("projf")
      .collection("testando")
      .findOne({ product_category_name: "automotivo" });
    res.send({ message: response });
  }
};
