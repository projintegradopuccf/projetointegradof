module.exports = {
  async findAll(db, collection, query = {}, options = { limit: 100, skip: 0 }) {
    const { skip, limit } = options;

    return db
      .db("projf")
      .collection(collection)
      .find(query)
      .limit(!limit ? 100 : Number(limit))
      .skip(!skip ? 0 : Number(skip))
      .toArray(function(err, result) {
        //  throw err;
        // console.log("res func", result);
        if (!err) return result;
      });
  }
};
