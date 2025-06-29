PGDMP                      }            dbfood    17.2 (Debian 17.2-1.pgdg120+1)    17.0 >    g           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            h           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            i           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            j           1262    49153    dbfood    DATABASE     q   CREATE DATABASE dbfood WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE dbfood;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            k           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    49211    addressclients    TABLE     Y  CREATE TABLE public.addressclients (
    id integer NOT NULL,
    guid uuid NOT NULL,
    client_id integer NOT NULL,
    address character varying(100) NOT NULL,
    number character varying(15) NOT NULL,
    complements character varying(150),
    landmark character varying(100),
    favorite boolean,
    typeaddress character varying(1)
);
 "   DROP TABLE public.addressclients;
       public         heap r       postgres    false    4            l           0    0    COLUMN addressclients.landmark    COMMENT     K   COMMENT ON COLUMN public.addressclients.landmark IS 'Ponto de Referencia';
          public               postgres    false    226            m           0    0 !   COLUMN addressclients.typeaddress    COMMENT     R   COMMENT ON COLUMN public.addressclients.typeaddress IS '0-Home
1-Works
2-Love';
          public               postgres    false    226            �            1259    49201    clients    TABLE     �   CREATE TABLE public.clients (
    id integer NOT NULL,
    guid uuid NOT NULL,
    name character varying(100) NOT NULL,
    contact character varying(11) NOT NULL,
    email character varying(100),
    store_id integer NOT NULL
);
    DROP TABLE public.clients;
       public         heap r       postgres    false    4            �            1259    49174 	   companies    TABLE     �   CREATE TABLE public.companies (
    id integer NOT NULL,
    description character varying(100),
    cnpj_cpf character varying(14)
);
    DROP TABLE public.companies;
       public         heap r       postgres    false    4            �            1259    57355    companies_food    TABLE     p   CREATE TABLE public.companies_food (
    id integer NOT NULL,
    description character varying(30) NOT NULL
);
 "   DROP TABLE public.companies_food;
       public         heap r       postgres    false    4            �            1259    57354    companies_food_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.companies_food_id_seq;
       public               postgres    false    230    4            n           0    0    companies_food_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.companies_food_id_seq OWNED BY public.companies_food.id;
          public               postgres    false    229            �            1259    49173    companies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public               postgres    false    222    4            o           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
          public               postgres    false    221            �            1259    57346 	   food_sync    TABLE     �  CREATE TABLE public.food_sync (
    id integer NOT NULL,
    companie_id integer NOT NULL,
    companie_food_id integer NOT NULL,
    status_sync character varying NOT NULL,
    usercode character varying(15),
    authorizationcode character varying(15),
    client_id character varying(60),
    client_secret character varying(150),
    token character varying(2000),
    authorizationcodeverifier character varying(100),
    refreshtoken character varying(2000)
);
    DROP TABLE public.food_sync;
       public         heap r       postgres    false    4            p           0    0    COLUMN food_sync.status_sync    COMMENT     x   COMMENT ON COLUMN public.food_sync.status_sync IS 'I-Iniciaal - Pede Codigo
