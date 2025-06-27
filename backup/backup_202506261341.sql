--
-- PostgreSQL database dump
--

-- Dumped from database version 15rc2 (Debian 15~rc2-1.pgdg110+1)
-- Dumped by pg_dump version 15.13 (Debian 15.13-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    coin character varying NOT NULL,
    amount double precision NOT NULL,
    action character varying NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.orders OWNER TO admin;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO admin;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.products (
    id integer NOT NULL,
    user_id integer NOT NULL,
    coin character varying NOT NULL,
    action character varying NOT NULL,
    price double precision NOT NULL,
    amount double precision NOT NULL
);


ALTER TABLE public.products OWNER TO admin;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO admin;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: user_coins; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_coins (
    user_id integer NOT NULL,
    coin character varying NOT NULL,
    amount double precision
);


ALTER TABLE public.user_coins OWNER TO admin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    balances double precision
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.orders (id, user_id, coin, amount, action, price) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.products (id, user_id, coin, action, price, amount) FROM stdin;
9	8	Ethereum	buy	2078.91	3.12
15	2	Ethereum	buy	2117.85	6.45
24	10	Ethereum	sell	3650.33	2.24
29	5	Ethereum	sell	3729.14	7.62
31	10	Ethereum	sell	3562.64	6.78
32	4	Ethereum	sell	3662.75	2.43
33	2	Bitcoin	sell	56265.76	6
34	6	Ethereum	buy	2362.94	7.95
35	6	Bitcoin	buy	40148.82	6.16
28	8	Ethereum	sell	3472.22	4.3500000000000005
37	4	Ethereum	sell	3488.25	2.92
38	8	Ethereum	sell	3571.45	8.46
39	5	Bitcoin	buy	41058.23	1.76
42	6	Ethereum	buy	2025.82	9.37
43	7	Ethereum	sell	3708.64	4.67
45	4	Ethereum	sell	3764.3	4.89
50	10	Bitcoin	buy	41990	1.33
51	3	Bitcoin	buy	40082.19	9.47
55	3	Ethereum	sell	3533.72	4.25
56	5	Ethereum	buy	2377.92	4.41
13	6	Bitcoin	sell	55761.22	0.010000000000001563
52	1	Ethereum	sell	2829.59	1.9999999999999996
54	5	Bitcoin	buy	48658.55	2.33
59	8	Bitcoin	buy	45690.92	6.42
60	6	Bitcoin	buy	40849.53	7.06
61	2	Ethereum	buy	2039.37	9.21
62	10	Ethereum	buy	2180.85	1.52
63	10	Bitcoin	buy	45592.94	1.7
64	9	Bitcoin	buy	47610.6	2.12
67	4	Bitcoin	buy	44836.35	5.81
68	6	Ethereum	sell	3176.2	2.97
3	9	Ethereum	buy	2429.65	6.190000000000001
65	8	Bitcoin	sell	48689.43	3.2399999999999998
69	6	Bitcoin	sell	55854.53	1.39
70	4	Ethereum	buy	2652.64	2.1
71	9	Ethereum	buy	2598.35	7.11
72	2	Bitcoin	buy	47861.29	8.06
73	3	Bitcoin	sell	49567.37	2.41
57	5	Ethereum	buy	2747.58	0.7600000000000007
\.


--
-- Data for Name: user_coins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_coins (user_id, coin, amount) FROM stdin;
2	Bitcoin	20
11	Bitcoin	200000000
11	Ethereum	200000000
8	Ethereum	29.44
7	Bitcoin	17.77
10	Bitcoin	13.93
2	Ethereum	35.230000000000004
9	Bitcoin	14.050000000000004
1	Bitcoin	26.179999999999996
4	Ethereum	18.690000000000005
6	Bitcoin	27.680000000000003
4	Bitcoin	28.94
3	Ethereum	22.57
5	Bitcoin	22.520000000000003
7	Ethereum	5.2700000000000085
1	Ethereum	23.02
6	Ethereum	25.67
9	Ethereum	13.619999999999996
3	Bitcoin	5.159999999999997
8	Bitcoin	23.769999999999996
10	Ethereum	3.919999999999999
5	Ethereum	22.569999999999997
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, username, balances) FROM stdin;
11	bob	100000000000000
2	bob	953867.7171999998
4	bob	498528.399
7	bob	1160109.7050999997
1	alice	673132.0152000001
6	bob	612244.9367999999
9	bob	1296914.0324000001
3	bob	1798780.5211000002
8	bob	769178.94
10	bob	1349103.7627
5	bob	888139.9705000003
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.products_id_seq', 73, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: user_coins user_coins_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_coins
    ADD CONSTRAINT user_coins_pkey PRIMARY KEY (user_id, coin);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_orders_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_orders_id ON public.orders USING btree (id);


--
-- Name: ix_products_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_products_id ON public.products USING btree (id);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_users_username ON public.users USING btree (username);


--
-- PostgreSQL database dump complete
--

