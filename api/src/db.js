const MongoClient = require("mongodb").MongoClient;

const uri =
  "mongodb+srv://user:user@cluster0-nuhwc.mongodb.net/test?retryWrites=true&w=majority";
const db = new MongoClient(uri, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});
// notice 'client' in the callback

module.exports = db;
