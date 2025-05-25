--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: todolist
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO todolist;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: todolist
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO todolist;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: todolist
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: todo; Type: TABLE; Schema: public; Owner: todolist
--

CREATE TABLE public.todo (
    id integer NOT NULL,
    todo character varying DEFAULT ''::character varying NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedAt" timestamp without time zone
);


ALTER TABLE public.todo OWNER TO todolist;

--
-- Name: COLUMN todo.id; Type: COMMENT; Schema: public; Owner: todolist
--

COMMENT ON COLUMN public.todo.id IS 'ID';


--
-- Name: COLUMN todo.todo; Type: COMMENT; Schema: public; Owner: todolist
--

COMMENT ON COLUMN public.todo.todo IS 'todo';


--
-- Name: COLUMN todo."createdAt"; Type: COMMENT; Schema: public; Owner: todolist
--

COMMENT ON COLUMN public.todo."createdAt" IS '作成日時';


--
-- Name: COLUMN todo."updatedAt"; Type: COMMENT; Schema: public; Owner: todolist
--

COMMENT ON COLUMN public.todo."updatedAt" IS '更新日時';


--
-- Name: COLUMN todo."deletedAt"; Type: COMMENT; Schema: public; Owner: todolist
--

COMMENT ON COLUMN public.todo."deletedAt" IS '削除日時';


--
-- Name: todo_id_seq; Type: SEQUENCE; Schema: public; Owner: todolist
--

CREATE SEQUENCE public.todo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.todo_id_seq OWNER TO todolist;

--
-- Name: todo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: todolist
--

ALTER SEQUENCE public.todo_id_seq OWNED BY public.todo.id;


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: todolist
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: todo id; Type: DEFAULT; Schema: public; Owner: todolist
--

ALTER TABLE ONLY public.todo ALTER COLUMN id SET DEFAULT nextval('public.todo_id_seq'::regclass);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: todolist
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1747733390701	Todo1747733390701
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: todolist
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);


--
-- Name: todo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: todolist
--

SELECT pg_catalog.setval('public.todo_id_seq', 0, true);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: todolist
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: todo PK_d429b7114371f6a35c5cb4776a7; Type: CONSTRAINT; Schema: public; Owner: todolist
--

ALTER TABLE ONLY public.todo
    ADD CONSTRAINT "PK_d429b7114371f6a35c5cb4776a7" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

