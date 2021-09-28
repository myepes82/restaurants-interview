# Restaurants Server

Restaurants application server, this is in the capacity to receive various requests and to process data in the database that it has integrated

This project has been built with:
    - NodeJs
    - Postgres Sql
    - Docker

# Server Host

Deployed server: http://3.142.84.73:8080
Local Server: http://localhost:4000
Docker Server: http://localhost:8080

# How to run

If you want to run this project locally, you must download the following:
    - NodeJs : https://nodejs.org/es/
    - Postgres Sql: https://www.postgresql.org/download/
When you download it, you must do the following:
    - Modify de postgres user, setting a new password, this new password must be '1234'
    - Create database called 'restaurants'
    - Open a terminal intro project and run 'npm i'
    - after run 'npm i', run 'npm start'
    - now the project is running


if you don't want to download all this and worry about configuring the database, you must download the following:
    - Docker:
        -windows: https://www.docker.com/products/docker-desktop
        -linux: sudo apt-get install docker.io
    If you're on linux install the following:
        - Docker Compose: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-es

When you download it, you must do the following
    - Open terminal into the project
    - run 'docker-compose up --build'
    - wait  one moment 


If you do not want to download or configure anything, you can use the application that is deployed in the aws cloud, for this you can simply make requests to the following host:
    - Host: http://3.142.84.73:8080
    

# Data Model
____________________________________________________
|             restaurants                          |
|--------------------------------------------------|
| id            | serial  - pk           -not null |
| name          | character varying(100) -not null |
| address       | character varying(255) -not null |
| public        | boolean                -not null |
| update_date   | date                             |
| creation_date | date                   -not null |
| user_id       | bigint  - FK           -not null |
| total_likes   | Integer                          |
|_______________|__________________________________|

___________________________________________________________
|             users                                       |
|---------------------------------------------------------|
| id            | serial  - pk                 - not null |
| email         | character varying(100)       - not null |
| password      | character varying(255)       - not null |
| creation_date | timestamp without time zone  - not null |
|_______________|_________________________________________|

___________________________________________________________
|             linked_restaurants                          |
|---------------------------------------------------------|
| id            | serial  - pk                 - not null |
| user_id       | bigint  - fk                 - not null |
| restaurant_id | bitint  - fk                 - not null |
| creation_date | date                         - not null |
|_______________|_________________________________________|


# API'S

If you want to call an api within the server you must do it as follows:
    - http://<host>:port/<api-endpoint>
Example:
    -Localhost: http://localhost:4000/api/auth/register
    -Docker host: http://localhost:8080/api/auth/register
    -AWS host: http://3.142.84.73:8080/api/auth/register

With this clear, here is the APIS list

# API'S List

User Register: 
    - EndPoint: /api/auth/register
    - Description: this endpoint allows you to register within the system
    - Headers: no mandatory header
    - Body:
        - Type: JSON
        - Description: data for user registration
        - Attributes:
            - email:
                - Type: string
                - Constrains: Must be a valid email and required, min length 2, max length 100
            - password:
                - Type: string
                - Constrains: min length 10, max length 20 one lowwercase  letter, one uppercase letter, one special character and one numeric character
    - Responses:
        - Avaliable Status code:
            - 200
            - 400
            - 500
        - Successful Response:
            - Type: JSON
            - Description: response if authentication was successful
            - Attributes:
                - data:
                    - Type: string
                    - Description: description about the user registration
        - Error Response:
            - Type: JSON
            - Description: an error response from server
            - Attributes:
                - error:
                    - Type: any
                    - Description: here the error is descripted


User Login: 
    - EndPoint: /api/auth/login
    - Description: this endpoint allows an user login within the system
    - Headers: no mandatory header
    - Body:
        - Type: JSON
        - Description: data for user login
        - Attributes:
            - email:
                - Type: string
                - Constrains: Must be a valid email and required, min length 2, max length 100
            - password:
                - Type: string
                - Constrains: min length 10, max length 20 one lowwercase  letter, one uppercase letter, one special character and one numeric character
    - Responses:
        - Avaliable Status code:
            - 200
            - 400
            - 404
            - 500
        - Successful Response:
            - Type: JSON
            - Description: response if authentication was successful
            - Attributes:
                - authentication:
                    - Type: string
                    - Description: authentication status
                - token:
                    - Type: string
                    - Description: authentication token for user another services into the server
        - Error Response:
            - Type: JSON
            - Description: an error response from server
            - Attributes:
                - error:
                    - Type: any
                    - Description: here the error is descripted


Restaurant Creation: 
    - EndPoint: /api/restaurant/save
    - Description: this endpoint allows that an user logger create a restaurant
    - Headers:
        - Authorization:
            - Type: string
            - Description: token for allowing services access
            - Example: Bearer <token> 
    - Body:
        - Type: JSON
        - Description: data for restaurant creation
        - Attributes:
            - name:
                - Type: string
                - Constrains: min length 2, max length 100, required
            - address:
                - Type: string
                - Constrains: min length 10, max length 255, required
    - Responses:
        - Avaliable Status code:
            - 200
            - 400
            - 404
            - 500
        - Successful Response:
            - Type: JSON
            - Description: response if authentication was successful
            - Attributes:
                - data:
                    - Type: string
                    - Description: description about restaurant creation
        - Error Response:
            - Type: JSON
            - Description: an error response from server
            - Attributes:
                - error:
                    - Type: any
                    - Description: here the error is descripted


