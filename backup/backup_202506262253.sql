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
7463	5	NVIDIA	buy	46000	5.8
7427	1	NVIDIA	buy	45500	6.41
7517	5	Apple	buy	2100	2.09
7429	7	Apple	buy	2000	8.77
7330	8	Apple	buy	2200	5.2
7211	3	Apple	buy	2000	2.36
7331	4	NVIDIA	buy	46000	2.67
7214	3	Apple	buy	2100	5.81
7369	8	Apple	sell	2700	2.33
7584	8	NVIDIA	buy	45000	6.22
7288	5	Apple	sell	2650	5.019999999999998
7210	5	Apple	buy	2150	0.5999999999999996
7521	1	NVIDIA	buy	46000	8.81
7217	4	Apple	buy	2050	5.07
7335	10	Apple	buy	2150	3.51
7248	8	Apple	buy	2200	3.1099999999999985
7336	7	Apple	sell	2650	9.95
7213	7	Apple	sell	2700	5.3100000000000005
7383	8	NVIDIA	sell	52000	6.890000000000002
7525	5	Apple	buy	2050	8.25
7435	9	NVIDIA	buy	46000	4.41
7543	10	Apple	buy	2000	2.85
7338	1	Apple	sell	2600	8.99
7545	1	Apple	buy	2150	4.09
7342	3	Apple	buy	2100	7.11
7231	7	Apple	buy	2150	1.83
7282	2	Apple	buy	2100	3.61
7344	4	Apple	buy	2100	4.74
7547	4	NVIDIA	buy	45500	5.93
7346	1	Apple	buy	2050	1.35
7238	5	NVIDIA	buy	45000	6.84
7283	2	Apple	buy	2150	8.64
7239	7	NVIDIA	buy	45500	7.75
7284	4	Apple	buy	2100	2.91
7533	8	Apple	sell	2600	5.16
7535	3	NVIDIA	buy	46500	7.59
7242	3	NVIDIA	buy	46000	3.67
7349	9	Apple	sell	2700	9.69
7447	10	Apple	buy	2150	6.23
7563	7	NVIDIA	sell	52000	7.76
7245	3	Apple	buy	2150	9.75
7469	8	Apple	buy	2100	3.14
7471	9	NVIDIA	buy	46000	3.49
7574	1	Apple	sell	2650	6.22
7578	2	NVIDIA	sell	51500	4.53
7249	5	NVIDIA	buy	45000	3.61
7353	6	NVIDIA	buy	46000	1.54
7451	8	Apple	sell	2600	3.57
7252	7	NVIDIA	buy	45500	5.42
7473	9	Apple	buy	2050	3.63
7580	2	NVIDIA	buy	46500	2.34
7356	1	Apple	buy	2150	8.9
7357	1	NVIDIA	buy	46500	4.86
7511	10	NVIDIA	sell	51500	4.5
7359	10	Apple	buy	2150	2.58
7457	6	NVIDIA	buy	45000	9.28
7361	2	Apple	buy	2000	6.26
7459	2	Apple	buy	2050	8.24
7539	5	Apple	sell	2650	6.51
7475	5	Apple	buy	2100	4.59
7567	2	NVIDIA	sell	52000	9.34
7366	7	Apple	sell	2600	1.1
7318	10	Apple	buy	2100	1.59
7551	8	NVIDIA	buy	46500	6.53
7317	7	Apple	sell	2600	3.8100000000000005
7373	9	Apple	buy	2150	7.72
7374	1	NVIDIA	buy	46500	8.8
7553	7	Apple	sell	2650	2.88
7375	7	NVIDIA	buy	46000	6.62
7376	1	NVIDIA	buy	46500	2.27
7355	1	Apple	buy	2200	3.5699999999999994
7321	5	Apple	buy	2050	8.49
7378	1	Apple	buy	2200	8.38
7379	2	NVIDIA	buy	46500	1.13
7275	10	Apple	buy	2150	1.14
7557	6	Apple	buy	2050	8.76
7294	8	Apple	sell	2650	3.27
7594	10	Apple	buy	2000	8.24
7384	3	Apple	buy	2000	7.99
7385	4	Apple	buy	2000	3.27
7298	2	Apple	buy	2050	4.86
7343	9	NVIDIA	buy	46500	4.380000000000007
7388	3	Apple	buy	2150	3.6
7389	9	Apple	buy	2050	8.6
7302	8	NVIDIA	buy	46000	7.54
7392	2	Apple	buy	2000	9.86
7394	1	NVIDIA	buy	45000	5.4
7395	6	Apple	buy	2000	4.88
7309	2	Apple	buy	2050	7.05
7516	9	Apple	buy	2000	3.69
7645	7	NVIDIA	buy	48500	1.3000000000000007
7401	9	Apple	sell	2700	9.74
7522	3	Apple	sell	2650	3.65
7404	6	Apple	buy	2100	2.41
7430	5	NVIDIA	buy	45000	3.61
7406	1	NVIDIA	buy	46000	5.97
7407	9	Apple	buy	2200	1.79
7528	3	Apple	sell	2600	6.24
7436	4	Apple	buy	2150	7.92
7411	2	Apple	buy	2200	4.34
7577	2	Apple	sell	2700	2.45
7438	9	NVIDIA	buy	45500	2.17
7413	7	NVIDIA	sell	52000	2.57
7579	6	NVIDIA	sell	51000	3.63
7414	2	NVIDIA	buy	46000	10
7417	10	Apple	buy	2000	9.51
7418	7	Apple	buy	2150	4.91
7419	2	Apple	buy	2100	8.07
7591	4	NVIDIA	sell	51000	4.72
7420	5	Apple	buy	2200	5.89
7546	2	NVIDIA	buy	45000	2.03
7423	3	NVIDIA	buy	45500	6.43
7424	9	Apple	sell	2700	7.72
7446	7	Apple	sell	2600	9.82
7550	3	NVIDIA	buy	46000	2
7454	4	NVIDIA	sell	51500	2.19
7552	2	NVIDIA	sell	52000	5.12
7599	3	NVIDIA	buy	45000	5.41
7464	1	Apple	buy	2000	8.25
7602	5	Apple	sell	2650	7.43
7562	6	NVIDIA	buy	46500	2.51
7476	10	NVIDIA	buy	46000	8.11
7478	2	NVIDIA	buy	45500	5.91
7480	5	Apple	buy	2200	7.22
7482	2	Apple	sell	2700	2.55
7564	4	NVIDIA	sell	51500	9.59
7492	10	Apple	buy	2050	5.62
7606	3	Apple	buy	2100	4.69
7496	4	NVIDIA	sell	51500	3.35
7502	8	NVIDIA	sell	52000	4.83
7506	9	Apple	sell	2700	5.91
7611	2	Apple	buy	2150	4.25
7612	8	Apple	buy	2000	8.86
7508	3	NVIDIA	buy	45500	6.74
7613	2	NVIDIA	buy	46500	9.35
7514	10	Apple	sell	2600	6.07
7614	5	NVIDIA	buy	46500	1.94
7617	7	Apple	buy	2100	2.43
7619	2	Apple	buy	2150	4.51
7620	2	Apple	buy	2050	5.11
7621	3	Apple	sell	2650	4.35
7622	6	NVIDIA	sell	51000	6.49
7623	2	Apple	sell	2550	9.75
7625	9	Apple	buy	2200	2.48
7627	5	Apple	sell	2700	1.58
7631	8	Apple	buy	2050	2.14
7632	10	Apple	buy	2100	2.73
7634	7	NVIDIA	sell	51500	9.49
7636	5	NVIDIA	buy	46500	5.39
7637	4	NVIDIA	sell	51000	4
7639	1	Apple	buy	2050	4.85
7640	7	Apple	buy	2150	7.29
7644	10	NVIDIA	sell	52000	4.41
7649	7	NVIDIA	buy	47000	7.91
7650	5	NVIDIA	buy	45000	6.05
7629	2	NVIDIA	buy	47000	0.9900000000000049
7630	4	Apple	sell	2550	2.6300000000000026
7652	1	NVIDIA	buy	46500	9.65
7653	10	Apple	buy	2050	5.86
7655	8	NVIDIA	sell	51000	9.37
7504	10	NVIDIA	sell	51000	0.370000000000001
7658	6	NVIDIA	buy	45500	6.79
7659	3	Apple	sell	2700	7.92
7664	6	Apple	sell	2600	9.99
7665	1	NVIDIA	buy	47500	4.43
7663	5	Apple	buy	2300	0.5600000000000005
7668	4	NVIDIA	buy	47500	3.93
7666	1	NVIDIA	sell	50500	0.46999999999999975
7661	8	Apple	sell	2450	5
7670	7	NVIDIA	buy	49500	0.1299999999999999
7671	3	Apple	sell	2450	9.51
\.


