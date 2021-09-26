const routes = require('express').Router()
const controller = require('../controllers/RestaurantController')

routes.post('/save', (req, res) => {
    controller.save(req)
    .then((response) => {
        res.status(200).send(response)
    })
    .catch((error)=> {
        res.status(error[0]).send(error[1])
    })
})

routes.get('/get-all-by-user', (req, res) => {
    controller.getAllByUser(req)
    .then((response) => {
        res.status(200).send(response)
    })
    .catch((error)=> {
        res.status(error[0]).send(error[1])
    })
})

routes.get('/like-restaurant', (req, res) => {
    controller.likeRestaurant(req)
    .then((response) => {
        res.status(200).send(response)
    })
    .catch((error)=> {
        res.status(error[0]).send(error[1])
    })
})


routes.get('/my-liked-restaurants', (req, res)=> {
    controller.getMyLikedRestaurants(req)
    .then((response) => {
        res.status(200).send(response)
    })
    .catch((error)=> {
        res.status(error[0]).send(error[1])
    })
})

module.exports = routes;