A-Aguardando Aprovação
S-Sincronizado';
          public               postgres    false    228            �            1259    57345    food_sync_id_seq    SEQUENCE     �   CREATE SEQUENCE public.food_sync_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.food_sync_id_seq;
       public               postgres    false    4    228            q           0    0    food_sync_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.food_sync_id_seq OWNED BY public.food_sync.id;
          public               postgres    false    227            �            1259    49186    groupproducts    TABLE     �   CREATE TABLE public.groupproducts (
    id integer NOT NULL,
    store_id integer NOT NULL,
    description character varying(100) NOT NULL,
    urlimage character varying(200),
    guid uuid NOT NULL
);
 !   DROP TABLE public.groupproducts;
       public         heap r       postgres    false    4            �            1259    49185    groupproducts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.groupproducts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.groupproducts_id_seq;
       public               postgres    false    224    4            r           0    0    groupproducts_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.groupproducts_id_seq OWNED BY public.groupproducts.id;
          public               postgres    false    223            �            1259    49155    products    TABLE       CREATE TABLE public.products (
    id integer NOT NULL,
    store_id integer NOT NULL,
    guid uuid NOT NULL,
    description character varying(100) NOT NULL,
    price numeric(8,2) NOT NULL,
    urlimage character varying(200),
    groupproduct_id integer NOT NULL
);
    DROP TABLE public.products;
       public         heap r       postgres    false    4            �            1259    49154    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public               postgres    false    218    4            s           0    0    product_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.product_id_seq OWNED BY public.products.id;
          public               postgres    false    217            �            1259    49162    stores    TABLE     �   CREATE TABLE public.stores (
    id integer NOT NULL,
    companie_id integer NOT NULL,
    description character varying(30) NOT NULL,
    guid uuid NOT NULL
);
    DROP TABLE public.stores;
       public         heap r       postgres    false    4            �            1259    49161    stores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.stores_id_seq;
       public               postgres    false    4    220            t           0    0    stores_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;
          public               postgres    false    219            �           2604    49177    companies id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    57358    companies_food id    DEFAULT     v   ALTER TABLE ONLY public.companies_food ALTER COLUMN id SET DEFAULT nextval('public.companies_food_id_seq'::regclass);
 @   ALTER TABLE public.companies_food ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    229    230            �           2604    57349    food_sync id    DEFAULT     l   ALTER TABLE ONLY public.food_sync ALTER COLUMN id SET DEFAULT nextval('public.food_sync_id_seq'::regclass);
 ;   ALTER TABLE public.food_sync ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    49189    groupproducts id    DEFAULT     t   ALTER TABLE ONLY public.groupproducts ALTER COLUMN id SET DEFAULT nextval('public.groupproducts_id_seq'::regclass);
 ?   ALTER TABLE public.groupproducts ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    49158    products id    DEFAULT     i   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    49165 	   stores id    DEFAULT     f   ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);
 8   ALTER TABLE public.stores ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            `          0    49211    addressclients 
   TABLE DATA           |   COPY public.addressclients (id, guid, client_id, address, number, complements, landmark, favorite, typeaddress) FROM stdin;
    public               postgres    false    226   H       _          0    49201    clients 
   TABLE DATA           K   COPY public.clients (id, guid, name, contact, email, store_id) FROM stdin;
    public               postgres    false    225   4H       \          0    49174 	   companies 
   TABLE DATA           >   COPY public.companies (id, description, cnpj_cpf) FROM stdin;
    public               postgres    false    222   QH       d          0    57355    companies_food 
   TABLE DATA           9   COPY public.companies_food (id, description) FROM stdin;
    public               postgres    false    230   �H       b          0    57346 	   food_sync 
   TABLE DATA           �   COPY public.food_sync (id, companie_id, companie_food_id, status_sync, usercode, authorizationcode, client_id, client_secret, token, authorizationcodeverifier, refreshtoken) FROM stdin;
    public               postgres    false    228   �H       ^          0    49186    groupproducts 
   TABLE DATA           R   COPY public.groupproducts (id, store_id, description, urlimage, guid) FROM stdin;
    public               postgres    false    224   YM       X          0    49155    products 
   TABLE DATA           e   COPY public.products (id, store_id, guid, description, price, urlimage, groupproduct_id) FROM stdin;
    public               postgres    false    218   vM       Z          0    49162    stores 
   TABLE DATA           D   COPY public.stores (id, companie_id, description, guid) FROM stdin;
    public               postgres    false    220   �M       u           0    0    companies_food_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.companies_food_id_seq', 1, true);
          public               postgres    false    229            v           0    0    companies_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.companies_id_seq', 1, true);
          public               postgres    false    221            w           0    0    food_sync_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.food_sync_id_seq', 1, true);
          public               postgres    false    227            x           0    0    groupproducts_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.groupproducts_id_seq', 1, false);
          public               postgres    false    223            y           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public               postgres    false    217            z           0    0    stores_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.stores_id_seq', 1, false);
          public               postgres    false    219            �           2606    49215     addressclients addressclients_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.addressclients
    ADD CONSTRAINT addressclients_pk PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.addressclients DROP CONSTRAINT addressclients_pk;
       public                 postgres    false    226            �           2606    49205    clients clients_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pk;
       public                 postgres    false    225            �           2606    57360     companies_food companies_food_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.companies_food
    ADD CONSTRAINT companies_food_pk PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.companies_food DROP CONSTRAINT companies_food_pk;
       public                 postgres    false    230            �           2606    49179    companies companies_unique 
   CONSTRAINT     S   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_unique UNIQUE (id);
 D   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_unique;
       public                 postgres    false    222            �           2606    57353    food_sync food_sync_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.food_sync
    ADD CONSTRAINT food_sync_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.food_sync DROP CONSTRAINT food_sync_pk;
       public                 postgres    false    228            �           2606    49191    groupproducts groupproducts_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.groupproducts
    ADD CONSTRAINT groupproducts_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.groupproducts DROP CONSTRAINT groupproducts_pk;
       public                 postgres    false    224            �           2606    49160    products product_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_pk PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.products DROP CONSTRAINT product_pk;
       public                 postgres    false    218            �           2606    49167    stores stores_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_pk;
       public                 postgres    false    220            �           2606    49216 (   addressclients addressclients_clients_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.addressclients
    ADD CONSTRAINT addressclients_clients_fk FOREIGN KEY (client_id) REFERENCES public.clients(id);
 R   ALTER TABLE ONLY public.addressclients DROP CONSTRAINT addressclients_clients_fk;
       public               postgres    false    3258    225    226            �           2606    49206    clients clients_stores_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_stores_fk FOREIGN KEY (store_id) REFERENCES public.stores(id);
 C   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_stores_fk;
       public               postgres    false    220    3252    225            �           2606    49192 "   products products_groupproducts_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_groupproducts_fk FOREIGN KEY (groupproduct_id) REFERENCES public.groupproducts(id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_groupproducts_fk;
       public               postgres    false    218    224    3256            �           2606    49168    products products_stores_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_stores_fk FOREIGN KEY (store_id) REFERENCES public.stores(id);
 E   ALTER TABLE ONLY public.products DROP CONSTRAINT products_stores_fk;
       public               postgres    false    220    3252    218            �           2606    49180    stores stores_companies_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_companies_fk FOREIGN KEY (companie_id) REFERENCES public.companies(id);
 D   ALTER TABLE ONLY public.stores DROP CONSTRAINT stores_companies_fk;
       public               postgres    false    220    3254    222            `      x������ � �      _      x������ � �      \      x�3�t*-JO-Rp��O�4�C�=... ��      d      x�3��L��O����� ��      b   �  x��Tَ�8}����l��h��4	�Fj���$�Y��1ݣ���}�{�F<.�uNU�*��w~Ґ�[��Nyz�ތ����<�7Pʒ�$��J6�J���*�X���~*r�˷DCD�6�� �2��x]͕L���PyJ�pH�]7��X��q\��p/�|��^n|���Dc��׆v��m�2ʟ���yVi�Gj����C% ���}x�vݛJ �k\s�X�qmڨ4�G�������\�Z�����<Py�_��z�����#%�p		Ґ`�e��A%l��6Xs@X�n��)'���C�A�W�2�\.�ɜjno�'p�k�5���6�т՞y�z�7��<wHU�e��0�����[vU�c�%��i[��!�:Ŝ�]�\b�4Q������鿱U�`z��Fh��!��ƍ:)�o�E��]�%KS�m�����"Mү{�İ'��e̩0�.}¹S�0�~�U���6f����������SA�=�/�둤!�H��O_qy�'__�����{����.��b5H+�G~�<�L��N���L8�*5�S��CTnc��lez�`za��:��)��"�.}�������?Ԧ�>�
	�Y�Nklo{��)8Ò�l�,��"�͑`��W�~+�?z����h���TR�gZ�~AY�xv(R���e6�zu�R3�#h���D�e.NM`'�.�C����bK�	�	&�f����A�B�mB�#�SL��\��y�b��]6�Ҝ	)i�����\/�򹞦�s�r���m_�֠Y����ص.�*���{���^0�{�����e8�^V�gu��vu��o���I^�勪@�昛uƵ�w� ���C���ۏ���.����k����-S�o�T�_���i�I�e[���<̓����w�2�l�i�@�6�X
�u��D���{IL8d\z�M��@�n�~໾��壾�?A�A���]�I����O��+$l�!;�HqDSA���e��[�^=�oAV�FH|=�%�˂ʭ�j]�:Ҷ����G�%�����l��O�sU����n�~�>��Z���� ܏��6��F����Cq�����=�^���]��o��ǫ�Ѻ�����x�ǝbQ"�N=ov�u��R����i'�c[���;R���?������'1��Q      ^      x������ � �      X      x������ � �      Z      x������ � �     