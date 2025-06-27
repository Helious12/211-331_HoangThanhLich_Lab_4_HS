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
544	8	Bitcoin	sell	51206.62	4.7
167	8	Ethereum	sell	3709.06	3.3999999999999986
76	7	Ethereum	buy	2483.14	3.78
77	4	Bitcoin	buy	44394.84	7.03
9	8	Ethereum	buy	2078.91	3.12
80	8	Bitcoin	buy	40676.15	9.31
123	8	Ethereum	sell	3907.78	3.24
81	6	Ethereum	buy	2294.8	7.83
343	10	Bitcoin	sell	57787.85	2.74
15	2	Ethereum	buy	2117.85	6.45
346	5	Ethereum	buy	2210.94	1.83
84	1	Bitcoin	sell	57430.26	5.25
382	3	Bitcoin	sell	59328.18	9.87
547	1	Bitcoin	buy	42818.98	7.63
352	2	Bitcoin	sell	58240.22	2.35
355	6	Bitcoin	buy	41503.82	5.87
136	9	Ethereum	buy	2241.65	3.24
71	9	Ethereum	buy	2598.35	1.1600000000000046
137	9	Bitcoin	sell	56794.33	5.45
92	1	Ethereum	sell	3898.64	3.11
93	8	Ethereum	sell	3836.69	4.9
361	9	Bitcoin	buy	46616.47	1.71
553	5	Bitcoin	sell	59116.54	5.44
29	5	Ethereum	sell	3729.14	7.62
95	8	Bitcoin	sell	58524.3	9.59
34	6	Ethereum	buy	2362.94	7.95
35	6	Bitcoin	buy	40148.82	6.16
96	3	Ethereum	buy	2436.32	2.52
39	5	Bitcoin	buy	41058.23	1.76
42	6	Ethereum	buy	2025.82	9.37
33	2	Bitcoin	sell	56265.76	0.7800000000000011
45	4	Ethereum	sell	3764.3	4.89
101	10	Bitcoin	buy	41365.12	1.8
140	2	Bitcoin	sell	56398.83	3.13
379	4	Ethereum	buy	2176.9	2.25
50	10	Bitcoin	buy	41990	1.33
472	9	Bitcoin	buy	42862.09	2.6
51	3	Bitcoin	buy	40082.19	9.47
391	9	Ethereum	buy	2206.45	7.98
394	9	Bitcoin	buy	42469.56	2.92
430	8	Ethereum	buy	2521.2	2.08
108	1	Ethereum	buy	2192.28	4.88
445	1	Bitcoin	sell	59414.39	4.47
56	5	Ethereum	buy	2377.92	4.41
142	5	Bitcoin	sell	59944.4	2.32
400	3	Bitcoin	sell	58634.46	7.57
171	6	Bitcoin	buy	42641.5	9.21
172	9	Bitcoin	buy	42182.74	7.66
60	6	Bitcoin	buy	40849.53	7.06
61	2	Ethereum	buy	2039.37	9.21
62	10	Ethereum	buy	2180.85	1.52
403	10	Ethereum	buy	2587.55	9.63
415	1	Ethereum	sell	3855.34	5.51
143	2	Ethereum	buy	2024.07	2.01
478	3	Ethereum	sell	3706.08	3.12
421	3	Bitcoin	sell	56881.41	3.96
3	9	Ethereum	buy	2429.65	6.190000000000001
125	1	Bitcoin	sell	59240.84	5.08
484	10	Ethereum	sell	3729.83	7.64
112	7	Bitcoin	sell	58274.88	9.05
113	8	Ethereum	buy	2338.79	6.79
439	9	Ethereum	buy	2484.72	4.13
114	5	Bitcoin	buy	41931.68	2.6
173	2	Ethereum	sell	3782.62	5.89
119	2	Ethereum	buy	2185.76	6.87
120	1	Ethereum	buy	2089.66	6.75
340	10	Bitcoin	sell	56024.47	2.209999999999999
126	10	Bitcoin	sell	59077.14	8.18
454	4	Bitcoin	sell	57988.03	1.06
496	1	Bitcoin	buy	40617.89	6.09
161	7	Bitcoin	sell	57340.43	4.62
130	1	Bitcoin	buy	44153.83	8.87
132	6	Bitcoin	buy	41635.08	1.34
163	6	Bitcoin	sell	59638.73	6.3
144	7	Bitcoin	buy	40038.21	9.03
145	2	Bitcoin	buy	42408.38	6.4
146	3	Bitcoin	buy	41815.33	2.2
99	6	Ethereum	sell	3700.56	1.839999999999995
43	7	Ethereum	sell	3708.64	0.6999999999999988
148	2	Ethereum	buy	2332.45	1.4
460	8	Ethereum	sell	3769.26	1.15
150	2	Ethereum	sell	3725.64	9.95
466	1	Ethereum	buy	2250.34	1.78
175	9	Ethereum	buy	2314.07	8.29
469	3	Ethereum	sell	3791.68	2.3
152	7	Ethereum	buy	2357.82	4.44
499	10	Ethereum	sell	3640.27	6.27
176	1	Bitcoin	sell	56027.02	1.4993534743988122
154	1	Ethereum	buy	2010.36	4.65
502	7	Ethereum	buy	2193.51	8.15
508	5	Bitcoin	sell	56696.9	8.88
156	3	Bitcoin	buy	40681.41	7.64
165	5	Ethereum	sell	3809.77	5.53
166	6	Ethereum	sell	3982.53	6.44
520	1	Bitcoin	buy	42638.21	9.4
529	8	Ethereum	sell	3574.12	5.45
177	8	Ethereum	buy	2504.94	6.66
490	10	Bitcoin	sell	54654.21	1.870000000000001
179	7	Ethereum	buy	2736.64	2.83
181	9	Ethereum	buy	2281.23	5.13
184	10	Ethereum	buy	2070.64	5.05
545	4	Bitcoin	sell	58470.83	2.46
371	2	Bitcoin	buy	45306.76	4.4
187	3	Bitcoin	sell	57454.72	4.3
335	10	Bitcoin	sell	56851.44	8.52
554	3	Bitcoin	sell	57876.13	9.61
193	7	Bitcoin	sell	58304.85	4.37
558	10	Bitcoin	sell	52048.34	3.25
485	7	Bitcoin	buy	50916.23	4.626475728356735
377	10	Ethereum	buy	2061.03	1.82
259	3	Bitcoin	buy	45283.03	9.99
506	2	Bitcoin	buy	48562.43	1.928726972097876
560	5	Bitcoin	sell	53375.62	9.51
260	9	Ethereum	sell	3922.58	7.83
201	3	Ethereum	sell	3740.01	2.65
239	9	Ethereum	sell	3674.77	7.940000000000001
550	10	Bitcoin	buy	47074.62	4.014150773944198
82	8	Bitcoin	buy	44555.39	0.40415259074155285
563	3	Bitcoin	buy	43475.33	6.57
356	10	Ethereum	buy	2585.22	1.16
431	3	Ethereum	buy	2244.99	3.8
138	4	Bitcoin	buy	44399.52	1.6558474092584445
359	7	Ethereum	sell	3903.31	6.82
362	1	Ethereum	buy	2585.94	1.97
556	9	Ethereum	buy	2855.72	3.15
213	7	Ethereum	buy	2181.19	6.58
215	5	Ethereum	sell	3833.7	6.37
413	1	Bitcoin	sell	56892.07	6.41
565	8	Bitcoin	buy	47097.47	0.8899999999999997
442	9	Ethereum	sell	3571.04	1.509999999999999
365	9	Bitcoin	buy	43998.67	9.15
368	7	Ethereum	buy	2415.58	7.94
262	5	Bitcoin	sell	57719.73	1.22
263	6	Bitcoin	sell	58896.94	5.02
416	5	Ethereum	buy	2456.25	2.09
220	6	Bitcoin	sell	57676.59	4.68
222	4	Ethereum	buy	2128.51	9.8
223	4	Bitcoin	sell	58759	8.04
419	3	Ethereum	buy	2054.71	2.46
224	1	Bitcoin	sell	57091.65	8.38
389	7	Ethereum	buy	2627.13	3.18
392	8	Ethereum	sell	3881.14	4.39
395	6	Bitcoin	buy	40297.21	3.11
287	10	Ethereum	buy	2188.99	8.65
228	4	Bitcoin	sell	59651.35	3.49
267	8	Ethereum	buy	2316.95	9.94
237	1	Ethereum	buy	2060.16	9.91
479	2	Bitcoin	buy	46207.66	3.07
449	5	Bitcoin	sell	57384.45	9.72
289	9	Bitcoin	sell	56615.99	8.18
452	1	Ethereum	buy	2336.9	9.14
482	6	Ethereum	sell	3847.92	1.21
245	9	Ethereum	buy	2306.03	9.55
246	6	Bitcoin	buy	44911.16	3.1199999999999997
247	7	Bitcoin	sell	57332.36	8.72
248	4	Bitcoin	buy	40509.67	5.35
249	6	Bitcoin	sell	58243.77	4.46
455	4	Bitcoin	buy	41710.09	1.81
536	5	Ethereum	sell	3738.66	2.49
467	3	Ethereum	buy	2023.45	3.65
268	2	Ethereum	buy	2469.29	4.21
269	6	Bitcoin	sell	57162.67	5.5
270	7	Bitcoin	buy	41080.61	5.74
470	10	Ethereum	buy	2440.32	8.82
273	2	Ethereum	buy	2616.46	2.62
253	10	Bitcoin	buy	45639.37	5.199058022832848
286	7	Ethereum	buy	2763.04	3.5699999999999994
521	8	Bitcoin	sell	54879.17	4.09
279	8	Bitcoin	sell	59574.14	3.8
503	2	Ethereum	buy	2626.81	2.97
293	1	Bitcoin	buy	43047.35	6.19
295	1	Ethereum	buy	2220.19	2.73
524	5	Bitcoin	buy	46096.43	4.34
306	9	Ethereum	buy	2281.59	6.37
307	8	Bitcoin	buy	40314.35	1.46
308	8	Bitcoin	sell	56549.2	9.49
309	6	Bitcoin	sell	58018.98	1.71
256	7	Bitcoin	buy	45061.01	5.964416032621527
310	5	Ethereum	buy	2506.33	3.21
313	10	Ethereum	buy	2564.26	9.21
314	9	Ethereum	sell	3858.36	5.91
315	1	Ethereum	buy	2431.01	6.39
317	7	Ethereum	sell	3752.98	7.41
318	6	Bitcoin	buy	45427.69	6.38
534	5	Bitcoin	buy	41742.4	4.37
538	8	Bitcoin	buy	40841.29	4.85
540	3	Bitcoin	sell	56203.13	4.71
542	1	Ethereum	buy	2506.81	4.33
530	5	Bitcoin	sell	52395.43	6.529999999999999
552	6	Ethereum	buy	2705.33	1.05
324	1	Ethereum	buy	2327.29	9.89
327	9	Bitcoin	buy	44616.7	5.16
328	10	Bitcoin	sell	57299.59	2.29
557	8	Ethereum	buy	2547.08	4.04
330	1	Bitcoin	buy	42917.02	6.92
559	4	Ethereum	buy	2029.44	5
332	9	Ethereum	sell	3813.7	4.19
535	4	Bitcoin	buy	44670.2	5.42
333	1	Bitcoin	buy	43433.37	1.42
537	3	Ethereum	sell	3912.53	4.08
339	4	Bitcoin	buy	42156.19	1.15
345	8	Ethereum	buy	2326.64	1.99
342	7	Bitcoin	buy	45701.6	2.436525944545625
354	10	Ethereum	buy	2328.31	4.33
363	9	Ethereum	buy	2331.85	2.89
549	6	Bitcoin	sell	49351.11	0.29999999999999916
369	8	Ethereum	buy	2509.15	4.74
564	9	Ethereum	sell	3987.79	4.62
566	8	Bitcoin	buy	40673.06	9.19
543	5	Bitcoin	buy	46580.42	6.2
378	7	Ethereum	buy	2051.06	9.44
384	6	Bitcoin	buy	41616.25	8.37
387	7	Bitcoin	sell	57265.09	6.54
396	6	Bitcoin	buy	40628.3	7.23
408	7	Bitcoin	sell	59933.57	2.29
411	4	Bitcoin	buy	41550.52	3.44
414	2	Ethereum	sell	3842.7	8.93
423	2	Ethereum	buy	2479.74	7.77
426	2	Ethereum	sell	3864.66	9.46
435	1	Ethereum	buy	2111.32	7.44
438	4	Ethereum	buy	2544.29	9.45
444	6	Bitcoin	buy	44363.42	1.91
450	2	Bitcoin	sell	57263.13	1.88
453	9	Bitcoin	buy	45854.92	9.77
459	8	Ethereum	buy	2504.12	2.82
465	4	Bitcoin	buy	40696.63	2.8
468	3	Ethereum	sell	3841.17	1.52
471	1	Ethereum	buy	2296.36	9.18
486	6	Bitcoin	sell	57656.85	9.68
489	2	Ethereum	sell	3960.63	2.37
492	7	Ethereum	buy	2706.72	3.48
495	10	Ethereum	sell	3703.74	5.24
498	6	Ethereum	sell	3742	4.38
501	4	Bitcoin	buy	46777.23	3.34
507	9	Ethereum	sell	3888.3	6.71
516	2	Ethereum	sell	3778.25	1.21
525	8	Ethereum	buy	2432.62	4.34
\.


