--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-17 20:11:56

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
-- TOC entry 216 (class 1259 OID 16674)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16673)
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
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 218 (class 1259 OID 16683)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16682)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 214 (class 1259 OID 16667)
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
-- TOC entry 213 (class 1259 OID 16666)
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
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 220 (class 1259 OID 16690)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16699)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16698)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 219 (class 1259 OID 16689)
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
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 224 (class 1259 OID 16706)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16705)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 238 (class 1259 OID 18064)
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16765)
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
-- TOC entry 225 (class 1259 OID 16764)
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
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 225
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 212 (class 1259 OID 16658)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16657)
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
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 210 (class 1259 OID 16649)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16648)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 227 (class 1259 OID 16794)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17988)
-- Name: receipt_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_category (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.receipt_category OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17987)
-- Name: receipt_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipt_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipt_category_id_seq OWNER TO postgres;

--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 228
-- Name: receipt_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipt_category_id_seq OWNED BY public.receipt_category.id;


--
-- TOC entry 231 (class 1259 OID 17997)
-- Name: receipt_category_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_category_user (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.receipt_category_user OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17996)
-- Name: receipt_category_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipt_category_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipt_category_user_id_seq OWNER TO postgres;

--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 230
-- Name: receipt_category_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipt_category_user_id_seq OWNED BY public.receipt_category_user.id;


--
-- TOC entry 237 (class 1259 OID 18018)
-- Name: receipt_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_item (
    id bigint NOT NULL,
    name character varying(130) NOT NULL,
    price numeric(15,2) NOT NULL,
    category_id bigint,
    receipt_id bigint NOT NULL
);


ALTER TABLE public.receipt_item OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18017)
-- Name: receipt_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipt_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipt_item_id_seq OWNER TO postgres;

--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 236
-- Name: receipt_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipt_item_id_seq OWNED BY public.receipt_item.id;


--
-- TOC entry 235 (class 1259 OID 18011)
-- Name: receipt_receipt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_receipt (
    id bigint NOT NULL,
    date date NOT NULL,
    shop_id bigint,
    user_id integer NOT NULL
);


ALTER TABLE public.receipt_receipt OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18010)
-- Name: receipt_receipt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipt_receipt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipt_receipt_id_seq OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 234
-- Name: receipt_receipt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipt_receipt_id_seq OWNED BY public.receipt_receipt.id;


--
-- TOC entry 233 (class 1259 OID 18004)
-- Name: receipt_shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receipt_shop (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.receipt_shop OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18003)
-- Name: receipt_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipt_shop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipt_shop_id_seq OWNER TO postgres;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 232
-- Name: receipt_shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipt_shop_id_seq OWNED BY public.receipt_shop.id;


