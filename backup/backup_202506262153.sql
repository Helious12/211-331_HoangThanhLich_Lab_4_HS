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
7425	1	NVIDIA	buy	48000	0.9399999999999986
7328	6	NVIDIA	sell	51000	8.89
7330	8	Apple	buy	2200	5.2
7211	3	Apple	buy	2000	2.36
7331	4	NVIDIA	buy	46000	2.67
7214	3	Apple	buy	2100	5.81
7369	8	Apple	sell	2700	2.33
7288	5	Apple	sell	2650	5.019999999999998
7210	5	Apple	buy	2150	0.5999999999999996
7217	4	Apple	buy	2050	5.07
7335	10	Apple	buy	2150	3.51
7336	7	Apple	sell	2650	9.95
7213	7	Apple	sell	2700	5.3100000000000005
7371	9	Apple	sell	2550	3.59
7383	8	NVIDIA	sell	52000	6.890000000000002
7338	1	Apple	sell	2600	8.99
7342	3	Apple	buy	2100	7.11
7231	7	Apple	buy	2150	1.83
7339	4	Apple	sell	2550	2.3000000000000034
7343	9	NVIDIA	buy	46500	8.13
7282	2	Apple	buy	2100	3.61
7344	4	Apple	buy	2100	4.74
7346	1	Apple	buy	2050	1.35
7238	5	NVIDIA	buy	45000	6.84
7283	2	Apple	buy	2150	8.64
7239	7	NVIDIA	buy	45500	7.75
7284	4	Apple	buy	2100	2.91
7348	6	Apple	buy	2250	1.64
7242	3	NVIDIA	buy	46000	3.67
7349	9	Apple	sell	2700	9.69
7244	1	Apple	buy	2200	3.1
7245	3	Apple	buy	2150	9.75
7248	8	Apple	buy	2200	8.98
7249	5	NVIDIA	buy	45000	3.61
7234	5	Apple	buy	2250	3.75
7353	6	NVIDIA	buy	46000	1.54
7285	1	NVIDIA	buy	46500	7.83
7252	7	NVIDIA	buy	45500	5.42
7355	1	Apple	buy	2200	5.72
7356	1	Apple	buy	2150	8.9
7357	1	NVIDIA	buy	46500	4.86
7359	10	Apple	buy	2150	2.58
7316	6	NVIDIA	buy	46500	7.66
7361	2	Apple	buy	2000	6.26
7364	2	Apple	buy	2250	7.5
7229	4	NVIDIA	buy	46500	4.100000000000004
7366	7	Apple	sell	2600	1.1
7318	10	Apple	buy	2100	1.59
7317	7	Apple	sell	2600	3.8100000000000005
7373	9	Apple	buy	2150	7.72
7374	1	NVIDIA	buy	46500	8.8
7375	7	NVIDIA	buy	46000	6.62
7376	1	NVIDIA	buy	46500	2.27
7377	1	Apple	sell	2450	2.58
7321	5	Apple	buy	2050	8.49
7378	1	Apple	buy	2200	8.38
7379	2	NVIDIA	buy	46500	1.13
7275	10	Apple	buy	2150	1.14
7294	8	Apple	sell	2650	3.27
7384	3	Apple	buy	2000	7.99
7385	4	Apple	buy	2000	3.27
7298	2	Apple	buy	2050	4.86
7388	3	Apple	buy	2150	3.6
7389	9	Apple	buy	2050	8.6
7302	8	NVIDIA	buy	46000	7.54
7392	2	Apple	buy	2000	9.86
7394	1	NVIDIA	buy	45000	5.4
7395	6	Apple	buy	2000	4.88
7309	2	Apple	buy	2050	7.05
7310	8	Apple	buy	2250	1.77
7416	4	NVIDIA	sell	50000	2.3499999999999988
7401	9	Apple	sell	2700	9.74
7404	6	Apple	buy	2100	2.41
7406	1	NVIDIA	buy	46000	5.97
7407	9	Apple	buy	2200	1.79
7411	2	Apple	buy	2200	4.34
7413	7	NVIDIA	sell	52000	2.57
7414	2	NVIDIA	buy	46000	10
7415	5	NVIDIA	sell	51000	4.95
7403	3	NVIDIA	buy	47000	7.959999999999999
7417	10	Apple	buy	2000	9.51
7418	7	Apple	buy	2150	4.91
7419	2	Apple	buy	2100	8.07
7420	5	Apple	buy	2200	5.89
7421	3	Apple	sell	2450	8.77
7422	8	NVIDIA	buy	49000	2.16
7423	3	NVIDIA	buy	45500	6.43
7424	9	Apple	sell	2700	7.72
\.


--
-- Data for Name: user_coins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_coins (user_id, coin, amount) FROM stdin;
11	NVIDIA	200000051.0588424
4	NVIDIA	100
1	NVIDIA	100
3	Apple	100
9	NVIDIA	100
8	NVIDIA	100
7	NVIDIA	100
2	NVIDIA	100
2	Apple	100
5	Apple	100
10	NVIDIA	100
11	Apple	200000010
6	NVIDIA	100
6	Apple	100
8	Apple	100
9	Apple	100
3	NVIDIA	100
4	Apple	100
1	Apple	100
10	Apple	100
7	Apple	100
5	NVIDIA	100
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, username, balances) FROM stdin;
11	bob	99999996010525.1
8	bob	1663125.7309058784
3	bob	1438735.9658221784
2	bob	1316919.2016592545
6	bob	2120159
1	alice	1510378.3572005397
4	bob	679030.6148272965
9	bob	1318496.4870488285
10	bob	2023719.8139984156
7	bob	590296.1356074157
5	bob	1328613.5712144717
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.products_id_seq', 7457, true);


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

