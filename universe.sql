--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth_ly numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    planet_id integer NOT NULL,
    distance_from_earth_ly numeric,
    age_in_millions_of_years integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth_ly integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    is_red_dwarf boolean,
    age_in_millions_of_years integer,
    distance_from_earth_ly integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 'is a short-period comet visible from Earth every 75–79 years.');
INSERT INTO public.comet VALUES (2, 'Comet Caesar', 'It was one of the most famous comets of ancient times.');
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 'is the biggest and brightest comet that has come by Earth in the last century.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way, where the Solar System resides.', false, 10000, 2500000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our galaxy', true, 13000, 28000);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel Galaxy', 'The Pinwheel Galaxy is a face-on spiral galaxy 21 million light-years away from Earth in the constellation Ursa Major', false, NULL, 21000000);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Overdensity', 'is a disputed dwarf irregular galaxy in the Local Group, located in the same part of the sky as the constellation Canis Major.', false, 10000, 25000);
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 'is a dwarf spheroidal galaxy or globular cluster situated in the Leo constellation and discovered in 2006 by Sloan Digital Sky Survey.', false, 11000, 75000);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Spheroidal Galaxy', 'is an elliptical loop-shaped satellite galaxy of the Milky Way.', false, 12000, 70000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0, 4530);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0, 1200);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0, 4250);
INSERT INTO public.moon VALUES (4, 'Io', 5, 0, 4500);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0, 180);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 0, 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 0, 4500);
INSERT INTO public.moon VALUES (8, 'Metis', 5, 0, NULL);
INSERT INTO public.moon VALUES (9, 'Themisto', 5, 0, NULL);
INSERT INTO public.moon VALUES (10, 'Adrastea', 5, 0, NULL);
INSERT INTO public.moon VALUES (11, 'Amalthea', 5, 0, NULL);
INSERT INTO public.moon VALUES (12, 'Thebe', 5, 0, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', 9, 0, 4000);
INSERT INTO public.moon VALUES (14, 'Dione', 9, 0, 4500);
INSERT INTO public.moon VALUES (15, 'Enceladus', 9, 0, 3700);
INSERT INTO public.moon VALUES (16, 'Epimetheus', 9, 0, 4500);
INSERT INTO public.moon VALUES (17, 'Prometheus', 9, 0, NULL);
INSERT INTO public.moon VALUES (18, 'Mimas', 9, 0, NULL);
INSERT INTO public.moon VALUES (19, 'Rhea', 9, 0, NULL);
INSERT INTO public.moon VALUES (20, 'Janus', 9, 0, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Is the first planet from the Sun.', false, 4600, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Earth is rounded into an ellipsoid with a circumference of about 40,000 km. It is the densest planet in the Solar System.', true, 4500, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'the planet second in order of distance from the Sun, after Mercury and before Earth.', false, 300, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars is the fourth planet from the Sun in the Solar System and the second-smallest planet.', false, 4500, 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System.', false, 4500, 0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.', false, 4600, 0, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Uranus is the seventh planet from the Sun and is a gaseous cyan ice giant.', false, 4500, 0, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Neptune is the farthest planet from the Sun.', false, 4500, 0, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 'is a dwarf planet in the asteroid belt between the orbits of Mars and Jupiter.', false, 4560, 0, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 'is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune.', false, 46000, 0, 1);
INSERT INTO public.planet VALUES (12, 'Gamma Cephei Ab', 'formally named Tadmor /ˈtædmɔːr/, is an exoplanet approximately 45 light-years away in the constellation of Cepheus.', false, 3250, 45, 8);
INSERT INTO public.planet VALUES (13, '51 Pegasi b', 'officially named Dimidium, and also known as Bellerophon is an extrasolar planet approximately 50 light-years (15 parsecs) away in the constellation of Pegasus.', false, 6100, 50, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Is the star at the center of the Solar System.', false, 4600, 0, 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Is a small, low-mass star located 4.2465 light-years (1.3020 pc) away from the Sun in the southern constellation of Centaurus', true, 4850, 4243, 2);
INSERT INTO public.star VALUES (3, 'Barnards Star', 'is a small red dwarf star in the constellation of Ophiuchus.', true, 7000, 3, 2);
INSERT INTO public.star VALUES (4, 'Luhman 16', 'Luhman 16 (WISE 1049−5319, WISE J104915.57−531906.1) is a binary brown-dwarf system in the southern constellation Vela at a distance of approximately 6.5 light-years (2.0 parsecs) from the Sun.', false, 600, 7, 2);
INSERT INTO public.star VALUES (6, 'Antares', 's the brightest star in the constellation of Scorpius.', false, 11000, 550, 2);
INSERT INTO public.star VALUES (7, 'Sirius', 'is the brightest star in the night sky.', false, 9, 230, 2);
INSERT INTO public.star VALUES (8, 'Gamma Cephei', 'is a binary star system approximately 45 light-years away in the constellation of Cepheus.', true, 3250, 45, 2);
INSERT INTO public.star VALUES (9, '51 Pegasi', 'formally named Helvetios /hɛlˈviːʃiəs/,[12] is a Sun-like star located 50.6 light-years (15.5 parsecs) from Earth in the constellation of Pegasus.', false, 8500, 50, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

