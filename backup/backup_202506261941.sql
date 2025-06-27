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
3382	9	Bitcoin	buy	48462.22	7.56
3387	10	Bitcoin	buy	59479.25	9.99
3509	4	Bitcoin	buy	47776.57	8.69
3262	2	Bitcoin	buy	45965.17	9.04
3514	8	Ethereum	buy	2384.15	1.24
3267	5	Bitcoin	buy	53973.27	2.95
3643	8	Bitcoin	buy	49523.28	8.41
3780	9	Ethereum	buy	2204.92	7.53
4320	7	Bitcoin	buy	48657.83	2.08
3287	3	Bitcoin	buy	58906.39	1.38
3397	7	Ethereum	buy	2595.04	1.96
3302	8	Bitcoin	buy	40568.11	8.94
3648	1	Bitcoin	buy	43908.99	4.22
3307	8	Bitcoin	buy	48934.17	4.18
3653	6	Ethereum	buy	2109.03	4.42
3402	8	Ethereum	buy	2307.71	7.38
3554	8	Ethereum	sell	3843.33	1.8799999999999994
3317	1	Bitcoin	buy	53337.05	8.69
3322	9	Ethereum	buy	2238.64	8.1
3895	9	Bitcoin	buy	57268.48	8.99
3407	8	Ethereum	buy	2295.14	1.29
3332	9	Bitcoin	buy	42001.83	9.03
3337	10	Bitcoin	buy	48439.18	8.05
3342	5	Ethereum	sell	3899.52	7.14
3412	9	Ethereum	buy	2484.05	8.08
3534	2	Bitcoin	buy	55333.33	5.91
4356	7	Ethereum	buy	2510.13	2.45
3663	4	Ethereum	sell	3948.56	4.87
3544	10	Bitcoin	buy	54069.71	2.96
3790	1	Bitcoin	buy	57252.96	7.74
3362	7	Bitcoin	buy	54061.11	2.2
3549	7	Bitcoin	buy	55170.94	8.1
3367	10	Bitcoin	buy	43079.29	3.32
3559	4	Bitcoin	buy	44716.95	3.26
3668	2	Bitcoin	buy	52160.06	6.66
3673	10	Ethereum	buy	2046.08	2.61
3678	2	Bitcoin	buy	51108.24	8.73
3417	9	Bitcoin	buy	50567.41	1.52
3569	4	Bitcoin	buy	50990.74	4.34
3427	7	Ethereum	buy	2400.2	8.66
3432	5	Bitcoin	buy	41650.46	1.71
3437	2	Bitcoin	buy	54401.57	9.97
3442	2	Bitcoin	buy	48379.28	4.29
3447	7	Bitcoin	buy	46364.33	1.78
3452	4	Ethereum	sell	3873.46	3.5
3683	5	Bitcoin	buy	56911.45	2.88
3457	4	Ethereum	sell	3880.75	7.32
3462	9	Bitcoin	buy	52096.44	3
3292	8	Ethereum	buy	2655.47	6.709999999999997
3900	4	Bitcoin	buy	47771.15	9.56
3472	8	Bitcoin	buy	47026.72	3.2
3477	7	Ethereum	buy	2169.71	6.95
3482	5	Ethereum	buy	2260.19	3.79
3905	3	Bitcoin	buy	48300.44	8.38
4327	5	Ethereum	buy	2114.01	9.31
3492	5	Bitcoin	buy	41372.9	1.43
3497	5	Bitcoin	buy	52548.44	4.97
3502	2	Bitcoin	buy	53126.94	3.45
3507	9	Ethereum	sell	3866.45	6.72
4715	3	Bitcoin	buy	48645.99	2.48
3584	5	Bitcoin	buy	51315.21	2.37
3589	10	Ethereum	buy	2679.91	8.27
3594	3	Ethereum	buy	2537.22	3.44
3910	7	Bitcoin	buy	42883.11	5.61
3604	10	Bitcoin	buy	50648.18	5.6
3805	3	Ethereum	buy	2217.82	8.7
3614	3	Ethereum	buy	2284.28	3.96
4341	4	Bitcoin	buy	43793.03	2.97
3915	5	Bitcoin	buy	56037.79	3.71
3815	7	Bitcoin	buy	56364.85	5.2
4348	10	Ethereum	buy	2710.09	2.04
4353	6	Bitcoin	buy	40597.71	9.3
5121	4	Bitcoin	buy	59872.08	5.3
3634	4	Bitcoin	buy	59155.08	5.64
3639	2	Ethereum	buy	2105.73	9.65
3693	1	Bitcoin	buy	57601.54	9.53
3698	9	Ethereum	buy	2705.94	2.41
3703	6	Ethereum	buy	2393.06	4.45
3708	6	Bitcoin	buy	52256.38	2.08
4364	10	Bitcoin	buy	44816.5	8.15
3713	1	Bitcoin	buy	43683.63	1.92
3718	2	Bitcoin	buy	51869.54	3.6
3723	7	Ethereum	buy	2251.42	3.73
3830	6	Ethereum	buy	2147.11	1.8
3930	6	Bitcoin	buy	44566.21	4.26
3733	2	Bitcoin	buy	45727.25	8.92
3835	10	Ethereum	buy	2657.35	6.6
3743	3	Ethereum	buy	2508.08	5.45
4368	8	Ethereum	buy	2585.82	7.5
4725	8	Ethereum	sell	3884.77	2.9
3753	2	Ethereum	sell	3906.83	2.65
4375	9	Ethereum	buy	2138.75	8.64
4379	2	Bitcoin	buy	40145.29	5.94
3935	5	Bitcoin	buy	59670.52	6.41
3778	3	Bitcoin	buy	59218.43	6.43
3845	1	Ethereum	buy	2004.41	2.58
3985	6	Bitcoin	buy	40059.93	5.89
3865	8	Bitcoin	buy	50445.55	9.14
3870	7	Ethereum	sell	3801.94	6.01
3875	6	Bitcoin	buy	50258.46	5.78
3880	2	Ethereum	buy	2033.56	1.47
3885	1	Bitcoin	buy	45370.79	7.01
3945	9	Bitcoin	buy	48974.11	7.7
4018	9	Ethereum	buy	2613.49	7.54
3950	10	Bitcoin	buy	42791.02	3.24
3955	1	Bitcoin	buy	50991.5	5.63
4034	3	Bitcoin	buy	40238.43	6.98
3970	6	Bitcoin	buy	48421.95	9.86
3975	7	Ethereum	buy	2416.22	1.83
3980	9	Bitcoin	buy	53449.96	8.99
3995	1	Ethereum	buy	2275.27	5.26
4010	5	Bitcoin	buy	51534.24	8.18
4026	4	Ethereum	buy	2537.1	1.73
4030	10	Ethereum	buy	2056.26	4.57
4040	3	Bitcoin	buy	59746.04	3.3
4044	3	Bitcoin	buy	52882.73	8.77
4047	4	Bitcoin	buy	52900.53	4.91
4052	3	Bitcoin	buy	57268.41	3.09
3383	8	Ethereum	buy	2394.21	6.34
3388	2	Ethereum	buy	2409.4	5.79
4055	1	Bitcoin	buy	43134.31	9.83
3398	2	Ethereum	buy	2619.36	3.43
3263	5	Ethereum	sell	3864.17	6.31
3644	7	Ethereum	buy	2407.66	7.5
3268	10	Ethereum	sell	3851.67	5.42
3273	2	Bitcoin	buy	49370.3	4.67
3278	3	Bitcoin	buy	48341.42	1.15
3283	10	Ethereum	buy	2148.95	7.87
3288	6	Bitcoin	buy	58533.75	9.26
3293	5	Bitcoin	buy	48285.5	1.85
3298	9	Bitcoin	buy	50963.84	2
3303	8	Bitcoin	buy	53834.57	3.36
3308	7	Bitcoin	buy	41698.92	3.29
3408	2	Bitcoin	buy	43472.36	1.7
3515	8	Bitcoin	buy	59648.15	9.96
3520	2	Ethereum	sell	3894.82	6.07
3323	5	Bitcoin	buy	47145.49	4.8
3525	9	Ethereum	buy	2103.38	5.48
3333	8	Bitcoin	buy	49918	2.22
3338	7	Bitcoin	buy	57029.79	9.76
3343	9	Bitcoin	buy	59435.48	6.86
3348	10	Bitcoin	buy	52849.7	5.93
3353	7	Bitcoin	buy	58667.6	6.41
3358	7	Bitcoin	buy	57670.84	8.23
3530	10	Bitcoin	buy	54410.09	6.17
3368	7	Bitcoin	buy	57164.3	4.08
3786	7	Bitcoin	buy	57385.31	7.14
3654	10	Bitcoin	buy	48923.14	6.24
3545	5	Bitcoin	buy	52083.58	6.18
3418	5	Bitcoin	buy	49217.14	4.62
3423	6	Bitcoin	buy	49199.33	7.84
3428	3	Bitcoin	buy	41622.25	2.53
3659	8	Bitcoin	buy	48296.19	5.23
3550	7	Ethereum	buy	2627.07	8.45
3555	4	Ethereum	buy	2110.06	4.98
3560	9	Bitcoin	buy	53608.26	4.05
3443	6	Bitcoin	buy	43847	5.93
3565	5	Bitcoin	buy	56474.45	9.03
3791	6	Bitcoin	buy	53515.76	6.71
3664	10	Bitcoin	buy	47204.94	9.89
3575	10	Bitcoin	buy	51138.92	4.56
3580	10	Bitcoin	buy	52810.92	6.45
3458	5	Ethereum	buy	2472.15	4.08
3463	3	Ethereum	buy	2338.42	1.96
3468	3	Bitcoin	buy	52911.29	2.75
3473	3	Bitcoin	buy	43268.69	3.86
3478	6	Ethereum	sell	3972.1	5.98
3669	4	Ethereum	buy	2534.19	1.19
3483	7	Ethereum	buy	2241.45	6.52
3488	6	Bitcoin	buy	41870.19	7.06
3674	10	Ethereum	buy	2648.12	7.83
3679	10	Ethereum	buy	2205.71	7.65
3498	2	Bitcoin	buy	43244.07	2.29
3503	9	Ethereum	buy	2505.26	1.48
3508	7	Bitcoin	buy	46408.55	9.31
3684	6	Ethereum	buy	2042.21	7.55
3590	4	Bitcoin	buy	51514.34	9.81
3595	5	Ethereum	buy	2028.41	1.08
3600	8	Bitcoin	buy	42507.68	5.52
3605	1	Bitcoin	buy	52694.94	1.11
3610	4	Bitcoin	buy	48904.06	7.52
3615	9	Bitcoin	buy	53177.96	4.03
3620	3	Bitcoin	buy	59594.8	1.68
3625	8	Bitcoin	buy	45430.82	5.79
3630	9	Bitcoin	buy	55888.34	8.19
3635	2	Ethereum	buy	2312.35	5.62
3640	3	Bitcoin	buy	53179.44	5.35
3433	9	Bitcoin	buy	59762.99	4.46
3689	2	Bitcoin	buy	57071.35	8.92
3796	5	Ethereum	buy	2578.39	9.38
3699	1	Bitcoin	buy	57045.75	7.38
3704	1	Ethereum	buy	2230.03	5.87
3709	6	Bitcoin	buy	59031.71	5.03
3714	3	Bitcoin	buy	48608.92	4.66
3719	3	Bitcoin	buy	51264.41	5.72
3724	9	Ethereum	sell	3917.72	2.75
3729	3	Bitcoin	buy	44676.6	5.24
3734	7	Bitcoin	buy	57310.43	7.4
3801	2	Bitcoin	buy	40351.5	8.33
3806	5	Bitcoin	buy	58796.7	8.3
4716	8	Ethereum	buy	2115.45	6.63
3749	8	Bitcoin	buy	59550.43	2.8
3754	9	Bitcoin	buy	52025.36	4.2
3759	4	Bitcoin	buy	55549.95	2.12
3764	8	Ethereum	buy	2617.71	2.9
3769	8	Ethereum	buy	2444.93	1.72
5122	2	Bitcoin	buy	41942.44	1.57
4735	4	Bitcoin	buy	57694.82	2.11
3901	6	Ethereum	buy	2116.4	1.54
3779	7	Ethereum	buy	2384.08	5.89
3816	8	Ethereum	buy	2255.39	9.58
4328	8	Bitcoin	buy	49767.92	2.42
3826	6	Bitcoin	buy	48864.33	9.46
4335	6	Bitcoin	buy	47419.62	4.91
4742	8	Bitcoin	buy	40775.9	2.8
3841	8	Ethereum	buy	2290.12	5.04
3846	5	Ethereum	buy	2536.94	1.02
3856	4	Ethereum	buy	2195.47	5.79
5132	2	Ethereum	sell	3928.91	6.76
3866	3	Ethereum	buy	2466.18	3.03
3871	6	Bitcoin	buy	47582.23	9.43
3886	5	Bitcoin	buy	52095.13	9.47
3891	7	Bitcoin	buy	55114.3	3.93
3956	7	Bitcoin	buy	50367.04	3.49
3911	7	Ethereum	buy	2535.95	9.87
3916	9	Ethereum	buy	2326.53	1.6
3921	8	Bitcoin	buy	52684.28	1.61
3926	10	Ethereum	buy	2574.34	2.42
3996	3	Ethereum	buy	2348.09	3.04
3936	4	Bitcoin	buy	56293.88	6
3946	10	Bitcoin	buy	53853.28	8
3966	10	Ethereum	buy	2657.35	8.44
3971	8	Bitcoin	buy	52584.67	1.27
3976	2	Bitcoin	buy	47616.62	4.98
3981	2	Bitcoin	buy	47598.68	1.18
4001	4	Bitcoin	buy	55226.05	6.03
3511	6	Bitcoin	buy	40414.66	2.87
3516	7	Bitcoin	buy	57582.71	8.97
3259	2	Bitcoin	buy	54034.2	8.21
3264	7	Bitcoin	buy	46904.6	5.81
3269	8	Bitcoin	buy	58911.33	3.78
3394	9	Ethereum	buy	2605.99	6.23
3399	8	Bitcoin	buy	55177.31	1.05
3645	7	Ethereum	sell	3932.73	6.02
3409	5	Ethereum	buy	2610.53	8.85
3284	5	Bitcoin	buy	51721.07	3.18
3289	10	Bitcoin	buy	41149.66	9.27
3294	4	Bitcoin	buy	50740.56	1.6
3299	4	Bitcoin	buy	43222.2	7.27
3304	7	Ethereum	buy	2107.11	3.28
3309	6	Bitcoin	buy	54737.56	8.8
3414	1	Bitcoin	buy	57958.9	9.1
3314	4	Bitcoin	buy	52465.24	3.95
3650	7	Ethereum	buy	2481.04	5.99
3324	3	Bitcoin	buy	54756.46	1.95
3424	2	Ethereum	buy	2640.95	1.86
3782	10	Bitcoin	buy	59749.94	7.91
3429	7	Ethereum	sell	3998.85	4.72
3531	4	Ethereum	buy	2584.38	9.9
3339	4	Bitcoin	buy	48343.14	3.75
3434	10	Ethereum	buy	2021.23	6.18
3344	10	Bitcoin	buy	40855.62	2.55
3536	7	Bitcoin	buy	57975.26	5.01
3541	9	Ethereum	buy	2350.18	2.54
3354	6	Bitcoin	buy	59520.02	1.41
3787	9	Bitcoin	buy	50711.6	5.26
3792	1	Ethereum	buy	2068.45	5.96
4322	2	Ethereum	sell	3846.17	2.97
3369	8	Ethereum	buy	2326.31	1.9
3374	10	Bitcoin	buy	45245.97	2
3379	8	Bitcoin	buy	56495.89	3.85
3439	5	Bitcoin	buy	43905.27	9.17
3551	10	Bitcoin	buy	59607.09	5.6
3449	10	Ethereum	buy	2299.67	9.63
3556	8	Ethereum	buy	2611.21	3.25
3454	9	Bitcoin	buy	51398.98	4.31
3459	1	Bitcoin	buy	57391.35	8.09
3561	8	Bitcoin	buy	44797.83	5.65
3566	4	Bitcoin	buy	59149.95	1.81
3469	8	Bitcoin	buy	48866.87	9.13
3474	1	Ethereum	buy	2172.2	4.33
3479	1	Ethereum	buy	2550.88	2.84
3484	10	Ethereum	buy	2350.39	1.5
4717	4	Ethereum	buy	2699.78	8.35
3489	7	Bitcoin	buy	53892.38	8.6
3494	10	Bitcoin	buy	47898.21	2.48
3802	7	Ethereum	sell	3998.73	6.58
3504	2	Bitcoin	buy	51017.63	4.01
3576	9	Ethereum	buy	2287.62	7.26
3952	6	Bitcoin	buy	46522.57	1.93
3586	10	Ethereum	buy	2002.45	4.43
5123	1	Ethereum	buy	2249.96	1.01
3591	5	Bitcoin	buy	49986.59	1.86
3596	7	Bitcoin	buy	49526.68	5.95
3601	9	Ethereum	buy	2458.15	4.82
3665	9	Bitcoin	buy	47704.67	3.01
3611	3	Bitcoin	buy	48813.33	1.39
3616	4	Bitcoin	buy	56831.59	8.9
3897	5	Bitcoin	buy	59162.49	8.01
3621	9	Ethereum	buy	2466.09	3.17
3807	8	Bitcoin	buy	50009.28	3.99
3626	8	Bitcoin	buy	58682.2	2.26
3631	8	Bitcoin	buy	50206.11	4.44
3636	4	Ethereum	buy	2330	5.27
3641	8	Ethereum	sell	3847.14	2.17
3670	3	Bitcoin	buy	55707.02	5.58
3812	1	Bitcoin	buy	56689.23	8.28
3680	5	Bitcoin	buy	44179.19	1.49
3685	9	Ethereum	buy	2024.4	7.98
4343	3	Bitcoin	buy	42367.26	9.18
3987	6	Ethereum	buy	2688.4	2.76
3695	8	Ethereum	buy	2550.74	4.36
4349	4	Bitcoin	buy	48479.44	9.08
3705	5	Ethereum	buy	2646.67	4.91
3710	5	Bitcoin	buy	48710.55	8.3
3902	3	Bitcoin	buy	53784.88	9.64
3715	6	Bitcoin	buy	49569.99	9.44
5133	7	Ethereum	buy	2154.97	6.2
3720	7	Bitcoin	buy	40905.32	2.8
3725	5	Bitcoin	buy	44375.16	8.43
4045	9	Bitcoin	buy	59837.32	6.62
3735	1	Bitcoin	buy	48888.19	7.36
5139	10	Ethereum	buy	2834	8.5
3912	8	Bitcoin	buy	55523.22	2.85
3745	3	Bitcoin	buy	41024.29	8.94
3827	7	Bitcoin	buy	49960.6	3.5
3917	7	Ethereum	sell	3799.16	0.6300000000000328
6337	7	Bitcoin	buy	59839.98	9.62
3765	8	Bitcoin	buy	42771.75	8.73
3770	5	Bitcoin	buy	44703.92	6.14
3957	2	Bitcoin	buy	59584.97	5.47
3847	9	Bitcoin	buy	59448.78	5.17
3852	10	Bitcoin	buy	50912.86	7.28
3867	9	Ethereum	sell	3954.74	1.19
3922	7	Bitcoin	buy	46166.58	6.15
3962	6	Bitcoin	buy	59034.22	5.31
3872	2	Ethereum	buy	2192.75	5.05
3882	2	Bitcoin	buy	45765.19	3.49
3927	3	Ethereum	buy	2514.41	4.3
3932	6	Bitcoin	buy	55271.85	6.08
3937	9	Bitcoin	buy	43031.11	5.16
3942	5	Bitcoin	buy	46735.4	3.55
3947	10	Bitcoin	buy	59803.15	3.52
3992	5	Bitcoin	buy	48253.64	1.51
4002	3	Bitcoin	buy	50720.17	3.04
4007	5	Bitcoin	buy	55997.1	2.38
4011	9	Ethereum	buy	2559.62	8.53
4015	9	Bitcoin	buy	53510.91	7.41
4019	3	Bitcoin	buy	57401.21	5.31
4023	5	Ethereum	buy	2667.11	4.77
4031	9	Ethereum	buy	2228.65	5.44
4035	7	Bitcoin	buy	50029.74	5.56
4038	8	Bitcoin	buy	47147.61	9.65
4041	10	Bitcoin	buy	55313.12	8.95
4048	7	Bitcoin	buy	55634.95	8.27
3385	8	Bitcoin	buy	52522.18	5.84
3255	10	Bitcoin	buy	59504.42	0.020000000000000018
3646	9	Bitcoin	buy	51773.36	7.02
3265	10	Bitcoin	buy	40674.27	7.29
3651	5	Bitcoin	buy	47132.04	6.71
3395	10	Bitcoin	buy	51683.69	9.13
3280	4	Bitcoin	buy	42935.57	4.45
3400	9	Bitcoin	buy	50984.02	6.84
3783	4	Ethereum	buy	2626.58	6.92
3285	7	Ethereum	buy	2609.42	3.3000000000000007
3290	5	Bitcoin	buy	44916.7	3.34
3295	10	Ethereum	buy	2606.64	4.37
3300	6	Bitcoin	buy	45335.6	3.19
3410	10	Bitcoin	buy	41568.11	5.79
3310	3	Bitcoin	buy	52736.8	8.84
3315	1	Bitcoin	buy	47864.08	7.4
3656	4	Bitcoin	buy	56635.69	6.2
3320	6	Bitcoin	buy	40913.36	7.25
5672	3	Ethereum	buy	2303.47	9.33
3420	1	Bitcoin	buy	59338.85	1.7
3425	1	Ethereum	buy	2610.15	1.7
3335	7	Bitcoin	buy	44852.01	9.58
3340	6	Bitcoin	buy	54607.59	3.4
3430	1	Bitcoin	buy	46213.33	1.34
3350	8	Bitcoin	buy	52118.67	5.11
3666	3	Bitcoin	buy	43244.25	7.03
3537	7	Bitcoin	buy	57441.3	9
3365	1	Bitcoin	buy	48280.2	2.97
3370	7	Bitcoin	buy	58544.61	7.38
3542	4	Ethereum	buy	2125.34	1.51
3788	10	Bitcoin	buy	50857.41	6.3
3547	2	Ethereum	buy	2145.44	2.7
3380	8	Bitcoin	buy	44342.67	7.95
3435	3	Ethereum	buy	2564.89	8.8
3552	5	Bitcoin	buy	41629	4.42
3440	5	Bitcoin	buy	53542.08	5.63
3445	8	Bitcoin	buy	56632.91	2.44
3450	8	Bitcoin	buy	45490.78	5.15
3671	1	Bitcoin	buy	40391.6	1.24
3455	6	Bitcoin	buy	48242.56	4.27
3460	10	Bitcoin	buy	47893.65	1.76
3465	6	Bitcoin	buy	47056.11	9.74
3470	6	Bitcoin	buy	44231.3	2.71
3475	9	Bitcoin	buy	44174.36	8.98
3676	5	Bitcoin	buy	40334.98	3.58
3485	4	Bitcoin	buy	45940.05	3.44
3490	10	Ethereum	sell	3940.53	2.94
3495	2	Bitcoin	buy	42868.91	6.74
3681	1	Bitcoin	buy	46150.38	7.66
3627	7	Ethereum	buy	2672.57	1.54
4718	7	Ethereum	sell	3972.51	8.88
3686	8	Bitcoin	buy	48143.99	8.31
3557	4	Bitcoin	buy	45616.41	4.25
3562	5	Bitcoin	buy	41593.58	8.35
3691	6	Ethereum	buy	2167.25	4.41
3567	10	Ethereum	sell	3885.64	1.91
3696	4	Bitcoin	buy	47992.74	1.18
3572	10	Ethereum	sell	3885.38	1.39
3701	10	Bitcoin	buy	57581.28	5.6
3577	3	Bitcoin	buy	51728.41	1.09
3706	4	Ethereum	buy	2079.26	7.56
3582	10	Bitcoin	buy	56743.01	5.28
3587	6	Bitcoin	buy	45593.46	9.68
3711	3	Bitcoin	buy	55840.25	3.32
3716	1	Bitcoin	buy	40964.83	7.69
3721	6	Bitcoin	buy	59822.02	2.58
5124	7	Bitcoin	buy	51843.29	8.18
4743	9	Ethereum	buy	2166.15	3.01
5134	9	Bitcoin	buy	51808.14	1.43
3612	3	Ethereum	buy	2586.19	9.88
3617	1	Bitcoin	buy	43941.09	4.02
3622	4	Bitcoin	buy	53858.41	5.37
3798	10	Bitcoin	buy	59680.05	3.88
3632	7	Bitcoin	buy	53746.72	1.75
3637	2	Bitcoin	buy	44776.1	7.27
3642	1	Bitcoin	buy	58291.28	7.49
3726	1	Bitcoin	buy	43523.44	1.38
3803	3	Bitcoin	buy	56115.08	2.16
3736	10	Ethereum	buy	2119.14	7.82
3808	1	Bitcoin	buy	47960.6	7.53
3741	8	Ethereum	buy	2410.6	7.37
3746	1	Bitcoin	buy	47756.91	9.98
3928	4	Bitcoin	buy	54919.88	4.58
5683	9	Ethereum	sell	3790.26	2.11
4736	4	Ethereum	sell	3834.03	8.4
4357	4	Bitcoin	buy	53615.82	4.73
3756	8	Bitcoin	buy	47733.31	6.4
4337	1	Bitcoin	buy	48551.86	1.94
3766	8	Ethereum	buy	2300.34	6.61
4751	2	Bitcoin	buy	55363.83	6.93
4758	2	Bitcoin	buy	52697.43	6.66
4361	4	Bitcoin	buy	53771.57	7.59
4365	1	Bitcoin	buy	46580.52	4.19
4764	7	Bitcoin	buy	55692.08	3.9
3828	2	Ethereum	buy	2012.23	9.99
5694	9	Bitcoin	buy	51460.9	6.77
3833	4	Bitcoin	buy	57695.88	9.54
3838	1	Bitcoin	buy	49742.23	1.68
3843	8	Ethereum	buy	2466.49	7.72
3853	6	Bitcoin	buy	58482.34	8.12
3858	8	Ethereum	buy	2283.53	5.57
5146	2	Bitcoin	buy	42552.77	2.87
3878	3	Bitcoin	buy	44147.77	7.26
3938	8	Bitcoin	buy	43098.15	1.88
3883	9	Bitcoin	buy	48017.73	2.22
3943	10	Ethereum	buy	2111.62	7.19
4380	3	Bitcoin	buy	50853.68	6.59
4384	4	Ethereum	buy	2060.39	4.7
3913	4	Bitcoin	buy	52330.89	7.45
3923	8	Ethereum	buy	2074.81	8.54
3953	5	Bitcoin	buy	42311.92	9.15
3963	9	Bitcoin	buy	43428.27	2.02
3968	1	Bitcoin	buy	55113.87	5.18
4003	7	Bitcoin	buy	47176.24	6.77
4012	3	Ethereum	buy	2683.81	5.7
3988	9	Bitcoin	buy	40670.54	8.28
4008	9	Bitcoin	buy	55316.99	4.71
4016	3	Bitcoin	buy	58105.62	2.28
4024	8	Bitcoin	buy	50997.19	8.93
3251	1	Bitcoin	sell	61000	1
3256	4	Bitcoin	buy	56868.17	8.26
3261	5	Bitcoin	buy	56796.93	5.6
3784	8	Bitcoin	buy	43042.48	6.51
3391	3	Bitcoin	buy	50822.81	3.15
3396	2	Bitcoin	buy	50198.59	4
3276	9	Bitcoin	buy	55626.76	3.55
3281	2	Bitcoin	buy	42961.42	5.39
3286	9	Bitcoin	buy	55262.45	5.81
3518	2	Ethereum	sell	3976.53	1.99
3401	5	Bitcoin	buy	58241.25	9.99
3406	1	Ethereum	buy	2079.03	4.92
3647	8	Bitcoin	buy	55545.76	6.76
3416	8	Ethereum	buy	2299.16	5.8
3301	2	Ethereum	buy	2089.36	5.92
3306	9	Bitcoin	buy	42835.24	4.03
3311	8	Bitcoin	buy	51936.46	8.82
3652	3	Ethereum	buy	2181.4	5.06
3421	10	Bitcoin	buy	42060.3	3.91
3523	5	Ethereum	sell	3950.04	2.57
3528	1	Ethereum	buy	2424.78	3.09
3533	7	Bitcoin	buy	49733.5	5.82
3431	7	Bitcoin	buy	41132.84	3.68
3331	4	Bitcoin	buy	59601.04	7.23
3657	2	Bitcoin	buy	49845.46	7.76
3336	2	Bitcoin	buy	58608.92	7.29
3341	7	Bitcoin	buy	51530.23	1.58
3789	9	Ethereum	buy	2485.7	7.06
3351	1	Ethereum	buy	2490.54	2.67
3356	3	Bitcoin	buy	49979.81	4.24
3361	5	Bitcoin	buy	50019.36	8.09
3543	2	Bitcoin	buy	58809.45	3.45
3371	1	Bitcoin	buy	47755.02	5.98
3376	1	Ethereum	buy	2192.62	5.74
3381	1	Bitcoin	buy	51091.17	6.36
3441	7	Bitcoin	buy	55375.23	8.09
3794	5	Bitcoin	buy	47357.3	3.22
3548	1	Bitcoin	buy	41600.27	7.39
3553	4	Ethereum	buy	2054.32	1.44
3558	10	Bitcoin	buy	49712.56	1.03
3563	6	Bitcoin	buy	44668.75	6.07
3568	7	Bitcoin	buy	44947.05	7.38
3456	6	Bitcoin	buy	41892.57	6.74
4324	4	Bitcoin	buy	57812.47	5.4
3672	10	Ethereum	buy	2056.79	9.49
3466	9	Bitcoin	buy	52753.25	3.12
3471	8	Bitcoin	buy	56382.61	4.37
4331	8	Ethereum	buy	2052.62	3.34
3573	7	Bitcoin	buy	48323.46	5.5
3677	6	Ethereum	buy	2157.67	9.83
3481	7	Bitcoin	buy	40711.11	7.98
3682	7	Bitcoin	buy	56918.38	9.22
3491	10	Bitcoin	buy	55756.7	2.79
3496	1	Bitcoin	buy	52974.36	1.34
3687	2	Bitcoin	buy	47881.26	8.3
3692	4	Bitcoin	buy	59564.23	8.93
3501	6	Bitcoin	buy	50723.25	5.94
3697	1	Bitcoin	buy	44474.98	5.14
3899	5	Bitcoin	buy	52733.97	1.05
3578	1	Bitcoin	buy	50028.63	8.57
4338	7	Bitcoin	buy	56701.51	5.88
3814	10	Bitcoin	buy	54509.96	9.78
4345	6	Bitcoin	buy	50278.33	1.15
3598	9	Ethereum	buy	2604.77	7.16
4719	5	Bitcoin	buy	44928.2	6.49
3608	6	Bitcoin	buy	46471.19	5.03
3702	3	Ethereum	sell	3906.9	8.73
3707	5	Bitcoin	buy	49360.01	3.83
3613	4	Bitcoin	buy	53059.12	9.55
3618	4	Bitcoin	buy	57836.95	5.58
3346	8	Bitcoin	buy	59822.89	1.7900000000000003
3824	10	Bitcoin	buy	45269.61	3.68
3829	3	Ethereum	buy	2211.02	6.56
3628	10	Bitcoin	buy	42254.04	9.99
3994	6	Bitcoin	buy	49023.62	8.18
3638	7	Bitcoin	buy	40703.87	4.7
3712	7	Bitcoin	buy	40473.09	2.24
4729	6	Bitcoin	buy	44097.11	7.36
4744	2	Bitcoin	buy	51490.74	7.08
3727	2	Bitcoin	buy	48263.11	5.56
4737	5	Bitcoin	buy	56253.68	5.79
3742	10	Bitcoin	buy	56288.45	3.87
3747	5	Ethereum	sell	3913.26	6.67
3752	10	Bitcoin	buy	42640.69	1.15
3762	6	Bitcoin	buy	53177.93	6.53
3914	10	Ethereum	buy	2031.61	4.88
3777	5	Ethereum	buy	2242.56	1.43
3839	6	Bitcoin	buy	58465.14	4.91
3844	8	Bitcoin	buy	43261.53	9.26
3849	10	Bitcoin	buy	57176.47	7.73
3854	5	Bitcoin	buy	57241.8	4.54
3939	5	Bitcoin	buy	50175.87	6.18
3869	4	Ethereum	buy	2175.2	8.01
3874	6	Bitcoin	buy	51702.63	6
3879	4	Ethereum	buy	2235.95	8.55
3944	8	Bitcoin	buy	43268.08	9.41
3949	6	Bitcoin	buy	40247.11	3.19
3954	10	Ethereum	sell	3869.84	1.81
3889	6	Ethereum	buy	2055.16	6.34
3964	3	Bitcoin	buy	53098.53	8.03
3929	4	Bitcoin	buy	58831.79	6.35
3934	10	Bitcoin	buy	59563.81	8.02
3969	2	Bitcoin	buy	41520.22	4.66
3974	8	Ethereum	buy	2691.1	5.96
3979	7	Ethereum	buy	2551.8	3.17
3984	1	Ethereum	buy	2215.76	1.26
3989	7	Bitcoin	buy	57167.83	4.08
4039	6	Bitcoin	buy	48722.45	4.86
4004	8	Ethereum	buy	2437.8	2.79
4033	5	Bitcoin	buy	47818.53	6.75
4009	1	Ethereum	buy	2583.62	6.45
4013	9	Ethereum	buy	2148.83	8.13
4025	3	Bitcoin	buy	48014.82	9.77
4036	3	Ethereum	buy	2237.43	9.44
4043	7	Bitcoin	buy	56199.3	9.42
4046	3	Bitcoin	buy	55274.11	9.15
4049	4	Bitcoin	buy	50376.63	6.21
4053	6	Bitcoin	buy	52109.74	8.23
4720	6	Bitcoin	buy	50856.28	7
4745	1	Bitcoin	buy	53577.83	9.01
4057	8	Bitcoin	buy	54237.65	6.12
4058	2	Ethereum	buy	2417.29	5.08
4059	9	Bitcoin	buy	46706.96	4.8
4060	7	Bitcoin	buy	54601.14	9.52
4062	6	Bitcoin	buy	41277.74	3.9
4404	8	Ethereum	buy	2279.24	6.22
4332	8	Bitcoin	buy	46240.47	1.35
4065	6	Bitcoin	buy	48426	4.59
4066	6	Bitcoin	buy	56156.58	7.7
4377	1	Bitcoin	buy	57054.15	1.41
4068	6	Bitcoin	buy	40211	2.86
4069	2	Bitcoin	buy	44143.05	9.56
4070	10	Bitcoin	buy	50898.78	3.51
4071	7	Ethereum	buy	2414.15	5.39
4759	3	Bitcoin	buy	58413.98	4.08
4346	2	Bitcoin	buy	43101.88	9.55
4073	7	Ethereum	buy	2018.8	3.02
4074	7	Ethereum	sell	3812.38	4.46
4075	7	Ethereum	buy	2692.94	1.49
4076	9	Bitcoin	buy	44735.99	7.31
4077	7	Bitcoin	buy	40919.12	8.37
4078	1	Ethereum	buy	2036.01	7.34
4079	10	Bitcoin	buy	48403.33	2.45
4080	6	Bitcoin	buy	50505.44	6.15
4081	8	Bitcoin	buy	46910.56	1.65
4082	10	Bitcoin	buy	47718.21	5.67
4147	9	Bitcoin	buy	54120.54	4.67
4362	9	Ethereum	sell	3971.59	3.41
4084	6	Bitcoin	buy	46310.06	8.12
5673	6	Bitcoin	buy	45213.12	7.08
4148	9	Bitcoin	buy	52128.01	3.16
4351	6	Ethereum	buy	2633.23	3.5
4087	6	Bitcoin	buy	59702.65	6.46
4088	9	Ethereum	sell	3969.1	4.36
4354	2	Bitcoin	buy	51886.63	9
4090	3	Bitcoin	buy	55466.59	7.86
4366	4	Bitcoin	buy	55202.74	4.07
6338	1	Bitcoin	buy	53648.88	4.11
4092	5	Bitcoin	buy	50896.81	5.64
4093	2	Bitcoin	buy	51210.75	3.69
4370	9	Bitcoin	buy	57427.62	7.44
4163	7	Bitcoin	buy	58317.54	5.04
4095	8	Bitcoin	buy	49280.4	9.75
4096	1	Bitcoin	buy	47133.71	8.8
4097	1	Bitcoin	buy	48839.65	5.69
4098	9	Bitcoin	buy	51559.88	3.15
4150	4	Bitcoin	buy	51701.23	6.9
4752	3	Bitcoin	buy	59892.57	2.11
4100	1	Bitcoin	buy	48896.95	9.57
4101	10	Bitcoin	buy	44962.18	2.08
4151	5	Bitcoin	buy	55956.39	2.34
6349	2	Ethereum	buy	2341.55	8.82
4385	8	Bitcoin	buy	45248.5	9.46
4104	9	Bitcoin	buy	40369.05	9.07
4152	7	Ethereum	buy	2534.19	7.9
4387	2	Bitcoin	buy	46748	2.65
4389	5	Bitcoin	buy	59727.16	1.39
4390	10	Bitcoin	buy	48798.73	8.58
4108	9	Bitcoin	buy	56561.6	2.99
4392	2	Bitcoin	buy	53308.05	6.61
4738	2	Bitcoin	buy	49337.53	6.73
4394	5	Bitcoin	buy	51817.94	2.92
4410	2	Bitcoin	buy	59952.28	3.45
4113	5	Bitcoin	buy	49538.74	5.72
4114	4	Ethereum	sell	3865.79	7.51
4115	6	Bitcoin	buy	59669.7	5.14
4116	7	Bitcoin	buy	41022.6	3.9
4061	6	Ethereum	sell	3819.53	2.299999999999934
4118	2	Ethereum	sell	3944.08	8.79
4119	3	Bitcoin	buy	46501.43	7.64
4120	5	Bitcoin	buy	49416.72	5.99
4121	2	Bitcoin	buy	50162.17	7.49
4164	5	Bitcoin	buy	43099.98	1.51
4122	5	Bitcoin	buy	57087.05	1.26
4153	6	Ethereum	buy	2699.56	8.99
4123	3	Bitcoin	buy	40572.08	5.93
4398	1	Bitcoin	buy	42506.19	3.27
4400	8	Bitcoin	buy	52967.37	3.08
4125	9	Bitcoin	buy	53563.18	9.5
4402	8	Ethereum	buy	2425.14	4.26
4127	7	Bitcoin	buy	58109.63	4.94
4128	3	Bitcoin	buy	51570.27	9.91
4129	2	Bitcoin	buy	57349.17	5.29
4130	7	Ethereum	buy	2040.67	9.56
4406	8	Bitcoin	buy	40138.47	7.07
4131	9	Bitcoin	buy	50833.98	2.66
5695	3	Ethereum	buy	2065.14	1
4775	8	Bitcoin	buy	50487.96	5.42
4133	10	Bitcoin	buy	49500.58	2.77
4135	3	Ethereum	buy	2111.66	3.77
4136	2	Bitcoin	buy	59507.12	7.22
4168	1	Bitcoin	buy	48931.52	5.49
4137	3	Ethereum	buy	2182.25	2.61
4138	10	Bitcoin	buy	54119.23	3.09
4170	7	Ethereum	buy	2009.5	3.58
4142	5	Bitcoin	buy	54334.97	7.69
4143	4	Bitcoin	buy	43342.19	1.66
4144	10	Ethereum	buy	2466.01	6.64
4154	9	Ethereum	buy	2373.74	1.34
4155	2	Ethereum	buy	2039	8.61
4156	3	Bitcoin	buy	55228.41	4.91
4157	9	Bitcoin	buy	55754.85	1.67
4158	1	Ethereum	buy	2539.35	4.69
4159	6	Bitcoin	buy	57452.08	8.78
4160	4	Ethereum	buy	2572.83	7.58
4162	5	Bitcoin	buy	47792.78	7.51
4172	6	Ethereum	buy	2156.32	1.38
4173	6	Bitcoin	buy	51189.12	8.08
4174	7	Bitcoin	buy	58651.2	9.21
4178	2	Bitcoin	buy	51142.16	7.49
4179	9	Bitcoin	buy	49645.08	3.26
4180	8	Ethereum	buy	2586.57	2.71
4185	9	Bitcoin	buy	46780.09	9.4
4188	1	Bitcoin	buy	55290.1	7.12
4189	1	Bitcoin	buy	52713.48	3.26
4190	2	Bitcoin	buy	57762.27	7.84
4192	5	Bitcoin	buy	58600.67	7.15
4721	6	Bitcoin	buy	57179.55	5.41
4371	3	Ethereum	buy	2663.49	3.01
4333	3	Ethereum	buy	2360.88	3.88
4275	6	Ethereum	sell	3853.89	7.52
4340	10	Bitcoin	buy	58164.28	9.49
4195	10	Ethereum	buy	2115.83	8.36
4347	7	Ethereum	buy	2292.16	2.73
4197	10	Bitcoin	buy	58243.86	3.14
4386	1	Ethereum	buy	2692.01	6.32
4746	7	Ethereum	buy	2326.96	7.09
4307	1	Bitcoin	buy	49064.3	2.82
4731	9	Bitcoin	buy	45427.23	7.41
4199	9	Ethereum	buy	2380.84	2.11
4388	4	Bitcoin	buy	58781.5	5.76
4359	6	Bitcoin	buy	48560.82	2.58
4399	1	Bitcoin	buy	51486.84	1.72
4403	9	Bitcoin	buy	43566.92	6.11
4202	2	Ethereum	buy	2634.62	5.35
5126	7	Ethereum	buy	2003.13	5.56
4204	7	Ethereum	buy	2711.29	5.43
5135	7	Bitcoin	buy	40596.12	6.06
4206	9	Ethereum	buy	2017.39	4.52
4367	10	Bitcoin	buy	43739.09	6.49
4207	3	Bitcoin	buy	40142.63	8.87
4208	9	Ethereum	buy	2074.53	6.96
4374	3	Ethereum	buy	2265.27	7.9
4210	2	Bitcoin	buy	51690.77	1.49
4211	7	Bitcoin	buy	56113.43	1.61
4378	3	Ethereum	sell	3981.32	7.09
4213	8	Ethereum	buy	2213.11	5.72
4214	4	Bitcoin	buy	52761.32	2.36
4215	8	Bitcoin	buy	44280.61	2.7
4216	4	Bitcoin	buy	51020.49	5.9
4217	8	Bitcoin	buy	53201.95	4.55
4218	7	Bitcoin	buy	59503.35	1.64
4739	9	Bitcoin	buy	50261.87	5.83
4760	2	Bitcoin	buy	44806.25	5.82
6339	7	Bitcoin	buy	44168.87	2.64
5674	1	Bitcoin	buy	45649	9.85
4222	3	Bitcoin	buy	50432.04	8.95
4382	1	Bitcoin	buy	52561.55	8.87
4223	7	Bitcoin	buy	47201.93	3.63
4281	1	Bitcoin	buy	55284.75	5.49
4224	6	Bitcoin	buy	53606.5	9.58
4766	2	Ethereum	buy	2067.51	9.92
4226	1	Ethereum	buy	2329.33	5.21
4227	6	Ethereum	buy	2194.44	9.18
4228	8	Bitcoin	buy	56798.8	3.57
4771	1	Ethereum	sell	3851.49	2.23
4230	5	Bitcoin	buy	58649.41	6.57
4231	6	Bitcoin	buy	45209.24	3.69
4232	8	Bitcoin	buy	53563.25	3.3
4282	8	Bitcoin	buy	45331.72	6.55
5152	9	Ethereum	buy	2553.54	1.79
4234	3	Bitcoin	buy	59009.28	3.24
6350	3	Bitcoin	buy	42993.7	6.49
4779	6	Ethereum	buy	2293.47	7.92
4236	5	Bitcoin	buy	44562.23	4.06
4237	4	Bitcoin	buy	46528.1	3.68
4787	4	Bitcoin	buy	54406.81	3.58
4283	2	Bitcoin	buy	55293.68	8.14
4239	5	Ethereum	buy	2431.76	5.71
4807	6	Ethereum	buy	2416.93	9.29
4791	4	Ethereum	buy	2143.82	1.78
4397	8	Bitcoin	buy	56620.18	9.91
4318	3	Bitcoin	buy	43199.47	3.79
4242	2	Ethereum	buy	2145.47	7.33
4795	4	Bitcoin	buy	58880.77	8.73
4285	2	Bitcoin	buy	48666.75	5.42
4244	5	Bitcoin	buy	55997.43	5.48
4405	8	Bitcoin	buy	58299.59	3.99
4248	8	Bitcoin	buy	54539.64	1.63
4249	2	Bitcoin	buy	51263.64	3.94
4250	3	Ethereum	buy	2135.78	9.92
4251	5	Bitcoin	buy	57676.65	8.71
4252	9	Ethereum	buy	2003.96	7.03
4407	3	Bitcoin	buy	52778.87	7.15
4254	8	Ethereum	buy	2395.13	2.18
4409	9	Ethereum	buy	2469.02	8.26
4257	4	Bitcoin	buy	40661.98	3.25
4287	5	Bitcoin	buy	45937.4	3.8
4259	3	Ethereum	buy	2184.12	4.66
4260	9	Ethereum	buy	2235.71	3.21
4412	10	Bitcoin	buy	47799.67	5.61
4413	7	Bitcoin	buy	55179.25	3.59
4261	7	Bitcoin	buy	45249.79	6.92
4262	6	Ethereum	buy	2423.64	6.19
4804	3	Bitcoin	buy	42329.94	1.09
4264	3	Bitcoin	buy	54374.81	1.77
4308	6	Bitcoin	buy	42719.33	9.73
4810	7	Bitcoin	buy	59795.52	8.93
4268	7	Ethereum	buy	2687.43	8.51
4269	4	Bitcoin	buy	48476.66	5.41
4270	8	Ethereum	buy	2494.96	6.99
4271	9	Bitcoin	buy	58802.02	2.38
4272	5	Ethereum	sell	3968.36	2.16
4290	4	Ethereum	buy	2432.06	5.49
4319	1	Ethereum	buy	2368.48	7.05
4291	4	Ethereum	buy	2440.11	4.21
4292	1	Bitcoin	buy	47527.85	7.91
4294	1	Bitcoin	buy	52164.24	4.7
4295	3	Bitcoin	buy	45713.39	8.93
4296	2	Ethereum	buy	2526.62	8.33
4297	6	Ethereum	buy	2521.41	2.66
4300	6	Bitcoin	buy	46032.79	9.6
4301	10	Ethereum	buy	2687.88	8.71
4302	6	Ethereum	sell	3947.53	8.23
4303	8	Bitcoin	buy	58577.15	6.02
4304	1	Bitcoin	buy	50942.8	1.73
4306	8	Bitcoin	buy	41276.84	4.47
4310	9	Bitcoin	buy	47499.32	1.05
4311	10	Ethereum	buy	2710.42	3.69
4312	10	Bitcoin	buy	54163.49	5.88
4313	4	Bitcoin	buy	47172.79	1.05
4314	3	Ethereum	buy	2410.86	1.67
4315	2	Bitcoin	buy	42404.25	7.09
4316	10	Ethereum	sell	3830.1	6.84
4401	8	Ethereum	buy	2720.9	9.679999999999998
4415	8	Bitcoin	buy	43072.73	9.2
4722	3	Bitcoin	buy	51662.11	3.36
4732	7	Bitcoin	buy	48977.09	3.57
4418	6	Bitcoin	buy	57722.95	6.13
5127	10	Bitcoin	buy	59708.15	5.28
4419	8	Bitcoin	buy	53736.77	4.55
4420	7	Bitcoin	buy	45228.16	2.93
4747	4	Bitcoin	buy	55979.23	1.2
5675	4	Ethereum	buy	2017.25	3.62
4421	4	Ethereum	buy	2315.57	3.42
4422	6	Bitcoin	buy	53850.43	7.19
4423	3	Ethereum	buy	2797.09	6.68
4424	6	Bitcoin	buy	44981.9	3.41
4425	1	Bitcoin	buy	43724.13	9.96
4761	3	Bitcoin	buy	45313.31	1.73
4427	7	Ethereum	buy	2055.18	8.35
4428	7	Ethereum	buy	2137.22	2.5
4429	5	Ethereum	sell	3942.09	5.85
4501	10	Bitcoin	buy	50696.5	3.19
4430	6	Ethereum	sell	3912.38	9.09
4502	10	Bitcoin	buy	56430.45	9.66
5686	2	Bitcoin	buy	58344.31	6.04
4784	10	Bitcoin	buy	53092.38	6.96
4503	2	Ethereum	buy	2737.93	1.54
4433	6	Ethereum	buy	2716.2	8.12
4434	3	Ethereum	buy	2524.06	8.68
4435	6	Bitcoin	buy	52044.11	4.79
4436	6	Bitcoin	buy	49613.81	4.96
4438	1	Bitcoin	buy	47061.69	6.3
4776	3	Bitcoin	buy	56301.15	9.26
4440	10	Bitcoin	buy	55901.37	3.41
4441	2	Ethereum	buy	2034.23	9.69
4442	2	Bitcoin	buy	44286.98	1.9
4443	6	Bitcoin	buy	53497.84	5.38
4444	3	Ethereum	sell	3872.41	1.6
4780	6	Bitcoin	buy	52660.05	9.45
4788	9	Bitcoin	buy	41655.94	5.22
4792	2	Bitcoin	buy	53626.46	2.45
4448	9	Bitcoin	buy	47963.86	9.66
4504	10	Bitcoin	buy	47178.74	6.48
4449	1	Ethereum	sell	3973.2	2.22
4505	9	Ethereum	buy	2151.64	4.3
4796	9	Bitcoin	buy	52897.13	1.87
4451	1	Bitcoin	buy	49361.62	3.1
4452	2	Bitcoin	buy	49966.62	2.95
4453	3	Bitcoin	buy	45297.97	5.18
4508	8	Ethereum	buy	2592	3.93
4456	6	Bitcoin	buy	54636.24	8.43
4457	6	Ethereum	buy	2208.82	4.5
4458	6	Bitcoin	buy	44847.56	8.52
4459	2	Bitcoin	buy	44207.17	4.68
4460	6	Bitcoin	buy	49236.74	5.52
4509	7	Ethereum	sell	3954.91	5.18
4510	8	Bitcoin	buy	43232.91	5.75
4511	1	Bitcoin	buy	44124.58	7.85
4464	10	Bitcoin	buy	54374.31	7.56
4465	8	Ethereum	buy	2049.35	6.48
4512	5	Bitcoin	buy	44523.37	6.95
4466	5	Ethereum	buy	2641.14	1.44
4513	1	Ethereum	buy	2550.42	3.93
4514	9	Bitcoin	buy	56385.61	7.7
4467	8	Ethereum	buy	2180.88	5.08
4468	7	Bitcoin	buy	43144.36	6.8
4469	10	Ethereum	buy	2571.16	9.97
4470	2	Bitcoin	buy	40784.93	7.93
4471	9	Bitcoin	buy	57994.82	2.71
4472	1	Bitcoin	buy	55569.3	6.56
4515	8	Bitcoin	buy	50991.3	6.3
4473	9	Bitcoin	buy	57484.75	1.87
4474	6	Ethereum	buy	2285.64	2.3
4475	4	Ethereum	buy	2145.05	9.48
4539	6	Bitcoin	buy	57956.71	7.95
4476	5	Ethereum	buy	2564.29	9.49
4477	6	Ethereum	buy	2137.96	6.57
4478	5	Bitcoin	buy	45373.2	5.76
4479	9	Ethereum	buy	2246.93	4.33
4480	5	Ethereum	buy	2381.22	9.9
4481	2	Ethereum	buy	2777.52	2.85
4484	10	Bitcoin	buy	50608.2	1.54
4485	2	Ethereum	buy	2121.86	5.95
4487	8	Bitcoin	buy	47208.47	6.35
4488	9	Ethereum	buy	2705.57	7.27
4489	7	Bitcoin	buy	48288.2	5.15
4528	6	Bitcoin	buy	59710.55	2.52
4490	4	Bitcoin	buy	44315.11	6.73
4492	9	Bitcoin	buy	51087.97	5.88
4493	9	Ethereum	buy	2585.2	7.18
4494	6	Ethereum	buy	2160.06	9.49
4495	7	Bitcoin	buy	55265.05	4.74
4496	1	Bitcoin	buy	58912.16	6.74
4498	7	Ethereum	buy	2249.05	9.03
4529	1	Bitcoin	buy	59761.15	2.63
4500	10	Bitcoin	buy	45253.02	8.07
4516	8	Bitcoin	buy	52403.24	4.71
4517	1	Ethereum	buy	2262.16	3.91
4540	8	Bitcoin	buy	52975.8	1.67
4518	9	Ethereum	buy	2713.82	8.79
4519	2	Bitcoin	buy	51225.89	5.64
4520	10	Bitcoin	buy	49337.03	9.06
4522	1	Bitcoin	buy	40086.52	2.83
4523	4	Bitcoin	buy	57679.41	1.06
4524	9	Bitcoin	buy	48554.65	2.73
4525	1	Ethereum	buy	2259.54	1.65
4526	4	Bitcoin	buy	50121.41	4.11
4527	3	Bitcoin	buy	43863.51	1.64
4530	9	Bitcoin	buy	47327.86	1.96
4531	7	Ethereum	buy	2320.84	6.27
4533	9	Ethereum	buy	2698.97	7.93
4534	10	Bitcoin	buy	42240.21	2.79
4535	10	Bitcoin	buy	57861.88	1.9
4536	5	Bitcoin	buy	49944.51	2.62
4537	5	Bitcoin	buy	54181.3	4.79
4542	7	Bitcoin	buy	42053.39	9.15
4544	7	Bitcoin	buy	48576.88	5.87
4545	6	Bitcoin	buy	46758.24	2.18
4546	8	Ethereum	buy	2569.13	3.64
4547	6	Ethereum	buy	2193.4	1.34
4548	4	Bitcoin	buy	58932.01	6.8
4549	1	Ethereum	sell	3897.11	2.78
5128	8	Ethereum	buy	2802.4	2.64
4733	10	Ethereum	buy	2167.64	2.73
4550	4	Bitcoin	buy	41531.68	4.74
4551	3	Bitcoin	buy	45337.97	2.05
4740	7	Ethereum	sell	3844.28	3.84
4553	3	Bitcoin	buy	45267.04	7.17
4785	10	Ethereum	buy	2130.02	8.04
4748	2	Bitcoin	buy	42430.72	3.81
4556	4	Bitcoin	buy	54370.3	5.27
4557	8	Bitcoin	buy	56870.13	5.78
4558	6	Bitcoin	buy	46108.95	6.35
4559	9	Bitcoin	buy	41767.38	7.43
4755	4	Ethereum	buy	2048.74	5.91
4561	5	Bitcoin	buy	54733.18	4.14
5136	8	Bitcoin	buy	53554.88	5.66
4563	8	Bitcoin	buy	57266.83	7.32
5142	4	Ethereum	buy	2678.27	9.94
4565	8	Bitcoin	buy	54711.29	9.76
4566	2	Bitcoin	buy	40151.48	4.94
4567	6	Bitcoin	buy	57668.05	7.07
4768	5	Ethereum	buy	2686.97	3.16
4569	4	Ethereum	buy	2595.19	7.51
4570	4	Bitcoin	buy	55586.87	7.95
4571	6	Bitcoin	buy	40658.92	8.42
4572	3	Bitcoin	buy	55266.03	8.77
4773	8	Bitcoin	buy	45721.6	2.76
4574	8	Bitcoin	buy	45979.35	5.36
5676	2	Bitcoin	buy	56692.2	7.88
4575	7	Bitcoin	buy	56906.36	3.94
4576	7	Bitcoin	buy	57598.91	9.64
5153	1	Bitcoin	buy	52374.13	5.28
4578	1	Bitcoin	buy	56635.05	8
4579	9	Ethereum	buy	2116.8	4.86
5158	7	Ethereum	sell	3929.97	3.99
4581	2	Bitcoin	buy	54592.26	6.67
4582	10	Bitcoin	buy	47935.4	3.77
4793	2	Ethereum	buy	2444.71	4.35
4584	7	Bitcoin	buy	43472.82	5.23
4797	9	Bitcoin	buy	55779.6	4.26
4587	4	Ethereum	sell	3831.16	8.7
4670	5	Bitcoin	buy	44428.78	3.85
4588	6	Bitcoin	buy	59881.17	3.01
4589	6	Bitcoin	buy	55990.49	3.28
4800	9	Bitcoin	buy	41094.01	1.78
4591	3	Bitcoin	buy	56967.3	5.48
4592	5	Bitcoin	buy	51184	3.01
4803	3	Bitcoin	buy	58408.79	4.96
4805	7	Ethereum	buy	2194.18	2.08
4808	1	Bitcoin	buy	44143.87	9.21
4811	3	Ethereum	sell	3921.21	1.89
4598	5	Bitcoin	buy	51060.82	2.53
4599	7	Bitcoin	buy	41538.59	5.47
4600	7	Bitcoin	buy	47691.66	1.56
4637	5	Ethereum	buy	2805.86	6.95
4602	4	Ethereum	buy	2704.71	6.08
4671	3	Bitcoin	buy	40277.93	1.18
4638	9	Bitcoin	buy	46883.94	5.7
4815	1	Bitcoin	buy	55622.04	7.16
4605	4	Ethereum	sell	3824.58	5.54
4606	5	Ethereum	buy	2226.38	6.66
4607	10	Ethereum	sell	3983.5	9.51
4608	3	Ethereum	buy	2547.36	4.7
4610	6	Ethereum	buy	2605.47	1.97
4611	2	Ethereum	buy	2206.15	5.29
4612	9	Ethereum	buy	2001.07	2.92
4613	5	Bitcoin	buy	51466.95	3.89
4614	2	Ethereum	buy	2586.27	4.45
4615	10	Bitcoin	buy	51288.52	2.23
4617	6	Bitcoin	buy	46875.25	1.19
4618	7	Ethereum	buy	2518.5	9.93
4619	7	Bitcoin	buy	58489.73	9.7
4622	5	Bitcoin	buy	40555.43	9.98
4624	2	Ethereum	sell	3898.34	5.6
4656	1	Bitcoin	buy	41586.46	9.88
4625	2	Bitcoin	buy	41981.89	8.25
4626	10	Ethereum	buy	2546.59	7.69
4657	1	Bitcoin	buy	40645.24	6.38
4658	1	Ethereum	buy	2373.43	2.42
4629	10	Bitcoin	buy	47930.34	2.5
4631	8	Bitcoin	buy	49409.73	2.92
4659	9	Bitcoin	buy	50916.08	9.06
4633	10	Bitcoin	buy	53520.09	7.47
4634	4	Ethereum	buy	2258.15	2.68
4660	8	Ethereum	buy	2008.82	6.82
4661	9	Bitcoin	buy	42951.41	8.81
4640	4	Bitcoin	buy	50055.95	6.6
4642	10	Bitcoin	buy	47549.72	8.52
4643	9	Ethereum	buy	2221.4	8.24
4644	5	Ethereum	buy	2314.04	2.02
4645	8	Ethereum	buy	2298.17	1.28
4646	1	Bitcoin	buy	49708.8	1.29
4647	3	Bitcoin	buy	56250.6	4.86
4649	10	Ethereum	buy	2655.52	3.61
4650	9	Bitcoin	buy	57121.85	2.93
4651	9	Bitcoin	buy	44097.88	1.37
4652	5	Ethereum	buy	2578.84	1.29
4653	6	Bitcoin	buy	59321.17	6.55
4664	4	Bitcoin	buy	43657.67	5.52
4665	1	Bitcoin	buy	44046	1.39
4668	6	Ethereum	buy	2028.39	2.89
4677	5	Ethereum	buy	2120.06	2.59
4678	9	Bitcoin	buy	50534.43	6.73
4680	10	Ethereum	buy	2760.52	4.42
4685	5	Bitcoin	buy	44238.4	8.63
4686	9	Bitcoin	buy	56297.18	3.34
4687	7	Ethereum	sell	3955.61	8.15
4688	9	Bitcoin	buy	47151.7	1.84
4689	1	Ethereum	buy	2734.71	4.93
4690	9	Bitcoin	buy	55860.95	7.36
4691	7	Ethereum	buy	2116.32	6.88
4692	9	Bitcoin	buy	53737.74	8.2
4693	10	Ethereum	buy	2818.78	3.01
4694	2	Bitcoin	buy	42321.62	2.27
4695	9	Bitcoin	buy	43713.49	5.61
4696	8	Ethereum	buy	2188.47	8
4697	7	Bitcoin	buy	53009.67	7.17
4873	10	Ethereum	buy	2355.86	4.21
4699	10	Bitcoin	buy	47087.38	8.92
4700	6	Ethereum	buy	2220.8	3.44
5129	6	Bitcoin	buy	50078.89	3.62
4702	4	Ethereum	buy	2086.91	2.01
5677	6	Bitcoin	buy	48090.09	9.09
4704	4	Ethereum	buy	2437.58	5.83
5687	3	Ethereum	buy	2411.46	9.31
4706	1	Ethereum	buy	2397.6	3.64
4707	10	Ethereum	buy	2481.46	1.81
4708	6	Ethereum	buy	2538.32	8.06
4709	8	Ethereum	buy	2465.92	4.06
4710	2	Bitcoin	buy	46433.95	8.43
4874	6	Bitcoin	buy	41873.16	7.57
4711	9	Bitcoin	buy	48518.38	2.93
5182	1	Bitcoin	buy	59432.8	1.87
4713	5	Bitcoin	buy	40058.67	4.94
4875	7	Ethereum	buy	2754.91	2.05
4714	7	Ethereum	buy	2524.8	3.35
4724	1	Bitcoin	buy	51185.22	1.22
4901	3	Bitcoin	buy	57195.61	7.98
5143	4	Ethereum	buy	2674.79	6.23
4876	1	Bitcoin	buy	46428.83	8.03
5149	5	Bitcoin	buy	40794.06	2.48
5696	7	Bitcoin	buy	49530.98	4.01
4877	1	Bitcoin	buy	57719.17	9.15
4756	8	Bitcoin	buy	55465.52	9.55
4878	8	Bitcoin	buy	56083.12	5.24
4763	9	Ethereum	buy	2547.01	8.58
4769	3	Ethereum	buy	2626.87	2.52
5162	9	Ethereum	buy	2095.78	7.22
4778	1	Bitcoin	buy	54672.88	1.48
4782	4	Bitcoin	buy	48835.82	4.28
4786	7	Ethereum	buy	2145.32	6.42
4790	3	Ethereum	buy	2160.01	3.41
5164	7	Ethereum	buy	2371.98	1.01
4798	3	Bitcoin	buy	41805.78	4.51
4801	8	Bitcoin	buy	55133	5.44
5702	2	Bitcoin	buy	48331.36	8.55
5167	2	Bitcoin	buy	59498.25	9.76
4809	4	Ethereum	buy	2439.24	3.08
4812	3	Bitcoin	buy	41066.81	1.94
4814	9	Ethereum	buy	2604.86	6.5
4816	1	Ethereum	buy	2625.56	4.04
4817	8	Ethereum	buy	2673	7.42
4818	9	Bitcoin	buy	59073.68	6.12
5709	8	Bitcoin	buy	43732.89	5.14
4820	7	Bitcoin	buy	52378.65	3.78
5173	10	Bitcoin	buy	51964.34	4.73
5176	1	Bitcoin	buy	54493.66	1.02
4824	7	Bitcoin	buy	55498.38	7.72
4880	7	Ethereum	buy	2440.45	4.26
4825	1	Ethereum	sell	3901.09	4.36
4881	10	Bitcoin	buy	56299.81	2.32
4826	9	Bitcoin	buy	52933.7	8.2
4827	3	Bitcoin	buy	53668.85	2.76
4828	3	Bitcoin	buy	43635.9	4.93
4829	5	Bitcoin	buy	55660.58	1.15
4831	10	Bitcoin	buy	59891.13	2.34
5721	7	Bitcoin	buy	49526.66	5.52
4834	6	Ethereum	buy	2723.31	5.84
4835	5	Bitcoin	buy	54703.84	5.76
4836	5	Bitcoin	buy	50916.75	8.18
4837	1	Bitcoin	buy	45861.25	5.45
4838	4	Bitcoin	buy	58295.38	7.05
4839	3	Bitcoin	buy	56111.05	6.63
4840	10	Bitcoin	buy	55001.28	5.03
5727	9	Bitcoin	buy	40802.27	9.18
4842	1	Bitcoin	buy	52837.8	1.1
4843	4	Bitcoin	buy	53609.79	8.72
4882	5	Ethereum	buy	2021.07	4.41
4844	6	Bitcoin	buy	57368.11	9.07
4845	4	Bitcoin	buy	55260.32	6.35
4846	6	Bitcoin	buy	50936.16	7.24
4847	3	Ethereum	sell	3853.91	6.86
4848	3	Ethereum	buy	2215.86	1.37
5185	7	Ethereum	buy	2157.62	1.83
4851	1	Ethereum	buy	2580.55	5.87
4852	8	Bitcoin	buy	50438.21	6.91
4853	8	Bitcoin	buy	51016.18	3
4855	6	Bitcoin	buy	43574.04	1.93
4856	9	Ethereum	buy	2732.81	3.2
4857	3	Ethereum	buy	2466.29	5.64
4858	9	Bitcoin	buy	48308.28	8.71
4883	5	Bitcoin	buy	50735.22	3.18
4859	7	Bitcoin	buy	57466.11	8.01
4860	5	Bitcoin	buy	40293.51	7.98
4861	5	Bitcoin	buy	47820.17	3.67
4862	4	Bitcoin	buy	55464.7	6.16
4863	1	Bitcoin	buy	56318.26	7.25
4864	9	Bitcoin	buy	58336.94	3.64
4865	9	Bitcoin	buy	40759.07	5.46
4866	1	Bitcoin	buy	56529.84	5.88
4867	3	Ethereum	buy	2505.64	5.66
4868	9	Ethereum	buy	2065.44	7.8
4870	6	Ethereum	sell	3876.7	8.98
4872	9	Ethereum	buy	2834.21	6.62
4885	2	Ethereum	buy	2055.71	1.22
4888	4	Ethereum	buy	2196.28	7.95
4889	1	Ethereum	buy	2502.95	8.13
4890	2	Ethereum	sell	3981.21	1.84
4894	8	Ethereum	buy	2046.64	8.16
4896	4	Ethereum	buy	2379.39	8.26
4897	1	Bitcoin	buy	50480.84	1.81
4898	4	Bitcoin	buy	48719.03	7.08
4902	7	Bitcoin	buy	48825.31	1.83
4903	3	Bitcoin	buy	49867.47	7.13
4905	2	Ethereum	buy	2198.01	7.84
4906	4	Bitcoin	buy	50427.46	8.94
4909	4	Ethereum	sell	3976.8	5.41
4912	9	Ethereum	buy	2010.31	6.19
5678	7	Bitcoin	buy	44303.99	7.9
4913	7	Bitcoin	buy	47096.1	2.89
5688	10	Ethereum	buy	2638.75	1.9
5697	5	Bitcoin	buy	57962.77	5.32
5703	5	Bitcoin	buy	42103.21	2.81
4915	10	Bitcoin	buy	52649.44	2.35
4916	10	Ethereum	buy	2034.13	4.26
4917	5	Ethereum	buy	2344.97	6.65
5180	10	Bitcoin	buy	57244.11	3.54
4919	8	Ethereum	sell	3966.71	3.34
5150	4	Bitcoin	buy	45072.31	3.28
4999	6	Bitcoin	buy	52694.64	6.18
4921	9	Bitcoin	buy	53925.59	4.81
5000	6	Ethereum	sell	3867.11	5.01
4922	9	Bitcoin	buy	46858.89	7.76
5001	1	Ethereum	buy	2327.07	9.28
4925	2	Bitcoin	buy	49836.08	3.28
4926	8	Bitcoin	buy	54491.64	4.13
5165	4	Ethereum	buy	2223.6	2.98
4928	3	Bitcoin	buy	43256.76	4.63
4929	1	Bitcoin	buy	52534.29	3.48
4930	8	Bitcoin	buy	48312.82	6.83
5002	6	Bitcoin	buy	40184.55	2.52
4931	6	Bitcoin	buy	44839.75	9.88
5168	9	Bitcoin	buy	40927.68	4.07
5171	1	Bitcoin	buy	56610.52	5.18
4933	6	Ethereum	buy	2626.47	9.54
4934	9	Ethereum	sell	3836.26	1.21
5174	8	Ethereum	buy	2357.96	6.26
5177	5	Bitcoin	buy	45763.78	5.62
5183	7	Ethereum	buy	2379.56	9.16
4938	6	Bitcoin	buy	47873.86	7.16
4939	5	Bitcoin	buy	50396.55	2.96
5186	2	Ethereum	buy	2794.97	9.9
4941	2	Ethereum	buy	2187.32	4.64
5004	2	Ethereum	buy	2707.06	5.25
4942	2	Bitcoin	buy	48886.61	3.7
4943	5	Bitcoin	buy	45435.98	6.16
4944	2	Ethereum	buy	2007.04	4.82
5188	5	Bitcoin	buy	43267.97	3.42
4945	5	Bitcoin	buy	53983.61	7.21
4948	9	Bitcoin	buy	56436.35	4.07
4949	2	Bitcoin	buy	40171.96	3.98
4950	10	Bitcoin	buy	42318.08	7.36
4951	5	Bitcoin	buy	58531.16	9.19
5006	6	Bitcoin	buy	50341.47	2.04
4953	4	Bitcoin	buy	46157.61	3.67
5007	4	Ethereum	buy	2806.74	6.78
5008	4	Bitcoin	buy	47277.17	5.59
5009	1	Bitcoin	buy	50212.47	4.06
4955	4	Bitcoin	buy	40938.09	1.15
4956	9	Ethereum	buy	2504.42	3.22
5010	10	Bitcoin	buy	42265.82	3.11
4958	3	Ethereum	buy	2072.67	8.63
4959	5	Bitcoin	buy	51010.1	1.98
4960	2	Bitcoin	buy	57305.48	6.09
4961	4	Bitcoin	buy	40144.45	3.89
4962	2	Ethereum	buy	2630.68	7.38
4965	3	Bitcoin	buy	50202.78	4.16
4967	2	Bitcoin	buy	57467.66	8.72
4968	9	Bitcoin	buy	55935.36	3.48
4969	4	Ethereum	buy	2047.04	7.59
5011	3	Bitcoin	buy	55498.27	6.95
4970	4	Bitcoin	buy	56279.59	9.15
4972	5	Bitcoin	buy	56337.64	2.29
4974	4	Bitcoin	buy	43483.2	7.16
4976	6	Ethereum	buy	2014.67	8.44
4977	1	Ethereum	buy	2761.05	5.14
4978	2	Ethereum	buy	2620.02	4.32
4979	10	Ethereum	buy	2659.03	5.1
4980	2	Bitcoin	buy	58238.11	1.32
4981	3	Bitcoin	buy	52807.35	3.32
4982	2	Bitcoin	buy	40901.82	5.82
4984	10	Ethereum	buy	2128.69	8.2
5014	9	Bitcoin	buy	59639.94	9.77
4987	2	Ethereum	buy	2708.46	2.55
4988	8	Bitcoin	buy	57116.42	5.37
5039	7	Bitcoin	buy	51151.12	7.97
4991	9	Ethereum	sell	3993.91	2.61
4992	6	Ethereum	sell	3948.88	3.11
4993	3	Bitcoin	buy	51902.11	9.45
4994	7	Bitcoin	buy	57965.47	1.02
4995	8	Bitcoin	buy	46369.94	3.95
4997	9	Bitcoin	buy	59700.52	1.22
4998	9	Bitcoin	buy	48169.93	6.15
5016	3	Bitcoin	buy	40241.12	3.5
5017	3	Bitcoin	buy	50560.03	5.49
5020	7	Ethereum	buy	2206.71	5.04
5021	7	Ethereum	buy	2625.65	8.61
5023	8	Ethereum	buy	2047.11	5.86
5024	8	Ethereum	buy	2085.7	6.17
5025	9	Bitcoin	buy	40985.57	4.26
5026	9	Bitcoin	buy	50461.74	1.99
5028	1	Ethereum	buy	2680.35	6.46
5046	2	Bitcoin	buy	57597.3	5.68
5029	1	Ethereum	buy	2679.06	8.54
5047	9	Ethereum	buy	2502.39	4.63
5030	6	Bitcoin	buy	58028.94	4.34
5031	8	Bitcoin	buy	52998.54	3.3
5032	7	Bitcoin	buy	42286.77	7.61
5033	6	Ethereum	buy	2254.71	6.55
5034	4	Bitcoin	buy	44752.55	2.86
5035	2	Bitcoin	buy	48404.8	3.96
5036	3	Bitcoin	buy	51616.38	6.73
5037	10	Ethereum	buy	2425.12	5.07
5040	4	Bitcoin	buy	44071.45	3.95
5041	5	Bitcoin	buy	44401.51	1.31
5042	5	Ethereum	buy	2111.93	5.96
5043	3	Bitcoin	buy	53988.17	7.64
5044	4	Ethereum	buy	2583.77	2.89
5045	1	Ethereum	buy	2389.99	1.69
5049	3	Ethereum	buy	2131.76	5.32
5050	1	Bitcoin	buy	48975.2	4.93
5051	8	Ethereum	buy	2688.27	8.73
5052	1	Ethereum	sell	3863.51	2.49
5053	6	Ethereum	buy	2306.85	9.18
5055	10	Bitcoin	buy	50275.61	3.26
5057	4	Ethereum	buy	2699.25	7.64
5058	1	Ethereum	buy	2808.94	8.46
5216	7	Ethereum	buy	2611.19	2.09
5131	8	Bitcoin	buy	45944.18	3.6
5679	9	Bitcoin	buy	48822.64	5.29
5218	7	Ethereum	buy	2118.42	6.07
5059	3	Ethereum	buy	2477.15	6.56
5060	10	Bitcoin	buy	57738.2	3.09
5226	9	Bitcoin	buy	46970.09	7.96
5061	2	Bitcoin	buy	44158.07	4.9
5698	8	Bitcoin	buy	41758.03	1.95
5063	9	Bitcoin	buy	55492.82	4.58
5064	5	Bitcoin	buy	57457.69	9.79
5151	1	Bitcoin	buy	52435.97	6.31
5066	1	Ethereum	buy	2484.44	9.33
5156	3	Bitcoin	buy	48296.53	3.6
5067	8	Bitcoin	buy	55683.26	2.69
5068	3	Ethereum	buy	2794.13	4.93
5069	2	Bitcoin	buy	42078.73	7.02
5070	7	Ethereum	buy	2306.18	9.54
5071	7	Bitcoin	buy	42953.53	9.36
5161	5	Bitcoin	buy	48495.78	7.23
5163	9	Bitcoin	buy	58217.32	3.54
5073	6	Bitcoin	buy	46087.51	5.8
5166	6	Bitcoin	buy	59857.75	2.61
5169	7	Bitcoin	buy	55459.6	3.3
5172	8	Bitcoin	buy	50764.68	3.85
5175	9	Ethereum	buy	2510.64	8.95
5076	9	Bitcoin	buy	41624.78	6.6
5178	2	Bitcoin	buy	50495.36	5.55
5077	4	Bitcoin	buy	49492.21	5.31
5078	5	Ethereum	buy	2507.49	7
5079	4	Ethereum	sell	3894.64	3.47
5080	6	Ethereum	buy	2058.19	2.29
6351	6	Ethereum	buy	2230.93	9.82
5082	10	Ethereum	sell	3983.3	1.82
5083	4	Bitcoin	buy	55328.17	4.29
5704	1	Bitcoin	buy	45191.25	5.3
5187	5	Ethereum	sell	3946.33	4.29
5085	10	Ethereum	buy	2463.55	8.91
5742	8	Ethereum	buy	2081.11	2.25
5086	5	Ethereum	buy	2388.53	3.27
5087	1	Bitcoin	buy	48063.72	8.3
5088	8	Bitcoin	buy	55532.02	5.02
5089	2	Bitcoin	buy	43046.37	6.46
5189	2	Ethereum	buy	2436.49	3.89
5710	6	Bitcoin	buy	49211.87	6.49
5092	1	Ethereum	buy	2061.83	2.65
5716	7	Bitcoin	buy	45770.55	5.74
5094	5	Ethereum	buy	2302.14	1.65
5095	9	Ethereum	buy	2538.26	3.09
5096	3	Bitcoin	buy	42313.37	8.76
5097	8	Bitcoin	buy	54352.43	9.53
5098	1	Bitcoin	buy	56187.48	7.14
6360	6	Ethereum	buy	2578.54	3.95
6369	1	Bitcoin	buy	59160.5	8.01
5102	4	Ethereum	buy	2267.03	7.96
5103	10	Ethereum	buy	2550.65	7.72
5104	5	Ethereum	buy	2450.1	4.17
5722	2	Ethereum	buy	2093.47	1.69
5106	10	Ethereum	buy	2298.07	3.22
5107	2	Bitcoin	buy	53335.64	6.07
5108	6	Ethereum	buy	2545.84	1.9
5728	10	Ethereum	buy	2681.92	3.48
5110	3	Bitcoin	buy	43558.3	5.96
5732	4	Ethereum	buy	2780.7	6.65
5737	10	Ethereum	buy	2035.42	8.01
5804	2	Ethereum	buy	2124.51	6.75
5112	10	Bitcoin	buy	55122.97	8.03
5113	6	Bitcoin	buy	47991.23	4.79
5747	6	Bitcoin	buy	43781.64	2.84
5116	9	Bitcoin	buy	52931.17	4.15
5117	2	Bitcoin	buy	49145.36	1.59
5752	3	Ethereum	buy	2728.98	4.43
6396	10	Bitcoin	buy	58174.08	8.47
6405	3	Bitcoin	buy	44154.43	6.06
5190	4	Bitcoin	buy	50012.28	6.01
6414	6	Bitcoin	buy	56593.5	4.92
5191	5	Bitcoin	buy	57695.32	7.88
5192	6	Bitcoin	buy	46832.44	2.76
5762	3	Bitcoin	buy	49296.21	7.79
5194	2	Bitcoin	buy	56629.71	4.51
5195	5	Ethereum	buy	2093.04	8.2
5196	7	Bitcoin	buy	59431.05	3.07
5197	1	Bitcoin	buy	45351.05	2.85
5767	3	Bitcoin	buy	44727.99	3.98
5772	7	Ethereum	buy	2582.23	1.35
5200	8	Ethereum	sell	3832.89	2.2
5201	4	Bitcoin	buy	48322.24	1.31
5777	3	Bitcoin	buy	53240.64	7.27
5203	7	Bitcoin	buy	45631.93	3.05
5181	9	Bitcoin	buy	59935.4	7.49
5204	4	Bitcoin	buy	46622.52	5.95
5205	1	Bitcoin	buy	45496.77	6.59
5206	10	Bitcoin	buy	43077.11	9.1
5207	1	Ethereum	buy	2209.21	7.59
5209	8	Bitcoin	buy	55140.67	1.94
5210	9	Bitcoin	buy	59243.22	7.01
5797	5	Ethereum	buy	2098.28	3.44
5212	1	Bitcoin	buy	50500.74	2.32
5231	3	Bitcoin	buy	42824.11	6.27
5214	7	Bitcoin	buy	55326.21	4.71
5232	10	Bitcoin	buy	45239.63	4.84
5221	5	Ethereum	buy	2711.05	5.45
5812	2	Bitcoin	buy	45179.71	3.65
5223	3	Ethereum	buy	2188.58	9.32
5224	4	Bitcoin	buy	40234.83	3.91
5225	1	Ethereum	buy	2174.58	6.92
5227	3	Bitcoin	buy	45706.27	6.73
5228	1	Bitcoin	buy	43127.22	8.7
5230	10	Ethereum	buy	2289.56	1.51
5233	6	Bitcoin	buy	52183.67	3.46
5235	8	Bitcoin	buy	40176.99	9.52
5236	4	Bitcoin	buy	59928.72	3.13
5237	1	Bitcoin	buy	55059.67	8.78
5238	2	Bitcoin	buy	55564.87	8.89
5239	7	Ethereum	buy	2732.21	3.65
5240	8	Bitcoin	buy	48298.47	9.04
6341	2	Bitcoin	buy	53896.72	8.46
6352	2	Bitcoin	buy	44874.5	9.59
5242	7	Ethereum	buy	2101.32	3.26
5243	2	Bitcoin	buy	47093.86	4.68
6361	7	Ethereum	sell	3861.77	4.29
5245	7	Bitcoin	buy	56275.8	8.49
5246	8	Bitcoin	buy	57586.91	4.72
5723	2	Bitcoin	buy	49536.34	5.84
5248	6	Bitcoin	buy	46420.07	1.62
5249	7	Bitcoin	buy	45497.92	2.36
5332	8	Bitcoin	buy	43345.06	5.28
5250	6	Ethereum	buy	2302.22	8.95
6379	1	Ethereum	buy	2800.26	7.35
5252	10	Bitcoin	buy	48803.35	6.58
5729	8	Ethereum	buy	2566.8	3.43
5253	3	Bitcoin	buy	45940.52	1.85
6388	3	Ethereum	buy	2262.09	7.53
5711	1	Ethereum	buy	2551.3	1.38
6397	8	Ethereum	buy	2764.64	3.77
5257	3	Bitcoin	buy	41432.51	2.22
5258	3	Bitcoin	buy	59304.02	8.88
5333	8	Bitcoin	buy	55907.59	1.21
5805	6	Bitcoin	buy	44535.12	3.33
5260	7	Bitcoin	buy	52961.38	4.42
5717	10	Bitcoin	buy	44401.72	7.12
5733	3	Bitcoin	buy	57321.25	4.68
5263	9	Bitcoin	buy	52559.81	5.44
5265	7	Bitcoin	buy	45991.26	8.43
5266	3	Bitcoin	buy	59010.83	2.6
5267	8	Ethereum	buy	2197.34	8.91
5334	9	Bitcoin	buy	51038.11	6.56
5738	1	Ethereum	buy	2813.56	2.19
5269	2	Ethereum	buy	2633.27	8.16
5743	10	Ethereum	sell	3798.03	5.34
5335	8	Ethereum	sell	3935.6	4.58
5271	7	Ethereum	buy	2745.68	9.52
5272	9	Bitcoin	buy	48308.21	5.82
5273	9	Bitcoin	buy	52728.81	6.05
5274	7	Ethereum	buy	2465.65	8.73
5748	1	Bitcoin	buy	59972.35	6.14
5276	4	Bitcoin	buy	40260.19	9.92
5279	10	Bitcoin	buy	50632.33	8.59
5280	10	Bitcoin	buy	46009.62	3.93
5281	3	Bitcoin	buy	42312.39	7.28
5283	3	Bitcoin	buy	58313.62	6.07
5336	1	Bitcoin	buy	45880.18	1.19
5284	5	Ethereum	buy	2730.86	9.73
5285	6	Bitcoin	buy	48814.71	8.81
5286	6	Bitcoin	buy	54112.64	10
5287	8	Bitcoin	buy	41273.79	7.36
5288	2	Ethereum	buy	2294.63	8.63
5289	7	Bitcoin	buy	52103.82	8.17
5783	6	Bitcoin	buy	51295.2	7.65
5291	4	Bitcoin	buy	41678.33	2.54
5292	1	Bitcoin	buy	55165.15	4.87
5293	7	Bitcoin	buy	47439.53	5.43
5295	5	Ethereum	buy	2775.6	8.46
5338	6	Bitcoin	buy	50560.85	6.79
5296	8	Bitcoin	buy	43348.46	3.65
5297	2	Bitcoin	buy	52795.28	6.74
5298	1	Ethereum	buy	2564.13	9.52
5299	8	Bitcoin	buy	40144.89	7.82
5339	1	Ethereum	sell	3782.84	4.23
5300	5	Bitcoin	buy	44262.27	1.18
5301	1	Bitcoin	buy	56494.5	3.09
5302	8	Ethereum	buy	2392.21	8.29
5303	4	Ethereum	buy	2087.78	4.69
5768	1	Bitcoin	buy	52346.54	4.64
5305	8	Bitcoin	buy	46538.7	6.83
5306	2	Ethereum	buy	2070.82	4.54
5307	6	Ethereum	buy	2267.86	9.63
5788	9	Bitcoin	buy	53210.31	1.13
5309	4	Bitcoin	buy	53309.41	3.47
5809	3	Bitcoin	buy	55576.48	9.73
5311	1	Ethereum	buy	2586.59	5.64
5312	4	Bitcoin	buy	49970.88	1.03
5313	10	Bitcoin	buy	58808.35	8.14
5314	4	Bitcoin	buy	45337.76	3.72
5315	2	Ethereum	buy	2407.07	1.62
5316	5	Ethereum	sell	3991.49	3.18
5820	10	Bitcoin	buy	49742.01	8.63
5319	8	Bitcoin	buy	55824.44	9.17
5355	2	Bitcoin	buy	50926.33	8.17
5320	9	Bitcoin	buy	57900.5	7.66
5826	2	Bitcoin	buy	50323.52	4
5322	8	Ethereum	sell	3914.02	7.5
5323	1	Bitcoin	buy	55026.88	1.04
5801	9	Ethereum	buy	2287.64	6.33
5357	9	Bitcoin	buy	58946.5	3.99
5813	9	Bitcoin	buy	55465.04	5.96
5326	5	Bitcoin	buy	40941.72	7.1
5328	3	Ethereum	buy	2214.39	8.57
5329	5	Bitcoin	buy	55467.2	1.97
5330	5	Bitcoin	buy	41292.63	8.57
5331	10	Ethereum	sell	3926.51	2.45
5340	7	Bitcoin	buy	58383.82	8.06
5341	9	Bitcoin	buy	56823.05	1.95
5815	7	Bitcoin	buy	41204.18	4.56
5343	8	Bitcoin	buy	59091.27	2.27
5344	5	Bitcoin	buy	59424.83	7.55
5817	5	Ethereum	buy	2082.93	4.44
5346	9	Ethereum	sell	3851.15	4.89
5347	5	Ethereum	sell	3941.11	9.48
5823	5	Bitcoin	buy	48317.36	4.38
5349	2	Bitcoin	buy	47721.94	1.78
5350	9	Bitcoin	buy	42796.02	3.03
5351	9	Ethereum	buy	2759.18	8.25
5352	2	Bitcoin	buy	47505.93	2.61
5353	2	Bitcoin	buy	47622.32	7.12
5358	10	Ethereum	buy	2648.35	3.79
5359	6	Ethereum	sell	3912.36	5.33
5360	4	Bitcoin	buy	44096.02	4.74
5361	7	Bitcoin	buy	52439.26	6.19
5362	6	Bitcoin	buy	45490.13	6.5
5838	7	Ethereum	buy	2679.73	8.62
5364	6	Ethereum	sell	3836.68	8.28
6342	9	Bitcoin	buy	44244.96	8.29
5371	4	Bitcoin	buy	56319.6	6.74
5680	3	Bitcoin	buy	52466.45	2.79
5373	4	Bitcoin	buy	58680.75	5.24
5374	5	Bitcoin	buy	48334.32	5.2
5375	8	Bitcoin	buy	54648.33	5.4
5691	7	Ethereum	buy	2248.46	6.09
5377	9	Ethereum	buy	2493.93	2.83
5699	2	Bitcoin	buy	44176.45	9.06
5378	9	Bitcoin	buy	57413.4	3.55
5380	3	Bitcoin	buy	44636.93	8.03
5461	6	Bitcoin	buy	56614	1.56
5712	8	Ethereum	sell	3856.95	1.15
5718	7	Bitcoin	buy	51412.15	1.96
5724	8	Bitcoin	buy	55883.48	3.71
6371	10	Bitcoin	buy	40258.86	6.9
6380	8	Ethereum	sell	3771.61	2.28
5386	6	Ethereum	buy	2027.96	7.15
5387	10	Ethereum	buy	2371.17	7.73
5388	4	Bitcoin	buy	54676.06	2.7
5390	9	Bitcoin	buy	54888.42	8.65
5462	7	Bitcoin	buy	59763.23	1.37
5391	2	Bitcoin	buy	43767.56	9.18
5827	8	Bitcoin	buy	59727.78	6.13
6407	7	Ethereum	sell	3842.4	2.18
5393	10	Bitcoin	buy	49539.4	1.03
5394	1	Bitcoin	buy	57257.26	9.36
5734	8	Ethereum	buy	2794.33	8.88
5395	5	Ethereum	buy	2240.31	9.15
5397	3	Bitcoin	buy	43040.38	7.25
5398	6	Ethereum	buy	2258.12	2.58
6398	3	Bitcoin	buy	58485.69	7.3
5400	4	Bitcoin	buy	48193.8	5.39
5401	6	Bitcoin	buy	40608.91	8.61
5402	4	Ethereum	buy	2578.95	2.23
6415	2	Ethereum	buy	2689.95	2.68
5404	3	Bitcoin	buy	42533.19	1.36
5405	1	Ethereum	sell	3825.27	8.55
5406	2	Ethereum	buy	2462.73	6.84
5407	5	Bitcoin	buy	40381.48	1.95
5408	1	Bitcoin	buy	59211.64	9.83
5739	1	Bitcoin	buy	50633.13	3.65
5410	7	Bitcoin	buy	48318.61	8.88
5411	4	Bitcoin	buy	46158.45	4.88
5744	7	Bitcoin	buy	47964.93	9.9
5413	10	Bitcoin	buy	44268.26	7.55
5415	5	Ethereum	buy	2471.64	1.73
5464	4	Bitcoin	buy	46346.36	6.85
5416	4	Ethereum	buy	2387.92	8.33
5418	9	Bitcoin	buy	53017.23	9.17
5420	1	Bitcoin	buy	59901.76	6.13
5421	9	Bitcoin	buy	40809.92	1.48
5422	2	Bitcoin	buy	47781.97	2.08
5423	7	Ethereum	buy	2392.38	9.64
5424	6	Ethereum	buy	2723.14	2.44
5466	2	Ethereum	buy	2371.43	3.67
5425	1	Ethereum	buy	2778.98	7.4
5426	3	Bitcoin	buy	54600.65	5.76
5427	5	Bitcoin	buy	48125.29	1.88
5428	4	Bitcoin	buy	58472.46	1.11
5429	7	Bitcoin	buy	55650.61	5.68
5764	5	Ethereum	sell	3768.92	5.66
5774	6	Bitcoin	buy	57620.21	6.46
5432	6	Bitcoin	buy	48194.35	1.51
5802	10	Bitcoin	buy	52456.99	6.54
5434	4	Ethereum	buy	2316.38	5.82
5810	8	Bitcoin	buy	49442.81	7.77
5480	5	Bitcoin	buy	44995.57	4.16
5779	8	Bitcoin	buy	46124.68	10
5437	5	Bitcoin	buy	43076.61	2.17
5438	5	Bitcoin	buy	48697.15	6.77
5439	8	Ethereum	sell	3913.66	9.12
5830	4	Bitcoin	buy	55081.84	8.63
5467	10	Bitcoin	buy	52507.66	6
5441	4	Bitcoin	buy	44880.42	4.13
5442	5	Bitcoin	buy	46360.16	3.51
5443	7	Ethereum	buy	2280.91	8.6
5444	1	Bitcoin	buy	54638.91	8.72
5794	7	Ethereum	buy	2046.82	1.75
5446	4	Bitcoin	buy	46221.95	5.83
5468	7	Ethereum	buy	2634.03	7.93
5469	4	Bitcoin	buy	41737.1	2.16
5447	10	Bitcoin	buy	53009.81	8.62
5448	3	Bitcoin	buy	45938.93	5.96
5798	6	Ethereum	buy	2768.62	9.56
5450	1	Bitcoin	buy	58380.33	8.08
5481	9	Bitcoin	buy	57489.6	5.2
5452	10	Ethereum	buy	2248.97	5.2
5833	9	Ethereum	buy	2654.35	3.12
5456	7	Bitcoin	buy	54661.65	4.61
5458	9	Bitcoin	buy	49864.94	9.56
5821	2	Bitcoin	buy	54635.7	4.95
5470	4	Bitcoin	buy	40108.6	3.96
5836	5	Bitcoin	buy	43106.28	1.79
5473	2	Ethereum	buy	2058	2.97
5839	9	Bitcoin	buy	40552.25	3.39
5474	5	Bitcoin	buy	52115.93	2.44
5841	8	Ethereum	buy	2464	1.97
5843	6	Ethereum	buy	2026.69	1.53
5476	9	Bitcoin	buy	54867.31	5.17
5845	1	Bitcoin	buy	55458.44	4.2
5848	2	Bitcoin	buy	57847.56	1.28
5478	10	Bitcoin	buy	59349.91	9.42
5482	2	Bitcoin	buy	40392.2	6.74
5854	6	Bitcoin	buy	52201.53	2.08
5484	2	Bitcoin	buy	44548.06	4.21
5485	8	Bitcoin	buy	59398.94	2.61
5487	2	Bitcoin	buy	48973.38	8.89
5488	3	Bitcoin	buy	44271.26	9.82
5489	9	Bitcoin	buy	45623.7	8.79
5490	4	Ethereum	buy	2577.03	8.89
5491	1	Bitcoin	buy	52285.87	6.9
5492	7	Bitcoin	buy	44090.87	1.03
5860	3	Ethereum	buy	2149.07	8.09
6343	2	Ethereum	buy	2137.32	1.71
5494	3	Ethereum	buy	2173.02	6.43
5495	6	Bitcoin	buy	50938.63	8.31
5496	7	Ethereum	buy	2161.84	5.8
5497	5	Bitcoin	buy	56959.67	3.35
5498	6	Ethereum	buy	2779.08	2.59
6354	3	Bitcoin	buy	52663.7	1.07
5500	4	Ethereum	buy	2503.73	7.43
6363	4	Bitcoin	buy	43128.6	4.65
5692	9	Ethereum	buy	2669.21	1.73
5503	8	Ethereum	buy	2629.14	4.74
5504	5	Bitcoin	buy	54049.56	6.95
5505	5	Ethereum	buy	2710.37	9.32
5700	2	Bitcoin	buy	46384.41	6.06
5507	3	Bitcoin	buy	59919.9	2.8
5508	4	Bitcoin	buy	57686	7.87
5765	9	Bitcoin	buy	43274.83	6.94
5770	3	Bitcoin	buy	48282.93	4
6372	5	Bitcoin	buy	59946.66	8.93
5511	7	Bitcoin	buy	53550.91	5.67
6381	6	Bitcoin	buy	44129.91	2.7
5513	1	Bitcoin	buy	55351.13	9.11
5514	10	Ethereum	buy	2440.21	9.48
5515	6	Bitcoin	buy	58923.73	4.96
5713	1	Bitcoin	buy	47835.3	3.99
5517	6	Bitcoin	buy	55082.82	3.63
5518	8	Bitcoin	buy	49013.58	8.52
5588	8	Bitcoin	buy	56652.89	3.81
5519	1	Bitcoin	buy	56328.3	9.62
5520	5	Bitcoin	buy	53853.72	4.17
5589	6	Ethereum	buy	2210.47	2.77
5521	1	Bitcoin	buy	55643.33	4.68
5522	7	Bitcoin	buy	40738.11	8.53
5523	7	Bitcoin	buy	46322.38	9.64
5524	4	Bitcoin	buy	55679.58	7.82
5525	5	Bitcoin	buy	44651.23	3.97
5526	5	Bitcoin	buy	55070.19	7.51
5527	4	Bitcoin	buy	53584.33	2.74
5528	9	Ethereum	buy	2200.59	8.14
5529	6	Ethereum	buy	2078.58	4.8
5530	3	Ethereum	buy	2227.65	7.28
5531	5	Bitcoin	buy	42621.2	8.95
5532	10	Bitcoin	buy	53169.79	4.17
6390	7	Bitcoin	buy	56517.8	2.93
5535	7	Bitcoin	buy	46019.43	6.27
5590	6	Ethereum	buy	2155.96	8.6
5536	1	Ethereum	sell	3819.98	1.59
5591	5	Bitcoin	buy	49673.46	4
5537	5	Bitcoin	buy	51485.22	9.69
5538	7	Bitcoin	buy	43680.71	6.16
5539	8	Bitcoin	buy	47060.73	4.51
5540	10	Bitcoin	buy	59038.42	4.75
5541	5	Bitcoin	buy	42699.74	7.35
5542	1	Bitcoin	buy	58482.54	2.62
5543	5	Bitcoin	buy	57091.19	8.01
5544	9	Bitcoin	buy	46086.24	1.39
5545	5	Ethereum	buy	2303.3	7.36
6408	9	Bitcoin	buy	45278.9	6.21
5547	4	Bitcoin	buy	45055.49	7.23
5548	7	Ethereum	buy	2332.61	4.1
5550	4	Bitcoin	buy	45607.32	1.87
5775	6	Ethereum	buy	2449.33	1.69
5552	8	Bitcoin	buy	48246.24	2.73
5725	5	Ethereum	sell	3792.28	9.51
5745	2	Bitcoin	buy	49748.06	6.55
5555	4	Bitcoin	buy	56247.71	3.93
5730	8	Ethereum	buy	2578.59	3.66
5557	5	Ethereum	buy	2569.54	2.07
5560	7	Bitcoin	buy	59642.59	6.38
5755	6	Bitcoin	buy	58938.76	4.82
5561	4	Ethereum	buy	2403.79	2.39
5562	2	Bitcoin	buy	41097.74	4.44
5563	5	Ethereum	buy	2573.31	3.18
5564	10	Ethereum	sell	3961.22	3.96
5565	10	Bitcoin	buy	54431.12	3.98
5566	5	Bitcoin	buy	56601.54	4.21
5600	4	Ethereum	buy	2520.37	3.84
5568	2	Bitcoin	buy	50027.23	8.42
5569	3	Ethereum	sell	3786.47	5.09
5570	8	Bitcoin	buy	59058.95	6.27
5760	5	Bitcoin	buy	53528.86	8.35
5572	3	Ethereum	sell	3798.32	3.37
5573	1	Bitcoin	buy	57300.74	9.8
5574	3	Bitcoin	buy	53795.6	7.14
5575	10	Ethereum	buy	2175.61	8.66
5576	7	Ethereum	buy	2654.06	7.52
5601	7	Bitcoin	buy	45925.06	2.32
5602	2	Bitcoin	buy	45109.91	9.41
5780	2	Ethereum	buy	2201.72	5.66
5615	5	Bitcoin	buy	44115.91	1.34
5603	6	Bitcoin	buy	49514.2	3.59
5579	1	Bitcoin	buy	46557.75	6.71
5580	2	Bitcoin	buy	59933.37	3.87
5581	4	Bitcoin	buy	58816.4	5.97
5785	3	Bitcoin	buy	50657.3	2.41
5583	3	Bitcoin	buy	55829.2	9.85
5790	10	Bitcoin	buy	51847.72	6.73
5584	7	Bitcoin	buy	40864.19	5.59
5585	9	Ethereum	buy	2616.79	5.15
5594	4	Ethereum	sell	3753.64	0.5000000000000022
5534	2	Ethereum	sell	3751.08	0.5200000000000005
5593	5	Ethereum	buy	2178.69	3.99
5595	2	Ethereum	buy	2461.87	7.88
5596	7	Bitcoin	buy	48633.1	7.05
5597	2	Bitcoin	buy	44582.05	2.08
5599	7	Bitcoin	buy	40208.69	3.18
5605	8	Ethereum	buy	2821.49	5.6
5606	4	Ethereum	buy	2358.49	1.16
5607	2	Bitcoin	buy	44775.49	8.07
5608	9	Ethereum	buy	2348.21	6.26
5609	8	Bitcoin	buy	42701.88	3.43
5614	5	Bitcoin	buy	50342.78	7.68
5616	6	Ethereum	buy	2174.16	8.37
5619	4	Bitcoin	buy	53999.64	7.73
5620	10	Bitcoin	buy	53869.43	3.51
5621	10	Bitcoin	buy	43128.51	9.76
5622	5	Bitcoin	buy	40913.13	5.08
5624	10	Bitcoin	buy	53010.29	5.26
5625	5	Bitcoin	buy	44838.78	1.83
5626	4	Bitcoin	buy	48590.87	9.44
5627	6	Ethereum	buy	2777.21	6.77
5628	10	Ethereum	buy	2061.35	9.22
5629	4	Bitcoin	buy	50729.29	3.48
5630	6	Ethereum	buy	2707.58	2.09
5871	10	Ethereum	buy	2821.8	2.52
5631	5	Ethereum	buy	2568.65	8.71
5682	10	Ethereum	buy	2092.19	2.53
5898	1	Bitcoin	buy	41574.62	2.13
5693	3	Bitcoin	buy	52601.52	2.7
5634	8	Bitcoin	buy	44122.18	8.98
5635	4	Bitcoin	buy	52030.75	2.05
5872	10	Ethereum	buy	2170.42	5.84
5638	4	Bitcoin	buy	57424.62	9.69
5639	1	Bitcoin	buy	47210.33	3.32
5708	10	Ethereum	buy	2302.76	2.95
5641	2	Bitcoin	buy	57703.19	2.25
5642	9	Bitcoin	buy	54999.38	1.22
5643	5	Bitcoin	buy	52213.72	1.87
5644	2	Ethereum	buy	2097.44	3.76
5714	5	Bitcoin	buy	52492.07	9.04
5645	2	Bitcoin	buy	53761.1	5.85
5646	2	Bitcoin	buy	44944.91	1.54
5720	6	Bitcoin	buy	56727.46	3.71
5648	9	Bitcoin	buy	49341.74	8.75
5726	5	Ethereum	sell	3949.85	1.06
5650	10	Bitcoin	buy	42544.32	4.55
5651	4	Ethereum	buy	2018.32	1.3
5652	5	Bitcoin	buy	45244.92	2.25
5731	7	Bitcoin	buy	58835.06	9.39
5873	10	Bitcoin	buy	56507.31	5.32
5736	2	Bitcoin	buy	49148.21	5.43
5654	7	Bitcoin	buy	53609.62	2.14
5874	3	Bitcoin	buy	57053.43	5.96
5741	6	Ethereum	buy	2823.28	3.9
5656	4	Bitcoin	buy	40123.01	8.66
6409	5	Bitcoin	buy	41224.35	5.65
5659	4	Ethereum	buy	2610.18	4.07
5660	1	Ethereum	buy	2130.79	2.92
6391	7	Bitcoin	buy	46132.98	4.59
6400	6	Bitcoin	buy	55970.08	3.31
5664	4	Bitcoin	buy	42646.32	8.14
5875	6	Bitcoin	buy	55256.42	5.21
5665	9	Bitcoin	buy	44977.6	1.37
5666	4	Ethereum	buy	2290.7	4
6423	4	Ethereum	sell	3917.52	1.99
5668	2	Ethereum	sell	3838.48	6.22
5669	1	Bitcoin	buy	47054.64	3.17
5746	6	Bitcoin	buy	46850.24	8.27
5751	9	Bitcoin	buy	52601.38	9.56
5756	3	Bitcoin	buy	47609.71	7.09
5761	9	Bitcoin	buy	59403.96	7.08
5766	1	Bitcoin	buy	55377.43	9.94
5771	9	Bitcoin	buy	49518.51	9.85
5776	1	Bitcoin	buy	42300.17	4.71
5781	10	Bitcoin	buy	53662.96	4.13
5877	9	Ethereum	buy	2640.59	6.47
5786	1	Bitcoin	buy	54533.9	9.94
5791	10	Ethereum	buy	2065.59	2.17
5796	7	Bitcoin	buy	42378.49	5.62
6428	2	Ethereum	sell	3797.3	4.02
5803	4	Bitcoin	buy	40150.51	8.62
5807	10	Ethereum	buy	2295.31	6.5
6433	6	Bitcoin	buy	46904.73	3.84
5814	6	Bitcoin	buy	59566.67	9.28
5816	8	Ethereum	buy	2040.13	2.43
5819	6	Bitcoin	buy	47673.26	7.76
5822	2	Bitcoin	buy	47329.07	2.19
5825	5	Ethereum	buy	2507.38	8.38
6437	4	Bitcoin	buy	54659.29	9.52
5831	6	Bitcoin	buy	40747.99	2.45
5834	9	Bitcoin	buy	56775.48	3.51
5837	8	Bitcoin	buy	52708.82	3.54
6442	8	Bitcoin	buy	46770.05	4.18
6446	10	Ethereum	sell	3867.95	1.81
5844	3	Ethereum	buy	2179.4	4.87
5846	7	Bitcoin	buy	57211.69	9.22
5849	8	Bitcoin	buy	50886.56	7.07
6452	5	Bitcoin	buy	59774.72	2.06
6456	9	Bitcoin	buy	47038.34	9.2
5851	10	Ethereum	buy	2044.35	6.88
6460	3	Bitcoin	buy	53882.48	9.95
5885	2	Bitcoin	buy	41713.52	8.21
5895	1	Bitcoin	buy	53174.74	5.49
5855	4	Bitcoin	buy	52793.14	8.41
6468	10	Ethereum	buy	2651.3	5.77
5861	5	Bitcoin	buy	58639.71	3.57
5863	4	Bitcoin	buy	48708.97	3.72
5864	8	Bitcoin	buy	51501.79	7.23
6474	5	Bitcoin	buy	59969.21	8.08
5899	8	Bitcoin	buy	42791.25	2.78
5866	5	Bitcoin	buy	51689.56	9.02
5867	9	Bitcoin	buy	40463.65	2.79
6477	6	Ethereum	buy	2673.17	9.58
6480	2	Ethereum	sell	3822.11	2.7
5869	9	Ethereum	buy	2115.64	3.04
5870	4	Bitcoin	buy	50979.04	7.84
5901	7	Bitcoin	buy	51237.63	2.21
5878	3	Bitcoin	buy	50645.21	7.64
5879	7	Bitcoin	buy	42511.06	1.53
5880	7	Ethereum	buy	2786.93	5.16
5881	7	Bitcoin	buy	42056.04	5.95
5882	2	Bitcoin	buy	43341.79	4.38
5886	8	Bitcoin	buy	48428.51	9.31
5887	10	Bitcoin	buy	53037	2.32
5888	3	Bitcoin	buy	53480.68	6.12
5889	2	Ethereum	buy	2406.95	2.6
5857	4	Ethereum	buy	2835.49	0.05999999999995875
5891	3	Bitcoin	buy	46427.35	4.77
5892	10	Bitcoin	buy	44766.54	4.7
5894	5	Bitcoin	buy	54008.8	8.9
5904	7	Ethereum	buy	2180.23	9.81
5905	4	Ethereum	buy	2267.6	1.71
5906	8	Bitcoin	buy	56517.25	8.67
5907	1	Bitcoin	buy	54643.13	4.36
6410	4	Bitcoin	buy	54365.75	5.48
5908	4	Ethereum	buy	2513.72	1.17
5993	9	Bitcoin	buy	49408.82	1.6
6356	5	Bitcoin	buy	55725.01	1.52
6374	9	Bitcoin	buy	42060.61	1.48
5911	2	Ethereum	buy	2672.92	2.43
5913	10	Bitcoin	buy	45028.17	2.34
5914	2	Ethereum	sell	3866.5	1.62
5915	4	Ethereum	buy	2183.69	5.91
5916	10	Ethereum	sell	3827.32	1.66
5917	2	Bitcoin	buy	47746.29	1.88
6392	2	Ethereum	sell	3794.4	8.98
5918	2	Bitcoin	buy	42367.8	7.41
5919	2	Bitcoin	buy	41253.26	2.89
5920	1	Bitcoin	buy	53166.33	6.76
5921	10	Bitcoin	buy	40271.63	1.38
5922	9	Bitcoin	buy	59484.07	2.78
5994	8	Bitcoin	buy	59483.29	1.53
5923	1	Bitcoin	buy	58174.06	2.41
6424	8	Ethereum	buy	2443.61	7.63
5925	7	Ethereum	buy	2127.24	6.35
5926	8	Bitcoin	buy	40290.2	9.33
5996	4	Bitcoin	buy	41081.95	4.22
6434	8	Bitcoin	buy	41957.89	5.93
5928	4	Ethereum	buy	2523.63	6.86
5929	5	Bitcoin	buy	57874.52	6.6
5997	9	Ethereum	buy	2075.26	8.84
5930	8	Bitcoin	buy	59162.55	5.9
5931	5	Bitcoin	buy	50674.7	9.96
5933	9	Bitcoin	buy	50300.48	4.37
5934	2	Bitcoin	buy	45241.1	6.75
5935	1	Bitcoin	buy	50184.11	7.31
5936	9	Bitcoin	buy	46948.42	4.82
6443	3	Bitcoin	buy	52345.42	2.17
5937	1	Bitcoin	buy	43494.08	7.65
5938	5	Bitcoin	buy	40027.91	2.04
6447	9	Ethereum	buy	2690.8	7.6
5999	7	Ethereum	sell	3922.6	1.53
5941	3	Bitcoin	buy	44584.03	3.21
5942	5	Ethereum	sell	3805.77	7.03
5943	7	Bitcoin	buy	47045.65	3.53
6000	8	Bitcoin	buy	44438.11	8.03
5944	4	Bitcoin	buy	50912.81	4.45
5945	6	Bitcoin	buy	49728.25	5.46
5946	4	Bitcoin	buy	44598.14	9.33
5947	8	Ethereum	buy	2681.98	4.24
5948	1	Ethereum	buy	2169.73	4.22
5949	8	Bitcoin	buy	47352.48	4.6
6457	4	Ethereum	buy	2245.85	3.11
5951	8	Bitcoin	buy	46415.06	4.13
5952	10	Bitcoin	buy	45464.87	3.94
5953	7	Bitcoin	buy	48291.07	5.52
5954	7	Bitcoin	buy	56557.75	7.88
6461	5	Bitcoin	buy	50716.78	1.08
5956	3	Bitcoin	buy	53920.48	2.44
6465	1	Bitcoin	buy	57034.55	7.35
5958	5	Ethereum	buy	2663.44	9.63
5959	7	Ethereum	sell	3959.18	3.6
5960	3	Bitcoin	buy	59402.92	7.46
5961	5	Bitcoin	buy	55744.95	2.43
6014	3	Bitcoin	buy	49235.79	1.36
5964	9	Bitcoin	buy	48526.95	4.71
5965	9	Bitcoin	buy	53730.13	8.81
5967	10	Ethereum	buy	2776.01	7.79
5968	10	Ethereum	sell	3997.19	1.16
6002	8	Bitcoin	buy	45333.26	3.66
5970	4	Bitcoin	buy	54792.89	8.78
5971	10	Bitcoin	buy	54268.65	1.46
5972	7	Ethereum	buy	2256.71	6.35
5973	1	Bitcoin	buy	51169.51	6.46
6015	10	Bitcoin	buy	59863.79	3.74
5974	2	Ethereum	buy	2702.53	4.57
5977	3	Ethereum	buy	2523.1	3.87
5978	8	Bitcoin	buy	46796.1	7.5
5979	5	Ethereum	buy	2532.89	3.97
6016	4	Bitcoin	buy	52158.56	5.38
5980	10	Ethereum	buy	2003.99	5.45
5981	9	Bitcoin	buy	52702.82	2.38
5982	1	Ethereum	buy	2436.45	6.74
5983	4	Ethereum	buy	2445.17	3.8
5984	8	Bitcoin	buy	46847.02	3.45
5985	2	Bitcoin	buy	40099.75	6.79
5986	4	Bitcoin	buy	48122.14	4.74
5987	10	Ethereum	sell	3944.41	8.4
5988	4	Bitcoin	buy	57803.85	1.61
5989	1	Ethereum	buy	2665.07	9.34
5990	1	Ethereum	buy	2156.07	4.62
5992	6	Bitcoin	buy	56687.19	9.91
6003	9	Ethereum	buy	2384.27	2.2
6006	1	Bitcoin	buy	42754.72	2.18
6007	7	Bitcoin	buy	42956.03	4.3
6022	1	Bitcoin	buy	59689.25	9.54
6023	1	Bitcoin	buy	42796.44	5.27
6011	2	Ethereum	sell	3963.92	9.5
6013	1	Bitcoin	buy	49295.42	8.4
6017	4	Bitcoin	buy	45723.42	3.77
6018	3	Bitcoin	buy	59655.35	1.89
6024	9	Bitcoin	buy	40357.16	8.77
6025	8	Bitcoin	buy	47799.81	5.02
6028	9	Bitcoin	buy	40947.19	3.55
6029	3	Bitcoin	buy	43570.2	7.84
6032	4	Bitcoin	buy	43974.9	4.41
6033	2	Ethereum	buy	2015.31	2.52
6034	1	Ethereum	buy	2766.84	1.87
6035	4	Bitcoin	buy	47054.22	5.55
6036	6	Bitcoin	buy	51404.35	9.43
6037	6	Bitcoin	buy	46058.44	2.16
6038	10	Bitcoin	buy	48670.08	2.67
6039	7	Bitcoin	buy	54695.65	3.89
6040	7	Bitcoin	buy	57776.59	8.15
6346	6	Ethereum	buy	2475.8	8.28
6357	9	Bitcoin	buy	45112.66	9.87
6366	5	Ethereum	buy	2002.84	8.94
6375	2	Bitcoin	buy	48913.65	7.96
6045	9	Bitcoin	buy	50850.86	3.27
6384	5	Bitcoin	buy	47090.53	7.19
6393	3	Bitcoin	buy	42169.78	3.89
6402	3	Bitcoin	buy	47916.84	3.97
6411	5	Bitcoin	buy	49819.7	6.17
6419	4	Bitcoin	buy	55068.19	9.81
6425	6	Bitcoin	buy	51843.86	2.85
6048	6	Bitcoin	buy	51807.79	2.12
6049	8	Ethereum	buy	2105.52	7.55
6050	2	Ethereum	buy	2124.83	7.92
6051	3	Bitcoin	buy	43361.76	3.55
6052	1	Bitcoin	buy	49763.65	2.59
6430	2	Bitcoin	buy	49946.55	2.35
6435	1	Ethereum	sell	3801.09	4.56
6055	7	Ethereum	buy	2572.78	2.15
6057	9	Bitcoin	buy	57180.21	8.87
6058	8	Ethereum	sell	3946.43	4.73
6061	2	Bitcoin	buy	54670.16	8.29
6062	5	Bitcoin	buy	44971.92	7.79
6063	10	Bitcoin	buy	48581.02	5.64
6444	3	Ethereum	buy	2086.62	4.85
6135	2	Ethereum	buy	2067.46	7.55
6065	1	Bitcoin	buy	58204.13	6.47
6066	9	Ethereum	buy	2134.07	3.04
6067	4	Ethereum	buy	2601.65	2.4
6068	6	Bitcoin	buy	40581.75	6.31
6136	5	Ethereum	sell	3895.43	3.35
6069	1	Ethereum	buy	2342	6.77
6475	3	Bitcoin	buy	43839.48	6.89
6137	1	Bitcoin	buy	41273.61	9.54
6071	6	Ethereum	buy	2221.69	3.98
6448	1	Bitcoin	buy	52056.19	4.35
6074	7	Bitcoin	buy	40593.28	2.49
6075	6	Bitcoin	buy	57470.13	6.93
6076	1	Ethereum	buy	2661.3	8.91
6454	1	Bitcoin	buy	54221.33	4.25
6078	4	Bitcoin	buy	43701.4	6.42
6458	8	Ethereum	sell	3858.45	9.18
6462	1	Ethereum	buy	2192.33	6.34
6081	8	Bitcoin	buy	45378.65	2.61
6082	10	Ethereum	buy	2259.8	5.51
6466	10	Bitcoin	buy	40918.36	8.71
6056	10	Bitcoin	buy	59994.32	6.71
6084	4	Ethereum	sell	3994.52	2.21
6085	2	Ethereum	buy	2332.95	2.45
6086	4	Ethereum	sell	3782.66	8.8
6087	10	Bitcoin	buy	52620.79	5.24
6088	2	Bitcoin	buy	53495.47	6.2
6089	6	Bitcoin	buy	51374.62	6.79
6090	6	Ethereum	buy	2266.95	5.19
6091	5	Bitcoin	buy	58615.31	9.24
6092	1	Bitcoin	buy	54977.26	4.64
6093	2	Ethereum	buy	2003.83	6.58
6094	1	Bitcoin	buy	49231.34	6.18
6097	4	Ethereum	buy	2226.95	2.86
6098	8	Ethereum	buy	2782.36	1.33
6158	10	Bitcoin	buy	44786.74	3.5
6099	1	Bitcoin	buy	56686.2	5.56
6478	6	Ethereum	buy	2106.82	8.78
6481	10	Bitcoin	buy	58832.58	3.39
6484	1	Bitcoin	buy	58361.03	7.91
6486	8	Ethereum	buy	2139.06	6.89
6142	2	Bitcoin	buy	55679.73	9.35
6104	9	Bitcoin	buy	50552.86	6.62
6490	10	Bitcoin	buy	43453.29	7.65
6106	3	Bitcoin	buy	59271.64	5.45
6108	8	Bitcoin	buy	52454.33	1.46
6109	4	Ethereum	buy	2573.36	8.05
6110	9	Bitcoin	buy	48171.51	7.86
6111	3	Bitcoin	buy	44632.89	7.06
6112	6	Ethereum	sell	3962.2	3.99
6115	4	Ethereum	buy	2388.62	6.55
6116	7	Bitcoin	buy	42704.41	2.7
6117	5	Bitcoin	buy	56415.92	2.99
6118	9	Bitcoin	buy	48137.86	9.93
6119	5	Bitcoin	buy	53453.01	4.71
6120	9	Bitcoin	buy	48729.28	9.89
6122	1	Ethereum	sell	3903.96	8.56
6123	1	Bitcoin	buy	53906.72	6.49
6125	3	Bitcoin	buy	57817.6	4.86
6126	7	Bitcoin	buy	51491.75	7.11
6127	4	Ethereum	sell	3893.54	8.22
6128	1	Ethereum	buy	2802.79	2.2
6129	1	Bitcoin	buy	42911.96	6.59
6130	4	Bitcoin	buy	40812.54	8.72
6131	6	Bitcoin	buy	40317.27	8.59
6132	6	Bitcoin	buy	52495.73	3.25
6143	4	Bitcoin	buy	50730.7	6.9
6138	6	Ethereum	sell	3753.35	2.81
6145	6	Bitcoin	buy	50926	4.54
6161	2	Bitcoin	buy	43076.81	4
6146	6	Bitcoin	buy	58390.18	8.46
6148	8	Bitcoin	buy	48247.97	5.02
6151	8	Ethereum	buy	2586.8	1.87
6153	5	Ethereum	sell	3830.96	3.23
6154	8	Ethereum	buy	2489.82	7.5
6155	3	Bitcoin	buy	48485.18	3.35
6156	1	Bitcoin	buy	53155.26	9.64
6163	10	Ethereum	buy	2690.48	6.94
6164	6	Bitcoin	buy	43949.06	9.96
6165	2	Bitcoin	buy	58166.08	1.21
6166	5	Bitcoin	buy	55451.5	8.06
6167	9	Bitcoin	buy	48075.23	5.96
6168	2	Bitcoin	buy	48876.78	2.58
6169	6	Ethereum	buy	2512.88	6.13
6170	8	Ethereum	buy	2327.2	9.33
6172	1	Bitcoin	buy	40520.68	3.39
6174	4	Ethereum	sell	3918.99	3.54
6175	10	Ethereum	buy	2680.45	8.48
6176	8	Bitcoin	buy	59721.76	7.36
6347	5	Ethereum	buy	2824.06	6.03
6177	1	Ethereum	buy	2316.47	6.84
6385	7	Bitcoin	buy	43655.25	9.76
6179	5	Bitcoin	buy	59524.22	9.45
6403	1	Bitcoin	buy	40691.24	7.79
6181	2	Bitcoin	buy	50693.17	9.76
6260	5	Bitcoin	buy	40244.06	2.29
6184	6	Bitcoin	buy	44506.01	9.01
6185	10	Bitcoin	buy	57013.2	8.82
6263	1	Ethereum	sell	3721.36	4.2
6367	8	Bitcoin	buy	52299.14	7.78
6188	7	Bitcoin	buy	58512.17	8.44
6190	10	Ethereum	buy	2576.39	8.93
6191	6	Bitcoin	buy	51803.41	2.59
6193	6	Ethereum	buy	2029.84	1.27
6194	4	Bitcoin	buy	40951.18	7.52
6412	7	Ethereum	buy	2223.21	2.58
6196	6	Bitcoin	buy	49614.06	8.06
6197	1	Bitcoin	buy	43834.24	6.99
6198	10	Bitcoin	buy	55160.16	7.15
6262	5	Bitcoin	buy	41122.35	9.96
6199	6	Ethereum	buy	2057.55	6.06
6200	6	Bitcoin	buy	53214.88	6.33
6420	8	Ethereum	buy	2377.99	9.07
6201	8	Bitcoin	buy	55298.25	2.27
6426	10	Bitcoin	buy	41887.08	2.1
6203	8	Bitcoin	buy	58806.52	5.53
6204	3	Bitcoin	buy	58470.4	2.68
6205	1	Bitcoin	buy	46406.97	1.1
6267	8	Ethereum	sell	3742.01	2.4499999999999975
6431	10	Bitcoin	buy	59712.85	9.73
6208	5	Ethereum	buy	2367.81	1.27
6209	6	Ethereum	buy	2123.96	3.28
6210	6	Bitcoin	buy	45188.24	4.9
6265	1	Bitcoin	buy	59016.3	3.29
6440	6	Bitcoin	buy	55419.35	1.2
6211	10	Ethereum	buy	2585.34	6.57
6212	3	Bitcoin	buy	41304.9	5.73
6214	6	Bitcoin	buy	53147.49	8.96
6216	8	Ethereum	buy	2410.06	7.97
6217	1	Bitcoin	buy	53738.65	1.48
6219	3	Bitcoin	buy	46354.85	2.37
6220	5	Ethereum	buy	2394.82	3.36
6269	8	Bitcoin	buy	43448.9	3.93
6222	7	Ethereum	sell	3747.8	1.8
6223	1	Ethereum	buy	2275.56	9.85
6224	6	Ethereum	buy	2292.86	7.51
6225	8	Ethereum	buy	2679.34	8.25
6297	7	Ethereum	buy	2641.93	6.78
6227	2	Bitcoin	buy	48935.82	2.08
6228	2	Ethereum	buy	2073.99	5.81
6270	2	Bitcoin	buy	40842.45	3.7
6231	8	Bitcoin	buy	51608.11	3.06
6271	4	Ethereum	buy	2708.38	9.36
6232	9	Bitcoin	buy	54316.82	8.85
6235	3	Bitcoin	buy	49445.43	3.24
6236	7	Ethereum	buy	2033.26	3.32
6237	1	Bitcoin	buy	53677.48	8.84
6272	3	Ethereum	sell	3991.39	2.51
6238	5	Ethereum	buy	2233.18	9
6239	8	Bitcoin	buy	48796.75	5.68
6273	3	Bitcoin	buy	42655.59	2.02
6240	6	Bitcoin	buy	57077.78	5.84
6242	10	Bitcoin	buy	45887.86	5.83
6243	5	Bitcoin	buy	41135.72	3.57
6286	6	Ethereum	buy	2400.18	5.7
6287	1	Bitcoin	buy	44485.57	1.22
6288	1	Ethereum	buy	2776.28	1.19
6245	4	Bitcoin	buy	46180.13	7.73
6289	6	Bitcoin	buy	47263.78	5.27
6246	6	Bitcoin	buy	55402.27	7.98
6247	1	Bitcoin	buy	45119.03	3.43
6248	8	Ethereum	buy	2599	9.95
6249	6	Bitcoin	buy	56988.92	2.76
6251	9	Bitcoin	buy	52258.57	9.4
6253	9	Ethereum	buy	2692.23	6.54
6254	2	Bitcoin	buy	48761.89	5.39
6255	6	Ethereum	buy	2824.88	3.35
6256	6	Ethereum	buy	2048.61	6.58
6257	2	Bitcoin	buy	46639.28	7.14
6258	7	Bitcoin	buy	46540.73	1.32
6310	8	Ethereum	buy	2548.04	1.22
6274	4	Ethereum	buy	2262.5	5
6275	7	Ethereum	buy	2267.79	5.09
6276	4	Bitcoin	buy	41346.96	2.34
6298	2	Ethereum	buy	2548.81	4.03
6277	3	Ethereum	sell	3809.81	9.28
6299	4	Bitcoin	buy	41247.03	1.91
6278	8	Bitcoin	buy	40091.67	8.75
6279	10	Bitcoin	buy	45376.08	2.79
6280	3	Bitcoin	buy	52661.79	1.7
6304	10	Ethereum	sell	3867.07	1.38
6281	7	Ethereum	sell	3959.61	3.76
6282	10	Bitcoin	buy	45045.58	1.1
6284	1	Bitcoin	buy	44263.42	5.37
6311	10	Bitcoin	buy	48457.7	1.02
6285	10	Bitcoin	buy	57241.28	5.45
6292	6	Bitcoin	buy	55285.73	1.84
6294	7	Bitcoin	buy	42807.32	8.54
6296	3	Bitcoin	buy	54090.03	1.99
6300	1	Bitcoin	buy	42883.85	1.99
6301	3	Bitcoin	buy	42209.87	7.43
6302	6	Ethereum	buy	2412.99	5.57
6303	1	Bitcoin	buy	44696.86	8.23
6305	5	Ethereum	buy	2120.61	9.55
6307	10	Ethereum	buy	2029.23	6.07
6309	10	Bitcoin	buy	51473.6	1.22
6312	2	Ethereum	buy	2421.7	7.66
6313	1	Ethereum	buy	2291.17	5.35
6314	1	Bitcoin	buy	45140.57	4.81
6348	9	Bitcoin	buy	46758.91	5.18
6318	5	Bitcoin	buy	40366.92	4.82
6322	7	Bitcoin	buy	46365.26	5.3
6323	4	Ethereum	buy	2197	8.59
6324	8	Ethereum	buy	2267.53	2.27
6325	10	Ethereum	buy	2057.88	3.93
6327	3	Bitcoin	buy	42218.98	7.73
6328	4	Ethereum	sell	3784.49	3.68
6329	8	Bitcoin	buy	53253.68	7.75
6330	10	Bitcoin	buy	40678.27	5.52
6331	3	Bitcoin	buy	44974.43	9.76
6332	1	Ethereum	buy	2440.17	6.6
6333	10	Ethereum	buy	2279.86	2.66
6533	6	Bitcoin	buy	45149.06	7.05
6334	3	Bitcoin	buy	47825.46	8.04
6335	9	Bitcoin	buy	41241.65	6.34
6534	8	Ethereum	sell	3999.02	6.88
6559	9	Bitcoin	buy	54229.64	5.98
6359	4	Bitcoin	buy	47066.27	8.2
6377	10	Bitcoin	buy	52925.08	1.27
6386	4	Ethereum	sell	3873.89	1.76
6535	10	Bitcoin	buy	58803.31	1.67
6536	1	Bitcoin	buy	41787.45	1.95
6395	3	Ethereum	buy	2215.86	3.97
6404	9	Bitcoin	buy	41844.16	2.48
6421	5	Ethereum	buy	2154.61	1.26
6427	1	Bitcoin	buy	59070.14	3.67
6432	1	Bitcoin	buy	55451.94	2.27
6441	9	Ethereum	buy	2295.8	7.23
6451	5	Bitcoin	buy	50722.18	6.03
6455	7	Ethereum	buy	2174.34	6.27
6459	7	Bitcoin	buy	59060.96	9.07
6463	5	Ethereum	buy	2237.36	4.04
6470	4	Bitcoin	buy	50164.02	7.81
6479	8	Bitcoin	buy	51199.6	9.42
6537	3	Bitcoin	buy	48118.25	2.47
5219	2	Bitcoin	buy	59997.5	2.86
6482	6	Bitcoin	buy	52151.91	2.16
6485	6	Bitcoin	buy	42011.7	6.47
6487	1	Bitcoin	buy	55174.81	3.24
6489	3	Ethereum	buy	2707.86	8.93
6491	9	Ethereum	buy	2610.86	2.49
6493	1	Bitcoin	buy	41290.97	4.63
6494	7	Bitcoin	buy	52285.74	4.91
6495	3	Bitcoin	buy	58415.9	7.99
6496	7	Ethereum	buy	2193.44	5.42
6538	2	Bitcoin	buy	48881.37	7.26
6498	1	Bitcoin	buy	46453.08	4.43
6501	9	Bitcoin	buy	54582.47	8.7
6502	3	Bitcoin	buy	45263.09	3.75
6504	7	Ethereum	buy	2574.8	7.28
6505	7	Bitcoin	buy	47260.34	7.14
6508	7	Bitcoin	buy	46574.21	7.86
6549	7	Ethereum	buy	2123.51	6.17
6510	9	Bitcoin	buy	43995.78	8.08
6511	3	Ethereum	buy	2612.37	1.56
6562	5	Bitcoin	buy	51739.57	2.85
6514	8	Ethereum	buy	2786.36	7
6515	3	Bitcoin	buy	43882.1	5.47
6516	4	Bitcoin	buy	52086.75	5.31
6517	10	Bitcoin	buy	41795.87	4.81
6518	1	Ethereum	buy	2446.26	9.87
6550	2	Ethereum	sell	3898.81	4.76
6520	7	Bitcoin	buy	56285.33	6.35
6522	7	Ethereum	sell	3771.05	5.84
6524	8	Bitcoin	buy	50881.5	3.23
6525	2	Bitcoin	buy	46023.84	4.99
6526	9	Ethereum	buy	2686.73	9.33
6551	10	Bitcoin	buy	51467.79	1.61
6528	7	Bitcoin	buy	45677.02	3.71
6530	9	Bitcoin	buy	56990.12	7.23
6531	2	Bitcoin	buy	50551.14	3.17
6539	3	Bitcoin	buy	52757.24	2.06
6540	8	Bitcoin	buy	44989.1	4.19
6541	8	Bitcoin	buy	40785.71	6.53
6542	10	Bitcoin	buy	57702.19	8.5
6543	7	Ethereum	buy	2509.96	2.64
6544	9	Bitcoin	buy	51713	7.34
6563	6	Bitcoin	buy	47638.63	5.58
6546	8	Bitcoin	buy	47498.03	8.96
6564	3	Bitcoin	buy	50167.59	1.87
6547	1	Bitcoin	buy	41950.74	8.31
6548	10	Bitcoin	buy	53359.39	1.31
6552	10	Bitcoin	buy	56842.27	4.14
6553	9	Bitcoin	buy	46873.11	9.6
6554	10	Ethereum	buy	2349.77	8.15
6555	10	Bitcoin	buy	45311.63	7.1
6557	3	Bitcoin	buy	41961.57	2.63
6558	4	Bitcoin	buy	40983.75	7.13
6560	5	Bitcoin	buy	59134.78	4
6561	6	Bitcoin	buy	56468.57	6.59
6565	2	Bitcoin	buy	41797.44	5.05
6566	1	Bitcoin	buy	56162.02	5.96
6567	3	Ethereum	buy	2123.47	3.14
6568	3	Bitcoin	buy	56668.82	3.42
6569	4	Ethereum	buy	2526.91	5.26
6570	2	Bitcoin	buy	55706.67	9.78
6571	9	Bitcoin	buy	46271.22	7.15
6574	9	Bitcoin	buy	50910.43	8.78
6575	1	Ethereum	buy	2709.35	9.19
6576	3	Ethereum	buy	2379.07	4.2
6578	1	Ethereum	sell	3918.33	4.47
6579	10	Bitcoin	buy	41613.81	6.52
6580	3	Bitcoin	buy	47667.77	1.5
6581	7	Bitcoin	buy	46414.85	8.37
6582	6	Bitcoin	buy	59420.3	5.45
6583	4	Ethereum	sell	3946.06	8.59
6584	3	Ethereum	buy	2203.47	6.98
6586	4	Bitcoin	buy	54176.37	3.47
6587	6	Bitcoin	buy	52677.6	6.28
6588	4	Ethereum	sell	3748.54	1.23
6589	9	Bitcoin	buy	42532.8	8.92
6590	2	Ethereum	buy	2665.96	5.89
6667	5	Bitcoin	buy	55885.17	4.98
6592	9	Bitcoin	buy	49152.99	9.67
6593	4	Ethereum	buy	2269.65	5.11
6594	2	Bitcoin	buy	41035.81	3.15
6595	4	Ethereum	sell	3987.12	1.5
6596	6	Bitcoin	buy	56145.44	6.57
6597	8	Bitcoin	buy	41427.42	2.62
6598	5	Bitcoin	buy	46169.5	2.91
6599	2	Bitcoin	buy	59650.47	2.95
6601	10	Ethereum	buy	2321.89	9.18
6602	1	Bitcoin	buy	48698.52	4.55
6604	6	Bitcoin	buy	52265.21	5.43
6605	6	Bitcoin	buy	57496.74	4.68
6606	4	Bitcoin	buy	41364.68	7.81
6607	7	Bitcoin	buy	50139.9	8.66
6608	6	Bitcoin	buy	57902.79	4.91
6609	4	Ethereum	sell	3954.45	4.53
6668	1	Ethereum	buy	2366.19	6.48
6610	4	Bitcoin	buy	58619.07	8.98
6611	7	Bitcoin	buy	48295.71	2.87
6669	9	Bitcoin	buy	52592.73	2.47
6612	10	Bitcoin	buy	50445.22	8.3
6670	3	Bitcoin	buy	54335.6	6.49
6615	8	Ethereum	buy	2283.84	7.14
6616	7	Ethereum	sell	3873.63	2.51
6617	2	Bitcoin	buy	52408.14	1.7
6618	1	Bitcoin	buy	47737.33	3.74
6620	10	Bitcoin	buy	54212.13	8.94
6621	10	Ethereum	buy	2314.94	6.25
6623	7	Ethereum	buy	2027.79	7.96
6625	7	Bitcoin	buy	58559.63	7.81
6626	6	Ethereum	buy	2013.86	1.4
6673	1	Ethereum	buy	2081.37	2.23
6627	8	Bitcoin	buy	52163.46	8.91
6628	5	Ethereum	buy	2208.52	4.16
6630	4	Bitcoin	buy	51141.32	6.77
6631	1	Bitcoin	buy	45356.37	6.73
6632	10	Bitcoin	buy	53104.54	5.12
6674	7	Bitcoin	buy	52838.19	9.38
6634	10	Bitcoin	buy	42058.92	5.86
6635	10	Bitcoin	buy	57679.59	6
6638	9	Ethereum	sell	3943.02	2.24
6639	7	Ethereum	sell	3940.31	5.53
6641	5	Bitcoin	buy	57197.66	6.01
6687	6	Bitcoin	buy	57016.29	3.28
6642	5	Bitcoin	buy	44848.95	2.18
6688	1	Ethereum	buy	2556.55	5.45
6644	9	Bitcoin	buy	59770.9	7.75
6645	10	Ethereum	sell	3733.47	1.13
6648	3	Bitcoin	buy	40925.91	8.17
6649	1	Ethereum	buy	2159.93	9.58
6650	3	Ethereum	sell	3669.81	2.45
6689	1	Bitcoin	buy	42915.04	2.81
6651	5	Bitcoin	buy	57582	8.67
6653	6	Bitcoin	buy	52613.06	1.07
6686	4	Ethereum	sell	2970.47	0.24999999999999956
6655	1	Ethereum	buy	2340.42	6.82
6690	2	Bitcoin	buy	48153.52	8.03
6657	7	Bitcoin	buy	55666.59	6.37
6658	6	Ethereum	sell	3679.15	2.39
6691	6	Ethereum	sell	3985.65	1.58
6661	8	Bitcoin	buy	52150.08	1.28
6692	8	Bitcoin	buy	43298.14	8.31
6662	8	Ethereum	buy	2507.3	8.99
6664	4	Bitcoin	buy	42771.24	6.49
6665	8	Bitcoin	buy	55729.66	7.72
6663	2	Ethereum	sell	3621.43	1.3300000000000027
6675	8	Bitcoin	buy	53155.38	1.96
6676	9	Bitcoin	buy	53652.22	4.86
6677	3	Ethereum	sell	3230.26	9.53
6678	5	Ethereum	buy	2796.95	3.7
6679	1	Bitcoin	buy	44999.73	9.99
6681	3	Bitcoin	buy	40511.07	3.46
6682	8	Bitcoin	buy	48357.34	1.53
6683	3	Bitcoin	buy	59338.3	6.9
6684	8	Bitcoin	buy	55142.54	1.35
6685	8	Bitcoin	buy	45252.92	8.2
\.


