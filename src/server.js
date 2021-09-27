const express = require("express");
const app = express();
const cors = require("cors");
const morgan = require("morgan");
const sqlInjectionPreventer = require("./middlewares/sql-injection-prevent");

const restaurantRoutes = require("./routes/RestaurantRoute");
const authRoutes = require("./routes/AuthRoute");
const authJwtAuthorizer = require("./middlewares/auth-jwt-validate");


class Server {
  SERVER = undefined;
  PORT = process.env.PORT || 80;

  config() {
    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    app.use(cors(this.corsConfiguration("*", 200)));
    app.use(morgan("dev"));
    app.use("/api/auth", sqlInjectionPreventer, authRoutes);
    app.use(
      "/api/restaurant",
      authJwtAuthorizer,
      sqlInjectionPreventer,
      restaurantRoutes
    );
  }


  

  corsConfiguration(origin, successStatus) {
    return {
      origin,
      optionsSuccessStatus: successStatus,
    };
  }

  connect() {
    this.SERVER = app.listen(this.PORT, () => {
      console.log(`Server running on port: ${this.PORT}`);
      this.config();
    });
  }
}

module.exports = Server;
