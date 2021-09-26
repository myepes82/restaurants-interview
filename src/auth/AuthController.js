const joi = require("@hapi/joi");

const logger = require("../logs/logger");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const db = require('../db/db');
const pool = require("../db/db");

function Register(req) {
  return new Promise(async (resolve, reject) => {
    const body = req.body;
    const registerSchemeValidator = joi.object({
      email: joi.string().min(6).max(255).required().email(),
      password: joi.string().min(10).max(20).required(),
    });
    const { error } = registerSchemeValidator.validate(body);
    if (error) {
      console.error(error);
      return reject([400, { error: error.details[0].message }]);
    }

    const regEx = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$/;
    const regExResponse = regEx.test(body.password);
    if (!regExResponse) {
      console.error(
        "Password must contain one lowercase letter, one uppercase letter, one special character and one numeric character"
      );
      return reject([
        400,
        {
          error:
            "Password must contain one lowercase letter, one uppercase letter, one special character and one numeric character",
        },
      ]);
    }

    try {
      const {rows} = await db.query("SELECT * FROM  users where email = $1", [body.email])
      if (rows[0]) {
        console.error(
          `Error on user registration, email ${body.email} alredy exist`
        );
        return reject([400, { error: "Email already exist" }]);
      }
    } catch (error) {
      console.error(`Searching existing email error: ${error}`);
      logger.error(`Searching existing email error: ${error}`);
      return reject([500, { error }]);
    }

    const salt = await bcrypt.genSalt(12);
    const hash = await bcrypt.hash(body.password, salt);

    try {
      await pool.query("INSERT INTO users(email, password, creation_date) VALUES( $1, $2, to_timestamp($3 / 1000.0) )", [body.email, hash, Date.now()])
      return resolve({data: "The user has been saved"});
    } catch (error) {
      console.error(`Saving user error: ${error}`);
      logger.error(`Saving user error: ${error}`);
      return reject([500, { error }]);
    }
  });
}

function Login(req) {
  return new Promise(async (resolve, reject) => {
    const body = req.body;
    const loginSchemeValidator = joi.object({
      email: joi.string().min(6).max(255).required().email(),
      password: joi.string().min(10).max(20).required(),
    });
    const { error } = loginSchemeValidator.validate(body);
    if (error) {
      console.error(error);
      return reject([400, { error: error.details[0].message }]);
    }

    const regEx = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{10,20}$/;
    const regExResponse = regEx.test(body.password);
    if (!regExResponse) {
      console.error(
        "Password must contain one lowercase letter, one uppercase letter, one special character and one numeric character"
      );
      return reject([
        400,
        {
          error:
            "Password must contain one lowercase letter, one uppercase letter, one special character and one numeric character",
        },
      ]);
    }
    try {
      const {rows} = await db.query("SELECT * FROM  users where email = $1", [body.email])
      if (!rows[0]) {
        console.error(`Login error, user  ${body.email} doesn't exist`);
        return reject([404, { error: "User not found" }]);
      }
      const validPassword = await bcrypt.compare(
        body.password,
        rows[0].password
      );
      if (!validPassword) {
        console.error(`login error, credentials do not match`);
        return reject([404, { error: "User or password incorrect" }]);
      }
      const token = jwt.sign(
        {
          email: rows[0].email,
          id: rows[0].id,
        },
        process.env.SECRET,
        { expiresIn: 1200 }
      );
      return resolve({ authentication: "ok", token });
    } catch (error) {
      console.error(`Searching existing user error: ${error}`);
      logger.error(`Searching existing user error: ${error}`);
      return reject([500, { error }]);
    }
  });
}

module.exports = {
  register: Register,
  login: Login,
};
