--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.2)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: contact_name; Type: DOMAIN; Schema: public; Owner: root
--

CREATE DOMAIN public.contact_name AS character varying NOT NULL
	CONSTRAINT contact_name_check CHECK (((VALUE)::text !~ '\s'::text));


ALTER DOMAIN public.contact_name OWNER TO root;

--
-- Name: film_summary; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.film_summary AS (
	film_id integer,
	title character varying,
	release_year smallint
);


ALTER TYPE public.film_summary OWNER TO root;

--
-- Name: priority; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.priority AS ENUM (
    'low',
    'medium',
    'high'
);


ALTER TYPE public.priority OWNER TO root;

--
-- Name: create_cart(); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.create_cart() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
insert into carts(user_id) values(new.user_id);
return NEW;
end;
$$;


ALTER FUNCTION public.create_cart() OWNER TO root;

--
-- Name: create_user(character varying); Type: PROCEDURE; Schema: public; Owner: root
--

CREATE PROCEDURE public.create_user(un character varying)
    LANGUAGE plpgsql
    AS $$
declare
user_id integer;
begin
insert into users(username) values(un) returning id into user_id;
commit;
end;
$$;


ALTER PROCEDURE public.create_user(un character varying) OWNER TO root;

--
-- Name: get_film_summary(integer); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.get_film_summary(f_id integer) RETURNS public.film_summary
    LANGUAGE sql
    AS $$
SELECT
    film_id,
    title,
    release_year
FROM
    film
WHERE
    film_id = f_id ;
$$;


ALTER FUNCTION public.get_film_summary(f_id integer) OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: carts; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.carts (
    user_id integer
);


ALTER TABLE public.carts OWNER TO root;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phones jsonb
);


ALTER TABLE public.contacts OWNER TO root;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO root;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: film; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.film (
    film_id integer,
    title character varying(20),
    release_year smallint
);


ALTER TABLE public.film OWNER TO root;

--
-- Name: mailing; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.mailing (
    id integer NOT NULL,
    first_name public.contact_name,
    last_name public.contact_name,
    email character varying NOT NULL
);


ALTER TABLE public.mailing OWNER TO root;

--
-- Name: mailing_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.mailing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mailing_id_seq OWNER TO root;

--
-- Name: mailing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.mailing_id_seq OWNED BY public.mailing.id;


--
-- Name: mailing_list; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.mailing_list (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying NOT NULL,
    CONSTRAINT mailing_list_check CHECK ((((first_name)::text !~ '\s'::text) AND ((last_name)::text !~ '\s'::text)))
);


ALTER TABLE public.mailing_list OWNER TO root;

--
-- Name: mailing_list_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.mailing_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mailing_list_id_seq OWNER TO root;

--
-- Name: mailing_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.mailing_list_id_seq OWNED BY public.mailing_list.id;


--
-- Name: my_table; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.my_table (
);


ALTER TABLE public.my_table OWNER TO root;

--
-- Name: person; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.person (
    id integer NOT NULL,
    info xml
);


ALTER TABLE public.person OWNER TO root;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: requests; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.requests (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    priority public.priority NOT NULL,
    request_date date NOT NULL
);


ALTER TABLE public.requests OWNER TO root;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.requests ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: students; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.students (
    id integer,
    name character varying(20),
    age integer,
    grade character varying(20),
    adhar_number character varying(20)
);


ALTER TABLE public.students OWNER TO root;

--
-- Name: teacher; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.teacher (
    id integer,
    name character varying(20),
    age integer,
    student_id integer
);


ALTER TABLE public.teacher OWNER TO root;

--
-- Name: s_t; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW public.s_t AS
 SELECT s.name,
    s.age,
    t.name AS teacher_name,
    t.age AS teacher_age
   FROM (public.teacher t
     JOIN public.students s ON ((t.student_id = s.id)));


ALTER TABLE public.s_t OWNER TO root;

--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id integer NOT NULL,
    profile jsonb,
    username character varying(20),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    user_id integer
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: mailing id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.mailing ALTER COLUMN id SET DEFAULT nextval('public.mailing_id_seq'::regclass);


--
-- Name: mailing_list id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.mailing_list ALTER COLUMN id SET DEFAULT nextval('public.mailing_list_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.carts (user_id) FROM stdin;
4
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.contacts (id, name, phones) FROM stdin;
1	John Doe	["408-111-2222", "408-111-2223"]
2	Jane Doe	["212-111-2222", "212-111-2223"]
3	John Doe	["408-111-2222", "408-111-2223", "647674748"]
4	Jane Doe	["212-111-2222", "212-111-2223", "49489489"]
\.


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.film (film_id, title, release_year) FROM stdin;
12	RRR	2022
14	KGF2	2021
\.


--
-- Data for Name: mailing; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.mailing (id, first_name, last_name, email) FROM stdin;
4	Jame	Doe	[[email protected]](../cdn-cgi/l/email-protection.html)
\.


--
-- Data for Name: mailing_list; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.mailing_list (id, first_name, last_name, email) FROM stdin;
1	gh	jf	gurpreet@gmail.com
2			gurpreet@gmail.com
\.


--
-- Data for Name: my_table; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.my_table  FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.person (id, info) FROM stdin;
1	    <person>\n        <name>John Doe</name>\n        <age>35</age>\n        <city>San Francisco</city>\n    </person>
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.requests (id, title, priority, request_date) FROM stdin;
1	Create an enum tutorial in PostgreSQL	high	2019-01-01
2	Review the enum tutorial	medium	2019-01-01
3	Publish the PostgreSQL enum tutorial	low	2019-01-01
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.students (id, name, age, grade, adhar_number) FROM stdin;
1	gurpreet	18	A	123412341234
2	kritika	19	B	\N
3	guet	16	C	\N
4	ika	32	B	\N
\.


--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.teacher (id, name, age, student_id) FROM stdin;
1	madhuri	30	1
1	madhuri	30	2
2	nena	39	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, profile, username, start_date, end_date, user_id) FROM stdin;
3	{"age": 23, "name": "js"}	gps	2026-08-23 12:23:23	2027-09-08 23:02:23	3
2	{"age": "18", "name": "gp", "hobby": {"1": "dancing", "2": "reading"}}	gp	2025-02-08 12:23:23	2025-07-08 12:23:23	2
1	{"age": "18", "name": "gurpreet", "hobby": {"1": "singing", "2": "reading"}}	gurpreet	2026-04-09 12:23:29	2026-07-08 12:23:23	1
4	{"age": 23, "name": "j"}	gp	2029-08-23 12:23:23	2029-09-08 23:02:23	4
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.contacts_id_seq', 4, true);


--
-- Name: mailing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.mailing_id_seq', 4, true);


--
-- Name: mailing_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.mailing_list_id_seq', 3, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.person_id_seq', 1, true);


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.requests_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: mailing_list mailing_list_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.mailing_list
    ADD CONSTRAINT mailing_list_pkey PRIMARY KEY (id);


--
-- Name: mailing mailing_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.mailing
    ADD CONSTRAINT mailing_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_tsrange_excl; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_tsrange_excl EXCLUDE USING gist (tsrange(start_date, end_date) WITH &&);


--
-- Name: student_in; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX student_in ON public.students USING btree (id);


--
-- Name: users attach_cart; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER attach_cart AFTER INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION public.create_cart();


--
-- PostgreSQL database dump complete
--

