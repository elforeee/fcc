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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (77, 2014, 'Eighth-Final', 644, 645, 1, 0);
INSERT INTO public.games VALUES (78, 2014, 'Eighth-Final', 646, 647, 2, 1);
INSERT INTO public.games VALUES (79, 2014, 'Eighth-Final', 648, 649, 2, 1);
INSERT INTO public.games VALUES (80, 2014, 'Eighth-Final', 650, 651, 2, 0);
INSERT INTO public.games VALUES (81, 2014, 'Eighth-Final', 652, 653, 2, 1);
INSERT INTO public.games VALUES (82, 2014, 'Eighth-Final', 654, 655, 2, 0);
INSERT INTO public.games VALUES (83, 2014, 'Eighth-Final', 656, 657, 2, 1);
INSERT INTO public.games VALUES (84, 2014, 'Eighth-Final', 658, 659, 2, 1);
INSERT INTO public.games VALUES (85, 2018, 'Eighth-Final', 646, 660, 3, 2);
INSERT INTO public.games VALUES (86, 2018, 'Eighth-Final', 648, 659, 2, 0);
INSERT INTO public.games VALUES (87, 2018, 'Eighth-Final', 661, 662, 2, 1);
INSERT INTO public.games VALUES (88, 2018, 'Eighth-Final', 663, 650, 2, 1);
INSERT INTO public.games VALUES (89, 2018, 'Eighth-Final', 654, 644, 4, 3);
INSERT INTO public.games VALUES (90, 2018, 'Eighth-Final', 664, 665, 2, 1);
INSERT INTO public.games VALUES (91, 2018, 'Eighth-Final', 666, 645, 1, 0);
INSERT INTO public.games VALUES (92, 2018, 'Eighth-Final', 651, 667, 2, 1);
INSERT INTO public.games VALUES (93, 2014, 'Final', 656, 644, 1, 0);
INSERT INTO public.games VALUES (94, 2018, 'Final', 654, 661, 4, 2);
INSERT INTO public.games VALUES (95, 2014, 'Quarter-Final', 644, 646, 1, 0);
INSERT INTO public.games VALUES (96, 2014, 'Quarter-Final', 648, 650, 2, 1);
INSERT INTO public.games VALUES (97, 2014, 'Quarter-Final', 656, 654, 1, 0);
INSERT INTO public.games VALUES (98, 2014, 'Quarter-Final', 658, 652, 1, 0);
INSERT INTO public.games VALUES (99, 2018, 'Quarter-Final', 646, 648, 2, 1);
INSERT INTO public.games VALUES (100, 2018, 'Quarter-Final', 661, 664, 3, 2);
INSERT INTO public.games VALUES (101, 2018, 'Quarter-Final', 663, 666, 2, 0);
INSERT INTO public.games VALUES (102, 2018, 'Quarter-Final', 654, 651, 2, 0);
INSERT INTO public.games VALUES (103, 2014, 'Semi-Final', 644, 658, 1, 0);
INSERT INTO public.games VALUES (104, 2014, 'Semi-Final', 656, 648, 7, 1);
INSERT INTO public.games VALUES (105, 2018, 'Semi-Final', 661, 663, 2, 1);
INSERT INTO public.games VALUES (106, 2018, 'Semi-Final', 654, 646, 1, 0);
INSERT INTO public.games VALUES (107, 2014, 'Third Place', 658, 648, 3, 0);
INSERT INTO public.games VALUES (108, 2018, 'Third Place', 646, 663, 2, 0);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (644, 'Argentina');
INSERT INTO public.teams VALUES (645, 'Switzerland');
INSERT INTO public.teams VALUES (646, 'Belgium');
INSERT INTO public.teams VALUES (647, 'United States');
INSERT INTO public.teams VALUES (648, 'Brazil');
INSERT INTO public.teams VALUES (649, 'Chile');
INSERT INTO public.teams VALUES (650, 'Colombia');
INSERT INTO public.teams VALUES (651, 'Uruguay');
INSERT INTO public.teams VALUES (652, 'Costa Rica');
INSERT INTO public.teams VALUES (653, 'Greece');
INSERT INTO public.teams VALUES (654, 'France');
INSERT INTO public.teams VALUES (655, 'Nigeria');
INSERT INTO public.teams VALUES (656, 'Germany');
INSERT INTO public.teams VALUES (657, 'Algeria');
INSERT INTO public.teams VALUES (658, 'Netherlands');
INSERT INTO public.teams VALUES (659, 'Mexico');
INSERT INTO public.teams VALUES (660, 'Japan');
INSERT INTO public.teams VALUES (661, 'Croatia');
INSERT INTO public.teams VALUES (662, 'Denmark');
INSERT INTO public.teams VALUES (663, 'England');
INSERT INTO public.teams VALUES (664, 'Russia');
INSERT INTO public.teams VALUES (665, 'Spain');
INSERT INTO public.teams VALUES (666, 'Sweden');
INSERT INTO public.teams VALUES (667, 'Portugal');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 108, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 667, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

