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
71	9	Ethereum	buy	2598.35	3.750000000000001
76	7	Ethereum	buy	2483.14	3.78
77	4	Bitcoin	buy	44394.84	7.03
9	8	Ethereum	buy	2078.91	3.12
79	7	Ethereum	sell	3570.07	2.54
80	8	Bitcoin	buy	40676.15	9.31
123	8	Ethereum	sell	3907.78	3.24
81	6	Ethereum	buy	2294.8	7.83
15	2	Ethereum	buy	2117.85	6.45
83	8	Ethereum	sell	3686.28	3.53
84	1	Bitcoin	sell	57430.26	5.25
88	10	Ethereum	buy	2633.7	5.07
136	9	Ethereum	buy	2241.65	3.24
137	9	Bitcoin	sell	56794.33	5.45
92	1	Ethereum	sell	3898.64	3.11
24	10	Ethereum	sell	3650.33	2.24
93	8	Ethereum	sell	3836.69	4.9
94	6	Ethereum	sell	3548.5	4.5
91	6	Ethereum	sell	3501.62	1.9900000000000002
29	5	Ethereum	sell	3729.14	7.62
95	8	Bitcoin	sell	58524.3	9.59
31	10	Ethereum	sell	3562.64	6.78
32	4	Ethereum	sell	3662.75	2.43
34	6	Ethereum	buy	2362.94	7.95
35	6	Bitcoin	buy	40148.82	6.16
96	3	Ethereum	buy	2436.32	2.52
38	8	Ethereum	sell	3571.45	8.46
39	5	Bitcoin	buy	41058.23	1.76
42	6	Ethereum	buy	2025.82	9.37
43	7	Ethereum	sell	3708.64	4.67
99	6	Ethereum	sell	3700.56	8.02
33	2	Bitcoin	sell	56265.76	0.7800000000000011
45	4	Ethereum	sell	3764.3	4.89
101	10	Bitcoin	buy	41365.12	1.8
140	2	Bitcoin	sell	56398.83	3.13
70	4	Ethereum	buy	2652.64	1.7499999999999987
50	10	Bitcoin	buy	41990	1.33
51	3	Bitcoin	buy	40082.19	9.47
108	1	Ethereum	buy	2192.28	4.88
55	3	Ethereum	sell	3533.72	4.25
56	5	Ethereum	buy	2377.92	4.41
142	5	Bitcoin	sell	59944.4	2.32
171	6	Bitcoin	buy	42641.5	9.21
172	9	Bitcoin	buy	42182.74	7.66
110	7	Ethereum	sell	3523.05	4.27
60	6	Bitcoin	buy	40849.53	7.06
61	2	Ethereum	buy	2039.37	9.21
62	10	Ethereum	buy	2180.85	1.52
111	9	Ethereum	sell	3506.68	9.94
143	2	Ethereum	buy	2024.07	2.01
3	9	Ethereum	buy	2429.65	6.190000000000001
125	1	Bitcoin	sell	59240.84	5.08
112	7	Bitcoin	sell	58274.88	9.05
113	8	Ethereum	buy	2338.79	6.79
114	5	Bitcoin	buy	41931.68	2.6
173	2	Ethereum	sell	3782.62	5.89
118	2	Ethereum	buy	2710.97	7.11
119	2	Ethereum	buy	2185.76	6.87
120	1	Ethereum	buy	2089.66	6.75
126	10	Bitcoin	sell	59077.14	8.18
129	7	Bitcoin	sell	53819.41	9.05
161	7	Bitcoin	sell	57340.43	4.62
130	1	Bitcoin	buy	44153.83	8.87
162	7	Bitcoin	sell	53249.37	1.61
131	1	Ethereum	sell	3655.93	1.98
132	6	Bitcoin	buy	41635.08	1.34
163	6	Bitcoin	sell	59638.73	6.3
144	7	Bitcoin	buy	40038.21	9.03
145	2	Bitcoin	buy	42408.38	6.4
146	3	Bitcoin	buy	41815.33	2.2
164	6	Bitcoin	sell	54811.5	1.57
148	2	Ethereum	buy	2332.45	1.4
150	2	Ethereum	sell	3725.64	9.95
175	9	Ethereum	buy	2314.07	8.29
152	7	Ethereum	buy	2357.82	4.44
154	1	Ethereum	buy	2010.36	4.65
133	7	Bitcoin	sell	53504.97	7.470000000000001
156	3	Bitcoin	buy	40681.41	7.64
165	5	Ethereum	sell	3809.77	5.53
166	6	Ethereum	sell	3982.53	6.44
167	8	Ethereum	sell	3709.06	6.6
176	1	Bitcoin	sell	56027.02	2.07
177	8	Ethereum	buy	2504.94	6.66
179	7	Ethereum	buy	2736.64	2.83
180	8	Ethereum	sell	3506.64	5.84
181	9	Ethereum	buy	2281.23	5.13
183	6	Bitcoin	sell	52565.82	1.65
184	10	Ethereum	buy	2070.64	5.05
185	1	Bitcoin	sell	53709.03	9.26
186	9	Ethereum	sell	3588.72	6.48
187	3	Bitcoin	sell	57454.72	4.3
190	6	Ethereum	sell	3560.23	6.47
151	1	Ethereum	sell	3490.35	1.2199999999999993
191	4	Ethereum	buy	2674.93	3.25
193	7	Bitcoin	sell	58304.85	4.37
195	10	Ethereum	buy	2853.46	7.43
160	10	Bitcoin	sell	49877.04	1.3800000000000008
198	5	Ethereum	sell	3690.76	5.9
201	3	Ethereum	sell	3740.01	2.65
82	8	Bitcoin	buy	44555.39	0.40415259074155285
205	9	Ethereum	buy	2786.29	4.19
208	3	Ethereum	buy	2668.95	4.04
138	4	Bitcoin	buy	44399.52	1.6558474092584445
210	6	Ethereum	sell	3509.23	7.47
212	8	Bitcoin	sell	55140.05	7.66
213	7	Ethereum	buy	2181.19	6.58
215	5	Ethereum	sell	3833.7	6.37
217	9	Ethereum	sell	3674.59	1.07
219	9	Ethereum	buy	2764.84	2.16
220	6	Bitcoin	sell	57676.59	4.68
222	4	Ethereum	buy	2128.51	9.8
223	4	Bitcoin	sell	58759	8.04
224	1	Bitcoin	sell	57091.65	8.38
226	5	Bitcoin	sell	53369.67	3.67
228	4	Bitcoin	sell	59651.35	3.49
194	1	Bitcoin	sell	51940.17	1.0300000000000016
204	10	Ethereum	buy	2878.11	2.0700000000000003
237	1	Ethereum	buy	2060.16	9.91
239	9	Ethereum	sell	3674.77	9.17
244	10	Bitcoin	sell	48851.46	3.42
245	9	Ethereum	buy	2306.03	9.55
246	6	Bitcoin	buy	44911.16	3.1199999999999997
234	4	Bitcoin	sell	48819.67	2.169999999999999
247	7	Bitcoin	sell	57332.36	8.72
248	4	Bitcoin	buy	40509.67	5.35
249	6	Bitcoin	sell	58243.77	4.46
192	6	Ethereum	sell	3436.45	4.959999999999998
\.


