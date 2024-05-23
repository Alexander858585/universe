--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(80) NOT NULL,
    distance_mly numeric(4,3),
    type character varying(20) NOT NULL,
    has_exoplanet_info boolean,
    galaxy_groups_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_groups; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_groups (
    galaxy_groups_id integer NOT NULL,
    name character varying(80) NOT NULL,
    number_of_galaxies integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy_groups OWNER TO freecodecamp;

--
-- Name: galaxy_groups_galaxy_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_groups_galaxy_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_groups_galaxy_group_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_groups_galaxy_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_groups_galaxy_group_id_seq OWNED BY public.galaxy_groups.galaxy_groups_id;


--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(80) NOT NULL,
    distance_km bigint NOT NULL,
    explored_by_humans boolean,
    exploration_vehicle text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(90) NOT NULL,
    moon_count integer,
    age_bly numeric(3,2) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(100) NOT NULL,
    exoplanet_count integer NOT NULL,
    age_bly numeric(3,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_groups galaxy_groups_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_groups ALTER COLUMN galaxy_groups_id SET DEFAULT nextval('public.galaxy_groups_galaxy_group_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy (M31)', 2.537, 'Spiral', false, 1);
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy (M33)', 2.730, 'Spiral', false, 1);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud (LMC)', 0.163, 'Irregular', false, 1);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud (SMC)', 0.200, 'Irregular', false, 1);
INSERT INTO public.galaxy VALUES (5, 'Milky Way Galaxy', 0.000, 'Spiral', true, 1);
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf Galaxy', 0.025, 'Irregular', false, 1);
INSERT INTO public.galaxy VALUES (7, 'Sagittarius Dwarf Spheroidal Galaxy', 0.081, 'Elliptical', false, 1);
INSERT INTO public.galaxy VALUES (8, 'Ursa Minor Dwarf Galaxy', 0.225, 'Elliptical', false, 1);
INSERT INTO public.galaxy VALUES (9, 'Draco Dwarf Galaxy', 0.240, 'Elliptical', false, 1);
INSERT INTO public.galaxy VALUES (10, 'Sculptor Dwarf Galaxy', 0.285, 'Elliptical', false, 1);


--
-- Data for Name: galaxy_groups; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_groups VALUES (1, 'Local Group', 54, 'A group of more than 54 galaxies including the Milky Way, Andromeda, and Triangulum galaxies.');
INSERT INTO public.galaxy_groups VALUES (2, 'M81 Group', 34, 'Contains the large spiral galaxy M81 (Bode''s Galaxy) and several other galaxies such as M82.');
INSERT INTO public.galaxy_groups VALUES (3, 'M101 Group', 15, 'This group contains the Pinwheel Galaxy (M101) and several companion galaxies.');
INSERT INTO public.galaxy_groups VALUES (4, 'Sculptor Group', 13, 'One of the nearest groups to the Local Group, containing the Sculptor Galaxy (NGC 253) and other galaxies.');
INSERT INTO public.galaxy_groups VALUES (5, 'Centaurus Group', 31, 'Includes the Centaurus A (NGC 5128), a prominent radio galaxy, and several other members.');
INSERT INTO public.galaxy_groups VALUES (6, 'NGC 1023 Group', 11, 'A group that includes the lenticular galaxy NGC 1023 and its companions.');
INSERT INTO public.galaxy_groups VALUES (7, 'IC 342/Maffei Group', 17, 'Contains the galaxies IC 342 and Maffei 1, among others.');
INSERT INTO public.galaxy_groups VALUES (8, 'NGC 6744 Group', 8, 'This group includes the large barred spiral galaxy NGC 6744.');
INSERT INTO public.galaxy_groups VALUES (9, 'NGC 2997 Group', 14, 'Contains the spiral galaxy NGC 2997 and its surrounding members.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 13, 'Moon', 384400, true, 'Apollo missions');
INSERT INTO public.moon VALUES (2, 14, 'Phobos', 9376, true, 'Mariner 9 Viking 1 & 2 and Phobos 1 & 2');
INSERT INTO public.moon VALUES (3, 14, 'Deimos', 23460, true, 'Mariner 9 Viking 1 & 2');
INSERT INTO public.moon VALUES (4, 15, 'Io', 628700000, true, 'Galileo spacecraft Voyager 1 & 2');
INSERT INTO public.moon VALUES (5, 15, 'Europa', 670900000, true, 'Galileo spacecraft Voyager 1 & 2');
INSERT INTO public.moon VALUES (6, 15, 'Ganymede', 665100000, true, 'Galileo spacecraft Voyager 1 & 2');
INSERT INTO public.moon VALUES (7, 15, 'Callisto', 667000000, true, 'Galileo spacecraft Voyager 1 & 2');
INSERT INTO public.moon VALUES (8, 15, 'Metis', 1280000000, false, 'not explored');
INSERT INTO public.moon VALUES (9, 15, 'Adrastea', 1290000000, false, 'not explored');
INSERT INTO public.moon VALUES (10, 15, 'Amalthea', 1810000000, false, 'not explored');
INSERT INTO public.moon VALUES (11, 15, 'Thebe', 2220000000, false, 'not explored');
INSERT INTO public.moon VALUES (12, 15, 'Himalia', 11460000000, false, 'not explored');
INSERT INTO public.moon VALUES (13, 15, 'Lysithea', 11720000000, false, 'not explored');
INSERT INTO public.moon VALUES (14, 15, 'Elara', 11730000000, false, 'not explored');
INSERT INTO public.moon VALUES (15, 15, 'Ananke', 21410000000, false, 'not explored');
INSERT INTO public.moon VALUES (16, 15, 'Leda', 21100000000, false, 'not explored');
INSERT INTO public.moon VALUES (17, 15, 'Carme', 23180000000, false, 'not explored');
INSERT INTO public.moon VALUES (18, 15, 'Pasiphae', 23560000000, false, 'not explored');
INSERT INTO public.moon VALUES (19, 15, 'Sinope', 23720000000, false, 'not explored');
INSERT INTO public.moon VALUES (20, 16, 'Titan', 1222000000, true, 'Cassini-Huygens mission');
INSERT INTO public.moon VALUES (21, 16, 'Enceladus', 1222000000, true, 'Cassini spacecraft');
INSERT INTO public.moon VALUES (22, 16, 'Tethys', 1222000000, false, 'not explored');
INSERT INTO public.moon VALUES (23, 16, 'Rhea', 1222000000, false, 'not explored');
INSERT INTO public.moon VALUES (24, 16, 'Iapetus', 1222000000, false, 'not explored');
INSERT INTO public.moon VALUES (25, 17, 'Miranda', 2661000000, false, 'not explored');
INSERT INTO public.moon VALUES (26, 17, 'Ariel', 2658000000, false, 'not explored');
INSERT INTO public.moon VALUES (27, 17, 'Umbriel', 2658000000, false, 'not explored');
INSERT INTO public.moon VALUES (28, 17, 'Titania', 2658000000, false, 'not explored');
INSERT INTO public.moon VALUES (29, 17, 'Oberon', 2658000000, false, 'not explored');
INSERT INTO public.moon VALUES (30, 18, 'Triton', 4351000000, true, 'Voyager 2 spacecraft');
INSERT INTO public.moon VALUES (31, 18, 'Nereid', 4351000000, false, 'not explored');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 21, 'Proxima Centauri b', 0, 4.85, 'Terrestrial exoplanet');
INSERT INTO public.planet VALUES (2, 21, 'Proxima Centauri c', 0, 4.85, 'Super-Earth exoplanet (candidate)');
INSERT INTO public.planet VALUES (3, 21, 'Proxima Centauri d', 0, 4.85, 'Super-Earth exoplanet (candidate)');
INSERT INTO public.planet VALUES (4, 22, '51 Pegasi b', 0, 6.10, 'Gas giant exoplanet');
INSERT INTO public.planet VALUES (5, 23, 'Gliese 581 b', 0, 7.00, 'Super-Earth exoplanet');
INSERT INTO public.planet VALUES (6, 23, 'Gliese 581 c', 0, 7.00, 'Super-Earth exoplanet');
INSERT INTO public.planet VALUES (7, 23, 'Gliese 581 d', 0, 7.00, 'Super-Earth exoplanet');
INSERT INTO public.planet VALUES (8, 23, 'Gliese 581 e', 0, 7.00, 'Super-Earth exoplanet');
INSERT INTO public.planet VALUES (9, 24, 'Kepler-22b', 0, 6.00, 'Super-Earth exoplanet');
INSERT INTO public.planet VALUES (10, 25, 'HD 209458 b', 0, 4.50, 'Gas giant exoplanet');
INSERT INTO public.planet VALUES (11, 26, 'Mercury', 0, 4.60, 'Terrestrial planet');
INSERT INTO public.planet VALUES (12, 26, 'Venus', 0, 4.60, 'Terrestrial planet');
INSERT INTO public.planet VALUES (13, 26, 'Earth', 1, 4.60, 'Terrestrial planet');
INSERT INTO public.planet VALUES (14, 26, 'Mars', 2, 4.60, 'Terrestrial planet');
INSERT INTO public.planet VALUES (15, 26, 'Jupiter', 79, 4.60, 'Gas giant planet');
INSERT INTO public.planet VALUES (16, 26, 'Saturn', 83, 4.60, 'Gas giant planet');
INSERT INTO public.planet VALUES (17, 26, 'Uranus', 27, 4.60, 'Ice giant planet');
INSERT INTO public.planet VALUES (18, 26, 'Neptune', 14, 4.60, 'Ice giant planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'NGC 206', 0, NULL);
INSERT INTO public.star VALUES (2, 1, 'G76', 0, NULL);
INSERT INTO public.star VALUES (3, 1, 'G1', 0, NULL);
INSERT INTO public.star VALUES (4, 1, 'V1408 Andromedae', 0, NULL);
INSERT INTO public.star VALUES (5, 1, 'M32', 0, NULL);
INSERT INTO public.star VALUES (6, 2, 'NGC 604', 0, NULL);
INSERT INTO public.star VALUES (7, 2, 'M33 X-7', 0, NULL);
INSERT INTO public.star VALUES (8, 2, 'VHK 045', 0, NULL);
INSERT INTO public.star VALUES (9, 2, 'M33 OB1', 0, NULL);
INSERT INTO public.star VALUES (10, 2, 'GTC 2015', 0, NULL);
INSERT INTO public.star VALUES (11, 3, 'R136a1', 0, NULL);
INSERT INTO public.star VALUES (12, 3, 'SN 1987A', 0, NULL);
INSERT INTO public.star VALUES (13, 3, 'N30B', 0, NULL);
INSERT INTO public.star VALUES (14, 3, '30 Doradus', 0, NULL);
INSERT INTO public.star VALUES (15, 3, 'HD 269810', 0, NULL);
INSERT INTO public.star VALUES (16, 4, 'NGC 346', 0, NULL);
INSERT INTO public.star VALUES (17, 4, 'SMC X-1', 0, NULL);
INSERT INTO public.star VALUES (18, 4, 'AZV 285', 0, NULL);
INSERT INTO public.star VALUES (19, 4, 'NGC 330', 0, NULL);
INSERT INTO public.star VALUES (20, 4, 'HD 5980', 0, NULL);
INSERT INTO public.star VALUES (21, 5, 'Proxima Centauri', 1, 4.85);
INSERT INTO public.star VALUES (22, 5, '51 Pegasi', 1, 6.10);
INSERT INTO public.star VALUES (23, 5, 'Gliese 581', 4, 7.00);
INSERT INTO public.star VALUES (24, 5, 'Kepler-22', 1, 6.00);
INSERT INTO public.star VALUES (25, 5, 'HD 209458', 1, 4.50);
INSERT INTO public.star VALUES (26, 5, 'Sun', 8, 4.60);


--
-- Name: galaxy_groups_galaxy_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_groups_galaxy_group_id_seq', 9, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 10, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 31, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 18, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 26, true);


--
-- Name: galaxy_groups galaxy_groups_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_groups
    ADD CONSTRAINT galaxy_groups_name_key UNIQUE (name);


--
-- Name: galaxy_groups galaxy_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_groups
    ADD CONSTRAINT galaxy_groups_pkey PRIMARY KEY (galaxy_groups_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star rel_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT rel_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy rel_galaxy_groups; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT rel_galaxy_groups FOREIGN KEY (galaxy_groups_id) REFERENCES public.galaxy_groups(galaxy_groups_id);


--
-- Name: moon rel_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT rel_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet rel_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT rel_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

