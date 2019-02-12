--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2019-02-12 01:30:03 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12391)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 24646)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 16406)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 49198)
-- Name: campaigns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE campaigns (
    id bigint NOT NULL,
    pictures json,
    title character varying
);


--
-- TOC entry 202 (class 1259 OID 49196)
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 202
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- TOC entry 207 (class 1259 OID 57424)
-- Name: conversations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE conversations (
    id bigint NOT NULL,
    sender_id integer,
    recipient_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 57422)
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 206
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE conversations_id_seq OWNED BY conversations.id;


--
-- TOC entry 197 (class 1259 OID 16586)
-- Name: customer_connects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE customer_connects (
    id bigint NOT NULL,
    customer_id integer NOT NULL,
    friend_id integer NOT NULL,
    subject character varying,
    msg text NOT NULL,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 16584)
-- Name: customer_connects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE customer_connects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 196
-- Name: customer_connects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE customer_connects_id_seq OWNED BY customer_connects.id;


--
-- TOC entry 199 (class 1259 OID 24636)
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE customers (
    id bigint NOT NULL,
    username character varying NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL,
    address character varying NOT NULL,
    city character varying NOT NULL,
    state character varying NOT NULL,
    country character varying NOT NULL,
    customer_type character varying NOT NULL,
    status character varying,
    user_id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 24634)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 198
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- TOC entry 205 (class 1259 OID 57390)
-- Name: discussions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE discussions (
    id bigint NOT NULL,
    customer_connect_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 57388)
-- Name: discussions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE discussions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 204
-- Name: discussions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE discussions_id_seq OWNED BY discussions.id;


--
-- TOC entry 193 (class 1259 OID 16541)
-- Name: employee_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE employee_posts (
    id bigint NOT NULL,
    job_category character varying NOT NULL,
    employee_category character varying NOT NULL,
    job_duration character varying NOT NULL,
    pay_type character varying NOT NULL,
    employee_type character varying NOT NULL,
    employee_title character varying NOT NULL,
    employee_experience character varying NOT NULL,
    customer_id integer NOT NULL,
    description text NOT NULL,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 16539)
-- Name: employee_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE employee_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 192
-- Name: employee_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE employee_posts_id_seq OWNED BY employee_posts.id;


--
-- TOC entry 191 (class 1259 OID 16516)
-- Name: employer_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE employer_posts (
    id bigint NOT NULL,
    title character varying,
    description character varying,
    status character varying,
    customer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 16514)
-- Name: employer_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE employer_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 190
-- Name: employer_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE employer_posts_id_seq OWNED BY employer_posts.id;