--
-- Data for Name: user_coins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_coins (user_id, coin, amount) FROM stdin;
11	Bitcoin	200000000
11	Ethereum	200000000
5	Ethereum	17.99
7	Bitcoin	24.75999999999999
10	Bitcoin	6.25
10	Ethereum	7.359999999999996
1	Bitcoin	10.879999999999997
5	Bitcoin	14.740000000000002
3	Ethereum	21.820000000000004
7	Ethereum	41.390000000000015
6	Bitcoin	39.31
9	Bitcoin	15.610000000000007
4	Bitcoin	32.794152590741554
8	Bitcoin	37.49584740925844
8	Ethereum	25.040000000000006
2	Ethereum	35.13
9	Ethereum	11.12
4	Ethereum	3.720000000000007
6	Ethereum	19.61
1	Ethereum	16.82
2	Bitcoin	14.619999999999997
3	Bitcoin	3.5399999999999974
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, username, balances) FROM stdin;
11	bob	100000000000000
3	bob	1881232.9731000005
7	bob	662496.5374999999
8	bob	80795.38579999999
2	bob	1296532.5928
9	bob	1206040.4232356814
4	bob	388840.0547643186
1	alice	1359490.2047
6	bob	115681.63460000003
10	bob	1689627.6474999995
5	bob	1319262.5460000003
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.products_id_seq', 251, true);


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

