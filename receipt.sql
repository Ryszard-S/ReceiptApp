PGDMP         5                z        	   receiptdb    14.2    14.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16647 	   receiptdb    DATABASE     e   CREATE DATABASE receiptdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Polish_Poland.1250';
    DROP DATABASE receiptdb;
                postgres    false            �            1259    16674 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16673    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    216            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    215            �            1259    16683    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16682    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    218            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    217            �            1259    16667    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16666    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    214            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    213            �            1259    16690 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16699    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16698    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    222            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    221            �            1259    16689    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    220            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    219            �            1259    16706    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16705 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    224            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    223            �            1259    18064    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         heap    postgres    false            �            1259    16765    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16764    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    226            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    225            �            1259    16658    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16657    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    212            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    211            �            1259    16649    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16648    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    210            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    209            �            1259    16794    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    17988    receipt_category    TABLE     j   CREATE TABLE public.receipt_category (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);
 $   DROP TABLE public.receipt_category;
       public         heap    postgres    false            �            1259    17987    receipt_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.receipt_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.receipt_category_id_seq;
       public          postgres    false    229            �           0    0    receipt_category_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.receipt_category_id_seq OWNED BY public.receipt_category.id;
          public          postgres    false    228            �            1259    17997    receipt_category_user    TABLE     �   CREATE TABLE public.receipt_category_user (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    user_id integer NOT NULL
);
 )   DROP TABLE public.receipt_category_user;
       public         heap    postgres    false            �            1259    17996    receipt_category_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.receipt_category_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.receipt_category_user_id_seq;
       public          postgres    false    231            �           0    0    receipt_category_user_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.receipt_category_user_id_seq OWNED BY public.receipt_category_user.id;
          public          postgres    false    230            �            1259    18018    receipt_item    TABLE     �   CREATE TABLE public.receipt_item (
    id bigint NOT NULL,
    name character varying(130) NOT NULL,
    price numeric(15,2) NOT NULL,
    category_id bigint,
    receipt_id bigint NOT NULL
);
     DROP TABLE public.receipt_item;
       public         heap    postgres    false            �            1259    18017    receipt_item_id_seq    SEQUENCE     |   CREATE SEQUENCE public.receipt_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.receipt_item_id_seq;
       public          postgres    false    237            �           0    0    receipt_item_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.receipt_item_id_seq OWNED BY public.receipt_item.id;
          public          postgres    false    236            �            1259    18011    receipt_receipt    TABLE     �   CREATE TABLE public.receipt_receipt (
    id bigint NOT NULL,
    date date NOT NULL,
    shop_id bigint,
    user_id integer NOT NULL
);
 #   DROP TABLE public.receipt_receipt;
       public         heap    postgres    false            �            1259    18010    receipt_receipt_id_seq    SEQUENCE        CREATE SEQUENCE public.receipt_receipt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.receipt_receipt_id_seq;
       public          postgres    false    235            �           0    0    receipt_receipt_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.receipt_receipt_id_seq OWNED BY public.receipt_receipt.id;
          public          postgres    false    234            �            1259    18004    receipt_shop    TABLE     g   CREATE TABLE public.receipt_shop (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);
     DROP TABLE public.receipt_shop;
       public         heap    postgres    false            �            1259    18003    receipt_shop_id_seq    SEQUENCE     |   CREATE SEQUENCE public.receipt_shop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.receipt_shop_id_seq;
       public          postgres    false    233            �           0    0    receipt_shop_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.receipt_shop_id_seq OWNED BY public.receipt_shop.id;
          public          postgres    false    232            �           2604    16677    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16686    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16670    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    16693    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16702    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    16709    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16768    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16661    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    16652    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    17991    receipt_category id    DEFAULT     z   ALTER TABLE ONLY public.receipt_category ALTER COLUMN id SET DEFAULT nextval('public.receipt_category_id_seq'::regclass);
 B   ALTER TABLE public.receipt_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    18000    receipt_category_user id    DEFAULT     �   ALTER TABLE ONLY public.receipt_category_user ALTER COLUMN id SET DEFAULT nextval('public.receipt_category_user_id_seq'::regclass);
 G   ALTER TABLE public.receipt_category_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    18021    receipt_item id    DEFAULT     r   ALTER TABLE ONLY public.receipt_item ALTER COLUMN id SET DEFAULT nextval('public.receipt_item_id_seq'::regclass);
 >   ALTER TABLE public.receipt_item ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    18014    receipt_receipt id    DEFAULT     x   ALTER TABLE ONLY public.receipt_receipt ALTER COLUMN id SET DEFAULT nextval('public.receipt_receipt_id_seq'::regclass);
 A   ALTER TABLE public.receipt_receipt ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    18007    receipt_shop id    DEFAULT     r   ALTER TABLE ONLY public.receipt_shop ALTER COLUMN id SET DEFAULT nextval('public.receipt_shop_id_seq'::regclass);
 >   ALTER TABLE public.receipt_shop ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �          0    16674 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    216   R�       �          0    16683    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    218   o�       �          0    16667    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    214   ��       �          0    16690 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    220   l�       �          0    16699    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    222   ��       �          0    16706    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    224   ��       �          0    18064    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public          postgres    false    238   ��       �          0    16765    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    226   F�       �          0    16658    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    212   c�       �          0    16649    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    210   ��       �          0    16794    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    227   ��       �          0    17988    receipt_category 
   TABLE DATA           4   COPY public.receipt_category (id, name) FROM stdin;
    public          postgres    false    229   �       �          0    17997    receipt_category_user 
   TABLE DATA           I   COPY public.receipt_category_user (id, category_id, user_id) FROM stdin;
    public          postgres    false    231   \�       �          0    18018    receipt_item 
   TABLE DATA           P   COPY public.receipt_item (id, name, price, category_id, receipt_id) FROM stdin;
    public          postgres    false    237   ��       �          0    18011    receipt_receipt 
   TABLE DATA           E   COPY public.receipt_receipt (id, date, shop_id, user_id) FROM stdin;
    public          postgres    false    235   ��       �          0    18004    receipt_shop 
   TABLE DATA           0   COPY public.receipt_shop (id, name) FROM stdin;
    public          postgres    false    233   5�       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    215            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    217            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);
          public          postgres    false    213            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    221            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);
          public          postgres    false    219            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    223            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    225            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);
          public          postgres    false    211            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);
          public          postgres    false    209            �           0    0    receipt_category_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.receipt_category_id_seq', 5, true);
          public          postgres    false    228            �           0    0    receipt_category_user_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.receipt_category_user_id_seq', 8, true);
          public          postgres    false    230            �           0    0    receipt_item_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.receipt_item_id_seq', 3, true);
          public          postgres    false    236            �           0    0    receipt_receipt_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.receipt_receipt_id_seq', 3, true);
          public          postgres    false    234            �           0    0    receipt_shop_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.receipt_shop_id_seq', 345, true);
          public          postgres    false    232            �           2606    16792    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    216            �           2606    16722 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    218    218            �           2606    16688 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    218            �           2606    16679    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    216            �           2606    16713 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    214    214            �           2606    16672 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    214            �           2606    16704 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    222            �           2606    16737 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    222    222            �           2606    16695    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    220            �           2606    16711 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    224            �           2606    16751 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    224    224            �           2606    16787     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    220            �           2606    18068 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public            postgres    false    238            �           2606    18070 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public            postgres    false    238            �           2606    16773 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    226            �           2606    16665 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    212    212            �           2606    16663 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    212            �           2606    16656 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210            �           2606    16800 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    227            �           2606    17995 *   receipt_category receipt_category_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.receipt_category
    ADD CONSTRAINT receipt_category_name_key UNIQUE (name);
 T   ALTER TABLE ONLY public.receipt_category DROP CONSTRAINT receipt_category_name_key;
       public            postgres    false    229            �           2606    17993 &   receipt_category receipt_category_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.receipt_category
    ADD CONSTRAINT receipt_category_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.receipt_category DROP CONSTRAINT receipt_category_pkey;
       public            postgres    false    229            �           2606    18026 M   receipt_category_user receipt_category_user_category_id_user_id_7aecc743_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.receipt_category_user
    ADD CONSTRAINT receipt_category_user_category_id_user_id_7aecc743_uniq UNIQUE (category_id, user_id);
 w   ALTER TABLE ONLY public.receipt_category_user DROP CONSTRAINT receipt_category_user_category_id_user_id_7aecc743_uniq;
       public            postgres    false    231    231            �           2606    18002 0   receipt_category_user receipt_category_user_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.receipt_category_user
    ADD CONSTRAINT receipt_category_user_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.receipt_category_user DROP CONSTRAINT receipt_category_user_pkey;
       public            postgres    false    231            �           2606    18023    receipt_item receipt_item_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.receipt_item
    ADD CONSTRAINT receipt_item_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.receipt_item DROP CONSTRAINT receipt_item_pkey;
       public            postgres    false    237            �           2606    18016 $   receipt_receipt receipt_receipt_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.receipt_receipt
    ADD CONSTRAINT receipt_receipt_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.receipt_receipt DROP CONSTRAINT receipt_receipt_pkey;
       public            postgres    false    235            �           2606    18009    receipt_shop receipt_shop_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.receipt_shop
    ADD CONSTRAINT receipt_shop_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.receipt_shop DROP CONSTRAINT receipt_shop_pkey;
       public            postgres    false    233            �           1259    16793    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    216            �           1259    16733 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    218            �           1259    16734 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    218            �           1259    16719 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    214            �           1259    16749 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    222            �           1259    16748 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    222            �           1259    16763 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    224            �           1259    16762 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    224            �           1259    16788     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    220            �           1259    18076 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public            postgres    false    238            �           1259    16784 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    226            �           1259    16785 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    226            �           1259    16802 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    227            �           1259    16801 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    227            �           1259    18024 #   receipt_category_name_d0415aa0_like    INDEX     t   CREATE INDEX receipt_category_name_d0415aa0_like ON public.receipt_category USING btree (name varchar_pattern_ops);
 7   DROP INDEX public.receipt_category_name_d0415aa0_like;
       public            postgres    false    229            �           1259    18037 *   receipt_category_user_category_id_3c624a20    INDEX     s   CREATE INDEX receipt_category_user_category_id_3c624a20 ON public.receipt_category_user USING btree (category_id);
 >   DROP INDEX public.receipt_category_user_category_id_3c624a20;
       public            postgres    false    231            �           1259    18038 &   receipt_category_user_user_id_77ef6eb0    INDEX     k   CREATE INDEX receipt_category_user_user_id_77ef6eb0 ON public.receipt_category_user USING btree (user_id);
 :   DROP INDEX public.receipt_category_user_user_id_77ef6eb0;
       public            postgres    false    231            �           1259    18061 !   receipt_item_category_id_8a4f6aa3    INDEX     a   CREATE INDEX receipt_item_category_id_8a4f6aa3 ON public.receipt_item USING btree (category_id);
 5   DROP INDEX public.receipt_item_category_id_8a4f6aa3;
       public            postgres    false    237            �           1259    18062     receipt_item_receipt_id_9e3566c9    INDEX     _   CREATE INDEX receipt_item_receipt_id_9e3566c9 ON public.receipt_item USING btree (receipt_id);
 4   DROP INDEX public.receipt_item_receipt_id_9e3566c9;
       public            postgres    false    237            �           1259    18049     receipt_receipt_shop_id_7e3cc9ab    INDEX     _   CREATE INDEX receipt_receipt_shop_id_7e3cc9ab ON public.receipt_receipt USING btree (shop_id);
 4   DROP INDEX public.receipt_receipt_shop_id_7e3cc9ab;
       public            postgres    false    235            �           1259    18050     receipt_receipt_user_id_1eff22df    INDEX     _   CREATE INDEX receipt_receipt_user_id_1eff22df ON public.receipt_receipt USING btree (user_id);
 4   DROP INDEX public.receipt_receipt_user_id_1eff22df;
       public            postgres    false    235            �           2606    16728 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    218    3262    214            �           2606    16723 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3267    218    216            �           2606    16714 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    214    3257    212                       2606    16743 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    216    222    3267                        2606    16738 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3275    222    220                       2606    16757 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    3262    224    214                       2606    16752 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    220    3275    224                       2606    18071 @   authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
       public          postgres    false    238    3275    220                       2606    16774 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3257    212    226                       2606    16779 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    3275    220    226                       2606    18027 L   receipt_category_user receipt_category_use_category_id_3c624a20_fk_receipt_c    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt_category_user
    ADD CONSTRAINT receipt_category_use_category_id_3c624a20_fk_receipt_c FOREIGN KEY (category_id) REFERENCES public.receipt_category(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.receipt_category_user DROP CONSTRAINT receipt_category_use_category_id_3c624a20_fk_receipt_c;
       public          postgres    false    231    229    3303                       2606    18032 L   receipt_category_user receipt_category_user_user_id_77ef6eb0_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt_category_user
    ADD CONSTRAINT receipt_category_user_user_id_77ef6eb0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.receipt_category_user DROP CONSTRAINT receipt_category_user_user_id_77ef6eb0_fk_auth_user_id;
       public          postgres    false    231    220    3275            
           2606    18051 E   receipt_item receipt_item_category_id_8a4f6aa3_fk_receipt_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt_item
    ADD CONSTRAINT receipt_item_category_id_8a4f6aa3_fk_receipt_category_id FOREIGN KEY (category_id) REFERENCES public.receipt_category(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.receipt_item DROP CONSTRAINT receipt_item_category_id_8a4f6aa3_fk_receipt_category_id;
       public          postgres    false    3303    229    237                       2606    18056 C   receipt_item receipt_item_receipt_id_9e3566c9_fk_receipt_receipt_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt_item
    ADD CONSTRAINT receipt_item_receipt_id_9e3566c9_fk_receipt_receipt_id FOREIGN KEY (receipt_id) REFERENCES public.receipt_receipt(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.receipt_item DROP CONSTRAINT receipt_item_receipt_id_9e3566c9_fk_receipt_receipt_id;
       public          postgres    false    3313    235    237                       2606    18039 C   receipt_receipt receipt_receipt_shop_id_7e3cc9ab_fk_receipt_shop_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt_receipt
    ADD CONSTRAINT receipt_receipt_shop_id_7e3cc9ab_fk_receipt_shop_id FOREIGN KEY (shop_id) REFERENCES public.receipt_shop(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.receipt_receipt DROP CONSTRAINT receipt_receipt_shop_id_7e3cc9ab_fk_receipt_shop_id;
       public          postgres    false    235    233    3311            	           2606    18044 @   receipt_receipt receipt_receipt_user_id_1eff22df_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.receipt_receipt
    ADD CONSTRAINT receipt_receipt_user_id_1eff22df_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.receipt_receipt DROP CONSTRAINT receipt_receipt_user_id_1eff22df_fk_auth_user_id;
       public          postgres    false    220    3275    235            �      x������ � �      �      x������ � �      �   �  x�]�In�0E��)|�"2�{�.A"8F۰���}m�Cv�� >P�.���/N�Kq�"�qz��-��RS�+B��S�C�+k/��ӕ��?]�5�z!Ж��0ݻy��U�&~��;�a!�؃(�wd�v��I�ξ�h�܇�R;e:@*Q� Y�]��c�kH`=�������l�t ����F�F��'��>.�V��ܖp����E^`���^x�i�ڈ�M��-�z�Uw$��W&����1�v��ǘʺ@dň$�|����a�v��W&���c�d\�yk��+,��!I�|FwH�Z��6�F7�� �l y9�\���BMI�Ρ�;�pT�6�
����T�"F$�]w�|ܫ�z���wnC%&љ���p�@�Jj?��л2���Z��D��1ye
`TX� 	�%�1�+���o����2�U ��2�} ��2&R	�|���8�D�      �   5  x����n�@�5<E숄�03HҤ�`�*HԘ4P��T	���n\�������1u\$)|\�"���@I��X��"p�݌v�1]�ܤ��sI7��x��^�շS�>9�݂��Mp#�+�w����*;1C�� �D<B�"ʪ�T$	I@d^�S��-"���n�8���p�5{9�KC����O���n�<Z}g�e.�N�%e����0�.��I�%�*���Н���Z�����EZ������͂�F�,+���Q7�o�NK9:�V�0==8$�F|o:� ��L��F�i/�,�8�x�      �      x������ � �      �      x������ � �      �   K   x��A� ����}O|����1���&�5�˗�&Q5�{�W���( ��5�<$y���$�O�����;      �      x������ � �      �   �   x�]�K
�0DךÔ:�ߥ�Ĵ��%Cr����ރa�����deFG��@��U�$V����r���$[j6g�_���[[�.T8p�F���l]7��d�6�$�~S�x�sm��ɉڅ��U.2͸� �O�K�      �   �  x����n�0F��)��j��?<˕,���*`jLռ}m�!�
J6(��3なuc0c���B�m���0���W@/H4�79��p����8!��R�T�4��f����V��b����ܗQ��N��i�A�0؍An��S�֍�םjߝm��m��N,�G�VS^��F�z0�(�%�	%VX�>�&�;ϩ��W��V����m��"��J"����am��N%�R�zOI�\��R�Z���9$�6l�wz.D��J�Q��b�j7kW�����e�m<E)�K�����sn���y5�y��^�%�";�'7�<�\���L�+�����D�*�]Q�
��n��� *����LQ�Q�w�绁��#��a�u�ߟ���g����d5��Շ�BT�ԕ7��S�I�D�F��d�-v��>��b�)ǠA��F���6b��×m���
�"�#��oQ�gV� ��x8~ "�?      �      x������ � �      �   D   x�3�H��,��2�.�?���<�*�˘���������.��Ԥ�T.S΂Ă�Ԣ��J�=... {��      �   2   x���  �3S����)��됐�35��K[�2v�9���7o �b      �   F   x�3�L*=ڔ��i�gn�i�i�eę�XP�_�ihdlb�gd�i5��)-.)���prs��qqq 'k      �   1   x�3�4202�50�5��4�4�2�rZX E�"��&@\1z\\\ h	B      �   �  x�U��r�����S�ʽj���%E]���i��b6 	�0��꺈&W3�sb��O�[�rz�֋̗̓EQ��2d"���C50yn|���(}n6F����]$6_覺��uK]���7&_�l0�2���eW�uGM���t�����~�l��T�Ե[&:l��]:�}eZ��P�O�t���^�����Ǭ���6խ/��IS����sp��v�/Nu�Vf��aG=���������r�X�T�\G��6>�-��2�Q�����(V�E�|����/��:j���)l��:�Ipb�;uT?�80�O���(K��L0-M��Jbs�c�$S��WIaS�+3�5�U��aoqK�B�x�J�6��_�]�����t�����1~��M�{����&~�%ۺ�߼<�݌D��q\��a��n��M<V��I�K���(�4;Gk}�G+��Ii��ɧ'&�S��P'6/V�"�ĴN}+Rs�V�N�%�T>i�<��j!��^��>87��t��N�X�vܭ\�J]ur�I�z�T6�EY��8���g��o?���f�nG(���6����6~}�NL0p�.X)\�n��D��"Lr�U�񟻅��t�{���u� �������u����rK��]��݉���vn�Bw�wƗc�4�`0Н��?�r����L��"��-9�t�R�`Ⓜ�u��>/��NO�bᗹK��Qץq�O�����s�]�㜒`��'��n$z*礻���,f~���]�t��NOOu��N-���6���+���)��S����r�������Ū������d�"&nmJ[��W݋~����ou/~o��v���fm-
�{Z�H�{��QHzL�:����'�ju���<�r0�Q+��n7��O1��n}� ���o0��f�����\`km��7��P��xm��Ͱ�~3��L�Λ�>RD5�oƩ]�>�~�c��?��cC��}p퀞�<c�������K��6�Q�( �h�HMuV�����Rg���f��Z]�b�u*V�<q��}:�$Bp��׫�Q��(=7��Y�H=�U��n@�ܕs�
 �y��3�9�)/���R�HM���kI`{~� ��y�
�~���$�����o+t_�#����n1�^��+)�/��B �"�s���q0ͼ�

_@h�k�9U\��R� "c�i�]*_�E�̃��/�v\���)_]U�>s�����kӝOЀ�K;g	 ���U�U�̀�K�,-d�.��b��.4���È�-���a�+����U!+u�eU��d�Tt!����=�e���|�PWY�9CuU�p���Lp,=l1��yoi�_�r��3Z���֯����.1"w�e�`�KB�K/���C�e��ȡ�s�����:��r�C`z�&}��ͮ��m0��X�X6�9���Y�5HW�z��í=���ń`�ȹ�G��g��\�}0^���T���G��}|��֙2ӿ��Z�M��G�$��o4q�F�o��ؾvON�t?�ɺ�X����h������ו�T�̗B�)�Gfͅ};��Q���f�=�zd�DC [�Ňi&8 k�Ų1_;"��[ tc�C�wP{d�g�����������\%˟�0�=���f+�^�.�-�ā�Z�EZ ����'��2d�uEǭ �#�V��=�p��u#�����x�te����G("\�Ӕѣ��G@���ˢ���ˡD���BWݜ�'�n�3��2�좤sl��0y=F�A��&��7�S�6��X��-��Up�j[�i4e����#Կ@�";:��%P;�'��f��I��H;�QKHt�&c�Q0�g��C��ى)
Bg'��H-5q��	.+��N�J���Bp�}]|�-;�˭�ښ��7"f��غ��AX:�W� Z�ѐ�Z���I��!	��dz���+�*�(�ײ M�A?]��
�h'~���*tE����|��ZQo���D �(��ov�8��mǫ�h@��C����c]������7�X/$�0 �i*"���}h@�F��7~������3��ah���y�'����~���^����=���/���;'����y������?��7o�Ö���`�ܟTI����wG`���������X_ �-%��g��/��6;��������]�tE)�F���x��ᘷSCM��~G�"CA��G��hU����5Eu� S#9����ˬ��ڥaYpj�U�{<�� ̅�����E��S�g
�O/Ϯn���%�^" ��m�~|D��ԥ���k�xi�0�L�b�&P�~*-b���Rԋ���G =X��B=�^$z���V�U6�5�l�-(g)'��h'ž�Q@�kq����>�eJ�u����s��g���Kn�f����G�M$�K��������k8K8c
cJ`��D��,�p~���f=���fg�!���߿*#�D�ox��͐ɔw����8�(��}�~���%c�ʴ�o� �i�~8��c�&s:b,V��kKA.��2�[�~�����h'��f���g.uK�ff́��ˌ.��M5[��\�-5;;��j�g��h�Z�
\N:�[f�������ur�ٯ$�u����)�~��� �!��������goSZ�:���Vۢ�=���d�����]���?���T`!�T��͌�o�2�?]��UF¶rwbf����/�N�O�Pl����f��>;�e1��P�S��5<��͐�����;� }jO�٤d�K�6w�����Ji-!�ιL���Q#QK��3K��>�`�;���]����<B��޹��	��:7s����ٔ�]uo��+ ��7 K���%/�=�?�E��cB��{��3�0ڸw�c4q����A�1�@��A��R��G������M     