--
-- TOC entry 3240 (class 2604 OID 16677)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16686)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16670)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16693)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16702)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 16709)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16768)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16661)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16652)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 17991)
-- Name: receipt_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_category ALTER COLUMN id SET DEFAULT nextval('public.receipt_category_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 18000)
-- Name: receipt_category_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_category_user ALTER COLUMN id SET DEFAULT nextval('public.receipt_category_user_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 18021)
-- Name: receipt_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_item ALTER COLUMN id SET DEFAULT nextval('public.receipt_item_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 18014)
-- Name: receipt_receipt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_receipt ALTER COLUMN id SET DEFAULT nextval('public.receipt_receipt_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 18007)
-- Name: receipt_shop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_shop ALTER COLUMN id SET DEFAULT nextval('public.receipt_shop_id_seq'::regclass);


--
-- TOC entry 3484 (class 0 OID 16674)
-- Dependencies: 216
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3486 (class 0 OID 16683)
-- Dependencies: 218
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3482 (class 0 OID 16667)
-- Dependencies: 214
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
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add shop	8	add_shop
30	Can change shop	8	change_shop
31	Can delete shop	8	delete_shop
32	Can view shop	8	view_shop
33	Can add receipt	9	add_receipt
34	Can change receipt	9	change_receipt
35	Can delete receipt	9	delete_receipt
36	Can view receipt	9	view_receipt
37	Can add item	10	add_item
38	Can change item	10	change_item
39	Can delete item	10	delete_item
40	Can view item	10	view_item
41	Can add Token	11	add_token
42	Can change Token	11	change_token
43	Can delete Token	11	delete_token
44	Can view Token	11	view_token
45	Can add token	12	add_tokenproxy
46	Can change token	12	change_tokenproxy
47	Can delete token	12	delete_tokenproxy
48	Can view token	12	view_tokenproxy
\.


--
-- TOC entry 3488 (class 0 OID 16690)
-- Dependencies: 220
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$320000$tzNka8csKMVey9MMTOdlA2$y6jAIQLblC0+vDUSVnfFvBk5vTji27mqiSFCkN5FnzA=	\N	f	jan			jan@jan.pl	f	t	2022-05-14 04:44:17.753631+02
5	pbkdf2_sha256$320000$vSpFLGgr3PEM7JVZlIVCXP$7Cj8QmSIzoayGIx77Gl4aojFjPEOBTed8A6S5bXy++A=	\N	f	jan1			jan@jan.pl	f	t	2022-05-14 04:56:12.052519+02
1	pbkdf2_sha256$320000$Edf1Ab04IkTNlZJ7yOgfRb$Dt28tzj3BCtNmrOfLyYriRqMpNS6e5tvY2BOUEXTx6A=	2022-05-17 04:05:47.21463+02	t	admin				t	t	2022-05-12 04:41:13.713264+02
\.


--
-- TOC entry 3490 (class 0 OID 16699)
-- Dependencies: 222
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3492 (class 0 OID 16706)
-- Dependencies: 224
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3506 (class 0 OID 18064)
-- Dependencies: 238
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
1	2022-05-16 03:55:43.468+02	2
2	2022-05-14 21:39:08.262879+02	5
\.


--
-- TOC entry 3494 (class 0 OID 16765)
-- Dependencies: 226
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3480 (class 0 OID 16658)
-- Dependencies: 212
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	receipt	category
8	receipt	shop
9	receipt	receipt
10	receipt	item
11	authtoken	token
12	authtoken	tokenproxy
\.


--
-- TOC entry 3478 (class 0 OID 16649)
-- Dependencies: 210
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-05-10 07:36:42.646842+02
2	auth	0001_initial	2022-05-10 07:36:42.708841+02
3	admin	0001_initial	2022-05-10 07:36:42.725843+02
4	admin	0002_logentry_remove_auto_add	2022-05-10 07:36:42.731843+02
5	admin	0003_logentry_add_action_flag_choices	2022-05-10 07:36:42.736869+02
6	contenttypes	0002_remove_content_type_name	2022-05-10 07:36:42.752868+02
7	auth	0002_alter_permission_name_max_length	2022-05-10 07:36:42.75787+02
8	auth	0003_alter_user_email_max_length	2022-05-10 07:36:42.764846+02
9	auth	0004_alter_user_username_opts	2022-05-10 07:36:42.771871+02
10	auth	0005_alter_user_last_login_null	2022-05-10 07:36:42.777843+02
11	auth	0006_require_contenttypes_0002	2022-05-10 07:36:42.779845+02
12	auth	0007_alter_validators_add_error_messages	2022-05-10 07:36:42.785872+02
13	auth	0008_alter_user_username_max_length	2022-05-10 07:36:42.797844+02
14	auth	0009_alter_user_last_name_max_length	2022-05-10 07:36:42.804843+02
15	auth	0010_alter_group_name_max_length	2022-05-10 07:36:42.810841+02
16	auth	0011_update_proxy_permissions	2022-05-10 07:36:42.815868+02
17	auth	0012_alter_user_first_name_max_length	2022-05-10 07:36:42.821843+02
18	sessions	0001_initial	2022-05-10 07:36:42.830842+02
19	receipt	0001_initial	2022-05-12 04:40:53.316852+02
20	authtoken	0001_initial	2022-05-14 04:51:09.905784+02
21	authtoken	0002_auto_20160226_1747	2022-05-14 04:51:09.937035+02
22	authtoken	0003_tokenproxy	2022-05-14 04:51:09.937035+02
23	receipt	0002_alter_category_name_alter_item_receipt	2022-05-17 05:21:57.715579+02
\.


--
-- TOC entry 3495 (class 0 OID 16794)
-- Dependencies: 227
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
nsjlk49r2rxxt1wzsy3xy7zug7yiu2iz	.eJxVjEEOwiAQRe_C2hAqDIhL956hGWYGqRpISrsy3l2bdKHb_977LzXiupRx7TKPE6uzGtThd0tID6kb4DvWW9PU6jJPSW-K3mnX18byvOzu30HBXr51xGCyFQLD5BNHOAIg5MCOyfqYYiA-OfBknSSwZgiGIXPIRhzHCOr9AfJpOBo:1nqmap:wox_guP389DOHzpSmloGhfuZTOyJE3YVBByn6VtI1cs	2022-05-31 04:05:47.21463+02
\.


--
-- TOC entry 3497 (class 0 OID 17988)
-- Dependencies: 229
-- Data for Name: receipt_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_category (id, name) FROM stdin;
1	Paliwo
2	Spożywcze
3	sprzęt it
4	meble
5	papierosy
6	kremy
9	kremy2
10	kremy3
\.


--
-- TOC entry 3499 (class 0 OID 17997)
-- Dependencies: 231
-- Data for Name: receipt_category_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_category_user (id, category_id, user_id) FROM stdin;
1	1	5
2	2	5
3	3	5
4	4	5
5	5	5
6	1	2
7	2	2
8	4	2
10	6	2
13	9	2
14	9	5
16	10	5
18	10	2
\.


--
-- TOC entry 3505 (class 0 OID 18018)
-- Dependencies: 237
-- Data for Name: receipt_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_item (id, name, price, category_id, receipt_id) FROM stdin;
1	bułki	1.79	2	1
2	laptop	12342.20	3	1
3	lustro	12.00	1	3
14	chleb	11.11	5	34
15	laptopp	13.13	1	34
16	chleb	11.11	4	36
17	laptopp	13.13	1	36
19	chleb1	11.44	1	39
20	laptopp1	13.44	4	39
21	chleb1	11.44	1	40
22	laptopp1	13.44	4	40
\.


--
-- TOC entry 3503 (class 0 OID 18011)
-- Dependencies: 235
-- Data for Name: receipt_receipt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_receipt (id, date, shop_id, user_id) FROM stdin;
1	2022-05-09	6	5
2	2022-05-11	88	5
3	2022-05-10	142	2
34	2022-05-11	21	2
35	2022-05-11	21	2
36	2022-05-11	21	2
37	2022-05-11	21	2
38	2022-05-11	21	2
39	2022-05-11	21	2
40	2022-05-11	21	2
\.


--
-- TOC entry 3501 (class 0 OID 18004)
-- Dependencies: 233
-- Data for Name: receipt_shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receipt_shop (id, name) FROM stdin;
1	Carrefour
2	Castorama
3	E.Leclerc
4	IKEA
5	Intermarche Super
6	Jysk
7	Kaufland
8	Leroy Merlin
9	Lidl
10	Media Expert
11	OBI
12	Pepco
13	POLOmarket
14	Rossmann
15	RTV EURO AGD
16	abc
17	Żabka
18	50 style
19	4F
20	5.10.15
21	ABC
22	Abra
23	Action
24	Adidas
25	Agata
26	Akpol Baby
27	Al.Capone
28	Aldi
29	Alfa Star
30	Allegro
31	Almatur
32	Alsen
33	Apart
34	Api Market
35	Apis
36	Apteka Rodzinna
37	Apteka Zdrowit
38	Aquael Zoo
39	Ara
40	Arhelan
41	ArtDom
42	Art-Dom
43	Astra
44	Astro
45	At
46	Auchan Hipermarket
47	Auchan Supermarket
48	Avita
49	AvonBarbora
50	Bershka
51	BetterStyle
52	bi1
53	Biedronka
54	Big Star
55	Bingo
56	Bio Family
57	Black Red White
58	BLU
59	Blue Cactus
60	Blue Stop
61	BoConcept
62	Bodzio
63	Bomi
64	Bonarka City Center
65	Bonna
66	BonPrix
67	Bricoman
68	Bricomarche
69	Burger King
70	C&A
71	Calzedonia
72	Carrefour Express
73	Carrefour Market
74	CCC
75	Cersanit
76	Charles Vogele
77	Chata Polska
78	Chorten
79	Coccodrillo
80	Cocktail'me Showroom
81	Coral Travel
82	Cornette
83	Cropp TownDayli
84	DDD
85	Dealz
86	Decathlon
87	Decathlon XS
88	Decorations.pl
89	Deichmann
90	Dekoria
91	Delikatesy Centrum
92	Delikatesy CEZAR
93	Delikatesy Premium
94	Delisso
95	Deni Cler
96	Ding Poleca
97	Dino
98	Diverse
99	Dobromir
100	Dobry Wybór
101	Douglas
102	Drogeria Kosmyk
103	Drogeria Wispol
104	Drogerie Koliber
105	Drogerie Laboo
106	Drogerie Natura
107	Drogerie Polskie
108	Drogerie Sekret Urody
109	DUKA
110	Eko Line
111	Electro World
112	Eminence
113	EMPiK
114	Esotiq
115	Euro Sklep
116	Eurocash Cash&Carry
117	EuroSPAR
118	EXIM Tours
119	Fachowiec
120	Feu Vert
121	Fitbay
122	Flying Tiger Polska
123	Forte
124	Fotojoker
125	FRAC
126	Frisco
127	Galeria Krakowska
128	Galeria Mokotów
129	Galeria Sfera
130	Gama
131	Globi
132	GO Sport
133	Gram Market
134	Grecos Holiday
135	Greenpoint
136	Grene
137	Groszek Hala Banacha
138	Hala Kopińska
139	Hala Wola
140	Hebe
141	Hi Mountain
142	Hildebrandt
143	Hitpol
144	H&M
145	home&you
146	House
147	Husqvarna
148	Inglot
149	Intimissimi
150	Ipson
151	Itaka
152	Jasmin Drogerie
153	Jawa Drogerie
154	Jedynka
155	Jeżyk Market
156	Jubilat
157	Jula
158	Kakadu
159	Kakto.pl
160	KappAhl
161	KFC
162	KIK
163	Kler
164	Kodano.pl
165	Kodeksy w MP3
166	Komfort
167	Komputronik
168	Kontaktowe.pl
169	Kontigo
170	Kontri.pl
171	Korona
172	Kosz Okazji
173	Księgarnie Świat Książki
174	Legallais
175	Lego
176	Lewiatan
177	Livio
178	Loveitshop.pl
179	LPelektronik
180	Luna
181	Majster
182	Makro Cash&Carry
183	MALINKA Market
184	Mango
185	Marks&Spencer
186	Marmax
187	Martes Sport
188	Mary Kay
189	Max Elektro
190	Maxi Zoo
191	McDonald's
192	Meble Gawin
193	Meblik
194	Media Markt
195	Medicine
196	Mega Avans
197	Merkury Market
198	Minutka
199	Mohito
200	Moje Auchan
201	Mokpol
202	Moliera2
203	Monnari
204	MyCenter
205	Nasz Sklep
206	Naszadrogeria.pl
207	Nela
208	NEOPUNKT
209	Net Credit
210	Netcar.pl
211	Netto
212	Nikolia
213	NKD
214	Norauto
215	North Fish
216	Odido
217	Organic
218	Oriflame
219	Orsay
220	Oskar Tours
221	Oysho
222	Papiernik by Empik
223	Passa
224	Patio
225	Pizza Hut
226	Plus
227	Plus Wakacje
228	Podwawelskie Delikatesy
229	Pokusa
230	Prim Market
231	Primark
232	Primus
233	Profiauto
234	PSB BAT
235	PSB Mrówka
236	PSS AndrychówPSS Bochnia
237	PSS Lublin
238	PSS Rzeszów
239	PSS Społem Białystok
240	PSS Społem Częstochowa
241	PSS Społem Głogów
242	PSS Społem Gniezno
243	PSS Społem Katowice
244	PSS Społem Nowy Sącz
245	PSS Społem Poznań
246	PSS Społem Szczecin
247	PSS Społem Zawiercie
248	PSS Stalowa Wola
249	PSS Zamość
250	PSS Zgoda Płock
251	Pull&Bear
252	Rabat
253	Rainbow Tours
254	Ramex
255	Rebel Electro
256	Reebok
257	Reserved
258	Restol
259	RYŁKO
260	Samanta
261	Samsonite
262	Samsung-kupony
263	Sano
264	Sarenza
265	Sedal
266	Selgros Cash&Carry
267	Selsey
268	Sephora
269	Sezamek
270	SHEIN
271	Silcare
272	Silesia City Center
273	Sinsay
274	Sklep Polski
275	Słoneczko
276	Smyk
277	SPAR
278	SPAR Express
279	Specjał
280	Spiżarnia Smakosza
281	Społem Kielce
282	Społem Olsztyn
283	Społem PSS w Bełchatowie
284	Społem WSS Śródmieście
285	Spółdzielnia Handlowa Społem Arged
286	Stiga
287	Stilago
288	Stokrotka Express
289	Stokrotka Market
290	Stokrotka Optima
291	Stokrotka Supermarket
292	Stop&Shop
293	Stradivarius
294	Strefa Wnętrza
295	Subway
296	Sun&Fun Holidays
297	Sunshine Holiday
298	Supeco
299	Super-Pharm
300	Sużyw
301	Świat Opinii
302	Takko
303	Tatuum
304	Tchibo
305	TEDi
306	Telepizza
307	Telezakupy Mango
308	Tesco Market
309	Tescoma
310	Textil Market
311	Tifo
312	T-Mobile
313	TomiMarkt
314	Top Market
315	Top Secret
316	Topaz
317	Torimpex
318	Toys“R“Us
319	Tres
320	Triumph
321	TUI
322	Tupperware
323	Twój Market
324	Uśmiechnięte zakupy
325	Vica
326	Victoria's Secret
327	Vital
328	VOXWafelek
329	Weltbild
330	Westfield Arkadia
331	Witek Home
332	Wittchen
333	W.Kruk
334	Wojas
335	Wójcik Fashion
336	Wyspa szkrabów
337	YES
338	Zalando
339	Zara
340	Zielony Koszyk
341	Zielony Market
342	Ziko Dermo
343	Zina
344	Złote Tarasy
345	Zooplus.pl
\.


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 219
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 225
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 228
-- Name: receipt_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipt_category_id_seq', 10, true);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 230
-- Name: receipt_category_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipt_category_user_id_seq', 18, true);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 236
-- Name: receipt_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipt_item_id_seq', 22, true);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 234
-- Name: receipt_receipt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipt_receipt_id_seq', 40, true);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 232
-- Name: receipt_shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipt_shop_id_seq', 345, true);


--
-- TOC entry 3265 (class 2606 OID 16792)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3270 (class 2606 OID 16722)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3273 (class 2606 OID 16688)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 16679)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 16713)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3262 (class 2606 OID 16672)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 16704)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 16737)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3275 (class 2606 OID 16695)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 16711)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 16751)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3278 (class 2606 OID 16787)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3319 (class 2606 OID 18068)
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- TOC entry 3321 (class 2606 OID 18070)
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- TOC entry 3293 (class 2606 OID 16773)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 16665)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3257 (class 2606 OID 16663)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 16656)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 16800)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3300 (class 2606 OID 17993)
-- Name: receipt_category receipt_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_category
    ADD CONSTRAINT receipt_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 18026)