--
-- Data for Name: user_coins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_coins (user_id, coin, amount) FROM stdin;
11	Apple	200000017
4	NVIDIA	93.84
7	NVIDIA	89.76000000000006
11	NVIDIA	200000047.0588424
8	NVIDIA	130.51999999999998
10	NVIDIA	92.74
2	Apple	137.85
3	Apple	88.44
9	NVIDIA	114.49
1	NVIDIA	86.36999999999996
2	NVIDIA	117.46999999999998
5	Apple	95.54
5	NVIDIA	104.26
8	Apple	127.11999999999996
1	Apple	84.19000000000001
3	NVIDIA	110.90000000000002
7	Apple	68.71000000000001
6	NVIDIA	63.65000000000002
6	Apple	74.29000000000003
9	Apple	85.03
4	Apple	143.89000000000001
10	Apple	87.93999999999997
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, username, balances) FROM stdin;
11	bob	99999996193925.1
2	bob	380846.70165925473
8	bob	100630.73090587837
3	bob	915796.9658221782
6	bob	4013425.5
10	bob	2427617.313998415
9	bob	616066.9870488286
5	bob	1060983.071214472
1	alice	2235066.8572005397
4	bob	914584.6148272962
7	bob	1141056.1356074158
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.products_id_seq', 7671, true);


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

