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
-- Name: archive; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.archive (
    archive_id integer NOT NULL,
    name character varying(255) NOT NULL,
    original_row_id integer,
    data jsonb,
    archived_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.archive OWNER TO freecodecamp;

--
-- Name: archive_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.archive_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archive_archive_id_seq OWNER TO freecodecamp;

--
-- Name: archive_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.archive_archive_id_seq OWNED BY public.archive.archive_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    description text NOT NULL,
    age_in_millions_of_years integer,
    galaxy_types character varying(255)
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
    planet_id integer,
    description text NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean
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
    name character varying,
    star_id integer,
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_moon numeric(10,2),
    is_spherical boolean
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
    name character varying,
    galaxy_id integer,
    description text NOT NULL,
    age_in_millions_of_years integer
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
-- Name: archive archive_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.archive ALTER COLUMN archive_id SET DEFAULT nextval('public.archive_archive_id_seq'::regclass);


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
-- Data for Name: archive; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.archive VALUES (1, 'table1', 1, '{"samplerow": "sample"}', '2024-07-21 14:45:00');
INSERT INTO public.archive VALUES (2, 'table2', 2, '{"samplerow": "sample"}', '2024-07-21 14:45:01');
INSERT INTO public.archive VALUES (3, 'table3', 3, '{"samplerow": "sample"}', '2024-07-21 14:45:02');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System, a large spiral galaxy with a central bulge and spiral arms', 13600, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The nearest spiral galaxy to the Milky Way, known for its large size and proximity, on a collision course with our galaxy', 10000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'A member of the Local Group of galaxies, the third-largest galaxy in the Local Group, with a prominent spiral structure', 3000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87 (M87)', 'A giant elliptical galaxy in the Virgo Cluster, known for its supermassive black hole at its center, which was famously imaged by the Event Horizon Telescope.', 13000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud (LMC)', 'A irregular galaxy and a satellite galaxy of the Milky Way, known for its irregular shape and significant star-forming regions.', 2000, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy (M51)', 'A classic spiral galaxy interacting with a smaller galaxy, noted for its well-defined spiral structure and prominent arms.', 3000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Sirius B-1a', 1, 'A rocky moon with craters and surface canyons.', 120, true);
INSERT INTO public.moon VALUES (2, 'Sirius B-1b', 1, 'A small icy moon with a frozen surface', 120, true);
INSERT INTO public.moon VALUES (3, 'Sirius B-2a', 2, 'A moon with a thick atmosphere and active volcanoes', 120, true);
INSERT INTO public.moon VALUES (4, 'Sirius B-2b', 2, 'A large moon with a dense, cloudy atmosphere.', 120, true);
INSERT INTO public.moon VALUES (5, 'Betelgeuse I-a', 3, 'A volcanic moon with frequent eruptions and lava flows.', 8000, false);
INSERT INTO public.moon VALUES (6, 'Betelgeuse I-b', 3, 'A small moon with sulfur deposits and a yellowish hue.', 8000, true);
INSERT INTO public.moon VALUES (7, 'Betelgeuse II-a', 4, 'An icy moon with a reflective surface and minimal atmosphere', 8000, true);
INSERT INTO public.moon VALUES (8, 'Betelgeuse II-b', 4, 'A rocky moon with large impact craters and rugged terrain.', 8000, false);
INSERT INTO public.moon VALUES (9, 'Vega I-a', 5, 'A moon with liquid water and lush vegetation.', 455, true);
INSERT INTO public.moon VALUES (10, 'Vega I-b', 5, 'A smaller moon with rocky terrain and occasional dust storms.', 455, true);
INSERT INTO public.moon VALUES (11, 'Vega II-a', 6, 'A moon with a mountainous surface and sparse atmosphere.', 455, true);
INSERT INTO public.moon VALUES (12, 'Vega II-b', 6, 'A moon with a thin atmosphere and cold temperatures', 455, true);
INSERT INTO public.moon VALUES (13, 'M87 Star-1a', 7, 'A moon with high radiation and a rocky surface.', 13000, true);
INSERT INTO public.moon VALUES (14, 'M87 Star-1b', 7, 'A moon with a dark surface and a minimal atmosphere.', 13000, true);
INSERT INTO public.moon VALUES (15, 'M87 Star-2a', 8, 'A moon with thick clouds and storm systems.', 13000, true);
INSERT INTO public.moon VALUES (16, 'M87 Star-2b', 8, 'A moon with a rocky surface and high winds.', 13000, false);
INSERT INTO public.moon VALUES (17, 'NGC 604-1a', 9, 'A moon with tropical climates and diverse ecosystems.', 2000, true);
INSERT INTO public.moon VALUES (18, 'NGC 604-1b', 9, 'A moon with lush forests and large bodies of water.', 2000, true);
INSERT INTO public.moon VALUES (19, 'NGC 604-2a', 10, 'A moon covered by a global ocean with a few small islands.', 2000, true);
INSERT INTO public.moon VALUES (20, 'NGC 604-2b', 10, 'A moon with shallow seas and extensive ice sheets', 2000, true);
INSERT INTO public.moon VALUES (21, 'Whirlpool-1a', 11, 'A moon with a rugged surface and frequent seismic activity.', 3000, false);
INSERT INTO public.moon VALUES (22, 'Whirlpool-1b', 11, 'A moon with vast plains and occasional volcanic eruptions.', 3000, true);
INSERT INTO public.moon VALUES (23, 'Whirlpool-2a', 12, 'A moon with an extensive ring system and strong magnetic field', 3000, true);
INSERT INTO public.moon VALUES (24, 'Whirlpool-2b', 12, 'A moon with thick clouds and a gaseous atmosphere', 3000, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Sirius B-1', 1, 'A rocky exoplanet orbiting Sirius B, with a surface of rocky terrain and vast plains', 120, 3800000.00, true);
INSERT INTO public.planet VALUES (2, 'Sirius B-2', 1, 'A gas giant with a thick atmosphere and ring system.', 120, 4500000.00, true);
INSERT INTO public.planet VALUES (3, 'Betelgeuse I', 2, 'A supergiant planet with extreme volcanic activity.', 8000, 2500000.00, false);
INSERT INTO public.planet VALUES (4, 'Betelgeuse II', 2, 'A frozen ice giant with a dense, icy crust.', 8000, 3200000.00, true);
INSERT INTO public.planet VALUES (5, 'Vega I', 3, 'A terrestrial planet with liquid water and potential for life.', 455, 3000000.00, true);
INSERT INTO public.planet VALUES (6, 'Vega II', 3, 'A rocky, mountainous planet with a thin atmosphere.', 455, 3500000.00, true);
INSERT INTO public.planet VALUES (7, 'M87 Star-1', 4, 'A rocky planet with a high radiation environment.', 13000, 4000000.00, true);
INSERT INTO public.planet VALUES (8, 'M87 Star-2', 4, 'A gas giant with powerful storms and thick clouds.', 13000, 4200000.00, true);
INSERT INTO public.planet VALUES (9, 'NGC 604-1', 5, 'A habitable zone planet with lush vegetation and diverse exosystems.', 2000, 3800000.00, true);
INSERT INTO public.planet VALUES (10, 'NGC 604-2', 5, 'An oceanic planet with extensive water bodies and minimal landmass.', 2000, 3600000.00, true);
INSERT INTO public.planet VALUES (11, 'Whirlpool-1', 6, 'A rocky exoplanet with significant tectonic activity and surface feaetures.', 3000, 3900000.00, true);
INSERT INTO public.planet VALUES (12, 'Whirlpool-2', 6, 'A large, geseous planet with an extensive ring system and strong winds.', 3000, 4100000.00, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'The brightest star in the night sky, part of the binary star system Sirius And Sirius B.', 120);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'A red supergiant star known for its size and brightness, located in the the Orion constellation.', 8000);
INSERT INTO public.star VALUES (3, 'Vega', 1, 'A blue white star and one of the most luminous in the Solar neighborhood.', 455);
INSERT INTO public.star VALUES (4, 'Messier 87 Star', 4, 'A star in the giant elliptical galaxy M87, which is notable for it s supermassive black hole.', 13000);
INSERT INTO public.star VALUES (5, 'NGC 604 Star', 5, 'A star in the NGC 604 region of the Large Magellanic Cloud, part of a large star-forming region.', 2000);
INSERT INTO public.star VALUES (6, 'Whirlpool Galaxy (M51)', 6, 'A prominent star within the Whirlpool Galaxy(M51), known for its stunning spiral structure and interaction with a smaller galaxy.', 3000);


--
-- Name: archive_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.archive_archive_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: archive archive_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.archive
    ADD CONSTRAINT archive_pkey PRIMARY KEY (archive_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: archive unique_archive_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.archive
    ADD CONSTRAINT unique_archive_id UNIQUE (archive_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

