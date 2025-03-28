--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "projectName" character varying(255) NOT NULL,
    "rafterHeights" json NOT NULL,
    widths json NOT NULL,
    settings json NOT NULL,
    "verticalResults" json,
    "horizontalResults" json,
    "totalResults" json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.project OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_id_seq OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: tile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tile (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    length integer NOT NULL,
    width integer NOT NULL,
    eave_tile_length integer,
    headlap integer,
    crossbonded character varying(255) NOT NULL,
    mingauge integer NOT NULL,
    maxgauge integer NOT NULL,
    minspacing integer NOT NULL,
    maxspacing integer NOT NULL,
    datasheet_link character varying(255),
    "lhTileWidth" integer DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tile OWNER TO postgres;

--
-- Name: tile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tile_id_seq OWNER TO postgres;

--
-- Name: tile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tile_id_seq OWNED BY public.tile.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'user'::character varying NOT NULL,
    subscription character varying(255) DEFAULT 'free'::character varying NOT NULL,
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: userTile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."userTile" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    length integer NOT NULL,
    width integer NOT NULL,
    eave_tile_length integer,
    headlap integer,
    "crossBonded" character varying(255) NOT NULL,
    "minGauge" integer NOT NULL,
    "maxGauge" integer NOT NULL,
    "minSpacing" integer NOT NULL,
    "maxSpacing" integer NOT NULL,
    datasheet_link character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."userTile" OWNER TO postgres;

--
-- Name: userTile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."userTile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."userTile_id_seq" OWNER TO postgres;

--
-- Name: userTile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."userTile_id_seq" OWNED BY public."userTile".id;


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: tile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tile ALTER COLUMN id SET DEFAULT nextval('public.tile_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: userTile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userTile" ALTER COLUMN id SET DEFAULT nextval('public."userTile_id_seq"'::regclass);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (id, "userId", "projectName", "rafterHeights", widths, settings, "verticalResults", "horizontalResults", "totalResults", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: tile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tile (id, name, type, length, width, eave_tile_length, headlap, crossbonded, mingauge, maxgauge, minspacing, maxspacing, datasheet_link, "lhTileWidth", "createdAt", "updatedAt") FROM stdin;
1	500x250 Slate 75mm	slate	500	250	0	90	YES	195	210	1	7	\N	367	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
2	CUPA 12 Spanish Slate 500x250	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
3	Welsh Slate 400x250	slate	400	250	0	90	YES	150	175	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
4	Welsh Slate 300x200	slate	300	200	0	90	YES	100	125	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
5	Welsh Penrhyn Capital Grade Slate 500x300	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
6	CUPA 5 Spanish Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
7	Delabole Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
8	Ffestiniog Blue Grey Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
9	Westmorland Green Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
10	Marley Birkdale 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
11	Cembrit Jutland 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
12	SVK Ardonit 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
13	Redland 49	interlocking-tile	382	200	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
14	Marley Modern	interlocking-tile	420	292	0	100	YES	293	343	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
15	Redland Regent	interlocking-tile	418	300	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
16	Redland Mini Stonewold	interlocking-tile	418	294	0	100	NO	293	343	1	7	\N	334	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
17	Marley Mendip	interlocking-tile	420	298	0	100	NO	75	343	1	7	\N	333	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
18	Marley Mendip 12.5 Low Pitch	interlocking-tile	420	298	0	100	NO	75	320	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
19	Sandtoft Double Pantile	interlocking-tile	420	300	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
20	Marley Anglia	interlocking-tile	387	204	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
21	Marley Ludlow Major	interlocking-tile	420	295	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
22	Sandtoft Shire Pantile	interlocking-tile	380	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
23	Redland Fenland Pantile	interlocking-tile	381	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
24	Tudor Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	100	100	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
25	Keymer Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	75	100	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
26	Spicer Handmade Clay Peg Tile	plain-tile	255	150	190	65	YES	95	110	1	7	\N	0	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
27	Marley Acme Single Camber	plain-tile	265	165	265	65	YES	90	110	1	7	\N	165	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
28	Wolds Clay Pantile	pantile	393	195	0	70	NO	260	270	1	7	\N	245	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
29	William Blyth Barco	pantile	393	195	0	70	NO	265	270	1	7	\N	245	2025-03-29 08:31:27.078+00	2025-03-29 08:31:27.078+00
30	500x250 Slate 75mm	slate	500	250	0	90	YES	195	210	1	7	\N	367	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
31	CUPA 12 Spanish Slate 500x250	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
32	Welsh Slate 400x250	slate	400	250	0	90	YES	150	175	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
33	Welsh Slate 300x200	slate	300	200	0	90	YES	100	125	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
34	Welsh Penrhyn Capital Grade Slate 500x300	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
35	CUPA 5 Spanish Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
36	Delabole Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
37	Ffestiniog Blue Grey Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
38	Westmorland Green Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
39	Marley Birkdale 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
40	Cembrit Jutland 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
41	SVK Ardonit 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
42	Redland 49	interlocking-tile	382	200	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
43	Marley Modern	interlocking-tile	420	292	0	100	YES	293	343	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
44	Redland Regent	interlocking-tile	418	300	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
45	Redland Mini Stonewold	interlocking-tile	418	294	0	100	NO	293	343	1	7	\N	334	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
46	Marley Mendip	interlocking-tile	420	298	0	100	NO	75	343	1	7	\N	333	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
47	Marley Mendip 12.5 Low Pitch	interlocking-tile	420	298	0	100	NO	75	320	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
48	Sandtoft Double Pantile	interlocking-tile	420	300	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
49	Marley Anglia	interlocking-tile	387	204	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
50	Marley Ludlow Major	interlocking-tile	420	295	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
51	Sandtoft Shire Pantile	interlocking-tile	380	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
52	Redland Fenland Pantile	interlocking-tile	381	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
53	Tudor Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	100	100	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
54	Keymer Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	75	100	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
55	Spicer Handmade Clay Peg Tile	plain-tile	255	150	190	65	YES	95	110	1	7	\N	0	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
56	Marley Acme Single Camber	plain-tile	265	165	265	65	YES	90	110	1	7	\N	165	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
57	Wolds Clay Pantile	pantile	393	195	0	70	NO	260	270	1	7	\N	245	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
58	William Blyth Barco	pantile	393	195	0	70	NO	265	270	1	7	\N	245	2025-03-29 08:31:41.226+00	2025-03-29 08:31:41.226+00
59	500x250 Slate 75mm	slate	500	250	0	90	YES	195	210	1	7	\N	367	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
60	CUPA 12 Spanish Slate 500x250	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
61	Welsh Slate 400x250	slate	400	250	0	90	YES	150	175	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
62	Welsh Slate 300x200	slate	300	200	0	90	YES	100	125	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
63	Welsh Penrhyn Capital Grade Slate 500x300	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
64	CUPA 5 Spanish Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
65	Delabole Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
66	Ffestiniog Blue Grey Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
67	Westmorland Green Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
68	Marley Birkdale 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
69	Cembrit Jutland 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
70	SVK Ardonit 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
71	Redland 49	interlocking-tile	382	200	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
72	Marley Modern	interlocking-tile	420	292	0	100	YES	293	343	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
73	Redland Regent	interlocking-tile	418	300	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
74	Redland Mini Stonewold	interlocking-tile	418	294	0	100	NO	293	343	1	7	\N	334	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
75	Marley Mendip	interlocking-tile	420	298	0	100	NO	75	343	1	7	\N	333	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
76	Marley Mendip 12.5 Low Pitch	interlocking-tile	420	298	0	100	NO	75	320	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
77	Sandtoft Double Pantile	interlocking-tile	420	300	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
78	Marley Anglia	interlocking-tile	387	204	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
79	Marley Ludlow Major	interlocking-tile	420	295	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
80	Sandtoft Shire Pantile	interlocking-tile	380	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
81	Redland Fenland Pantile	interlocking-tile	381	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
82	Tudor Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	100	100	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
83	Keymer Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	75	100	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
84	Spicer Handmade Clay Peg Tile	plain-tile	255	150	190	65	YES	95	110	1	7	\N	0	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
85	Marley Acme Single Camber	plain-tile	265	165	265	65	YES	90	110	1	7	\N	165	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
86	Wolds Clay Pantile	pantile	393	195	0	70	NO	260	270	1	7	\N	245	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
87	William Blyth Barco	pantile	393	195	0	70	NO	265	270	1	7	\N	245	2025-03-29 08:32:32.398+00	2025-03-29 08:32:32.398+00
88	500x250 Slate 75mm	slate	500	250	0	90	YES	195	210	1	7	\N	367	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
89	CUPA 12 Spanish Slate 500x250	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
90	Welsh Slate 400x250	slate	400	250	0	90	YES	150	175	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
91	Welsh Slate 300x200	slate	300	200	0	90	YES	100	125	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
92	Welsh Penrhyn Capital Grade Slate 500x300	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
93	CUPA 5 Spanish Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
94	Delabole Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
95	Ffestiniog Blue Grey Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
96	Westmorland Green Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
97	Marley Birkdale 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
98	Cembrit Jutland 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
99	SVK Ardonit 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
100	Redland 49	interlocking-tile	382	200	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
101	Marley Modern	interlocking-tile	420	292	0	100	YES	293	343	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
102	Redland Regent	interlocking-tile	418	300	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
103	Redland Mini Stonewold	interlocking-tile	418	294	0	100	NO	293	343	1	7	\N	334	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
104	Marley Mendip	interlocking-tile	420	298	0	100	NO	75	343	1	7	\N	333	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
105	Marley Mendip 12.5 Low Pitch	interlocking-tile	420	298	0	100	NO	75	320	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
106	Sandtoft Double Pantile	interlocking-tile	420	300	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
107	Marley Anglia	interlocking-tile	387	204	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
108	Marley Ludlow Major	interlocking-tile	420	295	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
109	Sandtoft Shire Pantile	interlocking-tile	380	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
110	Redland Fenland Pantile	interlocking-tile	381	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
111	Tudor Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	100	100	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
112	Keymer Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	75	100	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
113	Spicer Handmade Clay Peg Tile	plain-tile	255	150	190	65	YES	95	110	1	7	\N	0	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
114	Marley Acme Single Camber	plain-tile	265	165	265	65	YES	90	110	1	7	\N	165	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
115	Wolds Clay Pantile	pantile	393	195	0	70	NO	260	270	1	7	\N	245	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
116	William Blyth Barco	pantile	393	195	0	70	NO	265	270	1	7	\N	245	2025-03-29 08:37:50.909+00	2025-03-29 08:37:50.909+00
117	500x250 Slate 75mm	slate	500	250	0	90	YES	195	210	1	7	\N	367	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
118	CUPA 12 Spanish Slate 500x250	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
119	Welsh Slate 400x250	slate	400	250	0	90	YES	150	175	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
120	Welsh Slate 300x200	slate	300	200	0	90	YES	100	125	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
121	Welsh Penrhyn Capital Grade Slate 500x300	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
122	CUPA 5 Spanish Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
123	Delabole Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
124	Ffestiniog Blue Grey Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
125	Westmorland Green Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
126	Marley Birkdale 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
127	Cembrit Jutland 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
128	SVK Ardonit 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
129	Redland 49	interlocking-tile	382	200	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
130	Marley Modern	interlocking-tile	420	292	0	100	YES	293	343	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
131	Redland Regent	interlocking-tile	418	300	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
132	Redland Mini Stonewold	interlocking-tile	418	294	0	100	NO	293	343	1	7	\N	334	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
133	Marley Mendip	interlocking-tile	420	298	0	100	NO	75	343	1	7	\N	333	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
134	Marley Mendip 12.5 Low Pitch	interlocking-tile	420	298	0	100	NO	75	320	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
135	Sandtoft Double Pantile	interlocking-tile	420	300	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
136	Marley Anglia	interlocking-tile	387	204	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
137	Marley Ludlow Major	interlocking-tile	420	295	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
138	Sandtoft Shire Pantile	interlocking-tile	380	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
139	Redland Fenland Pantile	interlocking-tile	381	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
140	Tudor Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	100	100	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
141	Keymer Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	75	100	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
142	Spicer Handmade Clay Peg Tile	plain-tile	255	150	190	65	YES	95	110	1	7	\N	0	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
143	Marley Acme Single Camber	plain-tile	265	165	265	65	YES	90	110	1	7	\N	165	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
144	Wolds Clay Pantile	pantile	393	195	0	70	NO	260	270	1	7	\N	245	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
145	William Blyth Barco	pantile	393	195	0	70	NO	265	270	1	7	\N	245	2025-03-29 08:38:19.694+00	2025-03-29 08:38:19.694+00
146	500x250 Slate 75mm	slate	500	250	0	90	YES	195	210	1	7	\N	367	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
147	CUPA 12 Spanish Slate 500x250	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
148	Welsh Slate 400x250	slate	400	250	0	90	YES	150	175	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
149	Welsh Slate 300x200	slate	300	200	0	90	YES	100	125	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
150	Welsh Penrhyn Capital Grade Slate 500x300	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
151	CUPA 5 Spanish Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
152	Delabole Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
153	Ffestiniog Blue Grey Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
154	Westmorland Green Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
155	Marley Birkdale 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
156	Cembrit Jutland 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
157	SVK Ardonit 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
158	Redland 49	interlocking-tile	382	200	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
159	Marley Modern	interlocking-tile	420	292	0	100	YES	293	343	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
160	Redland Regent	interlocking-tile	418	300	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
161	Redland Mini Stonewold	interlocking-tile	418	294	0	100	NO	293	343	1	7	\N	334	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
162	Marley Mendip	interlocking-tile	420	298	0	100	NO	75	343	1	7	\N	333	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
163	Marley Mendip 12.5 Low Pitch	interlocking-tile	420	298	0	100	NO	75	320	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
164	Sandtoft Double Pantile	interlocking-tile	420	300	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
165	Marley Anglia	interlocking-tile	387	204	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
166	Marley Ludlow Major	interlocking-tile	420	295	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
167	Sandtoft Shire Pantile	interlocking-tile	380	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
168	Redland Fenland Pantile	interlocking-tile	381	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
169	Tudor Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	100	100	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
170	Keymer Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	75	100	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
171	Spicer Handmade Clay Peg Tile	plain-tile	255	150	190	65	YES	95	110	1	7	\N	0	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
172	Marley Acme Single Camber	plain-tile	265	165	265	65	YES	90	110	1	7	\N	165	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
173	Wolds Clay Pantile	pantile	393	195	0	70	NO	260	270	1	7	\N	245	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
174	William Blyth Barco	pantile	393	195	0	70	NO	265	270	1	7	\N	245	2025-03-29 08:38:19.767+00	2025-03-29 08:38:19.767+00
175	500x250 Slate 75mm	slate	500	250	0	90	YES	195	210	1	7	\N	367	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
176	CUPA 12 Spanish Slate 500x250	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
177	Welsh Slate 400x250	slate	400	250	0	90	YES	150	175	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
178	Welsh Slate 300x200	slate	300	200	0	90	YES	100	125	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
179	Welsh Penrhyn Capital Grade Slate 500x300	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
180	CUPA 5 Spanish Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
181	Delabole Slate	slate	500	250	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
182	Ffestiniog Blue Grey Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
183	Westmorland Green Slate	slate	500	300	0	90	YES	200	225	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
184	Marley Birkdale 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
185	Cembrit Jutland 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
186	SVK Ardonit 600x300	fibre-cement-slate	600	300	0	90	YES	255	275	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
187	Redland 49	interlocking-tile	382	200	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
188	Marley Modern	interlocking-tile	420	292	0	100	YES	293	343	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
189	Redland Regent	interlocking-tile	418	300	0	100	NO	75	343	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
190	Redland Mini Stonewold	interlocking-tile	418	294	0	100	NO	293	343	1	7	\N	334	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
191	Marley Mendip	interlocking-tile	420	298	0	100	NO	75	343	1	7	\N	333	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
192	Marley Mendip 12.5 Low Pitch	interlocking-tile	420	298	0	100	NO	75	320	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
193	Sandtoft Double Pantile	interlocking-tile	420	300	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
194	Marley Anglia	interlocking-tile	387	204	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
195	Marley Ludlow Major	interlocking-tile	420	295	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
196	Sandtoft Shire Pantile	interlocking-tile	380	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
197	Redland Fenland Pantile	interlocking-tile	381	200	0	100	NO	75	100	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
198	Tudor Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	100	100	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
199	Keymer Traditional Handmade Clay Plain Tile	plain-tile	265	165	200	65	YES	75	100	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
200	Spicer Handmade Clay Peg Tile	plain-tile	255	150	190	65	YES	95	110	1	7	\N	0	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
201	Marley Acme Single Camber	plain-tile	265	165	265	65	YES	90	110	1	7	\N	165	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
202	Wolds Clay Pantile	pantile	393	195	0	70	NO	260	270	1	7	\N	245	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
203	William Blyth Barco	pantile	393	195	0	70	NO	265	270	1	7	\N	245	2025-03-29 08:43:53.552+00	2025-03-29 08:43:53.552+00
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, password, role, subscription, email, "createdAt", "updatedAt") FROM stdin;
1	admin	$2b$10$qpjHdIwuhGKo5JPDG5geFu56VnTPiDzZ8UG8JBqm5t2WNKjK16u/G	admin	pro	hgwarner1307@gmail.com	2025-03-29 08:31:27.085+00	2025-03-29 08:31:27.085+00
\.


--
-- Data for Name: userTile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."userTile" (id, "userId", name, type, length, width, eave_tile_length, headlap, "crossBonded", "minGauge", "maxGauge", "minSpacing", "maxSpacing", datasheet_link, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 1, false);


--
-- Name: tile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tile_id_seq', 203, true);


--
-- Name: userTile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."userTile_id_seq"', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 3, true);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: tile tile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tile
    ADD CONSTRAINT tile_pkey PRIMARY KEY (id);


--
-- Name: userTile userTile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userTile"
    ADD CONSTRAINT "userTile_pkey" PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_email_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key1 UNIQUE (email);


--
-- Name: user user_email_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key10 UNIQUE (email);


--
-- Name: user user_email_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key11 UNIQUE (email);


--
-- Name: user user_email_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key12 UNIQUE (email);


--
-- Name: user user_email_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key13 UNIQUE (email);


--
-- Name: user user_email_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key2 UNIQUE (email);


--
-- Name: user user_email_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key3 UNIQUE (email);


--
-- Name: user user_email_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key4 UNIQUE (email);


--
-- Name: user user_email_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key5 UNIQUE (email);


--
-- Name: user user_email_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key6 UNIQUE (email);


--
-- Name: user user_email_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key7 UNIQUE (email);


--
-- Name: user user_email_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key8 UNIQUE (email);


--
-- Name: user user_email_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key9 UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: user user_username_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key1 UNIQUE (username);


--
-- Name: user user_username_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key10 UNIQUE (username);


--
-- Name: user user_username_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key11 UNIQUE (username);


--
-- Name: user user_username_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key12 UNIQUE (username);


--
-- Name: user user_username_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key13 UNIQUE (username);


--
-- Name: user user_username_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key2 UNIQUE (username);


--
-- Name: user user_username_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key3 UNIQUE (username);


--
-- Name: user user_username_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key4 UNIQUE (username);


--
-- Name: user user_username_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key5 UNIQUE (username);


--
-- Name: user user_username_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key6 UNIQUE (username);


--
-- Name: user user_username_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key7 UNIQUE (username);


--
-- Name: user user_username_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key8 UNIQUE (username);


--
-- Name: user user_username_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key9 UNIQUE (username);


--
-- Name: project project_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT "project_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON UPDATE CASCADE;


--
-- Name: userTile userTile_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."userTile"
    ADD CONSTRAINT "userTile_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON UPDATE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