--
-- Data for Name: user_coins; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_coins (user_id, coin, amount) FROM stdin;
9	Bitcoin	0.5099999999999862
11	Ethereum	200000010
4	Bitcoin	0
10	Bitcoin	0.20999999999999996
2	Bitcoin	1.68
3	Ethereum	19.920000000000066
7	Bitcoin	0
2	Ethereum	23.000000000000036
5	Ethereum	28.190000000000055
11	Bitcoin	200000195.4188424
1	Bitcoin	0.76
8	Bitcoin	0.3411575577538797
7	Ethereum	6.420000000000038
6	Ethereum	3.3599999999999133
1	Ethereum	4.510000000000031
6	Bitcoin	0.04999999999999982
9	Ethereum	32.99000000000002
5	Bitcoin	0.9799999999999947
10	Ethereum	44.16000000000001
8	Ethereum	17.220000000000063
4	Ethereum	10.229999999999995
3	Bitcoin	0.05000000000000715
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, username, balances) FROM stdin;
3	bob	2418987.4833259485
11	bob	99999989116344.1
2	bob	2106781.905059255
8	bob	2392898.2856058786
7	bob	2138162.2103074156
6	bob	2127898.7454317855
1	alice	1590204.7296005397
9	bob	2075624.869078474
10	bob	2018260.9516543376
5	bob	1797575.5701424328
4	bob	2217261.1280782125
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.products_id_seq', 6713, true);


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