-- Name: receipt_category_user receipt_category_user_category_id_user_id_7aecc743_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_category_user
    ADD CONSTRAINT receipt_category_user_category_id_user_id_7aecc743_uniq UNIQUE (category_id, user_id);


--
-- TOC entry 3305 (class 2606 OID 18002)
-- Name: receipt_category_user receipt_category_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_category_user
    ADD CONSTRAINT receipt_category_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 18023)
-- Name: receipt_item receipt_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_item
    ADD CONSTRAINT receipt_item_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 18016)
-- Name: receipt_receipt receipt_receipt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_receipt
    ADD CONSTRAINT receipt_receipt_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 18009)
-- Name: receipt_shop receipt_shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_shop
    ADD CONSTRAINT receipt_shop_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 1259 OID 16793)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3268 (class 1259 OID 16733)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3271 (class 1259 OID 16734)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3258 (class 1259 OID 16719)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3279 (class 1259 OID 16749)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 3282 (class 1259 OID 16748)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 3285 (class 1259 OID 16763)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3288 (class 1259 OID 16762)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3276 (class 1259 OID 16788)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3317 (class 1259 OID 18076)
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- TOC entry 3291 (class 1259 OID 16784)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3294 (class 1259 OID 16785)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3295 (class 1259 OID 16802)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3298 (class 1259 OID 16801)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3301 (class 1259 OID 18037)
-- Name: receipt_category_user_category_id_3c624a20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_category_user_category_id_3c624a20 ON public.receipt_category_user USING btree (category_id);


