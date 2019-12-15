--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-3.pgdg18.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-3.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: contacts_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_company (
    user_id integer NOT NULL,
    company_name character varying(40) NOT NULL,
    designation character varying(30)
);


ALTER TABLE public.contacts_company OWNER TO postgres;

--
-- Name: contacts_dateinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_dateinfo (
    id integer NOT NULL,
    date date NOT NULL,
    occasion character varying(15) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.contacts_dateinfo OWNER TO postgres;

--
-- Name: contacts_dateinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_dateinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_dateinfo_id_seq OWNER TO postgres;

--
-- Name: contacts_dateinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_dateinfo_id_seq OWNED BY public.contacts_dateinfo.id;


--
-- Name: contacts_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_description (
    description text,
    user_id integer NOT NULL,
    picture character varying(100) NOT NULL
);


ALTER TABLE public.contacts_description OWNER TO postgres;

--
-- Name: contacts_mobileinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_mobileinfo (
    id integer NOT NULL,
    phone_type character varying(10) NOT NULL,
    email character varying(50),
    email_type character varying(10) NOT NULL,
    address text,
    address_type character varying(10) NOT NULL,
    user_id integer NOT NULL,
    contact character varying(10) NOT NULL
);


ALTER TABLE public.contacts_mobileinfo OWNER TO postgres;

--
-- Name: contacts_mobileinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_mobileinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_mobileinfo_id_seq OWNER TO postgres;

--
-- Name: contacts_mobileinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_mobileinfo_id_seq OWNED BY public.contacts_mobileinfo.id;


--
-- Name: contacts_relationship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_relationship (
    relation character varying(15) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.contacts_relationship OWNER TO postgres;

--
-- Name: contacts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_user (
    id integer NOT NULL,
    prefix character varying(10),
    suffix character varying(30),
    first_name character varying(30) NOT NULL,
    last_name character varying(30),
    sur_name character varying(30),
    user_id integer
);


ALTER TABLE public.contacts_user OWNER TO postgres;

--
-- Name: contacts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_user_id_seq OWNER TO postgres;

--
-- Name: contacts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_user_id_seq OWNED BY public.contacts_user.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: contacts_dateinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_dateinfo ALTER COLUMN id SET DEFAULT nextval('public.contacts_dateinfo_id_seq'::regclass);


--
-- Name: contacts_mobileinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_mobileinfo ALTER COLUMN id SET DEFAULT nextval('public.contacts_mobileinfo_id_seq'::regclass);


--
-- Name: contacts_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_user ALTER COLUMN id SET DEFAULT nextval('public.contacts_user_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
1	user
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	25
2	1	26
3	1	27
4	1	28
5	1	29
6	1	30
7	1	31
8	1	32
9	1	33
10	1	34
11	1	35
12	1	36
13	1	37
14	1	38
15	1	39
16	1	40
17	1	41
18	1	42
19	1	43
20	1	44
21	1	45
22	1	46
23	1	47
24	1	48
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add mobile info	7	add_mobileinfo
26	Can change mobile info	7	change_mobileinfo
27	Can delete mobile info	7	delete_mobileinfo
28	Can view mobile info	7	view_mobileinfo
29	Can add company	8	add_company
30	Can change company	8	change_company
31	Can delete company	8	delete_company
32	Can view company	8	view_company
33	Can add description	9	add_description
34	Can change description	9	change_description
35	Can delete description	9	delete_description
36	Can view description	9	view_description
37	Can add relationship	10	add_relationship
38	Can change relationship	10	change_relationship
39	Can delete relationship	10	delete_relationship
40	Can view relationship	10	view_relationship
41	Can add user	11	add_user
42	Can change user	11	change_user
43	Can delete user	11	delete_user
44	Can view user	11	view_user
45	Can add date info	12	add_dateinfo
46	Can change date info	12	change_dateinfo
47	Can delete date info	12	delete_dateinfo
48	Can view date info	12	view_dateinfo
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$T9AU2ITdBXxQ$iMi6SHhwfDDO8e0rMFe2kmBhYg/7vnFbLcfJM1kt5V4=	2019-12-14 10:48:54.591445+05:30	t	sethuraman			ramansethu605@gmail.com	t	t	2019-12-14 10:48:35.65391+05:30
2	pbkdf2_sha256$150000$YLzvjkyJOwvi$aZ9GOAGjeaosqjwMhXZ8OjgQGHghMQ1kn+4Kzmh5U8U=	\N	f	harry	Harry	Potter	harry@django.com	f	t	2019-12-14 10:49:48+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: contacts_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_company (user_id, company_name, designation) FROM stdin;
3		
4		
5	TCS	Developer
6	No	sdaf
\.


--
-- Data for Name: contacts_dateinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_dateinfo (id, date, occasion, user_id) FROM stdin;
3	1997-07-26	Birthday	5
4	1997-05-22	Birthday	6
\.


--
-- Data for Name: contacts_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_description (description, user_id, picture) FROM stdin;
No Desc	5	
No desc	6	
\.


--
-- Data for Name: contacts_mobileinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_mobileinfo (id, phone_type, email, email_type, address, address_type, user_id, contact) FROM stdin;
1	M	\N	W	\N	W	3	9597618327
2	M	\N	W	\N	W	4	9597618327
3	M	\N	W	\N	W	5	9597618327
4	M	\N	W	\N	W	6	85763296
\.


--
-- Data for Name: contacts_relationship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_relationship (relation, user_id) FROM stdin;
Friend	5
Assistant	6
\.


--
-- Data for Name: contacts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_user (id, prefix, suffix, first_name, last_name, sur_name, user_id) FROM stdin;
3			Sethuraman	Krishnamoorthy		\N
4			Sethuraman	Krishnamoorthy		\N
5			Sethuraman	Krishnamoorthy		\N
6			George	Washi		\N
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-12-14 10:49:19.84603+05:30	1	user	1	[{"added": {}}]	3	1
2	2019-12-14 10:49:48.505332+05:30	2	harry	1	[{"added": {}}]	4	1
3	2019-12-14 10:50:06.905662+05:30	2	harry	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	contacts	mobileinfo
8	contacts	company
9	contacts	description
10	contacts	relationship
11	contacts	user
12	contacts	dateinfo
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-08 20:06:36.773245+05:30
2	auth	0001_initial	2019-12-08 20:06:37.095138+05:30
3	admin	0001_initial	2019-12-08 20:06:37.688635+05:30
4	admin	0002_logentry_remove_auto_add	2019-12-08 20:06:37.79744+05:30
5	admin	0003_logentry_add_action_flag_choices	2019-12-08 20:06:37.816076+05:30
6	contenttypes	0002_remove_content_type_name	2019-12-08 20:06:37.852596+05:30
7	auth	0002_alter_permission_name_max_length	2019-12-08 20:06:37.863551+05:30
8	auth	0003_alter_user_email_max_length	2019-12-08 20:06:37.882149+05:30
9	auth	0004_alter_user_username_opts	2019-12-08 20:06:37.901589+05:30
10	auth	0005_alter_user_last_login_null	2019-12-08 20:06:37.924085+05:30
11	auth	0006_require_contenttypes_0002	2019-12-08 20:06:37.936098+05:30
12	auth	0007_alter_validators_add_error_messages	2019-12-08 20:06:37.957349+05:30
13	auth	0008_alter_user_username_max_length	2019-12-08 20:06:38.022885+05:30
14	auth	0009_alter_user_last_name_max_length	2019-12-08 20:06:38.04582+05:30
15	auth	0010_alter_group_name_max_length	2019-12-08 20:06:38.073225+05:30
16	auth	0011_update_proxy_permissions	2019-12-08 20:06:38.104072+05:30
17	sessions	0001_initial	2019-12-08 20:06:38.19048+05:30
18	contacts	0001_initial	2019-12-08 20:08:54.542768+05:30
19	contacts	0002_mobileinfo_contact	2019-12-08 20:13:01.560415+05:30
20	contacts	0003_auto_20191214_1600	2019-12-14 21:31:17.381226+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
gb1xue506v3rr5tc6kfs5o8bwxrzj6mm	ZGI1MTljMjUwYmM4NWRkZGZmZTY0ZDY0NDJlNjZhNTA3ZWVhYzY3Njp7InVzZXJuYW1lIjoiaGFycnkiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9	2019-12-14 11:20:58.94116+05:30
o6la02yhmlt41begm7qbyuxbhnexf4im	ZGI1MTljMjUwYmM4NWRkZGZmZTY0ZDY0NDJlNjZhNTA3ZWVhYzY3Njp7InVzZXJuYW1lIjoiaGFycnkiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9	2019-12-14 12:06:33.93447+05:30
slv0dj5kar5hwyhorcu99zg8h57baavg	ZGI1MTljMjUwYmM4NWRkZGZmZTY0ZDY0NDJlNjZhNTA3ZWVhYzY3Njp7InVzZXJuYW1lIjoiaGFycnkiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9	2019-12-14 13:47:13.282629+05:30
26kiwad09dgvb94f61s77q7wpiudlep5	ZGI1MTljMjUwYmM4NWRkZGZmZTY0ZDY0NDJlNjZhNTA3ZWVhYzY3Njp7InVzZXJuYW1lIjoiaGFycnkiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9	2019-12-14 14:57:04.237809+05:30
tsw57oxwsqajft3zd39lrm252tnevgqq	ZGI1MTljMjUwYmM4NWRkZGZmZTY0ZDY0NDJlNjZhNTA3ZWVhYzY3Njp7InVzZXJuYW1lIjoiaGFycnkiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9	2019-12-14 18:27:26.704076+05:30
urxufa7und9aezgu8skjhmfa4wy63zeh	ZGI1MTljMjUwYmM4NWRkZGZmZTY0ZDY0NDJlNjZhNTA3ZWVhYzY3Njp7InVzZXJuYW1lIjoiaGFycnkiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9	2019-12-14 20:29:49.661902+05:30
hajth4ukr51g3b9w6nv6pjylj7loyogp	OWM0ZDMyNTE0MjJhMDEzNWE1MzNlMTZjM2VjYmQwYzBhNjc5MTM2Njp7Il9zZXNzaW9uX2V4cGlyeSI6MTgwMCwidXNlcm5hbWUiOiJoYXJyeSJ9	2019-12-14 21:31:36.876363+05:30
p1xc9kypnt95tvu04krpzeb6ulufrdyd	ZGI1MTljMjUwYmM4NWRkZGZmZTY0ZDY0NDJlNjZhNTA3ZWVhYzY3Njp7InVzZXJuYW1lIjoiaGFycnkiLCJfc2Vzc2lvbl9leHBpcnkiOjE4MDB9	2019-12-14 22:04:41.45898+05:30
nevf8lp541tyj20bsi39cdxssb0reeh6	NDlhMTZiNGJkZDMzOGNmNGQ0NTUyMjdlYTUxMzczMTAzZjAzMWZiZTp7Il9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=	2019-12-14 22:29:17.898746+05:30
rzevt55mr8n054jlv7t9gk4lfmgwvdi5	NDlhMTZiNGJkZDMzOGNmNGQ0NTUyMjdlYTUxMzczMTAzZjAzMWZiZTp7Il9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=	2019-12-15 11:14:35.116988+05:30
jwmkkw8ghzocgtlt0m4xgrprruqbz6sg	NDlhMTZiNGJkZDMzOGNmNGQ0NTUyMjdlYTUxMzczMTAzZjAzMWZiZTp7Il9zZXNzaW9uX2V4cGlyeSI6MTgwMH0=	2019-12-15 12:06:26.516157+05:30
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 24, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: contacts_dateinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_dateinfo_id_seq', 5, true);


--
-- Name: contacts_mobileinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_mobileinfo_id_seq', 5, true);


--
-- Name: contacts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_user_id_seq', 7, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: contacts_company contacts_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_company
    ADD CONSTRAINT contacts_company_pkey PRIMARY KEY (user_id);


--
-- Name: contacts_dateinfo contacts_dateinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_dateinfo
    ADD CONSTRAINT contacts_dateinfo_pkey PRIMARY KEY (id);


--
-- Name: contacts_description contacts_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_description
    ADD CONSTRAINT contacts_description_pkey PRIMARY KEY (user_id);


--
-- Name: contacts_mobileinfo contacts_mobileinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_mobileinfo
    ADD CONSTRAINT contacts_mobileinfo_pkey PRIMARY KEY (id);


--
-- Name: contacts_relationship contacts_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_relationship
    ADD CONSTRAINT contacts_relationship_pkey PRIMARY KEY (user_id);


--
-- Name: contacts_user contacts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_user
    ADD CONSTRAINT contacts_user_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: contacts_dateinfo_user_id_e95d3828; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_dateinfo_user_id_e95d3828 ON public.contacts_dateinfo USING btree (user_id);


--
-- Name: contacts_mobileinfo_user_id_a57643c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_mobileinfo_user_id_a57643c4 ON public.contacts_mobileinfo USING btree (user_id);


--
-- Name: contacts_user_user_id_11d37d9b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_user_user_id_11d37d9b ON public.contacts_user USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_company contacts_company_user_id_fda52b4d_fk_contacts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_company
    ADD CONSTRAINT contacts_company_user_id_fda52b4d_fk_contacts_user_id FOREIGN KEY (user_id) REFERENCES public.contacts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_dateinfo contacts_dateinfo_user_id_e95d3828_fk_contacts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_dateinfo
    ADD CONSTRAINT contacts_dateinfo_user_id_e95d3828_fk_contacts_user_id FOREIGN KEY (user_id) REFERENCES public.contacts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_description contacts_description_user_id_f0384e49_fk_contacts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_description
    ADD CONSTRAINT contacts_description_user_id_f0384e49_fk_contacts_user_id FOREIGN KEY (user_id) REFERENCES public.contacts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_mobileinfo contacts_mobileinfo_user_id_a57643c4_fk_contacts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_mobileinfo
    ADD CONSTRAINT contacts_mobileinfo_user_id_a57643c4_fk_contacts_user_id FOREIGN KEY (user_id) REFERENCES public.contacts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_relationship contacts_relationship_user_id_82934af9_fk_contacts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_relationship
    ADD CONSTRAINT contacts_relationship_user_id_82934af9_fk_contacts_user_id FOREIGN KEY (user_id) REFERENCES public.contacts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_user contacts_user_user_id_11d37d9b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_user
    ADD CONSTRAINT contacts_user_user_id_11d37d9b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

