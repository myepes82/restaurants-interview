
BEGIN;
INSERT INTO public.users(id, email, password, creation_date) VALUES (1, 'prueba1@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
INSERT INTO public.users(id, email, password, creation_date) VALUES (2, 'prueba2@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
INSERT INTO public.users(id, email, password, creation_date) VALUES (3, 'prueba3@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
INSERT INTO public.users(id, email, password, creation_date) VALUES (4, 'prueba4@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
INSERT INTO public.users(id, email, password, creation_date) VALUES (5, 'prueba5@gmail.com', '$2b$12$.eHlgqhoNo5ydUI.rMQ4k.VgCU0mtTSD1I61qvRqaCSnf.WjeHt.2', '2021-09-25 17:31:24.841');
END;

BEGIN;
INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (1, 'Bambinos', '12 street address 12', 'false', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (2, 'Georges', '13 street address 13', 'false', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (3, 'McDonals', '14 street address 14', 'false', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (4, 'Rappi', '15 street address 15', 'true', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (5, 'PizzaHunt', '15 street address 14545', 'true', null, '2021-09-25', 1, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (6, 'Presto', '15 street address 15', 'false', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (7, 'BK', '15 street address 15', 'false', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (8, 'KFC', '15 street address 15', 'false', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (9, 'Billos', '15 street address 15', 'true', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (10, 'Pepsi', '15 street address 15', 'true', null, '2021-09-25', 2, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (11, 'CokeCola', '15 street address 15', 'false', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (12, 'Twai', '15 street address 15', 'false', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (13, 'Panucci', '15 street address 15', 'false', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (14, 'Jenos', '15 street address 15', 'true', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (15, 'Karens','15 street address 15', 'true', null, '2021-09-25', 3, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (16, 'Chesse', '15 street address 15', 'false', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (17, 'CesarS', '15 street address 15', 'false', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (18, 'la 14', '15 street address 15', 'false', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (19, 'hunter', '15 street address 15', 'true', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (20, 'Eater', '15 street address 15', 'true', null, '2021-09-25', 4, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (21, 'ANyThing', '15 street address 15', 'false', null, '2021-09-25', 5, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (22, 'Nothing', '15 street address 15', 'false', null, '2021-09-25', 5, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (23, 'EveryWhere', '15 street address 15', 'false', null, '2021-09-25', 5, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (24, 'Last', '15 street address 15', 'true', null, '2021-09-25', 5, 0);

INSERT INTO public.restaurants(id, name, address, public, update_date, creation_date, user_id, total_likes)
VALUES (25, 'PreLast', '15 street address 15', 'true', null, '2021-09-25', 5, 0);

END;


BEGIN;
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (1, 1, 9, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (2, 1, 10, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (3, 1, 14, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (4, 1, 15, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (5, 1, 19, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (6, 1, 20, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (7, 1, 24, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (8, 1, 25, '2021-09-25');

INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (9, 2,  4, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (10, 2, 5, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (11, 2, 14, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (12, 2, 15, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (13, 2, 19, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (14, 2, 20, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (15, 2, 24, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (16, 2, 25, '2021-09-25');

INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (17, 3, 4, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (18, 3, 5, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (19, 3, 9, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (20, 3, 10, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (21, 3, 19, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (22, 3, 20, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (23, 3, 24, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (24, 3, 25, '2021-09-25');

INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (25, 4, 4, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (26, 4, 5, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (27, 4, 9, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (28, 4, 10, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (29, 4, 14, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (30, 4, 15, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (31, 4, 24, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (32, 4, 25, '2021-09-25');

INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (33, 5, 4, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (34, 5, 5, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (35, 5, 9, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (36, 5, 10, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (37, 5, 14, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (38, 5, 15, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (39, 5, 19, '2021-09-25');
INSERT INTO public.linked_restaurants(id, user_id, restaurant_id, like_date) VALUES (40, 5, 20, '2021-09-25');
END;