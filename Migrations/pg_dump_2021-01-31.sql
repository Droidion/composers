--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: catalogues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.catalogues (
    id integer NOT NULL,
    name text,
    composer_id integer NOT NULL
);


--
-- Name: catalogues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.catalogues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: catalogues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.catalogues_id_seq OWNED BY public.catalogues.id;


--
-- Name: composers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.composers (
    id integer NOT NULL,
    first_name text,
    last_name text NOT NULL,
    year_born smallint NOT NULL,
    year_died smallint,
    period_id integer NOT NULL,
    slug text NOT NULL,
    wikipedia_link text,
    imslp_link text,
    enabled boolean
);


--
-- Name: composers_countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.composers_countries (
    id integer NOT NULL,
    composer_id integer NOT NULL,
    country_id integer NOT NULL
);


--
-- Name: composers_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.composers_countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: composers_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.composers_countries_id_seq OWNED BY public.composers_countries.id;


--
-- Name: composers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.composers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: composers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.composers_id_seq OWNED BY public.composers.id;


--
-- Name: composers_year_born_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.composers_year_born_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: composers_year_born_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.composers_year_born_seq OWNED BY public.composers.year_born;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name text NOT NULL,
    icon text
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: instruments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.instruments (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.instruments_id_seq OWNED BY public.instruments.id;


--
-- Name: keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.keys (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.keys_id_seq OWNED BY public.keys.id;


--
-- Name: labels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.labels (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: labels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.labels_id_seq OWNED BY public.labels.id;


--
-- Name: performers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.performers (
    id integer NOT NULL,
    first_name text,
    last_name text NOT NULL
);


--
-- Name: performers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.performers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: performers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.performers_id_seq OWNED BY public.performers.id;


--
-- Name: performers_recordings_instruments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.performers_recordings_instruments (
    id integer NOT NULL,
    performer_id integer NOT NULL,
    recording_id integer NOT NULL,
    instrument_id integer NOT NULL,
    priority integer
);


--
-- Name: performers_works_instruments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.performers_works_instruments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: performers_works_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.performers_works_instruments_id_seq OWNED BY public.performers_recordings_instruments.id;


--
-- Name: periods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.periods (
    id integer NOT NULL,
    name text NOT NULL,
    year_start smallint,
    year_end smallint,
    slug text NOT NULL
);


--
-- Name: TABLE periods; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.periods IS 'Music periods, like classical era or romantic';


--
-- Name: periods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.periods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: periods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.periods_id_seq OWNED BY public.periods.id;


--
-- Name: periods_year_end_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.periods_year_end_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: periods_year_end_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.periods_year_end_seq OWNED BY public.periods.year_end;


--
-- Name: recordings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recordings (
    id integer NOT NULL,
    cover_name text NOT NULL,
    length integer,
    label_id integer,
    work_id integer NOT NULL,
    year_start integer,
    year_finish integer
);


--
-- Name: recordings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recordings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recordings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recordings_id_seq OWNED BY public.recordings.id;


--
-- Name: recordings_streamers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recordings_streamers (
    id integer NOT NULL,
    recording_id integer NOT NULL,
    streamer_id integer NOT NULL,
    link text NOT NULL
);


--
-- Name: recordings_streamers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recordings_streamers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recordings_streamers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recordings_streamers_id_seq OWNED BY public.recordings_streamers.id;


--
-- Name: streamers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.streamers (
    id integer NOT NULL,
    name text NOT NULL,
    icon_name text,
    app_prefix text NOT NULL
);


--
-- Name: streamers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.streamers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: streamers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.streamers_id_seq OWNED BY public.streamers.id;


--
-- Name: works; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.works (
    id integer NOT NULL,
    title text NOT NULL,
    composer_id integer,
    year_start smallint,
    year_finish smallint,
    average_minutes smallint,
    is_group boolean NOT NULL,
    parent_work_id integer,
    catalogue_id integer,
    catalogue_number integer,
    catalogue_postfix text,
    instrument_id integer,
    key_id integer,
    no integer,
    nickname text
);


--
-- Name: works_genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.works_genres (
    id integer NOT NULL,
    work_id integer NOT NULL,
    genre_id integer NOT NULL
);


--
-- Name: works_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.works_genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: works_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.works_genres_id_seq OWNED BY public.works_genres.id;


--
-- Name: works_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.works_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.works_id_seq OWNED BY public.works.id;


--
-- Name: catalogues id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catalogues ALTER COLUMN id SET DEFAULT nextval('public.catalogues_id_seq'::regclass);


--
-- Name: composers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.composers ALTER COLUMN id SET DEFAULT nextval('public.composers_id_seq'::regclass);


--
-- Name: composers_countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.composers_countries ALTER COLUMN id SET DEFAULT nextval('public.composers_countries_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: instruments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instruments ALTER COLUMN id SET DEFAULT nextval('public.instruments_id_seq'::regclass);


--
-- Name: keys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.keys ALTER COLUMN id SET DEFAULT nextval('public.keys_id_seq'::regclass);


--
-- Name: labels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.labels ALTER COLUMN id SET DEFAULT nextval('public.labels_id_seq'::regclass);


--
-- Name: performers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers ALTER COLUMN id SET DEFAULT nextval('public.performers_id_seq'::regclass);


--
-- Name: performers_recordings_instruments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers_recordings_instruments ALTER COLUMN id SET DEFAULT nextval('public.performers_works_instruments_id_seq'::regclass);


--
-- Name: periods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.periods ALTER COLUMN id SET DEFAULT nextval('public.periods_id_seq'::regclass);


--
-- Name: recordings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recordings ALTER COLUMN id SET DEFAULT nextval('public.recordings_id_seq'::regclass);


--
-- Name: recordings_streamers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recordings_streamers ALTER COLUMN id SET DEFAULT nextval('public.recordings_streamers_id_seq'::regclass);


--
-- Name: streamers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streamers ALTER COLUMN id SET DEFAULT nextval('public.streamers_id_seq'::regclass);


--
-- Name: works id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works ALTER COLUMN id SET DEFAULT nextval('public.works_id_seq'::regclass);


--
-- Name: works_genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works_genres ALTER COLUMN id SET DEFAULT nextval('public.works_genres_id_seq'::regclass);


--
-- Data for Name: catalogues; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.catalogues (id, name, composer_id) FROM stdin;
1	BWV	7
2	BWV Anh.	7
3	Op.	86
4	JS	86
6	Op.	82
\.


--
-- Data for Name: composers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.composers (id, first_name, last_name, year_born, year_died, period_id, slug, wikipedia_link, imslp_link, enabled) FROM stdin;
30	Johannes	Brahms	1833	1897	4	brahms	https://en.wikipedia.org/wiki/Johannes_Brahms	https://imslp.org/wiki/List_of_works_by_Johannes_Brahms	f
100	Elliott	Carter	1908	2012	6	carter	https://en.wikipedia.org/wiki/Elliott_Carter	\N	f
1	Heinrich Ignaz Franz	Biber	1644	1704	1	biber	https://en.wikipedia.org/wiki/Heinrich_Ignaz_Franz_Biber	https://imslp.org/wiki/List_of_works_by_Heinrich_Ignaz_Franz_von_Biber	f
31	Max	Bruch	1838	1920	4	bruch	https://en.wikipedia.org/wiki/Max_Bruch	https://imslp.org/wiki/List_of_works_by_Max_Bruch	f
28	Georges	Bizet	1838	1875	4	bizet	https://en.wikipedia.org/wiki/Georges_Bizet	https://imslp.org/wiki/List_of_works_by_Georges_Bizet	f
29	Alexander	Borodin	1833	1887	4	borodin	https://en.wikipedia.org/wiki/Alexander_Borodin	\N	f
26	Hector	Berlioz	1803	1869	4	berlioz	https://en.wikipedia.org/wiki/Hector_Berlioz	https://imslp.org/wiki/List_of_works_by_Hector_Berlioz	f
27	Franz	Berwald	1796	1868	4	berwald	https://en.wikipedia.org/wiki/Franz_Berwald	\N	f
24	Isaac	Albéniz	1860	1909	4	albeniz	https://en.wikipedia.org/wiki/Isaac_Albéniz	\N	f
25	Vincenzo	Bellini	1801	1835	4	bellini	https://en.wikipedia.org/wiki/Vincenzo_Bellini	\N	f
22	Louis	Spohr	1784	1859	3	spohr	https://en.wikipedia.org/wiki/Spohr	https://imslp.org/wiki/List_of_works_by_Louis_Spohr	f
23	Valentin	Alkan	1813	1888	4	alkan	https://en.wikipedia.org/wiki/Charles-Valentin_Alkan	https://imslp.org/wiki/List_of_works_by_Charles-Valentin_Alkan	f
20	Wolfgang Amadeus	Mozart	1756	1791	3	mozart	https://en.wikipedia.org/wiki/Wolfgang_Amadeus_Mozart	https://imslp.org/wiki/List_of_works_by_Wolfgang_Amadeus_Mozart	f
21	Franz	Schubert	1797	1828	3	schubert	https://en.wikipedia.org/wiki/Franz_Schubert	https://imslp.org/wiki/List_of_works_by_Franz_Schubert	f
18	Luigi	Boccherini	1743	1805	3	boccherini	https://en.wikipedia.org/wiki/Luigi_Boccherini	https://imslp.org/wiki/List_of_works_by_Luigi_Boccherini	f
19	Joseph	Haydn	1732	1809	3	haydn	https://en.wikipedia.org/wiki/Joseph_Haydn	https://imslp.org/wiki/List_of_works_by_Joseph_Haydn	f
16	Carl Philipp Emanuel	Bach	1714	1788	3	cpe-bach	https://en.wikipedia.org/wiki/Carl_Philipp_Emanuel_Bach	https://imslp.org/wiki/List_of_works_by_Carl_Philipp_Emanuel_Bach	f
17	Ludwig van	Beethoven	1770	1827	3	beethoven	https://en.wikipedia.org/wiki/Ludwig_van_Beethoven	https://imslp.org/wiki/List_of_works_by_Ludwig_van_Beethoven	f
110	Karl Amadeus	Hartmann	1905	1963	6	hartmann	https://en.wikipedia.org/wiki/Karl_Amadeus_Hartmann	\N	f
111	Jennifer	Higdon	1962	\N	6	higdon	https://en.wikipedia.org/wiki/Jennifer_Higdon	\N	f
108	Henryk	Górecki	1933	2010	6	gorecki	https://en.wikipedia.org/wiki/Henryk_Górecki	\N	f
109	Sofia	Gubaidulina	1931	\N	6	gubaidulina	https://en.wikipedia.org/wiki/Sofia_Gubaidulina	\N	f
106	Brian	Ferneyhough	1943	\N	6	ferneyhough	https://en.wikipedia.org/wiki/Brian_Ferneyhough	\N	f
107	Philip	Glass	1937	\N	6	glass	https://en.wikipedia.org/wiki/Philip_Glass	\N	f
104	Henri	Dutilleux	1916	2013	6	dutilleux	https://en.wikipedia.org/wiki/Henri_Dutilleux	\N	f
105	Morton	Feldman	1926	1987	6	feldman	https://en.wikipedia.org/wiki/Morton_Feldman	\N	f
102	George	Crumb	1929	\N	6	crumb	https://en.wikipedia.org/wiki/George_Crumb	\N	f
103	David	Diamond	1915	2005	6	diamond	https://en.wikipedia.org/wiki/David_Diamond_(composer)	\N	f
101	Aaron	Copland	1900	1990	6	copland	https://en.wikipedia.org/wiki/Aaron_Copland	\N	f
98	Pierre	Boulez	1925	2016	6	boulez	https://en.wikipedia.org/wiki/Pierre_Boulez	\N	f
99	Joly	Braga Santos	1924	1988	6	braga-santos	https://en.wikipedia.org/wiki/Joly_Braga_Santos	\N	f
96	Luciano	Berio	1925	2003	6	berio	https://en.wikipedia.org/wiki/Luciano_Berio	\N	f
97	Leonard	Bernstein	1918	1990	6	bernstein	https://en.wikipedia.org/wiki/Leonard_Bernstein	\N	f
126	Eduard	Tubin	1905	1982	6	tubin	https://en.wikipedia.org/wiki/Eduard_Tubin	\N	f
127	Iannis	Xenakis	1922	2001	6	xenakis	https://en.wikipedia.org/wiki/Iannis_Xenakis	\N	f
124	Kaikhosru Shapurji	Sorabji	1892	1988	6	sorabji	https://en.wikipedia.org/wiki/Kaikhosru_Shapurji_Sorabji	\N	f
125	Karlheinz	Stockhausen	1928	2007	6	stockhausen	https://en.wikipedia.org/wiki/Karlheinz_Stockhausen	\N	f
122	Edmund	Rubbra	1901	1986	6	rubbra	https://en.wikipedia.org/wiki/Edmund_Rubbra	\N	f
123	Alfred	Schnittke	1934	1998	6	schnittke	https://en.wikipedia.org/wiki/Alfred_Schnittke	\N	f
120	Goffredo	Petrassi	1904	2003	6	petrassi	https://en.wikipedia.org/wiki/Goffredo_Petrassi	\N	f
121	Einojuhani	Rautavaara	1928	2016	6	rautavaara	https://en.wikipedia.org/wiki/Einojuhani_Rautavaara	\N	f
118	Arvo	Pärt	1935	\N	6	part	https://en.wikipedia.org/wiki/Arvo_Pärt	\N	f
119	Krzysztof	Penderecki	1933	2020	6	penderecki	https://en.wikipedia.org/wiki/Krzysztof_Penderecki	\N	f
116	Conlon	Nancarrow	1912	1997	6	nancarrow	https://en.wikipedia.org/wiki/Conlon_Nancarrow	\N	f
117	Onutė	Narbutaitė	1956	\N	6	narbutaite	https://en.wikipedia.org/wiki/Onutė_Narbutaitė	\N	f
114	Witold	Lutosławski	1913	1994	6	lutoslawski	https://en.wikipedia.org/wiki/Witold_Lutosławski	\N	f
112	Vagn	Holmboe	1909	1996	6	holmboe	https://en.wikipedia.org/wiki/Vagn_Holmboe	\N	f
113	György Sándor	Ligeti	1923	2006	6	ligeti	https://en.wikipedia.org/wiki/György_Ligeti	\N	f
78	Francis	Poulenc	1899	1963	5	poulenc	https://en.wikipedia.org/wiki/Francis_Poulenc	https://imslp.org/wiki/List_of_works_by_Francis_Poulenc	f
79	Ture	Rangström	1884	1947	5	rangstrom	https://en.wikipedia.org/wiki/Ture_Rangström	\N	f
76	Carl	Nielsen	1865	1931	5	nielsen	https://en.wikipedia.org/wiki/Carl_Nielsen	https://imslp.org/wiki/List_of_works_by_Carl_Nielsen	f
77	Sergei	Prokofiev	1891	1953	5	prokofiev	https://en.wikipedia.org/wiki/Sergei_Prokofiev	https://imslp.org/wiki/List_of_works_by_Sergey_Prokofiev	f
74	Darius	Milhaud	1892	1974	5	milhaud	https://en.wikipedia.org/wiki/Darius_Milhaud	\N	f
75	Nikolai	Myaskovsky	1881	1950	5	myaskovsky	https://en.wikipedia.org/wiki/Nikolai_Myaskovsky	https://imslp.org/wiki/List_of_works_by_Nikolay_Myaskovsky	f
72	Bohuslav	Martinů	1890	1959	5	martinu	https://en.wikipedia.org/wiki/Bohuslav_Martinů	https://imslp.org/wiki/List_of_works_by_Bohuslav_Martinů	f
73	Nikolai	Medtner	1880	1951	5	medtner	https://en.wikipedia.org/wiki/Nikolai_Medtner	https://imslp.org/wiki/List_of_works_by_Nikolay_Medtner	f
70	Jón	Leifs	1899	1968	5	leifs	https://en.wikipedia.org/wiki/Jón_Leifs	\N	f
71	Gustav	Mahler	1860	1911	5	mahler	https://en.wikipedia.org/wiki/Gustav_Mahler	https://imslp.org/wiki/List_of_works_by_Gustav_Mahler	f
68	Erich Wolfgang	Korngold	1897	1957	5	korngold	https://en.wikipedia.org/wiki/Erich_Wolfgang_Korngold	https://imslp.org/wiki/List_of_works_by_Erich_Wolfgang_Korngold	f
69	Rued	Langgaard	1893	1952	5	langgaard	https://en.wikipedia.org/wiki/Rued_Langgaard	\N	f
67	Leoš	Janáček	1854	1928	5	janacek	https://en.wikipedia.org/wiki/Leoš_Janáček	https://imslp.org/wiki/List_of_works_by_Leoš_Janáček	f
64	Paul	Hindemith	1895	1963	5	hindemith	https://en.wikipedia.org/wiki/Paul_Hindemith	https://imslp.org/wiki/List_of_works_by_Paul_Hindemith	f
65	Arthur	Honegger	1892	1955	5	honegger	https://en.wikipedia.org/wiki/Arthur_Honegger	https://imslp.org/wiki/List_of_works_by_Arthur_Honegger	f
94	Kalevi	Aho	1949	\N	6	aho	https://en.wikipedia.org/wiki/Kalevi_Aho	\N	f
95	John	Adams	1947	\N	6	adams	https://en.wikipedia.org/wiki/John_Adams_(composer)	\N	f
92	William	Walton	1902	1983	5	walton	https://en.wikipedia.org/wiki/William_Walton	\N	f
93	Anton	Webern	1883	1945	5	webern	https://en.wikipedia.org/wiki/Anton_Webern	https://imslp.org/wiki/List_of_works_by_Anton_Webern	f
90	Ralph Vaughan	Williams	1872	1958	5	williams	https://en.wikipedia.org/wiki/Ralph_Vaughan_Williams	https://imslp.org/wiki/List_of_works_by_Ralph_Vaughan_Williams	f
91	Heitor	Villa-Lobos	1887	1959	5	villa-lobos	https://en.wikipedia.org/wiki/Heitor_Villa-Lobos	https://imslp.org/wiki/List_of_works_by_Heitor_Villa-Lobos	f
88	Igor	Stravinsky	1882	1971	5	stravinsky	https://en.wikipedia.org/wiki/Igor_Stravinsky	https://imslp.org/wiki/List_of_works_by_Igor_Stravinsky	f
89	Karol	Szymanowski	1882	1937	5	szymanowski	https://en.wikipedia.org/wiki/Karol_Szymanowski	https://imslp.org/wiki/List_of_works_by_Karol_Szymanowski	f
66	Charles	Ives	1874	1954	5	ives	https://en.wikipedia.org/wiki/Charles_Ives	\N	t
87	Richard	Strauss	1864	1949	5	strauss	https://en.wikipedia.org/wiki/Richard_Strauss	https://imslp.org/wiki/List_of_works_by_Richard_Strauss	f
84	Arnold	Schönberg	1874	1951	5	schonberg	https://en.wikipedia.org/wiki/Arnold_Schoenberg	https://imslp.org/wiki/List_of_works_by_Arnold_Schoenberg	f
85	Dmitri	Shostakovich	1906	1975	5	shostakovich	https://en.wikipedia.org/wiki/Dmitri_Shostakovich	https://imslp.org/wiki/List_of_works_by_Dmitry_Shostakovich	f
83	Franz	Schmidt	1874	1939	5	schmidt	https://en.wikipedia.org/wiki/Franz_Schmidt	\N	f
80	Maurice	Ravel	1875	1937	5	ravel	https://en.wikipedia.org/wiki/Maurice_Ravel	https://imslp.org/wiki/List_of_works_by_Maurice_Ravel	f
81	Camille	Saint-Saëns	1835	1921	5	saint-saens	https://en.wikipedia.org/wiki/Camille_Saint-Saëns	https://imslp.org/wiki/List_of_works_by_Camille_Saint-Saëns	f
46	Anton	Rubinstein	1829	1894	4	rubinstein	https://en.wikipedia.org/wiki/Anton_Rubinstein	https://imslp.org/wiki/List_of_works_by_Anton_Rubinstein	f
47	Robert	Schumann	1810	1856	4	schumann	https://en.wikipedia.org/wiki/Robert_Schumann	https://imslp.org/wiki/List_of_works_by_Robert_Schumann	f
44	Nikolai	Rimsky-Korsakov	1844	1908	4	rimsky-korsakov	https://en.wikipedia.org/wiki/Nikolai_Rimsky-Korsakov	https://imslp.org/wiki/List_of_works_by_Nikolay_Rimsky-Korsakov	f
45	Gioachino	Rossini	1792	1868	4	rossini	https://en.wikipedia.org/wiki/Gioachino_Rossini	\N	f
42	Joachim	Raff	1822	1882	4	raff	https://en.wikipedia.org/wiki/Joachim_Raff	https://imslp.org/wiki/List_of_works_by_Joachim_Raff	f
82	Alexander	Scriabin	1872	1915	5	scriabin	https://en.wikipedia.org/wiki/Alexander_Scriabin	https://imslp.org/wiki/List_of_works_by_Aleksandr_Scriabin	t
115	Olivier	Messiaen	1908	1992	6	messiaen	https://en.wikipedia.org/wiki/Olivier_Messiaen	\N	t
43	Sergei	Rachmaninoff	1873	1943	4	rachmaninoff	https://en.wikipedia.org/wiki/Sergei_Rachmaninoff	https://imslp.org/wiki/List_of_works_by_Sergei_Rachmaninoff	f
40	Giuseppe	Martucci	1865	1909	4	martucci	https://en.wikipedia.org/wiki/Giuseppe_Martucci	https://imslp.org/wiki/List_of_works_by_Giuseppe_Martucci	f
41	Felix	Mendelssohn	1809	1847	4	mendelssohn	https://en.wikipedia.org/wiki/Felix_Mendelssohn	https://imslp.org/wiki/List_of_works_by_Felix_Mendelssohn	f
38	Franz	Liszt	1811	1886	4	liszt	https://en.wikipedia.org/wiki/Franz_Liszt	https://imslp.org/wiki/List_of_works_by_Franz_Liszt	f
39	Albéric	Magnard	1865	1914	4	magnard	https://en.wikipedia.org/wiki/Albéric_Magnard	https://imslp.org/wiki/List_of_works_by_Albéric_Magnard	f
36	Alexander	Glazunov	1865	1936	4	glazunov	https://en.wikipedia.org/wiki/Alexander_Glazunov	https://imslp.org/wiki/List_of_works_by_Aleksandr_Glazunov	f
37	Vasily	Kalinnikov	1866	1901	4	kalinnikov	https://en.wikipedia.org/wiki/Vasily_Kalinnikov	https://imslp.org/wiki/List_of_works_by_Vasily_Kalinnikov	f
34	Antonín	Dvořák	1841	1904	4	dvorak	https://en.wikipedia.org/wiki/Anton%C3%ADn_Dvořák	https://imslp.org/wiki/List_of_works_by_Anton%C3%ADn_Dvořák	f
35	César	Franck	1822	1890	4	franck	https://en.wikipedia.org/wiki/César_Franck	https://imslp.org/wiki/List_of_works_by_César_Franck	f
32	Anton	Bruckner	1824	1896	4	bruckner	https://en.wikipedia.org/wiki/Anton_Bruckner	https://imslp.org/wiki/List_of_works_by_Anton_Bruckner	f
33	Frédéric	Chopin	1810	1849	4	chopin	https://en.wikipedia.org/wiki/Frédéric_Chopin	https://imslp.org/wiki/List_of_works_by_Frédéric_Chopin	f
62	Reinhold	Glière	1875	1956	5	gliere	https://en.wikipedia.org/wiki/Reinhold_Glière	https://imslp.org/wiki/List_of_works_by_Reinhold_Glière	f
63	Aram	Khachaturian	1903	1978	5	khachaturian	https://en.wikipedia.org/wiki/Aram_Khachaturian	\N	f
60	George	Enescu	1881	1955	5	enescu	https://en.wikipedia.org/wiki/George_Enescu	https://imslp.org/wiki/List_of_works_by_George_Enescu	f
61	Gabriel	Fauré	1845	1924	5	faure	https://en.wikipedia.org/wiki/Gabriel_Fauré	https://imslp.org/wiki/List_of_works_by_Gabriel_Fauré	f
58	Ferruccio	Busoni	1866	1924	5	busoni	https://en.wikipedia.org/wiki/Ferruccio_Busoni	https://imslp.org/wiki/List_of_works_by_Ferruccio_Busoni	f
59	Edward	Elgar	1857	1934	5	elgar	https://en.wikipedia.org/wiki/Edward_Elgar	https://imslp.org/wiki/List_of_works_by_Edward_Elgar	f
56	Amy	Beach	1867	1944	5	beach	https://en.wikipedia.org/wiki/Amy_Beach	https://imslp.org/wiki/List_of_works_by_Amy_Marcy_Beach	f
57	Alban	Berg	1885	1935	5	berg	https://en.wikipedia.org/wiki/Alban_Berg	https://imslp.org/wiki/List_of_works_by_Alban_Berg	f
54	Béla	Bartók	1881	1945	5	bartok	https://en.wikipedia.org/wiki/Béla_Bartók	https://imslp.org/wiki/List_of_works_by_Béla_Bartók	f
55	Arnold	Bax	1883	1953	5	bax	https://en.wikipedia.org/wiki/Arnold_Bax	\N	f
52	Kurt	Atterberg	1887	1974	5	atterberg	https://en.wikipedia.org/wiki/Kurt_Atterberg	\N	f
53	Samuel	Barber	1910	1981	5	barber	https://en.wikipedia.org/wiki/Samuel_Barber	\N	f
50	Richard	Wagner	1813	1883	4	wagner	https://en.wikipedia.org/wiki/Richard_Wagner	https://imslp.org/wiki/List_of_works_by_Richard_Wagner	f
51	Richard	Wetz	1875	1935	4	wetz	https://en.wikipedia.org/wiki/Richard_Wetz	\N	f
48	Sergei	Taneyev	1856	1915	4	taneev	https://en.wikipedia.org/wiki/Sergei_Taneyev	https://imslp.org/wiki/List_of_works_by_Sergey_Taneyev	f
49	Pyotr	Tchaikovsky	1840	1893	4	tchaikovsky	https://en.wikipedia.org/wiki/Pyotr_Ilyich_Tchaikovsky	https://imslp.org/wiki/List_of_works_by_Pyotr_Tchaikovsky	f
14	Antonio	Vivaldi	1678	1741	2	vivaldi	https://en.wikipedia.org/wiki/Antonio_Vivaldi	https://imslp.org/wiki/List_of_works_by_Antonio_Vivaldi	f
15	Jan Dismas	Zelenka	1679	1745	2	zelenka	https://en.wikipedia.org/wiki/Jan_Dismas_Zelenka	https://imslp.org/wiki/List_of_works_by_Jan_Dismas_Zelenka	f
12	Giuseppe	Tartini	1692	1770	2	tartini	https://en.wikipedia.org/wiki/Giuseppe_Tartini	\N	f
13	Georg Philipp	Telemann	1681	1767	2	telemann	https://en.wikipedia.org/wiki/Georg_Philipp_Telemann	https://imslp.org/wiki/List_of_works_by_Georg_Philipp_Telemann	f
10	Pietro	Locatelli	1695	1764	2	locatelli	https://en.wikipedia.org/wiki/Pietro_Locatelli	\N	f
11	Giovanni Battista	Pergolesi	1710	1736	2	pergolesi	https://en.wikipedia.org/wiki/Giovanni_Battista_Pergolesi	\N	f
8	François	Couperin	1668	1733	2	couperin	https://en.wikipedia.org/wiki/François_Couperin	\N	f
9	George Frideric	Handel	1685	1759	2	handel	https://en.wikipedia.org/wiki/George_Frideric_Handel	https://imslp.org/wiki/List_of_works_by_George_Frideric_Handel	f
6	Jean-Philippe	Rameau	1659	1695	1	rameau	https://en.wikipedia.org/wiki/Jean-Philippe_Rameau	https://imslp.org/wiki/List_of_works_by_Jean-Philippe_Rameau	f
4	Jean-Baptiste	Lully	1632	1687	1	lully	https://en.wikipedia.org/wiki/Jean-Baptiste_Lully	\N	f
5	Henry	Purcell	1659	1695	1	purcell	https://en.wikipedia.org/wiki/Henry_Purcell	https://imslp.org/wiki/List_of_works_by_Henry_Purcell	f
2	Dieterich	Buxtehude	1637	1707	1	buxtehude	https://en.wikipedia.org/wiki/Buxtehude	https://imslp.org/wiki/List_of_works_by_Dietrich_Buxtehude	f
3	Arcangelo	Corelli	1653	1713	1	corelli	https://en.wikipedia.org/wiki/Arcangelo_Corelli	https://imslp.org/wiki/List_of_works_by_Arcangelo_Corelli	f
86	Jean	Sibelius	1865	1957	5	sibelius	https://en.wikipedia.org/wiki/Jean_Sibelius	https://imslp.org/wiki/List_of_works_by_Jean_Sibelius	t
7	Johann Sebastian	Bach	1658	1750	2	bach	https://en.wikipedia.org/wiki/Johann_Sebastian_Bach	https://imslp.org/wiki/List_of_works_by_Johann_Sebastian_Bach	t
\.


--
-- Data for Name: composers_countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.composers_countries (id, composer_id, country_id) FROM stdin;
3	2	3
4	2	4
5	3	5
6	4	6
7	5	7
8	6	6
9	7	4
10	8	6
11	9	4
12	9	7
13	10	5
14	11	5
15	12	5
16	13	4
17	14	5
18	15	1
19	16	4
20	17	4
21	18	5
22	19	2
23	20	2
24	21	2
25	22	4
26	23	6
27	24	8
28	25	5
29	26	6
30	27	9
31	28	6
32	29	10
33	30	4
34	31	4
35	32	2
36	33	11
38	35	13
39	35	6
40	36	10
41	37	10
42	38	14
43	39	6
44	40	5
45	41	4
46	42	15
47	42	4
48	43	10
49	44	10
50	45	5
51	46	10
52	47	4
53	48	10
54	49	10
55	50	4
56	51	4
57	52	9
58	53	16
59	54	14
60	55	7
61	56	16
62	57	2
63	58	5
64	59	7
65	60	17
66	61	6
67	62	10
68	63	18
69	64	4
70	65	15
71	66	16
72	67	21
73	68	2
75	70	19
76	68	16
78	72	22
79	73	10
80	74	6
81	75	10
82	71	2
84	77	10
85	78	6
86	79	9
87	80	6
88	81	6
89	82	10
90	83	23
91	84	2
92	84	16
93	85	10
94	86	24
95	87	4
96	88	10
97	89	11
98	90	7
99	91	25
100	92	7
101	93	2
102	88	16
83	76	3
74	69	3
77	71	1
37	34	1
103	94	24
104	95	16
105	96	5
106	97	16
107	98	6
108	99	26
109	100	16
110	101	16
111	102	16
112	103	16
113	104	6
114	105	16
115	106	7
116	107	16
117	108	11
118	109	10
119	110	4
120	111	16
121	112	3
122	113	14
123	114	11
124	113	2
125	115	6
126	116	27
127	117	28
1	1	1
2	1	2
128	118	29
129	119	11
130	120	5
131	121	24
132	122	7
133	123	10
134	124	7
135	125	4
136	126	29
137	127	6
138	127	30
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.countries (id, name) FROM stdin;
1	Bohemia
2	Austria
3	Denmark
4	Germany
5	Italy
6	France
7	England
8	Spain
9	Sweden
10	Russia
11	Poland
13	Belgium
14	Hungary
15	Switzerland
16	USA
17	Romania
18	Armenia
19	Iceland
21	Moravia
22	Czechia
23	Austria-Hungary
24	Finland
25	Brazil
26	Portugal
27	Mexico
28	Lithuania
29	Estonia
30	Greece
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.genres (id, name, icon) FROM stdin;
1	Solo Strings	🎻
2	Solo Keyboard	🎹
4	Orchestral	🤵
5	Chamber	👫
6	Cantatas	🙏
7	Solo Organ	⛪
3	Vocal	🗣
8	Tone Poems	🤵
9	Incidental	🤵
10	Concertante	🤵
11	Symphonies	🤵
12	Choral	🗣
13	Songs	🗣
\.


--
-- Data for Name: instruments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.instruments (id, name) FROM stdin;
1	violin
2	cello
3	piano
4	harpsichord
5	ensemble
6	conductor
7	orchestra
8	oboe
9	viola da gamba
10	flute
11	string quartet
12	organ
13	choir
14	soprano
15	baritone
16	piano trio
17	mezzo-soprano
18	horn
19	xylorimba
20	glockenspiel
21	clarinet
\.


--
-- Data for Name: keys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.keys (id, name) FROM stdin;
1	G minor
2	B minor
3	D minor
4	C major
5	E major
6	F# minor
7	C minor
8	D major
9	E minor
10	G minor
11	G major
12	A major
13	A minor
14	B major
15	F major
16	F minor
17	E♭ major
18	B♭ major
19	E♭ major
\.


--
-- Data for Name: labels; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.labels (id, name) FROM stdin;
1	BIS
2	Ondine
3	ECM
4	EMI
5	Musica Omnia
6	Alpha
7	Onyx
8	Pentatone
9	Sony
10	Erato
11	Archiv
12	Deutsche Grammophon
13	Harmonia Mundi
14	Muso
15	Nimbus
16	Ambroisie
17	Steinway & Sons
18	Hänssler
19	RCA Read Label
20	Astrée
21	Opus 111
22	Glossa
23	Zig-Zag
25	Arte Nova
26	Warner
27	CRD
28	Ramée
29	Naïve
30	CAvi
31	Tacet
32	Nonesuch
33	Philips
34	Decca
35	Supraphon
36	Naxos
37	Channel
38	Deutsche Harmonia Mundi
39	BR-Klassik
40	Phi
41	Soli Deo Gloria
42	Mercury
43	RCA Victor
44	Brilliant
45	Finlandia
46	Ensemble Modern Medien
47	Eroica
48	SoundCircus
49	Cedille
50	New World
51	MDG Gold
52	Resonus
53	Bridge
54	Rhino
55	Lawo
56	Auvidis
57	Acousense
58	Capriccio
59	Montaigne
60	London Philharmonic Orchestra
61	SWR Music
62	Jade
63	Arion
64	RCA Red Seal
\.


--
-- Data for Name: performers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.performers (id, first_name, last_name) FROM stdin;
1	Jaakko	Kuusisto
2	Christian	Tetzlaff
4	Gidon	Kremer
5	Josef	Suk
6	Arthur	Grumiaux
7	Stanley	Ritchie
8	Hélène	Schmitt
9	Itzhak	Perlman
10	Hillary	Hahn
11	Viktoria	Mullova
12	John	Holloway
13	Rachel	Podger
14	Julia	Fischer
15	Yo-Yo	Ma
16	Truls	Mørk
17	Pierre	Fournier
18	Misha	Maisky
19	Jean-Guihen	Queyras
20	Amandine	Savary
21	Peter	Watchorn
22	Vladimir	Feltsman
23	Blandine	Rannou
24	Christophe	Rousset
25	Sergey	Schepkin
26	Edward	Aldwell
27	Murray	Perahia
28	Evgeni	Koroliov
29	Till	Fellner
30	Peter	Serkin
31	Blandine	Verlet
32	András	Schiff
33	Richard	Egarr
34	Pierre	Hantaï
35	Ignacio	Prego
36	Alexandre	Tharaud
37	Wilhelm	Kempff
38	Ekaterina	Dershavina
39	Beatrice	Rana
40	Virginia	Black
41	Pascal	Dubreuil
42	Dina	Ugorskaja
43	Céline	Frisch
44	Zoltán	Kocsis
45	Robert	Hill
46	\N	Café Zimmermann
47	Rinaldo	Alessandrini
48	\N	Concerto Italiano
49	\N	Freiburger Barockorchester
50	\N	Musica Antiqua Köln
51	Reinhard	Goebel 
52	Giuliano	Carmignola
53	\N	Concerto Köln
54	\N	Los Angeles Chamber Orchestra
55	\N	Academy of St Martin in the Fields
56	Bob van	Asperen
57	\N	Melante Amsterdam
58	Václav	Neumann
59	Zuzana	Růžičková
60	\N	Prague Chamber Soloists
61	Christian	Hommel
62	Helmut	Müller-Brühl
63	\N	Cologne Chamber Orchestra
64	Ottavio	Dantone
65	\N	Accademia Bizantina
66	Trevor	Pinnock
67	Isabelle	Faust
68	Kristian	Bezuidenhout
69	Paolo	Pandolfo
70	Markus	Hünninger
71	Emmanuel	Pahud
72	\N	Emerson String Quartet
73	Sigiswald	Kuijken
74	Robert	Kohnen
75	Peter	Hurford
76	Edward	Higginbottom
77	\N	Oxford New College
78	\N	Collegium Novum
79	Peter	Dijkstra
80	\N	Chor des Bayerischen Rundfunks
81	\N	Concerto Köln
82	Karl	Richter
83	\N	Münchener Bach-Chor
84	\N	Münchener Bach-Orchester
85	Philippe	Herreweghe
86	\N	Collegium Vocale Gent
87	Masaaki	Suzuki
88	\N	Bach Collegium Japan
89	René	Jacobs
90	\N	RIAS Kammerchor
91	\N	Akademie für Alte Musik Berlin
92	Andrew	Parrott
93	\N	Taverner Consort & Players
94	\N	Dresden Chamber Choir
95	Otto	Klemperer
96	\N	Philharmonia Choir
97	\N	Philharmonia Orchestra
98	Ton	Koopman
99	\N	Amsterdam Baroque Orchestra
100	\N	Amsterdam Baroque Choir
101	\N	BBC Chorus
102	John Eliot	Gardiner
103	\N	Monteverdi Choir
104	\N	English Baroque Soloists
105	Pekka	Kuusisto
106	Heini	Karkkainen
107	Paavo	Järvi
108	\N	Royal Stockholm Philharmonic
109	Eugene	Ormandy
110	\N	The Philadelphia
111	Paavo	Berglund
112	\N	Bournemouth Symphony
113	Hannu	Lintu
114	\N	Finnish Radio Symphony
115	Santtu-Matias	Rouvali
116	\N	Gothenburg Symphony
117	Osmo	Vänskä
118	\N	Lahty Symphony
119	Neeme	Järvi
120	\N	Helsinki Philharmonic
121	Soile	Isokoski
122	Neville	Marriner
123	Leif	Segerstam
124	\N	Turku Philharmonic
125	Henryk	Szeryng
126	Gennadi	Rozhdestvensky
127	\N	The London Symphony
128	André	Previn
129	\N	Pittsburgh Symphony
130	Jascha	Heifetz
131	Walter	Hendl
132	\N	Chicago Symphony
133	Ida	Haendel
134	Anne-Sophie	Mutter
135	\N	Staatskapelle Dresden
136	Seiji	Ozawa
137	\N	Boston Symphony
138	Elisabeth	Söderström
139	Tom	Krause
140	Irwin	Gage
141	Vladimir	Ashkenazy
142	Janne	Mertanen
143	Herbert	Blomstedt
144	\N	San Francisco Symphony
145	Leonard	Bernstein
146	\N	New York Symphony
147	Kurt	Sanderling
148	\N	Berliner Sinfonie-Orchester
149	\N	Chamber Orchestra of Europe
150	John	Adams
151	\N	Ensemble Modern
152	Michael	Tilson Thomas
153	Gustavo	Dudamel
154	\N	Los Angeles Philharmonic
155	James	Sinclair
156	\N	Northern Sinfonia
157	\N	Concertgebouw
158	\N	National Symphony Orchestra of Ireland
159	Kenneth	Schermerhorn
160	\N	Nashville Symphony 
161	\N	New York Philharmonic
162	Malmö	Symphony
163	\N	Malmö Symphony
164	Joanna	MacGregor
165	James	Nalley
166	Pierre-Laurent	Aimard
167	Marc-André	Hamelin
168	Alexei	Lubimov
169	William	Masselos
170	Easley	Blackwood
171	Donald	Berman
172	\N	Leipziger Streichquartett
173	\N	Blair String Quartet
174	\N	Gould Piano Trio
175	Gregory	Fulkerson
176	Robert	Shannon
177	Valentina	Lisitsa
178	Jan	DeGaetani
179	Gilbert	Kalish
180	Riccardo	Muti
181	Vasily	Petrenko
182	\N	Oslo Philharmonic
183	\N	Stockholm Philharmonic
184	Nikita	Magaloff
185	Peter	Jablonski
186	Anna	Malikova
187	Maria	Lettberg
188	Anatol	Ugorski
189	Pierre	Boulez
190	\N	The Chicago Symphony
191	Kirill	Gerstein
192	Angela	Hewitt
193	François	Weigel
194	Antoni	Wit
195	\N	Polish National Radio Symphony
196	Jean-Yves	Thibaudet
197	Riccardo	Chailly
198	\N	Royal Concertgebouw Orchestra
199	Joela	Jones
200	\N	Cleveland
201	Catherine	Cantin
202	Heinz	Holliger
203	Mstislav	Rostropovich
205	Myung-Whun	Chung
206	\N	Bastille Opera Orchestra
207	Tzimon	Barto
208	John	Ryan
209	Andrew	Barclay
210	Erika	Öhman
211	Christoph	Eschenbach
212	\N	London Philharmonic
213	\N	Ensemble Intercontemporain
214	Yvonne	Loriod
215	\N	Tonhalle-Orchester Zürich
216	Sylvain 	Cambreling
217	\N	SWR Sinfonieorchester Baden-Baden und Freiburg
218	\N	Orchestre National De La Radio Polonaise
219	Renée	Fleming
220	Alan	Gilbert
221	\N	Orchestre Philharmonique De Radio France
222	Hetna Regitze	Bruun
223	Kristoffer	Hyldig
224	Terry	Edwards
225	\N	London Sinfonietta
226	\N	Groupe Vocal De France
227	Martin	Helmchen
228	Mari	Kodama
229	Martha	Argerich
230	Alexander	Rabinovitch
231	Martin	Fröst
232	Lucas	Debargue
233	Janine	Jansen
234	Torleif	Thedéen
235	\N	Tashi
236	Olivier	Latry
\.


--
-- Data for Name: performers_recordings_instruments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.performers_recordings_instruments (id, performer_id, recording_id, instrument_id, priority) FROM stdin;
1	1	1	1	\N
2	2	2	1	\N
4	4	3	1	\N
5	5	4	1	\N
6	7	5	1	\N
7	8	6	1	\N
8	9	7	1	\N
9	11	8	1	\N
10	12	9	1	\N
11	14	10	1	\N
12	15	11	2	\N
13	16	12	2	\N
14	17	13	2	\N
15	18	14	2	\N
16	19	15	2	\N
17	20	16	3	\N
18	21	17	4	\N
19	22	18	3	\N
20	23	19	4	\N
21	24	20	4	\N
168	79	97	6	1
22	23	21	4	\N
23	25	22	3	\N
24	26	23	3	\N
25	27	24	3	\N
26	24	25	4	\N
27	28	26	3	\N
28	29	27	3	\N
29	30	28	3	\N
30	21	29	4	\N
31	31	30	4	\N
32	32	31	3	\N
33	33	32	4	\N
34	34	33	4	\N
35	35	34	4	\N
36	23	35	4	\N
37	36	36	3	\N
38	37	37	3	\N
39	38	38	3	\N
40	27	39	3	\N
169	80	97	13	2
41	39	40	3	\N
42	22	41	3	\N
43	40	42	3	\N
44	25	43	3	\N
45	27	44	3	\N
46	32	45	3	\N
47	41	46	4	\N
48	31	47	4	\N
49	28	48	3	\N
50	41	49	4	\N
51	42	50	3	\N
52	28	51	3	\N
53	31	52	4	\N
54	28	53	3	\N
55	31	54	4	\N
56	43	55	4	\N
57	43	56	4	\N
58	26	57	3	\N
59	26	58	3	\N
60	32	59	3	\N
61	32	60	3	\N
62	28	61	3	\N
63	44	62	3	\N
64	45	63	4	\N
66	46	64	5	\N
67	48	65	5	\N
68	47	65	6	\N
69	49	66	5	\N
70	50	67	5	\N
71	51	67	6	\N
73	53	68	5	\N
72	52	68	1	\N
74	10	69	1	\N
75	54	69	5	\N
76	14	70	1	\N
77	55	70	7	\N
78	56	72	6	\N
79	57	72	5	\N
170	81	97	5	3
171	95	98	6	1
172	96	98	13	2
80	59	71	4	1
173	97	98	7	3
174	85	99	6	1
82	60	71	5	3
81	58	71	6	2
113	61	73	8	1
114	62	73	6	2
115	63	73	5	3
116	51	74	6	1
117	50	74	5	2
118	47	75	6	1
119	48	75	5	2
120	47	76	6	1
121	48	76	5	2
122	64	77	6	1
123	65	77	5	2
124	13	78	1	1
125	66	78	4	2
126	67	79	1	1
127	68	79	4	2
128	69	80	9	1
129	70	80	4	2
130	71	81	10	1
131	66	81	4	2
132	72	82	11	\N
133	73	83	1	1
134	74	83	4	2
135	75	84	12	\N
136	76	85	6	1
137	77	85	13	2
138	78	85	5	3
139	79	86	6	1
140	80	86	13	2
141	81	86	5	3
142	82	87	6	1
143	83	87	13	2
144	84	87	7	3
145	85	88	6	1
146	86	88	13	2
147	87	89	6	1
148	88	89	5	2
153	93	90	5	2
149	89	91	6	1
150	90	91	13	2
151	91	91	5	3
152	92	90	6	1
154	82	92	6	1
155	83	92	13	2
156	84	92	7	\N
160	87	94	6	1
161	88	94	5	2
163	85	95	6	1
164	86	95	5	2
165	89	96	6	1
166	90	96	13	2
167	91	96	5	3
175	86	99	13	2
176	82	100	6	1
177	83	100	13	2
178	84	100	7	3
179	98	101	6	1
180	99	101	5	3
181	100	101	13	2
182	82	102	6	1
183	83	102	13	2
184	84	102	7	3
185	85	103	6	1
186	86	103	5	2
187	87	104	6	1
188	88	104	5	2
189	87	105	6	1
190	88	105	5	2
191	82	106	6	1
192	83	106	13	2
193	84	106	7	3
194	95	107	6	1
195	101	107	13	2
196	97	107	7	3
197	87	108	6	1
198	88	108	5	2
199	85	109	6	1
200	86	109	5	2
201	87	110	6	1
202	88	110	5	2
203	102	111	6	1
204	103	111	13	2
205	104	111	5	3
206	87	112	6	1
207	88	112	5	2
208	102	113	6	1
209	103	113	13	2
210	104	113	5	3
211	87	114	6	1
212	88	114	5	2
213	102	115	6	1
214	103	115	13	2
215	104	115	5	3
216	87	116	6	1
217	88	116	5	2
218	102	117	6	1
219	103	117	13	2
220	104	117	5	3
221	87	118	6	1
222	88	118	5	2
223	102	119	6	1
224	103	119	13	2
225	104	119	5	3
226	87	120	6	1
227	88	120	5	2
228	102	121	6	1
229	103	121	13	2
230	104	121	5	3
231	87	122	6	1
232	88	122	5	2
233	102	123	6	1
234	103	123	13	2
235	104	123	5	3
236	87	124	6	1
237	88	124	5	2
238	102	125	6	1
239	103	125	13	2
240	104	125	5	3
241	87	126	6	1
242	88	126	5	2
243	102	127	6	1
244	103	127	13	2
245	104	127	5	3
246	87	128	6	1
247	88	128	5	2
248	102	129	6	1
249	103	129	13	2
250	104	129	5	3
251	87	130	6	1
252	88	130	5	2
258	87	133	6	1
259	88	133	5	2
254	88	131	13	2
336	130	162	1	1
337	131	162	6	2
338	132	162	7	3
253	87	131	6	1
255	102	132	5	1
257	104	132	5	3
256	103	132	6	2
260	87	134	5	1
261	88	134	6	2
262	102	135	6	1
263	103	135	13	2
264	104	135	5	3
265	87	136	6	1
266	88	136	5	2
267	102	137	6	1
268	103	137	13	2
269	104	137	5	3
270	87	138	6	1
271	88	138	5	2
272	102	139	6	1
273	103	139	13	2
274	104	139	5	3
275	102	140	6	1
276	103	140	13	2
277	104	140	5	3
278	89	141	6	1
279	90	141	13	2
280	91	141	5	3
281	105	142	1	1
282	106	142	3	2
283	72	143	11	\N
284	109	144	6	1
285	110	144	7	2
286	107	145	6	1
287	108	145	7	2
288	111	146	6	1
289	112	146	7	2
290	107	147	6	1
291	108	147	7	2
292	113	148	6	1
293	114	148	7	2
294	115	149	6	1
295	117	149	6	2
296	119	149	6	3
297	111	149	6	4
298	116	149	7	5
299	118	149	7	6
300	120	149	7	7
301	119	150	6	1
302	107	150	6	2
303	111	150	6	3
304	121	150	14	4
305	116	150	7	5
306	108	150	7	6
307	120	150	7	7
308	119	151	6	1
309	122	151	6	2
310	123	151	6	3
311	116	151	7	4
312	55	151	7	5
313	124	151	7	6
314	123	152	6	1
315	124	152	7	2
316	123	153	6	1
317	124	153	7	2
318	123	154	6	1
319	124	154	7	2
320	123	155	6	1
321	124	155	7	2
322	123	156	6	1
323	124	156	7	2
324	123	157	6	1
325	124	157	7	2
326	123	158	6	1
327	124	158	7	2
328	123	159	6	1
329	124	159	7	2
330	125	160	1	1
331	126	160	6	2
332	127	160	7	3
333	9	161	1	1
334	128	161	6	2
335	129	161	7	3
339	133	163	1	1
340	111	163	6	2
341	112	163	7	3
342	134	164	1	1
343	128	164	6	2
344	135	164	7	3
345	11	165	1	1
346	136	165	6	2
347	137	165	7	3
348	134	166	1	1
349	128	166	6	2
350	135	166	7	3
355	142	168	3	\N
356	142	169	3	\N
357	142	170	3	\N
358	142	171	3	\N
359	138	172	14	1
360	139	172	15	2
361	141	172	3	3
362	140	172	3	4
363	138	173	14	1
364	139	173	15	2
365	141	173	3	3
366	140	173	3	4
367	138	175	14	1
368	139	175	15	2
369	141	175	3	3
370	140	175	3	4
371	115	177	6	1
372	116	177	7	2
373	115	178	6	1
374	116	178	7	2
375	143	179	6	1
376	144	179	7	2
377	143	180	6	1
378	144	180	7	2
379	143	181	6	1
380	144	181	7	2
381	143	182	6	1
382	144	182	7	2
383	143	183	6	1
384	144	183	7	2
385	143	184	6	1
386	144	184	7	2
387	143	185	6	1
388	144	185	7	2
390	145	193	6	1
391	146	193	7	2
392	145	194	6	1
393	146	194	7	2
394	145	195	6	1
395	146	195	7	2
396	145	196	6	1
397	146	196	7	2
398	145	197	6	1
399	146	197	7	2
400	145	198	6	1
401	146	198	7	2
402	145	199	6	1
403	146	199	7	2
404	109	202	6	1
405	110	202	7	2
406	109	203	6	1
407	110	203	7	2
408	109	204	6	1
409	110	204	7	2
410	109	205	6	1
411	110	205	7	2
412	109	206	6	1
413	110	206	7	2
414	123	207	6	1
415	120	207	7	2
416	123	208	6	1
417	120	208	7	2
418	123	209	6	1
419	120	209	7	2
420	123	210	6	1
421	120	210	7	2
422	123	211	6	1
423	120	211	7	2
424	123	212	6	1
425	120	212	7	2
426	123	213	6	1
427	120	213	7	2
428	119	214	6	1
429	116	214	7	2
430	119	215	6	1
431	116	215	7	2
432	119	216	6	1
433	116	216	7	2
434	119	217	6	1
435	116	217	7	2
436	119	218	6	1
437	116	218	7	2
438	119	219	6	1
439	116	219	7	2
440	119	220	6	1
441	116	220	7	2
442	147	221	6	1
443	148	221	7	2
444	147	222	6	1
445	148	222	7	2
446	147	223	6	1
447	148	223	7	2
448	147	224	6	1
449	148	224	7	2
450	147	225	6	1
451	148	225	7	2
452	147	226	6	1
453	148	226	7	2
454	147	227	6	1
455	148	227	7	2
456	111	228	6	1
457	149	228	7	2
458	111	229	6	1
459	149	229	7	2
460	111	230	6	1
461	149	230	7	2
462	111	231	6	1
463	149	231	7	2
464	111	232	6	1
465	149	232	7	2
466	111	233	6	1
467	149	233	7	2
468	111	234	6	1
469	149	234	7	2
470	150	235	6	1
471	151	235	7	2
472	86	235	13	3
473	152	236	6	1
474	132	236	7	2
475	132	236	13	3
476	153	237	6	1
477	154	237	7	2
478	155	238	6	1
479	156	238	7	2
480	152	239	6	1
481	157	239	7	2
482	153	240	6	1
483	154	240	7	2
484	153	241	6	1
485	154	241	7	2
486	153	242	6	1
487	154	242	7	2
488	152	243	6	1
489	132	243	7	2
490	132	243	13	3
491	155	244	6	1
492	158	244	7	2
493	159	245	6	1
494	160	245	7	2
495	145	246	6	1
496	161	246	7	2
497	152	247	6	1
498	132	247	7	2
499	155	248	6	1
500	163	248	7	2
501	155	249	6	1
502	159	249	6	2
503	156	249	7	3
504	160	249	7	4
505	164	250	3	1
506	165	251	3	1
507	166	252	3	1
508	167	253	3	1
509	168	254	3	1
510	169	255	3	1
511	170	256	3	1
512	171	257	3	1
513	172	258	11	1
514	72	259	11	1
515	173	260	11	1
516	174	261	16	1
517	175	262	1	1
518	176	262	3	1
519	10	263	1	1
520	177	263	3	1
521	178	264	17	1
522	179	264	3	2
523	180	265	6	1
524	110	265	7	2
525	180	266	6	1
526	110	266	7	2
527	180	267	6	1
528	110	267	7	2
530	110	268	7	2
529	180	268	6	1
531	181	269	6	1
532	182	269	7	2
533	181	270	6	1
534	182	270	7	2
535	181	271	6	1
536	182	271	7	2
537	181	272	6	1
538	182	272	7	2
539	123	273	6	1
540	183	273	7	2
541	123	274	6	1
542	183	274	7	2
543	123	275	6	1
544	183	275	7	2
545	123	276	6	1
546	183	276	7	2
547	184	277	3	1
549	185	278	3	1
550	186	279	3	1
551	187	280	3	1
552	187	281	3	1
554	188	282	3	1
555	189	282	6	2
556	190	282	7	3
557	191	283	3	1
558	181	283	6	2
559	182	283	7	3
560	192	284	3	1
561	113	284	6	2
562	114	284	7	3
563	193	285	3	1
564	194	285	6	2
565	195	285	7	3
566	196	286	3	1
567	197	286	6	2
568	198	286	7	3
569	199	287	3	1
570	189	287	6	2
571	200	287	7	3
572	201	288	10	1
573	202	288	8	2
574	203	288	2	3
576	205	288	6	5
577	206	288	7	6
578	207	289	3	1
579	208	289	18	2
580	209	289	19	3
581	210	289	20	4
582	211	289	6	5
583	212	289	7	6
590	214	292	3	1
591	166	292	3	2
592	189	292	6	3
593	213	292	5	4
594	200	292	7	5
595	107	293	6	1
596	215	293	7	2
597	107	294	6	1
598	215	294	7	2
599	216	295	6	1
600	217	295	7	2
601	216	296	6	1
602	217	296	7	2
603	194	297	6	1
604	218	297	7	2
605	219	298	14	1
606	220	298	6	2
607	221	298	7	3
608	222	300	14	1
609	223	300	3	2
610	216	301	6	1
611	217	301	7	2
612	224	302	6	1
613	225	302	7	2
614	226	303	13	1
615	166	304	3	1
616	227	305	3	1
617	164	306	3	1
618	228	307	3	1
619	229	308	3	1
620	230	308	3	2
621	231	309	21	1
622	232	309	3	2
623	233	309	1	3
624	234	309	2	4
625	235	310	11	1
626	236	311	12	1
627	236	312	12	1
628	236	313	12	1
629	236	314	12	1
630	236	315	12	1
631	236	316	12	1
632	236	317	12	1
\.


--
-- Data for Name: periods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.periods (id, name, year_start, year_end, slug) FROM stdin;
4	Romantic	1800	1910	romantic
2	Late Baroque	1680	1750	late-baroque
5	Modernism	1890	1975	modernism
3	Classical	1750	1820	classical
6	Contemporary	1950	\N	contemporary
1	Middle Baroque	1630	1700	middle-baroque
\.


--
-- Data for Name: recordings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recordings (id, cover_name, length, label_id, work_id, year_start, year_finish) FROM stdin;
75	bach-orchestral-suites-alessandrini.webp	96	29	59	\N	2018
76	bach-art-of-fugue-alessandrini.webp	74	21	60	1997	1999
77	bach-art-of-fugue-dantone.webp	77	34	60	\N	2017
79	bach-violin-sonatas-faust.webp	87	13	93	\N	2016
85	bach-john-passion-higginbottom.webp	110	36	149	2001	2002
2	bach-violin-sonatas-and-partitas-tetzlaff.webp	131	2	1	\N	2016
3	bach-violin-sonatas-and-partitas-kremer.webp	131	3	1	2001	2002
1	bach-violin-sonatas-and-partitas-kuuisto.webp	141	1	1	2015	2017
4	bach-violin-sonatas-and-partitas-suk.webp	130	4	1	\N	1970
5	bach-violin-sonatas-and-partitas-ritchie.webp	133	5	1	\N	2007
6	bach-violin-sonatas-and-partitas-schmitt.webp	146	6	1	\N	2004
7	bach-violin-sonatas-and-partitas-perlman.webp	143	4	1	\N	1986
8	bach-violin-sonatas-and-partitas-mullova.webp	142	7	1	2007	2008
9	bach-violin-sonatas-and-partitas-holloway.webp	142	3	1	\N	2004
10	bach-violin-sonatas-and-partitas-fischer.webp	147	8	1	\N	2004
11	bach-cello-suites-ma.webp	133	9	2	\N	2017
12	bach-cello-suites-mork.webp	141	10	2	\N	2005
13	bach-cello-suites-fournier.webp	139	11	2	\N	1960
14	bach-cello-suites-maisky.webp	154	12	2	\N	1985
15	bach-cello-suites-queyras.webp	130	13	2	\N	2007
16	bach-toccatas-savary.webp	69	14	11	\N	2013
17	bach-toccatas-watchorn.webp	79	5	11	\N	2016
18	bach-english-suites-feltsman.webp	132	15	3	\N	2005
19	bach-english-suites-rannou.webp	148	6	3	\N	2003
20	bach-english-suites-rousset.webp	126	16	3	\N	2004
21	bach-french-suites-rannou.webp	101	6	5	\N	\N
22	bach-french-suites-schepkin.webp	83	17	5	\N	2013
23	bach-french-suites-aldwell.webp	93	18	5	1997	1999
24	bach-french-suites-perahia.webp	91	12	5	\N	2013
25	bach-french-suites-rousset.webp	95	16	5	\N	2003
26	bach-inventions-sinfonies-koroliov.webp	53	18	4	\N	1999
27	bach-inventions-sinfonies-fellner.webp	49	3	4	\N	2007
28	bach-inventions-sinfonies-serkin.webp	60	19	4	\N	1995
29	bach-inventions-sinfonies-watchorn.webp	57	5	4	\N	2004
30	bach-inventions-sinfonies-verlet.webp	54	20	4	\N	1996
31	bach-goldberg-variations-schiff.webp	71	3	12	\N	2001
32	bach-goldberg-variations-egarr.webp	99	13	12	\N	2006
33	bach-goldberg-variations-hantai.webp	77	21	12	\N	1993
34	bach-goldberg-variations-prego.webp	79	22	12	\N	2015
35	bach-goldberg-variations-rannou.webp	90	23	12	\N	2010
37	bach-goldberg-variations-kempff.webp	63	12	12	\N	1969
38	bach-goldberg-variations-dershavina.webp	77	25	12	\N	1994
39	bach-goldberg-variations-perahia.webp	74	9	12	\N	2000
40	bach-goldberg-variations-rana.webp	78	26	12	\N	2016
41	bach-partitas-feltsman.webp	161	15	6	\N	2012
42	bach-partitas-black.webp	144	27	6	\N	2013
43	bach-partitas-schepkin.webp	135	17	6	2014	2015
44	bach-partitas-perahia.webp	142	9	6	2007	2009
45	bach-partitas-schiff.webp	132	3	6	2001	2002
46	bach-partitas-dubreuil.webp	159	28	6	\N	2007
47	bach-partitas-verlet.webp	160	20	6	\N	2001
48	bach-ubung-2-koroliov.webp	56	18	7	\N	1999
49	bach-ubung-2-dubreuil.webp	65	28	7	\N	2008
50	bach-wtc-1-ugorskaja.webp	138	30	8	\N	2016
51	bach-wtc-1-koroliov.webp	129	31	8	1998	1999
52	bach-wtc-1-verlet.webp	107	20	8	\N	1993
53	bach-wtc-2-koroliov.webp	145	31	9	\N	2001
54	bach-wtc-2-verlet.webp	125	20	9	\N	1994
55	bach-wtc-1-frisch.webp	102	6	8	\N	2014
56	bach-wtc-2-frisch.webp	146	6	9	\N	2018
57	bach-wtc-1-aldwell.webp	128	32	8	\N	1990
58	bach-wtc-2-aldwell.webp	147	32	9	\N	1988
59	bach-wtc-schiff.webp	105	3	8	\N	2011
60	bach-wtc-schiff.webp	138	3	9	\N	2011
61	bach-art-of-fugue-koroliov.webp	84	31	13	\N	1990
62	bach-art-of-fugue-kocsis.webp	100	33	13	\N	1843
63	bach-art-of-fugue-hill.webp	104	18	13	\N	1998
64	bach-brandenburg-zimmermann.webp	98	6	55	2000	2010
65	bach-brandenburg-alessandrini.webp	100	29	55	\N	2005
66	bach-brandenburg-freiburger.webp	90	13	55	\N	2013
67	bach-brandenburg-goebel.webp	106	11	55	1986	1987
68	bach-violin-concertos-carmingonla.webp	43	11	54	\N	2013
69	bach-violin-concertos-hahn.webp	44	12	54	2002	2003
70	bach-violin-concertos-fischer.webp	44	34	54	\N	2008
71	bach-keyboard-concertos-neumann.webp	130	35	56	1966	1968
72	bach-keyboard-concertos-asperen.webp	99	10	58	1991	1994
36	bach-goldberg-variations-tharaud.webp	75	10	12	\N	2015
73	bach-oboe-concertos-hommel.webp	67	36	57	\N	1996
74	bach-orchestral-suites-goebel.webp	92	11	59	1982	1985
78	bach-violin-sonatas-podger.webp	94	37	93	\N	2000
80	bach-gamba-pandolfo.webp	45	22	94	\N	2010
81	bach-flute-sonatas-pahud.webp	88	26	95	\N	2008
82	bach-art-of-fugue-emerson.webp	80	12	96	\N	2003
83	bach-musical-offering-kuijken.webp	49	38	142	\N	1994
84	bach-organ-works-hurford.webp	146	34	143	1975	1979
86	bach-john-passion-dijkstra.webp	106	39	149	\N	2015
87	bach-john-passion-richter.webp	128	11	149	\N	1964
88	bach-john-passion-herreweghe.webp	107	40	149	\N	2018
89	bach-john-passion-suzuki.webp	124	1	149	\N	1998
92	bach-matthew-passion-richter.webp	197	11	148	\N	1958
91	bach-john-passion-jacobs.webp	106	13	149	\N	2015
90	bach-john-passion-parrott.webp	109	10	149	\N	1990
94	bach-matthew-passion-suzuki.webp	163	1	148	\N	2019
95	bach-matthew-passion-herreweghe.webp	161	13	148	\N	1998
96	bach-matthew-passion-jacobs.webp	159	13	148	\N	2012
97	bach-matthew-passion-dijkstra.webp	163	39	148	\N	2013
98	bach-matthew-passion-klemperer.webp	223	4	148	\N	1961
99	bach-easter-oratorio-herreweghe.webp	42	13	151	\N	1994
100	bach-christmas-oratorio-richter.webp	163	11	150	\N	1965
101	bach-christmas-oratorio-koopman.webp	143	10	150	\N	1996
102	bach-magnificat-richter.webp	30	11	147	\N	1961
103	bach-magnificat-herreweghe.webp	28	13	147	\N	1990
104	bach-ascension-oratorio-suzuki.webp	28	1	145	\N	2004
105	bach-motets-suzuki.webp	61	1	144	\N	2009
106	bach-mass-richter.webp	121	11	146	\N	1961
107	bach-mass-klemperer.webp	135	4	146	\N	1967
108	bach-mass-suzuki.webp	107	1	146	\N	2007
109	bach-mass-herreweghe.webp	40	1	146	\N	2011
110	bach-cantatas-suzuki-34.webp	22	1	160	\N	2005
111	bach-cantatas-gardiner-21.webp	21	41	160	\N	2000
112	bach-cantatas-suzuki-12.webp	38	1	161	\N	1999
113	bach-cantatas-gardiner-2.webp	39	41	161	\N	2000
114	bach-cantatas-suzuki-8.webp	16	1	162	\N	1998
115	bach-cantatas-gardiner-21.webp	15	41	162	\N	2000
116	bach-cantatas-suzuki-30.webp	17	1	163	\N	2005
117	bach-cantatas-gardiner-8.webp	16	41	163	\N	2000
118	bach-cantatas-suzuki-41.webp	18	1	164	\N	2007
119	bach-cantatas-gardiner-10.webp	20	41	164	\N	2000
120	bach-cantatas-suzuki-15.webp	15	1	165	\N	2000
121	bach-cantatas-gardiner-12.webp	16	41	165	\N	2000
122	bach-cantatas-suzuki-21.webp	16	1	166	\N	2002
123	bach-cantatas-gardiner-18.webp	15	41	166	\N	2000
124	bach-cantatas-suzuki-18.webp	28	1	167	\N	2001
125	bach-cantatas-gardiner-22.webp	28	41	167	\N	2000
126	bach-cantatas-suzuki-25.webp	21	1	168	\N	2003
127	bach-cantatas-gardiner-7.webp	22	41	168	\N	2000
128	bach-cantatas-suzuki-27.webp	23	1	169	\N	2002
129	bach-cantatas-gardiner-10.webp	25	41	169	\N	2000
130	bach-cantatas-suzuki-41.webp	21	1	170	\N	2007
133	bach-cantatas-suzuki-10.webp	21	1	172	\N	1999
132	bach-cantatas-gardiner-23.webp	16	41	171	\N	2000
131	bach-cantatas-suzuki-19.webp	18	1	171	\N	2001
134	bach-cantatas-suzuki-2.webp	21	1	173	\N	1995
135	bach-cantatas-gardiner-12.webp	25	41	174	\N	2000
136	bach-cantatas-suzuki-5.webp	19	1	175	\N	1997
138	bach-cantatas-suzuki-26.webp	21	1	176	\N	2003
139	bach-cantatas-gardiner-11.webp	22	41	176	\N	2000
140	bach-cantatas-gardiner-3rd-sunday.webp	30	11	177	\N	2000
141	bach-cantatas-jacobs.webp	48	13	178	\N	1995
142	sibelius-violin-piano-kuusisto.webp	66	2	179	\N	2004
143	sibelius-voces-intimae-emerson.webp	27	12	180	\N	2004
144	sibelius-lemminkainen-ormandy.webp	46	4	186	\N	1978
145	sibelius-lemminkainen-jarvi.webp	49	10	186	\N	1996
146	sibelius-kullervo-berglund.webp	71	4	187	\N	1970
147	sibelius-kullervo-jarvi.webp	79	10	187	\N	1997
148	sibelius-kullervo-lintu.webp	72	2	187	\N	2018
149	sibelius-early-tone-poems-various.webp	56	\N	188	\N	\N
150	sibelius-later-tone-poems-various.webp	71	\N	189	\N	\N
137	bach-cantatas-gardiner-8.webp	21	41	175	\N	2012
151	sibelius-smaller-orchestral.webp	62	\N	201	\N	\N
152	sibelius-kuulema-kung.webp	24	36	208	\N	2014
153	sibelius-kuulema-kung.webp	35	36	209	\N	2014
154	sibelius-pelleas.webp	34	36	211	\N	2014
155	sibelius-belshazzar.webp	22	36	210	\N	2014
156	sibelius-swanwhite.webp	30	36	213	\N	2014
157	sibelius-swanwhite.webp	26	36	214	\N	2014
158	sibelius-scaramouche.webp	71	36	215	\N	2014
159	sibelius-jedermann.webp	49	36	212	\N	2014
160	sibelius-vionlin-concerto-szeryng.webp	31	42	216	\N	1965
161	sibelius-violin-concerto-perlman.webp	32	4	216	\N	1979
162	sibelius-violin-concerto-heifetz.webp	27	43	216	\N	1959
163	sibelius-violin-concerto-haendel.webp	34	4	216	\N	1976
164	sibelius-violin-concerto-mutter.webp	32	12	216	\N	1995
165	sibelius-violin-concerto-mullova.webp	32	33	216	\N	1985
166	sibelius-violin-concerto-mutter.webp	13	12	217	\N	1995
168	sibelius-piano-mertanen.webp	82	9	219	2009	2015
169	sibelius-piano-mertanen.webp	62	9	220	2009	2015
170	sibelius-piano-mertanen.webp	21	9	221	2009	2015
171	sibelius-piano-mertanen.webp	35	9	222	2009	2015
172	sibelius-songs.webp	73	34	235	\N	1981
173	sibelius-songs.webp	54	34	236	\N	1981
175	sibelius-songs.webp	35	34	218	\N	1981
177	sibelius-symphony-1-rouvali.webp	40	6	249	\N	2018
178	sibelius-symphony-2-rouvali.webp	45	6	250	\N	2019
179	sibelius-symphonies-1-7-blomstest.webp	40	34	249	\N	1994
180	sibelius-symphony-2-blomstest.webp	45	34	250	\N	1991
181	sibelius-symphonies-3-6-blomstest.webp	30	34	251	\N	1994
182	sibelius-symphonies-4-5-blomstest.webp	36	34	252	\N	1989
183	sibelius-symphonies-4-5-blomstest.webp	31	34	253	\N	1989
184	sibelius-symphonies-3-6-blomstest.webp	30	34	254	\N	1995
185	sibelius-symphonies-1-7-blomstest.webp	22	34	255	\N	1993
193	sibelius-symphonies-bernstein.webp	36	9	249	\N	1967
194	sibelius-symphonies-bernstein.webp	44	9	250	\N	1966
195	sibelius-symphonies-bernstein.webp	26	9	251	\N	1965
196	sibelius-symphonies-bernstein.webp	39	9	252	\N	1966
197	sibelius-symphonies-bernstein.webp	33	9	253	\N	1961
198	sibelius-symphonies-bernstein.webp	27	9	254	\N	1967
199	sibelius-symphonies-bernstein.webp	23	9	255	1960	1965
202	sibelius-symphonies-ormandy.webp	42	19	249	\N	1978
203	sibelius-symphonies-ormandy.webp	45	19	250	\N	1972
204	sibelius-symphonies-ormandy.webp	32	19	252	\N	1978
205	sibelius-symphonies-ormandy.webp	34	19	253	\N	1975
206	sibelius-symphonies-ormandy.webp	24	19	255	\N	1975
207	sibelius-symphonies-segerstam.webp	38	2	249	\N	2002
208	sibelius-symphonies-segerstam.webp	46	2	250	\N	2002
209	sibelius-symphonies-segerstam.webp	30	2	251	\N	2004
210	sibelius-symphonies-segerstam.webp	38	2	252	\N	2003
211	sibelius-symphonies-segerstam.webp	34	2	253	\N	2003
212	sibelius-symphonies-segerstam.webp	30	2	254	\N	2002
213	sibelius-symphonies-segerstam.webp	21	2	255	\N	2002
214	sibelius-symphonies-jarvi.webp	49	12	249	\N	2002
215	sibelius-symphonies-jarvi.webp	46	12	250	\N	2001
216	sibelius-symphonies-jarvi.webp	30	12	251	\N	2003
217	sibelius-symphonies-jarvi.webp	38	12	252	\N	2003
218	sibelius-symphonies-jarvi.webp	32	12	253	\N	2002
219	sibelius-symphonies-jarvi.webp	31	12	254	\N	2005
220	sibelius-symphonies-jarvi.webp	25	12	255	\N	2003
221	sibelius-symphonies-sanderling.webp	40	44	249	\N	1976
222	sibelius-symphonies-sanderling.webp	46	44	250	\N	1974
223	sibelius-symphonies-sanderling.webp	27	44	251	\N	1970
224	sibelius-symphonies-sanderling.webp	36	44	252	\N	1977
225	sibelius-symphonies-sanderling.webp	33	44	253	\N	1971
226	sibelius-symphonies-sanderling.webp	30	44	254	\N	1974
227	sibelius-symphonies-sanderling.webp	24	44	255	\N	1974
228	sibelius-symphonies-berglund-coe.webp	37	45	249	1996	1998
229	sibelius-symphonies-berglund-coe.webp	42	45	250	1996	1998
230	sibelius-symphonies-berglund-coe.webp	30	45	251	1996	1998
231	sibelius-symphonies-berglund-coe.webp	33	45	252	1996	1998
232	sibelius-symphonies-berglund-coe.webp	31	45	253	1996	1998
233	sibelius-symphonies-berglund-coe.webp	28	45	254	1996	1998
234	sibelius-symphonies-berglund-coe.webp	22	45	255	1996	1998
235	ives-symphony-4-adams.webp	29	46	260	\N	1999
236	ives-symphony-1-4-thomas.webp	33	9	260	\N	1989
237	ives-symphonyies-dudamel.webp	31	12	260	\N	2020
238	ives-symphony-3-sinclair.webp	21	36	259	\N	2000
239	ives-symphony-3-thomas.webp	23	9	259	\N	1982
240	ives-symphonyies-dudamel.webp	21	12	259	\N	2020
241	ives-symphonyies-dudamel.webp	36	12	258	\N	2020
242	ives-symphonyies-dudamel.webp	36	12	257	\N	2020
243	ives-symphony-1-4-thomas.webp	36	9	257	\N	1989
244	ives-symphony-1-sinclair.webp	46	36	257	\N	2002
245	ives-symphony-2-schermerhorn.webp	42	36	258	\N	2000
277	scriabin-etudes-magaloff.webp	43	56	293	\N	1992
246	ives-symphony-2-bernstein.webp	42	12	258	\N	1988
247	ives-holiday-symphony-thomas.webp	41	9	261	\N	1986
248	ives-orchestral-sets.webp	62	36	262	2006	2007
249	ives-symphony-3-sinclair.webp	36	36	266	\N	2000
250	ives-sonata-1-macgregor.webp	35	48	270	\N	1990
251	ives-sonata-1-nalley.webp	28	47	270	\N	2002
252	ives-sonata-2-aimard.webp	48	26	271	\N	2004
253	ives-sonata-2-hamelin.webp	44	50	271	\N	1988
254	ives-sonata-2-lubimov.webp	45	23	271	\N	1997
255	ives-sonata-1-masselos.webp	31	43	270	\N	1967
256	ives-sonata-2-blackwood.webp	44	49	271	\N	1991
257	ives-piano-works-berman.webp	32	50	272	1999	2004
258	ives-string-quartets-leipziger.webp	52	51	276	\N	2002
259	ives-string-quartets-emerson.webp	48	12	276	1990	1991
260	ives-string-quartets-blair.webp	50	36	276	\N	2004
261	ives-piano-trio-gould.webp	23	52	280	\N	2019
262	ives-violin-sonatas-fulkerson.webp	80	53	281	\N	1989
263	ives-violin-sonatas-hahn.webp	65	12	281	\N	2011
264	ives-songs-degaetani.webp	45	54	286	\N	1976
265	scriabin-symphonies-muti.webp	51	4	287	\N	1985
266	scriabin-symphonies-muti.webp	48	4	288	\N	1989
267	scriabin-symphonies-muti.webp	48	4	289	\N	1988
268	scriabin-symphonies-muti.webp	41	4	292	\N	1990
269	scriabin-symphony-1-petrenko.webp	49	55	287	\N	2017
270	scriabin-symphony-2-petrenko.webp	51	55	288	\N	2016
271	scriabin-symphony-3-petrenko.webp	48	55	289	\N	2015
272	scriabin-symphony-1-petrenko.webp	41	55	292	2015	2017
273	scriabin-symphony-1-segerstam.webp	48	1	287	\N	1991
274	scriabin-symphony-2-segerstam.webp	47	1	288	\N	1991
275	scriabin-symphony-3-segerstam.webp	50	1	289	\N	1989
276	scriabin-symphony-1-segerstam.webp	45	1	292	\N	1991
278	scriabin-mazurkas-jablonski.webp	77	2	298	\N	2019
279	scriabin-sonatas-malikova.webp	135	57	308	2012	2014
280	scriabin-lettberg.webp	109	58	320	2004	2007
281	scriabin-lettberg.webp	143	58	336	2004	2007
282	scriabin-concerto-ugorski.webp	27	12	370	\N	1996
283	scriabin-symphony-2-petrenko.webp	26	55	370	\N	2016
284	messiaen-turangalila-lintu.webp	75	2	371	\N	2014
285	messiaen-turangalila-wit.webp	81	36	371	\N	1998
286	messiaen-turangalila-chailly.webp	75	34	371	\N	1992
287	messiaen-haiku-boulez.webp	23	12	372	\N	1994
288	messiaen-concert-quatre-chung.webp	26	12	373	\N	1994
289	messiaen-canyons-eschenbach.webp	101	60	374	\N	2013
292	messiaen-concertos-birds.webp	44	\N	377	1988	1994
293	messiaen-jarvi.webp	17	6	380	\N	2019
294	messiaen-jarvi.webp	37	6	381	\N	2019
295	messiaen-cambreling.webp	21	61	384	\N	2005
296	messiaen-cambreling.webp	36	61	385	\N	2008
297	messiaen-eclairs-wit.webp	62	62	386	\N	1993
298	messiaen-poemes-fleming.webp	28	34	388	\N	2011
300	messiaen-chants-naxos.webp	92	36	393	2008	2013
301	messiaen-cambreling.webp	100	61	389	\N	2000
302	messiaen-anniversary-warner.webp	39	26	387	\N	1990
303	messiaen-chants.webp	22	63	390	\N	1984
304	messiaen-catalogue-doseaux-aimard.webp	153	8	396	\N	2017
305	messiaen-vingt-regards-helmchen.webp	130	6	397	\N	2014
306	messiaen-vingt-regards-macgregor.webp	127	48	397	\N	1995
307	messiaen-fauvette-kodama.webp	32	3	398	\N	2012
308	messiaen-visions-argerich.webp	48	4	399	\N	1989
309	messiaen-quartet-frost.webp	47	9	400	\N	2017
310	messiaen-quartet-tashi.webp	46	64	400	\N	1975
311	messiaen-organ-latry.webp	53	12	401	\N	2000
312	messiaen-organ-latry.webp	63	12	402	\N	2000
313	messiaen-organ-latry.webp	55	12	403	\N	2000
314	messiaen-organ-latry.webp	29	12	404	\N	2000
315	messiaen-organ-latry.webp	45	12	405	\N	2000
316	messiaen-organ-latry.webp	72	12	406	\N	2000
317	messiaen-organ-latry.webp	102	12	407	\N	2000
\.


--
-- Data for Name: recordings_streamers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recordings_streamers (id, recording_id, streamer_id, link) FROM stdin;
1	1	1	album/103058587
2	1	2	album/0gq9wSvD7AWeWsOb9t3js6?si=J41k9GSxQkWMxSlFkJxE6w
3	2	1	album/77283909
4	2	2	album/1Uoswscwxpl2YhWLU3XTs7?si=vb74e4IZT_iySFRzvtQB8A
5	3	1	album/17458772
6	3	2	album/5AERaZL6kMewYozwnCH0n6?si=6tqvI-c2StmzAcyZ1biK_A
7	4	1	album/1373960
8	4	2	album/7C6DuIdlKhoqBrcQ7omslG?si=qpFKnlDlQpqx_QseRVBY-w
9	5	1	album/27094316
10	5	2	album/2ncVD86LLHW6MC3PEYzSoE?si=Jr2JpSTwQwmzhx7UU8Mmxg
11	6	1	playlist/cbfee9cd-c04a-4729-bf32-68375fd83269
12	7	1	album/50964107
13	7	2	album/4NzVMa8QDn5JI4ftJHUkJf?si=lv8HQe13RpKLnNkLRfszAA
14	8	1	album/6086347
15	8	2	album/3luL29XBghDJzlCBOQmJ9w?si=xizXmRFVQWuQ0rhksMrmMQ
16	9	1	album/17482293
17	9	2	album/4DAgSXAvvr6R5cLiyTK6ud?si=xZond973R8e7RmQ-ah97lA
18	10	1	album/12721302
19	10	2	album/1AAmBFqffp2JOoO4OwWQLg?si=As-A77L0SCqa_0PsFkTHxg
20	11	1	album/93158822
21	11	2	album/6XaCGjrIRFiS5D5IVg66vb?si=ctsO7yxQTXSLwSyWKo2Tww
22	12	1	album/126482
23	12	2	album/0haPrBGK8MEZzJqlcCj9yy?si=GNKVCw16Sqq7vtULpWkK8Q
24	13	1	album/77599345
25	14	1	playlist/214e7875-74cb-4077-b753-2f2d5872b60b
26	15	1	album/47066608
27	15	2	album/7G7uMmAHmB4qhgOpDzLtF9?si=HAsvIYNnT8qrlguR257INQ
28	16	1	album/26838544
29	17	1	playlist/db903621-2f41-4a5b-b16f-afa6203e2bc4
30	18	1	album/53983919
31	18	2	album/05ufKYHMtA9dPCqoIzcLrg?si=5qfZLiksQMOLZxCR2Z25SQ
32	19	1	playlist/aca24443-3e75-430c-b3d9-c826fce0b231
33	19	2	album/3Z0HQ85KstYoApdHGpKobf?si=162am3VHQOKnri8yNvOA3g
34	20	1	playlist/b2545491-fe09-420f-874b-f0904da37741
35	20	2	album/6gn200MSYJ2OviwOM5JNxW?si=T1cUHxqOTUGs3GdLQ8Zvxw
36	21	1	playlist/149e49b8-de94-4db4-88bf-242cf60bfc84
37	21	2	album/3DeUK3WvHJ9jQxqfBanJ8C?si=5wKsoWuYSLCGIPLTG9Uj-A
38	22	1	playlist/da203be0-cd7a-4d56-89a6-ca5641b89db7
39	23	1	browse/album/12476532
40	24	1	album/77599776
41	24	2	album/50Tp1V8zhhorvJmhWBVSY8?si=3VlPM98vTbadGAMWWqiZWA
42	25	1	playlist/277172e1-ab9b-426e-8a6d-bcbcbaba1013
43	25	2	album/3dxBBQDkoYHveD9lEqXH2I?si=6d_ejUf8RVCTPc81EoUcuw
44	26	1	album/12476613
45	27	1	album/17450206
46	27	2	album/7lLbrGLSCEFijxY59uQ9CQ?si=JKGdyCBJTESO3kaQBTGP0A
47	28	1	album/140969159
48	28	2	album/1LfBkZlHquTu8uJ7Ww6wnI?si=sc8l-s2ATTeFV-xElrG-3A
49	29	1	album/30837439
50	29	2	album/6zzmGmSf5klTltSw2y5diX?si=yXZp8sHjR4aztRB16PZ7jw
51	30	1	album/69668826
52	30	2	album/0kE8fhD0QZAy3qXfSi6Ejf?si=bjFJYhrrQXyH-q3hYlEKFA
53	31	1	album/77697404
54	31	2	album/7KmBdugttlSbWYXm8RaLfc?si=4hqOpNolTDijNJq8oj7fnQ
55	32	1	album/46999532
56	33	1	album/92929727
57	34	1	album/66414727
58	35	1	album/8546817
59	36	1	album/51979931
60	37	1	album/86675050
61	38	1	album/13332959
62	39	1	album/1787692
63	40	1	album/69717212
64	41	1	album/53891184
65	42	1	album/25906026
66	43	1	album/62426155
67	44	1	playlist/870109fb-3967-4cef-af7a-7db7af8486e6
68	45	1	album/77689998
69	46	1	album/14646394
70	47	1	album/68794282
71	48	1	playlist/535bd16a-b67c-4189-a611-ff733d2bd7ee
72	49	1	album/14646017
73	50	1	album/64406045
74	51	1	album/138451133
75	52	1	album/68795617
76	53	1	album/140578089
77	54	1	album/71287290
78	55	1	album/52522070
79	56	1	album/103387064
80	57	1	album/290521
81	58	1	album/316298
82	59	1	playlist/82c69a60-7ffe-4a5f-b22f-9436aafc2200
83	60	1	playlist/078f0647-ceb5-4bbb-a380-a7aa2bbc0d46
84	61	1	album/150654586
85	62	1	album/63851495
86	63	1	album/12477301
87	64	1	album/50605306
88	65	1	album/65306169
89	66	1	album/47062121
90	67	1	album/4364177
91	68	1	playlist/eefdd9cb-60f5-4075-8f54-d260201deff7
93	69	1	playlist/f580e0ad-e001-46ae-8e7c-b18c1cf22fda
94	70	1	playlist/069ee9a0-6cfb-4ca3-bfc8-119b31d10eb6
95	72	1	playlist/121aecbe-3317-495a-8b2c-04a2c23eb4ea
96	71	1	playlist/a97de68b-624a-43ac-a502-a3c438699ceb
129	73	1	playlist/fdb494e3-aaf9-4a13-a79a-bb6fccf52c1c
130	74	1	playlist/731f2d0b-2a30-47f3-841f-4da6fe681d80
131	75	1	playlist/e83e3fd8-dc0c-4a22-9a04-d9f9cf49c1f1
132	76	1	album/69464822
133	77	1	album/80788869
134	78	1	playlist/9ba641aa-6940-4ed7-b5d0-ec1caa176352
135	79	1	album/82258337
136	80	1	playlist/48445132-4304-4333-854a-bb177832a0b4
137	81	1	playlist/5328d516-70e6-4731-9ad2-3089607d4a7a
138	82	1	album/36093748
139	83	1	album/1116194
140	84	1	album/4421756
141	85	1	album/73660774
142	86	1	album/104022519
143	87	1	album/77599270
144	88	1	album/125587329
145	89	1	album/12126731
228	172	1	playlist/1dd111f3-3fdb-47e2-b9aa-6b589f2862a4
229	173	1	playlist/ee24272e-b3bc-4de4-b2dd-85e842ef68ef
226	170	1	playlist/4a90ecb0-99df-4234-b50c-8a48ceb18c72
147	90	1	album/1386822
146	91	1	album/57692739
148	92	1	album/79414502
150	94	1	album/127785252
151	95	1	album/47052965
152	96	1	album/46998826
153	97	1	album/28073769
154	98	1	album/1328420
155	99	1	playlist/cfc61b08-2ce6-42f8-851d-9e323070a571
156	100	1	album/77613237
157	101	1	album/355640
158	102	1	album/79936648
159	103	1	playlist/fcc897de-b0f7-434f-afb9-78cf2fd8b000
160	104	1	playlist/e9d43f6f-22be-4c64-938e-1c03831b5ea1
161	105	1	playlist/e3e76d65-62ba-4319-9d4a-26de873c2f34
162	106	1	album/77599242
163	107	1	album/5466589
164	108	1	album/12125746
165	109	1	album/13189557
166	110	1	playlist/f69aa8e4-6cb2-4a40-b303-901102c8fb08
167	111	1	playlist/4e95e4ac-a206-48b6-a854-1acfaedacfb6
168	112	1	playlist/d9bed2ad-d4c8-46d1-b4a6-17d7827b2683
169	113	1	playlist/e2aa2ee7-1ff2-41d2-8287-1853fda4d76a
170	114	1	playlist/0386ac80-3def-4bbe-884c-4e375a2eb482
171	115	1	playlist/6ceddc60-89d7-4d29-9003-c41083611726
172	116	1	playlist/02871db6-5732-47b0-a51a-27282a7f1fd3
173	117	1	playlist/fd00dbc8-b3c0-4d53-bc47-b5d434770aee
174	118	1	playlist/fbfd0c65-efa3-4e41-bad2-7f9d3ef269fc
175	119	1	playlist/daea8300-b800-4b02-a600-bb2fb604713b
176	120	1	playlist/18f95f96-11bd-4612-9285-ac5b9baaa598
177	121	1	playlist/a934c1d9-2762-4911-b957-ae3fd2f7b3a2
178	122	1	playlist/733c67d6-0242-46e6-bf9c-11261520b622
179	123	1	playlist/71af78d4-4ddd-4b71-83c0-6db3e6fdb9e2
180	124	1	playlist/91baead8-6d61-41f8-966d-ad404ee3d406
181	125	1	playlist/12ee85ee-cf35-456b-9b9b-a5b0abab2779
182	126	1	playlist/263656f7-7cc7-4271-b54c-2e44fcabecff
183	127	1	playlist/45b393a9-e209-4dc5-9da8-2d61f28598a9
184	128	1	playlist/aa525b82-d80d-431b-a2c6-22b43c61e324
185	129	1	playlist/9a813776-fb5b-4b4c-8649-27d1671338a4
186	130	1	playlist/4210248e-764d-452d-93ff-66917b7be36d
187	131	1	playlist/6c390963-d20f-4e32-b87f-9c04cc1e54fe
188	132	1	playlist/ced7cacc-ad0e-482d-82b3-756c5032dc56
189	133	1	playlist/9de17c2b-1a43-4ffc-a45d-fd25c2d9c028
190	134	1	playlist/e9d7c10b-fe0c-4fdf-9152-4c2a0e889d1b
191	135	1	playlist/49656576-bbca-444d-954f-6a8f923e08d0
192	136	1	playlist/6f94ab56-b269-4f68-b316-6f451adb814f
193	137	1	playlist/bc182f4a-5daa-4b6d-9bc8-05b81f941b31
194	138	1	playlist/f126943a-0fd6-4766-ae87-77b05a0fb417
195	139	1	playlist/07b6fa9f-60ab-45df-9d3a-f31288e54ba0
196	140	1	playlist/c6debb07-9ea9-4502-bcea-33a13a9e32aa
197	141	1	playlist/91bc9cec-167e-446d-9f52-d7328716e22d
198	142	1	album/12666745
199	143	1	playlist/47008127-5349-4505-9e49-c2ad343dc229
200	144	1	playlist/8b9b30f8-d22f-49ce-bb93-48811ed77754
201	145	1	playlist/ceb0beab-213c-4e56-987a-085bd08c1e08
202	146	1	playlist/e1df2710-58ca-42c6-98f0-76dfbf02bd02
203	147	1	album/1353393
204	148	1	album/117649179
205	149	1	playlist/d41953b7-ec77-4a07-b839-07a24c1e30c7
206	150	1	playlist/41e40689-ca3b-410c-a608-a399f4afb4eb
207	151	1	playlist/f8266013-3a11-4d60-9b90-a6e2d38021cc
208	152	1	playlist/51f80b20-d0c0-4201-b9ed-8a939b78b8ad
209	153	1	playlist/8fc932ed-f3a7-46e2-a288-b45003a6d514
210	154	1	playlist/1d15ba3a-bf79-4587-bd11-d37cd045ee67
211	155	1	playlist/0c78cd26-2a81-4c60-9659-f3e1ff5725ba
212	156	1	playlist/b0c190e0-0912-4f6e-bb77-1401f26bccc8
213	157	1	playlist/e9ec9495-fff0-4bae-ae44-77d91a9be150
214	158	1	album/59774450
215	159	1	playlist/873d7106-8255-45a8-b61a-c50255576edb
216	160	1	playlist/730f815d-82cf-4663-8768-ec32aa3123e3
217	161	1	playlist/5bef3c4d-de8a-4bab-8c85-24754116da68
218	162	1	album/7760962
219	163	1	playlist/4a3f39a2-70c5-4adc-99cf-c651ca6eb13e
220	164	1	playlist/049352ab-3a64-4c83-996c-6ebfc0338c1a
221	165	1	playlist/5f7cae69-a4b6-4a64-af50-f2e10cfb55ac
222	166	1	playlist/4fc58ba9-fc64-43f4-9865-dd1c47399266
224	168	1	playlist/57841b9e-d5ed-427b-b123-045a91984461
225	169	1	playlist/1b311533-93fd-431e-b7a1-fc7b04b40c9a
231	171	1	playlist/6884775e-a6ba-4f44-85a3-476fc6325ec7
230	175	1	playlist/1dd111f3-3fdb-47e2-b9aa-6b589f2862a4
232	177	1	playlist/50e63b66-76ac-4f55-9cb4-fb207fcf773b
233	178	1	playlist/f6486c3f-63eb-496e-975c-ffa8b5cfc9e0
234	179	1	playlist/16ad3468-1bb9-4fc3-a20a-e357a42653a6
235	180	1	playlist/01004395-e403-4732-8307-eeaedfbdc188
236	181	1	playlist/f199b97a-2086-444b-83f2-d9470e265dff
237	182	1	playlist/f3321737-4b85-4ba7-a8ec-394a2f08d160
238	183	1	playlist/73e44eb7-0756-4602-ba44-7b53f3a36027
239	184	1	playlist/7340c6b0-eb06-4c30-b8d1-66406bc8b11e
240	185	1	playlist/2329659d-0c41-43a0-a005-5c8710ad4ff1
241	193	1	playlist/3a1f3d7a-6a92-4a2d-9013-99c88f4f0f13
242	194	1	playlist/3966ff08-ad73-4ac2-99d9-a3fdcbd10a11
243	195	1	playlist/ace167d2-2d92-4aaa-a5ac-bec78bbfd02e
244	196	1	playlist/161add94-f3ab-48b1-813e-4936be871490
247	199	1	playlist/07bbd381-1c8a-4bbb-817a-541422543177
246	198	1	playlist/4b0f71ef-0548-4995-a971-f4773fb80b2f
245	197	1	playlist/36394582-3c9b-4c90-bfd3-b35d0f10e657
248	202	1	playlist/420ea2f1-ce1c-496b-8429-ace33ddb96e3
249	203	1	playlist/78e94e64-3ccb-410c-9115-8d53f79c8576
250	204	1	playlist/740a05eb-7b53-48b1-b731-731ff438b163
251	205	1	playlist/b3fcfa5f-cc72-4d37-bcc0-4a2cd6041079
252	206	1	playlist/959d7271-3d31-4b61-b80c-6caad3a69a5f
253	207	1	playlist/3e44bf32-e50c-4678-a8b2-2307cdd2f82a
254	208	1	playlist/d6b85e10-9aaa-4afa-8b4a-4aea9dc54b37
255	209	1	playlist/bfe3f8a1-6bc0-4508-846d-6c0519b3ef3a
256	210	1	playlist/fc8c3ef1-6584-4f97-be68-ff298c16bc13
257	211	1	playlist/8e2b5bda-0f2c-4008-a470-2e00799d1e27
258	212	1	playlist/80eed2f8-8855-42c5-bd12-ecae98978cf4
259	213	1	playlist/34ff30a3-490d-4619-b140-ac6146d382bb
260	214	1	playlist/a24921c1-6293-46ff-9f5f-2fff5432caf8
261	215	1	playlist/75fd22e3-289f-4c35-857b-476a529e742e
262	216	1	playlist/e50d28ec-87ae-4338-829b-5f6adc296941
263	217	1	playlist/e64bc0a7-9b45-40d0-8eb1-47ba3c878c36
264	218	1	playlist/5b3e77f1-a879-4649-b147-f91477ecb9dc
265	219	1	playlist/abab8ba3-33f5-4ed8-ac41-7d4fb9c29c89
266	220	1	playlist/9b93ba3f-d999-4e3c-bb99-6f1d59bb1e14
267	221	1	playlist/adc53329-e7f5-4c16-a5f2-377e27bc5b60
268	222	1	playlist/2292d60b-7338-4f6b-802b-829289609364
269	223	1	playlist/0af49431-f2aa-4c9f-8824-2e88ea1beb8e
270	224	1	playlist/3a11216f-62fd-4413-8a13-5e7e043b4d1e
271	225	1	playlist/c60f6346-db6c-441c-bdc0-72e7ef7e32ab
272	226	1	playlist/503195a7-9fb6-4e14-ad34-ce84d105378d
273	227	1	playlist/fe4c0224-752b-4ae9-bab0-af0359717fd7
274	228	1	browse/playlist/d29eebae-37ce-4fc7-b00f-b707a11dfb86
275	229	1	browse/playlist/64991910-0f70-45f9-9f0f-4b50697ff532
276	230	1	browse/playlist/7c57d8ae-4756-415b-beb4-dbe39f451007
277	231	1	browse/playlist/37d40c5c-3a54-4929-985d-cbd89a4b501c
278	232	1	browse/playlist/de0006e8-374c-455f-b58d-1962fe50c339
279	233	1	browse/playlist/729a5a42-3b19-4cd5-bcdc-b2e20c20d372
280	234	1	browse/playlist/6b7f4400-eb02-49b3-a5f2-4ab41cd5de19
281	235	1	album/83566035
282	236	1	playlist/cd42ec98-1487-45ca-9fb0-ff172d50ba44
283	237	1	playlist/f0ea1d77-6c85-4cee-be59-8b2abb6c4693
284	238	1	playlist/29397f53-e42d-4145-84e3-f0522483c0e9
285	239	1	playlist/3ca383af-d80f-442d-9d93-a97d525e8c8a
286	240	1	playlist/e37f3a0e-24b3-467b-812d-318d7edee63a
288	241	1	playlist/ba6a7a38-57e8-4406-9137-c91bc319868c
287	242	1	playlist/33ef5930-2919-4628-a524-49d20d94014d
289	243	1	playlist/c989b04f-931a-4ddd-a593-29618dd7a79f
290	244	1	playlist/8686656c-9b30-457e-8a3a-4a9d345b824c
315	269	1	playlist/9bc91054-d86e-419b-8ec7-fff81df2ae55
291	245	1	playlist/77d0ffc6-22fd-4e68-9211-8f06801a140b
292	246	1	playlist/8b49b91c-a69f-410f-a20a-e24ea113c7e3
293	247	1	playlist/8b51c34e-d74d-4a1c-8203-2abecfadb743
294	248	1	album/12021266
295	249	1	playlist/fd36761d-2bfb-4b5d-a97f-73d4a8267a5d
296	250	1	playlist/d0accca6-004c-4a7a-b6f8-d3f4c9f00eff
297	251	1	playlist/a00049c9-4fce-4a23-b8e6-68356fe301c5
298	252	1	playlist/6dcfcaa6-ddd9-43fc-90b8-f65c6eb0c07e
299	253	1	playlist/6131e9e7-4a8a-49d7-9415-b062d30dab0a
300	254	1	playlist/818390b3-40a0-4ae8-bfd1-0155e8c00c3c
301	255	1	album/146008043
302	256	1	playlist/ba2d728c-30c0-4c86-95e9-4702facfa624
303	257	1	playlist/32e70b76-2259-40a8-98c3-826196808bad
304	258	1	playlist/e106e826-eeac-487a-82cf-835a4916d890
305	259	1	playlist/06c0766d-c668-464f-9964-3fef1cd50590
306	260	1	album/12019790
307	261	1	playlist/f79601e9-3559-4b4e-b4bc-4b3f2f61bee0
308	262	1	browse/album/136131029
309	263	1	browse/album/90471207
310	264	1	album/290934
311	265	1	playlist/31b46555-8afe-46db-9588-519034fc3f3a
312	266	1	playlist/6104d460-e1c3-42ba-a781-0621956429dc
313	267	1	playlist/d2101885-5b0b-457c-bffb-8308a5c66dfe
314	268	1	playlist/72556c1c-b1b5-4cc7-af2c-6a4d6c95a109
316	270	1	playlist/8a78c58f-f369-436b-8945-cd051f0c7e72
317	271	1	playlist/78a4dedb-fd7c-4af0-b218-f926466c1c8f
318	272	1	playlist/fd9ea5d1-aec6-4d4f-b462-45f53bcfae92
319	273	1	playlist/c48c1ca7-a95f-4c3f-b7a1-d0d2b49b9bce
320	274	1	playlist/07c50bf3-eef7-4751-b247-680f1f805062
321	275	1	playlist/79d875c0-25fd-44b2-9cba-86fec37c70e2
322	276	1	playlist/145f51e8-3d75-4fc8-a296-b61a18bc770d
323	277	1	album/70272819
325	278	1	album/129591600
326	279	1	playlist/3bde7b21-2d44-4b64-80be-68d3b8397ff6
327	280	1	playlist/c63b881f-73ff-4646-91d8-d0b9c10a5c1a
328	281	1	playlist/4b9fcf71-228f-483d-aab2-715a7220e41d
329	282	1	playlist/189eb73c-7338-4bc3-8029-e9eed0ab5f17
330	283	1	playlist/c8df51a6-5abb-45cb-ac59-9bd2377fa9aa
331	284	1	album/30837311
332	285	1	playlist/d182e132-907c-40c9-a65f-23e9c017d511
333	286	1	album/17736169
334	287	1	playlist/e39affc0-9837-458b-b01b-46a7395bf82f
335	288	1	playlist/7e29ca11-db2e-4838-ae7d-a24de77ca706
336	289	1	album/111832804
339	292	1	playlist/2dc36d02-4550-42f0-8ffa-938214ddc450
340	293	1	playlist/590c858e-88df-4754-a7e7-ba4b69bc4486
341	294	1	playlist/71c267af-b9fe-4cab-b811-79b955c91fe6
342	295	1	playlist/dcfb49e5-95dd-4c01-9dee-4692a167cc4e
343	296	1	playlist/6d10a87a-4c1c-49a1-884a-0826912f0455
344	297	1	album/29150630
345	298	1	playlist/d610117e-c862-4d96-b7f3-ab08c6b999c8
346	300	1	playlist/be109047-2b14-42e3-b60a-f864eba8cf83
347	301	1	playlist/2e3f4a03-1220-49bb-b06a-064e5f6f5011
348	302	1	playlist/7ce4c1da-31aa-45c5-a7f3-4036d8ef4acb
349	303	1	playlist/5b109cff-657d-40d6-8917-a2d54a9952d5
350	304	1	playlist/e50800d5-b1a0-473c-a938-c97cbb603b80
351	305	1	album/102631563
352	306	1	album/46916967
353	307	1	playlist/c52b969e-cfb9-4ad9-be0c-0f8746c3e2e2
354	308	1	album/108397719
355	309	1	album/80058229
356	310	1	album/73014959
357	311	1	playlist/c4308bef-b31b-4a69-bbce-3b23608458da
358	312	1	playlist/2c7868dd-49cb-4d04-8518-ce0347bda66f
359	313	1	playlist/3840b089-702b-4dbc-af64-9923aab7d0b3
360	314	1	playlist/acc1e675-2272-441e-96ac-7a6976b119c5
361	315	1	playlist/0cf72639-c8c1-417b-a363-1ae177aa6551
362	316	1	playlist/db55a986-3959-438b-9fa5-a365991c590e
363	317	1	playlist/abbc722c-4a88-40cb-864e-d585ea4e0194
\.


--
-- Data for Name: streamers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.streamers (id, name, icon_name, app_prefix) FROM stdin;
1	Tidal	tidal-logo.svg	tidal://
2	Spotify	spotify-logo.svg	spotify://
3	Apple Music	apple.svg	apple://
\.


--
-- Data for Name: works; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.works (id, title, composer_id, year_start, year_finish, average_minutes, is_group, parent_work_id, catalogue_id, catalogue_number, catalogue_postfix, instrument_id, key_id, no, nickname) FROM stdin;
70	Concerto	7	\N	1738	\N	f	56	1	1052	\N	\N	3	1	\N
2	Cello Suites	7	1717	1723	160	t	\N	\N	\N	\N	\N	\N	\N	\N
3	English Suites	7	1715	1720	120	t	\N	\N	\N	\N	\N	\N	\N	\N
4	Inventions & Sinfonias	7	1720	1723	50	t	\N	\N	\N	\N	\N	\N	\N	\N
5	French Suites	7	1722	1725	90	t	\N	\N	\N	\N	\N	\N	\N	\N
6	Partitas	7	1725	1730	150	t	\N	\N	\N	\N	\N	\N	\N	\N
57	Oboe Concertos	7	1730	1738	60	t	\N	\N	\N	\N	\N	\N	\N	\N
13	Art of Fugue	7	1741	1746	80	f	\N	1	1080	\N	\N	\N	\N	\N
12	Goldberg Variations	7	1741	\N	110	f	\N	1	988	\N	\N	\N	\N	\N
20	Suite	7	1717	1723	\N	f	2	1	1007	\N	2	\N	1	\N
21	Suite	7	1717	1723	\N	f	2	1	1008	\N	2	\N	2	\N
22	Suite	7	1717	1723	\N	f	2	1	1009	\N	2	\N	3	\N
23	Suite	7	1717	1723	\N	f	2	1	1010	\N	2	\N	4	\N
24	Suite	7	1717	1723	\N	f	2	1	1011	\N	2	\N	5	\N
25	Suite	7	1717	1723	\N	f	2	1	1012	\N	2	\N	6	\N
29	Toccata	7	\N	1708	\N	f	11	1	913	\N	\N	3	4	\N
28	Toccata	7	\N	1710	\N	f	11	1	912	\N	\N	8	3	\N
31	Toccata	7	\N	1710	\N	f	11	1	915	\N	\N	10	6	\N
27	Toccata	7	\N	1714	\N	f	11	1	911	\N	\N	7	2	\N
32	Toccata	7	\N	1714	\N	f	11	1	916	\N	\N	11	7	\N
30	Toccata	7	\N	1710	\N	f	11	1	914	\N	\N	9	5	\N
26	Toccata	7	\N	1712	\N	f	11	1	910	\N	\N	6	1	\N
60	The Art of Fugue	7	1741	1746	80	f	\N	1	1080	\N	\N	\N	\N	\N
11	Toccatas	7	1708	1714	70	t	\N	\N	\N	\N	\N	\N	\N	\N
35	Suite	7	1715	1720	\N	f	3	1	808	\N	\N	10	3	\N
34	Suite	7	1715	1720	\N	f	3	1	807	\N	\N	13	2	\N
37	Suite	7	1715	1720	\N	f	3	1	810	\N	\N	9	5	\N
36	Suite	7	1715	1720	\N	f	3	1	809	\N	\N	15	4	\N
38	Suite	7	1715	1720	\N	f	3	1	811	\N	\N	3	6	\N
33	Suite	7	1715	1720	\N	f	3	1	806	\N	\N	12	1	\N
39	Suite	7	\N	1722	\N	f	5	1	812	\N	\N	3	1	\N
40	Suite	7	\N	1722	\N	f	5	1	813	\N	\N	7	2	\N
41	Suite	7	\N	1722	\N	f	5	1	814	\N	\N	2	3	\N
42	Suite	7	1722	1725	\N	f	5	1	815	\N	\N	17	4	\N
43	Suite	7	\N	1722	\N	f	5	1	816	\N	\N	11	5	\N
44	Suite	7	1722	1725	\N	f	5	1	817	\N	\N	5	6	\N
45	Partita	7	\N	1726	\N	f	6	1	825	\N	\N	18	1	\N
46	Partita	7	\N	1726	\N	f	6	1	826	\N	\N	7	2	\N
48	Partita	7	\N	1728	\N	f	6	1	828	\N	\N	8	4	\N
49	Partita	7	\N	1730	\N	f	6	1	829	\N	\N	11	5	\N
50	Partita	7	\N	1730	\N	f	6	1	830	\N	\N	9	6	\N
55	Brandenburg Concertos	7	\N	1721	100	t	\N	\N	\N	\N	\N	\N	\N	\N
54	Violin Concertos	7	1718	1730	60	t	\N	\N	\N	\N	\N	\N	\N	\N
7	Italian Concerto, French Overture	7	1733	1735	45	t	\N	\N	\N	\N	\N	\N	\N	\N
52	French Overture	7	1733	1735	\N	f	7	1	831	\N	\N	2	\N	\N
88	Orchestral Suite	7	\N	1718	\N	f	59	1	1066	\N	\N	4	\N	\N
53	Chromatic Fantasia and Fugue 	7	1717	1723	\N	f	7	1	903	\N	\N	3	\N	\N
51	Italian Concerto	7	\N	1735	\N	f	7	1	971	\N	\N	15	\N	\N
47	Partita	7	\N	1727	\N	f	6	1	827	\N	\N	13	3	\N
89	Orchestral Suite	7	1738	1739	\N	f	59	1	1067	\N	\N	2	\N	\N
1	Violin Sonatas & Partitas	7	\N	1720	140	t	\N	\N	\N	\N	\N	\N	\N	\N
17	Partita	7	\N	1720	\N	f	1	1	1004	\N	1	3	2	\N
16	Sonata	7	\N	1720	\N	f	1	1	1003	\N	1	3	2	\N
19	Partita	7	\N	1720	\N	f	1	1	1006	\N	1	5	3	\N
18	Sonata	7	\N	1720	\N	f	1	1	1005	\N	1	4	3	\N
15	Partita	7	\N	1720	\N	f	1	1	1002	\N	1	2	1	\N
14	Sonata	7	\N	1720	\N	f	1	1	1001	\N	1	1	1	\N
9	Well-Tempered Clavier, Book 2	7	\N	1740	170	t	\N	\N	\N	\N	\N	\N	\N	\N
71	Concerto	7	\N	1738	\N	f	56	1	1053	\N	\N	5	2	\N
8	Well-Tempered Clavier, Book 1	7	\N	1722	140	t	\N	\N	\N	\N	\N	\N	\N	\N
65	Concerto	7	1720	1721	\N	f	55	1	1050	\N	\N	8	5	\N
64	Concerto	7	1719	1720	\N	f	55	1	1049	\N	\N	11	4	\N
66	Concerto	7	\N	1718	\N	f	55	1	1051	\N	\N	18	6	\N
61	Concerto	7	\N	1721	\N	f	55	1	1046	\N	\N	13	1	\N
63	Concerto	7	\N	1718	\N	f	55	1	1048	\N	\N	11	3	\N
62	Concerto	7	\N	1721	\N	f	55	1	1047	\N	\N	15	2	\N
67	Concerto	7	\N	1730	\N	f	54	1	1041	\N	\N	13	\N	\N
68	Concerto	7	\N	1718	\N	f	54	1	1042	\N	\N	5	\N	\N
69	Concerto for 2 Violins	7	1718	1720	\N	f	54	1	1043	\N	\N	3	\N	\N
72	Concerto	7	\N	1738	\N	f	56	1	1054	\N	\N	8	3	\N
73	Concerto	7	\N	1738	\N	f	56	1	1055	\N	\N	12	4	\N
74	Concerto	7	\N	1738	\N	f	56	1	1056	\N	\N	16	5	\N
75	Concerto	7	\N	1738	\N	f	56	1	1057	\N	\N	15	6	\N
76	Concerto	7	\N	1738	\N	f	56	1	1058	\N	\N	10	7	\N
77	Concerto for 2 Harpsichords	7	1730	1745	\N	f	58	1	1060	\N	\N	7	\N	\N
78	Concerto for 2 Harpsichords	7	1733	1734	\N	f	58	1	1061	\N	\N	4	\N	\N
79	Concerto for 2 Harpsichords	7	\N	1736	\N	f	58	1	1062	\N	\N	7	\N	\N
80	Concerto for 3 Harpsichords	7	1735	1745	\N	f	58	1	1063	\N	\N	3	\N	\N
81	Concerto for 3 Harpsichords	7	1735	1745	\N	f	58	1	1064	\N	\N	4	\N	\N
82	Concerto for 4 Harpsichords	7	\N	1730	\N	f	58	1	1065	\N	\N	13	\N	\N
90	Orchestral Suite	7	\N	1731	\N	f	59	1	1068	\N	\N	8	\N	\N
58	Concertos for 2, 3, 4 Harpsichords	7	1730	1745	100	t	\N	\N	\N	\N	\N	\N	\N	\N
56	Harpsichord Concertos	7	\N	1738	120	t	\N	\N	\N	\N	\N	\N	\N	\N
83	Oboe Concerto	7	\N	\N	\N	f	57	1	1053	R	\N	15	\N	\N
84	Oboe d'amore Concerto	7	1730	1738	\N	f	57	1	1055	R	\N	12	\N	\N
85	Oboe Concerto	7	1730	1738	\N	f	57	1	1056	R	\N	10	\N	\N
86	Oboe Concerto	7	\N	\N	\N	f	57	1	1059	R	\N	3	\N	\N
87	Concerto for Violin and Oboe	7	\N	1736	\N	f	57	1	1060	R	\N	7	\N	\N
91	Orchestral Suite	7	\N	1725	\N	f	59	1	1069	\N	\N	8	\N	\N
59	Orchestral Suites	7	1718	1739	120	t	\N	\N	\N	\N	\N	\N	\N	\N
94	Viola da Gamba Sonatas	7	1730	1740	45	t	\N	\N	\N	\N	\N	\N	\N	\N
93	Violin Sonatas	7	1720	1723	60	t	\N	\N	\N	\N	\N	\N	\N	\N
96	The Art of Fugue	7	1741	1746	60	f	\N	1	1080	\N	\N	\N	\N	\N
126	Sonata	7	1717	1723	\N	f	93	1	1014	\N	\N	2	1	\N
127	Sonata	7	1717	1723	\N	f	93	1	1015	\N	\N	12	2	\N
128	Sonata	7	1717	1723	\N	f	93	1	1016	\N	\N	5	3	\N
129	Sonata	7	1717	1723	\N	f	93	1	1017	\N	\N	7	4	\N
130	Sonata	7	1717	1723	\N	f	93	1	1018	\N	\N	16	5	\N
131	Sonata	7	1717	1723	\N	f	93	1	1019	\N	\N	11	6	\N
132	Sonata	7	1730	1740	\N	f	94	1	1027	\N	\N	11	1	\N
133	Sonata	7	1730	1740	\N	f	94	1	1028	\N	\N	8	2	\N
134	Sonata	7	1730	1740	\N	f	94	1	1029	\N	\N	1	3	\N
135	Sonata	7	1736	1737	\N	f	95	1	1030	\N	\N	2	\N	\N
136	Sonata	7	1730	1734	\N	f	95	1	1031	\N	\N	17	\N	\N
137	Sonata	7	\N	1736	\N	f	95	1	1032	\N	\N	12	\N	\N
138	Sonata	7	\N	1736	\N	f	95	1	1033	\N	\N	4	\N	\N
139	Sonata	7	\N	1724	\N	f	95	1	1034	\N	\N	9	\N	\N
140	Sonata	7	\N	1741	\N	f	95	1	1035	\N	\N	5	\N	\N
141	Sonata for 2 Flutes	7	1736	1741	\N	f	95	1	1039	\N	\N	11	\N	\N
95	Flute Sonatas	7	1724	1741	60	t	\N	\N	\N	\N	\N	\N	\N	\N
142	Musical Offering	7	\N	1747	50	f	\N	1	1079	\N	\N	\N	\N	\N
143	Organ Works	7	1706	1739	150	f	\N	\N	\N	\N	\N	\N	\N	\N
144	Motets	7	\N	1727	60	t	\N	1	\N	\N	\N	\N	\N	\N
149	St. John Passion	7	\N	1724	120	f	\N	1	245	\N	\N	\N	\N	\N
152	Singet dem Herrn ein neues Lied	7	1726	1727	\N	f	144	1	225	\N	\N	\N	\N	\N
153	Der Geist hilft unser Schwachheit auf	7	\N	1729	\N	f	144	1	226	\N	\N	\N	\N	\N
154	Jesu, meine Freude	7	\N	1723	\N	f	144	1	227	\N	\N	\N	\N	\N
155	Fürchte dich nicht, ich bin bei dir	7	\N	1726	\N	f	144	1	228	\N	\N	\N	\N	\N
156	Komm, Jesu, komm	7	\N	1735	\N	f	144	1	229	\N	\N	\N	\N	\N
157	Sei Lob und Preis mit Ehren	7	1724	1725	\N	f	144	1	230	\N	\N	\N	\N	\N
158	O Jesu Christ, mein's Lebens Licht	7	1736	1737	\N	f	144	1	118	\N	\N	\N	\N	\N
159	Ich lasse dich nicht	7	\N	1713	\N	f	144	2	159	\N	\N	\N	\N	\N
151	Easter Oratorio	7	\N	1725	40	f	\N	1	249	\N	\N	\N	\N	\N
146	Mass in B minor	7	1747	1749	120	f	\N	1	232	\N	\N	\N	\N	\N
148	St. Matthew Passion	7	\N	1729	180	f	\N	1	244	\N	\N	\N	\N	\N
150	Christmas Oratorio	7	1734	1735	150	f	\N	1	248	\N	\N	\N	\N	\N
145	Ascension Oratorio	7	\N	1735	30	f	\N	1	11	\N	\N	\N	\N	\N
147	Magnificat	7	\N	1732	30	f	\N	1	243	A	\N	\N	\N	\N
160	Wie schön leuchtet der Morgenstern	7	\N	1725	20	f	\N	1	1	\N	\N	\N	\N	\N
161	Ich hatte viel Bekümmernis	7	\N	1714	40	f	\N	1	21	\N	\N	\N	\N	\N
162	Du wahrer Gott und Davids Sohn	7	\N	1723	15	f	\N	1	23	\N	\N	\N	\N	\N
163	Jauchzet Gott in allen Landen	7	\N	1730	15	f	\N	1	51	\N	\N	\N	\N	\N
164	Ich will den Kreuzstab gerne tragen	7	\N	1726	20	f	\N	1	56	\N	\N	\N	\N	\N
165	O Ewigkeit, du Donnerwort	7	\N	1723	15	f	\N	1	60	\N	\N	\N	\N	\N
166	Sie werden aus Saba alle kommen	7	\N	1724	15	f	\N	1	65	\N	\N	\N	\N	\N
167	Der Himmel dacht auf Anhalts Ruhm und Glück	7	\N	1724	30	f	\N	1	66	\N	\N	\N	\N	\N
168	Jesu, der du meine Seele	7	\N	1724	20	f	\N	1	78	\N	\N	\N	\N	\N
169	Ein feste Burg ist unser Gott	7	\N	1731	25	f	\N	1	80	\N	\N	\N	\N	\N
170	Ich habe genug	7	\N	1727	20	f	\N	1	82	\N	\N	\N	\N	\N
171	Du Hirte Israel, höre	7	\N	1724	15	f	\N	1	104	\N	\N	\N	\N	\N
172	Herr, gehe nicht ins Gericht mit deinem Knecht	7	\N	1723	20	f	\N	1	105	\N	\N	\N	\N	\N
173	Gottes Zeit ist die allerbeste Zeit	7	\N	1708	20	f	\N	1	106	\N	\N	\N	\N	\N
174	Wachet auf, ruft uns die Stimme	7	\N	1731	25	f	\N	1	140	\N	\N	\N	\N	\N
175	Komm, du süße Todesstunde	7	\N	1716	20	f	\N	1	161	\N	\N	\N	\N	\N
176	Leichtgesinnte Flattergeister	7	\N	1724	20	f	\N	1	180	\N	\N	\N	\N	\N
177	Laß, Fürstin, laß noch einen Strahl	7	\N	1727	30	f	\N	1	198	\N	\N	\N	\N	\N
178	Geschwinde, ihr wirbelnden Winde	7	\N	1729	50	f	\N	1	201	\N	\N	\N	\N	\N
181	5 Pieces	86	1915	1918	\N	f	179	3	81	\N	\N	\N	\N	\N
185	3 Pieces	86	\N	1929	\N	f	179	3	116	\N	\N	\N	\N	\N
184	4 Pieces	86	\N	1929	\N	f	179	3	115	\N	\N	\N	\N	\N
182	4 Pieces	86	1915	1917	\N	f	179	3	78	\N	\N	\N	\N	\N
183	5 Danses champetres	86	\N	1924	\N	f	179	3	106	\N	\N	\N	\N	\N
180	Voces Intimae	86	\N	1909	30	f	\N	3	56	\N	\N	3	\N	\N
186	Lemminkäinen Suite	86	\N	1895	45	f	\N	3	22	\N	\N	\N	\N	\N
187	Kullervo	86	\N	1892	70	f	\N	3	7	\N	\N	\N	\N	\N
188	Early Tone Poems	86	1892	1899	60	t	\N	\N	\N	\N	\N	\N	\N	\N
189	Later Tone Poems	86	1906	1926	60	t	\N	\N	\N	\N	\N	\N	\N	\N
190	En saga	86	\N	1892	20	f	188	3	9	\N	\N	\N	\N	\N
191	Skogsrået (The Wood Nymph)	86	1894	1895	20	f	188	3	15	\N	\N	\N	\N	\N
192	Vårsång (Spring Song)	86	\N	1894	10	f	188	3	16	\N	\N	\N	\N	\N
193	Finlandia	86	\N	1899	10	f	188	3	26	\N	\N	\N	\N	\N
194	Pohjolan tytär (Pohjola's Daughter)	86	\N	1906	10	f	189	3	49	\N	\N	\N	\N	\N
195	Nightride and Sunrise	86	\N	1909	15	f	189	3	55	\N	\N	\N	\N	\N
196	Dryadi	86	\N	1910	5	f	189	3	45	\N	\N	\N	\N	\N
197	Barden	86	\N	1913	5	f	189	3	64	\N	\N	\N	\N	\N
198	Luonnotar	86	\N	1913	10	f	189	3	70	\N	\N	\N	\N	\N
199	Aallottaret (The Oceanides)	86	\N	1914	10	f	189	3	73	\N	\N	\N	\N	\N
200	Tapiola	86	\N	1926	15	f	189	3	112	\N	\N	\N	\N	\N
179	Works for Violin and Piano	86	1915	1929	60	t	\N	\N	\N	\N	\N	\N	\N	\N
201	Smaller Orchestral Works	86	1893	1922	60	t	\N	\N	\N	\N	\N	\N	\N	\N
202	Karelia Suite	86	\N	1893	\N	f	201	3	11	\N	\N	\N	\N	\N
203	Rakastava Suite	86	\N	1894	\N	f	201	3	14	\N	\N	\N	\N	\N
205	Cassazione	86	\N	1904	\N	f	201	3	6	\N	\N	\N	\N	\N
206	In Memoriam	86	\N	1909	\N	f	201	3	59	\N	\N	\N	\N	\N
207	Andante Festivo	86	\N	1922	\N	f	201	3	\N	\N	\N	\N	\N	\N
215	Scaramouche	86	\N	1913	71	f	\N	3	71	\N	\N	\N	\N	\N
204	Valse Triste	86	\N	1903	\N	f	201	3	44	No. 1	\N	\N	\N	\N
208	Kuolema (Death)	86	\N	1903	24	f	\N	4	113	\N	\N	\N	\N	\N
209	Kung Kristian II	86	\N	1898	35	f	\N	3	27	\N	\N	\N	\N	\N
214	Odlan (The Lizard)	86	\N	1909	25	f	\N	3	8	\N	\N	\N	\N	\N
210	Belshazzar's Feast	86	\N	1906	22	f	\N	4	48	\N	\N	\N	\N	\N
212	Jedermann (Everyman)	86	\N	1916	50	f	\N	3	83	\N	\N	\N	\N	\N
211	Pelleas and Melisande	86	\N	1905	34	f	\N	4	147	\N	\N	\N	\N	\N
213	Svanevit (Swanwhite)	86	\N	1908	30	f	\N	4	189	\N	\N	\N	\N	\N
216	Violin Concerto	86	1903	1904	30	f	\N	3	47	\N	\N	3	\N	\N
217	Violin Serenades	86	1912	1913	15	f	\N	3	69	\N	\N	\N	\N	\N
286	Songs	66	1897	1929	45	f	\N	\N	\N	\N	\N	\N	\N	\N
219	Piano Works: Inspired by Kalevala	86	1890	1904	80	t	\N	\N	\N	\N	\N	\N	\N	\N
220	Piano Works: Inspired by Classical	86	1909	1914	60	t	\N	\N	\N	\N	\N	\N	\N	\N
222	Piano Works: Inspired by Orchestral	86	1923	1929	35	t	\N	\N	\N	\N	\N	\N	\N	\N
221	Piano Works: Inspired by Impressionism	86	1914	1917	20	t	\N	\N	\N	\N	\N	\N	\N	\N
223	6 Impromptus	86	1890	1893	\N	f	219	3	5	\N	\N	\N	\N	\N
224	Sonata	86	\N	1893	\N	f	219	3	12	\N	\N	\N	\N	\N
225	10 Piano Pieces	86	1895	1903	\N	f	219	3	24	\N	\N	\N	\N	\N
226	Kyllikki	86	\N	1904	\N	f	219	3	41	\N	\N	\N	\N	\N
227	10 Pieces	86	\N	1909	\N	f	220	3	58	\N	\N	\N	\N	\N
228	3 Sonatinas	86	\N	1912	\N	f	220	3	67	\N	\N	\N	\N	\N
229	4 Lyrical Pieces	86	\N	1914	\N	f	220	3	74	\N	\N	\N	\N	\N
230	5 Morceaux	86	1914	1919	\N	f	221	3	75	\N	\N	\N	\N	\N
231	5 Morceaux	86	1916	1917	\N	f	221	3	85	\N	\N	\N	\N	\N
232	5 Pieces Romantiques	86	1923	1924	\N	f	222	3	101	\N	\N	\N	\N	\N
233	5 Characteristic Impressions	86	1923	1924	\N	f	222	3	103	\N	\N	\N	\N	\N
234	5 Esquisses	86	\N	1929	\N	f	222	3	114	\N	\N	\N	\N	\N
235	Late Romantic Songs	86	1890	1906	70	t	\N	\N	\N	\N	\N	\N	\N	\N
236	Stylistic Transition Songs	86	1909	1915	55	t	\N	\N	\N	\N	\N	\N	\N	\N
218	Last Song Collections	86	1916	1918	35	t	\N	\N	\N	\N	\N	\N	\N	\N
238	Songs	86	1890	1904	\N	f	235	3	17	\N	\N	\N	\N	\N
239	Songs	86	1899	1900	\N	f	235	3	36	\N	\N	\N	\N	\N
240	Songs	86	1900	1902	\N	f	235	3	37	\N	\N	\N	\N	\N
241	Songs	86	1903	1904	\N	f	235	3	38	\N	\N	\N	\N	\N
242	Songs	86	\N	1906	\N	f	235	3	50	\N	\N	\N	\N	\N
243	Songs	86	\N	1909	\N	f	236	3	57	\N	\N	\N	\N	\N
244	Songs	86	\N	1910	\N	f	236	3	61	\N	\N	\N	\N	\N
245	Songs	86	1914	1915	\N	f	236	3	72	\N	\N	\N	\N	\N
246	Songs	86	\N	1916	\N	f	218	3	86	\N	\N	\N	\N	\N
247	Songs	86	1917	1918	\N	f	218	3	90	\N	\N	\N	\N	\N
248	Songs	86	\N	1917	\N	f	218	3	88	\N	\N	\N	\N	\N
249	Symphony	86	1898	1899	40	f	\N	3	39	\N	\N	\N	1	\N
250	Symphony	86	1901	1902	45	f	\N	3	43	\N	\N	\N	2	\N
253	Symphony	86	1915	1915	30	f	\N	3	82	\N	\N	\N	5	\N
251	Symphony	86	\N	1907	30	f	\N	3	52	\N	\N	\N	3	\N
252	Symphony	86	1910	1911	35	f	\N	3	63	\N	\N	\N	4	\N
255	Symphony	86	\N	1924	25	f	\N	3	105	\N	\N	\N	7	\N
254	Symphony	86	1918	1923	30	f	\N	3	104	\N	\N	\N	6	\N
260	Symphony	66	\N	1916	30	f	\N	\N	\N	\N	\N	\N	4	\N
262	Orchestral Sets	66	1912	1926	30	t	\N	\N	\N	\N	\N	\N	\N	\N
264	Orchestral Set	66	1909	1919	\N	f	262	\N	\N	\N	\N	\N	2	\N
263	Orchestral Set	66	1912	1916	\N	f	262	\N	\N	\N	\N	\N	1	Three Places in New England
265	Orchestral Set	66	1919	1926	\N	f	262	\N	\N	\N	\N	\N	3	\N
266	Smaller Orchestral Works	66	1906	1914	35	t	\N	\N	\N	\N	\N	\N	\N	\N
267	Central Park in the Dark	66	\N	1906	\N	f	266	\N	\N	\N	\N	\N	\N	\N
268	The Unanswered Question	66	\N	1908	\N	f	266	\N	\N	\N	\N	\N	\N	\N
269	Robert Browning Overture	66	\N	1914	\N	f	266	\N	\N	\N	\N	\N	\N	\N
270	Piano Sonata	66	\N	1909	30	f	\N	\N	\N	\N	\N	\N	1	\N
271	Piano Sonata	66	\N	1915	45	f	\N	\N	\N	\N	\N	\N	2	Concord
258	Symphony	66	1897	1902	40	f	\N	\N	\N	\N	\N	\N	2	\N
257	Symphony	66	1898	1902	40	f	\N	\N	\N	\N	\N	3	1	\N
259	Symphony	66	1901	1904	20	f	\N	\N	\N	\N	\N	\N	3	The Camp Meeting 
261	A Symphony	66	\N	1919	40	f	\N	\N	\N	\N	\N	\N	\N	New England Holidays
272	Piano Works	66	1905	1925	30	t	\N	\N	\N	\N	\N	\N	\N	\N
273	3-Page Sonata	66	\N	1905	\N	f	272	\N	\N	\N	\N	\N	\N	\N
274	Set of 5 Take-Offs	66	\N	1909	\N	f	272	\N	\N	\N	\N	\N	\N	\N
275	3 Quarter-Tone Pieces for 2 Pianos	66	\N	1925	\N	f	272	\N	\N	\N	\N	\N	\N	\N
276	String Quartets	66	1900	1913	50	t	\N	\N	\N	\N	\N	\N	\N	\N
277	String Quartet	66	\N	1900	\N	f	276	\N	\N	\N	\N	\N	1	From the Salvation Army
278	Scherzo	66	\N	1904	\N	f	276	\N	\N	\N	\N	\N	\N	\N
279	String Quartet	66	\N	1913	\N	f	276	\N	\N	\N	\N	\N	2	\N
280	Piano Trio	66	1904	1915	20	f	\N	\N	\N	\N	\N	\N	\N	\N
281	Violin Sonatas	66	1916	1917	80	t	\N	\N	\N	\N	\N	\N	\N	\N
282	Violin Sonata	66	\N	1917	\N	f	281	\N	\N	\N	\N	\N	1	\N
283	Violin Sonata	66	\N	1917	\N	f	281	\N	\N	\N	\N	\N	2	\N
284	Violin Sonata	66	\N	1914	\N	f	281	\N	\N	\N	\N	\N	3	\N
285	Violin Sonata	66	\N	1916	\N	f	281	\N	\N	\N	\N	\N	4	Children's Day at the Camp Meeting
292	Symphonic Poems	82	1907	1910	40	t	\N	\N	\N	\N	\N	\N	\N	\N
294	Étude	82	\N	1887	\N	f	293	6	2	No. 1	\N	\N	\N	\N
295	12 Études	82	\N	1894	\N	f	293	6	8	\N	\N	\N	\N	\N
296	8 Études	82	\N	1903	\N	f	293	6	42	\N	\N	\N	\N	\N
297	3 Études	82	1911	1912	\N	f	293	6	65	\N	\N	\N	\N	\N
293	Etudes	82	1887	1912	60	t	\N	\N	\N	\N	\N	\N	\N	\N
298	Mazurkas	82	1889	1903	80	t	\N	\N	\N	\N	\N	\N	\N	\N
302	10 Mazurkas	82	\N	1889	\N	f	298	6	3	\N	\N	\N	\N	\N
303	9 Mazurkas	82	\N	1899	\N	f	298	6	25	\N	\N	\N	\N	\N
304	2 Mazurkas	82	\N	1903	\N	f	298	6	40	\N	\N	\N	\N	\N
305	Impromptu à la mazur	82	\N	1889	\N	f	298	6	2	No. 3	\N	\N	\N	\N
306	Mazurka	82	\N	1884	\N	f	298	\N	\N	\N	\N	2	\N	\N
307	Mazurka	82	\N	1889	\N	f	298	\N	\N	\N	\N	15	\N	\N
308	Sonatas	82	1892	1913	135	t	\N	\N	\N	\N	\N	\N	\N	\N
319	Sonata	82	\N	1913	\N	f	308	6	70	\N	\N	\N	10	Insect
313	Sonata	82	\N	1903	\N	f	308	6	30	\N	\N	\N	4	\N
314	Sonata	82	\N	1907	\N	f	308	6	53	\N	\N	\N	5	\N
289	Symphony	82	\N	1903	60	f	\N	6	43	\N	\N	7	3	Le divin poème
288	Symphony	82	\N	1902	60	f	\N	6	29	\N	\N	7	2	\N
287	Symphony	82	\N	1900	60	f	\N	6	26	\N	\N	5	1	\N
290	Le Poème de l'extase	82	\N	1907	60	f	292	6	54	\N	\N	\N	\N	\N
291	Prométhée, Le Poème du feu	82	\N	1910	60	f	292	6	60	\N	\N	\N	\N	\N
316	Sonata	82	\N	1912	\N	f	308	6	64	\N	\N	\N	7	Messe blanche
315	Sonata	82	1911	1912	\N	f	308	6	62	\N	\N	\N	6	\N
310	Sonata	82	\N	1892	\N	f	308	6	6	\N	\N	\N	1	\N
311	Sonate-Fantaisie	82	\N	1897	\N	f	308	6	19	\N	\N	\N	2	\N
312	Sonata	82	\N	1898	\N	f	308	6	23	\N	\N	\N	3	États d'âme
318	Sonata	82	\N	1913	\N	f	308	6	68	\N	\N	\N	9	Messe noir
317	Sonata	82	1912	1913	\N	f	308	6	66	\N	\N	\N	8	\N
320	Preludes	82	1888	1914	110	t	\N	\N	\N	\N	\N	\N	\N	\N
338	Allegro Appassionato	82	\N	1887	\N	f	336	6	4	\N	\N	\N	\N	\N
333	4 Préludes	82	\N	1905	\N	f	320	6	49	\N	\N	\N	\N	\N
332	4 Préludes	82	\N	1903	\N	f	320	6	39	\N	\N	\N	\N	\N
335	5 Préludes	82	\N	1914	\N	f	320	6	74	\N	\N	\N	\N	\N
334	2 Préludes	82	\N	1913	\N	f	320	6	67	\N	\N	\N	\N	\N
329	4 Préludes	82	\N	1903	\N	f	320	6	33	\N	\N	\N	\N	\N
328	4 Préludes	82	\N	1903	\N	f	320	6	31	\N	\N	\N	\N	\N
331	4 Préludes	82	\N	1903	\N	f	320	6	37	\N	\N	\N	\N	\N
330	3 Préludes	82	\N	1903	\N	f	320	6	35	\N	\N	\N	\N	\N
325	7 Préludes	82	\N	1896	\N	f	320	6	17	\N	\N	\N	\N	\N
324	5 Préludes	82	\N	1895	\N	f	320	6	16	\N	\N	\N	\N	\N
327	2 Préludes	82	\N	1901	\N	f	320	6	27	\N	\N	\N	\N	\N
326	4 Préludes	82	\N	1897	\N	f	320	6	22	\N	\N	\N	\N	\N
321	24 Préludes	82	1888	1896	\N	f	320	6	11	\N	\N	\N	\N	\N
323	5 Préludes	82	\N	1896	\N	f	320	6	15	\N	\N	\N	\N	\N
322	6 Préludes	82	\N	1895	\N	f	320	6	13	\N	\N	\N	\N	\N
369	2 Danses	82	\N	1914	\N	f	336	6	73	\N	\N	\N	\N	\N
368	Vers la flamme	82	\N	1914	\N	f	336	6	72	\N	\N	\N	\N	\N
365	2 Poèmes	82	\N	1912	\N	f	336	6	63	\N	\N	\N	\N	\N
364	Poème-Nocturne	82	\N	1912	\N	f	336	6	61	\N	\N	\N	\N	\N
367	2 Poèmes	82	\N	1914	\N	f	336	6	71	\N	\N	\N	\N	\N
366	2 Poèmes	82	\N	1913	\N	f	336	6	69	\N	\N	\N	\N	\N
361	2 Morceaux	82	\N	1908	\N	f	336	6	57	\N	\N	\N	\N	\N
360	4 Pièces	82	\N	1908	\N	f	336	6	56	\N	\N	\N	\N	\N
363	2 Pièces	82	\N	1910	\N	f	336	6	59	\N	\N	\N	\N	\N
362	Feuillet d'Album	82	\N	1910	\N	f	336	6	58	\N	\N	\N	\N	\N
357	3 Morceaux	82	\N	1905	\N	f	336	6	49	\N	\N	\N	\N	\N
356	Quasi-valse	82	\N	1905	\N	f	336	6	47	\N	\N	\N	\N	\N
359	3 Morceaux	82	\N	1907	\N	f	336	6	52	\N	\N	\N	\N	\N
358	4 Morceaux	82	\N	1906	\N	f	336	6	51	\N	\N	\N	\N	\N
353	2 Poèmes	82	\N	1904	\N	f	336	6	44	\N	\N	\N	\N	\N
352	Poème	82	\N	1903	\N	f	336	6	41	\N	\N	\N	\N	\N
355	Scherzo	82	\N	1905	\N	f	336	6	46	\N	\N	\N	\N	\N
354	3 Morceaux	82	\N	1904	\N	f	336	6	45	\N	\N	\N	\N	\N
349	Poème tragique	82	\N	1903	\N	f	336	6	34	\N	\N	\N	\N	\N
348	2 Poèmes	82	\N	1903	\N	f	336	6	32	\N	\N	\N	\N	\N
351	Valse	82	\N	1903	\N	f	336	6	38	\N	\N	\N	\N	\N
350	Poème satanique	82	\N	1903	\N	f	336	6	36	\N	\N	\N	\N	\N
345	Allegro de concert	82	\N	1896	\N	f	336	6	18	\N	\N	\N	\N	\N
344	2 Impromptus	82	\N	1895	\N	f	336	6	14	\N	\N	\N	\N	\N
347	Fantasie	82	\N	1900	\N	f	336	6	28	\N	\N	\N	\N	\N
346	Polonaise	82	\N	1897	\N	f	336	6	21	\N	\N	\N	\N	\N
341	2 Pieces for the Left Hand	82	\N	1894	\N	f	336	6	9	\N	\N	\N	\N	\N
340	2 Impromptus à la mazur	82	\N	1892	\N	f	336	6	7	\N	\N	\N	\N	\N
343	2 Impromptus	82	\N	1895	\N	f	336	6	12	\N	\N	\N	\N	\N
342	2 Impromptus	82	\N	1894	\N	f	336	6	10	\N	\N	\N	\N	\N
337	Valse	82	\N	1886	\N	f	336	6	1	\N	\N	\N	\N	\N
339	2 Nocturnes	82	\N	1890	\N	f	336	6	5	\N	\N	\N	\N	\N
336	Pieces	82	1886	1914	140	t	\N	\N	\N	\N	\N	\N	\N	\N
370	Piano Concerto	82	\N	1896	25	f	\N	6	20	\N	\N	6	\N	\N
371	Turangalîla-Symphonie	115	1946	1948	70	f	\N	\N	\N	\N	\N	\N	\N	\N
372	Sept haïkaï	115	\N	1962	25	f	\N	\N	\N	\N	\N	\N	\N	\N
373	Concert à quatre	115	1991	1992	25	f	\N	\N	\N	\N	\N	\N	\N	\N
374	Des Canyons aux étoiles…	115	1971	1974	90	f	\N	\N	\N	\N	\N	\N	\N	\N
376	Oiseaux exotiques	115	1955	1956	15	f	377	\N	\N	\N	\N	\N	\N	\N
375	Réveil des oiseaux	115	\N	1953	20	f	377	\N	\N	\N	\N	\N	\N	\N
378	Un vitrail et des oiseaux	115	\N	1987	10	f	377	\N	\N	\N	\N	\N	\N	\N
377	Works About Birds	115	1953	1987	45	t	\N	\N	\N	\N	\N	\N	\N	\N
380	Le Tombeau resplendissant	115	\N	1931	15	f	\N	\N	\N	\N	\N	\N	\N	\N
381	Méditations symphoniques	115	1930	1933	35	t	\N	\N	\N	\N	\N	\N	\N	\N
382	Les Offrandes oubliées	115	1933	\N	\N	f	381	\N	\N	\N	\N	\N	\N	\N
383	L'Ascension	115	1932	1933	\N	f	381	\N	\N	\N	\N	\N	\N	\N
384	Chronochromie	115	1959	1960	20	f	\N	\N	\N	\N	\N	\N	\N	\N
385	Et exspecto resurrectionem mortuorum	115	\N	1964	35	f	\N	\N	\N	\N	\N	\N	\N	\N
386	Éclairs sur l'au-delà…	115	1987	1991	60	f	\N	\N	\N	\N	\N	\N	\N	\N
387	Trois petites Liturgies de la Présence Divine	115	1943	1944	30	f	\N	\N	\N	\N	\N	\N	\N	\N
388	Poèmes pour Mi	115	\N	1937	30	f	\N	\N	\N	\N	\N	\N	\N	\N
389	La Transfiguration de Notre Seigneur Jésus-Christ	115	1965	1969	100	f	\N	\N	\N	\N	\N	\N	\N	\N
390	Cinq rechants	115	\N	1948	20	f	\N	\N	\N	\N	\N	\N	\N	\N
393	Songs for Voice & Piano	115	1930	1945	90	t	\N	\N	\N	\N	\N	\N	\N	\N
391	Harawi: Chants d'amour et de mort	115	\N	1945	55	f	393	\N	\N	\N	\N	\N	\N	\N
392	Chants de Terre et de Ciel	115	\N	1938	25	f	393	\N	\N	\N	\N	\N	\N	\N
394	Vocalise-Étude	115	\N	1935	\N	f	393	\N	\N	\N	\N	\N	\N	\N
395	Trois Mélodies	115	\N	1930	\N	f	393	\N	\N	\N	\N	\N	\N	\N
396	Catalogue d'oiseaux	115	1956	1958	160	f	\N	\N	\N	\N	\N	\N	\N	\N
397	Vingt Regards sur l'enfant-Jésus	115	\N	1944	120	f	\N	\N	\N	\N	\N	\N	\N	\N
398	La Fauvette des jardins	115	1970	1972	30	f	\N	\N	\N	\N	\N	\N	\N	\N
399	Visions de l'Amen	115	\N	1943	50	f	\N	\N	\N	\N	\N	\N	\N	\N
400	Quatuor pour la fin du temps	115	\N	1940	50	f	\N	\N	\N	\N	\N	\N	\N	\N
402	La Nativité du Seigneur	115	\N	1935	60	f	\N	\N	\N	\N	\N	\N	\N	\N
403	Les Corps glorieux	115	\N	1939	60	f	\N	\N	\N	\N	\N	\N	\N	\N
404	Messe de la Pentecôte	115	\N	1951	30	f	\N	\N	\N	\N	\N	\N	\N	\N
405	Livre d'orgue	115	1951	1952	45	f	\N	\N	\N	\N	\N	\N	\N	\N
406	Méditations sur le Mystère de la Sainte Trinité	115	1967	1969	70	f	\N	\N	\N	\N	\N	\N	\N	\N
407	Le Livre du Saint-Sacrement	115	\N	1984	100	f	\N	\N	\N	\N	\N	\N	\N	\N
408	Le Banquet Céleste	115	\N	1928	\N	f	401	\N	\N	\N	\N	\N	\N	\N
409	Prélude	115	\N	1928	\N	f	401	\N	\N	\N	\N	\N	\N	\N
410	Offrande au Saint-Sacrement	115	\N	1929	\N	f	401	\N	\N	\N	\N	\N	\N	\N
411	Diptyque	115	1929	1930	\N	f	401	\N	\N	\N	\N	\N	\N	\N
412	Apparition de l'église éternelle	115	\N	1932	\N	f	401	\N	\N	\N	\N	\N	\N	\N
413	Verset pour la fête de la Dédicace	115	\N	1960	\N	f	401	\N	\N	\N	\N	\N	\N	\N
414	Monodie	115	\N	1963	\N	f	401	\N	\N	\N	\N	\N	\N	\N
401	Shorter Organ Works	115	1928	1963	50	t	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: works_genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.works_genres (id, work_id, genre_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	2
5	5	2
6	6	2
7	7	2
8	8	2
9	9	2
11	11	2
12	12	2
13	13	2
14	54	4
15	55	4
16	56	4
17	57	4
18	58	4
19	59	4
20	60	4
21	93	5
22	94	5
23	95	5
24	96	5
25	142	5
26	143	7
27	144	3
28	145	3
29	146	3
30	147	3
31	148	3
32	149	3
33	150	3
34	151	3
35	160	6
36	161	6
37	162	6
38	163	6
39	164	6
40	165	6
41	166	6
42	167	6
43	168	6
44	169	6
45	170	6
46	171	6
47	172	6
48	173	6
49	174	6
50	175	6
51	176	6
52	177	6
53	178	6
54	179	5
55	180	5
56	186	8
57	187	8
58	188	8
59	189	8
60	201	4
61	208	9
62	209	9
63	210	9
64	211	9
65	212	9
66	213	9
67	214	9
68	215	9
69	216	10
70	217	10
71	218	3
72	219	2
73	220	2
74	221	2
75	222	2
76	235	3
77	236	3
78	249	11
79	250	11
80	251	11
81	252	11
82	253	11
83	254	11
84	255	11
85	257	11
86	258	11
87	259	11
88	260	11
89	261	11
90	262	4
91	266	4
92	270	2
93	271	2
94	272	2
95	276	5
96	280	5
97	281	5
98	286	3
99	287	11
100	288	11
101	289	11
102	292	11
104	293	2
106	298	2
107	308	2
108	320	2
109	336	2
110	370	10
111	371	10
112	372	10
113	373	10
114	374	10
117	377	10
119	380	4
120	381	4
121	384	4
122	385	4
123	386	4
124	387	12
126	389	12
125	388	13
127	390	12
130	393	13
131	396	2
132	397	2
133	398	2
134	399	2
135	400	5
136	401	7
137	402	7
138	403	7
139	404	7
140	405	7
141	406	7
142	407	7
\.


--
-- Name: catalogues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.catalogues_id_seq', 6, true);


--
-- Name: composers_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.composers_countries_id_seq', 138, true);


--
-- Name: composers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.composers_id_seq', 127, true);


--
-- Name: composers_year_born_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.composers_year_born_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.countries_id_seq', 30, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_id_seq', 13, true);


--
-- Name: instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.instruments_id_seq', 21, true);


--
-- Name: keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.keys_id_seq', 19, true);


--
-- Name: labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.labels_id_seq', 64, true);


--
-- Name: performers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.performers_id_seq', 236, true);


--
-- Name: performers_works_instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.performers_works_instruments_id_seq', 632, true);


--
-- Name: periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.periods_id_seq', 6, true);


--
-- Name: periods_year_end_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.periods_year_end_seq', 1, true);


--
-- Name: recordings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recordings_id_seq', 317, true);


--
-- Name: recordings_streamers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recordings_streamers_id_seq', 363, true);


--
-- Name: streamers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.streamers_id_seq', 3, true);


--
-- Name: works_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.works_genres_id_seq', 142, true);


--
-- Name: works_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.works_id_seq', 414, true);


--
-- Name: catalogues catalogues_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catalogues
    ADD CONSTRAINT catalogues_pk PRIMARY KEY (id);


--
-- Name: composers_countries composers_countries_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.composers_countries
    ADD CONSTRAINT composers_countries_pk PRIMARY KEY (id);


--
-- Name: composers composers_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.composers
    ADD CONSTRAINT composers_pk PRIMARY KEY (id);


--
-- Name: countries countries_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pk PRIMARY KEY (id);


--
-- Name: genres genres_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pk PRIMARY KEY (id);


--
-- Name: instruments instruments_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instruments
    ADD CONSTRAINT instruments_pk PRIMARY KEY (id);


--
-- Name: keys keys_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_pk PRIMARY KEY (id);


--
-- Name: labels labels_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.labels
    ADD CONSTRAINT labels_pk PRIMARY KEY (id);


--
-- Name: performers performers_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_pk PRIMARY KEY (id);


--
-- Name: performers_recordings_instruments performers_works_instruments_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers_recordings_instruments
    ADD CONSTRAINT performers_works_instruments_pk PRIMARY KEY (id);


--
-- Name: periods periods_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pk PRIMARY KEY (id);


--
-- Name: recordings recordings_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recordings
    ADD CONSTRAINT recordings_pk PRIMARY KEY (id);


--
-- Name: recordings_streamers recordings_streamers_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recordings_streamers
    ADD CONSTRAINT recordings_streamers_pk PRIMARY KEY (id);


--
-- Name: streamers streamers_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streamers
    ADD CONSTRAINT streamers_pk PRIMARY KEY (id);


--
-- Name: works_genres works_genres_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works_genres
    ADD CONSTRAINT works_genres_pk PRIMARY KEY (id);


--
-- Name: works works_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_pk PRIMARY KEY (id);


--
-- Name: catalogues_composer_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX catalogues_composer_id_index ON public.catalogues USING btree (composer_id);


--
-- Name: catalogues_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX catalogues_id_uindex ON public.catalogues USING btree (id);


--
-- Name: composers_countries_composer_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX composers_countries_composer_id_index ON public.composers_countries USING btree (composer_id);


--
-- Name: composers_countries_country_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX composers_countries_country_id_index ON public.composers_countries USING btree (country_id);


--
-- Name: composers_countries_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX composers_countries_id_uindex ON public.composers_countries USING btree (id);


--
-- Name: composers_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX composers_id_uindex ON public.composers USING btree (id);


--
-- Name: composers_period_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX composers_period_id_index ON public.composers USING btree (period_id);


--
-- Name: composers_slug_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX composers_slug_uindex ON public.composers USING btree (slug);


--
-- Name: countries_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX countries_id_uindex ON public.countries USING btree (id);


--
-- Name: genres_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX genres_id_uindex ON public.genres USING btree (id);


--
-- Name: instruments_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX instruments_id_uindex ON public.instruments USING btree (id);


--
-- Name: keys_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX keys_id_uindex ON public.keys USING btree (id);


--
-- Name: labels_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX labels_id_uindex ON public.labels USING btree (id);


--
-- Name: performers_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX performers_id_uindex ON public.performers USING btree (id);


--
-- Name: performers_works_instruments_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX performers_works_instruments_id_uindex ON public.performers_recordings_instruments USING btree (id);


--
-- Name: periods_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX periods_id_uindex ON public.periods USING btree (id);


--
-- Name: periods_slug_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX periods_slug_uindex ON public.periods USING btree (slug);


--
-- Name: recordings_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX recordings_id_uindex ON public.recordings USING btree (id);


--
-- Name: recordings_streamers_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX recordings_streamers_id_uindex ON public.recordings_streamers USING btree (id);


--
-- Name: streamers_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX streamers_id_uindex ON public.streamers USING btree (id);


--
-- Name: works_catalogue_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX works_catalogue_id_index ON public.works USING btree (catalogue_id);


--
-- Name: works_composer_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX works_composer_id_index ON public.works USING btree (composer_id);


--
-- Name: works_genres_genre_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX works_genres_genre_id_index ON public.works_genres USING btree (genre_id);


--
-- Name: works_genres_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX works_genres_id_uindex ON public.works_genres USING btree (id);


--
-- Name: works_genres_work_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX works_genres_work_id_index ON public.works_genres USING btree (work_id);


--
-- Name: works_id_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX works_id_uindex ON public.works USING btree (id);


--
-- Name: works_parent_work_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX works_parent_work_id_index ON public.works USING btree (parent_work_id);


--
-- Name: catalogues catalogues_composers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.catalogues
    ADD CONSTRAINT catalogues_composers_id_fk FOREIGN KEY (composer_id) REFERENCES public.composers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: composers_countries composers_countries_composers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.composers_countries
    ADD CONSTRAINT composers_countries_composers_id_fk FOREIGN KEY (composer_id) REFERENCES public.composers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: composers_countries composers_countries_countries_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.composers_countries
    ADD CONSTRAINT composers_countries_countries_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: composers composers_periods_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.composers
    ADD CONSTRAINT composers_periods_id_fk FOREIGN KEY (period_id) REFERENCES public.periods(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: performers_recordings_instruments performers_recordings_instruments_instruments_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers_recordings_instruments
    ADD CONSTRAINT performers_recordings_instruments_instruments_id_fk FOREIGN KEY (instrument_id) REFERENCES public.instruments(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: performers_recordings_instruments performers_recordings_instruments_performers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers_recordings_instruments
    ADD CONSTRAINT performers_recordings_instruments_performers_id_fk FOREIGN KEY (performer_id) REFERENCES public.performers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: performers_recordings_instruments performers_recordings_instruments_recordings_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers_recordings_instruments
    ADD CONSTRAINT performers_recordings_instruments_recordings_id_fk FOREIGN KEY (recording_id) REFERENCES public.recordings(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: recordings recordings_labels_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recordings
    ADD CONSTRAINT recordings_labels_id_fk FOREIGN KEY (label_id) REFERENCES public.labels(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: recordings_streamers recordings_streamers_recordings_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recordings_streamers
    ADD CONSTRAINT recordings_streamers_recordings_id_fk FOREIGN KEY (recording_id) REFERENCES public.recordings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recordings_streamers recordings_streamers_streamers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recordings_streamers
    ADD CONSTRAINT recordings_streamers_streamers_id_fk FOREIGN KEY (streamer_id) REFERENCES public.streamers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recordings recordings_works_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recordings
    ADD CONSTRAINT recordings_works_id_fk FOREIGN KEY (work_id) REFERENCES public.works(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: works works_catalogues_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_catalogues_id_fk FOREIGN KEY (catalogue_id) REFERENCES public.catalogues(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: works works_composers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_composers_id_fk FOREIGN KEY (composer_id) REFERENCES public.composers(id);


--
-- Name: works_genres works_genres_genres_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works_genres
    ADD CONSTRAINT works_genres_genres_id_fk FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: works_genres works_genres_works_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works_genres
    ADD CONSTRAINT works_genres_works_id_fk FOREIGN KEY (work_id) REFERENCES public.works(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: works works_instruments_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_instruments_id_fk FOREIGN KEY (instrument_id) REFERENCES public.instruments(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: works works_keys_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_keys_id_fk FOREIGN KEY (key_id) REFERENCES public.keys(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

