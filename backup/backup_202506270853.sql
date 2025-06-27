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
14124	9	Apple	sell	2650	5
14247	3	NVIDIA	sell	49500	1
14128	4	NVIDIA	sell	50500	1
14248	10	Apple	sell	2600	5
14129	6	Apple	sell	2700	9
14131	10	Apple	sell	2700	7
14251	3	Apple	sell	2650	10
14134	8	NVIDIA	sell	49500	8
14138	5	Apple	buy	2000	2
14256	8	Apple	sell	2400	8
14143	2	NVIDIA	sell	51000	2
14145	6	Apple	sell	2700	9
14260	4	NVIDIA	sell	49500	2
14263	5	NVIDIA	buy	45000	4
14265	2	NVIDIA	sell	50000	7
14266	5	Apple	buy	2050	6
14154	5	NVIDIA	sell	52000	8
14257	10	Apple	buy	2350	2
14155	4	Apple	buy	2000	8
14205	6	Apple	sell	2600	8
14267	4	NVIDIA	sell	49000	1
14268	3	Apple	sell	2500	4
14162	5	NVIDIA	sell	49500	3
14163	10	NVIDIA	sell	52000	6
14164	4	NVIDIA	sell	50000	8
14165	3	NVIDIA	sell	51000	5
14168	3	NVIDIA	sell	49500	4
14171	8	NVIDIA	sell	51500	9
14172	2	Apple	sell	2700	3
14173	10	NVIDIA	sell	49000	7
14176	1	Apple	buy	2050	9
14177	9	Apple	buy	2000	5
14178	2	Apple	buy	2100	3
14181	4	Apple	buy	2050	3
14185	8	Apple	buy	2050	4
14186	5	Apple	buy	2050	5
14190	5	NVIDIA	sell	49500	8
14191	4	NVIDIA	sell	51500	5
14192	5	NVIDIA	sell	50500	9
14193	8	NVIDIA	sell	52000	1
14197	10	Apple	buy	2050	9
14199	2	NVIDIA	sell	49000	6
14202	6	NVIDIA	sell	52000	10
14206	7	NVIDIA	sell	51500	5
14208	8	NVIDIA	sell	49000	8
14214	5	NVIDIA	sell	49500	8
14215	7	NVIDIA	sell	50500	2
14216	6	Apple	buy	2150	1
14218	1	Apple	buy	2100	9
14220	5	NVIDIA	sell	52000	5
14221	6	Apple	buy	2050	6
14222	6	Apple	sell	2650	3
14210	7	Apple	buy	2200	3
14224	8	Apple	sell	2600	8
14212	9	NVIDIA	buy	45000	5
14229	6	Apple	buy	2050	10
14270	11	NVIDIA	buy	48550	19
14231	10	NVIDIA	sell	49500	3
14232	4	NVIDIA	sell	49000	6
14234	10	Apple	sell	2600	1
14235	9	Apple	buy	2200	10
14236	1	NVIDIA	sell	49000	6
14237	9	NVIDIA	sell	49000	6
14244	1	NVIDIA	sell	49000	4
\.


--
-- Data for Name: user_coins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_coins (user_id, coin, amount) FROM stdin;
9	NVIDIA	102.93066435435954
11	Apple	200000017
9	Apple	60.929999999999865
2	NVIDIA	120.42219583267159
3	NVIDIA	126.08684250090334
11	NVIDIA	200000088.0588424
7	NVIDIA	89.78760926297423
4	NVIDIA	15.619999999999997
10	Apple	52.29999999999997
6	Apple	35.75999999999983
10	NVIDIA	91.2442978723402
1	Apple	180.85000000000045
2	Apple	128.35999999999987
8	Apple	27.17999999999993
1	NVIDIA	107.3478041673283
6	NVIDIA	119.53570212765959
5	NVIDIA	50.509713728840026
7	Apple	9.089999999999996
8	NVIDIA	139.51517015292308
4	Apple	166.67999999999995
5	Apple	195.81999999999974
3	Apple	136.03
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, username, balances) FROM stdin;
9	bob	1254291.1940577645
5	bob	3245348.4824392507
2	bob	228200
11	bob	99999994249925.1
10	bob	2702577.691077412
8	bob	153397.4513600599
1	alice	942141.0013255328
6	bob	1464528.5468694512
3	bob	58306.00683071831
7	bob	1157846.5198088353
4	bob	4543437.984515253
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.products_id_seq', 14301, true);


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