--
-- TOC entry 3306 (class 1259 OID 18038)
-- Name: receipt_category_user_user_id_77ef6eb0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_category_user_user_id_77ef6eb0 ON public.receipt_category_user USING btree (user_id);


--
-- TOC entry 3313 (class 1259 OID 18061)
-- Name: receipt_item_category_id_8a4f6aa3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_item_category_id_8a4f6aa3 ON public.receipt_item USING btree (category_id);


--
-- TOC entry 3316 (class 1259 OID 18062)
-- Name: receipt_item_receipt_id_9e3566c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_item_receipt_id_9e3566c9 ON public.receipt_item USING btree (receipt_id);


--
-- TOC entry 3311 (class 1259 OID 18049)
-- Name: receipt_receipt_shop_id_7e3cc9ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_receipt_shop_id_7e3cc9ab ON public.receipt_receipt USING btree (shop_id);


--
-- TOC entry 3312 (class 1259 OID 18050)
-- Name: receipt_receipt_user_id_1eff22df; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receipt_receipt_user_id_1eff22df ON public.receipt_receipt USING btree (user_id);


--
-- TOC entry 3324 (class 2606 OID 16728)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3323 (class 2606 OID 16723)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3322 (class 2606 OID 16714)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3326 (class 2606 OID 16743)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3325 (class 2606 OID 16738)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3328 (class 2606 OID 16757)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3327 (class 2606 OID 16752)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3337 (class 2606 OID 18071)
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3329 (class 2606 OID 16774)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3330 (class 2606 OID 16779)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3331 (class 2606 OID 18027)
-- Name: receipt_category_user receipt_category_use_category_id_3c624a20_fk_receipt_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_category_user
    ADD CONSTRAINT receipt_category_use_category_id_3c624a20_fk_receipt_c FOREIGN KEY (category_id) REFERENCES public.receipt_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3332 (class 2606 OID 18032)
