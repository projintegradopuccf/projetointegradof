const db = require("./db");
const express = require("express");
const MongoClient = require("mongodb").MongoClient;
const testeController = require("./controllers/test");
const authController = require("./controllers/auth");

// Inicializa express (framework para gerenciar requisicoes http da aplicaçao)
const app = express();
app.use(express.json());

// Inicia a instancia do mongo
db.connect((err, client) => {
  if (err) console.log("Failed to connect", err);
  else {
    // Middleware para adicionar o objeto client do mongo nas requisicoes
    app.use((req, res, next) => {
      req.mongoClient = client;
      return next();
    });

    // Cria rota GET no path "/" e inicializa controller de teste
    app.get("/", testeController.testeController);

    app.post("/signup", authController.signup);
    app.post("/signin", authController.signin);

    console.log("Database connected!");
  }
});

module.exports = app;
