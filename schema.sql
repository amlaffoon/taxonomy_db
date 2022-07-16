CREATE TABLE public.kingdom
(
    id serial primary key,
    name text NOT NULL
);

ALTER TABLE IF EXISTS public.kingdom
    OWNER to postgres;
    
CREATE TABLE public.phylum
(
    id serial primary key,
    name text NOT NULL,
    kingdom_id integer,
    CONSTRAINT kingdom_id FOREIGN KEY (kingdom_id)
        REFERENCES public.kingdom (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.phylum
    OWNER to postgres;

create table public.class
(
    id serial primary key,
    name text not null,
    phylum_id integer,
    constraint phylum_fk foreign key (phylum_id)
        references public.phylum (id)
);

alter table if exists public.class owner to postgres;

create table public.order
(
    id serial primary key,
    name text not null,
    class_id integer,
    constraint class_fk foreign key (class_id)
    references public.class (id)
);

alter table if exists public.order owner to postgres;

create table public.family
(
    id serial primary key,
    name text not null,
    order_id integer,
    constraint order_fk foreign key (order_id)
    references public.order (id)
);

alter table if exists public.family owner to postgres;

create table public.genus
(
    id serial primary key,
    name text not null,
    family_id integer,
    constraint family_fk foreign key (family_id)
    references public.family (id)
);

alter table if exists public.genus owner to postgres;

create table public.species
(
    id serial primary key,
    name text not null,
    genus_id integer,
    constraint genus_fk foreign key (genus_id)
    references public.genus (id)
);

alter table if exists public.species owner to postgres;