--
-- TOC entry 195 (class 1259 OID 16573)
-- Name: insights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE insights (
    id bigint NOT NULL,
    available_date date NOT NULL,
    job_category character varying NOT NULL,
    employee_category character varying NOT NULL,
    job_duration character varying NOT NULL,
    pay_type character varying NOT NULL,
    employee_type character varying NOT NULL,
    employee_title character varying NOT NULL,
    employer_post_id integer NOT NULL,
    employee_experience character varying NOT NULL,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 194 (class 1259 OID 16571)
-- Name: insights_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE insights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 194
-- Name: insights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE insights_id_seq OWNED BY insights.id;


--
-- TOC entry 201 (class 1259 OID 24671)
-- Name: job_locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE job_locations (
    id bigint NOT NULL,
    location character varying NOT NULL,
    city character varying NOT NULL,
    state character varying NOT NULL,
    employer_post_id integer NOT NULL,
    status character varying,
    latitude double precision,
    longitude double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 24669)
-- Name: job_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE job_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 200
-- Name: job_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE job_locations_id_seq OWNED BY job_locations.id;


--
-- TOC entry 209 (class 1259 OID 57434)
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE messages (
    id bigint NOT NULL,
    conversation_id bigint,
    customer_id bigint,
    msg text NOT NULL,
    sender_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying DEFAULT 'unread'::character varying
);


--
-- TOC entry 208 (class 1259 OID 57432)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 208
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- TOC entry 210 (class 1259 OID 73772)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id bigint NOT NULL,
    title character varying NOT NULL,
    description text NOT NULL,
    image_url character varying NOT NULL,
    status character varying DEFAULT 'active'::character varying,
    price numeric(5,2),
    avatars text[] DEFAULT '{}'::text[],
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 16398)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 16466)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying NOT NULL,
    password_digest character varying NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 16464)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 188
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2105 (class 2604 OID 49201)
-- Name: campaigns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 57427)
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY conversations ALTER COLUMN id SET DEFAULT nextval('conversations_id_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 16589)
-- Name: customer_connects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY customer_connects ALTER COLUMN id SET DEFAULT nextval('customer_connects_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 24639)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 57393)
-- Name: discussions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY discussions ALTER COLUMN id SET DEFAULT nextval('discussions_id_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 16544)
-- Name: employee_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY employee_posts ALTER COLUMN id SET DEFAULT nextval('employee_posts_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 16519)
-- Name: employer_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY employer_posts ALTER COLUMN id SET DEFAULT nextval('employer_posts_id_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 16576)
-- Name: insights id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY insights ALTER COLUMN id SET DEFAULT nextval('insights_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 24674)
-- Name: job_locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY job_locations ALTER COLUMN id SET DEFAULT nextval('job_locations_id_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 57437)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 16469)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2277 (class 0 OID 16406)
-- Dependencies: 187
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-11-22 20:25:16.441185	2017-11-22 20:25:16.441185
\.


--
-- TOC entry 2293 (class 0 OID 49198)
-- Dependencies: 203
-- Data for Name: campaigns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY campaigns (id, pictures, title) FROM stdin;
\.


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 202
-- Name: campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('campaigns_id_seq', 1, false);


--
-- TOC entry 2297 (class 0 OID 57424)
-- Dependencies: 207
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY conversations (id, sender_id, recipient_id, created_at, updated_at) FROM stdin;
1	2	26	2018-04-01 07:56:20.828162	2018-04-01 07:56:20.828162
2	1	6	2018-04-01 08:32:53.045211	2018-04-01 08:32:53.045211
3	1	3	2018-04-01 12:05:49.463707	2018-04-01 12:05:49.463707
4	1	4	2018-04-01 12:18:11.641746	2018-04-01 12:18:11.641746
5	1	26	2018-04-01 13:29:34.206446	2018-04-01 13:29:34.206446
6	1	32	2018-04-01 13:54:34.80025	2018-04-01 13:54:34.80025
7	2	32	2018-04-18 14:17:45.978293	2018-04-18 14:17:45.978293
\.


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 206
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('conversations_id_seq', 7, true);


--
-- TOC entry 2287 (class 0 OID 16586)
-- Dependencies: 197
-- Data for Name: customer_connects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY customer_connects (id, customer_id, friend_id, subject, msg, state, created_at, updated_at) FROM stdin;
21	3	1	Connect	I will like to connect with you sir/madam	requested	2018-01-01 10:50:43.186599	2018-01-01 10:50:43.186599
20	1	3	Connect	I will like to connect with you sir/madam	accepted	2018-01-01 10:50:43.180985	2018-01-01 16:22:12.851539
6	1	4	Connect	I will like to connect with you sir/madam	requested	2017-12-22 07:39:45.839695	2018-01-02 18:26:23.106753
23	3	11	Connect	I will like to connect with you sir/madam	requested	2018-01-18 15:48:16.386954	2018-01-18 15:48:16.386954
22	11	3	Connect	I will like to connect with you sir/madam	accepted	2018-01-18 15:48:16.366217	2018-01-18 16:19:53.63209
24	1	26	Connect	I will like to connect with you sir/madam	accepted	2018-03-04 04:45:29.901076	2018-03-04 04:59:18.469756
39	1	6	Connect	I will like to connect with you sir/madam	requested	2018-03-21 18:30:50.357342	2018-03-21 18:30:50.357342
38	6	1	Connect	I will like to connect with you sir/madam	accepted	2018-03-21 18:30:50.281654	2018-03-22 12:32:55.928148
41	26	11	Connect	I will like to connect with you sir/madam	requested	2018-03-27 08:10:25.526911	2018-03-27 08:10:25.526911
40	11	26	Connect	I will like to connect with you sir/madam	accepted	2018-03-27 08:10:25.50094	2018-03-27 08:16:03.657153
43	32	11	Connect	I will like to connect with you sir/madam	requested	2018-03-27 08:41:19.145972	2018-03-27 08:41:19.145972
45	32	3	Connect	I will like to connect with you sir/madam	requested	2018-03-27 08:44:18.029911	2018-03-27 08:44:18.029911
42	11	32	Connect	I will like to connect with you sir/madam	accepted	2018-03-27 08:41:19.134442	2018-03-27 09:04:07.361399
47	32	1	Connect	I will like to connect with you sir/madam	requested	2018-03-27 09:17:17.428106	2018-03-27 09:17:17.428106
49	32	26	Connect	I will like to connect with you sir/madam	requested	2018-03-27 09:26:33.761593	2018-03-27 09:26:33.761593
51	37	11	Connect	I will like to connect with you sir/madam	requested	2018-03-27 09:54:50.939549	2018-03-27 09:54:50.939549
48	26	32	Connect	I will like to connect with you sir/madam	accepted	2018-03-27 09:26:33.741981	2018-03-28 09:37:56.875652
46	1	32	Connect	I will like to connect with you sir/madam	accepted	2018-03-27 09:17:17.409366	2018-03-28 18:47:44.35529
53	2	26	Connect	I will like to connect with you sir/madam	requested	2018-03-31 02:20:59.181168	2018-03-31 02:20:59.181168
52	26	2	Connect	I will like to connect with you sir/madam	accepted	2018-03-31 02:20:59.165593	2018-03-31 04:43:40.337976
44	3	32	Connect	I will like to connect with you sir/madam	accepted	2018-03-27 08:44:18.018088	2018-04-11 19:20:40.159833
55	6	26	Connect	I will like to connect with you sir/madam	requested	2018-04-12 10:57:59.10105	2018-04-12 10:57:59.10105
54	26	6	Connect	I will like to connect with you sir/madam	accepted	2018-04-12 10:57:59.070895	2018-04-12 10:59:05.00386
57	6	11	Connect	I will like to connect with you sir/madam	requested	2018-04-12 11:23:52.00462	2018-04-12 11:23:52.00462
56	11	6	Connect	I will like to connect with you sir/madam	accepted	2018-04-12 11:23:51.991702	2018-04-12 11:28:09.2225
\.


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 196
-- Name: customer_connects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('customer_connects_id_seq', 57, true);


--
-- TOC entry 2289 (class 0 OID 24636)
-- Dependencies: 199
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY customers (id, username, firstname, lastname, address, city, state, country, customer_type, status, user_id, latitude, longitude, created_at, updated_at) FROM stdin;
2	Martinhill	Martin	Hill	76 Iwo Rd	Ibadan	Oyo	Nigeria	employee	\N	3	7.40343669999999943	3.93535419999999991	2017-12-26 01:50:03.379732	2017-12-26 10:29:33.210307
41	Kialani	Kianina	Jang	43 Agbe road	Bama	borno	nigeria	employer	\N	15	11.5218308	13.6883765000000004	2018-04-27 12:04:04.606242	2018-04-27 12:04:04.606242
3	MikeJo	Mike	Jo	2 ibeto road	Nnewi	Anambra	Nigeria	employer	\N	2	6.01385799999999993	6.93606130000000043	2017-12-26 01:53:28.829099	2017-12-26 10:42:52.581488
5	KintyJ	Kint	Jan	76 Sir Emeka Offor Rd	Awka	Anambra	Nigeria	employer	\N	17	6.25169279999999983	7.1198345999999999	2018-01-03 15:17:23.667725	2018-01-03 15:17:23.667725
6	JohnLordy	John	Lordy	190 sir emeka offor rd	Awka	Anambra	Nigeria	employee	\N	18	6.25169279999999983	7.1198345999999999	2018-01-03 16:34:30.924237	2018-01-03 16:34:30.924237
7	Famers	Fame	Ol	21 sir emeka offor rd	Awka	Anambra	Nigeria	employer	\N	19	6.25169279999999983	7.1198345999999999	2018-01-03 19:12:08.376937	2018-01-03 19:12:08.376937
8	JazzyGon	Jazzy	Gon	78 fola agoro street	Shomolu	Lagos	Nigeria	employee	\N	20	6.52748999999999935	3.3808691999999998	2018-01-03 19:35:09.980293	2018-01-03 19:35:09.980293
9	Akaragidi	Akara	Agidi	90 sir emeka offor road	Awka	Anambra	Nigeria	employer	\N	21	6.25169279999999983	7.1198345999999999	2018-01-03 20:36:07.694381	2018-01-03 20:36:07.694381
10	First1	First	One	83 awka road	Onitsha	Anambra	Nigeria	employer	\N	22	6.15158730000000009	6.80166409999999999	2018-01-03 20:48:10.621934	2018-01-03 20:48:10.621934
12	First3	First	Three	32 sir emeka offor road	Awka	Anambra	Nigeria	employer	\N	24	6.25169279999999983	7.1198345999999999	2018-01-03 21:23:59.842136	2018-01-03 21:23:59.842136
13	FirstFour	First	Four	76 Iwo Rd	Ibadan	Oyo	Nigeria	employee	\N	25	7.40343669999999943	3.93535419999999991	2018-01-03 22:27:35.392351	2018-01-03 22:27:35.392351
15	FirstSix	First	Six	81 limca rd	Nkpor	Anambra	Nigeria	employee	\N	27	6.14859240000000007	6.83523200000000042	2018-01-03 22:51:10.660445	2018-01-03 22:51:10.660445
16	FirstSeven	First	Seven	312 sir emeka offor road	Awka	Anambra	Nigeria	employer	\N	28	6.25169279999999983	7.1198345999999999	2018-01-03 23:00:52.875955	2018-01-03 23:00:52.875955
17	FirstEight	First	Eight	54 awka Rd	Onitsha	Anambra	Nigeria	employee	\N	29	6.15158730000000009	6.80166409999999999	2018-01-03 23:24:29.828084	2018-01-03 23:24:29.828084
18	FirstNine	First	Nine	16 Sir Emeka Offor Rd	Awka	Anambra	Nigeria	employer	\N	30	6.25169279999999983	7.1198345999999999	2018-01-04 12:27:10.258172	2018-01-04 12:27:10.258172
19	FirstTen	First	Ten	8 fola agoro street	Shomolu	Lagos	Nigeria	employee	\N	31	6.52945609999999999	3.38067070000000003	2018-01-04 12:52:58.938485	2018-01-04 12:52:58.938485
20	FirstEleven	First	Eleven	11 limca rd	Nkpor	Anambra	Nigeria	employee	\N	32	6.14859240000000007	6.83523200000000042	2018-01-04 13:01:05.292301	2018-01-04 13:01:05.292301
11	First2	First	Two	176 Iwo Rd	Ibadan	Oyo	Nigeria	employer	\N	23	7.40343669999999943	3.93535419999999991	2018-01-03 21:06:03.956477	2018-01-08 16:53:36.972338
22	first12	first	twelve	88 fola agoro street	Shomolu	Lagos	nigeria	employee	\N	33	6.52748999999999935	3.3808691999999998	2018-01-11 07:35:07.465278	2018-01-11 07:35:07.465278
23	first13	First	thirteen	154 awka Rd	Onitsha	Anambra	nigeria	employer	\N	34	6.15165749999999978	6.80152550000000033	2018-01-11 07:50:21.007388	2018-01-11 07:50:21.007388
24	first14	First	Fourteen	24 awka Rd	Onitsha	Anambra	nigeria	employer	\N	35	6.15165749999999978	6.80152550000000033	2018-01-11 07:57:05.428411	2018-01-11 07:57:05.428411
25	liz	lizamarie	Nwaubueze	Jones avenue	lagos	lagos	nigeria	employee	\N	36	6.62023199999999967	3.34432399999999985	2018-01-11 10:35:19.271683	2018-01-11 10:35:19.271683
26	WinkyJ	Win	Kyj	90 awka rd	Onitsha	anambra	nigeria	employer	\N	37	6.15165749999999978	6.80152550000000033	2018-03-02 06:04:13.262938	2018-03-02 06:04:13.262938
28	Jackmike	Jack	Mike	1 Mary slessor ave	Calabar	Cross river	nigeria	employer	\N	44	4.97571649999999988	8.34170059999999935	2018-03-25 15:48:40.168966	2018-03-25 15:48:40.168966
29	Estherlai	Esther	Lai	3 General  Edet Akpan Avenue	Uyo	Akwa ibom	nigeria	employer	\N	45	5.0377396000000001	7.9127945000000004	2018-03-25 16:42:58.136627	2018-03-25 16:42:58.136627
30	Japeace	Peace	Jay	plot 13 Trans-Ekulu Pocket Layout	Enugu	Enugu	nigeria	employer	\N	46	6.45836610000000011	7.54638849999999994	2018-03-26 08:09:19.238249	2018-03-26 08:09:19.238249
31	Okamin	Mike	Okamem	12 Aria Road	GRA Enugu	Enugu	nigeria	employee	\N	47	6.45673549999999974	7.50339379999999956	2018-03-26 08:30:01.604517	2018-03-26 08:30:01.604517
32	Kaine2	Kaine	Anene	45 limca Road	Nkpor	Anambra	nigeria	employee	\N	48	6.14624009999999998	6.82974030000000099	2018-03-26 10:09:30.471616	2018-03-26 10:09:30.471616
33	Amiinsale	Aminu	Saleh	15 Ran Road	Bauchi	Bauchi	nigeria	employee	\N	49	10.3009640999999998	9.82365330000000014	2018-03-26 10:59:48.621816	2018-03-26 10:59:48.621816
34	Merryl2	Meryl	Jane	34 Ran Road	Bauchi	Bauchi	nigeria	employee	\N	50	10.3009640999999998	9.82365330000000014	2018-03-26 11:10:54.240974	2018-03-26 11:10:54.240974
35	Gailmusa	Gail	Musa	212 Ran Road	Bauchi	Bauchi	nigeria	employee	\N	51	10.3009640999999998	9.82365330000000014	2018-03-26 11:26:00.185504	2018-03-26 11:26:00.185504
36	Pearldio	Pearl	Omodio	22 Bishop Street	Jimeta	Adamawa	nigeria	employee	\N	52	9.24854889999999941	12.4495220999999994	2018-03-26 11:30:42.939826	2018-03-26 11:30:42.939826
37	Bobody	Bobo	Deye	61 Abuja Road	Yola	Adamawa	nigeria	employee	\N	53	9.20349629999999941	12.4953898999999993	2018-03-26 11:51:33.4806	2018-03-26 11:51:33.4806
39	OreillyJa	Oreily	Jay	34 Ezillo Ave	Independence Layout	enugu	nigeria	employee	\N	55	6.43511029999999984	7.52481750000000016	2018-04-02 06:12:45.22426	2018-04-02 06:12:45.22426
40	Mayele	Yele	Omar	60 Folks road	Ado ekiti	ekiti	nigeria	employee	active	56	7.61242630000000009	5.23710869999999939	2018-04-20 15:35:48.476067	2018-04-24 09:51:23.319411
1	Mikehalls	Mike	Halls	54 clifford road	aba	Abia	Nigeria	employer	admin	1	5.12158770000000008	7.37326549999999958	2017-12-26 01:49:03.583887	2018-04-24 09:59:51.745279
14	FirstFive	First	Five	38 fola agoro street	Shomolu	Lagos	Nigeria	employee	active	26	6.53496459999999857	3.38928940000000001	2018-01-03 22:36:33.85653	2018-04-24 10:01:20.881545
4	Fency	Femi	Abasala	67 mowe road	mowe	ogun	nigeria	employee	\N	4	6.8512713999999999	3.4494663000000001	2017-12-26 02:21:08.566905	2018-04-27 05:26:57.600932
\.


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 198
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('customers_id_seq', 41, true);


--
-- TOC entry 2295 (class 0 OID 57390)
-- Dependencies: 205
-- Data for Name: discussions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY discussions (id, customer_connect_id, created_at, updated_at) FROM stdin;
1	52	2018-03-31 09:51:54.988408	2018-03-31 09:51:54.988408
2	44	2018-03-31 13:51:46.306778	2018-03-31 13:51:46.306778
4	21	2018-03-31 18:34:48.216154	2018-03-31 18:34:48.216154
5	5	2018-03-31 18:39:39.424609	2018-03-31 18:39:39.424609
6	38	2018-03-31 18:47:33.692953	2018-03-31 18:47:33.692953
7	47	2018-03-31 19:05:29.797744	2018-03-31 19:05:29.797744
8	20	2018-04-01 06:46:14.860699	2018-04-01 06:46:14.860699
\.


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 204
-- Name: discussions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('discussions_id_seq', 8, true);


--
-- TOC entry 2283 (class 0 OID 16541)
-- Dependencies: 193
-- Data for Name: employee_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY employee_posts (id, job_category, employee_category, job_duration, pay_type, employee_type, employee_title, employee_experience, customer_id, description, status, created_at, updated_at) FROM stdin;
3	security	weekly_pay	full_time	cash	individual	Gate man	intermediate	6	 am looking for job as a gate man within Abuja metropolis. Please connect with me if you have vacancy.	\N	2018-03-23 12:43:54.276708	2018-03-23 12:43:54.276708
4	farm-work	daily_pay	part_time	cash	individual	Farm hand	intermediate	6	I can work in all kinds of farm, from poultry to ranch and harvesting jobs. Please connect with me.	\N	2018-03-23 13:15:37.548558	2018-03-23 13:15:37.548558
5	driver	weekly_pay	full_time	cash	individual	Senior driver	expert	6	I seek driving job, private or public vehicle driving. I can work with Abuja metropolis polish.	\N	2018-03-23 13:21:44.759382	2018-03-23 13:21:44.759382
7	security	daily_pay	part_time	cash	individual	Laundry man	expert	6	Want to wash your clothes	\N	2018-03-24 01:55:43.822601	2018-03-24 01:55:43.822601
8	farm-work	daily_pay	part_time	cash	individual	Sweeper	expert	6	I can sweet and cute grass	\N	2018-03-24 02:15:55.767752	2018-03-24 02:15:55.767752
9	care-giver	daily_pay	part_time	cash	individual	Looking for job as nanny	expert	6	I seek job opportunity as part time nanny.	\N	2018-03-24 02:19:53.688811	2018-03-24 02:19:53.688811
10	driver	daily_pay	part_time	cash	individual	Medicine man	expert	6	Looking for job as babalawo assistant	\N	2018-03-24 02:27:57.974692	2018-03-24 02:27:57.974692
11	farm-work	weekly_pay	part_time	cash	individual	Farm work	expert	6	I want to work for your farm at very competitive wage 	\N	2018-03-24 02:32:07.914732	2018-03-24 02:32:07.914732
12	care-giver	daily_pay	part_time	cash	individual	Home tutor	expert	6	I am a teacher professional, looking for part time job as private tutor.	\N	2018-03-24 03:43:32.910057	2018-03-24 03:43:32.910057
13	driver	daily_pay	part_time	cash	individual	Taxi driver	expert	6	I can drive your taxi	\N	2018-03-24 03:55:54.124643	2018-03-24 03:55:54.124643
1	sales	Monthly Pay	Full Time	Cash	Individual	Reputable Tailor	Intermediate	6	I'm looking for a tailor job. I have 10 year experience. But my last employers just left the country and I'm looking for an opportunity to practice my craft once again.	\N	2018-01-20 16:57:57.322493	2018-04-27 15:31:52.203901
6	security	daily_pay	part_time	cash	individual	Office guard	expert	6	A retired soldier looking for job as guard job .	\N	2018-03-24 01:49:58.410624	2018-04-28 03:06:23.087386
\.


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 192
-- Name: employee_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('employee_posts_id_seq', 13, true);


--
-- TOC entry 2281 (class 0 OID 16516)
-- Dependencies: 191
-- Data for Name: employer_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY employer_posts (id, title, description, status, customer_id, created_at, updated_at) FROM stdin;
1	Shoe maker job	We are looking for a team player shoe make	pending	1	2017-11-25 08:42:11.539078	2017-11-25 08:42:11.539078
2	Hinder IT guy	Web Component Fundamentals	\N	1	2017-12-07 13:26:47.562987	2017-12-07 13:26:47.562987
23	Tractor Driver	We are looking for experienced and reliable tractor driver, someone willing to spend lots of time at the farm, being able to repair tractors is a bonus.	\N	11	2018-01-07 20:10:55.456445	2018-01-07 20:10:55.456445
46	Experienced cook.	We are looking for the humble and good cook. We are looking for experienced cook to work in our Abuja office.	\N	1	2018-03-24 15:46:08.599948	2018-04-25 14:57:34.783895
27	A suya man	We are interested in someone who will man our grill machine. Please get back to us fast if you handle grills just perfect. And you can turn up at eleko beach.	\N	3	2018-01-18 16:26:01.513955	2018-04-25 15:09:17.554783
26	Sales girls now.	Our company is interest in sales girls. We require well groomed and polite young ladies to supervise our various outlet. Please contact for more details. Make sure you attach letter of recommendation.	\N	11	2018-01-07 20:56:50.653996	2018-04-25 15:11:40.271193
29	Modern website developer	I am currently recruiting for website development. Kindly drop a line if you are looking for new opportunities.	\N	26	2018-03-02 06:05:34.343854	2018-04-25 15:15:42.582892
6	House cleaner	We need professional minded cleaner with morals to come help us out from time to time.	\N	1	2017-12-07 14:20:09.600743	2018-04-25 15:21:47.437264
47	Okada riders with conscience.	If you can ride okada, we have job for you. Please get in touch with us. Please attach your resume. And letter of recommendation.	\N	3	2018-04-17 03:22:44.378478	2018-04-25 15:37:42.493155
5	House help	We looking for live in house help. Someone with a good track record.	\N	1	2017-12-07 14:14:37.210207	2018-04-25 15:51:20.530023
3	Sales Manager	Looking for someone good with cash to manage our money and management. Lagos based only.	\N	1	2017-12-07 14:04:28.922466	2018-04-25 16:08:06.332706
48	Kristo  Anovelli	No god but Yahweh.	\N	1	2018-04-25 16:14:50.991569	2018-04-25 16:14:50.991569
4	Senior welders needed	We are in dire need of construction workers for our site at Ikpoba hills Benin city.	\N	1	2017-12-07 14:09:29.666132	2018-04-27 05:29:15.470857
49	Herd man	We need professional pasturist for immediate employment. Experience is import as well as being a Nigerian.	\N	1	2018-04-28 05:35:02.849854	2018-04-28 05:35:02.849854
50	Herder needed	We need professional pasturist for immediate employment. Experience is important as well as being a Nigerian.	\N	1	2018-04-28 05:50:33.42591	2018-04-28 05:50:33.42591
51	Pro Pasturist	We need professional pasturist for immediate employment. Experience is important as well as being a Nigerian.	\N	1	2018-04-28 06:04:02.329747	2018-04-28 06:04:02.329747
52	\N	\N	\N	1	2018-04-28 06:18:32.644131	2018-04-28 06:18:32.644131
53	\N	\N	\N	1	2018-04-28 06:28:01.476646	2018-04-28 06:28:01.476646
54	\N	\N	\N	1	2018-04-28 06:35:56.732755	2018-04-28 06:35:56.732755
55	Security guard	\N	\N	1	2018-04-28 08:02:00.429609	2018-04-28 08:02:00.429609
56	\N	\N	\N	1	2018-04-28 08:13:07.558166	2018-04-28 08:13:07.558166
57	Security guard	We can hire you if you were once a soldier.	\N	1	2018-04-28 08:23:24.954513	2018-04-28 08:23:24.954513
\.


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 190
-- Name: employer_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('employer_posts_id_seq', 57, true);


--
-- TOC entry 2285 (class 0 OID 16573)
-- Dependencies: 195
-- Data for Name: insights; Type: TABLE DATA; Schema: public; Owner: -
--

COPY insights (id, available_date, job_category, employee_category, job_duration, pay_type, employee_type, employee_title, employer_post_id, employee_experience, status, created_at, updated_at) FROM stdin;
1	2017-12-15	construction	welder	temporal	cash	individual	welder	2	intermediate	\N	2017-12-15 11:52:19.369239	2017-12-15 11:52:19.369239
4	2018-01-15	Construction	Daily pay	Part time	Cash	Individual	Welder	4	Oga level	\N	2017-12-26 17:55:59.84171	2017-12-26 17:55:59.84171
5	2018-01-15	Caregiver	Daily pay	full time	Cash	Individual	nanny	5	intermediatelevel	\N	2017-12-26 17:59:53.290455	2017-12-26 17:59:53.290455
6	2018-01-15	Caregiver	Daily pay	full time	Cash	Individual	nanny	6	intermediatelevel	\N	2017-12-26 18:00:45.500466	2017-12-26 18:00:45.500466
11	2018-01-07	farmer	Weekly Pay	Full Time	Cheque	Individual	Tractor Operator	23	Intermediate	\N	2018-01-07 20:11:26.829214	2018-01-07 20:11:26.829214
14	2018-01-07	sales	Monthly Pay	Full Time	Cheque	Individual	Shop keepers	26	Intermediate	\N	2018-01-07 20:57:48.463969	2018-01-07 20:57:48.463969
15	2018-01-18	sales	Daily Pay	Part Time	Cash	Individual	Chef	27	Intermediate	\N	2018-01-18 16:26:44.722759	2018-01-18 16:26:44.722759
7	2018-01-15	care-giver	Daily pay	full time	Cash	Individual	baby sitter	1	intermediatelevel	\N	2017-12-26 18:02:13.957958	2018-02-05 11:08:06.394221
18	2018-03-02	computer	Weekly Pay	Contract	Bitcoin	Individual	Website designer	29	Intermediate	\N	2018-03-02 06:06:19.466848	2018-03-02 06:06:19.466848
21	2018-03-24	care-giver	weekly_pay	full_time	select	individual	Cook	46	intermediate	\N	2018-03-24 15:50:58.641457	2018-03-24 15:50:58.641457
22	2018-04-17	driver	Daily Pay	Contract	Cheque	Individual	Okada man	47	Intermediate	\N	2018-04-17 03:23:29.378005	2018-04-17 03:23:29.378005
2	2017-12-21	Senior Welder	Daily pay	Part time	Cash	Individual	Senior Welder	3	Intermediate	\N	2017-12-21 11:21:46.352606	2018-04-26 09:59:43.392354
27	2018-04-26	care-giver	Monthly Pay	Contract	Cheque	Individual	Home teacher	48	Intermediate	\N	2018-04-26 16:06:50.477801	2018-04-26 16:06:50.477801
28	2018-04-28	farm-work	Weekly Pay	Full Time	Cheque	Individual	Main herder	51	Intermediate	\N	2018-04-28 06:04:25.581087	2018-04-28 06:04:25.581087
34	2018-04-28	security	Weekly Pay	Full Time	Cheque	Individual	Security guard	57	Intermediate	\N	2018-04-28 08:23:28.208061	2018-04-28 08:23:28.208061
\.


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 194
-- Name: insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('insights_id_seq', 34, true);


--
-- TOC entry 2291 (class 0 OID 24671)
-- Dependencies: 201
-- Data for Name: job_locations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job_locations (id, location, city, state, employer_post_id, status, latitude, longitude, created_at, updated_at) FROM stdin;
2	134 limca road	nkpor	anambra	1	\N	6.14859240000000007	6.83523200000000042	2017-12-26 14:47:34.584415	2017-12-26 14:47:34.584415
4	54 Ikpoba slope	benin city	edo	4	\N	6.34779100000000085	5.6402145000000008	2017-12-26 17:46:48.273542	2017-12-26 17:46:48.273542
5	134 church street	bariga	lagos	5	\N	6.5609086999999997	3.34530880000000019	2017-12-26 17:49:35.493227	2017-12-26 17:49:35.493227
6	230 awka road	onitsha	anambra	6	\N	6.15158730000000009	6.80166409999999999	2017-12-26 17:51:47.867026	2017-12-26 17:51:47.867026
7	37 Awka Road	Onitsha	Anambra	23	\N	6.15165749999999978	6.80152550000000033	2018-01-07 20:12:24.815828	2018-01-07 20:12:24.815828
8	80 Sir Emeka Offor Road	Awka	Anambra	26	\N	6.25180479999999861	7.11974919999999933	2018-01-07 20:59:50.54221	2018-01-07 20:59:50.54221
9	90 Limca Rd	Nkpor	Anambra	27	\N	6.1482758000000004	6.83482110000000009	2018-01-18 16:27:22.916524	2018-01-18 16:27:22.916524
10	90 awka rd	Onitsha	anambra	29	\N	6.15165749999999978	6.80152550000000033	2018-03-02 07:36:23.459668	2018-03-02 07:36:23.459668
1	93 nkwerre street	umuahia	abia	2	\N	5.53605679999999989	7.4999646000000002	2017-12-26 14:30:25.450006	2018-03-02 09:05:19.607831
18	1 Mary Slessor Ave	Calabar	cross_river	46	\N	4.95574759999999959	8.3329544999999996	2018-03-24 15:50:59.177273	2018-03-24 15:50:59.177273
19	450 Ayangba road	Bariga	Lagos	47	\N	6.53333299999999983	3.38333299999999992	2018-04-17 03:24:08.093717	2018-04-17 03:24:08.093717
20	54 clifford road	aba	Abia	48	\N	5.12158770000000008	7.37326549999999958	2018-04-25 16:42:34.340305	2018-04-25 16:42:34.340305
3	14 fola jinadu street	Pedro	Lagos	3	\N	6.54931959999999957	3.37655329999999987	2017-12-26 17:41:45.689809	2018-04-26 09:56:54.241777
21	54 clifford road	aba	Abia	49	\N	5.12158770000000008	7.37326549999999958	2018-04-28 05:45:31.876562	2018-04-28 05:45:31.876562
22	54 clifford road	aba	Abia	49	\N	5.12158770000000008	7.37326549999999958	2018-04-28 05:45:31.878951	2018-04-28 05:45:31.878951
23	54 clifford road	aba	Abia	50	\N	5.12158770000000008	7.37326549999999958	2018-04-28 05:56:47.649321	2018-04-28 05:56:47.649321
24	54 Peter Sarki Road,	Bama	borno	51	\N	11.5218308	13.6883765000000004	2018-04-28 06:04:26.351824	2018-04-28 06:04:26.351824
27	54 clifford road	aba	Abia	52	\N	5.12158770000000008	7.37326549999999958	2018-04-28 06:28:41.108958	2018-04-28 06:28:41.108958
28	54 clifford road	aba	Abia	53	\N	5.12158770000000008	7.37326549999999958	2018-04-28 06:28:41.129225	2018-04-28 06:28:41.129225
30	54 clifford road	aba	Abia	54	\N	5.12158770000000008	7.37326549999999958	2018-04-28 06:36:20.018368	2018-04-28 06:36:20.018368
32	54 clifford road	aba	Abia	55	\N	5.12158770000000008	7.37326549999999958	2018-04-28 08:02:57.361548	2018-04-28 08:02:57.361548
34	54 clifford road	aba	Abia	56	\N	5.12158770000000008	7.37326549999999958	2018-04-28 08:15:24.31566	2018-04-28 08:15:24.31566
35	23 Nguru Close,	Makurdi	benue	57	\N	7.7321515999999999	8.53914400000000029	2018-04-28 08:23:28.449825	2018-04-28 08:23:28.449825
\.


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 200
-- Name: job_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('job_locations_id_seq', 35, true);


--
-- TOC entry 2299 (class 0 OID 57434)
-- Dependencies: 209
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY messages (id, conversation_id, customer_id, msg, sender_name, created_at, updated_at, status) FROM stdin;
1	1	2	I have to see you sir, it is urgent.	Martinhill	2018-04-01 08:30:16.94715	2018-04-01 08:30:16.94715	unread
2	2	1	Do not worry. I will figure it all out.	Mikehalls	2018-04-01 08:33:23.058056	2018-04-01 08:33:23.058056	unread
3	3	1	There is nothing to worry about.	Mikehalls	2018-04-01 12:06:20.758564	2018-04-01 12:06:20.758564	unread
4	4	1	Do not delay.We are coming now	Mikehalls	2018-04-01 12:18:35.407305	2018-04-01 12:18:35.407305	unread
5	5	1	You have to stay in touch. Job can come out any minute from now.	Mikehalls	2018-04-01 13:30:09.673859	2018-04-01 13:30:09.673859	unread
6	6	1	We can meet you	Mikehalls	2018-04-01 13:55:21.671832	2018-04-01 13:55:21.671832	unread
7	4	1	Whiteharbour lane	Mikehalls	2018-04-01 14:01:14.705127	2018-04-01 14:01:14.705127	unread
8	2	1	we have not seen them	Mikehalls	2018-04-01 15:06:13.624537	2018-04-01 15:06:13.624537	unread
9	5	1	When you coming?	Mikehalls	2018-04-01 18:22:14.427673	2018-04-01 18:22:14.427673	unread
\.


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 208
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('messages_id_seq', 9, true);


--
-- TOC entry 2300 (class 0 OID 73772)
-- Dependencies: 210
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY products (id, title, description, image_url, status, price, avatars, created_at, updated_at) FROM stdin;
44358842005372	Western Sahara	Rugged shoes for rugged terrain	http://res.cloudinary.com/shoezy/image/upload/v1526705105/g3jo4neqmozqvbq6nhlu.jpg	active	54.00	{http://res.cloudinary.com/shoezy/image/upload/v1526705041/e9nsrmfqznnjhph9purf.jpg,http://res.cloudinary.com/shoezy/image/upload/v1526705105/g3jo4neqmozqvbq6nhlu.jpg}	2018-05-19 04:46:01.426347	2018-05-19 04:46:01.426347
4541349251422	Hineo's summer girl 2018	Best of Hineo's summer girl design for the 2018 summer collection. A must have for every it girl.	http://res.cloudinary.com/shoezy/image/upload/v1526802817/zu7y2bzwmqcrrv7m99ca.jpg	active	65.00	{http://res.cloudinary.com/shoezy/image/upload/v1526802802/u7imhpmb3oggmfa3q8uw.jpg,http://res.cloudinary.com/shoezy/image/upload/v1526802817/zu7y2bzwmqcrrv7m99ca.jpg,http://res.cloudinary.com/shoezy/image/upload/v1526802828/jzp0r5u5v7izvry6tlce.jpg,http://res.cloudinary.com/shoezy/image/upload/v1526802839/odefzlpylfoupdlr0ir3.jpg,http://res.cloudinary.com/shoezy/image/upload/v1526802851/p7uzydi97mxs5n3xpsrk.jpg}	2018-05-20 07:54:54.131862	2018-05-20 07:54:54.131862
45609172650983	Crystal Avenue	The best of  crystalline avenue fall 2018 design	http://res.cloudinary.com/shoezy/image/upload/v1526970968/y3o6ky5wdby2mlsqpvxu.jpg	active	43.00	{}	2018-05-22 06:42:34.123183	2018-05-22 06:42:34.123183
19357559309962	Apena hoe	The house is apen and it is shoes	http://res.cloudinary.com/shoezy/image/upload/v1526971814/gmn2c9bthy02ahdc3rnn.jpg	active	43.00	{}	2018-05-22 06:51:48.978272	2018-05-22 06:51:48.978272
89990672563814	Apena hoe	The house is apen and it is shoes	http://res.cloudinary.com/shoezy/image/upload/v1526971814/gmn2c9bthy02ahdc3rnn.jpg	active	43.00	{}	2018-05-22 06:52:52.659725	2018-05-22 06:52:52.659725
83475378430267	Gen through shoe	Western arena shoe design	http://res.cloudinary.com/shoezy/image/upload/v1526972146/rfzqzo9cuzlqyljgvpjj.jpg	active	43.00	{http://res.cloudinary.com/shoezy/image/upload/v1526972146/rfzqzo9cuzlqyljgvpjj.jpg,http://res.cloudinary.com/shoezy/image/upload/v1526972146/kvz3ymredv9omu4cvriz.jpg,http://res.cloudinary.com/shoezy/image/upload/v1526972146/jhhqgvbyxnekgalxvp2b.jpg,http://res.cloudinary.com/shoezy/image/upload/v1526972146/mj0voxbtygvwca7deqlw.jpg}	2018-05-22 06:56:31.465991	2018-05-22 06:56:31.465991
\.


--
-- TOC entry 2276 (class 0 OID 16398)
-- Dependencies: 186
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20171122190528
20171125082453
20171125132509
20171125133950
20171125135147
20171124124858
20171125133425
20180127152705
20180331055057
20180117112643
20180109133601
20180505044054
20180518045627
\.


--
-- TOC entry 2279 (class 0 OID 16466)
-- Dependencies: 189
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, password_digest, confirmation_token, confirmed_at, confirmation_sent_at, created_at, updated_at) FROM stdin;
1	mike.hack@gmail.com	$2a$10$CYvu.ud1nvFU0IFjG389cOsLge70b99Y7DMcJxgm/ScK.YqQeLLhK	9b791035865f1bda0144	\N	2017-11-23 09:52:21.942534	2017-11-23 09:52:21.942261	2017-11-23 09:52:21.942261
2	martinhill@gmail.com	$2a$10$klJGPD00tEEJ8Jm.jwuyxeMOUEJZRchg8LEm3Y5RLTlPKGr4lgOj2	dd2715d72d7b3b9e700f	\N	2017-12-19 11:06:36.845078	2017-12-19 11:06:36.844801	2017-12-19 11:06:36.844801
3	mikejo@gmail.com	$2a$10$sAoLsQVh/P0yANtCZgOn4eZwBp.KMHXR7.Pm62z0bKGmaALQBcGF6	dab571a683d35e2414fe	\N	2017-12-19 11:30:53.64707	2017-12-19 11:30:53.646812	2017-12-19 11:30:53.646812
4	ansy@gmail.com	$2a$10$JY6VZYHRRfvg7dNviL7DVuaPL68E7snsCnFi2b4e3uyS0gAm8Drj6	281ae9c6a60e9f0d804b	\N	2017-12-26 02:13:01.230636	2017-12-26 02:13:01.230325	2017-12-26 02:13:01.230325
5	chanka@gmail.com	$2a$10$wa65ttDHOXPp8MO7V1Jw.uHDZ/ts4OtSYW9VFBtCfgdfp51tMdTM.	4c57ab26e6008c254303	\N	2018-01-03 10:27:21.116383	2018-01-03 10:27:21.116096	2018-01-03 10:27:21.116096
6	kente@gmail.com	$2a$10$inw2T6kBMo4w2DfzkPidP.OlFKaBvheTTegLkBYLqfWf4s3Cm2djK	08d4e600479187996357	\N	2018-01-03 10:44:10.859255	2018-01-03 10:44:10.858987	2018-01-03 10:44:10.858987
7	trump@gmail.com	$2a$10$pi0agvAfMJEHEeaqH2UJ8.FyvouzUbB7Mjv9yeQRDgoJ2aCIVDy4i	df21a90f0a16330c5a1f	\N	2018-01-03 10:53:59.955893	2018-01-03 10:53:59.955698	2018-01-03 10:53:59.955698
8	kerry@gmail.com	$2a$10$x/SFrvMaeEkvnUNgNhHV7e8HrshooW07zyfRcSC8vjK5lIk9YBBOq	ca5a6d2afc83c0609973	\N	2018-01-03 10:59:10.190061	2018-01-03 10:59:10.189805	2018-01-03 10:59:10.189805
9	nkemoba@gmail.com	$2a$10$Zs5f0iWxbOYWv/FRw86.XOOPUlPZB79GYRX6Q9FNrtw66sRP/Kgsy	546c2fa8325cdc7edcb8	\N	2018-01-03 11:16:14.535341	2018-01-03 11:16:14.535111	2018-01-03 11:16:14.535111
10	hanky@gmail.com	$2a$10$QmHQqdrq0CTLYiIQmrTcJuf1hoAp5iyFgTTLk2v7tvUv82vMkduWu	6770c066200bec3f7dce	\N	2018-01-03 12:14:08.851377	2018-01-03 12:14:08.851092	2018-01-03 12:14:08.851092
11	dank@gmail.com	$2a$10$pHmU4Z7LPiKRrb9/ELMIUOhrZiEcD6qkbo/SEfCHa6QucrLgBWCk.	8f75634e33bc39c282da	\N	2018-01-03 12:25:16.880556	2018-01-03 12:25:16.880335	2018-01-03 12:25:16.880335
12	jinky@gmail.com	$2a$10$XHjNlS4b21BDU8Q8JQ7qKOfgIVbZcXMZji3qWflEM9wzKU1qIKV6q	909fb30de147d2463665	\N	2018-01-03 14:03:29.05026	2018-01-03 14:03:29.050075	2018-01-03 14:03:29.050075
13	donbarns@hotmail.com	$2a$10$okBpR0snU8uozk1/5a6FxOFRQLCAHcLowlV2YZF6dolN13h/O/0zW	187d280e35e906595362	\N	2018-01-03 14:42:00.959784	2018-01-03 14:42:00.959434	2018-01-03 14:42:00.959434
14	horn@gmail.com	$2a$10$/BhDSAiPB594GCwQD3gWcunnnAkGbA7EoQMS.L5/F5T.7UJGpKSF.	479af2ad46890d64b560	\N	2018-01-03 14:48:02.70789	2018-01-03 14:48:02.707728	2018-01-03 14:48:02.707728
15	killa@gmail.com	$2a$10$oP.hoo9/jTgf2UlxeHCt/edmQRb3VnqNS4sYmhKH52wK9Lj7liWk6	d3736437825847301005	\N	2018-01-03 14:52:22.111542	2018-01-03 14:52:22.111389	2018-01-03 14:52:22.111389
16	jerky@gmail.com	$2a$10$2iPG38Qxc.K9V9AYIee8SucN369gysDriUCmqCid7DRJz/TXm18m2	517a570708277af9a773	\N	2018-01-03 15:06:21.55507	2018-01-03 15:06:21.554904	2018-01-03 15:06:21.554904
17	kint@gmail.com	$2a$10$pfylTOsKFp49Sty8CZJ4HuY5SjCfHL.u2ssq5zB8BAMn/J1NpBxtC	fdad89b774503e9eb329	\N	2018-01-03 15:14:20.652301	2018-01-03 15:14:20.652137	2018-01-03 15:14:20.652137
18	lordy@gmail.com	$2a$10$WUxoGtuznTsaodz2Hwuc0OYBih3YosMQFHhJ1k8eVsyXfk1FJ6HuK	7bb77470403c957df57f	\N	2018-01-03 16:28:46.892482	2018-01-03 16:28:46.892313	2018-01-03 16:28:46.892313
19	fame@gmail.com	$2a$10$/4yNUrxdBcBV2Kw0IdT5TeoDGsQFrUPBxYO123/Vrg7gmxR6gQ39y	e11ddbb63dffa5acef2d	\N	2018-01-03 19:09:23.317375	2018-01-03 19:09:23.317216	2018-01-03 19:09:23.317216
20	jazzy@gmail.com	$2a$10$rgQqCIsT4De7omH56vEGpulKtGwIccuNBHs1jTC4O2MZeHeJTZftC	899de9cf1cf64fabcc04	\N	2018-01-03 19:22:17.751809	2018-01-03 19:22:17.751576	2018-01-03 19:22:17.751576
21	akara@gmail.com	$2a$10$PJWcIr0q7r2mJUMeht6mrOA9vfxN5/UEitNO8pqylVtsqgkUIua96	d87808cb87787f73ed81	\N	2018-01-03 20:26:43.823386	2018-01-03 20:26:43.82323	2018-01-03 20:26:43.82323
22	first@gmail.com	$2a$10$UGbTCgZe1Dnpn/lNLwyft.sjwISKdd8adb9hGb4E8qZfeElFd9DwK	f6f4987a2f03385e4990	\N	2018-01-03 20:44:35.462531	2018-01-03 20:44:35.462322	2018-01-03 20:44:35.462322
23	first2@gmail.com	$2a$10$sATrCWNU0qF00ElLrBfaKuGdCREQzXX/xINpO16ygtVXz.SMZRa6u	0b0bffbd79e312f8f678	\N	2018-01-03 21:00:40.423277	2018-01-03 21:00:40.423074	2018-01-03 21:00:40.423074
24	first3@gmail.com	$2a$10$1svLR15M2GNLyTINTEOtPeIYFWXuhgbVCJ0DQXzUEey5WqH9nW7ki	5ab185764393543fa04d	\N	2018-01-03 21:20:02.463935	2018-01-03 21:20:02.463719	2018-01-03 21:20:02.463719
25	first4@gmail.com	$2a$10$2pEzob2VRTAzIlLtaqQvp.QuvTorSiq7mXNfywx4PTVOafNd27ZLC	eb7230586bab4e044b10	\N	2018-01-03 22:25:00.483776	2018-01-03 22:25:00.483543	2018-01-03 22:25:00.483543
26	first5@gmail.com	$2a$10$0Cm.cXyW.yR4xwz7YpN1PeSt5cYfNyMi.t/lQQyFO/RrF/UoL5qiK	97e5ace4d0524d62b99e	\N	2018-01-03 22:34:54.612723	2018-01-03 22:34:54.612526	2018-01-03 22:34:54.612526
27	first6@gmail.com	$2a$10$6aEXsgJeOH07LZzyThlLjOr8mxB4aWtVRf9Cc70PlPUoHpFlxgDr.	f7c0bf85cc8a97136b28	\N	2018-01-03 22:49:15.874475	2018-01-03 22:49:15.874307	2018-01-03 22:49:15.874307
28	first7@gmail.com	$2a$10$/Rv8BRJ1iV3n6QnowDQLRerFeeFd8gZ2ASCVWxiXUz4rQOroLxrWe	ef6d9bee3615844353f0	\N	2018-01-03 22:58:17.886386	2018-01-03 22:58:17.88623	2018-01-03 22:58:17.88623
29	first8@gmail.com	$2a$10$WJoo0ipDCMdHJoJDyhWZ6elR4fnL/VBlHa.qxKmEoS/YFV.cgJrcW	499b664af6f91926f70d	\N	2018-01-03 23:19:28.650308	2018-01-03 23:19:28.650065	2018-01-03 23:19:28.650065
30	first9@gmail.com	$2a$10$.gewhba6V9UftOzVMaqpjusBMQJZ.yy6bFi2Z0gxBt6Cna7sl27J.	df284ac7ba6a52e07206	\N	2018-01-04 12:22:12.441372	2018-01-04 12:22:12.44123	2018-01-04 12:22:12.44123
31	first10@gmail.com	$2a$10$.gztOGzcQhlIn30zx.pffuisJvUJGzoQ40qqTwI/jk04PKcSKEgqi	636d60bcf6802c24279a	\N	2018-01-04 12:38:15.492303	2018-01-04 12:38:15.492145	2018-01-04 12:38:15.492145
32	first11@gmail.com	$2a$10$3m4o305qjhg5UlWFv.ehVeDu11Q3oFyD6I/1MIbJayRPf8vSRBHzi	205e7eb7ac06d062a6b4	\N	2018-01-04 12:56:47.382244	2018-01-04 12:56:47.382075	2018-01-04 12:56:47.382075
33	first12@gmail.com	$2a$10$/kP39K0C6gPvSsb6qirjGugFn5VGAGpHvCC3v87LQFYSY0Meza4yS	a11620d323ae63267e64	\N	2018-01-11 07:31:33.926791	2018-01-11 07:31:33.926425	2018-01-11 07:31:33.926425
34	first13@gmail.com	$2a$10$CCSC89Qr.gal/REGL7f3mOGytqOvgf6IfFiPyrBWcn38Kbvo/U/OO	8c1a775a4fbaf87ca0ed	\N	2018-01-11 07:48:33.307672	2018-01-11 07:48:33.307271	2018-01-11 07:48:33.307271
35	first14@gmail.com	$2a$10$8RJdAA9A7kHswZzN/Ll3KOmb7JprrVz6e/mInlLNg3jzmyF/uUpOq	09a43a913cf5a8d365f9	\N	2018-01-11 07:56:06.649128	2018-01-11 07:56:06.648864	2018-01-11 07:56:06.648864
36	cafeliz86@gmail.com	$2a$10$sfPuYBEY3pQYEhj6xFvmbes2BQQ6olkIBFE98P2FQ73.4U4zUir6S	d517c5e1d00077a41c74	\N	2018-01-11 10:32:49.883763	2018-01-11 10:32:49.883478	2018-01-11 10:32:49.883478
37	winky@gmail.com	$2a$10$p0XOzZmHHNfn0If1Q6meB.uCYLH8z0eV9aurSkon7IGZQaEJFjIey	f5e955b23c450e834921	\N	2018-03-02 06:02:59.588408	2018-03-02 06:02:59.588059	2018-03-02 06:02:59.588059
44	jack.mike@gmail.com	$2a$10$RnjD5BDvDUY8shVR5jQR7elrfyI9S6YTiEQIgA/rOYc3e33i0Lkya	073a306f187537e321c0	\N	2018-03-25 15:48:32.947227	2018-03-25 15:48:32.946795	2018-03-25 15:48:32.946795
45	esther.lai@gmail.com	$2a$10$vdaxfZyhVPOwe2Ttw3RAi.GEGBTDPCw7FDG6g0lDjlK9j1Ga0beaK	70a5e2af2f3557806430	\N	2018-03-25 16:42:55.880095	2018-03-25 16:42:55.879734	2018-03-25 16:42:55.879734
46	peace.jay@gmail.com	$2a$10$qRVpS5EMNR7PDG0j7S2T2eP05f3FKouT9p8WvbKnc9vpg.sL6IHt.	c3b625bb403e2375b881	\N	2018-03-26 08:09:17.525809	2018-03-26 08:09:17.525349	2018-03-26 08:09:17.525349
47	okam.one@gmail.com	$2a$10$J.LdP4bU8VA7TX6.gIxreuRoYEHzynK3yfyOIxI3nzvJwKTRqltH6	2b17b5d34907c2c998f5	\N	2018-03-26 08:23:33.237648	2018-03-26 08:23:33.237316	2018-03-26 08:23:33.237316
48	kaine2@gmail.com	$2a$10$KXpoA0RUy8k8mfNremRTRu/Q.HCmVulbfX7zyc699/o2i4oOF6l5y	7a3f8e48894eb75acfae	\N	2018-03-26 10:09:17.600915	2018-03-26 10:09:17.600536	2018-03-26 10:09:17.600536
49	amin.sale@gmail.com	$2a$10$iEfZiktAIbWsADc3AV.yhuF3NRzCvUSsnqxhKquVcnfWXunYe6.Ze	2623329332f7667954b5	\N	2018-03-26 10:59:39.902625	2018-03-26 10:59:39.902149	2018-03-26 10:59:39.902149
50	meryl2@gmail.com	$2a$10$LhvAYURzUWug3NQFuHw88u2d7mqHiL9K5A46vXxaHHvmG40RtdwPu	ca7c942418e40d868218	\N	2018-03-26 11:10:30.399733	2018-03-26 11:10:30.3994	2018-03-26 11:10:30.3994
51	gailmusa@gmail.com	$2a$10$rjWr0ypXp/4yDICajn2GD.7ug0VItycMV.j5TK0cP5WtDXccTO8UK	5e05b4f2d26d9836499e	\N	2018-03-26 11:25:51.40284	2018-03-26 11:25:51.40253	2018-03-26 11:25:51.40253
52	pearl.odio@gmail.com	$2a$10$qs4gSzEjbTa8rM7wuayJxeeo48MQ2266jLoLuhRPm5VAkKYHhz5p6	7b6584195d2ea613700d	\N	2018-03-26 11:30:34.878186	2018-03-26 11:30:34.877854	2018-03-26 11:30:34.877854
53	bobodey@gmail.com	$2a$10$yejn5zcHYePkAZjDN6f4KOf5Uai4w8d0j2wJp77a49IQgrn/1L5Ay	3ba6588dbff535ae0e90	\N	2018-03-26 11:51:29.281729	2018-03-26 11:51:29.281337	2018-03-26 11:51:29.281337
55	oreilly@gmail.com	$2a$10$74o0MqYFZnasMjBoOdhAHO6XiGe7Q2fZx8bxV.G62TXoyhhjVQnKG	d412040eae14bef465fb	\N	2018-04-02 06:12:39.621471	2018-04-02 06:12:39.620913	2018-04-02 06:12:39.620913
56	mayele@gmail.com	$2a$10$D46GEH/0csCZ53qMDkrNC.IL0jyL97NAqV9a.p5ySfIJKMX.oXz8m	cbedab8d51194545f009	\N	2018-04-20 15:35:46.359913	2018-04-20 15:35:46.359392	2018-04-20 15:35:46.359392
\.


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 188
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 56, true);


--
-- TOC entry 2115 (class 2606 OID 16413)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 2142 (class 2606 OID 49206)
-- Name: campaigns campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- TOC entry 2147 (class 2606 OID 57429)
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- TOC entry 2134 (class 2606 OID 16594)
-- Name: customer_connects customer_connects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY customer_connects
    ADD CONSTRAINT customer_connects_pkey PRIMARY KEY (id);


--
-- TOC entry 2137 (class 2606 OID 24644)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 2144 (class 2606 OID 57395)
-- Name: discussions discussions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY discussions
    ADD CONSTRAINT discussions_pkey PRIMARY KEY (id);


--
-- TOC entry 2126 (class 2606 OID 16549)
-- Name: employee_posts employee_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employee_posts
    ADD CONSTRAINT employee_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 2119 (class 2606 OID 16524)
-- Name: employer_posts employer_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employer_posts
    ADD CONSTRAINT employer_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 2130 (class 2606 OID 16581)
-- Name: insights insights_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY insights
    ADD CONSTRAINT insights_pkey PRIMARY KEY (id);


--
-- TOC entry 2140 (class 2606 OID 24679)
-- Name: job_locations job_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job_locations
    ADD CONSTRAINT job_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 2154 (class 2606 OID 57442)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 2156 (class 2606 OID 73781)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 2113 (class 2606 OID 16405)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2117 (class 2606 OID 16474)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2138 (class 1259 OID 24680)
-- Name: CITY_STATE_EMPLOYER; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CITY_STATE_EMPLOYER" ON job_locations USING btree (city, state, employer_post_id, latitude, longitude);


--
-- TOC entry 2131 (class 1259 OID 16596)
-- Name: CONNECT_STATE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CONNECT_STATE" ON customer_connects USING btree (state);


--
-- TOC entry 2135 (class 1259 OID 24645)
-- Name: CTS-INDEX; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CTS-INDEX" ON customers USING btree (city, state, status, username, latitude, longitude);


--
-- TOC entry 2132 (class 1259 OID 16595)
-- Name: CUSTOMER_CONNECT; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "CUSTOMER_CONNECT" ON customer_connects USING btree (customer_id, friend_id);


--
-- TOC entry 2120 (class 1259 OID 16552)
-- Name: EMPLOYEE_CATEGORY; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "EMPLOYEE_CATEGORY" ON employee_posts USING btree (employee_category);


--
-- TOC entry 2121 (class 1259 OID 16553)
-- Name: EMPLOYEE_PAY; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "EMPLOYEE_PAY" ON employee_posts USING btree (job_duration, pay_type);


--
-- TOC entry 2122 (class 1259 OID 16551)
-- Name: EMPLOYEE_TYPE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "EMPLOYEE_TYPE" ON employee_posts USING btree (employee_type);


--
-- TOC entry 2127 (class 1259 OID 16583)
-- Name: EMPLOYER_POST; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "EMPLOYER_POST" ON insights USING btree (employer_post_id);


--
-- TOC entry 2123 (class 1259 OID 16550)
-- Name: EMPYEE_TTLE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "EMPYEE_TTLE" ON employee_posts USING btree (employee_title);


--
-- TOC entry 2124 (class 1259 OID 16554)
-- Name: EXPERIENCE_EMPLOYEE; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "EXPERIENCE_EMPLOYEE" ON employee_posts USING btree (employee_experience);


--
-- TOC entry 2128 (class 1259 OID 16582)
-- Name: JOB_EMPLOYEE_TITLE_TYPE_PAY; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "JOB_EMPLOYEE_TITLE_TYPE_PAY" ON insights USING btree (job_category, employee_category, employee_title, employee_type, pay_type);


--
-- TOC entry 2148 (class 1259 OID 57431)
-- Name: index_conversations_on_recipient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conversations_on_recipient_id ON conversations USING btree (recipient_id);


--
-- TOC entry 2149 (class 1259 OID 57430)
-- Name: index_conversations_on_sender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_conversations_on_sender_id ON conversations USING btree (sender_id);


--
-- TOC entry 2145 (class 1259 OID 57396)
-- Name: index_discussions_on_customer_connect_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_discussions_on_customer_connect_id ON discussions USING btree (customer_connect_id);


--
-- TOC entry 2150 (class 1259 OID 57453)
-- Name: index_messages_on_conversation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_conversation_id ON messages USING btree (conversation_id);


--
-- TOC entry 2151 (class 1259 OID 57454)
-- Name: index_messages_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_customer_id ON messages USING btree (customer_id);


--
-- TOC entry 2152 (class 1259 OID 57455)
-- Name: index_messages_on_sender_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_sender_name ON messages USING btree (sender_name);


--
-- TOC entry 2158 (class 2606 OID 57448)
-- Name: messages fk_rails_5b6593a5b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_5b6593a5b8 FOREIGN KEY (customer_id) REFERENCES customers(id);


--
-- TOC entry 2157 (class 2606 OID 57443)
-- Name: messages fk_rails_7f927086d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_7f927086d2 FOREIGN KEY (conversation_id) REFERENCES conversations(id);


-- Completed on 2019-02-12 01:30:34 UTC

--
-- PostgreSQL database dump complete
--

