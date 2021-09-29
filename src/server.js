const express = require('express');
const app = express();
const cors = require('cors');
const morgan = require('morgan');
const sqlInjectionPreventer = require('./middlewares/sql-injection-prevent');
const restaurantRoutes = require('./routes/RestaurantRoute');
const authRoutes = require('./routes/AuthRoute');
const authJwtAuthorizer = require('./middlewares/auth-jwt-validate');
const axios = require('axios');

class Server {
  SERVER = undefined;
  PORT = process.env.PORT || 8080;

  config() {
      app.use(express.json());
      app.use(express.urlencoded({ extended: true }));
      app.use(cors(this.corsConfiguration('*', 200)));
      app.use(morgan('dev'));
      app.use('/api/auth', sqlInjectionPreventer, authRoutes);
      app.use(
          '/api/restaurant',
          authJwtAuthorizer,
          sqlInjectionPreventer,
          restaurantRoutes
      );

      app.get('/', async(req, res)=> {
          try {
              const response = await axios.get('http://www.randomnumberapi.com/api/v1.0/randomnumber');
              if (response) {
                  const number = response.data[0];
                  res.status(200).send({number});
              }
          } catch (error) {
              res.status(500).send('Internal server error');
          }
      });
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