--
-- Data for Name: user_coins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_coins (user_id, coin, amount) FROM stdin;
11	Bitcoin	200000000
11	Ethereum	200000000
1	Ethereum	25.200000000000003
3	Bitcoin	28.900000000000006
2	Ethereum	18.980000000000004
5	Ethereum	10.330000000000009
7	Bitcoin	38.48258229447611
2	Bitcoin	40.80127302790212
5	Bitcoin	19.120000000000005
8	Ethereum	6.420000000000007
9	Bitcoin	4.369999999999992
6	Bitcoin	6.829999999999999
4	Bitcoin	1.7141525907415545
10	Ethereum	13.909999999999997
4	Ethereum	10.130000000000008
1	Bitcoin	33.31935347439881
10	Bitcoin	1.4367912032229517
8	Bitcoin	25.025847409258446
7	Ethereum	40.93000000000001
3	Ethereum	38.470000000000034
9	Ethereum	16.749999999999996
6	Ethereum	18.88
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, username, balances) FROM stdin;
11	bob	100000000000000
2	bob	-1.8189894035458565e-12
5	bob	1123133.500871248
4	bob	1959300.9149022687
1	alice	222803.19507542386
10	bob	1861357.1130939838
8	bob	871920.7742055893
7	bob	10513.258499999998
3	bob	555408.4269567264
6	bob	1737040.7238733517
9	bob	1658522.092521411
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.products_id_seq', 568, true);


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