Restaurant get all by user logged: 
    - EndPoint: /api/restaurant/get-all-by-user?page=#&size=#
    - Description: this endpoint allows get all paginated restaurants created by the logged user, 
                   this enpoint recive thow query params, page and size
    - Headers:
        - Authorization:
            - Type: string
            - Description: token for allowing services access
            - Example: Bearer <token>
    - Query Params:
        - page:
            - Type: number
            - Description: the page for the pagination
        - size:
            - Type: number
            - Description: the size of the pages in the paginated object
    - Body: none
    - Responses:
        - Avaliable Status code:
            - 200
            - 404
            - 500
        - Successful Response:
            - Type: JSON
            - Description: response if authentication was successful
            - Attributes:
                - totalElements:
                    - Type: string
                    - Description: total items that match the query
                - totalPages:
                    - Type: number
                    - Description: total pages within the database
                - size:
                    - Type: string
                    - Description: size of the page
                - page:
                    - Type: number
                    - Description: current page
                - elements:
                    - Type: number
                    - Description: total items on current page
                - data:
                    - Type: array
                    - Description: data list on the current page
        - Error Response:
            - Type: JSON
            - Description: an error response from server
            - Attributes:
                - error:
                    - Type: any
                    - Description: here the error is descripted



Restaurant get all restaurants liked by user logged: 
    - EndPoint: /api/restaurant/my-liked-restaurants?page=#&size=#
    - Description: this endpoint allows get all paginated restaurants liked by logger user
    - Headers:
        - Authorization:
            - Type: string
            - Description: token for allowing services access
            - Example: Bearer <token>
    - Query Params:
        - page:
            - Type: number
            - Description: the page for the pagination
        - size:
            - Type: number
            - Description: the size of the pages in the paginated object
    - Body: none
    - Responses:
        - Avaliable Status code:
            - 200
            - 404
            - 500
        - Successful Response:
            - Type: JSON
            - Description: response if authentication was successful
            - Attributes:
                - totalElements:
                    - Type: string
                    - Description: total items that match the query
                - totalPages:
                    - Type: number
                    - Description: total pages within the database
                - size:
                    - Type: string
                    - Description: size of the page
                - page:
                    - Type: number
                    - Description: current page
                - elements:
                    - Type: number
                    - Description: total items on current page
                - data:
                    - Type: array
                    - Description: data list on the current page
        - Error Response:
            - Type: JSON
            - Description: an error response from server
            - Attributes:
                - error:
                    - Type: any
                    - Description: here the error is descripted

Get all public restaurants: 
    - EndPoint: /api/restaurant/get-all?page=#&size=#
    - Description: this endpoint allows get all paginated public restaurants 
    - Headers:
        - Authorization:
            - Type: string
            - Description: token for allowing services access
            - Example: Bearer <token>
    - Query Params:
        - page:
            - Type: number
            - Description: the page for the pagination
        - size:
            - Type: number
            - Description: the size of the pages in the paginated object
    - Body: none
    - Responses:
        - Avaliable Status code:
            - 200
            - 404
            - 500
        - Successful Response:
            - Type: JSON
            - Description: response if authentication was successful
            - Attributes:
                - totalElements:
                    - Type: string
                    - Description: total items that match the query
                - totalPages:
                    - Type: number
                    - Description: total pages within the database
                - size:
                    - Type: string
                    - Description: size of the page
                - page:
                    - Type: number
                    - Description: current page
                - elements:
                    - Type: number
                    - Description: total items on current page
                - data:
                    - Type: array
                    - Description: data list on the current page
        - Error Response:
            - Type: JSON
            - Description: an error response from server
            - Attributes:
                - error:
                    - Type: any
                    - Description: here the error is descripted


like restaurant: 
    - EndPoint: /api/restaurant/like-restaurant?restaurantId=#
    - Description: this endpoint allows you to like a restaurant
    - Query Params:
        - restaurantId:
            - Type: number
            - Description: the id of the restaurant you want to like
    - Headers:
        - Authorization:
            - Type: string
            - Description: token for allowing services access
            - Example: Bearer <token>
    - Body: none
    - Responses:
        - Avaliable Status code:
            - 200
            - 404
            - 500
        - Successful Response:
            - Type: JSON
            - Description: response if authentication was successful
            - Attributes:
                - data:
                    - Type: string
                    - Description: info about saved like
        - Error Response:
            - Type: JSON
            - Description: an error response from server
            - Attributes:
                - error:
                    - Type: any
                    - Description: here the error is descripted


update restaurant: 
    - EndPoint: /api/restaurant/update-restaurant
    - Description: this endpoint allows you to update a restaurant
    - Headers:
        - Authorization:
            - Type: string
            - Description: token for allowing services access
            - Example: Bearer <token>
    - Body:
        - id:
            - Type: number
            - Constrains: required
            - Description: Is the restaurant id
        - name:
            - Type: string
            - Constrains: min length 2, max length 100
        - address:
            - Type: string
            - Constrains: min length 10, max length 255
        - public:
            - Type: boolean
            - Constrains: none
    - Responses:
        - Avaliable Status code:
            - 200
            - 404
            - 500
        - Successful Response:
            - Type: JSON
            - Description: response if authentication was successful
            - Attributes:
                - data:
                    - Type: string
                    - Description: info about updated restaurant
        - Error Response:
            - Type: JSON
            - Description: an error response from server
            - Attributes:
                - error:
                    - Type: any
                    - Description: here the error is descripted