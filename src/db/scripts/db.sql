BEGIN;


CREATE TABLE IF NOT EXISTS public.linked_restaurants
(
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    like_date date NOT NULL,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS public.restaurants
(
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(255) NOT NULL,
    public boolean NOT NULL,
    update_date date,
    creation_date date,
    user_id bigint NOT NULL,
    total_likes integer,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

CREATE TABLE IF NOT EXISTS public.users
(
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    creation_date timestamp without time zone NOT NULL,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.linked_restaurants
    ADD FOREIGN KEY (restaurant_id)
    REFERENCES public.restaurants (id)
    NOT VALID;


ALTER TABLE public.linked_restaurants
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.restaurants
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;

END;


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