-- Name: receipt_category_user receipt_category_user_user_id_77ef6eb0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_category_user
    ADD CONSTRAINT receipt_category_user_user_id_77ef6eb0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3335 (class 2606 OID 18051)
-- Name: receipt_item receipt_item_category_id_8a4f6aa3_fk_receipt_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_item
    ADD CONSTRAINT receipt_item_category_id_8a4f6aa3_fk_receipt_category_id FOREIGN KEY (category_id) REFERENCES public.receipt_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3336 (class 2606 OID 18056)
-- Name: receipt_item receipt_item_receipt_id_9e3566c9_fk_receipt_receipt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_item
    ADD CONSTRAINT receipt_item_receipt_id_9e3566c9_fk_receipt_receipt_id FOREIGN KEY (receipt_id) REFERENCES public.receipt_receipt(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3333 (class 2606 OID 18039)
-- Name: receipt_receipt receipt_receipt_shop_id_7e3cc9ab_fk_receipt_shop_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_receipt
    ADD CONSTRAINT receipt_receipt_shop_id_7e3cc9ab_fk_receipt_shop_id FOREIGN KEY (shop_id) REFERENCES public.receipt_shop(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3334 (class 2606 OID 18044)
-- Name: receipt_receipt receipt_receipt_user_id_1eff22df_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receipt_receipt
    ADD CONSTRAINT receipt_receipt_user_id_1eff22df_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2022-05-17 20:11:57

--
-- PostgreSQL database dump complete
--

