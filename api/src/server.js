const db = require("./db");
const express = require("express");
const cors = require("cors");
const MongoClient = require("mongodb").MongoClient;
const authController = require("./controllers/auth");
const productsController = require("./controllers/products");
const customersController = require("./controllers/customers");
const geolocationController = require("./controllers/geolocation");
const orderItensController = require("./controllers/order-itens");
const ordersController = require("./controllers/orders");
const paymentsController = require("./controllers/payment");
const reviewsController = require("./controllers/reviews");
const sellersController = require("./controllers/sellers");

// Inicializa express (framework para gerenciar requisicoes http da aplicaçao)
const app = express();
app.use(express.json());
app.use(cors());

// Inicia a instancia do mongo
db.connect((err, client) => {
  if (err) console.log("Failed to connect", err);
  else {
    // Middleware para adicionar o objeto client do mongo nas requisicoes
    app.use((req, res, next) => {
      req.mongoClient = client;
      return next();
    });

    // Cria rota POST no path "/signup" e inicializa controller de signup
    app.post("/signup", authController.signup);
    app.post("/signin", authController.signin);

    app.get("/customers", customersController.findAll);
    app.get("/geolocation", geolocationController.findAll);
    app.get("/order-itens", orderItensController.findAll);
    app.get("/orders", ordersController.findAll);
    app.get("/payments", paymentsController.findAll);
    app.get("/reviews", reviewsController.findAll);
    app.get("/products", productsController.findAll);
    app.get("/sellers", sellersController.findAll);

    console.log("Database connected!");
  }
});

module.exports = app;
