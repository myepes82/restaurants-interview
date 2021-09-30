BEGIN;


CREATE TABLE IF NOT EXISTS public.linked_restaurants
(
    id serial NOT NULL,
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
    id serial NOT NULL,
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
    id serial NOT NULL,
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

