const routes = require("express").Router();
const controller = require("../auth/AuthController");

routes.post("/register", (req, res) => {
  controller
    .register(req)
    .then((response) => {
      res.status(200).send(response);
    })
    .catch((error) => {
      res.status(error[0]).send(error[1]);
    });
});

routes.post("/login", (req, res) => {
  controller
    .login(req)
    .then((response) => {
      res.status(200).send(response);
    })
    .catch((error) => {
      res.status(error[0]).send(error[1]);
    });
});

module.exports = routes;
