const db = require("./db");
const express = require("express");
const MongoClient = require("mongodb").MongoClient;
const testeController = require("./controllers/test");

// Inicializa express (framework para gerenciar requisicoes http da aplicaçao)
const app = express();

// Inicia a instancia do mongo
db.connect((err, client) => {
  if (err) console.log("failed to connect");
  else {
    // Middleware para adicionar o objeto client do mongo nas requisicoes
    app.use((req, res, next) => {
      req.mongoClient = client;
      return next();
    });

    // Cria rota GET no path "/" e inicializa controller de teste
    app.get("/", testeController.testeController);
    console.log("Database connected!");
  }
});

module.exports = app;
