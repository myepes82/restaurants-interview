
BEGIN;
INSERT INTO public.users(email, password, creation_date) VALUES ('prueba1@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
INSERT INTO public.users(email, password, creation_date) VALUES ('prueba2@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
INSERT INTO public.users(email, password, creation_date) VALUES ('prueba3@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
INSERT INTO public.users(email, password, creation_date) VALUES ('prueba4@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
INSERT INTO public.users(email, password, creation_date) VALUES ('prueba5@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
END;

BEGIN;
INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Bambinos', '12 street address 12', 'false', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Georges', '13 street address 13', 'false', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('McDonals', '14 street address 14', 'false', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Rappi', '15 street address 15', 'true', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('PizzaHunt', '15 street address 14545', 'true', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Presto', '15 street address 15', 'false', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('BK', '15 street address 15', 'false', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('KFC', '15 street address 15', 'false', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Billos', '15 street address 15', 'true', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Pepsi', '15 street address 15', 'true', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('CokeCola', '15 street address 15', 'false', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Twai', '15 street address 15', 'false', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Panucci', '15 street address 15', 'false', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Jenos', '15 street address 15', 'true', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Karens','15 street address 15', 'true', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Chesse', '15 street address 15', 'false', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('CesarS', '15 street address 15', 'false', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('la 14', '15 street address 15', 'false', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('hunter', '15 street address 15', 'true', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Eater', '15 street address 15', 'true', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('ANyThing', '15 street address 15', 'false', null, '2021-09-25', 5, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Nothing', '15 street address 15', 'false', null, '2021-09-25', 5, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('EveryWhere', '15 street address 15', 'false', null, '2021-09-25', 5, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('Last', '15 street address 15', 'true', null, '2021-09-25', 5, 0);

INSERT INTO public.restaurants(name, address, public, update_date, creation_date, user_id, total_likes)
VALUES ('PreLast', '15 street address 15', 'true', null, '2021-09-25', 5, 0);

END;


BEGIN;
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (1, 10, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (1, 9, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (1, 14, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (1, 15, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (1, 19, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (1, 20, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (1, 24, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (1, 25, '2021-09-25');

INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (2,  4, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (2, 5, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (2, 14, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (2, 15, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (2, 19, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (2, 20, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (2, 24, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (2, 25, '2021-09-25');

INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (3, 4, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (3, 5, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (3, 9, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (3, 10, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (3, 19, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (3, 20, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (3, 24, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (3, 25, '2021-09-25');

INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (4, 4, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (4, 5, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (4, 9, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (4, 10, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (4, 14, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (4, 15, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (4, 24, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (4, 25, '2021-09-25');

INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (5, 4, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (5, 5, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (5, 9, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (5, 10, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (5, 14, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (5, 15, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (5, 19, '2021-09-25');
INSERT INTO public.linked_restaurants(user_id, restaurant_id, like_date) VALUES (5, 20, '2021-09-25');
END;