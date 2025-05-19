--
-- PostgreSQL database dump
--

-- Dumped from database version 17rc1
-- Dumped by pg_dump version 17.4 (Homebrew)

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

--
-- Name: flags; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA flags;


ALTER SCHEMA flags OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: coordinates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coordinates (
    id integer NOT NULL,
    image_id character varying NOT NULL,
    image_url character varying NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);


ALTER TABLE public.coordinates OWNER TO postgres;

--
-- Name: coordinates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coordinates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coordinates_id_seq OWNER TO postgres;

--
-- Name: coordinates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coordinates_id_seq OWNED BY public.coordinates.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying NOT NULL,
    continent character varying NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_country_id_seq OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_country_id_seq OWNED BY public.countries.country_id;


--
-- Name: flag_names; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flag_names (
    id bigint NOT NULL,
    country_id bigint NOT NULL,
    code2l character varying(2) DEFAULT ''::character varying NOT NULL,
    language character varying(5) DEFAULT ''::character varying NOT NULL,
    name character varying(255),
    name_official character varying(255)
);


ALTER TABLE public.flag_names OWNER TO postgres;

--
-- Name: country_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_name_id_seq OWNER TO postgres;

--
-- Name: country_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_name_id_seq OWNED BY public.flag_names.id;


--
-- Name: game_modes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_modes (
    gamemode_id bigint NOT NULL,
    gamemode_name character varying NOT NULL
);


ALTER TABLE public.game_modes OWNER TO postgres;

--
-- Name: login_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_history (
    login_id bigint NOT NULL,
    user_id bigint NOT NULL,
    login_time timestamp without time zone NOT NULL,
    ip_address character varying
);


ALTER TABLE public.login_history OWNER TO postgres;

--
-- Name: login_history_login_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_history_login_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_history_login_id_seq OWNER TO postgres;

--
-- Name: login_history_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_history_login_id_seq OWNED BY public.login_history.login_id;


--
-- Name: scores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scores (
    score_id bigint NOT NULL,
    user_id bigint NOT NULL,
    gamemode_id bigint NOT NULL,
    score double precision NOT NULL,
    country_id integer
);


ALTER TABLE public.scores OWNER TO postgres;

--
-- Name: scores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scores_id_seq OWNER TO postgres;

--
-- Name: scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scores_id_seq OWNED BY public.scores.score_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    user_name character varying NOT NULL,
    user_password character varying NOT NULL,
    user_email character varying NOT NULL,
    user_salt character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: coordinates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coordinates ALTER COLUMN id SET DEFAULT nextval('public.coordinates_id_seq'::regclass);


--
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);


--
-- Name: flag_names id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag_names ALTER COLUMN id SET DEFAULT nextval('public.country_name_id_seq'::regclass);


--
-- Name: login_history login_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history ALTER COLUMN login_id SET DEFAULT nextval('public.login_history_login_id_seq'::regclass);


--
-- Name: scores score_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores ALTER COLUMN score_id SET DEFAULT nextval('public.scores_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
fccf9d0349bf
\.


--
-- Data for Name: coordinates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coordinates (id, image_id, image_url, latitude, longitude) FROM stdin;
1	774195586574013	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9hAsb_XSQHWkXm8dAet0nokkXXq3pSlPYHfbSoXRiK3kiIf3JkBSZt8HL8xtI7bxdmqqjvy5YX9YTh3PuX9SDZv18Ks1LNC5n4BSx38504OlSwNH5LJdxHBCcYcHVqmdJtkab3eHYDacJTScmKKA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=9BN9GjJDhBgS7lxKKFTwYQ&_nc_oc=AdmR6PLWezIKDzZxHdlfGKMuKgmenOnhqkVNVRVWHIOtkH81FA2VI7qjKorF5ex5MOU&ccb=10-5&oh=00_AfG-CHHAb0TTlVaIvNTbdcIvGY8AeZnBprUlQhH43Tz-Bw&oe=6836B4E8&_nc_sid=201bca	70.419380166667	68.257720944444
2	3096477643997313	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-WyAwRL9ppGpa7_R6bXiCPX3VYIfHC5diFKSCrjZ6z0Zt0a30tumPWPkb24Ls_UMYKwrTG-Ans6rvbhv3rru4IDWl4MrzNA9oVROS-IJON7VKTWytVg97DHJ4CiNhUaPsX29GdhrYtxy-6spxnspI?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=8gYORRBDUAtkk_ko-aMgkA&_nc_oc=Admh6kQLg-9xZM_34hBuBWDptmaVrdvmiNE9SqWZtRT4JtChlTjmxPcPHWBoh7tjNok&ccb=10-5&oh=00_AfFTp4SQpzjYDNh5GN4XeNejDlxvqEnnjiJSiuBhL52ITw&oe=6836BFB4&_nc_sid=201bca	-19.821224699972	-48.732041899972
3	3011578105730235	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-PdyYvhCHCMH4DNoyLwX3mdt2IxSeXzu0thUuU9kns8kW4f4qD6LLDwMhRWYCk5H2ryIEv1l3J3g-ZbD12-gkXe8AdweOPzj58uWwdp2PzK5t5u0f2kAEkI09XEVYVMD-q1iYFnIsDHW-Lm4I60w?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=0p2d4V_zSs0UidG0xDrqQg&_nc_oc=Adl10bmHhd4wknrMw3_viec_OzhQMbYP05va58QnuFuKaqXcVj8pByWLRjKNEIr9A2Q&ccb=10-5&oh=00_AfGRo8cxqOIRSPtTl5YM9Rmzbed8Y18YaAiwVyNFLQkGWQ&oe=68369F0B&_nc_sid=201bca	-2.8905714768889	-79.024113714694
4	1494985077630520	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8ExxuhZqtvjF-aeXHzKsW3dJPhGzCdej2K4553DQdHYC04LX9X_ojoQzO3Lrh6q2avwDC3UxfN2-LT9_oqVHZNpI_lEEzhKr2ESAfkfXf-2vNmFU_nl6XyTFgd9KBj-26YaTZi2lCeigHJhyM6bzo?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=IWVQXaoRpFjYubS91ZgrVw&_nc_oc=AdnyIIQwcFURz4UrZwwGVZ2_M5VB2aVsgLtCRjTQoFuXWGDLfSbtCESrJ6_zXBoVEfg&ccb=10-5&oh=00_AfHJFHHDzhYLJRgTg-1vWAtv-291BpT7ruPOcfqRkQOR2w&oe=6836B626&_nc_sid=201bca	42.8876416292	143.9349506982
5	1981669645313933	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An95nA2mrUgi_2RxSL2XxBNZvLUrEsDOU4nrVnkymlxlaAeO6l4Blpi5QWE1ixC9b-63nuplPmXSmqHcFGD9YsTt2Ypt-ZPRSCTIE8tW4437lYEgkP54AL9eByDe8L-7Ry51t3oqArwvbQB6_eAOBGU?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=3dHX2AJtjpaRy8KvBXPSag&_nc_oc=Adnuwp87JQLiJG7Es5QLb3p0JOl-o7ClUCCKFIvfTrDI4irEL0JQ6QCwVese3L9V7e4&ccb=10-5&oh=00_AfFRAclSo87UrfllvXStXFeD0QuHtwYD31LyJMHMH4d4tg&oe=6836B424&_nc_sid=201bca	29.621261791215	-95.531681918898
6	2105205039638511	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-gML_GvTAeljWAveU4W6gSrM7DfbVw49nFbQdWogqLQL6s3XJpM-TplPb0qUzhLxBZpAx4bbUDyXmjJTe5gy9kam4Y-zO5pJYrTQmzCh5iduXReFNtlptpprdtWa5R8yD42Ae8rZwzHHFydvtnXPI?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=3q1FwRZZzctjGi07QnBDUA&_nc_oc=Adn6Ss9nOdV9S2QkyolHE_pw6d-qIC6MxywYCH1v0XwcNEY-MuDonFa8EJGnU0fnUsA&ccb=10-5&oh=00_AfHSDBTXorYfq1bzAFm3pvfsULl_mpsNvQw7CZ_qZt6yIg&oe=6836C011&_nc_sid=201bca	38.296020699972	-0.6689966
7	3607827259323100	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_EXNjgE2pnC4x1QiqrNm1idbXJuNx7_bTvidjA4ssRPr2uXycxVpOw8Ea867MDvv7wueQhaS0V3bO-O0updcxA3oENukqHJuGVzUjYFU2lfmpf8r7-TSlN1LqsdHDmhZ-8L5WzfsBHunIRhNStbw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=U6kRWFHFfYN64OMGrmiQdw&_nc_oc=AdmcRmQzkJ3qk_cmt7M73iBzvh2dcUeMNSaCGnJ9N3k_qESkG8S5F9Xkl9XYAlMTzhg&ccb=10-5&oh=00_AfE-fAl4QacPgDBxCzdnP3IV8A-Kv7Mm60QBGOnoXGVung&oe=6836A84F&_nc_sid=201bca	35.045719722222	132.29851638889
8	5501860733174111	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_E2gyFSFXvDtlwxysxCxQkJNuY7N61k473C3Q3Hwjp_iKuJSAhk_giJ_bR52yROUZsX_fBTDWV_nXWSBKBZh33rrzLTnmsJq-Zfu55agK0EHltwgMjtOtXmoImgQznb_smHknMbA1Ghz6yQ6Omxw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=HFibRoQ6ij_Knbm-capBXg&_nc_oc=AdkV6DFAN_MFQP6mH4rs_TxInbc2iIU0qJWqXVJQZx1H79WsmFxCUdKfkkf1rKOyK9E&ccb=10-5&oh=00_AfFTzcwiLi0IhrhcRwaeZ-WxlpzTNvBg5CvnoDAhnYGSDw&oe=6836BA26&_nc_sid=201bca	65.507678849605	25.291016396937
9	1608415649352050	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8WcoDPinJgClNxyqzn0MTcK7dG8d_3XWpAQu7ZxL3CpWwO7xLs4V58oYgEX9oqzZHIz6B-8K1fxVhv4WicDZK0xrWdvQE9beq52Dd-qy0kbNjwyyZ6kYpJYdKXM026YJJXeOuQwPYzLyb0Lbk6HA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=5H5Tty22gSnGBzq7Mn1BcA&_nc_oc=AdnaYr_Mo0B24wPnImP5QOzHbQ4OwIqAaiyOf6McF6GHpE2WXS8O-wsrBsO6wiOQWmo&ccb=10-5&oh=00_AfFJdXzj3WqQ2PNu85SmsSPG1uiRdh1M875rrNY5lrzDHw&oe=6836CB69&_nc_sid=201bca	39.369640199972	-6.4565954
10	4428928970480329	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8TgBjkOUSQfo24WePtSEB1rNdKC5taFrDY2ooQiwNYNx6qmDETxxf7QHeBOS7wVsdATr6jYDSyuiEQjVWBxchXuYFyFGpyaAVC63eXu6bU4EDuDgFwhxosn1i3uJ-5AM1QpTIXsvUQiR0ozPMRNA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=U14IPsxKzbBoP76WRsga2g&_nc_oc=AdmoKc1Qd2gOwO3FZvi7wRipG5QnX4csO0Gz__WxY-3sz74Afh2I07ZKbE8C-o7E5J4&ccb=10-5&oh=00_AfHcD9hygvvSU6r9jDfVXtDmTAlhP0x9D4Y2LhZvYsCSmg&oe=6836AC69&_nc_sid=201bca	34.069461423008	134.09536726304
11	3866818896750502	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8D8X_fVMV_X9eISFYZQA6zIZ2hpLe5lFSBdSK0uH2M1ZTEOZYM1PQiNzNsVKBjhOoMD7t0WHwLRoQzt_Lh6mCG488QkhmYK3gGgSik6b4N_402Owt0u_H3WDdOIocCAFnYKC1ctJaoifDnBQuU6AY?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=64XVMxVGf4meSO2nOUTkMw&_nc_oc=AdmNQTY-cgPy0n5zO7h6HsI24eC8wmR3iZEoEDpJtiwXIe6ihUNR-n9QYsnj2Y8MboI&ccb=10-5&oh=00_AfEaIvfzg3skawobI9jUZC-yp__3lX5fNsIyx9r-CY60Jw&oe=6836A693&_nc_sid=201bca	-19.915186878122	138.2431704667
12	4898834353550064	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8lwv5gYNeYidQfQSGvEpp5UZO4JAnSwyIkRVC6rkAHA___V-3C1onWxWo0Syb_51mii6geIIjL3NON0X2xJZ8bi0Cpg1rjK6v03BwC9pMQSX9oxmCcuycWIfXygrZiHaw2ZE3WdFfkQ9bnuyl71Q?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Eb5K3uUst6_GgJrFE9-Pjw&_nc_oc=AdkQfRz2KDA9ovjZMt5QPKyoOAX3KK0AjXSE3GZePeKVySAce9zSS6jfmHiRurvAwcQ&ccb=10-5&oh=00_AfHCJOn85u0DQrlPhZm-ciTVgAvXvCANCrz1vBhA3OsOHQ&oe=6836A4E9&_nc_sid=201bca	52.992235877598	-119.014793806
13	842012783639078	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-nYbt8vGfqfJc3ONJ-32Xcn6WIqzXSoFWDsc4uMRAMlA6ziUC5CKnu5elFJT3DOqcFSXx5NUDplL9A2VW2g3ATq0dp-LpTrXEsKAJgJh_iX6WcfxFWWZeb3OgxHN4at6ktkQmst4srPY8VJ0QTIg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=6FmWuZ3C5J8dAG8N0q1YIA&_nc_oc=AdnzBmxweYN1-PBEueO64XbSDDQp1niyTdA0deLTrWMnL5vEDolpX2cWSw3pLiA5zV8&ccb=10-5&oh=00_AfHf4TliU4OEeqLJYhK04k5gNZix_pYW6RcQMZRLF3WJkQ&oe=6836B3DE&_nc_sid=201bca	41.252872100002	81.4162896
14	3037933869793274	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8_GrxMCT5tPlMPb5GHN0ChPUT3eSZPQOgJWwonJzsGLUtcY-vzNKOHojmYbWMe9XFv0NLatFAyXB6eSrURsW2U0chqX95DtUgr1JA5Pslam8L7OzkfG-spAcbvtjdDSBMdnkTC1mRO1uwnOwXMSw?stp=s1024x471&edm=AOnQwmMEAAAA&_nc_gid=VV5lNF5GB6k0LZ-GyJd6Sw&_nc_oc=AdnnJ6ZeSjBvUgkC_rZocEgHaX_xwYmicSpDWm4tYh7931vTe56lEpoYLv7hbP1BZ6g&ccb=10-5&oh=00_AfE7rqUiYuO0U-e1zaojiVG_ukGj1XaqMPL_VFePB55Ilg&oe=6836B39A&_nc_sid=201bca	-16.345391203134	-43.674954892972
15	4876888325870056	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An96m1civH9NE3HdW45hUGz3H2AJKzMJ_xjkcvBTEJqI9j6r4ZkMTFaLzXh5px5oQBD9tXrydcS6ammmKykQwmT86csoiHfhZKoum506yoap8gxM9Gh1-y-9p4mjPa-d7hL7Fpxg7H3zu1u_8OPfrA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=xHY3WJu6AriT_T4zMlgPQg&_nc_oc=AdmnjcB67x4k5cViIrNawQsh91q-6NiyDXClQVPu6JYlmVwk2jssvPPgmFSmbKRCY5Q&ccb=10-5&oh=00_AfEmZuhJiY7HvembaL4oMuW9WPyylDXfogfnBoUjEpBIpQ&oe=6836B59A&_nc_sid=201bca	42.881433857684	-93.350393590339
16	1725842250950230	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-gBDLITPuA_kiPwiAbon9NpM4V-VtcNay9SiXZNoUPvtCM6C_HGOPzCMUl563YbGL1yFiJXektTN0ifymiOJOJ5grrGVK9hEke6jMI_tBXMiBxRL8gF6oKSetBZAOXKReOH5RvqNRgkKakGTVPdxQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=ss0OltlbjKKLt4ctWmDFpA&_nc_oc=Adl8lysWDRJNo-_2dlC8A1t6EvUZrdFYUcvkAdLixK15cq7YTBaaZwTogSpP1IwQ93U&ccb=10-5&oh=00_AfH3pGPRAy_jKrpil6iTw3Vyr-5yU08ALvsJQjQH7fHl_Q&oe=6836B289&_nc_sid=201bca	2.1388355456313	25.348605550849
17	1672579510202581	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_U_kLQgxj8EEPRKQh5C80yqtv4re1y32C-Zkhpal6exTbJCQ_u5CPi4Cz0Nkdgm2aRj2OFo2_g4Lr5OjTGYY43TGbo60im7hKG8EYnX7gJaojQWebUYPmSEiLzrTW00Lv_YyjYo9R1DoaR7weVCQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=YusDD9kKlnZ1iK2QsdYRfg&_nc_oc=AdkczBQnDPh8_brQQmFiH-k_VMKOBEo2J2gUdHipLC_s8hDx9Ub0u2t-KBKZ0nCJaVQ&ccb=10-5&oh=00_AfEHKCjm5QLMC3s77Nve814DT8sHzSNbd0qi32JHeW41BQ&oe=6836A59D&_nc_sid=201bca	59.3776599	17.033534
18	369076172750613	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9kYVY_dpbCVsvg0c9OiwIedpAa8F3hJb5vtDKFQkO3XYibZExfRu_x8AY0URH1E3ejJ_GDaZYl3uPgGjHBIZd9eAQb7kob5Lt0m37_b-b6S8QAQOwAxcPW5qWGNrBLeMf9k905X57XI40KuE20Kg?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=Zj3rm-X-Y7y76nAAfrljfA&_nc_oc=AdmSd8lmwD0DDW10Tlz4pI8m5JBpt1XpFR4-LomZe2B7IpwBnlpBq8SWxT16JrGgNh8&ccb=10-5&oh=00_AfG6V-R6wWuNRP9ldya_93XCaIMfCdN8k2wXNUkWs-0qRA&oe=6836AC7E&_nc_sid=201bca	79.4236111	63.9858333
19	3041717809382382	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8vT0FsFqI79hBErPG1gINy4P4XXcL8feaXR9u45Mz5vkVBFofWBRj6Q8IcWhINbjn3EVb4UbD0DpnLhgH9HvDW3zJ-0pQxBzEE8shFmNA1z1681DOa4EEDgWuRB2EW1Ms4oQWZCBUg9m0hVy9PnQ?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=iLdEgPVeY8u1W81NigILdg&_nc_oc=AdnkzNPW4ymXPfpPlVCow5gDG-GE1vw58Hh75WsDkmZqyr04BEr59s11YiCVfb8EmrM&ccb=10-5&oh=00_AfHBpt-VZ-6jPuG3G1ezCzPpCs7r0Rh3jDeRiOBPS8zYaA&oe=6836A715&_nc_sid=201bca	40.530954170134	-100.6490355126
20	949733543513834	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8KpuwchayUOAN4yIPuJmZcwpW-HzBxFkcy6kK364C3yjOemy2jekK3_M3_nWPOUOaS1J1s41N6jScu-cRJrJBQ5mssIGVFBARWZIrfKHzbTMRcTmIw7h4PoR3uX6kxUNag85UJv-J5QhqVt7lMfQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=JaGRWmyFo_31LZO2KCEHXA&_nc_oc=Adn2zXPkjfjwlcmwHeBRcfH5Dskq2sTx7dFSQ944kj3xSSA6LfZiMQjoJrR6uJFUO6U&ccb=10-5&oh=00_AfGjQ3dQlFDBaovIk6j-Qtsxa3Ub30Xz6o10COeJMNa76A&oe=6836A9FD&_nc_sid=201bca	29.1968023	131.4829315
21	289384429323942	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-714b9KnTWXctB9PAhdm8bm2Ow3iVFR_hVv9q_bekNIV71Ko13BitdNlgaiTN-AT9dRzHw098f4rJUMGDAbYx3z9GWdSlGzi4nD30LmuMgKX0vVqmvFWHy4j4AfpgwWNHrja_DaXvMKAC9SxXKeg?stp=s1024x759&edm=AOnQwmMEAAAA&_nc_gid=FMOrrCh7PuEavAQedsBG3g&_nc_oc=AdlpQKYv6HBWbp_oUNCdCgmICMrBge0X-hc57xBEMdNjYPZAXY3WLLPTqAgMgK73Pdk&ccb=10-5&oh=00_AfFmbkVJg6QseLlH0z99rUv07oiMjCoh5T_q-rlwdNyUdw&oe=6836B137&_nc_sid=201bca	52.715619405259	78.697126413362
22	1809604876184749	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-Bv-Eadb16L5ISWtgplXE3jObpPMx7VCM1i-j4tn0oYMDlgTaTlKAXMAYd7OGNPZvFzfZmAuuhuhHifjvVMQjtlyNtHuyk5-nSE1PhDQc8H7VIKYk2t0f5nsmUBVCHVl8ugv8KwgWwBOygNk9abA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=1vb-r_EqfCbEQPDrGzXVIw&_nc_oc=AdmZ5WG-5RgOQRX1n7Yi49FxO1g4n-6MHzC_F39H_YvKCq1IYqitQxkSrtTggqAFwTw&ccb=10-5&oh=00_AfFmhSilYGjVR6QvwwkdC9L2zs4Hd_H9wnneoGsZubme0g&oe=6836AD96&_nc_sid=201bca	-17.478716599998	-60.6833932
23	1615958955263761	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9aZKQMztwDcaTcDrnoDYGx2Eaq9pdDYWe5Gm9fshc3eoXxmO89oVPgSyDmLM7wqbKVqw1m-Tk3E7HKjx8vM6rbblVCH0CbUr5YOSJZzUo1f1kPAxoYRS514BqOPB5SkguJyZf-suhd_TqnHtefUg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=aoTGvH2bRQP0QPwBYrBWNw&_nc_oc=AdmGUJaYW6qVFg-giZ3gXTvoN7MDDi2B9n3b6HZjtADDJ84atI66eBdGVG6aB1FkIeo&ccb=10-5&oh=00_AfFp9kj_omNCEEZhsS-QhEetLS2FukqPen3UT-knvD8uSA&oe=6836B54D&_nc_sid=201bca	-19.613326192871	14.453380949901
24	832972244297812	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-_jpXprmPdccQ7NVk5V9J3EJORT8Zbir1IethrMPlvJJyWxCjMJYjSKsPOGeSL1NWns-fWRgltyeUpZ-2wRxiPw91Ezi3ir5CInNVZYMs4FwhVee6QQZrm4E8NBL6E6i36JaLweX_TZpVQRpfLKA?stp=s1024x640&edm=AOnQwmMEAAAA&_nc_gid=hwweo-l2_vXsJ9ko8p7hEQ&_nc_oc=AdmFa_BAhSx2nYm-dPuX4dLwaUuTRD35HP-0bFF7wDXT9naqYY1YvAKe7yEeSFltL_U&ccb=10-5&oh=00_AfEgIGYF3iYjhdOc0wnuxnRbmefNL7S_f11UfHvIv-N0qg&oe=6836A8CD&_nc_sid=201bca	54	-94
25	988345958848309	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-1mJrj82MaF9rRGtWDy8xGsOGpixi4U3GWRTiD6JIe18Ehb7l0BarvgzDm3BUEt34IbAZHdZdaN8m6IyGEDZOAqyRII_pFCfUPT3SgMdm-lzkFWLj2KIP_EfbsV8bnpz4TI9pFNDnSXnc8UF0N-sA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=zgvPObS1RZ4WkRfUq4vIwA&_nc_oc=AdnoIqPpdYR_1Erlkc8AZUVyldDv9HMAOBIY3m1UZUcGoJRulLSvWr5XRd8pZKD_61k&ccb=10-5&oh=00_AfFco4cQ8xkl6UYGcTVOiuDpLrE9vRZPIBKR112v4Sslug&oe=6836C1B2&_nc_sid=201bca	-29.314698	-68.2230606
26	889747558249490	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_kqOPa_qXhn5iMCc72GrjVrFeK5Gej1Tn_qUvDvucIlVpTx2SVU0ZZrWgZtLPnmhjzU8gDZEsiXfffUbRvvEjaqo2SoY0Al9a2Ckh3_nO5r2CjBQC3JPXR5qiBzDBmpD9l5L9XOTgFUFw2luMqMfM?stp=s1024x684&edm=AOnQwmMEAAAA&_nc_gid=RbbKGLo688mI01xf6n4RtQ&_nc_oc=Adn9Pea6uEUi6CbL-TRqRbMLhznswQ7ZLOFLgO8bvwyc1FQ4ejP44AY1CZ3IWPQyGZ4&ccb=10-5&oh=00_AfFFeYUVn0zMvXVogUfpszH_G0tObJzIybhhqIhSQMZTcA&oe=6836B6BD&_nc_sid=201bca	62.514824944444	-114.83982494444
27	551673840460426	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9ZEil2ooE4MWGzpOT_vekhCrbqpeuH_qpE6SteWivlILugK0JnZglrsHTK4cnu1XtI_hZMwTAqMvU1A7HfnToeFhte5rMw1tLiT2qhQFVMiDHFtOMBMANkfRAZ1tF93oh4ALRcAef-zpIodLDbmA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=85APi8EqtfGAzF0YYI-PFg&_nc_oc=Adk7aWXg8G_IuSuixwalfieJtQ0qUFxkFdL_Js0fvYHgP_sQ5ImMkm_DbpD_tWCN5eg&ccb=10-5&oh=00_AfFxouNGuFf_gx70dxJw7zC-Kusi-c6CX904eLtt2_ULQw&oe=6836B8D4&_nc_sid=201bca	-17.916227100003	-57.471299899997
28	1113360265854635	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_z7EyNugDVQ8At7KeKMHPCr_6duD6FmI92k0kF_G_hVyyBVTs-gjTr7_5Q2KN0V5E7q-WI7okA8duU5NciRpVaoMCdagsyfyPQfFmOuYWbGWWXniWE9Qmh8Viv55I6enVIhSkxttFOBX2eJWQUBTA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=cqXjK_N3m9wjTYv6aEbbCg&_nc_oc=AdnE5neWTEP3LEgJYwIHe1SvyZbP9qTugHaV1Cyc53JrciV8m1zCc9dwyewIcHT3MLw&ccb=10-5&oh=00_AfH-2tW4uD0fN9n3oC3wHW3BIzXTVScGYiFKBUviRQnWrg&oe=6836B66D&_nc_sid=201bca	48.122868333333	119.75084
29	2942281702651113	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-VJtMUwfjSOuUUovJ94iVmfwVVMjFb9Ouhu7x5NA8EEd9rSGePPJu0ch6WDcy3N08oj3Hz15m11bj5ofvE_2bV_YWdKEPAnzYwlK856EzsXA6ynSXfbrrCnFzYkFYi-wIRg6lSIHYELZ5EocYjuA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=TLEL8z6kieJl1Q0MNhaWQQ&_nc_oc=Adkl4W--aIBNAzFsci6QaJpX8sltmYM0UOX8AvpE2d6Q9rVnWNEDqmUT8nLhtI6jdHs&ccb=10-5&oh=00_AfHXivsrfrHPcjYjuAhIePiW9EZzaR35g4oUQGth1kofQg&oe=68369FBA&_nc_sid=201bca	23.011098055556	79.890586388889
30	2840258549583618	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-1Ndc6IHFkTUKoeWGHU8XG5Hk4kHJ8pXOf_lfxtP4l1A0jLvLJQI8x-TdQ6hLBnxjk_TO3BZ7Zvl5sogHl2k9nucwL-_8TCK5n1bv5E3nuhVwGM_0QPtG2h9D3Nz8EnXV0hPnn_2nGeH7BdUjd6A?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=91LtGTa0o0bN4t0mAGI4_Q&_nc_oc=AdneXFI3x8QH5idA8euc7jK7XubIDuURBtWNPRlILLx8gsoiCT6ZYaaKm4EoA2c6M-I&ccb=10-5&oh=00_AfGHto4Z_vTH6_58ejnSJ5WN4rwMcDfly51XbpyQ0XozQg&oe=6836B9A5&_nc_sid=201bca	44.022621785	22.930442103327
31	1700013893522906	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9-l1R-LNBVnqZucTQdTKnVMkRCNan8tYAoeXMYFfCXiAOngqPZdnIDhAa3uTS32Uq-T7JfVexntWzRyy165Xyn1yAYdZ5F2qX6TW_Nyr4U7QdQCXztv1SHjjjnoByvG4sqNzjCYpMNm-MJerlZuko?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=TjHSzEgwBU9yH7W57RU0yg&_nc_oc=AdlVbQ-BvPzguB9IvXx8kR0GgiMFxg0LO3ZEYLlf2o0rZYuZlU5Zj5ne12aufwkBYTk&ccb=10-5&oh=00_AfHTAOSl4NIun5NgXq70bRJQdmYcXO3l93GJWGEqXXmHvA&oe=6836A999&_nc_sid=201bca	46.4918339064	43.7724491404
32	1134259485155179	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_AzMQE1vDQim6JIrz0hvRyByYpncZtCFTTjOEWprpLgqmd_vEMsrAnns0ZPnb2_XCmu_yymVF075EKF4Dsi3ZfU0gDSY-D_knIy8GkXvyO8F2OuCLty_BRJzGuuLNm8cuzTfueKcNUHXNGfuRozcqk?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=5ZVJJBXJ7UOfY0NCOcOEbg&_nc_oc=AdmZZpTJexwUEZm9oC2PEEz1K1fOwbuxsJ6-SP98vWQpPlUKAOdAxzRuRO1cqQA5wck&ccb=10-5&oh=00_AfEeDUSYyh5ofMdOnPOxxwUPHQDLVVM2hdZ4Zso64D0BPw&oe=6836B032&_nc_sid=201bca	-8.4787874	119.897166
33	7296985077028167	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9c8qjMWfVOYYPcliqM0DkYs5Ey83EfUACA10MQRWURXYxgD4jrx9VfituV2LSGP5rbAj1SDmMogRsF4o352wJ5iM61iZ7XV73OVpDGkTT6fA7hHqI0t1RjmAj3S2ZXXM4R93FkOUOOJAA29KbpzRg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Pkf7ncHnttnTheY5CohdBw&_nc_oc=Adk5X7pKDZOUpP2Xvbeg5IvGiUJCv3b2xd5ei6Jgq0K7ZlUkR1czSodxypCLr0n-frk&ccb=10-5&oh=00_AfGL3l1m7jTEFqW5We-L9_zPZDcmXQdW1R0YwugQNFrMyA&oe=6836B367&_nc_sid=201bca	36.611124700001	4.3099418
34	1735111273337787	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8vKJQsCAAW4rowVmxW8yo2Yn408qz2YNffAnJ-gcvVXd7FTa5eKgX-9BOoHOt5ydUmv0C33MWDKzcNSNIZzlS2AqgQjtZfLMZkGytZfwkudc2eQ1p97Au2ZM8CM6AzBOUAfIq3OBa2oEg6Cqi-mg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=4JiVmniF8pDZXcRYIxvA6Q&_nc_oc=AdnrPMwJFYkY99rT42FvC1Z2Cig0LcamHyCKnKuooP75miPOo1WxzQAVYevIXEpZXZ4&ccb=10-5&oh=00_AfEWOfsPdfuoB7m4UHb6hkWWK6AURbzFS3fo8PhMrLX6RQ&oe=6836AB92&_nc_sid=201bca	38.035798809273	-81.362446726408
35	5475631445840953	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An95b8PAYtPwNkvKfd3bdVzGIs7iEwZQ81jNI_CrBwUEvAfrUu3xhB7b6uIbu_ELtCchvB0lGxGzgiUeSyDyuLx_bBvM813LIKUFQ61DvDkCNJ-3D29TIUIzDPFR5XkqK4k500kSGi-jWPM4XLSx0Q?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=UOQJkB6eKp_5yd0lKvj11A&_nc_oc=AdlUnc5DvfP24gtTXrvSVPeK7szWQmvTtmEbZIODvTJ3NBBlToixqIZb2JfYpHsU9uU&ccb=10-5&oh=00_AfEqR3Q0llAT4t96uT3adX2__Trm0KalPk0ilcCb8awqAg&oe=6836C21C&_nc_sid=201bca	-33.93692644726	115.07973992734
36	1574450703259402	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-_gVBW-kIdXrcQPO0F5mSE09-NDaAmxtq-9JcBE8bqGUQo6EaXXMpbaiD2PXnTgTMKe2tygLnh6z0e4iMZA-Q2GX84R76-M945vGp5M7t25FEuk75r0mPEoZw6yq2yvTE2JzfnZj9Ge-MK_A0nmi4?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=pa0tjXjhX-GJFdLhkAAmEg&_nc_oc=Adk4Q2XBOaMi8IKevyGu1i382Q6fU1HkQQfbQ8PO5EF8lhJVW9I_fa15WH5G_RtTOzc&ccb=10-5&oh=00_AfE2wwfvyb5CANUvbeap6DLhVHGuDN1zS5FYCYK64fwRGQ&oe=6836A201&_nc_sid=201bca	41.74734168	-107.58561098
37	1891358007696405	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-d_6b-Yn9iFj6OzbMCCpC6U17gqXvbSzm-qOlRaHPnICJ55WxGWEoavkd1LylKxOUiFN_eeGcalTnrWmslfCVGdeTkQDaTV8NeSncVQJxJNRHIH7iIAghmfmCW-bh5tZd4SI01WpqooPZ2W27XFw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=SOa3UibMGYsCwmNnyljeLQ&_nc_oc=AdlaRWElhlyI8yKgfRrMuvrZz101Y4BG3BlCKOmd4vtvvAJTvKQ3c_mUW55q9FtiCKA&ccb=10-5&oh=00_AfGeVtrtFktAeFle2YCyfwkoC3ccDlc06ZUW1LYou2_F_Q&oe=6836C8BC&_nc_sid=201bca	11.74651	79.367853333306
38	2727536944047994	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_bAVpzl11CICZfEG7fET4bg9oqZKud7ay1l_p80KMRl7O2hAqemc9X_dolYBKOjnIZ5Tq-tXshwPd_4ba737KzMR5dTrhL5gbzQujXaw3hXFcHBVhLs1mcAY063ftEojjKfoiH_SWlHfGghzASBw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=0jCTRemYX-pQvcP1Jrg22g&_nc_oc=Admi4lEFOzv3dkND6VJ7w-r3cFWweE0x0Rq_QeJHxljPnZoDJgg5GHGxjFz6hdfN2vQ&ccb=10-5&oh=00_AfH-XKGmmvO-FSd9rD3Jz4x_yjK-uOp_cMkraiVue4jojg&oe=6836A21C&_nc_sid=201bca	48.990470377604	-95.370638020833
39	5229756623818538	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-quBH-GlSwnZA_F27qY9eESXT1aj8l2ejMp--68LXqytBl4OqRyUyQqasU7Qp6fQ5bp9KcW5-IdEXBugw2C14M0GuVxSNjSxa70r59Uk656sH_Rk8gURLxFR6gTZSdXjx1T8xmUfNc9B7hCpMuhJo?stp=s1024x494&edm=AOnQwmMEAAAA&_nc_gid=2UA2_5tifbojIpzd6lQPUA&_nc_oc=Adm8quNdK4b1rPJumCgLAe0ggfeqdjh79o58yL7p8uN1G65tGyHji-ThcBTtO2q4gx8&ccb=10-5&oh=00_AfFeYiX1SW2jmFYx9AVmF5LDFVFSUApXgwf4Y0yyfMf4kQ&oe=6836CEB5&_nc_sid=201bca	18.4638004	122.1666752
40	5348258121914465	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9xoLzxVtb4sUK1i0A5UEmaLM5JEUhsoQ2lCKamAQt6QITPvWtJpKAK-m5hf20iQcEk1TKhTdYek-AyS9k9-jIeewmRuas2JqfHihOdq2pkUI0uhIy0vbxxpI1mOP7F0f49w0pvy33TBayHmUOBbg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=yOqpFjIohaJ2zFJm2nKisg&_nc_oc=AdlEuOh1Z-2sHr0AOrvlWjzbz2B1RtCNBpTBSqasyzTxMH4CR01dElS-o3ndgfr8EzM&ccb=10-5&oh=00_AfEzDkE0r4iQA-Ho3FhfsJR6uayDvBeffxfC_8btgdPpgw&oe=6836D61B&_nc_sid=201bca	7.8736464075025	34.33683764304
41	1457229737954226	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-8bTNu-NJHKUCnJKK-Ao41Gz3uW4CfNbNuIiAWbgqCgplkptokXPNQLbKZSoidLHvMIiDncklCG1BuDMxjt02ppvYqRbjjLE6hInu3mmxewSIQDtqq6z-eu_s49W1r5J2hgizkuNKAMMcdMWMG4A?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=Y2sqVJhcdpiUxw9iFUWC9Q&_nc_oc=AdlycO6CxQRW5mDexvBRjlQaRZST4QRbrIdl_yA8ZZcUWNVr-lhTnpdpkrB3PQMgYFY&ccb=10-5&oh=00_AfHLQhXhwFNefdMNyFc0s6SuRTcfDZ7SX7r0KmZtBol0Yw&oe=6836B877&_nc_sid=201bca	-7.0656636666671	22.031568833334
42	1859202474263246	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_95eBKhD4IuSktvBux7ixM16tWxDtjeHGbKA5Mqm1vDDO9bmJ8ecGs4iFUAcO45feIEN_McGpnlklYZn0w7R3pj-iek8wsBq0E-2KhmCJHZsA6PCmOjdaDna2YSMwclMsuXcQEPWO8DUqTyh-tTTM?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=RmE1fFyy5U7ORaHah6NPdA&_nc_oc=Adlr9FCJlrQ74gGDbxbbWJehoSUhYVYIm3i1G5ahuzzqNoFDz3I59DTqFvovfWph2Eg&ccb=10-5&oh=00_AfEbNo94S1Q6Lr0VxR-CByd1L8fSynEqVr0SPQqvfEjftw&oe=6836B1CF&_nc_sid=201bca	67.224392264617	19.262820720065
43	8697555446936711	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8e0cXCPEXDtKTIfpRAiJ61WscoAaPePZdUINltfIcAbKrAvhRZg2amGSFHHuy3xviPCStRsrMSOAuRDAHnmMucv3rO-4hOE98eK0olIRnXHtnz6eSSyrc9mBeTlXqKx-he9mkKz24UhrufmHjCCg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=dRruxaX5jL2jVEVI_eHVqQ&_nc_oc=Adk6PgEXgUdpXJ0I5d3XjZdpb9sBQ6rnt4tLZSXQDJYkYcVybDm2jEWOWb2X5YqVJeI&ccb=10-5&oh=00_AfGWYZKqSpvikJNIeBTS_csku5f84p14-h-p7EWhJ98PDg&oe=6836C8BF&_nc_sid=201bca	18.804294586182	-99.226303100586
44	3027041544287754	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9UDwVhHqOpAC6x8NumafIGpR3PxG9Gwx1lylB5fA2sAMsS1bPUNTvzZwmPaYrA03edxKcPAlHcGOyo1prOgwLRe4S1BGOvV073gLUxHrOhnb2ORncV4nCPpG5b7AjSZecea4x2FooW8_Q909uI1Q?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=A-0g4qW_XwolBTfb4iircQ&_nc_oc=AdlOjpfnsmpEnz7ZmNDzWkPfBGA1wC1LDSBfue4DpE2sVvt8Ld53826Knyp9E19O_Xc&ccb=10-5&oh=00_AfE9D_dPTChK-fORgJ2Unne2Szv7-BbzqEtINtVWMUUrTg&oe=6836CD5A&_nc_sid=201bca	60.91931948949	61.4914963966
46	3585595268331967	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8Z4vI3rjK42uPnrEV-gvonrl-MF4AN4RHqEj3JNiAt_QNK17iF00Irl2DSdsvXHlxvmgN9cMvRqTQI3mdlCqWBqU-jvbtbofl5fvTWfXXq8tG-xEgfA4VnZSSOnM7Q8Us2_6wxa39wIH6nEbKR4w?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=nCnHD3TETKxfR6dHp7OKtg&_nc_oc=AdmiT6HuJVP_3zseJ-FBywi7EDuITd7Ow_bCWYUky5IUuEQorp69UMdtlmGiz4prw_I&ccb=10-5&oh=00_AfGmSbXs3oQu2xNG-wOwfQ9afcFu2EilNdLhZE5hiMG_Rw&oe=6836B089&_nc_sid=201bca	-41.0696716	-73.3160413
47	2983240025243102	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9SI0wB96TYzZ1FH92pJOx0uq6NqeOevIjdRgI6PcjyQAhFlOcaoPxeYVJbo8_hwR6KxBKustHdN5nUVba1iyic5RFDviFuHkwcsnbvRXea7QvoHyhFr79JrSExx-o94RRh47pnGWX0AgO6XRrvnQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=nPLjLiEHwGTurjEE0rA8IA&_nc_oc=AdkVNfCBrcBw7mQR6f85W3_cyLzMQ10RiAmTHXClEVRu9sOqExw-c2cF0c17_oU9fgQ&ccb=10-5&oh=00_AfFmxooqdANRdEgNyQ6Lpq8_2vgzWzGS_LBIDtkxFnPsqg&oe=6836B2B0&_nc_sid=201bca	46.954291960199	61.532755108955
48	1120648935080987	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8EvYqTYnRL7pefqo-g2-vQeRHtGIq3Fp96FrLdAildxsXpvrWQ0s4zxfGbgFhmlwcqqelwMHW9b2Y2ZY48XDXY_DFjgXNfs0zwdHPF2Kx_5j8_V3ZJXw6CArCFZ_bz76nh_xq4XaxZHxYyqjmZbw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=0ccYOEZMNG764_BCz7F88Q&_nc_oc=Adm4UycrUL8PvkejXPv5fUiV9yQWCs4KH1xoQ120B62UkVPxKdusxCP7DnsqlhFm1ik&ccb=10-5&oh=00_AfGIcdRWEoXaLn28t1qo5cpwmsaFhUYct9HJj4CTYcCc-g&oe=6836AE4B&_nc_sid=201bca	-4.1415153723249	37.764804884827
49	1459231801231531	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_hWkM0BB9uOCUI8WRvgtjK6UwE2CL85KUzTJE0fFRRDLK5RW_aYP-V8kAuI0zm5SIonzKLJ60P1QdGuHVCcCbn0avR2SWAKZbStPkgp3NGL-JumRQMX1nd1JvOtOIHofQDl7TRdqEmu-nmbZ_N268?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=4k8scuPq_6sPzdjHe8-kmw&_nc_oc=AdnetPm_zcBIp25jAVTYNZwkSCpDZDq5NKhvIUc3viIopryDFf-dMTWrw-1vUi_35RI&ccb=10-5&oh=00_AfHO6iSqnMAgwuO1Zb97egfwOK6nEN5bcEPA7bPyYYWYFA&oe=6836C072&_nc_sid=201bca	28.622581100002	75.379464699998
50	1709812842563035	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8JP5wG2cWTSvMcGKuqPW7Hl6kVt4qO_-9c2vJ_jdzrOClSh5Hxg4euJbmEwckNUIf8rXa98DXWtc7MCq7kAJb5RPLnzGG7B70Sdc9baafj7RBIxIusEGycjCSw_8cfhF0Vq_-gpstDibL_V1dqEw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=ZfO2DA22-SG0TZdA7tm9sA&_nc_oc=AdnqP3w11oNjfTgYzY7zmaYnOu054gWZ6NZspMc94GctKKPAuT0bttblLa5ATr78aVo&ccb=10-5&oh=00_AfHtlZXc1x81Sq9C4CMCiFUSOUN8JOvKIuOESnKxrHaNsA&oe=6836BF05&_nc_sid=201bca	43.087938243781	40.776934358209
51	2320258188320508	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-7DhFLRu0_hWU5FJsReqZCHcPf-B2mZuZUJt9aYUxoSO--wQRco4j4t6rrCZ5cZB7xhpC-Gf7VSm8gtqlStAE--mi5VSmjrhuHj0Clokg9KMQKRzuRcGpzNeav6aeITQeYme5KzVpSlIG6npJALw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=0DvJ21cKJiiCgyQnZSuSGQ&_nc_oc=Adm-2j-rs_XLLAkSWsCzv2aZt2M76tBU69nwCmMHuFdl5ILE_glVs4WAJnSfCR8z3pg&ccb=10-5&oh=00_AfEalQgrgHyM2Sf9R1PlWUUihhLX4hYtx0G7gfYCOOuWgw&oe=6836CA85&_nc_sid=201bca	-3.25347	142.63229
52	4372007126150857	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-YJDyczQahWcR2xu6JU45pKtMcCf9f3In6yhJ44tE5E5yrOONnh9bsBtddYXKiIBwJAcf73Fb1zc14QODM9s0bDQ_2HBHF5CesQPmdHFN6Pg5NX-Z0i33YZjQqA8M4YV8iJYyqYeXFaamorAvP85E?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=18wK7H3iDMFKB2blGqFDgw&_nc_oc=AdmQhUNGnTuzko9jEph1pOjnlwnfN1YPbwS4qjjQIDDz_nsZoiCuOUW4q0cOENYpAeg&ccb=10-5&oh=00_AfEHHYbZxkeVSOUZZA6ptRzBZTh_RwzWydCUZjdOkBuyng&oe=6836BFED&_nc_sid=201bca	51.315351999972	4.4702774999722
53	1416494445371646	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-Ask4Vuv53wEsyNXeffjUwC9KMMeAY0T6N78FuUdPhh53eJ-lfqtpxpbzjxIX7ool1Z8audwJdbyhkKGlx0SQZq97-kjCMN8hvDG-O_UT-WIj15g91rhw3KSAWkRPeElhBamOFIKAWzKTG3Lu8sw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=2uIGAgYkdENfVzfoVNF1KA&_nc_oc=AdngKZLF4JNHCW7NbaXBZTKUFzW57kQvWcnrGcqISPkc9yP3U6f5tylhxl6hkkUbEqQ&ccb=10-5&oh=00_AfHs25QQslQ-dC5vqwUlE1rKLB5JrdFxScTBhEjR5mf_gQ&oe=6836BC5A&_nc_sid=201bca	9.4203407000013	40.9618448
54	1772105739642812	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8tjRMLaPS42Ko1LSbAgMO_KlSTgX6E3XguT2a4EM26okJ2kQfee2G3OQ0QoGEgLYJ0935fvuI_shlQMEtyt9PvhLf6eDGCRdbDZ7BvEPdou6omK_Ej0VKkrh-1gmoQNtN7m1QP3kfwnOKHIBvhoDA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=SmvRWUoLY6eps6b3jvGJRg&_nc_oc=AdnwdtYKmGXbSeA-BzOjvvfGp-1XWpbpt7ldphfQ38PCkudgZRx2CPKuLpQz4BQLlls&ccb=10-5&oh=00_AfEx2FR7wEmmgCErL5NuO0Wy0v3tcouB5QmDpAc-dsTjKA&oe=6836BF02&_nc_sid=201bca	-35.828402777778	150.21741111111
55	2425473934470694	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_yW9SNqoTQSuTilUhHJde9E16xP21FtigmiknOBzN9gmYhtWO_oGbL4hsqFzedw-Jn7zFDvV41vID_ArvvdBt1EAjEKu9lLGbHsh9YwT8Xfg09fVbKQDejHYhutbETg6rEekU7Vr_Yvf9Xuz8x2cw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=E4UjWRGoVgeQuK7NwbkQNQ&_nc_oc=AdnmBXaBpRgaFHzdb_8aIUi-02cAQekMzZmey3KX7Ic7Apwn5AaQI2gLDsGK8SQnOiE&ccb=10-5&oh=00_AfHpWzsljDuHgT67Bihd93RrrUwNBRpCrMEl-g5pkmB7jA&oe=6836ADEF&_nc_sid=201bca	9.1002809	-79.3290153
56	3016252968595230	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8SwsRDKk3m-9-a0Hx_3crMxXXbwiaiPJwW1tltIiUNdwMz4E5_cOx-SNo1Lex5JCev655E8TuJKTPjITjzWC2bqlQkQwYsnXutL0YMndSADeWc9pwvEUQ_BcNilyseP4KofgmznFjHCBI4Da5z0w?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=q9lJWBl26zx9GmMMKVOfNA&_nc_oc=AdmwJ_2zrotzEpRp3pdyyUtgD1Qv_KG2h-zqx_3byOY5aYu8Idn1_CS_SpeA-EzYR4A&ccb=10-5&oh=00_AfFcY74KLCaIbHEHrOCOjCpY0uhBx5ZZrDNf2ELKcEhPdw&oe=6836BB10&_nc_sid=201bca	36.824489836615	-118.82997605961
57	1707835886090189	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-OPT24xpP__pO5gLYK5XvcPBSB-MWtpzCToo19WSqiWBdqiCBpvsARk6xwXab5sp_zTgY1nhv1FJVCUg7KWeuJeRpV_VHXZxqa6SeVUHaHtDQ459cSQlgcM30wXqPugKMxSFN2bpp695u3T2pMdA?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=RyQHhbzg9P3Ei5SAao8AxQ&_nc_oc=AdnNV7n6fJJscPJVs03cKtGzzRgVXNaCo2m_1rQuYN_kQV7C69KZ-OHVcQql6lryRL0&ccb=10-5&oh=00_AfEqO-tIAaQv7uRIC-qTRDoaVB6ckjP3i_EvY6kX1tERGA&oe=6836C9E4&_nc_sid=201bca	40.386303333333	-105.05847333333
58	1713690742483490	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-F6ohKQLS0Zre5ohc7_QUzxAGzgciPlP-juzAB8yr8OUhv3KYVQpkQVIzkoxx6kVAylTabLGNrUqNzeR0mhEJ7G0fxp8z1QEdrasealF40Q4UtQcelz22otN_qSfDfUS3udRH3lJXUK3gcsC9ZFgA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=WjvZkLtCW6MAGo6wiX3GVQ&_nc_oc=AdnTKghTUKLYXgVfbNl6vU_6otg7T-YRkBE8pN59i7ev6S8VMb_KOz7tHnEVvS9W_gE&ccb=10-5&oh=00_AfE0Jq9s5wMiTxBKugng6Q1nLATVjeBxjyGk3w2tz1fL_Q&oe=6836A87B&_nc_sid=201bca	65.2901753	19.5790983
59	3090896644498511	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-rhw1SRnLT8CfGBD8mwAhrs3PoRTAJ2vxSQXVZLGSfrYSzlts3gvmNRbzA7fOxGWk0pfdhWsSmwnMyudDzmGiE4ssYUsUGnW04S0RBNCXuWKHIqx31Wz5ozP2ItJ1rzOnlQY7B6ixXM9hpfPqWhwU?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=s627kuNLe15zJIIsdE5zDQ&_nc_oc=AdkeJ_8dFJ6dM9DZIe6M77bfeGEN9BfIKj8XMi1-EgS2_c1C8d5kNm6cJMdHTRJ_k8c&ccb=10-5&oh=00_AfGe46XnoixPb-boMFvVtLMWP0creFc8OMfcq814tdZkFQ&oe=6836BD50&_nc_sid=201bca	39.798794	42.5653935
60	3717367738391042	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9_5z3jT2RwCaDk2YW5hrkv23Pr3kfcKY1DbcXMse57MkJUxRQ2c3aE03vU3BZ52uUIzRIwhKdi6hb4CfGSvh7U8IENvEuXJoePTKY9T3CN127rUVhWkYmEWloz1c-QPvVTnXd6rfAUG0w_tpPJsg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=VgL5sLMsU3KcitYBB78jlA&_nc_oc=Adk6jwbTn_ZuzL1ofzjzAmmuhffe-lKxeyYXxqcOuICN0qH7cNPQgpnPawR5JrXh0ik&ccb=10-5&oh=00_AfG2l6h59Bk16w_3okaz5bZqgu4b-hQFAMsIMIh1TvePPA&oe=6836B0F0&_nc_sid=201bca	39.826601388889	47.720223055556
61	2651325285012770	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9ypOG7_dSQIPZT5Kr4AaKTJFPMRiMO9GuWeVi4n72VMp2_mWLidBBVzX4rD-in_-pdGEwlwRG9rfaMdx7HxQJ5AZ1pCbiXcq_zz7CnnAg_GCEWp9LBk4HH87_uFzJukxYyq4iZTt-Nv3OOxdsUUA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=DBlGRN1kP12P4HRJ0dEogg&_nc_oc=AdnqbaXrAMP07h7RYS6J9UGY_C9BFnNWG54P2pufPIIl3Fc0IVMNafxFPYfGWrqz0ok&ccb=10-5&oh=00_AfF1VEjfThAcozbcatLqBMjdfZTRB8BulfhZS-ojoU5VTw&oe=6836B3D9&_nc_sid=201bca	45.139796388889	134.38365472222
62	1833984073655934	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8_yS4_JqhdWCRIcX4UCVc9ePL0F4NskGh_hEIB9obaUxzSkqtEPp580uVTl28UXGjxAXoK6O_3yytWRgsavV6wcKP2SGZ9WuqwQOZK964KiCGE2XfrhzDAsfda7FelEjfRJVzGmyS5JEr2BbqamA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=VYa8XWI32ZrSynfY06vrOA&_nc_oc=AdnX3Y_KikQPJ-A18d1ncB81HliYr4utxj0EyPRysKYRMZrbqj_e7NxbjUH0TFpvJ88&ccb=10-5&oh=00_AfGEoqsd49tHXT-vQAomeVmWrpcYRTtxQcKvvIulLPplJw&oe=6836CF1F&_nc_sid=201bca	-14.220058333333	14.042508333333
63	2969286433400860	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An90nfxVfCj6qoeqy8uBGX8C_3b1YsmqFVfnxo-NsGjWWju20dDbxIqiRXnpMG5gK7-ZP42YoaisL2qma7WC96sbGDfuyOjI_4lmH7G41m7ftNQ5mE8CGoXF00_T1WDJxejb-LwbuXtglLm9FSiobJM?stp=s1024x575&edm=AOnQwmMEAAAA&_nc_gid=yxR3RXUUqpyW1Xs5YkE97A&_nc_oc=AdnIqUsQ_xFwY2ClUL0__GI-YnpL2oyF05k9yDZyosdFzTR2XcCB5gz4_7cXRDO5kAE&ccb=10-5&oh=00_AfFvY3I0jgHfvZQlRIiEROgUO-kHTYnyFg_WsgMsQ4yBWQ&oe=6836C6BF&_nc_sid=201bca	-24.717058166667	-66.201507555556
64	4115312148529760	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-fPUnkiw1dDYLTgzqY248ru59G247QYtj5a_ZO4xBgFfpEFApdgRT-0XJrWlBuN5thgz0m5sru4tHt6m6WwnHUmeK5GSQ7huQfgJnZRYIJ5YK-rkTqJeoxCpTEQuDVA4MWPtY0QSxDPmW0Uyj-wQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=bK22u05szIpd6lUyTwD-dg&_nc_oc=AdkPeeKwbrAQRnpDrqxVnxJ-XhPAeerVwz35jykx-Cn4R9Eu0e7kT58CcQNCk6BpcVw&ccb=10-5&oh=00_AfGoRYXgph220oOvM5j_p4tUHk04co0A0BEiuTyWOYZkVw&oe=6836AEA3&_nc_sid=201bca	-4.5929254566303	-77.864465336989
65	2151367815055668	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8LoXw6drJoXJ_ecvqijF8xtJ0nXA7DVo5Va7TRkj9TWondcRC-JSPz_55u24VWzbf_8OUqc5bvoDxppFaHFNi2Z6_efawFEcDfDj2OAvemcGgjHJEYmT_PnszXtRwmt6PYm2uaxcaSQ8apRNbt6NY?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=gV0XHgzaou65f-VdraKNMQ&_nc_oc=AdkIlVULtrBMjqXd0ieTidN6bLkIbrq3ndaqJ8gePhiqa-_KFPvslbHS5rdoeqUiimo&ccb=10-5&oh=00_AfFPsLiNPUbFoaiKnkq5vWIm2agUtZ-H0sn_l9pw50334g&oe=6836ADAF&_nc_sid=201bca	-25.928986300001	-62.546419400002
66	1792993670904940	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8Th_ASuKMUOd_lpvkvPiiPAAfAKH37j85m58LHJNil7a7R1LQhKfaKDeqgGbBLKFCH3qs_9M5bB6n_P2TQkLfJFQUBB9D-J_PYhXv4Wsh_LAUt5g46oWBqrPtdiyYrf0ubLcU-NYA522OTbLGrHv0?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=4l8ptUmg8TUHx6ICl0dX6w&_nc_oc=Adl0LNwYxyEUbGSOPjZxlHrrV_eUye_5K6wYQ-oeOzdQJv_XT2uhnVX39sJdrnBNl98&ccb=10-5&oh=00_AfFloKXnPAMFw86f6hJgphJ7kw7UZZj38R6FOiPy6FNBpg&oe=6836D3A8&_nc_sid=201bca	60.095573	11.47911
67	3878910472185605	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An84I-D7DKCREiH2CXRfkHX-qN6CHY_iYt8YTIep_aQC9g1NFTBqvpgxAnFV7Mc6w1DZXgvo2I1Mpmm8AexNvEQX57D9GrmzHXfs8kkZMjHKcO6dB8kzWKk5Fu-PQuCrI5GcyKCMArXkVhC-UlItzw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=E6QyN53ISVKFhAQGY5KKxA&_nc_oc=AdlrXbbgBXvmhpao1b0ZJJ8qY4XEUOitpVuLsAhCIj3I2xY3WgJHiyLnmuraVyjQ7bA&ccb=10-5&oh=00_AfEcj9qdMzzFCG0Uz6dQIVkmNMsHyyakrSaKckId2kKpog&oe=6836C153&_nc_sid=201bca	42.735220176723	-88.014136748644
68	5067952769976881	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An82dMuE9MzPCOE4QYsdPfE7Qet7pWdSbrsun_aYziRBG8Q0DkiOF1s2wGUFIhdsRr9e4CJB0_43SQMIsCHQREM3kV5V0IHeehOBZqCV32tFwdG9K8vNoYBEF7mvS8IhpimEwMJii0Smg93uSyJeow?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=yNLV04OIcBIH99G_eCOjfw&_nc_oc=Adk5wAlxDrVO3t8dhecniHgZVCTkUWnLLCHTYzNrtmdlQRsogYKAK6fezk0DkKoFb5s&ccb=10-5&oh=00_AfHFSZkzeQxagzGP5PRj3E56HcsmUmP04iKHnIoYwCPEKw&oe=6836A973&_nc_sid=201bca	49.530416	-105.2579929
69	1945482315872546	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8CJ7CmWH4IZcsoNO9OHm1i8va503o6mlD4daDKLtp5-iTQt3Pp4ZcO1DOsoMOicdc-GFX1LGq-KClc8fnQXCnpn6MHjSu4o0kB3a4t_zeUd9j6sPqSQM97FQSleRV8hTzqVSMokig9ubo632Mx2g?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=10xB2AuPVa7rXhJuI6FfHw&_nc_oc=AdkvJCNYWdeFFKOLkiYBS6OlFi8cupoAzGH7NFJe22O8rdzbUhAnMsuoPbjt88lG0N0&ccb=10-5&oh=00_AfFnyFqbDEX4w4Ml6yDTIDnNWzokTqBLaD9Ta5__AztXxg&oe=6836C8B3&_nc_sid=201bca	38.537058055556	-121.50068805556
70	3591705384267986	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9ZHgYYpYWUaHPEkPx6_jfZ4atkVuwUwPn5t59rOlCaSLAiOLxAC4H0qj0mhVTgaZIIVaF-GEIa4oAuENyBdaccwKt1fxE2rcTJZ6SKq8CxWSKmlQlKvantqj9f4nghnkV5yGoY3PUu-v4WbNalaQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=96J1aIBmCDBVA9dZHTY4HQ&_nc_oc=Adnw5lHrIOK42VMIoR3wnhdkPN6fiNux_K-eW1Y6u2mYfBtCvCB4NYALmIs7PcoqgLY&ccb=10-5&oh=00_AfG8mTYjdlr1e4CdCAqhte0QGliod6OCEa8yHb2U1tuBsw&oe=6836BCD9&_nc_sid=201bca	-33.770067036345	143.11659427351
71	297198601883295	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-LvuI-ZEXuHIJeaSx41HorYmZKGixLYQV5vl5Tt79xjZ8XT1z8Lm9o5cq-fF7sRVCTI9u3hxEmzgWeUh8OCKOnBCpQmuUCTH1vgSuJ-YubiEV7DIWrAcuFopZg6HEq6r-jGkFoGNCwIHDNgpaamg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=tXMbXy1qNTk9DNnE9SRxrg&_nc_oc=AdnKIpBLkhDwE3K8wxoNtUzWM-KnfY74WBBGuHg4e_SByUMF_bkIP0Ul1x3a-Lbs1Y4&ccb=10-5&oh=00_AfGUQB63VPBMMdcSEt6JlbwUSS-uiz8DlzUdbgEUF21gEg&oe=6836BE53&_nc_sid=201bca	50.04757075	80.68261803
72	2600118696839284	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9NJWDXfpaCjjeUweE--4WaBoqa_jZBt97oZcechiwZxfsNkYD_ULh5lWicfsDqT1sgdGG0xi6SrCr5wcZ0Wot8Os4ACvwiNMILd93vvr13sXbnuv2esVxsmOwV6KtR3mWfMJ0yBqYuklsKp9FLIw?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=sKRwGa3YG5SOF_hUFQUDOg&_nc_oc=AdlKZv-vsUfebCgvy1BCB-z-URLPTOMK49rwYK0dX91yq-kfUNPJUmIymXknzjhlDzM&ccb=10-5&oh=00_AfEQHCM0KRaFbigYreubFzCzbjZkI7B59JtjRgNuD8VoVQ&oe=6836A86F&_nc_sid=201bca	27.519695491667	41.729566466667
73	3977298102362523	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9VchTc6ycxXGGqOSO5VkbepIpnJKlEPORpGwjGKN8zDwFePgzUiJHkzFVYdU5-7FPOs6Daap8FHn6agmVnbRrlKvKnZLSt7L0PVgBrCNK9T3D6UuyzPs3lhwagOsizj-TXy-PqlGMBbaGkcRrVy9M?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=BwPR7RD8Z1ByQ4fQicrd1A&_nc_oc=AdnKp7E7QpKe4yTBVnNVdHwoGqA4TeyLeuoKkhP3I6HVMOV9vp6KO6Fj7DaldsyE4Zo&ccb=10-5&oh=00_AfESHUY0iB16cnMxFJb7xSV3LwawmjsK5crLLH9OP3_kug&oe=6836AAF5&_nc_sid=201bca	54.1781508	-54.4654918
74	766769992291539	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_CyHdaspPBroWF6QexDb4AeeIKkYdDHczCtCan_Lx-zXAGTHgCfPfcrGM3IaL2NXkMr5mvasEFuecUvr7dhIan_tGw7qH5x0mUn_dSwQeRswD2INfXHpwtcYxxJnBg5t2F7EgxzgBVJNrqV8ukXQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=APiAJpEN2V4i4nOs3f2QDw&_nc_oc=Adlr99oS-SXNbeUzKCJMXn0zUh60uiuDsNIcDfhYt7ZZxPvpmFkwN2OpoSLmn3zODmY&ccb=10-5&oh=00_AfHBem3HWXu4jyH2vsYXSfVfZMYnTxu7LmgZYnLoNCtuAw&oe=6836C6C7&_nc_sid=201bca	56.1950781	86.6302145
75	3214929145466674	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8g-CannG0LwORI3FoPNeDB0b4BfmjMh8dFPLTMoKYuK4Q_5MuHMQIOQFZkEF6d4u-pivBZMoMJ6-_eAL1UOZBs3WUZzU1brgG60Zj8oMOe62ipWLZUwUFcZsATmjxnJDrIysicHJzYcwnY-3KrEg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=lwefb8CjOkgLJ4YO3jzbAQ&_nc_oc=Adm5fer5YA8lDNBgBozjwF3ZnF5KWdtmjxAKo4eNvUdCCJ6sphd2zOoUFnRWhNPoSAg&ccb=10-5&oh=00_AfFJjIlCMqkfw4MBTkXr6IU5CEqa3abiNz73Q5RnZrbisw&oe=6836C38F&_nc_sid=201bca	-8.6893665	-69.596948599997
76	1959074800911025	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-PecCWeSYPgoMswTpnKjZ-ws_td6NMojxUqkz_MsvQ-UvzPv0yZqeNprXw_6Wa0VKshxNTAd69DrQISeWukivVWqUdODwPlCFHHhZDMRqFwunoVr9t6JFndzknPCXEg4pykqRNA6X5RAf9QwA5QhA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=pd_Ha8V5woaohEZ31Mdh3Q&_nc_oc=AdkQmLOfHFHo56mP4q59ZEA6grCxdECWT5ybrNqvBC-YcKXlLDjRQKFb0-m5orGywfM&ccb=10-5&oh=00_AfFAU44H-zeDtXVET3JvvCCceNwLBa0TbEyVo6ut-wDkQg&oe=6836B2B5&_nc_sid=201bca	65.739738894688	23.096837606303
77	3767639710013705	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-eU6qvxWCFFhEMgTQBAOnhn5Z-S2pXRleMEb4RzTW_oMQtIJ9E_Xu-3mnj4j2YEHXqVOKjvOze9FcTGh2CQ_2uss6-QcXcYDgSg4OlMSil2S7nUPzQ8T0-cH60OpD1EyXo-M0SoUzuh3Xfbbm0fA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=qoQNbv-YVLap62h_XSEorw&_nc_oc=AdmsS73NEYZZ3YfDAAM-JwTZmOIb1TIGoDtaIAWwOe8MpIAkAxQFZobvzkBOSoxgWbc&ccb=10-5&oh=00_AfE40JNgPTicUX4gNHgwK9mx8b-Zv2nHMBQTgGqkU2UsXA&oe=6836B5F7&_nc_sid=201bca	-31.247482292565	136.55357523004
78	2887968711445484	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-auIUpq8QcpbObNT5q8UGVQqB4EBqtRn2B29z9BzUM41YGEeTiWYjBomP5rPi62eOMHy88on8BueErjOuWAlMTz9KoZtzAVI92fQCJ8lXbnWqxcS3RsKgwfbTWdflEq6-VxEAE5wdRnM14Kuxk6A?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=ud4Zz9qv2MfG2JWXLOGpwQ&_nc_oc=Adk3rPJyAeIxTDp82kWzv8KdIRPTL0pgxqd4iniF8GEdiHPmS32wODzTU5g-eOUiuEg&ccb=10-5&oh=00_AfGcuMNg41pz8fLBNoLa30J29Lz5fjU4oM2Y2APk_z-bmA&oe=6836BAC5&_nc_sid=201bca	11.681371492907	-70.175530878022
79	9728715843841163	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8UmJ8QeKPQjawbBQNhzBOseV8_9CT5hGPiAskoauERY8Zqlud7UJETaC54jgXwsHtzGrE39y_9tsk_Y71Cns1_iFwdUP-vQB8fOPGfUClb0fwCzv_qAcf6yttrwFDs0upNpHWojEOd_9S6ZuhSCA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=IZCe6AoNVgul6TSj739uWw&_nc_oc=Adn7yeXyPIHgiVjtkXWOsxUJWwp3K49APDIxUjIrl4r7Pz-_iV9qiNPYz4qGRwpA5yk&ccb=10-5&oh=00_AfHNJ5HLXC3tHTlb4x4aDyciOMr84Ry39GG15boWD6boSg&oe=6836AE89&_nc_sid=201bca	-2.1440313	102.5088867
80	1652148405396628	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_-bnP7xem1JYgqA_BlSyVReZxbrQbhpz373jEtHe3aaudoS4nQgabFxFP-Vc6r8ybWqyI43SB7dX_ET63ruZIEmW8oXFqKK2jiT9_T0jx3wrje1z_EcJ98FEnlm0NGMGUkQ0JN2iNHVckwvX2ZiQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=_tnExy6vR3TD8xM9B44WkQ&_nc_oc=Adn7ViSePN4FDemR-BLJ5Cm5BDHMLfK3MERez3G_D8xWa0Cl4eYYgv7ApqEpiAEoShk&ccb=10-5&oh=00_AfHXk3l1_3lRdDTqDVvegEvxfAV-uTYV_TdJXCHIMPi2sQ&oe=6836B8D0&_nc_sid=201bca	0.47252435708098	34.851556532637
81	2038756209857074	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_0y88PGjIcL6nTxNkqMlMcOJInFMxDmmiT6eIS_r00n__BFbxAKXj5JWJddbWuc5qyfqB9fpVFD1Qinuimjnxba6qPCN6-glD50mLZkm99GGwlcw0jgOR-WYr-8M88iBSf_ORdx427HK3-Bx1MD34?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=skxsKLX8kquv_u-bqa6hsg&_nc_oc=AdkXaw7P9IaNk0ILqU_8u1YD49Wa_09tqEa_vK7qtvBVRr2FqMEhIO4GMltckDOaxWU&ccb=10-5&oh=00_AfFBvA0Pl538n4-CZDcYcj2n2s3TbjOHUoVVNH_E-dvVMw&oe=6836B21C&_nc_sid=201bca	20.241230534844	85.758277805117
82	1397589167285144	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An80GRt4kZOPQA03zmcZ1WvTzbn1ON9A4aF_20wlUqqEARg3uiinKFOud1k59NUdFjZ3j2dQA9BiO5_Jl3OAUkdOw9SFZ84vx3sfnsrsq9NbilocclpcW1v1oWryTYKoPdYtyxAxeTpm1A_QL20Qjvg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=jNgGfNmHl9ZK3llTwnz1Lg&_nc_oc=AdkFeIA_faqVdFynAmvgWAIlboQJAztitqCjOhSocZ1WIh8wU6Q7hs6K5NVziIIdBcc&ccb=10-5&oh=00_AfH7cIWy7KXD-NAbpnLBi6ynAUKJQT1AbjsghJ7T7JaIyw&oe=6836D90E&_nc_sid=201bca	19.558966339008	-101.41696958536
83	1741865776642759	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8OfMnxRU6Qn0zXIisyR-uFKZT6usVl4XEB2o9bvyhbPHMFDmty3qQHjDx6q0J8hCcZTSqPmiGLKQ3I_OM39nksV4NLpVZCYZT7Q7fu_Pr0FdtPiKILVIYP2gShgeJFTRRPDOZql2HkMZ8h6xd0fA?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=1UZP3E4e1RBoYXsN4V7YUg&_nc_oc=AdkDd0KRYULB6whasgd9kbN97Dks9MWPixDSollx5K8Xbthf6Bm16sjjI-TYTzdTBzo&ccb=10-5&oh=00_AfEx1rU_89kDyduBR-pYwnfJpBTJCIbWFyveGlX7qRSPHw&oe=6836D68A&_nc_sid=201bca	-23.558903072222	-70.39763119
84	2927636687517309	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_3VTW0cIbdDlHmaUVQl6532V2y641V6lBOEvOz3_bfgWuFFEKqWr10NjprgP1jyeijJotIMPpQ_nVy18ZKTUcj2sB-nOOAR-R0T1_utDOUsxzdDuq1DyttCtrkkV7kEowMCkquKt9gTZsZ6VSYSw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=v4kKxbepOx7Mb9pQd6Wqzg&_nc_oc=Admgb54fYIxv8LIn4ppXMJ-mNOB721kMBqbAj4RuaP6MKEzb29vn46JGR9kX1J9kRKc&ccb=10-5&oh=00_AfETAd_p9B4ogaCvYzbTu-f8YSl3PbPbBGfW4FeTduXy6A&oe=6836CF7E&_nc_sid=201bca	-0.033139178628231	-76.164994817296
85	1411806639185931	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9rNFe1MDp7q4NuK7uwjplg7z4aaf-r-icFymgwXFgKJwhiJFAcz99NxBHDfTi7AUFdXJEChtRKwazebLg4NleDamgLnTTTyyi95OZHWZSxmh0arM_31ERwxkkKZIezikntN7C-Gk2fh8PO71Ny6w?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=4X4PDyVI6MijMzCUxbOoYg&_nc_oc=AdkcfgpsPgwYqbF6WN7raT0dYOQl7R41XcHqV4TuitfJZVwiOqJc4oXldqFpqKwlH8c&ccb=10-5&oh=00_AfGK_jidb7t7VMenFF4FA0QntimuL2pDFl6EgFAW-dsC0A&oe=6836C6BC&_nc_sid=201bca	23.42573736	88.39390358
86	1595767004486860	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8kFC3J9Hoznzzc0Yz4BrvTpXiF-pBBgCEB33TxXkIHvGFBaFa8NwuNQE21sYqd-DtiRqX82ZlrNv_r57brRAA2siRb1iVHxGe94ghQ1CytMHB3wQ0I3LAxVfecjYj9TqI4CE1K8gnJqAJpZiFbllo?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=_ZlJ91Uyw7JksD1YHZlHew&_nc_oc=AdmuLlDYTddm0cY506-ftxC9dZ6AMt9y4V1ez4ErjpMp5lk-rvMy9JyZalR2g5oCDNs&ccb=10-5&oh=00_AfECdtvk4W7oQpWeakrRdSf3LZLJSjdzJ4_VFfdS0UEDZw&oe=6836D355&_nc_sid=201bca	36.578597306667	-93.821542966667
87	2400765273636228	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_kdD_XDABoe7ivijIiv8q9VpvN_rHeTl2L_SU6rl95xqYbgdxn6Vr48c5uASZVRibbNra2jZkw8-RRu3lX3LQTQJXnRRlPlYWFAX2ydqSZWc0QlEhr2S2fr0CEKHqcxcAW0Fdf3-_cNnWKeiIUpsE?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=ceqRMC9YlgVFBOcM2_8e3Q&_nc_oc=AdldPzXr8Vp6f8Vvsm1ChqarrtolsHNFGR2k6qH9uUHnTem2T7DE0ljv6qVXWyOPWbE&ccb=10-5&oh=00_AfF4Fntv9m7islBsnp9WZZp5QBqVIIUGJXYf_OeV50gQgw&oe=6836B7EA&_nc_sid=201bca	40.7850408	21.3589018
88	2834582776758606	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_FX3-Z29P06vz6brI74nHZKE19IXTrc9Os6hpPVAId8jUgCq025bAgldNP50YdinHzE1hPkFIsmOnz8n4ljo4McEmPO3XNr_oTwPu3ockWGowEIZ73IgBCBwGCYcBP89oCmjOg_LlbS4qo3i3NsQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=fwMA6oJlU7P2lk2J3-X_dQ&_nc_oc=AdlQneFtUzbAWbSDRuVnX3gLInlVYlB-a230hVWbEC-jUoAiX6QlLVsQCexe9LfGpIs&ccb=10-5&oh=00_AfE-pJKUOfn0mrvYh9CvrO2_XBxI4cs265g8OoYeW5QAyQ&oe=6836B9B6&_nc_sid=201bca	18.657891388889	78.219921388889
89	2269473689900122	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-gB54YlzUMjKxk_eotUwH82cxBmvRmy_FcPJRPZgW2jyi09TP60XDbPygnWuPftaeUOFK53HVJwa0x9O71yEam4teZyW-gRPRAWPgBWNyLQBWGa6V6gBqFoKRNffgaTXFhKuLZlrJk35GOj0wdxQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=oC0baCDWpasU1Tx70k3ziA&_nc_oc=Adk5rs7WsODZl0crWgQHd0jB0Mo-G4xUUZqAGB9Agg57oyzp2Gr3IOaKZCeftlLKiJ0&ccb=10-5&oh=00_AfFwFPj6Yy8bUtLCwutQ6rpIEnNkny3x0MK9HtUxTeRBTA&oe=6836D5B7&_nc_sid=201bca	-19.640587242222	-67.671848460833
90	1445631225915476	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-6IDaaxxnwonDJBBGbG9Nef6zdi1V0b0uSxrvHP4H5wHAPmjyQf_-mMi4GkErKYod6sv67r_JQxbgBXpFbDQAcyZ_89wA6aBr1LXre5lwTVwf4ms3b6aJdxdNNTxNiOISnxoK6eu2qyZbdZlHWTA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=3lw-grBaEJXbObPyFKP03g&_nc_oc=AdmqE7P-vx4-D1XWta0m39TGplimqRqLjhYWWAhlVTVzHnTVxNg5HyiAf0pU8TwlRGk&ccb=10-5&oh=00_AfGnIjQR1OM8L9JFGOx_UNaQxBfl19eHENXhZEvyEyC6vg&oe=6836BF35&_nc_sid=201bca	-20.381834	-66.884391299999
91	2136508760026889	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9zcOXYALfTvhLAHGNAxRjkqCNBtUfpTS0HeQqHy4nL_1ZqbfMAPI2GNdX4-4w_txN2PdZ9wdb6N5SquD60KDiHHc2c_1WWxOO7hPnr1wZkFCYl-PgLQnvEf4o1sQsK1ODR8mTds8J_9gnfDjQJcQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=ChfAuGWKxR9JobU6KTkjPw&_nc_oc=AdlE6iQg18shMJ9LEaxAYj1bMskiuaPJqVAGdWIl_gM0r_Nrn0zpZAeO10d_ehOQqoo&ccb=10-5&oh=00_AfHIJdarf-c7o8T6uXEZHqpuYVd6zLKsm6nonMuDCikrQA&oe=6836D83F&_nc_sid=201bca	38.743716192613	39.208275066607
92	2991352374443642	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8xRXN4VLw5aC7IFx-sjtIoD6FGxbG9_BYTHkQbQWLbUdXD9HNq3YBpFX5-y6rYoOPPBX3iGREKJjkH5FCzN-BU2WuVeTGJpV1OMaUkorQX9Db2dUXFlHcnHvA89O4BzP_IrNMqluiK_33CuE4C3A?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=avYGYt9N-svjf4YhB2svBg&_nc_oc=AdkUYS-MLYe90g_XcDmXakB0AhFEhXWJuRkXvgv1Zs84r1tUeCBy8fhJMm_rmqvyJ6M&ccb=10-5&oh=00_AfHNfIv9ExXnhH5iGK6IVav0EZnDAd33uQlfgErqRn4n1g&oe=6836BC7C&_nc_sid=201bca	24.911124013147	67.067399942231
93	1627844924572672	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8XGppdkBYdU92ijVIJVciOKKy2Z4sshqg_R7EkamhKBZpcS24txV-_wbJc9fPl6Bs4P5kJN4f3upBr_ldHWWRcCKss4Bh-o00noH1snVXtdemWaNTksUaUKMjnx5YW-NUE8yxMwNSJglEi9ShctXw?stp=s1024x428&edm=AOnQwmMEAAAA&_nc_gid=wHYZ94EmQrdwwPQuOPbHQw&_nc_oc=AdnL3ATPBXCHshuS9JEw9DVy-5wxNoQdzHdLYASllQG1EdEBjkLQiQOq7_gIImilahA&ccb=10-5&oh=00_AfELwV9YNLvs33X2kw56vzuWYM_VPoQ5yFQGKF7wRkZhwA&oe=6836D67B&_nc_sid=201bca	38.116420613333	-97.7756673
94	2609140915946750	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9xMUCw_3dT0pqcV1iKp1OxCTpBBhkUJwo4KQCuc3gFvT3NgInr5p6_8bhPgZxz-NJABE3c9i17QC5wccvQ1C-22lmGFa-TFXX7PZMbDsiNQ36M7F3RlbOKiuoHjt9ZFa12TI72QVZWnxNfeuFfzQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=lbauCr3H5xBjymkbwSr6SQ&_nc_oc=Adl3hVGi-ftn6gnzThvqY6jBvZc9Oydlsv-acsRznh-8Mt8YPiVUGidkezcNoEcs2Ak&ccb=10-5&oh=00_AfGY4oatLGp8rvJwOgTV5wnW2UzJhYq987s2FoJ2FL0j_Q&oe=6836CDB0&_nc_sid=201bca	-18.460375546679	-54.880132246111
95	2939224139639417	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-7CWnKf3yKKpSfjUI0UdteZsIRr-1daTmCWBa-QBrNhzTG5rTzV8RZ9lY_Qa0x3cKnk3Zl9A9qpF4vpVEADYKl7InQWfxzRUGz7bURS6MeJKsRTFMzWqI90GhhiY8AOwtxGBzithZiT4qK5pYl_g?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=NHaUHrX5GSyr4xHUmFtaaw&_nc_oc=AdkRID8QZ8BNCXK7sQbVknonJrTRpmnN5DrBZ4mSAKpNZtaKvpfd6yK1uzBB5YbUiWk&ccb=10-5&oh=00_AfFZTSDLEEsgL9m2rX2dMwNdhenm2K3o--qsf3BveT30oA&oe=6836B3C4&_nc_sid=201bca	-19.979794109695	120.11478136283
96	530524218112751	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-tLAwIm3wKVUbwsiQmV0b1DQl4FA4yYP4CiquG_XX8r8y1nkDfrJvM0Uq2S3LqXrrK4uh8VNdwY_unNkXLmRoI4dqSVJy_TZgcHjuofLRv0R0WVyy5gdSWRXCFA7DNmF_Jbam17fe-SmQ6hiSA4A?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=lRulNNktQCxilcHAAHa5EA&_nc_oc=Adk-Fjc8AWbmvZUJBt4IDMfvV2Cz3AFj_f7Q-YPQilb56ZfhaUFFpvWv8OIba4Gxqdg&ccb=10-5&oh=00_AfFhcXz9d-KWFz3Ppv99ChEpPheOOjZeBopPfRX3eETDig&oe=6836AF54&_nc_sid=201bca	46.721164968364	61.760923415083
97	1676163256138148	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-0YRVuxBBViFqgYEce65PgJXWItWw769kugwSjNEWim07dVncl5-P9kF77cLqUBOOClPXbQKQFTWp7tYUr9KiMuvNeJNd-pALo6Gmc_2dwtbmZw6tcS6FXFW4OwMGxtPOU5_ual9f5Bv4oGJ0rcQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=zL9v4xYDnxhmUmlgtNr_2A&_nc_oc=AdnxXQBLwmHfMPYXuZaw60ym_644ZfqaQzOvIGQOiinmQeSFULJ5mdyQnHJqOa6hBWE&ccb=10-5&oh=00_AfHPWJhGtFs5VotITNnom16ldjKvRQ2ge4xJ5PTTs-lLWA&oe=6836C900&_nc_sid=201bca	-32.2400617	22.7888408
98	2864149623902366	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-F2ijP6s3r0qErenguhPa6GKEB6_vWvMK_npymbkN-i9xHa1-Pf_HaO8d0bUKheIDtsefFYqRHjV7fud03l9wuN7ULAiNnHrovu4xc-rTJJXZz9SPY8NcpEEFUQ3Xl6tWh_i_fQ9yyiYdXcNJ4Pg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=arAg1YkzejzV-f2GA7V9Pw&_nc_oc=Adlhz2yFI9LdBEdX2b3AgWaC791ijZGqT2g8Jg-02BgGXedeHnvaeZZqjeqOxPHWOfs&ccb=10-5&oh=00_AfGLPy7JPJAReP3cpczIFJDTwsJ7BZsz_HPenRJc1n_nIQ&oe=6836C4FF&_nc_sid=201bca	-19.000825	138.69077222222
99	702067351225430	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An82PQkCp1iBqItuTOrcvLhjnzNM3pbL5bEw4KBdlz0YZrU5F-Qwo4fzo7KVGeATPdhla0_eHTbWgOKVXo5CVVgp_Mk1tz0K_vG5yIuotGA2THxjDxqiw_37JqhwJMgeNm8Cxa3wWK25nZDycGow3A?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=AYFmTm1N7JjnehlW6TKtpQ&_nc_oc=Admwh5vILY29TYf7RhLHAeKJVrOiMqDFg1dppK03UM0JENNN2v7LKP_XEPNr94Jc5FI&ccb=10-5&oh=00_AfHFJwMhfMM1q-6m08hwZfKraHZjueJrAFsm4DwzUK_ttQ&oe=6836A772&_nc_sid=201bca	0.6403955842129	-3.4056624770164
100	306378880895948	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9Ngz1Di7skDtLyORSYXPwGtv82BJOh1IUl2xkiwEPXNGwqMXr_0JfmRI72cjTv4U5vByizxX3BKHRTryXIDpcg-bn86d_KQo_0y-1HIBdNRMfLnOV2iZfsxOL3ZYYpPfS0hdEAT4OuiTGnFfmb4uE?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=k_Iwg8U76ENOW9GZWes6OQ&_nc_oc=AdnxBvshdkZyD6VJmPq66Qok4nsvTEcmrFRazEpKPabqLe57oZYnYg-mpgn6zSB3jYQ&ccb=10-5&oh=00_AfGc39NkhwHB6NZ5O0lOlMuvQ5USwy_Eu_H2sQtW-TbgXw&oe=6836C3D2&_nc_sid=201bca	-31.871055555556	133.81163888889
101	1541452299378141	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9oQVeJ7s-oL6aprPbw9HmvwyQYWYjXfSq9-feAfhKjcFVzy3TxKvvIKfL1_zdr8-0x0GYXdYTzESBfalF7q6wR-po2N2YXJ3jgoDgj1WRIL95v-4j47czLOak-yj8Uu1Kqkqr3V177buE74yBRP7E?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=WywdzF7uN5PUkmR58m6geg&_nc_oc=AdnZzMbIu0DpQxL60iW-BKNY50Ss63vzQcqsxIs6B1SSrOIRaaBwgGDXP9ze49SqUDk&ccb=10-5&oh=00_AfHJSsquldEPXaPGA8u1kdUaPu5xJHG9r-qSTNndFljbmg&oe=6836D5D5&_nc_sid=201bca	36.7525539	-81.872558
102	3848329992106853	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-WwbJ44qEaEd-809wRhUVHdfTLZn3teGSxYwYLCz5mo-unXgvnOYeSJ_PHa1T33tL8GT3GNniT7Z89qm4NhgBCIKu-yZYiHTV-n6NwtnpJK-K4QMNdsSrje-5cuyaiFZKjfHZdQ5J-yCLpIVlLXg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=nr8SFQZNmWEyK0XtdC-IaQ&_nc_oc=AdlaZHIYz7tiRDhm404i8GUp-BRHo4FffgmUy6sadykBLxbMXqC0oDK2VR0A3zY1tco&ccb=10-5&oh=00_AfFw6NJk7OTRX7FtcD1-VtUcLOf2elTsxSzwIfrfGn4zFQ&oe=6836AEAE&_nc_sid=201bca	45.907818208698	93.212836326266
103	5707791802600450	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8XbJO8nlW-yZMJjzYypGi9X16xgcaBc9V7cPs_AZFzArxyQ1fWklq0CAeSW4Cym3QN3WrtfCO8kY4rjMyq8EE97qowzHrlvSge3c5RjfZx14I-bXmgCEztPfdCDljbK0tydNUaWOr3I70DZS29cg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=Smbs0CzQyezWqcfVy3Ok_w&_nc_oc=AdlF6ZmCmEKgRVgGAOGMD12LwndgApOnTLXdCmFN4AWl4jg8X_zA34ItMtOzekHDyAQ&ccb=10-5&oh=00_AfH8DYIRuD18qEuu0Z9CZxrT_4gCLR1ipEp92oY0HI2iEg&oe=6836AF9C&_nc_sid=201bca	43.891230555556	-90.945386111111
104	5076264625810578	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_G_o372Z4FnS_JnwPHHFw3Bg4G1gVZbTRW9i3-vQjsV6WAOl1Z4nXRoqYt7rSyEEytK2Tb9SLeLLt4Djp_8Q3G41CjIZZ0eY6ZoYndFqROoVVxO9aq0jYEkzXv3TLP51aAxA5TCubbaVdz58FNGQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=IFKMAdud1NFsUgBmS8ohcw&_nc_oc=AdkfUewtBNmeSY9rhqUkTHe9TrDhBm6ufEwOzNaXsGwEW6DOn-MMFefKv7V4TuTbba4&ccb=10-5&oh=00_AfH3rszYOug4mDF9TwMqTiw63q2esD4O2ZQyxWsheBtSAw&oe=6836D27D&_nc_sid=201bca	25.0643406	81.7725418
105	3730333767093794	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8PYn6SmjAdy2wPF3-OGrIVrIlKKoq6EEjLU-FH0SBkWxLB00i9wX2kK3LOj328E4MquJu3ToKo1Hiy4-4WyuNIrdNOySExkkQ2bKyA0qrfG_zYZvmZte8OtZhKgLtIp8pk-UrS-c2UpsUuwRXMRNQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=D_w-qGeFSqs_2RlQhYeqBA&_nc_oc=AdmfVsdFW7u8uDK1xdqeN9f6_5OBtKd8-ubFJpOQ8X7NsZxKWRb4iFUlXz8ix19GfSQ&ccb=10-5&oh=00_AfErHlDIW6aMKy3L0QpH2XDQpKi-jcFufYAdWHLhsaJDXg&oe=6836CBF9&_nc_sid=201bca	26.581797222222	-77.168630555556
106	1599678054019698	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9_WsM0ADw2kkykY9Su4-IpisqIG21LJy7cqmNRBdHijhXxBmja0z_SbQw3IFlbcrlYuQauO6tLJSBncANwtwk3ONvhkIWS2yrAhkidVF9eNLB6kO4rmLjpNT0NsAPuCXGosUs8xptKRZbYy8cDPg?stp=s1024x771&edm=AOnQwmMEAAAA&_nc_gid=_qf7CYITQt8GWDzJOHYdOA&_nc_oc=Adld3VGhP7v07FTqG3fwf4Y1vEV8r-g_M9C_eFeWjsBHy03ngez1FA0cF0dlOlY2Mjw&ccb=10-5&oh=00_AfGeUCbAG97FVjjLpOEzxinN8_IIm86_zHqJ90ickNH-sA&oe=6836D7D7&_nc_sid=201bca	41.9645845	-76.5339591
107	237000401553679	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9XqaEPOZ5hTMWiteQXDldOkaKEuMOwzZHeuGGeUNw8W5p4tP64vnH4PF_zL7JrcK86xJb5-LC6hRD0yWQCdx2aRBPaxzGHL1ifbrByVzqfO0jRQUhRlr2PoGwP5UGw98eSwL-gJMspNcgJLzwnYg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=9K0N68AnFWOEjWvr8jeEhA&_nc_oc=Admt15TcL1zJhsUvnx3zMClgKpy4uwWeoWsswbPsNp5xOhXOu52oZw9zlXM3vT2wF1s&ccb=10-5&oh=00_AfHq4hEKnvnuMlmhvzEkSDpeQIrQlapC0thkQr182K9Q1w&oe=6836D90F&_nc_sid=201bca	-30.701027777778	-61.621430555556
108	4449055155124277	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9Ux8RfUU4qKybRuxyKnGBeS4Ah2B20v447sVievYJu9EUosis_rAkS37qMaaqJoywzYfHQzsr4Wt_Phdao4SnHyplr7Q1_0DUlUlHcRYpDnUIGGE3VXytVRstV5Huta-tia4ghMMcM4KP56BMZhqg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=YXjyo7Gx5Ass9txtxKVy7A&_nc_oc=AdmaIAlCHkYWfU3AtWBbVMpeUcWR5vTE2QnYIHPD06v8ZNsmIhnnOKuIjL53OzG3eYk&ccb=10-5&oh=00_AfGAS6xodYVsEYCWKKHQH7T1sB-FV65FfG6Sgr9v4fSrCw&oe=6836BF2D&_nc_sid=201bca	55.570500365024	-2.3458554155556
109	3993738084076594	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_Uf53D1ePJ0hHpHpqF5LFNPG6dMd9aCgf8wnQZEgBJWFcFAIApkaXM3heJ4Msxw_LbQcTYV05rRNxoE3S9LYGA49DiV_QwtP8GpspOYbyVghDpMipOTe_HKdm7KWmfLxXmAAT7ce14IIJnL0aiKg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=5BGy1QvFapdj4AqImGHJVw&_nc_oc=AdngJhgnrez-X8e61omIxC0vC8gJXVHYTABfd6W-_lzrUs-polCCY0ymopICDO_6yII&ccb=10-5&oh=00_AfE76rA3LIx37_iYrOzfBv9MS6hC3hZ5ZKTJfKfqw8O2tw&oe=6836CCAA&_nc_sid=201bca	46.312078333333	120.74913166667
110	1914249475417929	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8W8zIkvYEnmrsi2sqPdpWprtuj5x3TfP2U41v5S-JKgwKDZ7p0aWGjLSYFwC96Vov26LpmwGVS7x7sdqMT8YaV7vJo8DmvC2RpOpW-E5GdA2to8sREM1hfXFO904KSnVv710aoTk27sA7jnD1E8Ho?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=ojqRYj_86K3nujwRUaU4BA&_nc_oc=AdkvSSkslb2cDYMOWG3A6YJcAg-9bXUGiqu61BKH0Vxh_wscRGtp-OkPFEvFzAl8XGg&ccb=10-5&oh=00_AfFahWdrnnlWmnUC4HrLG_SuJyGAi8HrAMwmmqOidC25gA&oe=6836BE16&_nc_sid=201bca	41.161292100003	31.929447194719
111	1596757470858352	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-Iqr2n-dUxxQv1R9xoAEq7ExHZj0_NVB263Xlg8cqfUqaRxYOd3WwAKtHLY6rle795gr8bhOWnHPHhVXwkfjYymlhS_uoUEbkoLnZ6dHNOHNLLY_FDBY16TVkSxnwMA89Uw08eEC2iduY9fG52Lg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=sUsPw0XJd7A25hciWbob5A&_nc_oc=Adk_WCpupfdmnLZlYHE3klWOsgSn4LqXSPhTi3-03QNyG5a7ak2_P34537fUnqoGRrE&ccb=10-5&oh=00_AfFTod0hIYpeblIzsWubl0q5j_Q5uHuGkCoaZf0LmDTSFA&oe=6836D88E&_nc_sid=201bca	9.1131788	125.5517646
112	1695114724631224	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-b_V-6_3WfjfXANmXgwNlXWZR3-rN3MRNNVdXssOXuZIZSTy41ZXdYXV3hm4MCb0D-ui4EFB1XriQKr0jQNC4_GildzYZbq2nNVVvRUny7ZcngiUtIFZMeA5lJtE3lFm8Lxclt_1miL0TkNwOAxYM?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=Dty9SS84P_uBT9flpVDdag&_nc_oc=AdkLLOpo5xWA8gPbbgBVHKE_vo0r6Ftuu18JHaN9jkRW4lgeO7eyoL_BvxXf9i3sTUA&ccb=10-5&oh=00_AfFF2xMA6nfAZMfpT6QO-sXGFdUPabC0phJ9GvMNJdOd1A&oe=6836BADA&_nc_sid=201bca	45.1624472	141.2094361
113	1932226400481936	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-MOICjx6jv6MEQBm_kWvCV3fNeQYihZxpGKtt6kcbIuZXy46ApECavnjnm5fg1AZMeNSpnjilrS3uiFyYHxNKIjvlX0iK_anTe5cGuuFIWfbdnusC0OJDYAOl40cbKKb1e_WFwXGldUlMdVmi3UeU?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=_WQENKuWAFAqwxI-epJQfg&_nc_oc=Adn3_SrZL9tndPlHJHHKCZ0gB-skMyyfyozaKtoWAAB2KfXLCDZ6Got6K_H8vV0QlZs&ccb=10-5&oh=00_AfEEvzQIqTRLzbuIgsK2XELHcm_JjF2zLvPXT6zLCvjs9Q&oe=6836C9B5&_nc_sid=201bca	-12.6033075	-47.1329047
114	2565580323738575	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8MrkkNcvkMFDzhO5mRVdun9hAzgA8FXxNYCuXBvl7sJeSrr73T2t5TV7fdoYfjCsZEkKjOi1oaTdNWvc2ZhH5pH5VDj_lDpqhI5fLzhJqJpT1If_vYz81wvhQ5ao8gtUvn6m7yq8ruua2YDCTE0Q?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=rRZIM4kYXjaxW1JYpdnxYQ&_nc_oc=AdnUZ6IHD9gt1AaF-GDrDPkoqQAmX8kvYQBuJPTPNWlxbG_V3mrgXEYr4bIDhe5pYkc&ccb=10-5&oh=00_AfE4be5Fzi8VutnzCMbeC2MwzKOjX0or8-p4oB3bNYy7XA&oe=6836CFB5&_nc_sid=201bca	15.13544	-23.760308300007
115	2641295902834499	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-mYOnLHl_ODCvlI82ZBp3OK_jncbZ_FhxpOIxHgBjWQzszw-birxez4plA6gz5oda_7AYjV7vybOEt6WtyDfldooOZBu2gizzIzwYJCHFMpJKDmQXctZSQCZXlClCCyV9zbOreunu1RoHkdZacEg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=CPazRZT1bqKgzbEwWy1QSA&_nc_oc=AdlI0Fz9Ro5_PiuB4MaBR9eIbD2AB8L6ULxlO0rzI8CF476UG9Z6n-GNKUV-Px4KsAI&ccb=10-5&oh=00_AfHVU-Utc1b52SRWvkhjHla_qymSwtQCquozFMBxwOKtvw&oe=6836DC5A&_nc_sid=201bca	39.255854274775	22.230007797998
116	1776214836080895	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-WHBiKAFD0UbeUdJwDHJMLx20ym_Mtv-cy-BepiUivdLQgO1ySZUlZioTcyZjrRhikhFbD9e1aZZ9qGjI2LnSZKyE9aPob9DFW5IR99X-6-ZSO2ZoKSk2kkXH6l_BF1XuR-SoXAkUtJUdRGNKcw4I?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=hYR-4QkjAtAbWUZHWpr_mQ&_nc_oc=Adm2E9XUfvdsI_pnQ0j5-y48YixdIeVcM-AFNYdZw-WjMF7FYidaiXNFGLDf7q53Azw&ccb=10-5&oh=00_AfHbMhSuDDUNPOhrCreUSMNMYp2rw1V_taQ-cjQgvh_FRg&oe=6836CE64&_nc_sid=201bca	46.891044899998	-103.1268201
117	1793323230873498	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9oobKH8TLdlqZS7xNLyAKGWDZzCe_EZrsb5BA2logzvRQYNV1aM6NeYsJYh3_mSqtkVjfc3DznGM5PyNiDzlxnm7qzI5AmwPei7mJ33_lxVA8DSIB2f5YGQqy6M8jx7uvJtgAkSlyz8Ait9DZJQw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=sQQRLzQ9aa_TBPc-eBjeSQ&_nc_oc=Adk_HeN6BUktJzht4oJ589XzKegrM6hH8sCyOLKUX2SPz7T0MeUEaxHxrvbkhgzqd6U&ccb=10-5&oh=00_AfGGgeAEwM-kXQcBqkHCLtQfc40G1HjBXAQxOHc5jWHxCA&oe=6836D951&_nc_sid=201bca	11.368379299997	41.378856198642
118	1921314074903398	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-RCXBP0DslIvw9yfdrV74EE3K9cpQC4C0YMRqclz3BViWFO_4CCIrC2hvOziAKzDZ9wglpvplZbk5X8Y1ZIp0T1SX2XD2evdmFS72ZzF0NkQrBee-UaA_QVZHoK4sYSgez3_0K0rhHOlHp-LEYIQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=sEtJO9JEcJmJU4FvZQbO5g&_nc_oc=AdnKvsJwJAY8t7RWKMMEyiNO9rRKnziWDQVaPCoSUoLfpUpwmJNway4CSYDeJo1a5fc&ccb=10-5&oh=00_AfFAAB4-j6Gv6d7S_lhRnzeFWzpzBisAIFmUMzqFGp1aeg&oe=6836D7EF&_nc_sid=201bca	-1.361262	-79.905723
119	3097770753842852	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_tk_cpoQbyexUOkL6tNlWBqz0UWWd_PqE-hfVRF2MzNOQvjX1K9AnJ75UH_K0-DxVFUfi1dEPU60rApt3By7Ra3tYMwY3xwZyDjSIXdUw7kUDH5OjXBkR96YFqGvV8MNjUvIZ6JP8Dg_rM4tUukw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=ftBuQtFhceyjMsFPGMRSWA&_nc_oc=AdnwfCugi25ruJn_stM3e2_f4T0KvCc6VVMpZiaICk7HTfSs5bERucwD4NXWLjJhAqI&ccb=10-5&oh=00_AfG1BHgOYRyA4EHejSY4jRnHha6pH1jxvTPL9F9LPO63xQ&oe=6836CFA1&_nc_sid=201bca	-24.643689011976	-47.381355988024
121	1504901593179576	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9xAJgQfGEt9wd0QQllhbTodXpb_q0eO82PoNALCGzcb3zgcwMwlmufrlnneFyURQme3w05rMdQRPfWi_r7v55sfMxbkWqfWCa5VoPzC5baDgdh_3lHvCYCGUISUu09OM3qdNgiDnnjpSl__rOBRA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=CFgpKs8kVnjcs4kpYl2rGA&_nc_oc=AdmNy8MyPsp9jjbqnpoOVSlV7NW645oD1lbvexL42hy0oPKMn3hHbsLSNqHNJd9rHhQ&ccb=10-5&oh=00_AfGy_bmN6jDRhDTlBZZkS1SJdLQE09K1ngQJbXCrlQkQaQ&oe=6836C7D1&_nc_sid=201bca	20.206603619387	41.633095654532
122	2796289447299121	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9cs8VGoqRitK4uAM-4hNPI-T7akPP7xpqGGzevcmwqa9LG0n0cZUcGA5z-kdZ-HsV3n_4DZ3iWSGYNIaHRSBbrPjilRh5vxO_U52o8FqOgzSsfw8xPIL0XTm0TRR30hSH5rGkP7W311kwO3TM7pA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=9HUop94dmVBvuKNU4jGSfQ&_nc_oc=AdkoRzj76UnrjDVCduhkErYwQpKqKPUaf0qUuwyQtNXoeuCgDlqjehPEdzlvnYo2WQ8&ccb=10-5&oh=00_AfFLySFizcFcnuKz1wsptVVBmTiDL35bGflQ_mLFPerprw&oe=6836CF3C&_nc_sid=201bca	-15.202476666667	-74.957448333333
123	1947132865799694	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8mvHtUg2IxyhlR5j8bNySOCzTf-aAd5Q_5KMVGmnzHegximR51np4iOelkxzjaEuI-fb5p4ondz7VUHgmD5QeAtkd9ooLOJ4MOm8zn2Xzd56YI028NCU3vQtRfyws185JaRdrsSDxaZqqxopm3iQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=ZMVe0aHkgU8MFN2ZPxhX3w&_nc_oc=Admj6P8TGVSfpT1u_zGG3FbdjLa93d6ynDbvt0BkVndkuchXitF_NWKbZA4D-3FVnU4&ccb=10-5&oh=00_AfEQ_odoGwPZONDBIr9PaY_izNyxwZv-Euqv3PElAAaQqw&oe=6836D831&_nc_sid=201bca	22.982649157103	72.621870541987
124	923063755117033	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-aGg8SfhRgBOXASMHPjoHhd02BF58ca1okzlnZ1TFg1Znqa0YmH5NV4RtozVM0rSQ8Hr826yfnmNj0Se4sq1CrJEGWndFXF5KS838ESavOaD8hXUTxxramAGCKkpFAta0IsYK9I4tKXPC2c8H7eAU?stp=s1024x757&edm=AOnQwmMEAAAA&_nc_gid=aFIlAF3xkLPGSTjkfOn73g&_nc_oc=AdmB5BZ6J70lhCrQDGXvNs9YqbJsNtGpsmZjcTGgL5CWl5Tx3jaCY6hsEdDHLfLFCDo&ccb=10-5&oh=00_AfE89w4YsNSspKjTiuN5MbwubvKeaqpH2ubhFrD9uwxcBw&oe=6836BAFD&_nc_sid=201bca	-25.396342888667	96.766536444667
125	2594650470711801	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8A-AINEM6cYqgItQGxCJvBd8tIqpy1oKOx3WsTN8qLBZJb9nsq_dnWMs4a1skkxb9bqECo037SGSPA57QtUTpUKqNFp_mRPd2SoYLYoqMz19kJ5ASkalpJ5qLhojw_QWmMwv8sYYFMuy4rM65pcw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=wy-_Y3Dk2iMLfRmfOMQTfA&_nc_oc=AdklQ8f5h9_lIneBieqHe9WEUKv5KXciB2UDOj2Q-hQtpysJyPoSuCCKc9M3ct94doQ&ccb=10-5&oh=00_AfG5SsRdenv0YuP6xvTBNydnqCQh1wn3jNP7Kf2agYzqSw&oe=6836B0E4&_nc_sid=201bca	10.797033826246	79.824979804374
126	845034994135241	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_-AnFMfCRI9hTpzN1B_yoSE5tIR4TGne5Xja6mnLC5P1ucP5tDFbKcyIFFQy5CxzAQ1Vkng9pCVbSMYhGe6VZgyDImpj7LMZfaII6XKWEkGKBAFpSj8wuQ1SBcsWypwShU8gNrjLvuCIIe3YQzUA?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=TzxmqW9SNuqB4sNBcX5HCg&_nc_oc=AdkibiimbVkfz3dkOimcQ510igiWDwQFJl9XpHrz3Ca9bUCDQQb9zKxRNwHtguBdq_E&ccb=10-5&oh=00_AfEeGH3D1xzBw0TMxeeEmMYx0bzXVjYgUBGjmKOorzCfYQ&oe=6836BF45&_nc_sid=201bca	39.2011111	144.6894444
127	1493822244291208	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9HyGHx1e61E-EuOv9sfsQoTkAURyJCIfA-MhNd0QnD38KKchs6iMHIi48oJodPEYJcfwLRueG5T2eT1hq_w0PU9UVxfaInjpeVSoWM0rs2gwOJCM9cTVFIRQPApSuAT2255yQT1HAKaKxtIv0LmQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=8r4yuEhxbJToOB3UhhXZDg&_nc_oc=AdnYYyysVyOouNSVDzq00-WxQ644RKM_ksirHJsUnHJ1mvGFFVTXkoo-EvEdaDaxetA&ccb=10-5&oh=00_AfHUZQXNngUpf-oPIqgZkFrvzach7niymhXilsFQcx2P4Q&oe=6836B2EB&_nc_sid=201bca	43.22998336024	45.428019319181
128	3927685957286990	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9x9yGaH7UNeMXcycKs4qnDaqGihX_QofWVk4UTADg7QJ10T6SQ2ishmsc8ruuTmhRNemI6xrZHo6NTujuH3wm8RkSJe9IO6LIdHcqg3FVVBA3dw9Cb63hEDBr6m0bLOCBr5giXtk0XMiRwualjNy4?stp=s1024x575&edm=AOnQwmMEAAAA&_nc_gid=qIVOtewR_j5qmiHYKDCz9w&_nc_oc=AdkUTGuQoOK_NVvFOmZsk7lB0yLd1tjCGl-QE_0LM6KR9NWZt9jIDNPkiAeexASTG-k&ccb=10-5&oh=00_AfGRNCn45Ucs1Ox0gOhHvXway1zhCdZfedOP-BfSAik15Q&oe=6836D1E6&_nc_sid=201bca	25.039795337437	-105.41993246927
129	1874259289415233	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-Vbcqfl3OKF21kfAuRQn-kn1ULUaWheYSb0I0V7-fA6rlTGtUaANqcK-dsBZEazNdzRjwMZj7FIKgg3qe8ygMev3-wADpYDZMomgEid1SBCQoYGydmbob7cXt-Va-cIRmZCIMpWOuDtyqe0vq0Lg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=yvF6kAS7ml7bDJ9_iYksSA&_nc_oc=Adn3OZRbNLd3wlp7GC7PgIev2vVuYl_GLXckUkSasHCOa6ZLWK2xEUODPIDlEaIxWJs&ccb=10-5&oh=00_AfGHUpUcEQSd8_5cwu7unAijvVeGxI7wtL8CgZr00eiHLA&oe=6836A4FB&_nc_sid=201bca	60.191659188247	50.891461423705
130	3911675938900533	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_YMmu1fFwSeD3rtxS2kiKJYbWj8_6JmH5S2IaADLJdv1HHOD90YAQQgTdpCgFopQ_NbpVZSVapRLIfnyRuGLnKQfzwvU6S5_U7g751_d6aWfOH63Git2stwKs2r61N5plyrGjCUVoHV9UJxd3akg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=lcBoO0q0FlPgspvdCJvlKg&_nc_oc=AdmmtnMerDBxyzLf0VZWy03usrPdSqbXm7CmAAeAH6dhB7eUt302qGcyCFJGqnCrRwM&ccb=10-5&oh=00_AfExRVhUtHaY5dF8MsvnbpLRo3BRwZrZMpEBQgf0HT_3mw&oe=6836B715&_nc_sid=201bca	39.985678	139.698777
131	4071809659542099	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_LOGXzz2k79M6KbMXhWGMSVeHv1ozfU6x0lMq_d8S1WzA_96CTz4nw7FHUFzqhsbmd3Wkybw-e8LTDyuJzkidkKyV0QuhSqwxV1SFrAq5tdnugbojznES5JSVSgpVXC2EnW1NWGUq1HEaXv1-Gdw?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=4RKA7G-5m0QuYpwZfeoXOw&_nc_oc=AdlzAHhNax3YQ4suCVCOCaJNx0G3dhSJW2MB9g6n1aiynojsZR-MOBIER_Z0iNEaWnI&ccb=10-5&oh=00_AfEMzFO1cl5c6WQv_QugMEhRdoIGzycu2X3PIL9JjRLHQA&oe=6836AEF5&_nc_sid=201bca	55.39517694	58.64419353
132	562368131402256	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8g79NvQ6vpwRB5fvlgB_XeY-tvu_ywiB8zHqMLVJ2lxtaIoaQgfigpQdHf-MG2mfE_Hd7NYtCQwyJTn3a6q0VwUeNV_lt0bFjv9Up7KgwdVTWUD2WAiwvqM2Domx5k_G_MT4SsnWIiKm6gPtWY7Q?stp=s1024x593&edm=AOnQwmMEAAAA&_nc_gid=E4Ol3guZPO9NGj7K-cq7VA&_nc_oc=Adm84EunKoApJlHUmx5Ji--onhCdJ5rq12f2S4HbjC16BBA7HUpOcpecIhzq0DaEuqw&ccb=10-5&oh=00_AfFdHVGIbzBDynLzWgVGVUI_k8mFuDw0Lx0BLxGVIi_9LQ&oe=6836CD6E&_nc_sid=201bca	6.6632977777778	122.15305194444
133	2941796239473005	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9Rp6DBUtueKdW3Mvh-tXDiEGAsJkYTK0gjpi69dcFPgFiogpvA6EZzebXgHcxFlePZCNjFatq8PcaNtQl24nCXwbGEsfGRxJwEwSjlCJYS0tQfzh2bZ5EPUigk-WCPyujLFLy3LiF8JXu_3-36VA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=ziwYpzV0B9Wel2ktsy9sgQ&_nc_oc=AdlkQwfQm88bZD9igr1gtQLSNbXDrKEvOO7aPt5pVa04v83YkFr5Ij1TCYZYKPan25s&ccb=10-5&oh=00_AfHMuKzqS2STUg1SzI0SU4ODtSc8Na2PZvS-sBdeckfFPQ&oe=6836B363&_nc_sid=201bca	32.399804	119.445621
134	2568148053494139	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8kkQ7gTowlir-WOaOfvE9QtRm2SSm_YaluuhnKz28XYBfEVDza1kR-ojJRmWvrI7Ug6gs-fWst_fUCQed8zqgucE9C1nIiA3Tfk2DHVeM3zzxCNuIt_OEOJcw3qiY_iO07klb5rADi9kb-S29a8g?stp=s1024x575&edm=AOnQwmMEAAAA&_nc_gid=F4lUqOPSTxmkHh4QT11zFw&_nc_oc=AdnoHmDblJmTaNqmAiEJyvoHuZeJpu7Ozpb0n6s6nsO2731fc8SKvTUrrqg9G-VI1Sw&ccb=10-5&oh=00_AfFURl1o8yCo8U97s7DpWOmk3Pry6M5y464kr91l9YvR8g&oe=6836B1A8&_nc_sid=201bca	-41.215527921791	173.4510593489
135	6992827120778879	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9AWqvVF2P_qmIe_UGqTxWah6RB843cqxT-nr8ALjBi6egaO_wG43PXx2DBgATUoSibatGDX9zn3ZOl4RlKSqpwiNPJHj1Q11_Z_a6wiaCM95juw1wKJlNg1YyTOuugymw-I74j_6-r1AmEX469vYI?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=L6ZMLpoCaqinVt8q1NqzKw&_nc_oc=AdlFLDp17TFpXsRxeKxMwab6h7x3gh_v0azlz3tXr_666oqVcempyKDco2leKV2OzBM&ccb=10-5&oh=00_AfER0tpouYyQWSh_XqSkfydYO2rX0Du_kaW8_dBSqGu3dA&oe=6836D7E3&_nc_sid=201bca	53.368084	33.803665
136	2163293750689121	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-yUdyUH5IkvXjiQcR8PST7Z8mtJiuV_3emH2ToZmxftwaRX03295JpJTo7L5pVQT3L_XXGfq6yY0ueRxJ6n-dnQdzcFFfsr3orTy77UdECT8gZOTWcsQN9Ikf4r0dWTFUCULMl8Z11zZK6Q_t1MC0?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=1YuN8hoUXJjd84di38kdhw&_nc_oc=AdmJ1ImiRCbL15RgX3LW7VFngEGETpLn2edBF-w4SaCJRK6XMIgAzu_4nVwLX9nWkrY&ccb=10-5&oh=00_AfFj_e3BRbUx4Bb5qM20A0J6feGnZu2UMj0Eyjji4kDfIw&oe=6836B59A&_nc_sid=201bca	39.251984213999	-85.469751058079
137	4597965750219491	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-LzmOOWbUS05JwCIcZOPmmFc6AA3Pb7GkobU6WOkrphp_lv57qZfTGIj57V0RCt60s9vfoBU6fPztqguHXnKx-l_x90dDEn5XOGBoG8L_b8Zm6xOQzVRUAwOvRyHaDkA0-5h_R4reYneyVB6NI3A?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Ls5zFFXv_py4GYRt4UXkag&_nc_oc=AdmNmdHKW7JlZOWx7NDvxv4-QZdD7XBbxS6Ay1vVuny7ZusyRwvTmTOTQpl4LgLbIFE&ccb=10-5&oh=00_AfFdgt9bAsCyR1hpS-7_jskOFXVw0ln093sAGfzvdctR3Q&oe=6836C22A&_nc_sid=201bca	34.590061984426	-85.64432131971
138	1463181454031916	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_-h7ko9OITMWALuriziNOGPwtnn8COYKED7iY5EgtsTyT1QvhFPOVG_yyHZ9fKciXiLbzocaUU-v35L2UemG19As0S82Zwpryod5ohjCZCCq5Sh_9n9tGkVCnghUGAVC7dqqUKMzLU2q0iZLy0vA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=T-Y_lKL7Z8mA_T9uEGDsAw&_nc_oc=AdkuqZFfM0R-Qrg5663_EYCwQDxY7RXYlisuCyUXazHIJf8wU7-LRq28kc5tYsSmAgI&ccb=10-5&oh=00_AfE5mJdbudS9oFmzxE-GTEeLrzzQz5BPHQf51f_1m4eQSw&oe=6836CEF2&_nc_sid=201bca	62.774475447584	16.136183436387
139	1919110301618918	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8nrVnwdavF4Zj2vTEYSdu1e01OWZ_dZl0GxcV1jOpzWRewn7GTwENPcTd3wadggpqC4x3uLlP09f7rhv5mjgE0q-YlHHKpJzlyB0X4O74cm5D-iMUuPbfLijDyMr30BTu4PvetXvbqohdVmRAZKg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=NmxX0vz_LCYWViDJkEENUQ&_nc_oc=AdlMofDTn8FdQiKwMfPJDQlYhHwOT2QQofHHPUzn4c7SmcOb8NozxMOiCX-rjkbuCKQ&ccb=10-5&oh=00_AfHAxh0DAcs8KUqkt3N5TxL0SAEQldXONrZEYISM8kgwxw&oe=6836A8C9&_nc_sid=201bca	15.208517399972	105.2451496
140	361874683414457	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-GXkT_QoQoI95wvysI5s2BDqZwVSEOEa0oosVUFFqLuV5f--qtLnD2SR31TP1chvIvLjKXHc1pPs41zrD1yNYBUjxY1fZdLF71b4DnkO835uqLEVO3uTBbnuha48uvjUkWzafykbHu48jPiRtHAcw?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=IHScQn9hYE631Uw8Drn4Kw&_nc_oc=AdmrY35-WmquD_0wvY39Ow0tJYDotsZ3NjOewWhLI6nsDHOFY6SjW3A_KU_xctOtzzE&ccb=10-5&oh=00_AfGP4ga2DE2qHKchIcX1S6ogVwn0Yuf-1jmTbetE93XdmA&oe=6836CC42&_nc_sid=201bca	-7.7627778	69.9502778
141	2109731829166219	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9uK9GcM5PVFoNVYpDeKy013KMeeQswPr-SvvSZdc1lKmHwtmKpzpbwP4Z8YzbCBss8sk3tKZ11O0ITNEdMF4KjdGHXmsBXt_Ilkp6-8Zdrvbbupf6WgQiyt4_pQLVpYNdzVrtQxfgQP9WXt_4lww?stp=s1024x575&edm=AOnQwmMEAAAA&_nc_gid=CDlrLxyPkcR5zYMfJB7flg&_nc_oc=AdkulVmLljSLAjDcQVleNFaCBrWrOJLZ9rbLn3A8FZDrlyj3jKaUUgutmtWgCQSKth8&ccb=10-5&oh=00_AfErm4_FCAyO355ov0xzx0VjFm1MYU1xP_lUCuZb179F6Q&oe=6836D1E0&_nc_sid=201bca	12.570723333333	-8.0803033333334
142	1478793435961751	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-Zm0ZcrjNjtOldrKI-9kFx2hrqB8cvnJI8oAh31YTD-vX-Ths20wzK2lZXzqb0nCNCOPZykVf0n_QLrbm4bE-zGq1pnA3TWGXIbv_w99JUpiv8_rVSRgJYCZZZIJGJw47RZdxXcAite_OcJfdGQQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=QqMtY_b0DgjlJ_FnxgKNUA&_nc_oc=AdkpiITOQW-24c57MadmeUhb08vPpnyYE7xoTYx8YEwD84IH3AuIVR5Adgm_WNJ6lZU&ccb=10-5&oh=00_AfFiIK0J86wzSoXvARvrLeVuTUNg8WGCsZGC9n-egjjz-w&oe=6836C162&_nc_sid=201bca	-14.4591823	-54.0418868
143	367134328768350	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_SCHtN1kAb3tz2JpssWDPI8Of-L8jcQhX6PZSs36aFWzJ1wMuA3Ps1oh0vcgfyPw8_vq92sxDUw49QhSzFKePohQG7YFLsiJW2X2_baxNIihq3SoCsPLUmrxjScdMTQIkwYkk1c2_cY6PncMUlVWA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=R5AiDcOg0LQJB1yssRDYMg&_nc_oc=AdlBDSAQzuqmQ3q58dY0rQMOlpgXjy9owYs1fDazcib1PpBZXaNRtZ0O2SLqIk5L_tA&ccb=10-5&oh=00_AfGo1y3GVrPNV3R_p3v91Xc4Oku4MU7j_E4Lhcoreo7TQQ&oe=6836DC3A&_nc_sid=201bca	9.5619024	2.61149
145	4344259535584450	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-thN1QLXWI03Cc7WcszUrai6tTMBRkr1mLSCfVgXv8-TUZnCq_pE4y0NQWI2EyoYr38ikkiUIJvk2FWxWQp8mvFXKe8RZXnWMw3IraZnw9PthhRqozc4Mh4aKb1DUuP23ooZmjldVGNMalCeglvw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=_wueQeOxupdRkfHWDnrpHg&_nc_oc=AdmztLdZXjpLiFSKSh7uv1DpphpEFgrTKAWtd3n7fTXdE1oni-aYpgt7sk3hQsp-Y2A&ccb=10-5&oh=00_AfGVIc7J8_odnOA2-w4pazxL-1Yh_JYIIAD4mw1HnX3ecQ&oe=6836BC5D&_nc_sid=201bca	42.58700702809	-80.514192385674
146	826402167968762	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9TH6-4UZU0K_50uMBZCKM-7Ik_ausUEf1wjx_69KQ5BAjnPDP8G7v-ImuW_f2vzaH8cmxwK3cLTXc4e70sVZYoIFAxzeUBC8BFZLKBIOvBsfMZQw_R3173_mmhoWDxSH4Lg9UwAoYdTTxPNMN5uw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=iC2-M6hM6VDtLUWo9L5kDQ&_nc_oc=AdkaDsPqO40Pnpz73q5NcpLSxdwJHQL4hFl0wGQ5uR1BVAQ5nQbyc9RoSXPsq6Zfi8M&ccb=10-5&oh=00_AfFv1XKlnJtH6lbINV0iwlPdZFY-Wtp1jb3KtH0csNDtMA&oe=6836D3A0&_nc_sid=201bca	38.96427219	100.03137616
147	3981805961911314	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_9XQPl7SlOgRqMiLSzuBSRgwq9ktVfBwZXkg7IW8e7YemV9SC8DrD5ik7hzPLDxq-ds0I4pDxfaGu1w-Ty4Gx2dld6vab_GvicFe_mPaiDuBehTXHOlKo-PiwfoNHUkjslwZAM0vo9u2mvKeBnow?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=NbKdVnIIq1l-vbRA85uEig&_nc_oc=AdnrIiBdrBgUUC-drisDcM6PEhgMy8cDQpCjWHLcFr_zwh_hrX8j1cXFmgqFlOZRwm0&ccb=10-5&oh=00_AfEcD5kAYAkN4cltMmRlCJPBJ6vzvMA2GZGcw1HzojCqFg&oe=6836B2AB&_nc_sid=201bca	-20.397685	24.521278333333
148	1783345978674051	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8KTOHd_PVNTQwPUU8I7jc6NXMlewEVvfjRG8IIGoAhrO1usHs2SZ1sy5XWLMv50gLsbTOgN_F4qLm_abmJrA66WOUl00_-YG1EBG8xt2NVj0t3Pkl66cArJowgYIVdsbmlJIx-aRhB-3QIQVVmcg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=xmH_GRFfwWTD8JXyMLVm5Q&_nc_oc=AdkKBpxrrySNEXES_T6AETkNl-AongehFcOGsyxLjsGI8bfq54-zJUU6K8thttEInqU&ccb=10-5&oh=00_AfE-XBcY9P3JAdZlCpU6v1U3NvigRYffzlmcvNfkZFRd6Q&oe=6836B8ED&_nc_sid=201bca	7.5253993055556	1.1295826353992
149	2978643502412401	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-m01XpWk-IV4I4VNgQcq7w0DsSU7X0w5NiYuA0ZConVXN1ods1rbVZZDfLa3oqc8KbJ2lmsWIzWaIZh7uaRWvRGNDLT8yHKVbVm_YfZooGeU_9EeHg-vP8lthamPupJU3HZvyoaWLq_VocPxj08w?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=iZRciMHU8RaaNVFiVKMzhQ&_nc_oc=AdmFtSm3EOJw4Lqpcn_3RQswn8MK8VkzgCi37qpn1bKHPoW6BoQ8UhVNNwiKg5P7iAw&ccb=10-5&oh=00_AfGRqJtmF4bvyAwGz0W4CnSmWJcxjf7mDv-eVcLmqEu3uA&oe=6836BD3E&_nc_sid=201bca	69.376755621681	87.528161738534
150	3788200721478008	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8ByUXeTF4GMNPplWoT0_tlfkFJ6sgEpx5OmU27pEQP6w8cI31pGFtc9PoxCPYVDRgr3b-H5xCYkB-OAkQXKTgiDmfeDUexBNEfSeegmJ5V0q1lWu4SKFmn_bQVMmOY4IGlA99fVORmnZECLRAlZA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=pwza0xXLMOBSRFzmKg_t4Q&_nc_oc=Adl3ZZaisM__RevRQdUZIiHUu4p98vzvB7JZca0xTmmvHi2EQWnUPiJBODhJGUgvb4A&ccb=10-5&oh=00_AfG3R6aIKEdtrGxySqs5Hc6Jz7e8FWTfAQ8VIL9-Lcv4rQ&oe=6836A83D&_nc_sid=201bca	14.443495915781	-12.192782252471
151	2894919347386496	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9j_OqRrGjOnwJ1OTqu6JOkfuW77gCjXBB_JqVLuYKollGZOxDa4ReRqa2ZZLCMmFyii8tpg0GEipQKDwS4trM_KsI8vB2JnxvfYN7UH1yqW_b9dALOMre19AHraSMlm5NUQoav4w-7lS_YbkAqvho?stp=s1024x765&edm=AOnQwmMEAAAA&_nc_gid=ZzoXHWp2WOOdLSWxsYCo9g&_nc_oc=AdmhU2vBxdMsZWL2JczhcDIfEZEay8KazAxY4ga60Qk_jjeDbozOOD7d0KkYZI3CWOA&ccb=10-5&oh=00_AfHRd057fNY6sTuH8X_OVDmLtu2tm1urxFl12kqJPpDblw&oe=6836B97B&_nc_sid=201bca	55.487313420958	28.767326574251
152	1923235994808993	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9m6uW50nzkI574xrzK4OfCa8KDq3zlSCKIdAfwXZSRQWfD783lg7tMwmQACZNN4TAoJKxRxLENjnikhZgDw-aar80izZT7ZqD1SzqcbqHT5FBF2DX_C2kX3TXVc4DvvDchFBMp47L0oA6QglU3MqQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=8bKrolkmIxufxk4kLX5sHQ&_nc_oc=AdlMXBICGIMZYdNlQbU19R295U6ybxURWovNavErsYajCXnolBAcOftHDbqQ44_1Mgc&ccb=10-5&oh=00_AfGMvxha2P4neU3BoPi3wBwtJqlJXbOqIMx24DAf37HqBQ&oe=6836BF8C&_nc_sid=201bca	27.070462	89.8929
153	3506501922968791	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_Qw3jx0cpMgD3n8Z3UonOtGZ2bgo9tXc2tZ_2L_CudtkTBZTom80JIqzNuBhImX_cWbiuaFNtdwQxpcoEvEaovBASYqCHs-xFr2ppDFoq1Jc7cyMtqctB7vn3RbE1uAFezHYgCAEuGqITkcAFdKw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=0T_cJlixEIKA3ackakBG1Q&_nc_oc=Adl4XMhizMBF907KBBtpkkpKmjpwc5ljqvHmazjS4YNu0poy2TKfgZgTipvkX6FBjYA&ccb=10-5&oh=00_AfHHOA8XSESLU9ARcasDp94SmMyF141qrQAXxFEDSE3DIw&oe=6836B37C&_nc_sid=201bca	60.196345029781	-129.97607257829
154	1434587273911374	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_oOaYCdsSVY93wzPPk5wv3ezlfNA3VA0E62H40nrP8WR2MTZRTPIRQDemWGGkL1ZD0oySE5cGBKxGPy0Ye0uADfoYlTr5N0rfkakc3CS_weXmB3I-OBzFd1I0u8usH57J7AjYazzHKq1S0rvi-brA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=SdN-KCQ1GaVdR-E3srcO5g&_nc_oc=AdnFZCxMIzKj9lk2IYdPF1EoLyOzKKvFtXYjW0sXfFHV5EaGNohqxvSEUT-ZbWRzz6I&ccb=10-5&oh=00_AfEpTuSDnvUdlFvM5ag3QxUsl1ajc2zELMVRLkgvRyADAQ&oe=6836B162&_nc_sid=201bca	2.0255154899296	-157.41999072779
155	3943615149084914	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_PPXZWonl4dQtlaZWwe2K3E2NSCvkF-GDV4gY_KcqLuLrRuz_HM_YFigBfE0ww0uTi6vjF5Wl2ofJ4zhWzfBg2xhCMRGh9Vu41OegXKMIyxbFEKeVEUV3bcU2EkmHef0MAW6M5dIy8tlAoA-uCyg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=4FRVr05UItL0crt0jyczPg&_nc_oc=Adnl2lhXodE0qrAzLpod0iF9ZJ29wWzzYvpy7tfRrf1kNmRuQxYXru8Xpbo0bCORiXg&ccb=10-5&oh=00_AfHtLDkfcZvzvrzafHJZRn8XBoAotYTCMOW0xVp9DNIXKg&oe=6836B993&_nc_sid=201bca	42.715525251117	47.656097493855
156	4513496515373367	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8bpwFB4hp4_Od12Bmi7egXj7R-yLFIv290fpSS-aLBggYLfWarMdaRUC4-JCnmc1BZewF5kMkmatNv6kfybIf2BQFVPV9XLrimUwk3Junjk-M48MHeMM5rqi_xip0y9B1TZ8-Y67eAnrw25NICWKY?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=7hbYUUf-rva57H-wDUekRQ&_nc_oc=AdmXVvZAfjccbSMGs4rSXbQ_QwsoSvk4tPfvMrTKw3X_eoh23Oc-wIYyfc3gtUpTXDE&ccb=10-5&oh=00_AfFeKgRA41yor2bZ59lmIpIs7Wg6MjjK2zJOzN6Vn9hHVg&oe=6836A69F&_nc_sid=201bca	36.833696980064	44.219059003558
157	8911804602228097	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9YthgOOuneyX6tZ7XAnY87smAhF_Et223XD7VO60I7R28_KEzfoGraywfK-toPLlR2nEjsQhrX3NJcXDyLqmLCQsaP2mUDpyOya7mVNiRNlgEZZtawlc6E5JfS4Je9TOAK4-r91Q2Dx9kBs5oHBw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=lrT6yeVmyXsanc-89cB41w&_nc_oc=AdnSJTIRoLil9-bvdMQtF7evCse-1MZ7ff610o0Twf-XZPxm_3v2hONMlN-tWEo42B8&ccb=10-5&oh=00_AfEkFKwmOH3h3q0yKf78jMbu_YBFqgI_NfREWTgBsvAOzA&oe=6836D883&_nc_sid=201bca	-45.486885555556	169.81537333333
158	931043234385364	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_Ue9-tjjAgc-F5wiAsIIKSwkibmRVM_BCDFL3zmgzZf1thhZ9y2Z1MbKpGHQMoL32TRFNLKT-ujiOHh2ufypkY-LKt1QQ17zGYnpvWHKTRCpkPjnly3YwU1RqUbfIriQDVKC8zXlN3SakFcHEv1g?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=NkSxLqnjg3AIbknReNUydA&_nc_oc=AdmN6pnZkBt_9TYszItGCwY5dsCKeYq52rDToN2EIx1T9pcE15Dibde6D1QvYxPltk0&ccb=10-5&oh=00_AfFbOgV6bwGdnuexFY85zp6zkkIfoB0G242zrB80_2h8ow&oe=6836B343&_nc_sid=201bca	30.166023899972	-102.4627042
159	5565539813518912	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9q0TncJStAwhE7THPHdxlRNPqFnRBAUhdE8UqqQLRaNK6ijER8GIyxToFIgQuBxNKQ7UnxDebpORYXIu8cBIqVQ3EL6Ht7Yu47Ie2e63b8H7lehVlQVlIPnAl6bGKu1_aw8s7ya3K1WIc7pR-6Ow?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=5P7leH7oJfKzB9TAO-sSPQ&_nc_oc=AdmI6LroBjgYgA42b_DGNTsWV8hREO_4RXOOyi-U-PUm-5TWTuNN7mTmablGaozqnvg&ccb=10-5&oh=00_AfFXKHq0GrTCqKIrHqXEKcCHLLhfrx30RbkYGTxZiq7Ggg&oe=6836C1D9&_nc_sid=201bca	-21.194466666667	13.674881666667
160	5945818192102474	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8D_dutJqgIVhLJzdyqoanoxWDcL46GZBn3sGuI91IUhqo0I5ERlsT7LbCA-Kb31WPC87HGW2CY47UUs75i-5xGOxUS1YcRNDyJi1RFZMnHppdYEq2m13awH1wHE5PQZdSQLnU44uiN035VjuJF_A?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=Xl_tQ0vin09rdzzYxTt9mw&_nc_oc=AdlOZw7xVyMKauDzRGen0A7Jx-JbNz5o6_WG54jgIBYD007WAJLGUH7z4Iv24FHrjaQ&ccb=10-5&oh=00_AfERGPTRnNItc50K8DmwQlsSzSXN0d7qFkVuAkWAmywo5g&oe=6836D962&_nc_sid=201bca	41.2286117	-103.6551192
161	1329125980908443	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8H13_i0OU94qFq767xe9sNQ4f7eZH9VFWRooT1xik7R4pvqaHjYEV0LrY5YcTDQRCbL9eEhWfwWIof2EIeelphUkO5GDbxaLP05nOPgnvBjZj8LPWyIZEIgPN4ri7ujtdeQhTl3LONBtC0PcEwOA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=k4RX_DsrBlsC4UZXk-00_A&_nc_oc=AdnRy6EnLizj4s1LOjlI9Q-SfJ0IO7R82K-0H_7TzR9HnNaZ9jPe20Lsg2YNB3oCIYY&ccb=10-5&oh=00_AfEXpYNVA5Oj1wJ8OsCljQwzVV8kvojWUmSDSq5hkoXwzA&oe=6836B778&_nc_sid=201bca	21.06936	6.05349
162	2904601103135167	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8mz1lB9_hUvaRNVxuq9j0jDW3Fr5l3Htw-nrcJxlaw2k-d3hCAl2XU2RFtRxJ1Y_dyya-rMLbg7F1oFalLg0TIXjUetv-Fxa06qUr4XcpTbJbN-t4grJfxKBhHt2MTWrPPPgZQIPx1X4mXJEXp1w?stp=s1024x463&edm=AOnQwmMEAAAA&_nc_gid=4mjsOYGrHklaQNZ7gRoPvA&_nc_oc=AdnZ9m8PIcKZPpT5UT5gumHCOtm47CszFE2kiYsK35y1dpm-CAgF0zXzZsiNcTATYuI&ccb=10-5&oh=00_AfED5kcrI-3zRsJf-ugF5B1PbuvA0c-br5JAzYI5wH0gbA&oe=6836DD31&_nc_sid=201bca	-13.074706235857	25.821023538247
163	1665612084259908	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8qHJ43M21lEkTDO_35OoVzBjRA5YCa0TWS5ZVz69TIHDV82SEWj7qqQxSOp8wqMcr_pbu20vAwPxOfLoABXCQsFx0L1ipG195Jd92DP9i9hefV625FDVPI7ENsMQmmsjRfdGueWMDhu2Nb1y59oA?stp=s1024x771&edm=AOnQwmMEAAAA&_nc_gid=12nHoAe5JpPGPrWOdb_pRQ&_nc_oc=Adl5mwJkwpXhHFJz6zNxscEkoC-rYajTZLTWcvJuOREo6AljwrZzrpM7KlSbIk5VJio&ccb=10-5&oh=00_AfEN57eG3M9kdFnGzZJ_ulWkk4gwTn6W4JEWS0SkAQ_BGA&oe=6836D841&_nc_sid=201bca	-2.7541717	-66.7727049
164	2029119027447465	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-BceUkRMXZM_wf3fPyryf5dAcHr0f5n6QvuY9o-Pl_rUCl5oHSJbQeRr5KJedj4qOwwN-gOzGS3XY-P5qh4G48J-UuBxw3SPqZnbaM7LJUpjYUxkHTh9g5PJZiXB8Qe1Zq0uj74yLYC1HctoOJlg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=mDu3OVMkNl1UFk960-OU2A&_nc_oc=Adn5-fDKsRpPnomv5zT6-PUlHgLHbdflS848XZBeoZWUfUmqeYyMO6mNmSixIT20bKA&ccb=10-5&oh=00_AfEoOhYGPhbyv7Dr2qdNZ6y_imd9FThgGsUcBiP6ryjoPg&oe=6836ADD6&_nc_sid=201bca	7.3627774433131	12.652623558101
165	2898546903745688	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_Kq3Ld6d_YWSYWk694Q5qjnZmCKvHwjAjvIxrpPXlCR1Lco9jHbB7RHOiW-ZErzGnKXlW3Xw5DtPSf4FMGKM4NrpCIc06InuYgzq-ABBwA6k5wj4FeFtaI5JmbaWPmd8fFhVJoa6rrHkd4KkhceIk?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=6PByg2Zb7P41pnrvmahauA&_nc_oc=AdnKxgOJQaR07hwzevmEpHFidRw6_waL7juyCNGkxqAkIXlm0AhgKTEoMvZWcY4j6p0&ccb=10-5&oh=00_AfHNQig4RsnPkY7ElAMnRXQHFZ_CSTbjUuBS2IEpShJ_aQ&oe=6836AAA5&_nc_sid=201bca	34.867758549505	-79.656344174257
166	832702935205912	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9EcHLHfhv970469C6HYAqLzU44HdSjc_0mLB2r4VRToz9sIrftVH0dksn-zdVWuwz5YDsIn1lZ07ozHt1ALS0gsof08xKnFnSh-iFDQQk2hz7OcFqeHiN19pjNk9V3z6JO3YvDOKDFcUl5d_-tlYM?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=HTPyTJ3D-qfcuZOIMey3qg&_nc_oc=Adk1nk3C7TNCvMIvSfbiMivhZVjde4EhxDOKsFMKdxoiXUl_rLNkuRIq1JNdr8_NIiE&ccb=10-5&oh=00_AfF03_LOWq6LLVzr5TpQybfGCOZyEqHtCiwxKCplBJWpmA&oe=6836BBA3&_nc_sid=201bca	33.716745578547	74.519290956317
167	2739784822951218	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-K7br_E5KPoRx0R8Q6z7NJ6Xyu4bTt1sa8DcxCuyqoET407rYFyXVBazUfbgj13032GhGIvnU3mff3hM4807jLqy6yQzNcHkzikHE8tv7FYHO_dzL7btNp9916t47SolCSEveh8crzC5csVLkW3Q?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=Gb55_K33skoN8BLUnjRYYQ&_nc_oc=AdmQLikTPigGj3qZyQJYiBTO8YTI456W38AtGby4syos6of3Wue2tO_loEvcToaRP9E&ccb=10-5&oh=00_AfEM2BK5exQcxg2rdTjfeiQkgKYMbfZkqFufka8l0nEGdw&oe=6836D20C&_nc_sid=201bca	39.800421201527	46.767565766514
168	1518670465392820	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9gyufVybCpMzJ7p2GGjdC5QN9KU2vRiP8a67TVtKGsd5-fS6EqAjTWg6b3nDlbmypuFDrUZB-TVuOiaPQ0x5W7gf3e5iimlMmo31oG2Gwhu_QA1BwLW_rr38bNM29ozcdajhHN8TNA1eUkx20pdA?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=zI0cWbcjd9IoPsEmSH-tiQ&_nc_oc=Admf5cNjq1-NB9WbtzXT8pnfV_xyiW2_111oP_yKFolOky8WureOukvNcujQAerwJOw&ccb=10-5&oh=00_AfHZ6fN3r9ZMN_eMT17H5WrB3njjjgp4oYeMUZwNRYmupA&oe=6836BE83&_nc_sid=201bca	35.100909926	129.0595819452
169	2924528841149429	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-vE6_VBVn1aqpYtlYbxslDUX1HAuO9FStRhQR70-SwBOE1tOrvfKvShAHFDdWwBv2DNv7ZFCI7Opi3E0W9iLrcoVCUrXhDRo_6aGCHNae5Mn3kympO17V_zV3iK_OoZvOGEcaBVhazSYlV0VAqGnk?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=i0_5dXEnkLdZDQEPwvAqyw&_nc_oc=Adn0ezkFIC8p13NCpoji25CNl6S3OBmgO4r2v8NSdBY7ApTHjeKVmCGL4elBRxvByPo&ccb=10-5&oh=00_AfHbarw8P8JsP3V0vPbg4CB4a_uU2N7ZlUeyDHcdes3RrQ&oe=6836D56A&_nc_sid=201bca	-29.37836647158	153.24926561172
170	2861247174141237	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_azc9LD9jiaFiCYdfReYwo4oIsXO6TrK7NUasn0BWUbIYLttOjWjxuaqonft_Ypu2uEGdjHNVUgharNgnu6BBdqwdm5bUcKiebCoOu-2yYf330bFbVT8X8OuSgkfsx_wA81d4FS6Igzakz0R7H890?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=cyjBfMyGgCWMqdg8WL9TKQ&_nc_oc=AdmYzHStYs6blpYI8GRoaEtm_9Tbjo9hKjVJPLEmj4Ph0FSuIBu6njBhKIw7muyMor0&ccb=10-5&oh=00_AfFpiYhGA4FaFseuedJ3Wuw-ObdoARB3NaqFNDvQCGulSg&oe=6836D53A&_nc_sid=201bca	40.832986756757	29.426815836525
171	184355536881748	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9GFqnWpvg5FSrpP5MGQg6m5W5abUxDrPhirhsAzreo8By0c5zoILevQmF0MvKf1VPc1IFqk5lXOIuIiXo5YTAl3hWVN0SbhbGPCMimLf08irtBHq00vYvc5NKlT9uGc0uiftM6HDtRDkm0WdsU4A?stp=s1024x290&edm=AOnQwmMEAAAA&_nc_gid=25KO3Mou3jT6_Om5DwIKzQ&_nc_oc=AdkM3-IbGTL7Y77bNnaQHssykAU0yLRFycpfHgO1Eddfji2oH0-yK6kpn21g9HV5PA4&ccb=10-5&oh=00_AfEg5bMsG2Kf-5hen7UsMlGWWHHeukScKftKRxhEuKpftA&oe=6836C6FF&_nc_sid=201bca	12.661353333333	120.41438333333
172	1908524995975128	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-QfmBDmalYwArgJDpvIRLThTLTRjV1b5PSPidT5N_8xwlyfamnfHfx-tQ3kd-58naVWjj249-0xeuWnZtyCkbCTYDTBYuwikJLilqCWkVgc_OhjtVTGFrhBuYn-zAB0RHzHWszEicszRlBfYEBQQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=id7aajJrJRKltPVCR66fNg&_nc_oc=Adlos8cLFNoEfTtJUV3N5N6wY-i2xPi0fyFzY4dkXB0JdAvw2KPimHs1toXQvMuMI-w&ccb=10-5&oh=00_AfFI7hnnJ8yG89qA0X4BQ5FwCfk44l-Y2jD69HyMoSi7aQ&oe=6836B28C&_nc_sid=201bca	39.526288899972	-110.39869751997
173	1396201187420538	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-vh1-vntWZUwt7naiAaABrhiLSkZGrwzRZ3KW87NPuFz09xzW-SDuGUxPZ87tsRj_NyQhPZBc3a6_prbvSriMxYOZZ7UaD4afobII8gtsVjCVKMWfhYtqw-QPU5NzDVsBNMQk36Z4HwSZv4DIeKg?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=oHH4nu5sPLEBdcZ5fz1mXA&_nc_oc=AdkTwGXoi27U2AseXPOiXgpa1ErEAhzCK4dviwx0T-gaz6lLu_3708bKKy3lMml1npA&ccb=10-5&oh=00_AfEq6fSTRFYSxzq4ISA7gZIn_ikIP4IBHTrsaNL-qDwBxA&oe=6836C455&_nc_sid=201bca	58.18261113	57.7897827
174	991778791359158	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8XlI7oHs5R2NFkfrNTOKKOMt9Zp4B9KAfVQ_Yyg3TbCMX1mPXCNc7LfKSYAtyvZeREuTXuOkSwJACKZXMFuc8csjq6YSZsCoLXmU92jkFpJA5PJI7sFmU_PZz4WsR3XnIyXU8RmOTXyLhnWfbNpA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=2PZNAGw-eias75q9AHci7A&_nc_oc=Adk-mEXGWXh7jDUE7PgZoc0bajITram7jlpzQ5lPrJNKLyvPU1u-WWqkQKCyKw-RyK0&ccb=10-5&oh=00_AfGmoq7bbCPndyU7DE0-Th7-dd6vgFjCDjuYww1vA-Wscw&oe=6836D0C9&_nc_sid=201bca	5.936035	117.79807397222
175	4362839133841390	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-_y_Q9kWd_LAtVhYv2yjQwV_CyV94dL3oGzA2AkCG8Ew23xigNNXGKKqq8weMsfId8MmURoI8H0bXoe3y4qamliZVSG6qEyymLNpg1vH1vWINsvyA_e9AlvXnzUATAucMf40aIUAaG7G8zv2wAoGI?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=SH-6yGzGwAGYh573RjemcQ&_nc_oc=AdkD0m0TIe4j4grsPQF5SZliZqO0eYogWjIAgM0mdJQeopjAmjHDVzntXt9CLQ6ibOY&ccb=10-5&oh=00_AfFJp7WrN0C-r87jDkUSp18RGcZEbQcUTgWFTnTySbirIA&oe=6836C04A&_nc_sid=201bca	49.668341099972	-103.6934559
176	1439099563736651	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_yfES2KSHAp1LtlqlqZPnvnhr8eS1wTMPgRvrKQpdvWN_fxfDSMV4DNxnVeVqjQmP7RGa4rOstxraxwjF9FoASORbcYaJF9noZZXviNtYNIksuhswPyfv7c35c1THCLenfxB4Ih9OUcvSGJt34jDY?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Ko6XIOH-cLw6ACjDZzJZdA&_nc_oc=AdlRBGWBpe-srVFjNVsWvPqhnSjQT0hGi9Di3Udcu7UrGDBHbJ93igkc0g6Wwc9-M0I&ccb=10-5&oh=00_AfEgWwHvXjUJ1HK68OojlOn2Sd81ESfXIqR5gIS1MptNDA&oe=6836AE2C&_nc_sid=201bca	-31.78514	-71.005259866667
177	1765053820560972	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9qkE1L1b3HS4jQrFHGLXrFJ3l-agoDbeEqm0hUDX2Plq4EyCxE_HEEBmhpBwqLRG9aAaTFb5FrdNkwQ6Z_Azf7saIVG3VcrXkJp1KW2TD4pveA_wYIDfqn5RhhjVKQSmEb4JsYpnGzcOedOzcEBw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=P7cUFEmKRwEavW9SDEMGKQ&_nc_oc=Adlwm0Be_LSMhBpCSBHqgkQeCFtK0JyNFIvEjAwML9azsnAJqCXTsB4xDiD35uFY4LM&ccb=10-5&oh=00_AfF760z0bKCS2pxN7lFWTlX1p8--W8GssEGkYXaMwhRpDg&oe=6836DE6F&_nc_sid=201bca	50.59624	7.3495280555556
178	2988792331391471	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-TW71_8DWR7kHmdMKkMMWYUJLoQuF-fQ_0a-bVrQYqa84W6YOP3ghNqsXzTvRV9dVneUPkn2YdKH1rUpOhxqTdiD-nG98QyvA2U3HvxUW8XJ39ZP9zNOl-7AhJXF1UKEpLZSSrPeGXWY7ubaVbbg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=fsQJxtyASJru66Tqo4f9Zw&_nc_oc=Adm8lUjDHyCkqsYG3sgqu1IZTDARol0-pPW08wsE7apJKA5RwRJwWyVtfOJyRCokNnQ&ccb=10-5&oh=00_AfHW36LUbPJhRpVXK2bK8rJRyJUG3E9kDNN3ctmgfwzH-w&oe=6836BBB8&_nc_sid=201bca	21.857566893898	-80.206910822638
179	2285490144945874	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8kFyHrA0bf2rJfVeyvl0Bx1U1GMBL30-PMwVC-N9nUa6HrS_Zo_wV4rIc39lp17u83GM43TSjbEhQQwTix-8UjbunJ_AkuX0Ugxpcfru4bfaIwmUbkLpNYSLw9IzUAJAWkWJIui-5YpJfpHsDtDA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=cReXZpoHuW6SqRHGzx7Zlw&_nc_oc=AdnE2CqRJIQc0bnpFt0N7AP1H1-Oik0tKz1QKlHpDKYb8lU6OTmVq36nr4xC106RrXY&ccb=10-5&oh=00_AfFObPlG298-Klw1SjuBJ2turq7pCi0up11dlM2aBGMKRw&oe=6836B34D&_nc_sid=201bca	61.1119336	-138.5600214
180	756408608376444	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An90N8K1EstXUneuqRmsZt4Ca4wlW2f3QDZj32MJUZcEZn4suAW_EycRzFwJwFeNoHG9Du0JXQRIyJskPzU-wgEBTYAYRSlZDpgo0Tde_oHP7OIzaO8YXDX3ajz6HOHOrl9cBXIYNM0H9BlWVAHndg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=8gsFXTDYtBSvaTx6nFzZJA&_nc_oc=AdnQJQhLDzbkyVuA8jFPd-bmGhHIUGi5kpO-hNolenOQK6kXzUuDinPQG6j_d-jHhO8&ccb=10-5&oh=00_AfEZ4CIMt488cj_QfiHmW-nHiEuem8xFk635I_Nm6j2Q3w&oe=6836CBC6&_nc_sid=201bca	3.8036230387735	38.960171033432
181	9805961219463060	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_hlb4dA0xhwkcPDopLwr8RNH3KwB4dh-pgE0rVRRpnqLPsN_or4MUIgSjpJUFlwkTfvE_n7W9ipt8L3PIH8ESfD8gvdLIVPSWCpCq0gd5AhGgEhu14_JcfjvdU5TQGOOBaaEz8xWfEPnNLW27ZNyQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Z0ftMxCC5nSd2buC-h7G_A&_nc_oc=AdkVi1Dbhu9NczYkpobmhnn060CKsyWENyJhQsSogFngBYZdiGJDsJT2zytUFVDsZyM&ccb=10-5&oh=00_AfH87YFG1seULyyWOB0HfyVTVWy04I9ghxWaWz5rE-ZhEg&oe=6836CA74&_nc_sid=201bca	25.733324556667	3.6220212966667
182	1649188555281753	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-cLSxfs9knaWsOoXDGVyeW4gqYlRtV4Mr7LE_37o0DTtm-R-5gmODMuUvZKxlM18ngvCvilsmKgp3ATtautJnMC5yvJ8WYT1R_wLUU3MC1n5wnP2TOU6gNYSHTRX2u1R4-_AkOBZhs2CKmR2o8ZA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=7ovoYiyABS8zu93bn7xgFg&_nc_oc=AdkEywQ67_mJL8b2WiHvian7Ah3toLDLAqERa0Wg-gnX-mislGaGXsG1XaLOeRy-bc0&ccb=10-5&oh=00_AfG62Kg8Vpo06NffV4T_EsWZbdP8YsJE4If4HhyxOJt-Sw&oe=6836B1C5&_nc_sid=201bca	55.183310955814	-118.81709709775
183	1549166202621886	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9z557d_BYpcSXNN7dzqjmN7RK4wd5SQi-cXzjEQEWcgjZ6E8Og1oNDt6L4mbAbniH2AS1QZYUmDmO-ge2BCPUzIPk8diW0jkiTQxHYHRLOntyAvUzT_s_nvZhIWyZ39mcjl3bBkb0_IbHqnv8IGA?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=Zx0JzmLuCKI3V-uAoTp8jg&_nc_oc=AdkuBZqvVp4DuZaMYzZB4scWtullv4Pv3mw9vP6nM8IGwkCg_L6ryzm3lZJFW2Bn6Dc&ccb=10-5&oh=00_AfFsbF7YKNUr-uDfQt8zFVUDZsWVMnHRJ52G3rnnoQX63Q&oe=6836C4F1&_nc_sid=201bca	-0.56557620272	-72.14489445847
184	3900925399991934	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8LNw-IN4QjJ6TzuxB0MfyOHmOFqGE-88fDGlGGv8zLMRgmCHunxPeWPNqmGCQBoin7-eCUvvnUmRH5Y8rp9-5WoFudIlGEG9lZAofx1yU5JtQP9V7Cmc4fFplSQwZPJEWAMDwL2SJDOqdzNo74uw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=KBvtCz-rKoDzC6eWgaiHTw&_nc_oc=AdkiG6ii4oeKfnTJVHp8mOf1DtWuBYrU3WRisHft8c_FclvRf_pY7313MjFI3eBHJi0&ccb=10-5&oh=00_AfHXrDLd8pAusg6lQ1UDo7zz0rVNq07yAVMFsSRFxUaacQ&oe=6836BA99&_nc_sid=201bca	40.4984771	49.233823899972
185	514356816231680	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-8uhxwCPBnbjSW5YZwOUNQ0_UORai0dqjrNQxw1VpvAEpoT7GY5xNfJ7NrvSd2-qi9VzP1c-o5DgKJ4lnz597h3hSJVx3yiq-dQCZu0lAkpEgSMqmfF-mVYqooQOPgocSZnI2SCT9kLjkFsdOtIw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=1O8PXxmsZsxoiy28L3-lqw&_nc_oc=Admspd7xF6As7KjPCe2RrVwcIO6GARCu4kF3mWvVXRmvE9oZ1E92bQCbXPtunsCC8Xg&ccb=10-5&oh=00_AfHO1XOOGbyhmFfnSc_ApUKWbQ_u5GxETHMU7HKKZ8XKTQ&oe=6836CECA&_nc_sid=201bca	18.238870611111	35.624782555556
186	479591466712663	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-iuEuoE_64qQ9_6S2KdiAZ5p2j8ytjkLTMLH-qP1oqVjIyNdjDWDqzROVlB4aVWJMKsgZeqV-R8obCCW7PIkOfGCirxxKR3fSsUxeo-BflgS06_tc5yijW_pdiip3Sj4_jAo3WCgFwXAzo3yLISwo?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=OE9-EsjoOcpiKIJsjuLWjw&_nc_oc=Admq49T-IoZQU9i80Matlgnlk8mQfLwlDcn8RRfjMiF5GxdX7qdkcDh4_4iA-xpdjz4&ccb=10-5&oh=00_AfGzpM-q531FSm6lDQBw1Pj7NAVW_6WEryHDEvculXZiUw&oe=6836B1D3&_nc_sid=201bca	29.23639225	90.629625194444
187	148912217239941	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9Nb1uJbuwkyjKMe5-gqzRirYj52b1v1P_RCGrOfa2vzjkvBPD3HiVVVIYZ6z8Xg2KwQCEXBKuSc_ifR44401cR7SQfY49f8wnvrB28J1qdQumUrXBnkBupTaBRINGpq556CBv1M-IJ8tz705GpZA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=rH3FrUqqd9qGdGOXuNuuAw&_nc_oc=AdmaWnWqSwZZw7ektLfXNqpTPc1pzXR5b5dK_BD_Twvri5GPn-xKc_y1NEBYjkqOas4&ccb=10-5&oh=00_AfHhJJlbV8Krs-hr8N9Ip_XzrKgIcImwsroZW6iEPPKqzw&oe=6836D41E&_nc_sid=201bca	-27.127833333333	118.07463888889
188	1994289054056766	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_ezuV7ph6F08OAFFbCIrVT5QbNutuvaTgfOAACy2Z9GY_yhrRNSGJ1E53jislNDVWEhTYa9D-skGgAepKRQ9_5dgQt0F25lV7CikudRTOcWjcLocO4v1C_NzqBvuW5u8Q6IFJL_JB8E1ZmdbvNyHo?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=URrDAtbn-fiEHLCYCBY3qw&_nc_oc=AdlPQJVH_2bTmGF593mWuPhwrEQ6M65zB0GjxqEzYiTeqmRi4ISfz2zCxWvGFRttI-k&ccb=10-5&oh=00_AfEGaeuK9L62xSSpaqGAQx0zZcnWMay0bwEjv5jUc6d_iw&oe=6836ABE1&_nc_sid=201bca	-2.3890968365617	-48.232346763879
189	1777557375748620	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8ybKclEKaD2lb9HAda0Tf3vHVKMDyLEFo7P67jvkRctMz5hb_NK50roctPMg2bnd_Iy0Z_ta7ttmZD2AY9M9bYgd4HZcsgs3Y1k7YQND9SGbhTsIOwgEc3FPtP8udn66vTfc68bRClx4kS-wfk7w?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=lDbLJ_BdKv08TGTiaIiq5A&_nc_oc=AdmQPur8D9b2elbVyD16AamD7RZLDZotNPP7-P620vXWSXPeE980LopD5dVEuuru--E&ccb=10-5&oh=00_AfFvl7E1TTsTWYFIaNztz2lleQ3iQb66k4yBzZmNQg_ZJA&oe=6836BE13&_nc_sid=201bca	68.173944	21.801734
190	7198530016935093	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_ee0jOncGrsJ_42Vk3IYBjMX37FlGLqOTclPUr0Aqcnj6Whw9977snWwt3fFopXMeWrkSE3kWvA3X8faKqsbr97oeX1gyBtSYod41mojWTuhAvMVOPWUo-e7abPUbkO5h0jEfL16gVzg-yCPp4Cw?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=3awzJNMRk21f7mZB3x0Lbw&_nc_oc=Adk_AxQxFp-uj80c9pYSzCSUaj67dE-_zZYLNQ9It1yLad1cWkvMHtqFOJ1ui6F_mm4&ccb=10-5&oh=00_AfFQc8Dn297k4UVaXwPMXhXnOGzy0Qu3w1zT3Rrduv5GKA&oe=6836C9ED&_nc_sid=201bca	48.7458333	120.6894444
191	2839543279600962	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8posER4t9WLzQwc4mcUqkHNE3wKG1p18rhYHjUwSr2weGcyjL64r0zlyHgo6g6JLoU4USUJBvaZuSj6d9lZxWGcg3HzduhFZSHZqqE6KU4yVqbwZIewRR35zN3Ku7HRW0EGBbBHVgT5xPG0wvkVw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=6wD2YPUGHIxGQlvJC64EAg&_nc_oc=Admawpi7jQeviu1DeGc39cBC9ja3snLDnk-uHsG4sBkbr245Bs1gNN1SqPGmtvKw91Y&ccb=10-5&oh=00_AfGdFlkBxjG8AVMfgu2t4hWfLMCUO6q5seVWcWLUgVLHiA&oe=6836BE99&_nc_sid=201bca	65.13208675297	57.307653710891
192	1314880252928723	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-XRwHb1gv7_GRFU3l0OyKGRv4iwbdXGpU8KMdWevgRLdDd3J_tBCscyfnwi1yGkwYlbzlWOqh2WzGWSgenBGYUnw8-FZLpIiMotsH9FcCj0K5iYYULoAGHgmDorxXOVU0jbu7374VrMhhKvQuaaQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=WrCAhQggQz_Ar8evw9_PnA&_nc_oc=Adn57WC9HLPTyA9OWhNAWQTxVE2PE9iHV1WbhneDjR393giZKGllHXqGORCt1cdjchM&ccb=10-5&oh=00_AfEOweAbWJX79EUt7hYt6sfg3k65SMaBb-4I2yQfwSXRtA&oe=6836BFD5&_nc_sid=201bca	33.402857490545	43.259622048348
193	1657208954740101	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An93yxTZGDq1CS5XvYD3d51R3VZcdcEfvptJK3EEkiFnI2D4rJXqZfyaoFsJFBj-aVIstUgtpjboKNQeXwhZv4wmZA0db84JSUX6eZJ20gPwdgPUGcVAX9YFnr2OtTXSGwxP-rjfyDVvvJorItuXaQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=nIxpmBaX9edWmENWvkZB1g&_nc_oc=AdmNu-4mXTGaqjXZwCUEB-HSPhJ8hDog4h5bh9RSVZXskldRIP3GB-pPZi3GTC-5-E8&ccb=10-5&oh=00_AfEIGW7OHXnrw5SYkiaF-jp9Vn3oQ7zmYp9ePV3Cc_NbHg&oe=6836BCAF&_nc_sid=201bca	13.3921345	144.6616655
194	1242303659518404	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-qaBpMYhv8gaAvfPDB_GbSMITtx5w1fAP60QN0MENJn7NX9eGZii0XP2MdNQpLfJlvRxEXF5os1kL01b1xXd3Js6gErVFQEB_1wjD5MUNmjWwEUZcEQ90hyknEtPFKX_fr3sWacNC2asRoFqcjqA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=jXzTD9gQxN5fFpXU1juoJg&_nc_oc=Adl8No5Lqr3CemUCEL96w35bbFZ2Xem__YXLc1dDsYYHxkUIasQsn-7bG4f3rHoyteY&ccb=10-5&oh=00_AfEWPFIUs_nDd-NQmn5nBZr3-Kmbp8RaCmZ4PGA6QI2dbw&oe=6836B16B&_nc_sid=201bca	-40.761911111111	-62.928844444444
195	3062781497312287	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-XqcdakMn76lV8-wDIMJbRCjqgUsaxJzOPV2N16a4IWXYsuGZgRGJABGesAI22E-owMirBL5LAbEKE7_kAwcQ0jpph0ogks0WzwmsQmAUjfCAGimmXuV2Ojy29zA21n42UyoRAKvA2teRjjSRyOg?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=UOiINVN0T8lImqCykuBNBg&_nc_oc=AdnLIPtfAs9L8VLF9ZYiDC2C4uF4dFdiuQv-8FOnLkycrdAWDqvxHe0xrcWCqyppbxQ&ccb=10-5&oh=00_AfEMJKWLhaHn0NrbiB42bmidWXCL_b59qq3NM0vQBmPG_g&oe=6836CEE6&_nc_sid=201bca	54.895172070087	52.2815768
196	3225189954378529	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9BVj1G3vvYKYwRR5XvxaX5QFFPoZ_GjaM4fYXSoGHcNSvqkNrfH0Rg9Z5KZiDaKaRZ37T6ncd34NQt_FlHZVHLxp6dKQD6EySoUIZD1XGtReli-4HIjicq2GxSf5vQrr6npmR3uIrwa-tz7Az1rw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=jD6C3AIo9T08ek9bJ6QJsQ&_nc_oc=AdlooGTwdIfSl4v1cnUypGJBlCyTzbriLOqhTcZSqy94sutXotPyJSki51i6mBPL6yA&ccb=10-5&oh=00_AfGWPiWU0jw5qmi-wCOiJVeROkrOKdQp3e0RDndZn4hAAQ&oe=6836B576&_nc_sid=201bca	-0.16297426741573	-49.983114997753
197	2861262270868936	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8h2A45aifqWRnvA2hsMFIYjmildnhZbuqone3O14WsD3ffdMCCoif3uWXS-ySy2sIDqr4YY5h30CN8vfdS_bVNBLZ5iksUSaJ6IfyjpFEouAo-mvIbfDJlfbq0oOVn6Nw9FVyzj5q11V5llSGLog?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=xGdBDCbKlmAeZ9ucgxlvuw&_nc_oc=AdlzBkG6GH9Ip8I5HWw7VIsXP9NMMQDyiaJFAfCbwvB526kCx4qR9UsJbV2AJZC9jEw&ccb=10-5&oh=00_AfGXRybqgHvQR_L3xUPz8tzUw8I9EahVC4QZ1WX0EytUbQ&oe=6836C09A&_nc_sid=201bca	66.120074053221	28.182759537358
198	2041591265979335	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9U1nzxuLcc-E6S1_6hGPN4a1FQFfWgDfsafpkOymDRlPR3CvBb8DYekaEFzmy94qU5EX474ckEvmoe4V35g8-xzHyDwGqKx1pEASiiizdKwNccwTqpQxIo6DQ8X_JuBPqEdgEn5MjgaXfA6ddmtPA?stp=s1024x856&edm=AOnQwmMEAAAA&_nc_gid=ICgYFa7GkXk_X4bBJEPQsg&_nc_oc=AdlPxwk9sPeuydus2UMSBFjbs7IkrP1yRTyYCewnptEgDBYCwYT7PlBP7jPN907SFZo&ccb=10-5&oh=00_AfHB2Atj5eXq1t20I9vlZlp790l-_R-PialgcHJS2_WkWQ&oe=6836B2F9&_nc_sid=201bca	31.87610333	-109.58310983
199	2005918489558551	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-RQVVDIatjZT07cUQyVW1a2awYjgvArTiMf3iBRFXXnRlpTR0DmB1dkoTmdB195KisjWLv0dgkDO3tyCDiAwQGcbSCHgSOZpVrUP__njiuZUsi1VZyvw9tk8-yWMqBCYuDAXKpAWfsN_wZiR442g?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=izvvuyRYMSercvCu44A1ug&_nc_oc=AdlFH9fwKIj8-wo9_Gndoj40u-xjajNYreeooa0T2Pk6JHriMMNtpxueI8lUAGsF32c&ccb=10-5&oh=00_AfEIVqIQ1YyLlt22kxVPR07HpKOvZpMEDWrOU74AVVKXrA&oe=6836BA77&_nc_sid=201bca	45.790766666667	38.69705555
200	782009790119547	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8tncfdOHmAm9OrihKZdcxlEcs9BjjWegnM04IlbGqWIVEorPTdGG08vWJFXVmNUGrAwvIkemIxqPiQj-emwC3jI5Wnqoyv4GIvSQ4t-WPTY3jLZYhR_IRGp7KPfzPpENEfN3htJl1cWtNUrkeyMGU?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=8-57WKV6yg4ab0NB3dN_aA&_nc_oc=Adk4YmQivl26_TqQN-XM4vWhWgkGjI2XVgAtRHp3wOEvplEzOYCoZJDvQfHoofRobOY&ccb=10-5&oh=00_AfHoUfhWCMfUHgtRoYFw_A6NwkLWvfcQXMtw1wwCQsHfaw&oe=6836B766&_nc_sid=201bca	17.0716667	45.3308333
201	3615843201855679	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9ZPBnCuivPKnxYRav7iO0rGTOeV1azpt7ex_Vde2hMvIvMmR1xM91xUwctvaGo7tzBW8wvcDgBl1ovj09W2ZZsiUdwWz8bzhyK0hIPrG2oZVB4xpLYivnLVkkI4mgKHCXbXhxiiVlOwSARy3nYpXE?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=mvjXpgrA7cvgLOqqw_xFkA&_nc_oc=AdlhLYAibPvv4vsJytIJRWngcncHZDZ1GH2GKLb2X-Moj6qEJs_B90LQF_emg5zoKBk&ccb=10-5&oh=00_AfFncMlaiUJItOepB9DxJjK1Xr8usInhe2E2OI1MUqW-RQ&oe=6836CFAA&_nc_sid=201bca	34.160811341483	131.23931559968
202	4326677167356171	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9vdtd7oSACkEkkc4xGqppqf3LBi4dJAgOn8cja1BMIdpF6qOfgfhNoT0lwYshyV1jTKpbR0ThvOP-prXpIUOT0jQ7JMXCxrz2V4YZutYQ6oi5yDeAhexFfF09O5Gm3hjvbdFLdHTxBvM2OVk0PxQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=s44OV18MPEjeV3OiAwPv9w&_nc_oc=AdnT0GbeBbq_5LyJ-7LGEUHf8kMVBsEkGtPc84je2XXYYEkVH5r-187-VRoXpt44Tb0&ccb=10-5&oh=00_AfELf0YEnPJDCE8mtYeb3NgUwHnsxOHwEfplVcG4u3P1pA&oe=6836C425&_nc_sid=201bca	16.860366888649	77.392854893514
203	6809181215765239	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8IGLA4cu_J0cw-NxcsQpcZjORE5VAyMA-RZmubYWFjR3MgT_ACZu-Qn3wnyfjSOsKRXSBNZlxQpUFxxP-CwWRRFpTVFBLYT02VJVHTx1m0MDT56hJq2n4L_P00tjk61Q02hMOf1yVf-xo4mst4rw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=Fe7z1Y-VDRWND7DmzTe89g&_nc_oc=Adk9P1hAs0NMPNYPPyFGbMmwLHdqbSJncG7RlX8tHv_th8j1cpkdOx5mDCQSclLBoJE&ccb=10-5&oh=00_AfElZyT9FoEd9RCxROGSf8wT4d1jl2Zl7_9ghZosfSQXSA&oe=6836BA83&_nc_sid=201bca	60.727899184316	-46.020295700938
204	1684683808587717	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_hroeLGpvFlXep94MEYE1S1tBbJYYiDYBHqJ370nkeOGhYd19KE5lx0oASzDfT_P4y0jCxPoc3IQ-JSyY8D01Y-ZNEx09oIbAzLvu1AW1VFJlIkIri9QYcO9j9yvqwhkg_wlB2iQwThiPWP4sM5So?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=OsfF8zYHhWkVPh9I7uboyg&_nc_oc=Adl4g85RBwMOtElQKj43L2N-NsRUrmyU7SUkFGJV2Iq9KekMktB7NZYlC2tiTMLJzVg&ccb=10-5&oh=00_AfH6Fc3f7Az-FyLsVV5hiRuymKagLAZrzSy3b0bJC7c6eA&oe=6836B9A7&_nc_sid=201bca	36.697571900001	33.2000506
205	1524504691637271	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9JrniR4mze_7CQOs7GhDqXUxwvsvvw7yycm6SgZLXjeaOkWG_ee4g2trTnizSVojAOQHM-YwB9fJGnDJsKArMS-UVJfXca7af110_RpbNZ-ETYj8BBFYMyxmYOPWU3EzDVpwXCOXZLL7GMqf5qtA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=gfwd5uyZmG9Dso1-eMeHxg&_nc_oc=AdktEczfu1uA9o23jacpfKPrTD9056kJrIsPsE36LBSWiXzF36bKxB-9-vimePvI5rw&ccb=10-5&oh=00_AfFo15RwJi-Z-SdYyTvx38_L-_SWJIr7w1mf8Yppz4IVIQ&oe=6836C133&_nc_sid=201bca	-34.888748200002	-60.011226
206	509060656959072	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_6Ll8aFor5JowBnWjE1jk2GxJkRuRzH4076tVexHPnbwN94MWCrtmE6mYBfhVbQB2fl8o-ZJv7zi93T8sIPLm4pSuwx6X-ZRTZYte7781mpfwwnRPDi2CvtLBND98-clNqu126JYzTv-RTwmsW9w?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=vCFwFhwo_V8WYPDiAkB-WA&_nc_oc=AdkWFzgqCEqPlSE0hX2_EXdAE4lSgKE5mvpyDqsdamP3CrWP7wEGaoiRTQ46Y-JgAbw&ccb=10-5&oh=00_AfGermHNzSldyJYl-8WEcGZQTCk99Eybx9KS3620XjYmlw&oe=6836C4BB&_nc_sid=201bca	-20.329603194444	44.293762194444
207	259149092627253	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-bL8--mGSAnx-ovYcYqPjKxG8Qkg0Dr9VXt9PH3loCCK38Dz9WAEUHld6Iv-A_CYQQSLnN-XlWo4Owkel0JgeCEyIGYBemkHLQiLpgvRSX3icH6m4qqZxqXBqWs5ue_9GeJEDMu65xngibX43igw?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=UfYJZoXr2aDnXtGFPYPTmQ&_nc_oc=Adm4h5kwaMhcdK_dqWrwU0MuCystxb7gMQLnInb5tAsNzVHvKXSImInX29rzUbdBhEQ&ccb=10-5&oh=00_AfG-BOfL2fZEAtgi653iETWnQjRmjaocDDWbAksi85qUmg&oe=6836C466&_nc_sid=201bca	26.685483461246	61.020649439422
208	2936075546712602	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9LOgBi0S1L-KxDlIZhWnWzoO8fiQCqrzG_a1_cqmGR2j2dGIOPyOnmBeU_kGaJq3-kIhf2kR4s6RGBfFS1GCSELUQyGCxWoU_XSuxv_e0aRfYfq_VMNFH0-ajYj9XiCoiohy6DbMXrdNG7k7XjBw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=2nBNc3yl9U00Rbjk5CMTQw&_nc_oc=Adl1rdZyJ-PPRmcGRp9bxF3n_oR-XV1ey3knwo5nl-0z_3F5gNg5FdtIjOYuiQk64Vg&ccb=10-5&oh=00_AfHonQV4pP-35Rh_lLEzuWCZ1-tfhOrkyNOe5iRDQ14aQA&oe=6836ABB9&_nc_sid=201bca	64.2682805009	15.753122758
209	1074711226271605	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-2dXHlpCoEH2bpLXAhjuAtheZvaBxIhxRbAG_fKHdj7YVI_e1qdSR8O5la8k2euwGlw1IUSj8GILoIOvDFKlmrBosG3Pd02LFxJKuO5_-8QfyuFOVGOO4Yt4B9xIa8UFCD5AIWm2vfixn0wxwDf9g?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=ZYF_HwdZ7HPgzR5PpXL5TA&_nc_oc=AdlfmdLCZykOpvkW51cZ1UP2Mc0-R0cm-slwcmx7FMReioMw5n-XO4iOVJA5r4-sJzM&ccb=10-5&oh=00_AfEskMVHFyHVLI8hNtMfvB43Z40pyeZM07W5GCQy9m-haw&oe=6836B7B3&_nc_sid=201bca	7.8460368	-5.2884893999722
210	170293655002436	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-oXnHAr36r-JooBRSs9jtjwb2eyRi0eG4QXve2RURVDVZUuF9zxR-XebXRPe0RRAh-OpOYQP7iJeJ9OYjADDdvk6rCuJ3Tq61MjkxpOE562u6nwVqVPVXDcnfKfqZsTJH477JmgHMneqqVaz_5as8?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=i25okrQWhhkp_qQILwVznQ&_nc_oc=Adlry7YWA_vugcfUw5U9PHT7cSuE-2--3-BYXGwbzAqyj1DQJ0dyu8pc1PlDn6XG_hI&ccb=10-5&oh=00_AfHgD1rf44brfHADVhITVk2ZjyAn-NiWeTMyOc1Kh764yQ&oe=6836DE05&_nc_sid=201bca	29.73821	120.046931
211	891944944695980	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9y456xdOJlYKWrtKBB1_8-sSSP8TT8eTgAYRwHspkS4ILU_Y8ejENgqJU6C8Wv7b-2eBGKXyErdee0GsQDMIXSddF_vjj0co2G1BY3_0zcrOWA36J_4QMt5Obe1x0Sbk7402-KbsCCx51gA68Kqrg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=RRvQt3QrtRVUuL60mBGjGw&_nc_oc=AdnnoIGbnm4s_JpSsvRHtEUfH6ygdEpMePNT6cHHIJt1aooRQXhT6yJDfRb7B339sj0&ccb=10-5&oh=00_AfEGH2BFPuBw8ORKvGrk7xeXornWlfLrSwV3iB9Qbn4c0A&oe=6836D798&_nc_sid=201bca	39.52310413	75.9305298
212	2694565474168392	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-lkH0blRVnvB3vB4rWO9v0EPrcre_o7Z4dJjNBnQMCko05Iz07-fMRgHBHitvWNYI6avo-nB8AY45pfF1aXZ1pN5LkprSGoRa4iaUq1a8kpAo3qZG0RyUvdic8IkrPc6pSleR8I9ogUwnYeJsJK48?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=hluyxEkWorCoQfwQ2iwQMA&_nc_oc=AdnV4spDaxXUCk4IpG8rETE2ur2mEBZQ03aBf61a2fMHBng_n_H6GTT65njdZbqn-bw&ccb=10-5&oh=00_AfGDc0WPX3CQD1F1FZVhspuHGilQS8oX3qAnnWC6Z11Rbg&oe=6836C53A&_nc_sid=201bca	8.3636592074414	33.807476478695
213	4208642575835779	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9-l2sIEMRA4KwVYaG9RCGVWKuZbUEIEeCpH7erdcjXfPyNw5XDoNl2NfX_UreYwcy2L3wrord7NKso0SFJHvJ7JaVA5VssPZ37SQ_w4qQ5KR8ZsvhjMLilbvQroOeN1Lf2orpm_b6zrnzC_ZGPEw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=IRjQUxso1OyxN7Wac_fbWQ&_nc_oc=AdmF2YfzSuCELrft2SQd1jdsXog39TpWVXGY_9EMUtLCn48Ju6VQvcVURG9rDbD-Td0&ccb=10-5&oh=00_AfHThHKFK0YlBOMg5l25zrjwRjFoRuH-4yq7C6nZpSWGTA&oe=6836B24D&_nc_sid=201bca	34.812686388889	131.97561638889
214	5674615562663758	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_YMIHeX8A6nizs5zPVDEv965j1sfca1Pe1ZKxFgeCkEOypOr6lUDrow62hOsS54DbzwLmYuVLlgYd99img3rwXzCTIR3aV66WaXAdRJNLh09WOYpQVKE_8tzwXIWaJCvjz1FAIrECvzN3IredMNA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=FDilDPpeiWsKXkp3pD--2w&_nc_oc=Adn7XugXF9cVIfgKYGnVLQN1z6qnNKB75ADgo3rf8A4jAd8-JeICKPTs0-n9ktCZfp4&ccb=10-5&oh=00_AfHFqpI_N2mJO9_kDCZ63HoLUiJBfh9o2SeYdVfx1BlqtA&oe=6836D1C4&_nc_sid=201bca	-14.60091165	-70.83064335
215	2893450744304879	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An85AJ5qR6_T-N4PM8PmcSScPFsCzU_FYYY2l4aykl1cMWN88xUKIiGpx4WR5nlNl4zmwfRqYKJw9SKcLOY-gMLVddhYNEcGADGBVvFcj0nrTVV5iA4ruyYrQVQ1Y_TEj2NTwDDcMc78UgeMVbgt9g?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=jaZzqsao7qrHifou89u_lg&_nc_oc=Adn1NIQj1C9p95stvck-RpoPjjSW0Aqs5a7TsX_vdpWrkyw-gDaaxmW90_1cK4Stwtk&ccb=10-5&oh=00_AfF9rl3xkTxPAPLmJdA8tu1IlIIFPGsfq4wiYfx-4Xa9hw&oe=6836B5D0&_nc_sid=201bca	32.343691578165	51.781097799588
216	1700476777026839	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8ojqI6J7kBliIzbjuidk5qYGLVEobG7zVhHiNSgODTuk5O1fznmQLJAibaJA0T3yDCP16pSIh85LN5NfizpnwIp_z3ROHq-J8xVtsQtROYRMRO9Aoz2iFcCUHDBh7AAQx_3qnT4xIV3IPC9qaW0cM?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=CStxUrEiFBAd7_JXSqTgqg&_nc_oc=Adm9I7-IcnxqrDx96MRh3Mj9orhe5bX_TD7SplWL1TNjgtoOVYXlxHJHkdyMtK9iIr8&ccb=10-5&oh=00_AfHMxPVG10gKZNSbPhq-5GLZ8BnIDl5ypIDs0Wm4q2l8tw&oe=6836D846&_nc_sid=201bca	49.487489799034	-2.5299962693982
217	1665478520319246	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9J9u9X30zEQPk4SG2-wY5Wm9CYnjAUCaYYA6t6kh4gTv-7n7vqFWJ_cwQEXB9uz_r0QvAmOeno_BeCzN3353iwKfBUVui26gwvMcqE47ev4U7fnD7YkX0kGTY-QUiw6pjiXuVVf4rCUMQaZyV0nXw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=4RONHaEK9Ol8FXDEe3jFsA&_nc_oc=Adl5oZF2f_LD_Xsl7FTxcK64Fw8VLMaW_2iuVKKFmt76NTmzfkSbW0gaWkv9Xtm8_QM&ccb=10-5&oh=00_AfHG6EOP5HsQOl2ArfQKsS4o9W8LXBLvkwlyUl9Uu4yBhQ&oe=6836D2BC&_nc_sid=201bca	31.516182042802	-88.508442996109
218	1445754642794054	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9NLzz5jLFaSZe_mXZrVWXfjHPCF4m08WPja-dDAClvyl9p8wz945Xsw22ejH6KoFn1Jx1wmsHVvkbF6Zj_WaHAxwt-ezsvknAw1lU7INbnQ9veCE7G17kEOCgi51Qvez-zu-UUYuZNcsoS_HE_unA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=QQp6uqEetPFlbnooX2YVkg&_nc_oc=AdkbxC9Jo5SD-KKtgzdDAZwA2OOmsYFkJlnoYWGD1TSPbwjhGGB2OI4i7ONt5I_PNkg&ccb=10-5&oh=00_AfEOlmGhl5LUh8naPNjUcGLs9ATPJQG7AMpyz7JzdJuZiQ&oe=6836CBE7&_nc_sid=201bca	47.591927044466	104.76804138038
219	2159522457544731	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_NgFHDWzbOMxWeR255DTTPEXQHp-iHCDujI8Vu8c80_e8dzH6kKmAd3t1dhMxeSMNJHUrvgZRpLcXbI2k2AbpkGTZkRtR4paD3Ca640aw8zWB5BjyqoYdnQLj4izuRInrk3J-xSIDarKjOm6dRIA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=kIOiMQSshANrlUHxkO0bwA&_nc_oc=AdlV2gmF1f2glwa5nwEM9pkgquYmTihWHH-9wa0ryhE-qZsiQ7sYCY6GCZokBxFsCUg&ccb=10-5&oh=00_AfExQD3trIb4gE2aV1rR_haRM_Z-9rAMpmbjs_T4ShSSkw&oe=6836DDE3&_nc_sid=201bca	42.570038382296	-71.425034935134
220	8249237401764765	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-wQEkVj0WORz7vn4OlJsAU3HVnTtBtFaBAyGIrkAxitppQn01U0ASXiNnSdiydILtNETUCKRlFeSk42_k5qt6cgaVVduafQ_a3JvRjtju7W_a6oUYhBUt6rBTHhlqc3ZAGV1ioZ3QTOBrxv6zWUQU?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=ZrfOIQpEaQSL0q76_Qtk2A&_nc_oc=AdmdDoAHrdmI6WjOhGoqfSCKwuHYe1Bqdqa5za2UwopjEbRsulBMhhYypm0hGMLsi7A&ccb=10-5&oh=00_AfHjnlu8cvBcW0aSvs245Ji-Tky055SAOgGGJ1tY-94vHQ&oe=6836BD4C&_nc_sid=201bca	12.703003299997	124.0287388
221	1421208098240047	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8i7oSg1hQMy9PMTbbF0ErcMwN0aWJauDMJS1-AqmsapVx8xLmOkG8i_lzFyMAho1XvN73wTvHYqofqRTma6UnzKrNN3WYB5mTAZn-e4F94nrfybk-avEVP-_wtdDSCg-f4SbW0x5vx7qexpp-mtw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=HjLVfUu8yc5_hFPJibkHhw&_nc_oc=AdkYL8hn4y8b8FhYe3TD6EcrpzzICxw1F_qBtfA_1PVUSC7Qz3rmGh6nJK4St_5nHzA&ccb=10-5&oh=00_AfGifeQO9Ujrk_h7MCRvKofcq7j6-8OV13U_C5NFdiXAmA&oe=6836CD68&_nc_sid=201bca	-20.547472	28.505807861111
222	1431629643975736	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8jeq9dx17DaNLSKVONileyNFhQ2NEIGNa0w4aL0mslbSAWjWhhFloOxPFBPcaOw6sgNzs1X7AwC0RboNJh1NhbsLhgcOakru_PCr8KMmT7GIxZyKNdzAAnGEvfyYkWHIRp9jtzBzbFh7tev-0beQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=HaV4bdzbhKIvRbZ3Q0SkEA&_nc_oc=Adl1m2lzS40HCs6h_rNxYdToa08hNKBG4bcNaVG9HJLzLOnkX1w0Ldpek2gTHeZ3q-M&ccb=10-5&oh=00_AfEkXupdocI4MRlCzOa9QeshqzKxIQN8Lj6hgHPCvK9stA&oe=6836B9BA&_nc_sid=201bca	27.7364749	100.74360149997
223	4631127740237658	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An90uBtatNjb9OenYSgvfDzdyyU6ji5flfkhsHavXYPfP5Saa-6ChDLhim3uIYkD7K4DbE9kDB48p4KyppZh9sLPn5reQ9AElDanKfkzkHWMQ-qoigTb_WcNU-m8wb7AE4YYEGkUcUENFEI_5eiAjg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=ros_LLn4Gr6AdYR5uHwo9Q&_nc_oc=AdkonzwvwGO3jRyc9I3RXSd-UbpztENZwhW8fzwTbUsbhOTSw2R-7cKjbvUyxP-vwbs&ccb=10-5&oh=00_AfECyS3KbUMpgZVxXdwgwd6ZLp8q5KV_TagTsQYq8S5u2w&oe=6836DCCF&_nc_sid=201bca	33.182067719871	-102.41591141238
224	2634863123479769	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8Fbkx3w4DZ29gocBtsfU6ggDI_Qt4oplCo6WvhUD2GNnKlwIoR76J8Q853m1jDIwN-NM0MUK26OeGN2jqZkGuUNb0gSdZnjGqE1O85ile6EggxDMGAGqsgLL0rmBRjkb-g2q2PP71hE7qH3zmCtVg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=FxtTi4xD1KSYerm-K-LqFA&_nc_oc=AdkRBgmMbTwiYmXdihybnR3d2eyReYPYvR8eRkGjIutb809qIGgaiC-dQAxHGJODIlo&ccb=10-5&oh=00_AfFbrPpRtHg8quWAAaQ8bj_kjnOH0__N1gzDmkCoCTzUuw&oe=6836D703&_nc_sid=201bca	5.7932621766541	14.795561380249
226	466983187708053	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-yRozAEQecNzpClwszyok8qjw1ReAh5KFzLuUjDIqzCu1jm-a2yPk0gj-Sx3IjLbEgosaQDOi5Y0zEEDpVFPN2lNl48u5-xyMPCiAakGUbuodYTsPkhTfPRQSjtlU5VFpUy7r6coTmrq_tpnQmgw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=nnp8B4zHzd1LoigorNsv2g&_nc_oc=AdkB90qsfmVXx58or9aQ2vBIELHxaVaYWjx1JNiN4vpn9aH1pHu7_AhZ4zT-LUvvPCs&ccb=10-5&oh=00_AfHpVhgnTkYxndrTyzxZ7V9cMq2z-8ibUasVep156Su6jA&oe=6836C8D8&_nc_sid=201bca	64.829505555556	-17.630219444444
227	1919474848210640	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_PMn_tfKoeJnzz8csHb30NwjpEnxWyYr1HcBUmEiazrsExFM-DtQvkH61qGcq1TINduYZF9VgBDpDeNPa4jDthSrpHVnFA31FiGemui6Mb6rOW4RUHlpjK-bkZs0B9R3GSZWWPkj_qm_utqJhvZw?stp=s1024x614&edm=AOnQwmMEAAAA&_nc_gid=UibOY3s8I4T7pqdztSu1nw&_nc_oc=AdlwkQ4K-IOIXXYRqchohx6ijIwfNo4Y5GkYp5MJD3U7WNv3HaENiz9-vYQVzukuODQ&ccb=10-5&oh=00_AfH7NTj1dbzSCUU30KUGxOWHDEfU62ITBG4xbnBGO1hpkg&oe=6836DA45&_nc_sid=201bca	8.2994354710481	-62.71372349811
228	4289332441152346	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-mOiySGoddyYBRUR5jYFXyQalLf-zs6r1Y4cXD37QAX45okhFBlcD0gj_L-Dg_8HWM-WLQNCp-66dbB2QrVxxw6tDhdk9tBu2XfcmKEq03XqAP0J1x5__SiqO18DNNqNUnHDtfxhNSjLEQXI_RAw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=6nP1XWKGaDOMy_u_Xm9flA&_nc_oc=AdlnYhLuWTSi2LW4OqfbZ03ESE0Xv5k4elUKG2TTNBoAmV1IiwOXyr2JqrTptWGbung&ccb=10-5&oh=00_AfFZyGQKoxeW5lpkl0drISZnVhi2r5rCXqBOaL8_k_hgmw&oe=6836B602&_nc_sid=201bca	16.101882299997	168.14158470027
229	2825290694399317	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-fu8xW8UwhA3e-ctJE9QlhXk1dwJYuPbsQZybSzmxKoW5tq3v4JKHF56cEccHGMr27eCG6Xvq_wduM8r_rkkTcWmDzCpT3M5-oCFiSyk8BEIb7M-ReMmnT05l9yWn4K6MKh06t2VcDlNO64Z6arcw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=faDsdyS5s97BA8hiFP0dCg&_nc_oc=AdnzkqYd1a7ciCvBeRMwcV6BHVDz4NdTela6fkjcmvoYoeY8ykFmtm2RTpE7XRSRJtE&ccb=10-5&oh=00_AfGlAvIuq2yal-UMncN9yccVSIFZhTNZzuQkf0TUh1K-cA&oe=6836CE36&_nc_sid=201bca	35.0344853383	-3.8218559045
230	5098244916909411	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9gb8EDgszt93vhWHhhaF18B1HvH6tOg43-HQq8jxBkQ0981TLmTtNiFVDyvPFk2Y0o5hv-f84obSv_dWbWA_9yIhEfDjxpfOgTBiVp9GgzjDy0GEPgZ6apzXREhVgFE70goBaiIgG3anNPkq1mKQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=qSNBJkROrtGlcxzsoPZS1w&_nc_oc=AdmNyS8ESaOC4YZK8SFvmNTS4GyKRUB-DpZK-wmaVDCLUoKwnMhxISHcOatB88S4sJ8&ccb=10-5&oh=00_AfFxpP1g5cjxgS1Hdp3dPr_TBiwTgwp2L7GwX7kzTP01nw&oe=6836DDC9&_nc_sid=201bca	24.076416	39.162612
231	1942724605903921	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9FEsgNzy0_Uxni9FXGPot8jLj5nqK3MrNrWjtrqha6fzLVo9OFG_WFnDzyVdn9XxM4z57xyP3GZMKk7HHN4VMr_chySANF0348u5Ud8OMFHUKd1q03MFFuZp6HJ4xaRwU_Ms5Y-0FCq6meP-TcZi8?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=SjSy4nzpTpRV9BOeF1zZUA&_nc_oc=AdkswJbbwbt-LWZVPNITlfrYfXd7hFaxCWJpRfgiB5fLBAFYLqL63EALqzVibacbFzs&ccb=10-5&oh=00_AfELBwfiANs-j6mATj-9Iqy8WnBZp0KLHXPC0D0Rj6inKg&oe=6836ACC1&_nc_sid=201bca	55.434006304251	85.899688439575
232	1531248877256394	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8I_TCU55rXjPmmKljAF2ySevRFsfVKkzpMBwCvP8pfxnLN43Oq0R2SF_G6U54Xx8bA4TrTpZn6-MklWG0IYD3PILHheqrKEcuzDqIRHNMAtPXvc7SaGoj5AIr4is1TVVJWn-QrLfaXQGnjHvECpUw?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=31DTEgBOkLwkul3HwZqH-w&_nc_oc=AdlXzQK7P6e21zEX0mtLC1qj6lXE6Aq1S1A_N6b_wPgMm__BlSpx8iW2bRW823pUnPM&ccb=10-5&oh=00_AfFfm3J2a_-oWA-b5ckz7Wc73FASnIOjWqx6TF05j80w6A&oe=6836C51A&_nc_sid=201bca	-3.3570234645557	29.378076388662
233	1019273038988164	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-1oJ9w6YMcsSGjds9wvCc8woupIQbGlfIobzfnBxToPLhhcTtNKmTt2Lue0RFans55OGhpfvWhVkGqaFBfK-SvzGaQ3jmHVIdY_-i1MvPt_3fr7VEeg1b_bEUdb21TlV-CUoSgmYxj-uJlTRcVjg?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=UizjvC8KmOPGQzmGF85nNw&_nc_oc=Adn9M8DEfEfMTpqFrqE7NNQ4Nw4-PagrPv9p8HfV1E0GF6Wzcol14cpH9Boyw7WE_s8&ccb=10-5&oh=00_AfFG0r60OmkztAabZLZmF-KYw9Y6qjnwrDtRqns1eWQIPg&oe=6836B29D&_nc_sid=201bca	28.931248241724	-106.88607526478
234	7814808548596820	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_bhoyuRzWijsCCFGfUfADiombW7ulCAslh8wr11vHSKhT2pPwopLl0dFqNhFOFTK_S-ysDYViJEapvQukX8WNKxohskhFU0RD-KX4U2b2N8nDPCI0G0gv50aA8Xu9o02DXwW9aGb_43dt6Q8hScBM?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=61rIWVT_gh-mR9ZUgCb7Pw&_nc_oc=Adl-nqtvLyxtpDEyfWm8XB8UWpTOzNxK9Awumb_9ArgBe0bEG5qKucbeHkP1Hr6ZcUQ&ccb=10-5&oh=00_AfF1S-lDJfskwPUqYFglFVjvHKC19Rt-Y7tSRp7hFKa5Zw&oe=6836BB79&_nc_sid=201bca	15.740979652381	-96.808292259524
235	1409141809468822	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9nNXeOiL8z0hN8TWKSqE0FHxg7KFKaPtMj2RBs_EkWcQI8FlxCjG16OXLOBi5BUCs13wQQ2El-xtiZ2gbRTEShCyBF2FtUnQXcveABrC28OeQOtE4rpYSNgDO0Ku_K5E-dVkzMPdp3HwyedzXihA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=vyg24HinoViKr6N7zdYAJg&_nc_oc=Adm7NBOK613yhOEncHLDGC5_EA_TseuvB_XpJPuJ1R0rEUFSnTtEH_gAhHw0Uqq0KJc&ccb=10-5&oh=00_AfFIFTmexAbUNx1RA2dSPfPsFW2AhpNKL1frr6SxWZwxtQ&oe=6836BCEF&_nc_sid=201bca	36.649996	65.800867
236	5838800989493278	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_TAW2-Uf_h7CtEfafXlYdGNvQdwGF5ETP0I6c0SLPdw8XXezG_kbaLdqwSucNXZm6g6bEzqItJsqrEk1MJQe8RNUWwxN-uAf71RxPqUwtJZvD80EHpATAq5eEc4vQhoDU0zwgWAC3ON7wXTBdSTw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=kzKCdFOJlYzDrrlj4sX2lQ&_nc_oc=AdmcVYe21xRM2EajbAL-G4LisBfYAWifuetHaRjnxzqlA24gD0PAQPFg6DAuFgeOePM&ccb=10-5&oh=00_AfGb_bJ4dmOrs2pxVqHvWqDaUTpaS3ZeAC_iz3vjZrgFcg&oe=6836D27E&_nc_sid=201bca	61.274747146667	60.140174129224
237	2282769961883008	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_2Jxi1NyQkmJwrmF0x7ApovDRZn8J8bx0sXsdSjpIhAlFdMa1I-6KW9rxth8l94N1LUGVIhpJ1jpqcQt40iPRp9b1wLYu6rqcGVsFowk59O8tyOBT7POfzCxbQCG6fyvGiTT1hYPdcDBTYxa3LHA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=gnbOI_oiYhurYtUldXGBWA&_nc_oc=AdnvqhB4oEBRd73shseersP6i6b2FeONm9ubhBxKyHCMR4s2NCTQkk332UJ4ojSWm6g&ccb=10-5&oh=00_AfEsQhN2dMh097nVcSUaX3GmtJ6f-GT-AKyltTtA-PLUfw&oe=6836C454&_nc_sid=201bca	60.3604865	-133.09469359997
238	1416097532672478	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-n0bqhwFaztu5FznenkSfan91pQTSCjgPrAyYzX7v4R3NLR-2pAfcDKv6XLI4PqBISmtmj3wdNIpLRSssIeb1IohHBUtti-uQsSrq_u7dcJzTznvBNhHkCPyeL7W_0VMLUVKZf4pyNkiXMKPn19A?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=sl3K-xUOxwJ4ia6d4A7qJA&_nc_oc=AdkXhEzc532YPGm4_C_Hx3PuvGSDloDOZmbKhXT7Y-uadBc74uysnJOBFXLoxoFy-Hs&ccb=10-5&oh=00_AfE16Iw1704i7A4UOoUuUbn2lyWqsGPKatI-LY-R18od3A&oe=6836C30E&_nc_sid=201bca	61.100541946735	13.548993302518
239	211372674394764	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_6pmRIVaMrYVdoW19E0YADTMuLXwMwzOh7tsp5H1UVGd8Z4_Vkou4HiKVq_EJ5uJA9qNr7TMRt746xIKF6Rrg4fTaQqxEiQkKD8Kv9KlBibwJK9xUo7HmFzO2kbL-b31n9CrQhzsMC_ZasbPCREg?stp=s1024x460&edm=AOnQwmMEAAAA&_nc_gid=6C297ln2Okw-iZwI-9TljA&_nc_oc=Adm_31NnOWKUOA3TEq65OjCJH-aJ9n8VNEjFVG1b5WVF0N6tqoYB8D3ASFBG9Cm19Yk&ccb=10-5&oh=00_AfHeR-_VODoVQftYWIBdbjQqmfwDD6g4q6NjHYht0tnfMg&oe=6836CDB9&_nc_sid=201bca	-8.6229026333668	27.338941203719
240	1403749590292631	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9odT0B5KDcSFJy-etrMKAuDurWSdJH-_2-H3-k6So1XsBLIHaF-AhyqwgfmenM2hBHN6REZeH_b6bBSlqSYA84Td6cPzAfBdxf8yvAN1Q_XNfux2qNjMMtPFExuexckj7aFuOjT5x2172AOCrpmH4?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=9yLbS8W_EYT__bPaTs1Y4Q&_nc_oc=Adl60uJw1M-nk-4CIWss1trkl4JYPpzssdEUbNdXbPZ8POeMlGAwf-KAZc5OqPshF7E&ccb=10-5&oh=00_AfH83W8eAkHPjoc_HE06dU4uE4Nx2Q2ufmHeyTR-Fv1-ag&oe=6836AA87&_nc_sid=201bca	28.8210528	70.1416031
241	1254557035206293	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-ilkg4gOQC4l0R-t0oxEpTrRxG_3fN8hJmgauJxd9dSNtSMXhKTCLDl0NPDQJXJ1s4pE0Uw97ACW-FKp_51JGSmDLqm40iW_WfpP79smdMPqYFQGuPIl2AXlKbu6GVwlAo-A-iftqkuIIOoPRvkiU?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=gE03S-AMg0aYrW1t2WxE2g&_nc_oc=AdlHk5EI0f1P_8eg_Hq1HL3g2JGyUIIn-boJEyUD1_1ZzoYKhp6lEXLSwoH1Z5tUgz4&ccb=10-5&oh=00_AfHG_sOQpUgVtgcXE-Z8ISnepytgYYUCtUVN8NQmlG-pWA&oe=6836B001&_nc_sid=201bca	45.0951924	66.2003358
242	1528240574194234	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_3RbOOuWjTIdw-hgAWzKD6zq2unj5DidhXriOCSlBVXOJKf5SwUvXBbpGg6F_nQSMo74tF_Nw4zVDAPXS740pfRfRjMPBKamMe_HfwJRs3I2r2FpsSYVrbNQZNxe-VvgoSyGLRjdjtEL3uWfSLYA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=K4STkBFqFH2kyb2ciN9D8w&_nc_oc=Adlsa-cztRmKiiAuPXa4DdsnqsOoSFvjBzDx70rGen8MVVLBGmz7Pk2X0A2LIQ7EQSw&ccb=10-5&oh=00_AfEaykv5Niv14aYGVk5ai00LvF9oHuRrVQmTexx9yfEVXA&oe=6836C11A&_nc_sid=201bca	28.376233027248	69.547017939936
243	1101619050942299	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-r5A0b3LjgogWk8Fo6ek0PC-eigbLUk7htQxUbuaUDbTy6Ok3AwbMk5fZqU34KnEugAoOjPFdyzwRrOeAkpBX-wZ_o2V-MTSKpEzQwaB9oxYhroKXRZpBBHJvnUwyAuO_fm2RbiZqVoltMsJ2YnQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=lUIMVn3jWkiim78Vli_jRA&_nc_oc=Adk8iV8e1__3OV9ibDtQQ9jrLNvNYoWEYWyR32ZVOYfEiEHj7r-lWKSLf3ElMFDlHfk&ccb=10-5&oh=00_AfEFvOWtEbgd29UHORw7Mw_Ei1oPEvR3r8sQXWYIDwTdTg&oe=6836D347&_nc_sid=201bca	43.785780035813	83.151762258311
244	1459222107987768	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_Cw_CHBc-TuWo2afgCpWP8tMT_RtQH0DVcAT1FSUIb6ywJFrX6Eib1mdCfVSnAq0HGmpCBFoV97vVnOADOYeYsnijyJW0eA8euNhHkk4NrDzt0rT67DnWfqk4VEpWI68GCEOSzcWj2-5_oWklsAg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=gTZiRQzF9LF4JWsP7LmHIQ&_nc_oc=Admwbg_ojqUl97XKpB6YsHSzVM2coFt1Ac7-ADxd9iFOG7l5pDpqHaujdI8MuXfdp3M&ccb=10-5&oh=00_AfFJLUI355IWVvBzrhorRnkShljTiQA-yOzOQ5llBKzuwA&oe=6836C0D4&_nc_sid=201bca	49.877104	21.585801
245	8310713629005351	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An83OoUfpKpn1mldFg6VGVeXSgvFTruVArHZ1m61AQdVpmhwxvd9_cHSOYXi8nKv0I91D9fFBBmgUfypXaLuziv0tSBBsps3M1snUZfWBt7H88WKuM_CDJJ9X6nhBzaLh8N-hWAhM5TcEtdUq9agPz8?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=sDhyxi2cleSjPRdf1keF6w&_nc_oc=AdktY5_hN_3jJy9Aqjz9EfUrF9tYxeElnlkUufYOKAk1fSXiQHjDsHghpQdVgHA9aWQ&ccb=10-5&oh=00_AfHO94qnHgSUMh6DHBEY6Y_JlxWOe7DhJlIeMsDzieP_ew&oe=6836D8EF&_nc_sid=201bca	25.0367056	-77.3014439
246	8927425417268622	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-5Oqfzk3KkLq0gno21fEUAA9MVyLhks2w0__kYJMNMePdfu5MV1l5EbcWgmCbtGlTOcp4HoR2o6_NueLxzJk212uAQX0a7gwLGVzH3gXTh3xirG6_cerR3q59OwpKfoRw44S5KHSkxTFROxB7yWA?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=dXiWKtWB7MVc4J924vtEmw&_nc_oc=AdnCWU2WBkOeNpmjW3jN66WADOhpie9yD3zu7UT2eVpdgHmNtCVbIZi50fsePmbOVXc&ccb=10-5&oh=00_AfGJzkLvBGxeG24JsvnfIPb38mi4eSTJvLHwsjKcYGiInQ&oe=6836D982&_nc_sid=201bca	51.309466138272	-68.114722574307
247	1605537823169202	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_nadH3Z1q25EB6GYTnxcX5fIvf_Z_wyt6pX-xh8cugZcUrXlAexKR_adYDNqgtIFFqLCb7CNZ2-Pv_q_KoLpvk2jdY_I-ezvGBlOoveRnSlnNBcitUOaGJ08J3jKB9N-Y2UK0jMPnrULkcb4zGnw?stp=s1024x607&edm=AOnQwmMEAAAA&_nc_gid=noV5Q4HZ4YavmH3lcE5DMQ&_nc_oc=Adn2NQrhVj6EF1viRu35nT4ub1nyZo4dxKk49b2RoMnzchLO26kWnAOH6bWOQPjKJTI&ccb=10-5&oh=00_AfH939nkwRzzseFA5TiJtJK3xDBB9iXahy65CtAvMfyNMQ&oe=6836B9D8&_nc_sid=201bca	-17.895765	-39.363781
248	5500868839986610	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_sChBfVdksz1jzexcuFcycWiH-2xnNIWXOfd4hDwDNh2uNrVnHdpAKLyLLIvjWHqKzO5Is2ePZ1TUCrX5kPioBYmX_2Wlcp8I0wlLz8rre4mW_DWsQ3f0-Tsd7J4_JSP1Mtj-17Bb2FWB-HlZaWg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=za8PnnYpu0VfOImm_0P1JA&_nc_oc=AdkcjVMihniZFDldsEAFr3NAt8X0PMnQqwirC5Mii749erFYpNdtRy0vMvkxuqxGlPM&ccb=10-5&oh=00_AfE7RfkbP5p-wCpZC6ysuiyrqAScxyKpbuSQFjdyFNbmmQ&oe=6836B0B2&_nc_sid=201bca	-34.318136268495	146.46303160319
249	2935818656698019	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-jFNfzMTMXY1QQQ22OnnBZ-3TWi-TeDD6pWwScS2Vp0xtwvRgDtRitLXmo9ZH8o38gOe5PqdXLeBYpTeC5PBkZHstUsLz036nFj-lz0KLKNpBKuyKdCcUzgMRywIRjiT6xJPL15Aidsd09NglVgw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=s5_ql5Xp00ZplKxioo0p-A&_nc_oc=Adk2eo0nC82fw5P0cztkCdkNp_k3kH4d6b6DkhRPrXudTZUG1Cdf_SCwnzJj7cPgG00&ccb=10-5&oh=00_AfE503us9zD7LJEf7ZeQSEwxPqmj3zmOYunSnYYjcwZoeg&oe=6836D3CF&_nc_sid=201bca	20.554261388889	57.964118055556
250	5466207696782817	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9gt1DDsYqVr-1aCmazsPNb_43N5Sji81kHr8Din_sZ9CUY_Sv2vwfN3h6dAdWTDJYn7CsiXba36ubo1Nn8fxdxjrU89G61pSoWIrRO0kGIIb3YA8NSmnTDzPX3N3L9zVkOlh3jQ62oRnpts2jmlA?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=mA6yawFOrSKDWyP1Yn9U2w&_nc_oc=Adkzmuw6PR1QebNekB012FPm-4tFwKZbIsFKpqqslRD85Of5kPg5apzou_afuDwr7FE&ccb=10-5&oh=00_AfEL7KBIaGtCEi2GlGrUSQqvtrsxgVSrhoUUjFgqILrknw&oe=6836B3EA&_nc_sid=201bca	-15.878362735702	129.86764496156
251	5437146709687125	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_FLqt5Fivzau6D5x-RvTiZ6CtlKqPpNBU5qSQ47JfE5_6jwrmJxPGh_5adPqaxSrDPzlXndLhqW_C5o7zaUHpRvO2T5kYiPl_b5KJ5e4Tfw4X1RFx5Gykxfpkn7lQ0c4Ts9Wrvbs2IZ4ewAl94SQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=KxyfEZ72EdQ5n26PTcmldg&_nc_oc=AdmnoWYhf9zg6wzBU_bxSWLYRzV3f87G1HdARC-5tGQtddDTyS_-LIj7eVs5uYw_VfI&ccb=10-5&oh=00_AfFIEq3LxVz-Ozt26udqRRR6LaAtqp4vVQzLEOWxFol7Bg&oe=6836DCC8&_nc_sid=201bca	-30.041900916667	151.62385041667
252	1433929143694652	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-HNbVG8V_t_4iqOMOGEIn0-eYQvROyAfHnRGxGelNoAEIB0VVkR6h97C3mH8cwraY-YNN57RlyjgbpV9Re1hoJkUMgqw3wYSzt2KVZXB4IHK8BzZUqT6J5-tdxINpXdA9ztW2FAn707qyvLWGm9w?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=HmCFqB4TtmgEr77EmSRgAg&_nc_oc=Adm16VE_rVW_A25YT4JMJZzUtBxMzlGNRqFnPtrswyaZakCwJR94u35-hhaCmioEnDk&ccb=10-5&oh=00_AfHw7bJZ8TjoD5z-3Xh38JOGet11VGzHGNF9KvlcPv31ow&oe=6836B0DA&_nc_sid=201bca	-0.15466000000004	39.383603
253	1509166699971804	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9xRmeePubZY2iAYsr1-CHMySyPUR1Knh4UeN1z1yBC9syRWIuSPQmrwMhNnobWrV2QgBPUvZdaodhTa1aRE_n9NAhOCH7i7aoQFCvsocEZztgFVtDtLIn074VXZx7k0_U1xFs4cFXHsBBH5uhBLQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=eVrS7zbgs5Pa2Z34BxAUAA&_nc_oc=AdkVp8i6k2ZMd_78JOws8_5FLDgJMILFl3BChek2_7ROyYPkPYSpNznt2atms907N8k&ccb=10-5&oh=00_AfFZw__DaJGhkkQKoZokJFJOxI64cqioa0LFeE_JjXRc8Q&oe=6836DD58&_nc_sid=201bca	-8.1033451	-66.1588796
254	985723841964731	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_vGRQFcKW36BrEXs0Y4dixHbdYK1BcC2ZAYtjCLDrJVyvblaZ59XURFmeoqkWkQKMDepHu8Wb3Z0RziZ4fKCLv_KPxVa-OZ37PuEpAejV1FUCIboQFedOe6dwYPLsYX_pNZB-iKsY0yJkQAKlTXw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=oH9k3da8FcPF4ppREHjOhA&_nc_oc=AdlJNQDfjd4kP0onA3JZ8Ntj7shxeTrfzL-QIWb7mGzUunbRPgFEKNtrj58Z6eYsmkY&ccb=10-5&oh=00_AfEkVqbgDCdK6ZCY2sK89Kseo9ju_OtMMTjPMvWfDO3fsA&oe=6836D840&_nc_sid=201bca	41.28106187	2.79680515
255	1427647467609796	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8ui-BmHy1Pz-oEEZBraf2ZUGPQMdaKDHks7lTwCKl_8OL5VlqRhX66Qpf7NrtPZfqI7D7R294e1hDEGUgangMPptnzonb0TtqNczyMm4zJqNJgAX8jyBGo2toErlOCTGnU1whbQKznflvsI0Wxog?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=zRjPrBS8p4OrNwF0ldp9Lg&_nc_oc=AdnU-j4AyupD78-DqN6_oWcp_T1YuXT4DO1K3lR7cCUyrZ-GNgCPZn-qXbLCvR-5inI&ccb=10-5&oh=00_AfG21OmTTMmbQcmihS8UoyGwZ6UH1lnEXSroMliNpC-mYQ&oe=6836ADF9&_nc_sid=201bca	38.837023983367	33.944543814388
256	1762156187859719	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9aaA3Ms4wY5piM0ePIPG4i2BHk5ovP_vD27fAqbNluL8e431mRWwgQSaVLc5VIm1sYWOjZy4j03HfoDShRYe8HKe4oh9UvBENXIHKIw_vACT7UGMpnHgXgwc5HOOm5Pq-6KJKI2Tj8DGpU0FfSpg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=BciNIQFOjc77NMWa4KbEJg&_nc_oc=AdkPkxJTaDaUbjLpXuiSG3zMWdzI4QjsQ6YC8aEXG4eF43jZvN5VVnQbaqLkSZOXp0g&ccb=10-5&oh=00_AfFg5eHy5AV0s7v-fz-Baqf-auAvI5DQSt8WiCwAhJsqEA&oe=6836D1F0&_nc_sid=201bca	-5.014099	-50.811695
257	1468104016915013	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9XNIjmvD1iVa1fr_rPU_JxvFaNJpZPfEbUJjz9wfgh3rbJQSXTXmraUm75gWrf5UvyLoc0EsZLzbrR_eB58zZlR6xilVJnT3bzqCDgwQCMBSroDcO3sDichcLIyhIfNetbe2fQ5K0I0np_iDKkbGs?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=cplGWh9gvgOLwRhKoF11Sw&_nc_oc=AdnT3zhENY1g4hgCxnRK1yqJ-CDhVGhpQ9whh4zftnqXbq2hOgsZD35Zo6hgVHjyTkY&ccb=10-5&oh=00_AfGbapUAyBRs33ET255HdEFdKmgn6w--o6g8f74UTaaZLQ&oe=6836C658&_nc_sid=201bca	-27.6262496667	133.878232167
258	1835620276610219	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_ZfFef1Wv6j9HCrKPtdFGW8LWGxIFxJlj47ydGXISRUt7T_EMHueKkRMHOXrO1dY7wV7OhYl9CHH5fdJTWQoTmKnBbml-CL-LYqtst30I4QYXmGxdQLdka0Txt271yYV46MfkFIADCOZUc7iTmGQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=lBlno72R087BHkGCHYGdUg&_nc_oc=AdkqGv0D9vbWcuBSQqEcMAFowxMkacJvZxdSvdMy8x10TmbVeNrheBWlJlr9f_W_wRc&ccb=10-5&oh=00_AfEX_fn4qpMgxNmOl1xMQz-wSPHxLbml9YzVqM-mYSQ6vQ&oe=6836D9E0&_nc_sid=201bca	-4.1581943183483	-50.179795394106
259	1402514053430367	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_m1sAYG423vYcPDpJrDpH8Wn_yLEi_HwhdZA_RSQm8jxiUjk8iTI7oFJdSwt4DuyzlQPyr2UciHs7blFcWn1drxwP57p9QMtUz2i7e8tr-8SjYwxuAS1Dwahhf3Zd2NY5z7YTwNTPDVxy_UKylIQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=v7Lt9Pwi7hQuPhVCOgFKxw&_nc_oc=AdkM9ek6wsdB5RUuwVkZ4U_iqcGWkpeksyMhUZmRUbcHgpuk81t4h7n3gngZYaJq3qY&ccb=10-5&oh=00_AfGG77c_8mR0XdTrTQtCXQofKbnGduIKkvokvTA2Vqx6Rw&oe=6836C9CE&_nc_sid=201bca	49.9276775986	41.3414103944
260	2811064795733450	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_g0qx4CsjHwN-aGzroIzutYiY1ezNXHVyJ-FsGXY-LFLWehkefu0pTBOA1tURst3ABtJz6q6tGZBBQNdChRBPB7ByI6cmruwLGg7ePYvOhVRUd1IC9UQExEXcC76866_h_TJOm_QaZsdP4JE7whME?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=LUn_igTdsB6arv42auyMjg&_nc_oc=AdlFOvJT7q36n7brbBT5wwKZUi2V4jGVSrBEaeqtCdt520jWJeX2ulx1KRaW97Tblvg&ccb=10-5&oh=00_AfHrcsPG3sLgtgMJM20M1UqKsmECTnJowlWKpaFYr9sxiQ&oe=6836BE85&_nc_sid=201bca	-32.0504354	-56.0604879
261	5647083515334175	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8sbj5xxy8coWPwnFxqWmsDAl5aWOcvoDJjHfDk9pa_M0Ucy1lHXZ2xRKVZRzncD-XBIoianq2HITw6RC_XxqhhsL_hgS8YqiX689E_BSE-U_dRCzOWBi294PFjoFhx1GJVj6PcH28jBuLgigvsng?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=tIr7_dqIqN3PtKe--dKpcw&_nc_oc=AdnXC5OYu5fVGokSNyOxjnaWksLOxUGtw4_Hbf63xAqZ7hDAuc2ce8GDYvzO6licQis&ccb=10-5&oh=00_AfF0RJH1UpasccwUOhhF70UC0Q_XgFzIOO_WNCKyWTybbA&oe=6836DEDD&_nc_sid=201bca	40.35550784	-110.37093534
262	4343520459014954	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9LX9SAqQCPEtl7VVi4V-EHiJt01WWk6MLHMt190AiWFEThU1EKPW1IvsApq0W8GcF2Yk5V36c7yXTr4Y2-WjQ7hJMVW2Y-SMVJz0nAEGejxhmTBznVFp4jcm9QlJPAGkswrqrgQVHxXh9_qUsVIso?stp=s1024x384&edm=AOnQwmMEAAAA&_nc_gid=K0HTCwBE0mBFzT1DfsT2ag&_nc_oc=AdlYhv7PWHi45j9SfxsNM7t77xlqRvNp7M8xrRfQGIa8Ju_uh2b3A2yB_-t4g1vb8wU&ccb=10-5&oh=00_AfGulmsHFYS7ukAabEMrI6i2jeyiwYE1BK_NEfX4OnqxsA&oe=6836B20A&_nc_sid=201bca	-22.3724732825	27.221812046944
263	293613278990175	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_-logy4yulHWC6EspYN_NtZCCQpfWAlS5PvRUNHRt68r8dI1jj6eXjeHeE18uuArIYI8PhKXbBRTBox--ittIhGLrkVaToBHohsR-YnCqwlsD7O-QUFyVG0GWOj2Snxuyd0c_eDVetDXuELcQFhQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=ue7h_hiqGgDIxRgpqs9F3w&_nc_oc=Adnf54mN4913LzxI8UkduMDBOWGfFcYstAYqnTqZNzdTmlNkzAg7kRxrniNj4aZF2lE&ccb=10-5&oh=00_AfGLhBlaXmZ45C9-hiOOzrsh3d-2e28IDRkF1OSD9FGv4Q&oe=6836E094&_nc_sid=201bca	42.74098263	88.60352426
264	516618979529647	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8jota6VflaPwUNMJzW9BY-ewuy7_BOy28uhtK5m3iliPogu1dJos4GhbzBsJmolkjypnK-DEYT3IEOZaIQKol06bhX04fpsAUGcen2d47sTgVFKG9qMg4T9nC_0oQpC4dukalVbzsXuQAViIqt_Bg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=7tVG3tfSi5kN5poT-Ou-zA&_nc_oc=AdlDtulSQUHHr8FodX53a06m_3alLgfw1OGp5HZXQI8V6DrqokUwe13IWEio92udmr4&ccb=10-5&oh=00_AfFDHAllffAEyz1Xt8c-_TU0a6VjOF-ByoW2oU45_tBqFg&oe=6836DF86&_nc_sid=201bca	-0.98711396386957	-76.930824495428
265	1304807506863858	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9UxHJwnsJNtIirkydX1IDVAd_dSnhWEo7W1lNFzZEJRNxDEOaoA1KsDPCIo_tSXVgiuXNjSCkdjecTmE-manY1hyfkd1LJaMwG3oTrYSedWBldMh96rqLYw_egY3_LIJf5LlbFvtftR4Jhqkf367s?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=-ovXDUHAaRowNv0ev1gdYg&_nc_oc=AdkxKZrYk_ee341wWUoDwwg_0Nh0Vo6ujLYzH4F-4FB4kLj-jyyRAGWH4IG5NsEv8jM&ccb=10-5&oh=00_AfFdeC1ixew9FjTfKrXY1we-hieBqqtYcHoNnNOP8SZDjw&oe=6836C206&_nc_sid=201bca	-28.030339849997	23.105034580001
266	148926097157800	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9k22gx4sIKt4gq-DBoch41mr7tOq3-TgkIBGHfCkquqeKC9Fe-TmpAOyT_uJtVYr9aoYGR7NoEJy-5PHOEuRZcqr2K9wSj5ORo71X0AroSutKZUD4wihnLHd-2RhRxLirqem8L9FejFtTM9L-jLw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=nvZ4ZxTQ0pjvZj-EXq6AXg&_nc_oc=AdmrQpNKqPztRI4E59lWOiRNSHhARPsfy-HANs9px7oXbnw9qAYpX-6kZCEKxtWi5TA&ccb=10-5&oh=00_AfE24siBXtKQwCN7xq-JE_yCID2noILkfiAXiH2Kkla6gw&oe=6836BB77&_nc_sid=201bca	1	46
267	1755992871240240	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9G4X0wxD0tKIF8oxEtRhVOwK8S533_4X65TpBscmk5ZHBCHFS3OtFrg_DenhKfKXkRQJiZCkJfyTRmNoiVrtVfqony5SPDxoG-0nFweAgpbxKPHs0-lTHndwXWYKee9xPVlN6zxCx7fr4vdKoJOw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=XxtGh8Ytuyk5qDLye3XVnw&_nc_oc=AdnN4E4QbvFgo9x6k58oa-ODM_XlY7ol6-m9vxxuX0BvGCC6sFj0NGP0qWnQzxzGq6A&ccb=10-5&oh=00_AfHsCjuUpaM6GzhRwoqSGpY5RLimo0OGT2s2mNTqW1lDBg&oe=6836C82E&_nc_sid=201bca	61.089940805431	62.211899924601
268	1900026370418347	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8_1rgMsLeunRK3fAjPsrZZqeCcI-rFdmjqtRwYE91SFD6SSbD3aIu6qV4Uws5cwXr-hy8qAnjNYqLe9NNl9CZq8yIu5jw2vTxvXwK2aTTacJyPAxi2yYR6gYtU14IZW1UshSrPhtS3TBgFrAq_XbA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=68zmnAUAt2_HZ_MH-9J5cw&_nc_oc=AdkaYs4Jq9tAGaeHS-DSCGT-wDiDRKDmXV8PqcqBIJtyjpK7Q7e85pNwRHm0uM7OVqc&ccb=10-5&oh=00_AfFFIP4rF7l1fSpGDFOJge8ZG13Bsf1zHkIMCjJ_WvjNFQ&oe=6836C31A&_nc_sid=201bca	13.514779100001	4.0093122000025
269	1464467990572681	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8iUNzilnLMzhwjH30JpXcJj2DC-X-KiK7zHreSeQsAJD67T3lJt8IL3VlHief4cQm7KMYucpJAuKBzGK4liJFF7hH14YYUiZTgGwnqfM-R7Yo74tZ8MmHFggnAr7IrCibdAlptCwwT1FoZkpcs5Q?stp=s1024x614&edm=AOnQwmMEAAAA&_nc_gid=8tH1SpHwrHqeoleXmoEqUw&_nc_oc=Adk4oymejRB8bQcRNzEIg3Yi9WQ7K7FWn7uhY8mqT4onU9svzPbMHrmYenusxXqtE5U&ccb=10-5&oh=00_AfEyChN1Y0D3gqUDfKpGLUdVbfW43mIBR_0TPPvfJSDdoA&oe=6836ACC1&_nc_sid=201bca	-7.2141536547325	-35.589280514403
270	1713480239402748	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-4z53C9kh_6Y2IOSA175EtMyu_PtTYAUZtuCHOPpdMPtNkEI1xGIK_YbQD5fl_24cT-CPEKAO-F16xORLTL8VYxQGeepY2a6Ya5KhdZnJcIuAOMWdnQjWqw_tcJ4SSP5-Asrqyen-5qOkjPtWd1aU?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=oF38Tk1I5DLpaJw6uafF4Q&_nc_oc=Adkl5j4mMIS6yTEK65t-izU9jesOcsjZjrXXoqAz7K0KC_zK2uUwGMrKg0c-HDlXcos&ccb=10-5&oh=00_AfGj-GTFWq258C7LOi_3CynqwnzoZo16gEeMu8hnJ2DRPA&oe=6836BAFC&_nc_sid=201bca	8.6855147	-3.1946258
271	1411903542936902	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-BNo3e7Gwtib3dtRb46hSOvzelmx4PLTrfD82qGqJmutW8dNXhLvucUIN2m8KFCvG9FBlCLlwee5AiJwFoddnR41p51coCFKLoq2q1dp_itqQeG9_N5uiHG3ZNcxxRT0WcnAXDylQ7MuWSAqKynw?stp=s1024x394&edm=AOnQwmMEAAAA&_nc_gid=f8JAzymZqqbaMp5r6t2uCw&_nc_oc=AdmDVx236L_jWutz1TngUDL_jvo1rj6PHCxeLrjTvcBu2E3JbmNz7NLEeTBPIi50MPk&ccb=10-5&oh=00_AfGW-5OQw430Im4dKcY-T20lKGBli1mK-R5vPchnyZRd8A&oe=6836C4A9&_nc_sid=201bca	31.7893669	-84.1300195
272	1892301370979604	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8PO8PuYjU0czoY253_F8folxumF-aStTcJlL4aZKwbzwtUUYuZye2CId1rDzzeSVoDzEBhnkug9Lws5TyxGn9E68KkglmGxysIHh-vqKeH5ioiBGGo3Q2NYgIlliWOJg4gtW167G8uriUDG2glGg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=W9_9-sSToOnlcBt8y-C72Q&_nc_oc=AdmL-zjm47TsV8tVMjdRtTI-CICouiaTL5RTOsYHmM8W0dOOXoL8xaYPpsAeqe_unEQ&ccb=10-5&oh=00_AfGmAtHu4cvITe__9VI_CaAEaw8_NwQopmOMomKuA6HHdg&oe=6836CCC6&_nc_sid=201bca	47.905959205399	-124.53967932937
273	1879394022209496	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An__A0e3HEWZ6-aO7ntD213tlRFSEdE9UrHybxtnhbXcO4ElJ59Z0cgWGF8j-GoWVmCE8ucyTiv0t6xII10290BbneZURtgiHi78X2SoSaN-L4G4lfFWRErtACLe8vmH-p0Hpbykf05MqKSMqb95Pw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=B78stMacuWbFPAK17yiu2w&_nc_oc=Adk8oedz4Y4DXmoEs6-oz_pR2tdmL_t-Tf4vRAajddqQ1gRrBaRXodEcb-whoul0kU0&ccb=10-5&oh=00_AfFPEGS8HMGknSGFWxXHmtqmHQDo5osZDThRy9qg8kuEGw&oe=6836AD2B&_nc_sid=201bca	-5.3177519166667	-62.001310808333
274	1440616706292537	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-GRCjaiDbLKF-4RCtpODV3QneQFKugOMLTWzWHFYA5UdC2QH9OlFbNIzhM0MsjlfLfAGGaYHk6Z0UwLs70Gg9f8yvJXdIvD4curU6LA31D7j5PURp_gnA3w1xcVKIiyAnNWh0O2kwkmQsxQOIb2Q?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=WdOFNlCAZtilpI3nTNl_8w&_nc_oc=AdkZK79ex8CZXJFG6nesRYDKlM9haMgMVRFKDaUhBQDeStBP_Pw7mQxIB8MCkznWkGM&ccb=10-5&oh=00_AfFacC0OCR_BGpOonqXM8VMu0OVUMR7pvO0lq7XuP_3gUQ&oe=6836BC05&_nc_sid=201bca	30.703953	76.753298
275	2845571189042001	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9h5IUW_EEzK3V59Ia9MTsG_N_KeDDs8tlNWzkaXIpX2dmVmjO5S8TiNFH3Z6rZ-gG39FR56jhPVm1lc1gEM3xrb06zF-kso3-k8I8renAMX0F8eMbkExN3Br0HblAGFuG4QTjx7Lk9vg_RLIipJg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=EMG0MYb4U0MPZ1KBIzBZ9w&_nc_oc=AdnVIEsXKSJi_gW6D9RgcIcPXRSHUeuhgvKYNFHqUWrqxB25GTI_ogy5RlPwlKyFdvE&ccb=10-5&oh=00_AfHw2KCOUTYrntA1lvsLaG7dw5AX5Ejzh-KTbnienTEVBg&oe=6836CE5B&_nc_sid=201bca	65.023024118506	35.703754261121
276	3637231023265989	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9MVc0vfi4KFe2-D7UvC21EUIPvOMVDksElHywzW5EOSSPLRW0M_9XB60OnuBjKlJeMlCtpie4uwh4k4wGJR4nlGcFz_naKUA_jn2alsWZiVRfGybH4Va0ca9w3izQgt-dMJqZQXFvk3w5nSeGE2w?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=_neUX9rzekt6Hvsy9-CRWw&_nc_oc=Adku31IWHZBjfw6FUns690mKrephN2ADXdKFM_GH7cezZT4fg0teuQcfuRlNNZlOlWo&ccb=10-5&oh=00_AfGjhKNLYSdyoDF4SwiPnPiwZ55YNStkqZ0HOX65benAbw&oe=6836CD4B&_nc_sid=201bca	34.48820053	-100.34641447
277	1405112079911301	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An81XLklOBYeD4PMEXcbAiHiMASuVuh5fAPkwaUWbGDN6_ihT8tLars15MtFCB6KaqwPfO3M14v86ahtgxb-7UOa8wp_K0rHyeDjGLvDhhPgcWKyJGvIqMwwUoEIddxU85Wli8yxr-XL_m3QJbyDhQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=MFUzPLj655PQRt2CiH6pSQ&_nc_oc=AdkJlXRqscu4r61DhoaHc72m8tizGXEzgwvoFCn-Egu2kPhAHm_4NnYI6J7qciu0v4w&ccb=10-5&oh=00_AfFITzqJdpaRyAhMJlonSTIPiFX_Ns_aCcMKgZXgN4a-zQ&oe=6836B0F5&_nc_sid=201bca	48.154769444444	-80.025625
278	1488683688246948	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8MWHeRbm4316DprOomIeQtCSSz8vXTpM2-2oIWTr8Fr_RmLvH9oge2bra5TXASXEGxW6LIP2OBWlvw-Z7r6HmoMuyrXI0APpIuByLCTHaRwaF0rMPGht60q3INNaaD8P-TLy3J-Nt72zPsSyx84w?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=FxxwYZqUnXzb9jb5a4fsbg&_nc_oc=Adk5HWezoAsEmJvJyIHodoFHYPbgsiAJPRvbUmzt7qSqRg-6laBf5uBRpe46D1qtoOo&ccb=10-5&oh=00_AfE7c-gjFPo6KXddpxBgGP5oZncUMuEe1w3mOlsatJw6Tg&oe=6836AC0B&_nc_sid=201bca	57.366895900001	17.0957532
279	787542189556553	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9cU5iMp3xdygTTF22fRjTWjBUtRenhpcvDYoVQyEAjjiELTOLAx-1W4BL3Iz4k7C2nzjxe375pxhtnEiJBiDt_CSGptYE_7_F_B-zut-bc878NtXhJxp9rXyYNFKipDZdI9tO2DXR1mbq2CWl-4w?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=0IOVWdokntYGrpUkPBbLhg&_nc_oc=Adk6oNvLiaYaMYrjmN0pOibC7BC55ayvM4tbPSBTnRIZ4WDn_jNq37_q4s4g4a1ao3k&ccb=10-5&oh=00_AfGoqi9p2mMRnLnf_z1gYgRxCtNkD0WNQtCp65Ymqe0r8w&oe=6836CA53&_nc_sid=201bca	0.31402030403288	-79.420899136403
280	3914187395314355	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-yYgxa5QVnv5gbeKbd5xX-L__oNY_dJj9UE-VPSM3PZpmSv_uoOMx77ZMkxldok3WpPVbZlLnnHVpJ8L4ICSeLzr2dvyy9CT-a5nVEb_aGe-I_R2PAHPpLAJ9v7LOmqdfrP-yExXO0yePhsRK1uYI?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=dGTYnj5UarX0Ot6dowxZAw&_nc_oc=AdlWXJyHLUXUJh8yI58tOw0w4801UVIFci321Gq0S_yI_W3R7fL1yUuiwP3YM1C5yKA&ccb=10-5&oh=00_AfFwItAJE2zRgTOCtHynSaMY75zoV9tMfUFP9Yz7Uju2gQ&oe=6836D236&_nc_sid=201bca	1.9246646019231	34.055420854251
281	24148451331435437	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An822tjfBycQeHouOZIdTih-PohGC_YbQlq9tuDsiFosNJI819HqbdbL_tkFny7MLmfQUnanP2mr3FfXxM0egcLtlF77Lms7Zt7_NvqL81tdBmulONSIiD5nLja2w5yTohBdv0VyfEQnV_RXaEAU6g?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=r9s8Euhi4XqPimJ6FkuorQ&_nc_oc=AdknnZxamyI2WkRlOFoH3eCQZ3Cl0fOhfPv_8JgSju6t3gDQld-MD16ZSRJFtO-rQDY&ccb=10-5&oh=00_AfFQl-InstDj1lo-sH6IN7h3589GyueXStBqgQTQmlhulQ&oe=6836D53D&_nc_sid=201bca	41.096610996327	-0.2959652
282	2668386593294576	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An85zkEVASAN_nq3rIXEvG57lA-TYNpfx0j120KG0DeOfkp323eIOE9-VmJ3bdDOV5q-i-dGsmuCRMUZLvSv5uJiHFi8eCiz_upFstlni7pk6Iyn2vkaH9fLnKgWak7FvAt7H7E4lw5NZh4ixBN-EMk?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=2JARYPH9932u2ga7XX6o1Q&_nc_oc=AdmqQesYZI0rNAn9-SW6wJ7qN3X2BAgQCaY6qCRo22flHDRWznHAKkojatdAoG09_DU&ccb=10-5&oh=00_AfGgjBYAl9icUIUpkFllgjDzzXRF6H1i9rtLK-mOqqCbpw&oe=6836BCA0&_nc_sid=201bca	25.807835428469	51.37647361731
283	1607749856084702	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8qXgYQiVMswpw1p1EBQkp4kWFANzAaGhCWZ1NUTVdJD8Yy9vqnrhhE0Nh_0qRR_tgI6K-gLGAaN-9Hgm4SUrBgWLTfH9wPFraBXlpwTxwqOkfFvGQx6KlwBBPG_9v57AUMwPsxf35hMfa0keFyrQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=BEmszj8YB7Suq6h2WxVxpw&_nc_oc=AdlaxgHlBe3Vo0od3t29dG89pOmB9aLAYWUwoMOqutVqu_8morsJIST34SS7FG7ufn0&ccb=10-5&oh=00_AfFjc2mQItT_oOCvXVr4aIRdab0X2f2p8OSJRfF79ljRCw&oe=6836D868&_nc_sid=201bca	-16.336633333333	14.409697222222
284	6638908129501988	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9htSlU7cUn3YX2xNzedWw7L6mdRtFyb4aAR0_7ZNbheEFHsJ14g45k5trK70jc8pZEqzYQc3s3kFhQLtqfKgLFl4XJejhux1J9_vbWa15dz71-_jKXG9ABAUfv2g34Kij6RNSh48li5omUDBSUFg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=UtkqwPnkraW3dsdKTxDxnQ&_nc_oc=AdkdK8QSqRpPdUjUxPHdsFA7h0l8w-S-79q5OClSCD1Bd6O7s1JjjVe7U2rIhB2qvhA&ccb=10-5&oh=00_AfGrd9EajwZT9xjN1DCIFexZ-x79dt9WYn0H2jji5VLpaQ&oe=6836B9E7&_nc_sid=201bca	-18.105471314058	142.12838575756
285	7394920703883081	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8Gr8fhDuF5NHPR1d4n0L8_9Osr70ksR_UnhUA2MePZJ7dbxm5ltxDGTbvQBO1c1t66xxhx4lhrJnxhvRsKH6umqFEu1Lz1qPZUw0OdV0e7_wbGC7JTPsxtjbMl9yCM7_BYyUOPopuwF-IepufnkQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=H_foRqCCu5vcMilPQE5_HQ&_nc_oc=Adnv2OPunojTzLQW0svIewMy-9kwltCaY1vFcVfRDi8_X_MQoa6yVnwP6A2sqpeL6eU&ccb=10-5&oh=00_AfHZvQxjcd38Fvgikbm3IfCjxUnJ0_pykP9TsA9w5n84LQ&oe=6836C8BC&_nc_sid=201bca	-6.2629256999973	145.20183333333
286	3107034296195793	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_vb2Fmq_8b3SHXtfU3rje9GCCEcWM-gJu6UrxONLyLgCogUByq5RE_BN0cwqL5etMhY2lkyK4Ht87AbgVac7kciGn3Vn3EieabM9CrMemifjLSNrzd1osEf_w9LzGkZnZeayr2TNjm5pG2OeudOQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Kyox0OLaMvkfefzyKCQrnA&_nc_oc=Adn10HpVCFDpikMxPPnNIX1jm5Fx-PrCHIzHXiG1rBwQRCxvitXJBCn-aV-VuHQQ-L4&ccb=10-5&oh=00_AfGB21sz0-K4lFfBmHjtpu-J3ym6cvbFhAMjpoQZhALhEA&oe=6836D970&_nc_sid=201bca	48.736396103846	55.938335590385
287	3871649086217482	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-PDXWjWMVLVHvwngjtN-JGEn6KesjKFMgIM_L6PMtQa85ADsP-ZEQPwbIWloYFRzJf_BjAFQOzv-m-jmCwL1ko4Q3jfTkAjZKpNlc310SWjXEYg9Fn0BWT8H873dFKVRzPhRK8kI2HoxGjsYTtJbU?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=uNjtmGgW5miLm533kNYqHg&_nc_oc=AdkTzzZ7S7iO58sXqp8w0fk0l8g9ol9ZYsQD605B6fBFc7fiV1TeqeNO0Hnf86RL54g&ccb=10-5&oh=00_AfHSJlf7jRAitTChR88dKh9xALkCivCrg-KRbT81g-iFWA&oe=6836D937&_nc_sid=201bca	-24.334655804937	143.18020490303
288	866419527336667	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8Q7QCYutCnHxCy4tOJGrC7JM6vhupmt2w6gqPk2iUaLcGIKD9jYR0XqTgLmwUat9iBOEaYPEeUcdTr4uqXd1BtVAbfKq91dedJLnBr-O3eW1M5X_H4w60q42XnU8cEF_c8A-btjSxaoVwaTp3fBg?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=FV9-MRZAW5pq11kdmaNYRw&_nc_oc=AdmEiz-iOr0I9x-tJtRhYFUYivg4qhvKbC2YkjktJ1vxEz4pUYZ24pOwDz0OpwWjpVY&ccb=10-5&oh=00_AfGPhwVqvmBj0h6OcOGv61gbJ55hJLz2VBIKBMcAq2V8jA&oe=6836BB4D&_nc_sid=201bca	29.713362	113.878022
289	1570563540462341	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9BRwJ3-Nv2tVOg6tGacNYlmCXJn-Xpdtee4pvLeeAHzRlnZqSb9YOXNFIi6PosC7hFmE3LmAIogLSvLiqXQcNR-rHMqgY8UcsoBCfzYRZoR0PC3T1OL1bpc463clno2rvOK9Y0H3Sxc4OYXop5rsY?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=Bi7nD4LiraTAk_rTUZkJxw&_nc_oc=Adl2JaRLV41CE20ZT0QJJowWY3CEtrFFmJ790h7C95_KiLTHvjstOzx63ptu6B8EVKM&ccb=10-5&oh=00_AfHDO95GMtthMyFZVqGJ8M-V3od0iG3RMRUh2MNemdg_KA&oe=6836C0F5&_nc_sid=201bca	38.71349426581	39.22526618889
290	1916015582139157	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8KvlzyP-T_Ssg-wOue9Ujip9CRVkhUpSrkC6CidZA8egszCltC4-Gzfx54nnLw4_2HU95urJeue93soSofv2_51qxyU_pWHQM4H-JxOrwiwT9ASC82MRQxhFWzkHK5jQ-f6ljw6bgPFNtqy77hSQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Cd2U8COO4D5PGt-eAeuHSg&_nc_oc=AdnVtWifdy9gz_vSlBXYDLKjSO63r9lfjpSwHSpAOjYK245CkNd7fLWBOVlxxoBM4j8&ccb=10-5&oh=00_AfGyH7cPqXflyrYurLAFb25Npqk24Sng7pWYCupMKL60Mw&oe=6836D896&_nc_sid=201bca	38.4895119252	28.1503629832
291	690036921742508	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_1oJC5egrz_BQbrYDz2d9-0T1CRPOQDpvnpWCRLPBp6cem0-j2ftF0PKl7zg-QxEsti4UzKX6RqLAqx8PLLF4c2IW2qGUIet-3_M-JGNpeXaO9OCdEJjVJjNqp2ndxMptf56CFUehNl3zzMO2a6g?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=JLeJcmfiVddoPqLOUnoleg&_nc_oc=Adlkez6H-XQmk_CtV-BJlwqAWEB6hjMEU5qamlGnhJAvwNNJ3QhItVptSSXVYs7xxe4&ccb=10-5&oh=00_AfEZMj_Bh9nzduFPlO9E1oDwNTv14QRj3k8rRc6RZ1b96w&oe=6836BE1C&_nc_sid=201bca	-56.936191406099	-28.014586411748
292	1458719125008319	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_Pb0eesC85Kq-LdQUWEW51iJ1QCp0tECmSWQylSwBEi-buKBKMPu8XpNmSBGeuY5SyPw1rj2orFjDF-TaTVfWu0K-s1vzXApry0_fahU_zmwVpx81_4-PrijQWdUvC3WDPsyKqLU3OWseP48F4kXU?stp=s1024x771&edm=AOnQwmMEAAAA&_nc_gid=T80bUYQX5T7PS-kRCuOfIw&_nc_oc=AdlaXIdnFa6NuTCeku4lQroaQOJqAnWydQ0i807fRBXJcbxW5O2XTYnUfbaZKKdlGUs&ccb=10-5&oh=00_AfFzbAykAK41dvlBwKqwZ4SCZD-lR9c7TBdkN4wLRWEnWA&oe=6836B63F&_nc_sid=201bca	13.1992986	12.4177718
293	1722361881289883	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-yJPplgPlqfgVky-KdOE7EEml1vfF9cgEm1gfZN-9L4VR5vwVaCcxt4szn8ZZCLIhwlR9MxDp0S18S98Rpojo2WB2BpXR1F7JIA4fRFrEacvXe6NUmtQt7HEca0NMPsgHoWSoGnR2kq5mjDLytvg?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=v-DwZJAmH6NwjiBcaOLV8g&_nc_oc=AdmVtU4QDCrBbf9mxkOjhxs-nwy3gB43wPSTz642jTcKnK5LSq4VM9u_1WDxu07VhaQ&ccb=10-5&oh=00_AfGE6sG1hhZtjCXi-XpSDFlkTwT7P9GhyuZmYkDReZ2xIQ&oe=6836BDF5&_nc_sid=201bca	58.007038	42.002503199972
294	1660256547490944	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-dofZbJqH6veSRM0PVbRtX6ihVG0plx2tBtEVSvZBOS4ULp3IJxufnk49Pg8w9UBgMXQtp5rl7P6cAHRZMGi9Jt4Dge-UFGfTxFq1Tc2XNgYTRlo4r6BS3ePZWx0NiQexHcpiO04Oe9QvhMiFbXUU?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=9cMrqZLAauFE9o9_KL9IyQ&_nc_oc=Adk_hBvNRELVbTd0QJrrKkRXp_w_gj4ULEBcWyMQwGolaWcKwJuCeDwSr8UpTlC4rmQ&ccb=10-5&oh=00_AfF11meU97mv5VmllOXbQ3PvhxC9mXeKnwRvmUzSkduUcw&oe=6836B0A1&_nc_sid=201bca	66.477715	126.04722638889
295	1958566720949376	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-U0EHb_LlVr8xtkGrx_2deOnY7vV00Tp4UD8x5HY5Fz1fRc3hz43dikMOI7hgrgU7dt0m0s1tpEwG88tcMx4U_nKuJz4pxHWOxotYNTcgfCtsk2wYJ_H3RW9ho43cLPkL9rd0XHstcW8X0G-wnyQ?stp=s1024x766&edm=AOnQwmMEAAAA&_nc_gid=ODrOtUaE0SAZQp6Q4Bp2mw&_nc_oc=AdlyqlTdb9BsqhE4P_KeqC2965OrxH4G1Sh_8yGESjgJFYKGJdz7wA40aFvP2XDyzAo&ccb=10-5&oh=00_AfH1uu2GYq4zzaxdNeP9Nx6w6t_vPClgbIFV3CLP5AR19Q&oe=6836ABC5&_nc_sid=201bca	46.827469062778	-117.114642016
296	1244624660214006	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An827YDGtihm5Lbk66fY9S8tsjz3GJPwm-uHK5lxT4sLq-S04ImllDrrHf-pZ3wwtgxkWgT7l-wQH3N2SIl0fZS0GDl2X5l_93OOQc7TFJNvpZcvdBREmgxTmc8nufdx4mt23-gyYA6--bbBTWi7iQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=GHtBelHqUSx33uBLPRXYSw&_nc_oc=AdmAd4VVbnlmgaeQa8CceX06LD8gWr9ozMdGkvAgzBBwtPoqTC9sKTzQ9uFyPfX80yc&ccb=10-5&oh=00_AfHOCiEH_pYXPg8_Q6Y8v5H5mveM-cdCiy1r-JvzOU75ZA&oe=6836CED2&_nc_sid=201bca	56.3070664	113.3982129
297	300227418239968	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_rQqIvhwlAY4x6U9ld1JgkU_8u6nnRlXT3Ij9M7qbK7k2BA72GBawOi4Sp7ggYGJKM7fD9dd10gtnN0DkLWHfYIyf_cfQqsXvWembE8npFMKzhEMlqiWZ_J-tF-f-WaAyA4aQ_SkWsHdmd6cNo3mc?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=jSCVmSf_fkNQsdHotoFFhQ&_nc_oc=AdmwQX-mfvGwxJc9stxTzeH8ROyjw6c4-Auq5aTnZkyXiR2qsKyAP6vypm2oMD8hcE4&ccb=10-5&oh=00_AfFbKqe52NxPXoPkjv0snM38shi7fGH5fXsVr6dU-tI4cw&oe=6836D25E&_nc_sid=201bca	27.700203699972	119.05377819997
298	539108044161912	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8MQCMnbihDzKojsQV8985pTynY65LNyfephwvQ9k04hB3u5Y0BPkWuv_XdQleEPS0hwshvJ8RJZ87uChDPKbM3uGP5pOygWKsNZhT2K6H1T4VUt_VnvbvNteHr02ojwfsXzIsoM-WnbbAyq_IsfQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=g8wYmi0p7-Nag9T62AwH_g&_nc_oc=AdkkS5FoLMDRdRmaUXdEKQg6EFAPWM5WBn82NvH0oWzWD83JUylXIsOVLPDJqD-OJZs&ccb=10-5&oh=00_AfHUhGuIEa_Q0kKs5oJekWFE83he5nKhYZ5uovjj7qLCsQ&oe=6836DDEC&_nc_sid=201bca	41.80178393	95.12634958
299	6908187979247360	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_Bt4z-cxyZBK8KIStaIA0_T9y94bz3oaIuEFXKIrNy7TwFV2dMEUicA8lBeSiz5mJxAST_a_6-yjupQbK5sUEcfhKwuiH_b53caDYN8sPq_cYHfdV2n-_zJZWzZomopT9jA8VKeVcVJekUoqPpRA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=Qtoeraptdx7BBVcEWUdsig&_nc_oc=AdkFTiaZ6SmK4f4qaldg26hLi9EslTzU4wiz7swwvXUX1yISxLz1d29GhYPFRsdB7WM&ccb=10-5&oh=00_AfGYpkxWOvSBa5fZqgo0GtDZr5jaJ18nR4ghP1gGha6l8g&oe=6836C62E&_nc_sid=201bca	-8.0395691	-50.1576762
300	4347742761915237	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9pOjlF8vJdBqltz15LOLiP3_sai6vGEGLJPO-cJI-sUjxRgFXrjXb1t5-D6Q4SVQpBrgF90dBgDwwZaj8HXw0BM0qiZw5fOMhGFt4dOJXEwFakT4dPEN_lWqe0_HytlK6IVfmOKjcsDpWGCpwJNQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=ZLKhrGSf8Ig53sSyehQhpg&_nc_oc=AdkUghsL9n5fa4jdxzBT_YK1m1sEJFTPKAgEXyhJNwVzuCXyk3rAR75cTRpQn0ooE44&ccb=10-5&oh=00_AfEZo-KX8R3enalvICTZK-2c132o79fb3khNibjjZxkdng&oe=6836CA9C&_nc_sid=201bca	63.823947284264	74.659323584162
301	3423465244634247	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8kwVS0EHGlTN3KarOUeGAevHRvLQ0KLOonYXRt5CZDye1gN9-vM4opvToC8VwXiiSmZJL-Z_G_cwuWP9hfeWREkYrsPkrDS601tELMsGgYMxsdgukL9roXjCdaDmRboQYAHv3mkScYO5rjdMoieA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=-VjccLdlF76d_4XNMDhsug&_nc_oc=Adl_npJrMG-1W-XyKesbDXSjufjkmz33xYasTQmoX4RW2ZO7L5khNKs__EjOmuevZIU&ccb=10-5&oh=00_AfFBHC4UfKcs3mvtsiC8BCDgPRhFndYCXvMDQkzEwa8A4Q&oe=6836AC61&_nc_sid=201bca	55.954503300002	-130.056897
302	4120248831347191	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-5xP5EM4AUwbnqXj7kknlSnywzmEmPfiKTJp5NqINcXiuNfap2xcVpAIF5wnc0Xa-Ex0R9N23rluroT-0T19hZec2DU3WCT7GtXmM-q-HsRdU-fVSrZm6V4HzzJtkwV5wbjP7cotgbRfH2E6zebQ?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=oEfs3djA8CyUk3C1zR56pA&_nc_oc=AdnCkFNvkVJg7hDwrYNYRR1mCzRiZBY2i3tHhxTdhLI6ZLN0uf5hSZTKn7Z8R6kMNew&ccb=10-5&oh=00_AfGoe8jJ9_h-HOAj7OG80OsVeUjWWHacRTfOPft4n5HMKA&oe=6836AF68&_nc_sid=201bca	-10.492289057516	105.63347698245
303	1707611369695595	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9xfTc1orPwXMakJjBSP85kx2wZdzPbmcgUqRVJHJbKsY8YnDwvOTKi997c9c0L7bjedex7yLgkT0wHFSWlmjoUOxlKIbmdJg1dmATVumYq0_u7NkD9FNyj8scWtfG-V_z8mDA6HefMfC3KUJUpaQ?stp=s1024x512&edm=AOnQwmMEAAAA&_nc_gid=8Y_cgM0Et63l-O5GrLhApg&_nc_oc=AdlRzNWsrkCAWD6hYfN4XA6_mJWeo_2-_kJ2smNPnYb5C4AhbNxEKZ0L8xyzZ7Eps74&ccb=10-5&oh=00_AfHLdeMRcMGvTGakDLPDBywWiA-iyLx1RzQD05LHzLKhYg&oe=6836C736&_nc_sid=201bca	51.6408131	-99.9425024
304	1514986902700278	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9oSN3NgrNEB2w5ptEBOVlxgG8JvQbTxFiEoClWqcSgbGzsnq4NN3jCmXDzloiwQm_aahWlJX7jLRMde4iXIUqCbCEMoopusqWIPmbpACrsUOdBVJR0pvZJNVvFhUPDPPpE_nRZDDnSfEDdpPLbwwQ?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=Yo8WIfGdqP8XDcaShwwbDw&_nc_oc=AdmasdknzZfPbZMKuwvDcsqHFScA5_Nqx1zo0F0tDiYyiAc8RxoMTtidzroY0OYtMpc&ccb=10-5&oh=00_AfESmFdp7LAHWwwA086V9oumjvnT5f5sPjT2dez0fhaR7A&oe=6836B801&_nc_sid=201bca	35.4514758	73.2013352
305	3415641685340800	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_4uB0-2wIaIl9LE1io2ODPrM4rngEb4RC6nUjkroV0HwCxD_wz4TDyqlE5zsORw8uJJ54glzcc27Xaux3iEWXNbLZRUXLADtMSu4PYODLR-LfkPnF12G3uO8pob-5k5bHJ7rJ-XeBAlnB64_m9Dw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=kmVnYqTQlf7PLXe0yrAbAQ&_nc_oc=Adlav94gVCQeIFRE7dF51TwpprW3CIYRggnAqqN3WpMiztKtVXaDhuTUTP3Oh3Wnqig&ccb=10-5&oh=00_AfFlpEUSuOe8Vy6rFSnZ8KjBhpf8rWtBHkl7AZ6aRg4Fwg&oe=6836D097&_nc_sid=201bca	-27.997280913903	150.3361306392
306	1730221777159392	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-juZRxu_ZzmXITooZXV8H_Y1B-_6S-xPUs0WAxWyJATWpda208Fx-Mw3N32fA3lJKILUEuRYqlqVC3vSFaEzJ7o6OtBWzbt6tHwzrAh30sYqJoqTg0dz4gBVRkSNjaWjMIArV8BF3guvCYRsSOSg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=1_X_gkhdp5uhrfXzJfhFRA&_nc_oc=AdnBte1XXkESPysYQcu4Y2sceLWy34I9FWXCA0TWv49lRos62HYsOUadSmTObbLwJMg&ccb=10-5&oh=00_AfHCMpPsZlRJIF0f5OamkTdmJLfGjnsU04umKju5oP1vIw&oe=6836BF54&_nc_sid=201bca	-12.7199465968	-76.6209919844
307	2059165834221681	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9MU_GK-ZqbRhVmXa4icEF-YuA2OtsA2pdU9RdjjlFwkVQq7gzBIRFnnAExT6I8NvAIFBA8PF9bCyBaDrarWTBgKXirGKBPXmdCWJv_KtIqHcb_1Cr3rwnYKdpuFpdshQ1sRZKisAxed6mclBMoY7g?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=U9hfUPOhM5ivaWmtejW4Uw&_nc_oc=AdkElN05blLzNkh_jttandoLs79HGGFMZsyy9LKNZE6g3DmvK_bKBpuQ1j06ogdztuE&ccb=10-5&oh=00_AfFXJW_7OzCrHiddFOxug7helTDtE4m1R_qeCNNYQ9V93w&oe=6836B0C0&_nc_sid=201bca	51.6720705	45.8157025
308	1000346054206532	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9x8lBkbqG9eHBcAwMm_ByIQqy1PZ4Xh_TZHp-jCxg-fd1VTAVneiTxg4eIdpXZCRtqMwLyhjasytyq20ZObxrGTI97xVJY77h8VKHKSvNY53PrtH9jsSOXAKAvcNLlfUiQqp4mS8FJ7cbxK9JMzA?stp=s1024x1024&edm=AOnQwmMEAAAA&_nc_gid=oOopGn6Bzo6Ke3VzvNxJJw&_nc_oc=AdlfDMv0o4c9x-Bc1j2K293vLVgUmVmoo8bohEXjgyW85DqE21jmlsBzFhe0OV_qnVs&ccb=10-5&oh=00_AfH0399kt_8z1x935UzZssOokgNM4dW4F0xHtMjj6eFC1w&oe=6836C7F2&_nc_sid=201bca	23.804792777778	-94.216692777778
309	1415172585833065	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-VXwrWjC-90PVApEoGvervryU_w-l3cFo0TBAzWj8vMuOHoik9fWR0TZ96eyU8UjqMi5jIBeYheB8gGcdwbIuZpFW59ph74m4GK8HwLKuEhdew6mJSWm6fSNxT9tRCvFI7V1_CNb2K50-RRt8G8vw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Pxymvd1xHaLhn7QQuwiTsg&_nc_oc=AdlVGmP0Xt2JRuBiMpR2HDSELW0r-qw6Tf2FjALy7pzb3kM7juOJAoxrVnPGZNcMAA4&ccb=10-5&oh=00_AfF-7CcLGs82dpzA0d7q6OcP_qn0XRXL5C1cj77IxJ0yTA&oe=6836CF60&_nc_sid=201bca	38.866617824802	-0.023655002125886
310	2979308158981990	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-DUgTLw7slbIaA0GEdbK8xVrfw5yQzcUXVM0l9ZEsvEzZayPgt9iE7i2fg3rxB8hs-nPoGxSJjy_FwDhWrsoMJQURdsiKp8keSfDjv_MeKGq6LuzNPqvZ_19-EDvnkrZ7-lnMy7IORbjANmDU9Wg?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=jSLQHbj7Ib2PYmNOuE85jg&_nc_oc=AdmK00dB8K2Owf0LAPhfGJZvX9n8GitY867VE0TUrVgXqqLcLrI1atuf2v7KZAkZZ2M&ccb=10-5&oh=00_AfFXmttzunE7g1Jz2LiMcT2HAAVtgNaJxwnxkk9r35FLPQ&oe=6836BE26&_nc_sid=201bca	-31.573408996027	129.97033748705
311	1615596722287901	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An8SZnqzqovZ3pHAxVIung0J9ucysbuB09ELDD4o-4vP1wb_WDWKJCUib0MwLJvvBkSOmq5f6fNbTLSOV8Gg66XduvxbhurQ81alDEnWEN3gNxWL71h22DGQRm5rsfEgyR0-2G65ToZEBlcSc6NcMhw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=3-1dlpha1l6r6Or01jx3pA&_nc_oc=AdlkhuJ2JpyhG7GVssOywenubW_dqjPxCjQe3modZZYVgEo1oXN_NWPi0Ua-Voy0CQc&ccb=10-5&oh=00_AfGxFKeTfDau0VIH__auUEC991UAh73S8Fq0-7Jxp4vicA&oe=6836CE1F&_nc_sid=201bca	13.377765	103.812651
312	7811048398965541	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-2kQhRnDH9X_oDZxqLyUrwdgqmp3_LzimgrlWmp3rGrWBan5Z6MEKuJeqV8xnPStn012I1B2xn1AAFBAWEl-LaoygeGlx5EutP1GRKQaCEGvgEOK_IYAcCCX_R75cfuwV9qMGLmizSQVKYzek4kVI?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=5D_RgSn8XgPCSf1EWOlG0g&_nc_oc=AdncItC_ui4e9IUXvcI0kNznGv43q72EoKHWv2kyDh-JPZ87zwNnn4iCG_pxWbtQ27c&ccb=10-5&oh=00_AfEJitox8rrbrLSI6OkII17vyae9uIVQ7IFMplt9tBDxww&oe=6836B334&_nc_sid=201bca	59.187377099972	-129.76693739997
313	1846653068841952	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_I1n0kSSHr63nEGzVdVqPxQwCM3fWwRd9sn25VPCHHZTpsJJqvbeVrqRJdwetyAB2mvZfUglSALyjGcjr0dixYA-X2CKVkpbHlo_fibtCqTjgXHWYuIJGnZ6eu6_80_H35RnRz_ViyrrzsJ_g68A?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=KYatb-gchBK00n6rR_mCSA&_nc_oc=Adn4mZJZjA_OOYqFuxDMWPq3kHfecskwwNsjNP3I4MfoGuZzWeowTLXj2QBvRHoSaN0&ccb=10-5&oh=00_AfG9PNkt-LqJobxh2qvwk89qQh-4ooYfLNukuA8mh_tkrQ&oe=6836AEA3&_nc_sid=201bca	81.853374999017	81.853374999017
314	744882169531789	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An_AJ5qPKXl_DtS4uxrS-FSrnwo5aDwLT1DEdfKeJes22z4Nx9TQba03mS3Xc1BiOoXYGdAC4UrZXySubGT9qB93WvQ6u4QUQQw8O0uwFIRZSw094LvEZsMp97mGjz_BAz10Ie0f6CYkFTrF2JLCdw?stp=s1024x576&edm=AOnQwmMEAAAA&_nc_gid=Am7wMFjevYM8DSxgIBIn6w&_nc_oc=AdkF76yPPHZ2DRqttmQCGYTVWdJFySFiq6apamV5FJX3LumgRX2puGTEQOplVV5uCXc&ccb=10-5&oh=00_AfFIJG-HIi9CX-4J7t2Dkdnmuh3CrEY57qApLC0NelJ_9g&oe=6836CC4B&_nc_sid=201bca	36.507902665089	46.208248402565
315	2864646763799811	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An-3XdA6NDTesoLhffxDPlZ2gm6bt7OXTYYyjEue_jNZNWIkIpW-nrLxklWs1saAEzo2hUD3NgjhhQLPhcucuRScUVdUKTMq2dsvnl2B91ui4vY2EEPbgKYWOkqSjzN623wzoAnwGNaDDB35v8OfGA?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=5xFY4ntqNlPhuix_2M6o_Q&_nc_oc=Adl6yp8NcUpJwa-bI584IcX7LOzv_3VZ2znd4TW67gwMTSLE3XuXx3wubdSOZ2moR_A&ccb=10-5&oh=00_AfFvnuxX_vlPNTcr7uyb15AQLE2dSegAVGTs-ZRxk04FwA&oe=6836C3E8&_nc_sid=201bca	0.823971	110.371796
316	2894190750797057	https://scontent.fura3-1.fna.fbcdn.net/m1/v/t6/An9-BI5FzqgMxkPmKFJd9hHlb5KsmJpQVforLw3g3Q3rj1__32wiZK-bTz6_mg2ZlWlRMeIejuf1xm4yV7rmkCU5UswAIWbJVl5XRESFcbmHNZmI_UWAcl4DVP_GpRLOpwmJ1mZm8n6AcA-afIzBaw?stp=s1024x768&edm=AOnQwmMEAAAA&_nc_gid=RgTmQZBrjHbJSRTYv_nHPA&_nc_oc=Adn3L0MH8xFAHRGdCgi2lcDb74LrU08SCUkrCaOrXDEmVTa188b2sjlDDrNx2SrpXmk&ccb=10-5&oh=00_AfFxM71xR02czZaGYII1_i6KKyq6MN0Kh47LlQ9UmlUUgA&oe=6836DBDA&_nc_sid=201bca	-40.50617643833	175.78937113662
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, continent) FROM stdin;
1	Russia	Europe / Asia
2	Germany	Europe
3	Canada	North America
4	Poland	Europe
5	United States	North America
6	Turkey	Europe / Asia
7	Brazil	South America
8	Mexico	North America
9	Austria	Europe
10	China	Asia
11	Australia	Oceania
12	Finland	Europe
13	France	Europe
14	India	Asia
15	Italy	Europe
16	Japan	Asia
17	Norway	Europe
18	South Africa	Africa
19	Spain	Europe
20	United Kingdom	Europe
\.


--
-- Data for Name: flag_names; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flag_names (id, country_id, code2l, language, name, name_official) FROM stdin;
1	1	AF	ar	أفغانستان	جمهورية أفغانستان الإسلامية 
2	1	AF	en	Afghanistan	The Islamic Republic of Afghanistan
3	1	AF	es	Afganistán	la República Islámica del Afganistán
4	1	AF	fr	Afghanistan	la République islamique d'Afghanistan
5	1	AF	it	Afghanistan	Repubblica Islamica di Afghanistan  
6	1	AF	zh	阿富汗	阿富汗伊斯兰共和国
7	1	AF	ru	Афганистан	Исламская Республика Афганистан
8	5	AO	ar	أنغولا	أنغولا جمهورية 
9	5	AO	en	Angola	the Republic of Angola
10	5	AO	es	Angola	la República de Angola
11	5	AO	fr	Angola	la République d'Angola
12	5	AO	it	Angola	Repubblica d'Angola
13	5	AO	zh	安哥拉	安哥拉共和国
14	5	AO	ru	Ангола	Республика Ангола
15	2	AL	ar	ألبانيا	ألبانيا جمهورية 
16	2	AL	en	Albania	the Republic of Albania
17	2	AL	es	Albania	la República de Albania
18	2	AL	fr	Albanie	la République d'Albanie
19	2	AL	it	Albania	Repubblica d'Albania
20	2	AL	zh	阿尔巴尼亚	阿尔巴尼亚共和国
21	2	AL	ru	Албания	Республика Албания
22	4	AD	ar	أندورا	أندورا إمارة 
23	4	AD	en	Andorra	the Principality of Andorra
24	4	AD	es	Andorra	el Principado de Andorra
25	4	AD	fr	Andorre	la Principauté d'Andorre
26	4	AD	it	Andorra	Principato d'Andorra
27	4	AD	zh	安道尔	安道尔公国
28	4	AD	ru	Андорра	Княжество Андорра
29	173	AE	ar	المتحدة العربية الإمارات 	المتحدة العربية الإمارات 
30	173	AE	en	United Arab Emirates	the United Arab Emirates
31	173	AE	es	Emiratos Árabes Unidos	los Emiratos Árabes Unidos
32	173	AE	fr	Émirats arabes unis	les Émirats arabes unis
33	173	AE	it	Emirati arabi uniti	Emirati arabi uniti
34	173	AE	zh	阿拉伯联合酋长国	阿拉伯联合酋长国
35	173	AE	ru	Объединенные Арабские Эмираты	Объединенные Арабские Эмираты
36	7	AR	ar	الأرجنتين	جمهورية الأرجنتين 
37	7	AR	en	Argentina	the Argentine Republic
38	7	AR	es	Argentina	la República Argentina
39	7	AR	fr	Argentine	la République argentine
40	7	AR	it	Argentina	Repubblica argentina
41	7	AR	zh	阿根廷	阿根廷共和国
42	7	AR	ru	Аргентина	Аргентинская Республика
43	8	AM	ar	أرمينيا	أرمينيا جمهورية 
44	8	AM	en	Armenia	the Republic of Armenia
45	8	AM	es	Armenia	la República de Armenia
46	8	AM	fr	Arménie	la République d'Arménie
47	8	AM	it	Armenia	Repubblica d'Armenia
48	8	AM	zh	亚美尼亚	亚美尼亚共和国
49	8	AM	ru	Армения	Республика Армения
50	6	AG	ar	أنتيغوا وبربودا 	أنتيغوا وبربودا 
51	6	AG	en	Antigua and Barbuda	Antigua and Barbuda
52	6	AG	es	Antigua y Barbuda	Antigua y Barbuda
53	6	AG	fr	Antigua-et-Barbuda	Antigua-et-Barbuda
54	6	AG	it	Antigua e Barbuda	Antigua e Barbuda
55	6	AG	zh	安提瓜和巴布达	安提瓜和巴布达
56	6	AG	ru	Антигуа и Барбуда	Антигуа и Барбуда
57	9	AU	ar	أستراليا	أستراليا
58	9	AU	en	Australia	Australia
59	9	AU	es	Australia	Australia
60	9	AU	fr	Australie	l'Australie
61	9	AU	it	Australia	Australia
62	9	AU	zh	澳大利亚	澳大利亚
63	9	AU	ru	Австралия	Австралия
64	10	AT	ar	النمسا	النمسا جمهورية 
65	10	AT	en	Austria	the Republic of Austria
66	10	AT	es	Austria	la República de Austria
67	10	AT	fr	Autriche	la République d'Autriche
68	10	AT	it	Austria	Repubblica d'Austria
69	10	AT	zh	奥地利	奥地利共和国
70	10	AT	ru	Австрия	Австрийская Республика
71	11	AZ	ar	أذربيجان	الجمهورية الأذربيجانية 
72	11	AZ	en	Azerbaijan	the Republic of Azerbaijan
73	11	AZ	es	Azerbaiyán	la República de Azerbaiyán
74	11	AZ	fr	Azerbaïdjan	la République d'Azerbaïdjan
75	11	AZ	it	Azerbaigian	Repubblica dell'Azerbaigian
76	11	AZ	zh	阿塞拜疆	阿塞拜疆共和国
77	11	AZ	ru	Азербайджан	Азербайджанская Республика
78	27	BI	ar	بوروندي	جمهورية بوروندي 
79	27	BI	en	Burundi	the Republic of Burundi
80	27	BI	es	Burundi	la República de Burundi
81	27	BI	fr	Burundi	la République du Burundi
82	27	BI	it	Burundi	Repubblica del Burundi
83	27	BI	zh	布隆迪	布隆迪共和国
84	27	BI	ru	Бурунди	Республика Бурунди
85	17	BE	ar	بلجيكا	بلجيكا مملكة 
86	17	BE	en	Belgium	the Kingdom of Belgium
87	17	BE	es	Bélgica	el Reino de Bélgica
88	17	BE	fr	Belgique	le Royaume de Belgique
89	17	BE	it	Belgio	Regno del Belgio
90	17	BE	zh	比利时	比利时王国
91	17	BE	ru	Бельгия	Королевство Бельгия
92	19	BJ	ar	بنن	جمهورية بنن 
93	19	BJ	en	Benin	the Republic of Benin
94	19	BJ	es	Benin	la República de Benin
95	19	BJ	fr	Bénin	la République du Bénin
96	19	BJ	it	Benin	Repubblica del Benin
97	19	BJ	zh	贝 宁	贝宁共和国
98	19	BJ	ru	Бенин	Республика Бенин
99	26	BF	ar	بوركينا فاسو 	بوركينا فاسو 
100	26	BF	en	Burkina Faso	Burkina Faso
101	26	BF	es	Burkina Faso	Burkina Faso
102	26	BF	fr	Burkina Faso	le Burkina Faso
103	26	BF	it	Burkina Faso	Burkina Faso
104	26	BF	zh	布基纳法索	布基纳法索
105	26	BF	ru	Буркина-Фасо	Буркина-Фасо
106	14	BD	ar	بنغلاديش	الشعبية بنغلاديش جمهورية 
107	14	BD	en	Bangladesh	the People's Republic of Bangladesh
108	14	BD	es	Bangladesh	la República Popular de Bangladesh
109	14	BD	fr	Bangladesh	la République populaire du Bangladesh
110	14	BD	it	Bangladesh	Repubblica popolare del Bangladesh
111	14	BD	zh	孟加拉国	孟加拉人民共和国
112	14	BD	ru	Бангладеш	Народная Республика Бангладеш
113	25	BG	ar	بلغاريا	جمهورية بلغاريا 
114	25	BG	en	Bulgaria	the Republic of Bulgaria
115	25	BG	es	Bulgaria	la República de Bulgaria
116	25	BG	fr	Bulgarie	la République de Bulgarie
117	25	BG	it	Bulgaria	Repubblica di Bulgaria
118	25	BG	zh	保加利亚	保加利亚共和国
119	25	BG	ru	Болгария	Республика Болгария
120	13	BH	ar	البحرين	مملكة البحرين 
121	13	BH	en	Bahrain	the Kingdom of Bahrain
122	13	BH	es	Bahrein	el Reino de Bahrein
123	13	BH	fr	Bahreïn	le Royaume de Bahreïn
124	13	BH	it	Bahrein	Regno del Bahrein
125	13	BH	zh	巴 林	巴林王国
126	13	BH	ru	Бахрейн	Королевство Бахрейн
127	12	BS	ar	البهاما جزر 	البهاما جزر كمنولث 
128	12	BS	en	Bahamas	the Commonwealth of the Bahamas
129	12	BS	es	Bahamas	el Commonwealth de las Bahamas
130	12	BS	fr	Bahamas	le Commonwealth des Bahamas
131	12	BS	it	Bahamas	Commonwealth delle Bahamas
132	12	BS	zh	巴哈马	巴哈马国
133	12	BS	ru	Багамские Острова	Содружество Багамских Островов
134	21	BA	ar	والهرسك البوسنة 	والهرسك البوسنة 
135	21	BA	en	Bosnia and Herzegovina	Bosnia and Herzegovina
136	21	BA	es	Bosnia y Herzegovina	Bosnia y Herzegovina
137	21	BA	fr	Bosnie-Herzégovine	la Bosnie-Herzégovine
138	21	BA	it	Bosnia-Erzegovina	Bosnia-Erzegovina
139	21	BA	zh	波斯尼亚和黑塞哥维那	波斯尼亚和黑塞哥维那
140	21	BA	ru	Босния и Герцеговина	Босния и Герцеговина
141	16	BY	ar	بيلاروس	بيلاروس جمهورية 
142	16	BY	en	Belarus	the Republic of Belarus
143	16	BY	es	Belarús	la República de Belarús
144	16	BY	fr	Bélarus	la République du Bélarus
145	16	BY	it	Bielorussia	Repubblica di Bielorussia
146	16	BY	zh	白俄罗斯	白俄罗斯共和国
147	16	BY	ru	Беларусь	Республика Беларусь
148	18	BZ	ar	بليز	بليز
149	18	BZ	en	Belize	Belize
150	18	BZ	es	Belice	Belice
151	18	BZ	fr	Belize	le Belize
152	18	BZ	it	Belize	Belize
153	18	BZ	zh	伯利兹	伯利兹
154	18	BZ	ru	Белиз	Белиз
155	182	BO	ar	بوليفيا - دولة - المتعددة القوميات 	دولة بوليفيا المتعددة القوميات 
156	182	BO	en	Bolivia (Plurinational State of)	the Plurinational State of Bolivia
157	182	BO	es	Bolivia (Estado Plurinacional de)	Estado Plurinacional de Bolivia
158	182	BO	fr	Bolivie (État plurinational de)	l'État plurinational de Bolivie
159	182	BO	it	Bolivia (Stato plurinazionale della)	Stato plurinazionale della Bolivia
160	182	BO	zh	玻利维亚（多民族国）	玻利维亚多民族国
161	182	BO	ru	Боливия (Многонациональное Государство)	Многонациональное Государство Боливия
162	23	BR	ar	البرازيل	الجمهورية الاتحادية البرازيلية 
163	23	BR	en	Brazil	the Federative Republic of Brazil
164	23	BR	es	Brasil	la República Federativa del Brasil
165	23	BR	fr	Brésil	la République fédérative du Brésil
166	23	BR	it	Brasile	Repubblica federativa del Brasile
167	23	BR	zh	巴 西	巴西联邦共和国
168	23	BR	ru	Бразилия	Федеративная Республика Бразилия
169	15	BB	ar	بربادوس	بربادوس
170	15	BB	en	Barbados	Barbados
171	15	BB	es	Barbados	Barbados
172	15	BB	fr	Barbade	la Barbade
173	15	BB	it	Barbados	Barbados
174	15	BB	zh	巴巴多斯	巴巴多斯
175	15	BB	ru	Барбадос	Барбадос
176	24	BN	ar	السلام دار برونى 	السلام دار بروني 
177	24	BN	en	Brunei Darussalam	Brunei Darussalam
178	24	BN	es	Brunei Darussalam	Brunei Darussalam
179	24	BN	fr	Brunéi Darussalam	le Brunéi Darussalam
180	24	BN	it	Brunei	Stato di Brunei Darussalam
181	24	BN	zh	文莱达鲁萨兰国	文莱达鲁萨兰国
182	24	BN	ru	Бруней-Даруссалам	Бруней-Даруссалам
183	20	BT	ar	بوتان	بوتان مملكة 
184	20	BT	en	Bhutan	the Kingdom of Bhutan
185	20	BT	es	Bhután	el Reino de Bhután
186	20	BT	fr	Bhoutan	le Royaume du Bhoutan
187	20	BT	it	Bhutan	Regno del Bhutan
188	20	BT	zh	不 丹	不丹王国
189	20	BT	ru	Бутан	Королевство Бутан
190	22	BW	ar	بوتسوانا	بوتسوانا جمهورية 
191	22	BW	en	Botswana	the Republic of Botswana
192	22	BW	es	Botswana	la República de Botswana
193	22	BW	fr	Botswana	la République du Botswana
194	22	BW	it	Botswana	Repubblica del Botswana
195	22	BW	zh	博茨瓦纳	博茨瓦纳共和国
196	22	BW	ru	Ботсвана	Республика Ботсвана
197	32	CF	ar	الوسطى أفريقيا جمهورية 	الوسطى أفريقيا جمهورية 
198	32	CF	en	Central African Republic	the Central African Republic
199	32	CF	es	República Centroafricana	la República Centroafricana
200	32	CF	fr	République centrafricaine	la République centrafricaine
201	32	CF	it	Repubblica centrafricana	Repubblica centrafricana
202	32	CF	zh	中非共和国	中非共和国
203	32	CF	ru	Центральноафриканская Республика	Центральноафриканская Республика
204	30	CA	ar	كندا	كندا
205	30	CA	en	Canada	Canada
206	30	CA	es	Canadá	el Canadá
207	30	CA	fr	Canada	le Canada
208	30	CA	it	Canada	Canada
209	30	CA	zh	加拿大	加拿大
210	30	CA	ru	Канада	Канада
211	159	CH	ar	سويسرا	الاتحاد السويسري 
212	159	CH	en	Switzerland	the Swiss Confederation
213	159	CH	es	Suiza	la Confederación Suiza
214	159	CH	fr	Suisse	la Confédération suisse
215	159	CH	it	Svizzera	Confederazione svizzera
216	159	CH	zh	瑞 士	瑞士联邦
217	159	CH	ru	Швейцария	Швейцарская Конфедерация
218	34	CL	ar	شيلى	جمهورية شيلى 
219	34	CL	en	Chile	the Republic of Chile
220	34	CL	es	Chile	la República de Chile
221	34	CL	fr	Chili	la République du Chili
222	34	CL	it	Cile	Repubblica del Cile
223	34	CL	zh	智 利	智利共和国
224	34	CL	ru	Чили	Республика Чили
225	35	CN	ar	الصين	الشعبية الصين جمهورية 
226	35	CN	en	China	the People's Republic of China
227	35	CN	es	China	la República Popular China
228	35	CN	fr	Chine	la République populaire de Chine
229	35	CN	it	Cina	Repubblica popolare cinese
230	35	CN	zh	中 国	中华人民共和国
231	35	CN	ru	Китай	Китайская Народная Республика
232	44	CI	ar	ديفوار كوت 	ديفوار كوت جمهورية 
234	44	CI	es	Côte d'Ivoire	la República de Côte d'Ivoire
235	44	CI	fr	Côte d'Ivoire	la République de Côte d'Ivoire
236	44	CI	it	Côte d`Ivoire	Repubblica della Côte d'Ivoire
237	44	CI	zh	科特迪瓦	科特迪瓦共和国
238	44	CI	ru	Кот-д`Ивуар	Республика Кот-д`Ивуар
239	29	CM	ar	الكاميرون	جمهورية الكاميرون 
240	29	CM	en	Cameroon	the Republic of Cameroon
241	29	CM	es	Camerún	la República del Camerún
242	29	CM	fr	Cameroun	la République du Cameroun
243	29	CM	it	Camerun	Repubblica del Camerun
244	29	CM	zh	喀麦隆	喀麦隆共和国
245	29	CM	ru	Камерун	Республика Камерун
246	183	CD	ar	الديمقراطية الكونغو جمهورية 	الديمقراطية الكونغو جمهورية 
247	183	CD	en	Democratic Republic of the Congo	the Democratic Republic of the Congo
248	183	CD	es	República Democrática del Congo	la República Democrática del Congo
249	183	CD	fr	République démocratique du Congo	la République démocratique du Congo
250	183	CD	it	Repubblica democratica del Congo	Repubblica democratica del Congo
251	183	CD	zh	刚果民主共和国	刚果民主共和国
252	183	CD	ru	Демократическая Республика Конго	Демократическая Республика Конго
253	38	CG	ar	الكونغو	الكونغو جمهورية 
254	38	CG	en	Congo	the Republic of the Congo
255	38	CG	es	Congo	la República del Congo
256	38	CG	fr	Congo	la République du Congo
257	38	CG	it	Congo	Repubblica del Congo
258	38	CG	zh	刚 果	刚果共和国
259	38	CG	ru	Конго	Республика Конго
260	181	CK	ar	كوك جزر 	كوك جزر 
261	181	CK	en	Cook Islands	the Cook Islands
262	181	CK	es	Islas Cook	las Islas Cook
263	181	CK	fr	Îles Cook	les Îles Cook
264	181	CK	it	Isole Cook	Isole Cook
265	181	CK	zh	库克群岛	库克群岛
266	181	CK	ru	Острова Кука	Острова Кука
267	36	CO	ar	كولومبيا	جمهورية كولومبيا 
268	36	CO	en	Colombia	the Republic of Colombia
269	36	CO	es	Colombia	la República de Colombia
270	36	CO	fr	Colombie	la République de Colombie
271	36	CO	it	Colombia	Repubblica di Colombia
272	36	CO	zh	哥伦比亚	哥伦比亚共和国
273	36	CO	ru	Колумбия	Республика Колумбия
274	37	KM	ar	جزر القمر 	اتحاد جزر القمر 
275	37	KM	en	Comoros	the Union of the Comoros
276	37	KM	es	Comoras	la Unión de las Comoras
277	37	KM	fr	Comores	l'Union des Comores
278	37	KM	it	Isole Comore	Unione delle Comore
279	37	KM	zh	科摩罗	科摩罗联盟
280	37	KM	ru	Коморские Острова	Союз Коморских Островов
281	31	CV	ar	كابو فيردي 	جمهورية كابو فيردي 
282	31	CV	en	Cabo Verde	Republic of Cabo Verde
283	31	CV	es	Cabo Verde	la República de Cabo Verde
284	31	CV	fr	Cabo Verde	la République de Cabo Verde
285	31	CV	it	Cabo Verde	Repubblica del Cabo Verde
286	31	CV	zh	佛得角	佛得角共和国
287	31	CV	ru	Кабо-Верде	Республика Кабо-Верде
288	39	CR	ar	كوستاريكا	جمهورية كوستاريكا 
289	39	CR	en	Costa Rica	the Republic of Costa Rica
290	39	CR	es	Costa Rica	la República de Costa Rica
291	39	CR	fr	Costa Rica	la République du Costa Rica
292	39	CR	it	Costa Rica	Repubblica di Costa Rica
293	39	CR	zh	哥斯达黎加	哥斯达黎加共和国
294	39	CR	ru	Коста-Рика	Республика Коста-Рика
295	41	CU	ar	كوبا	جمهورية كوبا 
296	41	CU	en	Cuba	the Republic of Cuba
297	41	CU	es	Cuba	la República de Cuba
298	41	CU	fr	Cuba	la République de Cuba
299	41	CU	it	Cuba	Repubblica di Cuba
300	41	CU	zh	古 巴	古巴共和国
301	41	CU	ru	Куба	Республика Куба
302	42	CY	ar	قبرص	جمهورية قبرص 
303	42	CY	en	Cyprus	the Republic of Cyprus
304	42	CY	es	Chipre	la República de Chipre
305	42	CY	fr	Chypre	la République de Chypre
306	42	CY	it	Cipro	Repubblica di Cipro
307	42	CY	zh	塞浦路斯	塞浦路斯共和国
308	42	CY	ru	Кипр	Республика Кипр
309	43	CZ	ar	التشيكية الجمهورية 	التشيكية الجمهورية 
310	43	CZ	en	Czechia	the Czech Republic
311	43	CZ	es	República Checa	la República Checa
312	43	CZ	fr	République tchèque	la République tchèque
313	43	CZ	it	Repubblica ceca	Repubblica ceca
314	43	CZ	zh	捷克共和国	捷克共和国
315	43	CZ	ru	Чешская Республика	Чешская Республика
316	62	DE	ar	ألمانيا	الاتحادية ألمانيا جمهورية 
317	62	DE	en	Germany	the Federal Republic of Germany
318	62	DE	es	Alemania	la República Federal de Alemania
319	62	DE	fr	Allemagne	la République fédérale d'Allemagne
320	62	DE	it	Germania	Repubblica federale di Germania
321	62	DE	zh	德 国	德意志联邦共和国
322	62	DE	ru	Германия	Федеративная Республика Германия
323	46	DJ	ar	جيبوتي	جيبوتي جمهورية 
324	46	DJ	en	Djibouti	the Republic of Djibouti
325	46	DJ	es	Djibouti	la República de Djibouti
326	46	DJ	fr	Djibouti	la République de Djibouti
327	46	DJ	it	Gibuti	Repubblica di Gibuti
328	46	DJ	zh	吉布提	吉布提共和国
329	46	DJ	ru	Джибути	Республика Джибути
330	47	DM	ar	دومينيكا	كمنولث دومينيكا 
331	47	DM	en	Dominica	the Commonwealth of Dominica
332	47	DM	es	Dominica	el Commonwealth de Dominica
333	47	DM	fr	Dominique	le Commonwealth de la Dominique
334	47	DM	it	Dominica	Commonwealth di Dominica
335	47	DM	zh	多米尼克	多米尼克国
336	47	DM	ru	Доминика	Содружество Доминики
337	45	DK	ar	الدانمرك	مملكة الدانمرك 
338	45	DK	en	Denmark	the Kingdom of Denmark
339	45	DK	es	Dinamarca	el Reino de Dinamarca
340	45	DK	fr	Danemark	le Royaume du Danemark
341	45	DK	it	Danimarca	Regno di Danimarca
342	45	DK	zh	丹 麦	丹麦王国
343	45	DK	ru	Дания	Королевство Дания
344	48	DO	ar	الجمهورية الدومينيكية 	الجمهورية الدومينيكية 
345	48	DO	en	Dominican Republic	the Dominican Republic
346	48	DO	es	República Dominicana	la República Dominicana
347	48	DO	fr	République dominicaine	la République dominicaine
348	48	DO	it	Repubblica dominicana	Repubblica dominicana
349	48	DO	zh	多米尼加共和国	多米尼加共和国
350	48	DO	ru	Доминиканская Республика	Доминиканская Республика
351	3	DZ	ar	الجزائر	الجمهورية الجزائرية الديمقراطية الشعبية 
352	3	DZ	en	Algeria	the People's Democratic Republic of Algeria
353	3	DZ	es	Argelia	la República Argelina Democrática y Popular
354	3	DZ	fr	Algérie	la République algérienne démocratique et populaire
355	3	DZ	it	Algeria	Repubblica algerina democratica e popolare
356	3	DZ	zh	阿尔及利亚	阿尔及利亚民主人民共和国
357	3	DZ	ru	Алжир	Алжирская Народная Демократическая Республика
358	49	EC	ar	إكوادور	إكوادور جمهورية 
359	49	EC	en	Ecuador	the Republic of Ecuador
360	49	EC	es	Ecuador	la República del Ecuador
233	44	CI	en	Ivory Coast	the Republic of Côte d'Ivoire
361	49	EC	fr	Équateur	la République de l'Équateur
362	49	EC	it	Ecuador	Repubblica dell'Ecuador
363	49	EC	zh	厄瓜多尔	厄瓜多尔共和国
364	49	EC	ru	Эквадор	Республика Эквадор
365	50	EG	ar	مصر	العربية مصر جمهورية 
366	50	EG	en	Egypt	the Arab Republic of Egypt
367	50	EG	es	Egipto	la República Árabe de Egipto
368	50	EG	fr	Égypte	la République arabe d'Égypte
369	50	EG	it	Egitto	Repubblica araba d'Egitto
370	50	EG	zh	埃 及	阿拉伯埃及共和国
371	50	EG	ru	Египет	Арабская Республика Египет
372	53	ER	ar	إريتريا	إريتريا دولة 
373	53	ER	en	Eritrea	the State of Eritrea
374	53	ER	es	Eritrea	el Estado de Eritrea
375	53	ER	fr	Érythrée	l'État d'Érythrée
376	53	ER	it	Eritrea	Stato di Eritrea
377	53	ER	zh	厄立特里亚	厄立特里亚国
378	53	ER	ru	Эритрея	Государство Эритрея
379	153	ES	ar	إسبانيا	إسبانيا مملكة 
380	153	ES	en	Spain	the Kingdom of Spain
381	153	ES	es	España	el Reino de España
382	153	ES	fr	Espagne	le Royaume d'Espagne
383	153	ES	it	Spagna	Regno di Spagna
384	153	ES	zh	西班牙	西班牙王国
385	153	ES	ru	Испания	Королевство Испания
386	54	EE	ar	إستونيا	جمهورية إستونيا 
387	54	EE	en	Estonia	the Republic of Estonia
388	54	EE	es	Estonia	la República de Estonia
389	54	EE	fr	Estonie	la République d'Estonie
390	54	EE	it	Estonia	Repubblica di Estonia
391	54	EE	zh	爱沙尼亚	爱沙尼亚共和国
392	54	EE	ru	Эстония	Эстонская Республика
393	55	ET	ar	إثيوبيا	جمهورية إثيوبيا الديمقراطية الاتحادية 
394	55	ET	en	Ethiopia	the Federal Democratic Republic of Ethiopia
395	55	ET	es	Etiopía	la República Democrática Federal de Etiopía
396	55	ET	fr	Éthiopie	la République fédérale démocratique d'Éthiopie
397	55	ET	it	Etiopia	Repubblica federale democratica di Etiopia
398	55	ET	zh	埃塞俄比亚	埃塞俄比亚联邦民主共和国
399	55	ET	ru	Эфиопия	Федеративная Демократическая Республика Эфиопия
400	184	EU	ar	عضو منظمة - الأوروبي الإتحاد 	عضو منظمة - الأوروبي الإتحاد 
402	184	EU	es	Unión Europea (Organización Miembro)	Unión Europea (Organización Miembro)
403	184	EU	fr	Union européenne (Organisation membre)	l'Union européenne (Organisation membre)
404	184	EU	it	Unione europea (Organizzazione membro)	Unione europea (Organizzazione membro)
405	184	EU	zh	欧洲联盟 （成员组织）	欧洲联盟（成员组织）
406	184	EU	ru	Европейский союз (организация-член)	Европейский союз (организация-член)
407	57	FI	ar	فنلندا	فنلندا جمهورية 
408	57	FI	en	Finland	the Republic of Finland
409	57	FI	es	Finlandia	la República de Finlandia
410	57	FI	fr	Finlande	la République de Finlande
411	57	FI	it	Finlandia	Repubblica di Finlandia
412	57	FI	zh	芬 兰	芬兰共和国
413	57	FI	ru	Финляндия	Финляндская Республика
414	56	FJ	ar	فيجي	جمهورية فيجي 
415	56	FJ	en	Fiji	the Republic of Fiji
416	56	FJ	es	Fiji	la República de Fiji
417	56	FJ	fr	Fidji	la République des Fidji
418	56	FJ	it	Figi	Repubblica delle Figi
419	56	FJ	zh	斐济	斐济共和国
420	56	FJ	ru	Фиджи	Республика Фиджи
421	58	FR	ar	فرنسا	الفرنسية الجمهورية 
422	58	FR	en	France	the French Republic
423	58	FR	es	Francia	la República Francesa
424	58	FR	fr	France	la République française
425	58	FR	it	Francia	Repubblica francese
426	58	FR	zh	法  国	法兰西共和国
427	58	FR	ru	Франция	Французская Республика
428	209	FO	ar	جزر فيرويه 	جزر فيرويه 
429	209	FO	en	Faroe Islands (Associate Member)	Faroe Islands
430	209	FO	es	Islas Feroe (Miembro Asociado)	las Islas Feroe
431	209	FO	fr	Îles Féroé (Membre associé)	les Îles Féroé
432	209	FO	it	Isole Faer øer	Isole Faer øer
433	209	FO	zh	法罗群岛 (准成员)	法罗群岛
434	209	FO	ru	Фарерские Острова (ассоциированный член)	Фарерские Острова
435	185	FM	ar	ميكرونيزيا	الموحدة ميكرونيزيا ولايات 
436	185	FM	en	Micronesia (Federated States of)	the Federated States of Micronesia
437	185	FM	es	Micronesia (Estados Federados de)	los Estados Federados de Micronesia
438	185	FM	fr	Micronésie (États fédérés de)	les États fédérés de Micronésie
439	185	FM	it	Micronesia (Stati federati di)	Stati federati di Micronesia
440	185	FM	zh	密克罗尼西亚(联邦)	密克罗尼西亚联邦
441	185	FM	ru	Микронезия (Федеративные Штаты)	Федеративные Штаты Микронезии
442	59	GA	ar	غابون	الجمهورية الغابونية 
443	59	GA	en	Gabon	the Gabonese Republic
444	59	GA	es	Gabón	la República Gabonesa
445	59	GA	fr	Gabon	la République gabonaise
446	59	GA	it	Gabon	Repubblica gabonese
447	59	GA	zh	加 蓬	加蓬共和国
448	59	GA	ru	Габон	Габонская Республика
449	186	GB	ar	المملكة المتحدة 	المملكة المتحدة لبريطانيا العظمى وآيرلندا الشمالية 
450	186	GB	en	United Kingdom	the United Kingdom of Great Britain and Northern Ireland
451	186	GB	es	Reino Unido	el Reino Unido (de Gran Bretaña e Irlanda del Norte)
452	186	GB	fr	Royaume-Uni	le Royaume-Uni (de Grande-Bretagne et d'Irlande du Nord)
453	186	GB	it	Regno Unito	Regno Unito di Gran Bretagna e Irlanda del nord
454	186	GB	zh	联合王国	大不列颠及北爱尔兰联合王国
455	186	GB	ru	Соединенное Королевство	Соединенное Королевство Великобритании и Северной Ирландии
456	61	GE	ar	جورجيا	جورجيا
457	61	GE	en	Georgia	Georgia
458	61	GE	es	Georgia	Georgia
459	61	GE	fr	Géorgie	la Géorgie
460	61	GE	it	Georgia	Georgia
461	61	GE	zh	格鲁吉亚	格鲁吉亚
462	61	GE	ru	Грузия	Грузия
463	63	GH	ar	غانا	غانا جمهورية 
464	63	GH	en	Ghana	the Republic of Ghana
465	63	GH	es	Ghana	la República de Ghana
466	63	GH	fr	Ghana	la République du Ghana
467	63	GH	it	Ghana	Repubblica del Ghana
468	63	GH	zh	加 纳	加纳共和国
469	63	GH	ru	Гана	Республика Гана
470	67	GN	ar	غينيا	جمهورية غينيا 
471	67	GN	en	Guinea	the Republic of Guinea
472	67	GN	es	Guinea	la República de Guinea
473	67	GN	fr	Guinée	la République de Guinée
474	67	GN	it	Guinea	Repubblica di Guinea
475	67	GN	zh	几内亚	几内亚共和国
476	67	GN	ru	Гвинея	Гвинейская Республика
477	60	GM	ar	غامبيا	الإسلامية غامبيا جمهورية 
478	60	GM	en	Gambia	Islamic Republic of the Gambia
479	60	GM	es	Gambia	República Islámica de Gambia
480	60	GM	fr	Gambie	République islamique de Gambie
481	60	GM	it	Gambia	Repubblica islamica del Gambia
482	60	GM	zh	冈比亚	冈比亚伊斯兰共和国
483	60	GM	ru	Гамбия	Исламская Республика Гамбия
484	68	GW	ar	غينيا - بيساو 	جمهورية غينيا بيساو 
485	68	GW	en	Guinea-Bissau	the Republic of Guinea-Bissau
486	68	GW	es	Guinea-Bissau	la República de Guinea-Bissau
487	68	GW	fr	Guinée-Bissau	la République de Guinée-Bissau
488	68	GW	it	Guinea-Bissau	Repubblica di Guinea-Bissau
489	68	GW	zh	几内亚比绍	几内亚比绍共和国
490	68	GW	ru	Гвинея-Бисау	Республика Гвинея-Бисау
491	52	GQ	ar	الاستوائية غينيا 	الاستوائية غينيا جمهورية 
492	52	GQ	en	Equatorial Guinea	the Republic of Equatorial Guinea
493	52	GQ	es	Guinea Ecuatorial	la República de Guinea Ecuatorial
494	52	GQ	fr	Guinée équatoriale	la République de Guinée équatoriale
495	52	GQ	it	Guinea equatoriale	Repubblica di Guinea equatoriale
496	52	GQ	zh	赤道几内亚	赤道几内亚共和国
497	52	GQ	ru	Экваториальная Гвинея	Республика Экваториальная Гвинея
498	64	GR	ar	اليونان	الهيلانية الجمهورية 
499	64	GR	en	Greece	the Hellenic Republic
500	64	GR	es	Grecia	la República Helénica
501	64	GR	fr	Grèce	la République hellénique
502	64	GR	it	Grecia	Repubblica ellenica
503	64	GR	zh	希 腊	希腊共和国
504	64	GR	ru	Греция	Греческая Республика
505	65	GD	ar	غرينادا	غرينادا
506	65	GD	en	Grenada	Grenada
507	65	GD	es	Granada	Granada
508	65	GD	fr	Grenade	la Grenade
509	65	GD	it	Grenada	Grenada
510	65	GD	zh	格林纳达	格林纳达
511	65	GD	ru	Гренада	Гренада
512	66	GT	ar	غواتيمالا	جمهورية غواتيمالا 
513	66	GT	en	Guatemala	the Republic of Guatemala
514	66	GT	es	Guatemala	la República de Guatemala
515	66	GT	fr	Guatemala	la République du Guatemala
516	66	GT	it	Guatemala	Repubblica del Guatemala
517	66	GT	zh	危地马拉	危地马拉共和国
518	66	GT	ru	Гватемала	Республика Гватемала
519	69	GY	ar	غيانا	جمهورية غيانا 
520	69	GY	en	Guyana	the Republic of Guyana
521	69	GY	es	Guyana	la República de Guyana
522	69	GY	fr	Guyana	la République du Guyana
523	69	GY	it	Guyana	Repubblica della Guyana
524	69	GY	zh	圭亚那	圭亚那共和国
525	69	GY	ru	Гайана	Республика Гайана
526	71	HN	ar	هندوراس	هندوراس جمهورية 
527	71	HN	en	Honduras	the Republic of Honduras
528	71	HN	es	Honduras	la República de Honduras
529	71	HN	fr	Honduras	la République du Honduras
530	71	HN	it	Honduras	Repubblica di Honduras
531	71	HN	zh	洪都拉斯	洪都拉斯共和国
532	71	HN	ru	Гондурас	Республика Гондурас
533	40	HR	ar	كرواتيا	جمهورية كرواتيا 
534	40	HR	en	Croatia	the Republic of Croatia
535	40	HR	es	Croacia	la República de Croacia
536	40	HR	fr	Croatie	la République de Croatie
537	40	HR	it	Croazia	Repubblica di Croazia
538	40	HR	zh	克罗地亚	克罗地亚共和国
539	40	HR	ru	Хорватия	Республика Хорватия
540	70	HT	ar	هايتي	جمهورية هايتي 
541	70	HT	en	Haiti	the Republic of Haiti
542	70	HT	es	Haití	la República de Haití
543	70	HT	fr	Haïti	la République d'Haïti
544	70	HT	it	Haiti	Repubblica di Haiti
545	70	HT	zh	海 地	海地共和国
546	70	HT	ru	Гаити	Республика Гаити
547	72	HU	ar	هنغاريا	هنغاريا
548	72	HU	en	Hungary	Hungary
549	72	HU	es	Hungría	Hungría
550	72	HU	fr	Hongrie	la Hongrie
551	72	HU	it	Ungheria	Ungheria
552	72	HU	zh	匈牙利	匈牙利
553	72	HU	ru	Венгрия	Венгрия
554	75	ID	ar	إندونيسيا	جمهورية إندونيسيا 
555	75	ID	en	Indonesia	the Republic of Indonesia
556	75	ID	es	Indonesia	la República de Indonesia
557	75	ID	fr	Indonésie	la République d'Indonésie
558	75	ID	it	Indonesia	Indonesia
559	75	ID	zh	印度尼西亚	印度尼西亚共和国
560	75	ID	ru	Индонезия	Республика Индонезия
561	74	IN	ar	الهند	جمهورية الهند 
562	74	IN	en	India	the Republic of India
563	74	IN	es	India	la República de la India
564	74	IN	fr	Inde	la République de l'Inde
565	74	IN	it	India	Repubblica dell'India
566	74	IN	zh	印 度	印度共和国
567	74	IN	ru	Индия	Республика Индия
568	77	IE	ar	آيرلندا	آيرلندا
569	77	IE	en	Ireland	Ireland
570	77	IE	es	Irlanda	Irlanda
571	77	IE	fr	Irlande	l'Irlande
572	77	IE	it	Irlanda	Irlanda
573	77	IE	zh	爱尔兰	爱尔兰
574	77	IE	ru	Ирландия	Ирландия
575	187	IR	ar	الإسلامية - جمهورية - إيران 	الإسلامية إيران جمهورية 
576	187	IR	en	Iran	the Islamic Republic of Iran
577	187	IR	es	Irán	la República Islámica del Irán
578	187	IR	fr	Iran	la République islamique d'Iran
579	187	IR	it	Iran	Repubblica islamica dell'Iran
580	187	IR	zh	伊 朗(伊斯兰共和国)	伊朗伊斯兰共和国
581	187	IR	ru	Иран (Исламская Республика)	Исламская Республика Иран
582	76	IQ	ar	العراق	جمهورية العراق 
583	76	IQ	en	Iraq	the Republic of Iraq
584	76	IQ	es	Iraq	la República del Iraq
585	76	IQ	fr	Iraq	la République d'Iraq
586	76	IQ	it	Iraq	Repubblica dell'Iraq
587	76	IQ	zh	伊拉克	伊拉克共和国
588	76	IQ	ru	Ирак	Республика Ирак
589	73	IS	ar	آيسلندا	آيسلندا جمهورية 
590	73	IS	en	Iceland	the Republic of Iceland
591	73	IS	es	Islandia	la República de Islandia
592	73	IS	fr	Islande	la République d'Islande
593	73	IS	it	Islanda	Repubblica d'Islanda
594	73	IS	zh	冰 岛	冰岛共和国
595	73	IS	ru	Исландия	Республика Исландия
596	78	IL	ar	إسرائيل	إسرائيل دولة 
597	78	IL	en	Israel	the State of Israel
598	78	IL	es	Israel	el Estado de Israel
599	78	IL	fr	Israël	l'État d'Israël
600	78	IL	it	Israele	Stato d'Israele
601	78	IL	zh	以色列	以色列国
602	78	IL	ru	Израиль	Государство Израиль
603	79	IT	ar	إيطاليا	الإيطالية الجمهورية 
604	79	IT	en	Italy	the Republic of Italy
605	79	IT	es	Italia	la República Italiana
606	79	IT	fr	Italie	la République italienne
607	79	IT	it	Italia	Repubblica italiana
608	79	IT	zh	意大利	意大利共和国
609	79	IT	ru	Италия	Итальянская Республика
610	80	JM	ar	جامايكا	جامايكا
611	80	JM	en	Jamaica	Jamaica
612	80	JM	es	Jamaica	Jamaica
613	80	JM	fr	Jamaïque	la Jamaïque
614	80	JM	it	Giamaica	Giamaica
615	80	JM	zh	牙买加	牙买加
616	80	JM	ru	Ямайка	Ямайка
617	82	JO	ar	الأردن	الهاشمية الأردنية المملكة 
618	82	JO	en	Jordan	the Hashemite Kingdom of Jordan
619	82	JO	es	Jordania	el Reino Hachemita de Jordania
620	82	JO	fr	Jordanie	le Royaume hachémite de Jordanie
621	82	JO	it	Giordania	Regno hascemita di Giordania
622	82	JO	zh	约 旦	约旦哈希姆王国
623	82	JO	ru	Иордания	Иорданское Хашимитское Королевство
624	81	JP	ar	اليابان	اليابان
625	81	JP	en	Japan	Japan
626	81	JP	es	Japón	el Japón
627	81	JP	fr	Japon	le Japon
628	81	JP	it	Giappone	Giappone
629	81	JP	zh	日 本	日本国
630	81	JP	ru	Япония	Япония
631	83	KZ	ar	كازاخستان	جمهورية كازاخستان 
632	83	KZ	en	Kazakhstan	the Republic of Kazakhstan
633	83	KZ	es	Kazajstán	la República de Kazajstán
634	83	KZ	fr	Kazakhstan	la République du Kazakhstan
635	83	KZ	it	Kazakistan	Repubblica del Kazakhstan
636	83	KZ	zh	哈萨克斯坦	哈萨克斯坦共和国
637	83	KZ	ru	Казахстан	Республика Казахстан
638	84	KE	ar	كينيا	كينيا جمهورية 
639	84	KE	en	Kenya	the Republic of Kenya
640	84	KE	es	Kenya	la República de Kenya
641	84	KE	fr	Kenya	la République du Kenya
642	84	KE	it	Kenya	Repubblica del Kenya
643	84	KE	zh	肯尼亚	肯尼亚共和国
644	84	KE	ru	Кения	Республика Кения
645	87	KG	ar	قيرغيزستان	جمهورية القيرغيز 
646	87	KG	en	Kyrgyzstan	the Kyrgyz Republic
647	87	KG	es	Kirguistán	la República Kirguisa
648	87	KG	fr	Kirghizistan	la République kirghize
649	87	KG	it	Kirghizistan	Repubblica di Kirghizistan
650	87	KG	zh	吉尔吉斯斯坦	吉尔吉斯共和国
651	87	KG	ru	Кыргызстан	Кыргызская Республика
652	28	KH	ar	كمبوديا	مملكة كمبوديا 
653	28	KH	en	Cambodia	the Kingdom of Cambodia
654	28	KH	es	Camboya	el Reino de Camboya
655	28	KH	fr	Cambodge	le Royaume du Cambodge
656	28	KH	it	Cambogia	Regno di Cambogia
657	28	KH	zh	柬埔寨	柬埔寨王国
658	28	KH	ru	Камбоджа	Королевство Камбоджа
659	85	KI	ar	كيريباس	كيريباس  جمهورية 
660	85	KI	en	Kiribati	the Republic of Kiribati
661	85	KI	es	Kiribati	la República de Kiribati
662	85	KI	fr	Kiribati	la République de Kiribati
663	85	KI	it	Kiribati	Repubblica di Kiribati
664	85	KI	zh	基里巴斯	基里巴斯共和国
665	85	KI	ru	Кирибати	Республика Кирибати
666	136	KN	ar	ونيفيس كيتس سانت 	ونيفيس كيتس سانت 
667	136	KN	en	Saint Kitts and Nevis	Saint Kitts and Nevis
668	136	KN	es	Saint Kitts y Nevis	Saint Kitts y Nevis
669	136	KN	fr	Saint-Kitts-et-Nevis	Saint-Kitts-et-Nevis
670	136	KN	it	Saint Christopher e Nevis	Federazione di Saint Kitts e Nevis
671	136	KN	zh	圣基茨和尼维斯	圣基茨和尼维斯
672	136	KN	ru	Сент-Китс и Невис	Сент-Китс и Невис
673	189	KR	ar	جمهورية كوريا 	جمهورية كوريا 
674	189	KR	en	Republic of Korea	the Republic of Korea
675	189	KR	es	República de Corea	la República de Corea
676	189	KR	fr	République de Corée	la République de Corée
677	189	KR	it	Repubblica di Corea	Repubblica di Corea
678	189	KR	zh	大韩民国	大韩民国
679	189	KR	ru	Республика Корея	Республика Корея
680	86	KW	ar	الكويت	الكويت دولة 
681	86	KW	en	Kuwait	the State of Kuwait
682	86	KW	es	Kuwait	el Estado de Kuwait
683	86	KW	fr	Koweït	l'État du Koweït
684	86	KW	it	Kuwait	Stato del Kuwait
685	86	KW	zh	科威特	科威特国
686	86	KW	ru	Кувейт	Государство Кувейт
687	88	LA	ar	الشعبية الديمقراطية لاو جمهورية 	الشعبية الديمقراطية لاو جمهورية 
688	88	LA	en	Lao People's Democratic Republic	the Lao People's Democratic Republic
689	88	LA	es	República Democrática Popular Lao	la República Democrática Popular Lao
690	88	LA	fr	République démocratique populaire lao	la République démocratique populaire lao
691	88	LA	it	Repubblica democratica popolare del Laos	Repubblica democratica popolare del Laos
692	88	LA	zh	老挝人民民主共和国	老挝人民民主共和国
693	88	LA	ru	Лаосская Народно-Демократическая Республика	Лаосская Народно-Демократическая Республика
694	90	LB	ar	لبنان	اللبنانية الجمهورية 
695	90	LB	en	Lebanon	the Lebanese Republic
696	90	LB	es	Líbano	la República libanesa
697	90	LB	fr	Liban	la République libanaise
698	90	LB	it	Libano	Repubblica libanese
699	90	LB	zh	黎巴嫩	黎巴嫩共和国
700	90	LB	ru	Ливан	Ливанская Республика
701	92	LR	ar	ليبريا	جمهورية ليبريا 
702	92	LR	en	Liberia	the Republic of Liberia
703	92	LR	es	Liberia	la República de Liberia
704	92	LR	fr	Libéria	la République du Libéria
705	92	LR	it	Liberia	Repubblica di Liberia
706	92	LR	zh	利比里亚	利比里亚共和国
707	92	LR	ru	Либерия	Республика Либерия
708	93	LY	ar	ليبيا	ليبيا
709	93	LY	en	Libya	Libya
710	93	LY	es	Libia	Libia
711	93	LY	fr	Libye	la Libye
712	93	LY	it	Libia	Libia
713	93	LY	zh	利比亚	利比亚
714	93	LY	ru	Ливия	Ливия
715	137	LC	ar	لوسيا سانت 	لوسيا سانت 
716	137	LC	en	Saint Lucia	Saint Lucia
717	137	LC	es	Santa Lucía	Santa Lucía
718	137	LC	fr	Sainte-Lucie	Sainte-Lucie
719	137	LC	it	Santa Lucia  	Santa Lucia  
720	137	LC	zh	圣卢西亚	圣卢西亚
721	137	LC	ru	Сент-Люсия	Сент-Люсия
722	94	LI	ar	لختنشتاين	إمارة لختنشتاين 
723	94	LI	en	Liechtenstein	the Principality of Liechtenstein
724	94	LI	es	Liechtenstein	el Principado de Liechtenstein
725	94	LI	fr	Liechtenstein	la Principauté du Liechtenstein
726	94	LI	it	Liechtenstein	Principato del Liechtenstein
727	94	LI	zh	列支敦士登	列支敦士登公国
728	94	LI	ru	Лихтенштейн	Княжество Лихтенштейн
729	154	LK	ar	سري لانكا 	جمهورية سري لانكا الاشتراكية الديمقراطية 
730	154	LK	en	Sri Lanka	the Democratic Socialist Republic of Sri Lanka
731	154	LK	es	Sri Lanka	la República Socialista Democrática de Sri Lanka
732	154	LK	fr	Sri Lanka	la République socialiste démocratique de Sri Lanka
733	154	LK	it	Sri Lanka	Repubblica democratica socialista di Sri Lanka
734	154	LK	zh	斯里兰卡	斯里兰卡民主社会主义共和国
735	154	LK	ru	Шри-Ланка	Демократическая Социалистическая Республика Шри-Ланка
736	91	LS	ar	ليسوتو	ليسوتو مملكة 
737	91	LS	en	Lesotho	the Kingdom of Lesotho
738	91	LS	es	Lesotho	el Reino de Lesotho
739	91	LS	fr	Lesotho	le Royaume du Lesotho
740	91	LS	it	Lesotho	Regno di Lesotho
741	91	LS	zh	莱索托	莱索托王国
742	91	LS	ru	Лесото	Королевство Лесото
743	95	LT	ar	ليتوانيا	جمهورية ليتوانيا 
744	95	LT	en	Lithuania	the Republic of Lithuania
745	95	LT	es	Lituania	la República de Lituania
746	95	LT	fr	Lituanie	la République de Lituanie
747	95	LT	it	Lituania	Repubblica di Lituania
748	95	LT	zh	立陶宛	立陶宛共和国
749	95	LT	ru	Литва	Литовская Республика
750	96	LU	ar	لكسمبرغ	الكبرى لكسمبرغ دوقية 
751	96	LU	en	Luxembourg	the Grand Duchy of Luxembourg
752	96	LU	es	Luxemburgo	el Gran Ducado de Luxemburgo
753	96	LU	fr	Luxembourg	le Grand-Duché de Luxembourg
754	96	LU	it	Lussemburgo	Granducato di Lussemburgo
755	96	LU	zh	卢森堡	卢森堡大公国
756	96	LU	ru	Люксембург	Великое Герцогство Люксембург
757	89	LV	ar	لاتفيا	جمهورية لاتفيا 
758	89	LV	en	Latvia	the Republic of Latvia
759	89	LV	es	Letonia	la República de Letonia
760	89	LV	fr	Lettonie	la République de Lettonie
761	89	LV	it	Lettonia	Repubblica di Lettonia
762	89	LV	zh	拉脱维亚	拉脱维亚共和国
763	89	LV	ru	Латвия	Латвийская Республика
764	110	MA	ar	المغرب	المملكة المغربية 
765	110	MA	en	Morocco	the Kingdom of Morocco
766	110	MA	es	Marruecos	el Reino de Marruecos
767	110	MA	fr	Maroc	le Royaume du Maroc
768	110	MA	it	Marocco	Regno del Marocco
769	110	MA	zh	摩洛哥	摩洛哥王国
770	110	MA	ru	Марокко	Королевство Марокко
771	107	MC	ar	موناكو	إمارة موناكو 
772	107	MC	en	Monaco	the Principality of Monaco
773	107	MC	es	Mónaco	el Principado de Mónaco
774	107	MC	fr	Monaco	la Principauté de Monaco
775	107	MC	it	Monaco	Principato di Monaco
776	107	MC	zh	摩纳哥	摩纳哥公国
777	107	MC	ru	Монако	Княжество Монако
778	190	MD	ar	جمهورية مولدوفا 	جمهورية مولدوفا 
779	190	MD	en	Republic of Moldova	the Republic of Moldova
780	190	MD	es	República de Moldova	la República de Moldova
781	190	MD	fr	République de Moldova	la République de Moldova
782	190	MD	it	Repubblica di Moldova	Repubblica di Moldova
783	190	MD	zh	摩尔多瓦共和国	摩尔多瓦共和国
784	190	MD	ru	Республика Молдова	Республика Молдова
785	97	MG	ar	مدغشقر	جمهورية مدغشقر 
786	97	MG	en	Madagascar	the Republic of Madagascar
787	97	MG	es	Madagascar	la República de Madagascar
788	97	MG	fr	Madagascar	la République de Madagascar
789	97	MG	it	Madagascar	Repubblica del Madagascar
790	97	MG	zh	马达加斯加	马达加斯加共和国
791	97	MG	ru	Мадагаскар	Республика Мадагаскар
792	100	MV	ar	ملديف	جمهورية ملديف 
793	100	MV	en	Maldives	the Republic of Maldives
794	100	MV	es	Maldivas	la República de Maldivas
795	100	MV	fr	Maldives	la République des Maldives
796	100	MV	it	Maldive	Repubblica delle Maldive
797	100	MV	zh	马尔代夫	马尔代夫共和国
798	100	MV	ru	Мальдивы	Мальдивская Республика
799	106	MX	ar	المكسيك	المكسيكية المتحدة الولايات 
800	106	MX	en	Mexico	the United Mexican States
801	106	MX	es	México	los Estados Unidos Mexicanos
802	106	MX	fr	Mexique	les États-Unis du Mexique
803	106	MX	it	Messico	Stati Uniti messicani
804	106	MX	zh	墨西哥	墨西哥合众国
805	106	MX	ru	Мексика	Мексиканские Соединенные Штаты
806	103	MH	ar	جزر مارشال 	جمهورية جزر مارشال 
807	103	MH	en	Marshall Islands	the Republic of the Marshall Islands
808	103	MH	es	Islas Marshall	la República de las Islas Marshall
809	103	MH	fr	Îles Marshall	la République des Îles Marshall
810	103	MH	it	Isole Marshall	Repubblica delle Isole Marshall
811	103	MH	zh	马绍尔群岛	马绍尔群岛共和国
812	103	MH	ru	Маршалловы Острова	Республика Маршалловы Острова
813	191	MK	ar	جمهورية مقدونيا اليوغوسلافية السابقة 	جمهورية مقدونيا اليوغوسلافية السابقة 
814	191	MK	en	The former Yugoslav Republic of Macedonia	The former Yugoslav Republic of Macedonia
815	191	MK	es	ex República Yugoslava de Macedonia	la ex República Yugoslava de Macedonia
816	191	MK	fr	ex-République yougoslave de Macédoine	l'ex-République yougoslave de Macédoine
817	191	MK	it	ex Repubblica jugoslava di Macedonia	L'ex Repubblica jugoslava di Macedonia
818	191	MK	zh	前南斯拉夫的马其顿共和国	前南斯拉夫的马其顿共和国
819	191	MK	ru	бывшая югославская Республика Македония	бывшая югославская Республика Македония
820	101	ML	ar	مالي	مالي جمهورية 
821	101	ML	en	Mali	the Republic of Mali
822	101	ML	es	Malí	la República de Malí
823	101	ML	fr	Mali	la République du Mali
824	101	ML	it	Mali	Repubblica del Mali
825	101	ML	zh	马 里	马里共和国
826	101	ML	ru	Мали	Республика Мали
827	102	MT	ar	مالطة	جمهورية مالطة 
828	102	MT	en	Malta	the Republic of Malta
829	102	MT	es	Malta	la República de Malta
830	102	MT	fr	Malte	la République de Malte
831	102	MT	it	Malta	Repubblica di Malta
832	102	MT	zh	马耳他	马耳他共和国
833	102	MT	ru	Мальта	Республика Мальта
834	112	MM	ar	ميانمار	ميانمار اتحاد جمهورية 
835	112	MM	en	Myanmar	the Republic of the Union of Myanmar
836	112	MM	es	Myanmar	la República de la Unión de Myanmar
837	112	MM	fr	Myanmar	République de l'Union du Myanmar
838	112	MM	it	Myanmar	Repubblica dell'Unione di Myanmar
839	112	MM	zh	缅 甸	缅甸联邦共和国
840	112	MM	ru	Мьянма	Республика Союз Мьянма
841	109	ME	ar	الأسود الجبل 	الأسود الجبل 
842	109	ME	en	Montenegro	Montenegro
843	109	ME	es	Montenegro	Montenegro
844	109	ME	fr	Monténégro	le Monténégro
845	109	ME	it	Montenegro	Montenegro
846	109	ME	zh	黑山	黑山
847	109	ME	ru	Черногория	Черногория
848	108	MN	ar	منغوليا	منغوليا
849	108	MN	en	Mongolia	Mongolia
850	108	MN	es	Mongolia	Mongolia
851	108	MN	fr	Mongolie	la Mongolie
852	108	MN	it	Mongolia	Mongolia
853	108	MN	zh	蒙 古	蒙古国
854	108	MN	ru	Монголия	Монголия
855	111	MZ	ar	موزامبيق	جمهورية موزامبيق 
856	111	MZ	en	Mozambique	the Republic of Mozambique
857	111	MZ	es	Mozambique	la República de Mozambique
858	111	MZ	fr	Mozambique	la République du Mozambique
859	111	MZ	it	Mozambico	Repubblica del Mozambico
860	111	MZ	zh	莫桑比克	莫桑比克共和国
861	111	MZ	ru	Мозамбик	Республика Мозамбик
862	104	MR	ar	موريتانيا	الجمهورية الإسلامية الموريتانية 
863	104	MR	en	Mauritania	the Islamic Republic of Mauritania
864	104	MR	es	Mauritania	la República Islámica de Mauritania
865	104	MR	fr	Mauritanie	la République islamique de Mauritanie
866	104	MR	it	Mauritania	Repubblica islamica di Mauritania
867	104	MR	zh	毛里塔尼亚	毛里塔尼亚伊斯兰共和国
868	104	MR	ru	Мавритания	Исламская Республика Мавритания
869	105	MU	ar	موريشيوس	موريشيوس جمهورية 
870	105	MU	en	Mauritius	the Republic of Mauritius
871	105	MU	es	Mauricio	la República de Mauricio
872	105	MU	fr	Maurice	la République de Maurice
873	105	MU	it	Maurizio	Repubblica di Maurizio
874	105	MU	zh	毛里求斯	毛里求斯共和国
875	105	MU	ru	Маврикий	Республика Маврикий
876	98	MW	ar	ملاوي	جمهورية ملاوي 
877	98	MW	en	Malawi	the Republic of Malawi
878	98	MW	es	Malawi	la República de Malawi
879	98	MW	fr	Malawi	la République du Malawi
880	98	MW	it	Malawi	Repubblica del Malawi
881	98	MW	zh	马拉维	马拉维共和国
882	98	MW	ru	Малави	Республика Малави
883	99	MY	ar	ماليزيا	ماليزيا
884	99	MY	en	Malaysia	Malaysia
885	99	MY	es	Malasia	Malasia
886	99	MY	fr	Malaisie	la Malaisie
887	99	MY	it	Malaysia	Malaysia
888	99	MY	zh	马来西亚	马来西亚
889	99	MY	ru	Малайзия	Малайзия
890	113	NA	ar	ناميبيا	جمهورية ناميبيا 
891	113	NA	en	Namibia	the Republic of Namibia
892	113	NA	es	Namibia	la República de Namibia
893	113	NA	fr	Namibie	la République de Namibie
894	113	NA	it	Namibia	Repubblica di Namibia
895	113	NA	zh	纳米比亚	纳米比亚共和国
896	113	NA	ru	Намибия	Республика Намибия
897	119	NE	ar	النيجر	جمهورية النيجر 
898	119	NE	en	Niger	the Republic of the Niger
899	119	NE	es	Níger	la República del Níger
900	119	NE	fr	Niger	la République du Niger
901	119	NE	it	Niger	Repubblica del Niger
902	119	NE	zh	尼日尔	尼日尔共和国
903	119	NE	ru	Нигер	Республика Нигер
904	120	NG	ar	نيجيريا	الاتحادية نيجيريا جمهورية 
905	120	NG	en	Nigeria	the Federal Republic of Nigeria
906	120	NG	es	Nigeria	la República Federal de Nigeria
907	120	NG	fr	Nigéria	la République fédérale du Nigéria
908	120	NG	it	Nigeria	Repubblica federale della Nigeria
909	120	NG	zh	尼日利亚	尼日利亚联邦共和国
910	120	NG	ru	Нигерия	Федеративная Республика Нигерия
911	118	NI	ar	نيكاراغوا	جمهورية  نيكاراغوا 
912	118	NI	en	Nicaragua	the Republic of Nicaragua
913	118	NI	es	Nicaragua	la República de Nicaragua
914	118	NI	fr	Nicaragua	la République du Nicaragua
915	118	NI	it	Nicaragua	Repubblica di Nicaragua
916	118	NI	zh	尼加拉瓜	尼加拉瓜共和国
917	118	NI	ru	Никарагуа	Республика Никарагуа
918	192	NU	ar	نيوى	نيوى
919	192	NU	en	Niue	Niue
920	192	NU	es	Niue	Niue
921	192	NU	fr	Nioué	Nioué
922	192	NU	it	Niue	Niue
923	192	NU	zh	纽 埃	纽埃共和国
924	192	NU	ru	Ниуэ	Ниуэ
925	116	NL	ar	هولندا	هولندا مملكة 
926	116	NL	en	Netherlands	the Kingdom of the Netherlands
927	116	NL	es	Países Bajos	el Reino de los Países Bajos
928	116	NL	fr	Pays-Bas	le Royaume des Pays-Bas
929	116	NL	it	Paesi Bassi	Regno dei Paesi Bassi
930	116	NL	zh	荷 兰	荷兰王国
931	116	NL	ru	Нидерланды	Королевство Нидерландов
932	121	NO	ar	النرويج	النرويج مملكة 
933	121	NO	en	Norway	the Kingdom of Norway
934	121	NO	es	Noruega	el Reino de Noruega
935	121	NO	fr	Norvège	le Royaume de Norvège
936	121	NO	it	Norvegia	Regno di Norvegia
937	121	NO	zh	挪 威	挪威王国
938	121	NO	ru	Норвегия	Королевство Норвегия
939	115	NP	ar	نيبال	الاتحادية الديمقراطية نيبال جمهورية 
940	115	NP	en	Nepal	the Federal Democratic Republic of Nepal
941	115	NP	es	Nepal	la República Democrática Federal de Nepal
942	115	NP	fr	Népal	la République fédérale démocratique du Nepal
943	115	NP	it	Nepal	Repubblica Democratica Federale di Nepal
944	115	NP	zh	尼泊尔	尼泊尔联邦民主共和国
945	115	NP	ru	Непал	Федеративная Демократическая Республика Непал
946	114	NR	ar	ناورو	ناورو جمهورية 
947	114	NR	en	Nauru	the Republic of Nauru
948	114	NR	es	Nauru	la República de Nauru
949	114	NR	fr	Nauru	la République de Nauru
950	114	NR	it	Nauru	Repubblica di Nauru
951	114	NR	zh	瑙 鲁	瑙鲁共和国
952	114	NR	ru	Науру	Республика Науру
953	117	NZ	ar	نيوزيلندا	نيوزيلندا
954	117	NZ	en	New Zealand	New Zealand
955	117	NZ	es	Nueva Zelandia	Nueva Zelandia
956	117	NZ	fr	Nouvelle-Zélande	la Nouvelle-Zélande
957	117	NZ	it	Nuova Zelanda	Nuova Zelanda
958	117	NZ	zh	新西兰	新西兰
959	117	NZ	ru	Новая Зеландия	Новая Зеландия
960	122	OM	ar	عمان	سلطنة عمان 
961	122	OM	en	Oman	the Sultanate of Oman
962	122	OM	es	Omán	la Sultanía de Omán
963	122	OM	fr	Oman	le Sultanat d'Oman
964	122	OM	it	Oman	Sultanato dell'Oman
965	122	OM	zh	阿 曼	阿曼苏丹国
966	122	OM	ru	Оман	Султанат Оман
967	123	PK	ar	باكستان	الإسلامية باكستان جمهورية 
968	123	PK	en	Pakistan	the Islamic Republic of Pakistan
969	123	PK	es	Pakistán	la República Islámica del Pakistán
970	123	PK	fr	Pakistan	la République islamique du Pakistan
971	123	PK	it	Pakistan	Repubblica islamica del Pakistan
972	123	PK	zh	巴基斯坦	巴基斯坦伊斯兰共和国
973	123	PK	ru	Пакистан	Исламская Республика Пакистан
974	125	PA	ar	بنما	بنما جمهورية 
975	125	PA	en	Panama	the Republic of Panama
976	125	PA	es	Panamá	la República de Panamá
977	125	PA	fr	Panama	la République du Panama
978	125	PA	it	Panama	Repubblica di Panama
979	125	PA	zh	巴拿马	巴拿马共和国
980	125	PA	ru	Панама	Республика Панама
981	128	PE	ar	بيرو	بيرو جمهورية 
982	128	PE	en	Peru	the Republic of Peru
983	128	PE	es	Perú	la República del Perú
984	128	PE	fr	Pérou	la République du Pérou
985	128	PE	it	Perù	Repubblica del Perù
986	128	PE	zh	秘 鲁	秘鲁共和国
987	128	PE	ru	Перу	Республика Перу
988	129	PH	ar	الفلبين	الفلبين جمهورية 
989	129	PH	en	Philippines	the Republic of the Philippines
990	129	PH	es	Filipinas	la República de Filipinas
991	129	PH	fr	Philippines	la République des Philippines
992	129	PH	it	Filippine	Repubblica delle Filippine
993	129	PH	zh	菲律宾	菲律宾共和国
994	129	PH	ru	Филиппины	Республика Филиппины
995	124	PW	ar	بالاو	جمهورية بالاو 
996	124	PW	en	Palau	the Republic of Palau
997	124	PW	es	Palau	la República de Palau
998	124	PW	fr	Palaos	la République des Palaos
999	124	PW	it	Palau	Repubblica di Palau
1000	124	PW	zh	帕劳	帕劳共和国
1001	124	PW	ru	Палау	Республика Палау
1002	126	PG	ar	الجديدة غينيا بابوا 	المستقلة الجديدة غينيا بابوا دولة 
1003	126	PG	en	Papua New Guinea	Independent State of Papua New Guinea
1004	126	PG	es	Papua Nueva Guinea	Estado Independiente de Papua Nueva Guinea
1005	126	PG	fr	Papouasie-Nouvelle-Guinée	État indépendant de Papouasie-Nouvelle-Guinée
1006	126	PG	it	Papua Nuova Guinea	Stato indipendente di Papua Nuova Guinea
1007	126	PG	zh	巴布亚新几内亚	巴布亚新几内亚独立国
1008	126	PG	ru	Папуа-Новая Гвинея	Независимое государство Папуа-Новая Гвинея
1009	130	PL	ar	بولندا	جمهورية بولندا 
1010	130	PL	en	Poland	the Republic of Poland
1011	130	PL	es	Polonia	la República de Polonia
1012	130	PL	fr	Pologne	la République de Pologne
1013	130	PL	it	Polonia	Repubblica di Polonia
1014	130	PL	zh	波 兰	波兰共和国
1015	130	PL	ru	Польша	Республика Польша
1016	188	KP	ar	الديمقراطية الشعبية كوريا جمهورية 	الديمقراطية الشعبية كوريا جمهورية 
1017	188	KP	en	Democratic People's Republic of Korea	the Democratic People's Republic of Korea
1018	188	KP	es	República Popular Democrática de Corea	la República Popular Democrática de Corea
1019	188	KP	fr	République populaire démocratique de Corée	la République populaire démocratique de Corée
1020	188	KP	it	Repubblica popolare democratica di Corea	Repubblica popolare democratica di Corea
1021	188	KP	zh	朝鲜民主主义人民共和国	朝鲜民主主义人民共和国
1022	188	KP	ru	Корейская Народно-Демократическая Республика	Корейская Народно-Демократическая Республика
1023	131	PT	ar	البرتغال	البرتغال جمهورية 
1024	131	PT	en	Portugal	the Portuguese Republic
1025	131	PT	es	Portugal	la República Portuguesa
1026	131	PT	fr	Portugal	la République portugaise
1027	131	PT	it	Portogallo	Repubblica portoghese
1028	131	PT	zh	葡萄牙	葡萄牙共和国
1029	131	PT	ru	Португалия	Португальская Республика
1030	127	PY	ar	باراغواي	باراغواي جمهورية 
1031	127	PY	en	Paraguay	the Republic of Paraguay
1032	127	PY	es	Paraguay	la República del Paraguay
1033	127	PY	fr	Paraguay	la République du Paraguay
1034	127	PY	it	Paraguay	Repubblica del Paraguay
1035	127	PY	zh	巴拉圭	巴拉圭共和国
1036	127	PY	ru	Парагвай	Республика Парагвай
1037	132	QA	ar	قطر	قطر دولة 
1038	132	QA	en	Qatar	the State of Qatar
1039	132	QA	es	Qatar	el Estado de Qatar
1040	132	QA	fr	Qatar	l'État du Qatar
1041	132	QA	it	Qatar	Stato del Qatar
1042	132	QA	zh	卡塔尔	卡塔尔国
1043	132	QA	ru	Катар	Государство Катар
1044	133	RO	ar	رومانيا	رومانيا
1045	133	RO	en	Romania	Romania
1046	133	RO	es	Rumania	Rumania
1047	133	RO	fr	Roumanie	la Roumanie
1048	133	RO	it	Romania	Romania
1049	133	RO	zh	罗马尼亚	罗马尼亚
1050	133	RO	ru	Румыния	Румыния
1051	134	RU	ar	الاتحاد الروسي 	الاتحاد الروسي 
1052	134	RU	en	Russian Federation	the Russian Federation
1053	134	RU	es	Federación de Rusia	la Federación de Rusia
1054	134	RU	fr	Fédération de Russie	la Fédération de Russie
1055	134	RU	it	Russia	Federazione russa
1056	134	RU	zh	俄罗斯联邦	俄罗斯联邦
1057	134	RU	ru	Российская Федерация	Российская Федерация
1058	135	RW	ar	رواندا	رواندا  جمهورية 
1059	135	RW	en	Rwanda	the Republic of Rwanda
1060	135	RW	es	Rwanda	la República de Rwanda
1061	135	RW	fr	Rwanda	la République du Rwanda
1062	135	RW	it	Ruanda	Repubblica del Ruanda
1063	135	RW	zh	卢旺达	卢旺达共和国
1064	135	RW	ru	Руанда	Республика Руанда
1065	142	SA	ar	السعودية العربية المملكة 	السعودية العربية المملكة 
1066	142	SA	en	Saudi Arabia	the Kingdom of Saudi Arabia
1067	142	SA	es	Arabia Saudita	el Reino de la Arabia Saudita
1068	142	SA	fr	Arabie saoudite	le Royaume d'Arabie saoudite
1069	142	SA	it	Arabia Saudita	Regno dell'Arabia Saudita
1070	142	SA	zh	沙特阿拉伯	沙特阿拉伯王国
1071	142	SA	ru	Саудовская Аравия	Королевство Саудовская Аравия
1072	155	SD	ar	السودان	السودان جمهورية 
1073	155	SD	en	Sudan	the Republic of the Sudan
1074	155	SD	es	Sudán	la República del Sudán
1075	155	SD	fr	Soudan	la République du Soudan
1076	155	SD	it	Sudan	Repubblica del Sudan
1077	155	SD	zh	苏 丹	苏丹共和国
1078	155	SD	ru	Судан	Республика Судан
1079	143	SN	ar	السنغال	السنغال جمهورية 
1080	143	SN	en	Senegal	the Republic of Senegal
1081	143	SN	es	Senegal	la República del Senegal
1082	143	SN	fr	Sénégal	la République du Sénégal
1083	143	SN	it	Senegal	Repubblica del Senegal
1084	143	SN	zh	塞内加尔	塞内加尔共和国
1085	143	SN	ru	Сенегал	Республика Сенегал
1086	147	SG	ar	سنغافورة	جمهورية سنغافورة 
1087	147	SG	en	Singapore	the Republic of Singapore
1088	147	SG	es	Singapur	la República de Singapur
1089	147	SG	fr	Singapour	la République de Singapour
1090	147	SG	it	Singapore	Repubblica di Singapore
1091	147	SG	zh	新加坡	新加坡共和国
1092	147	SG	ru	Сингапур	Республика Сингапур
1093	150	SB	ar	جزر سليمان 	جزر سليمان 
1094	150	SB	en	Solomon Islands	Solomon Islands
1095	150	SB	es	Islas Salomón	las Islas Salomón
1096	150	SB	fr	Îles Salomon	les Îles Salomon
1097	150	SB	it	Isole Salomone	Isole Salomone
1098	150	SB	zh	所罗门群岛	所罗门群岛
1099	150	SB	ru	Соломоновы Острова	Соломоновы Острова
1100	146	SL	ar	سيراليون	جمهورية سيراليون 
1101	146	SL	en	Sierra Leone	the Republic of Sierra Leone
1102	146	SL	es	Sierra Leona	la República de Sierra Leona
1103	146	SL	fr	Sierra Leone	la République de Sierra Leone
1104	146	SL	it	Sierra Leone	Repubblica di Sierra Leone
1105	146	SL	zh	塞拉利昂	塞拉利昂共和国
1106	146	SL	ru	Сьерра-Леоне	Республика Сьерра-Леоне
1107	51	SV	ar	السلفادور	السلفادور جمهورية 
1108	51	SV	en	El Salvador	the Republic of El Salvador
1109	51	SV	es	El Salvador	la República de El Salvador
1110	51	SV	fr	El Salvador	la République d'El Salvador
1111	51	SV	it	El Salvador	Repubblica di El Salvador
1112	51	SV	zh	萨尔瓦多	萨尔瓦多共和国
1113	51	SV	ru	Сальвадор	Республика Эль-Сальвадор
1114	140	SM	ar	مارينو سان 	مارينو سان جمهورية 
1115	140	SM	en	San Marino	the Republic of San Marino
1116	140	SM	es	San Marino	la República de San Marino
1117	140	SM	fr	Saint-Marin	la République de Saint-Marin
1118	140	SM	it	San Marino	Repubblica di San Marino
1119	140	SM	zh	圣马力诺	圣马力诺共和国
1120	140	SM	ru	Сан-Марино	Республика Сан-Марино
1121	151	SO	ar	الصومال	جمهورية الصومال الإتحادية 
1122	151	SO	en	Somalia	the Federal Republic of Somalia
1123	151	SO	es	Somalia	la República Federal de Somalia
1124	151	SO	fr	Somalie	la République fédérale de Somalie
1125	151	SO	it	Somalia	Repubblica Federale di Somalia
1126	151	SO	zh	索马里	索马里联邦共和国
1127	151	SO	ru	Сомали	Федеративная Республика Сомали
1128	144	RS	ar	صربيا	جمهورية صربيا 
1129	144	RS	en	Serbia	the Republic of Serbia
1130	144	RS	es	Serbia	la República de Serbia
1131	144	RS	fr	Serbie	la République de Serbie
1132	144	RS	it	Serbia	la Repubblica di Serbia
1133	144	RS	zh	塞尔维亚	塞尔维亚共和国
1134	144	RS	ru	Сербия	Республика Сербия
1135	250	SS	ar	السودان جنوب 	السودان جنوب جمهورية 
1136	250	SS	en	South Sudan	the Republic of South Sudan
1137	250	SS	es	Sudán del Sur	la República de Sudán del Sur
1138	250	SS	fr	Soudan du Sud	République du Soudan du Sud
1139	250	SS	it	Sud Sudan	Repubblica del Sud Sudan
1140	250	SS	zh	南苏丹	南苏丹共和国
1141	250	SS	ru	Южный Судан	Республика Южный Судан
1142	141	ST	ar	وبرنسيبي تومي سان 	الديمقراطية وبرنسيبي تومي سان جمهورية 
1143	141	ST	en	Sao Tome and Principe	the Democratic Republic of Sao Tome and Principe
1144	141	ST	es	Santo Tomé y Príncipe	la República Democrática de Santo Tomé y Príncipe
1145	141	ST	fr	Sao Tomé-et-Principe	la République démocratique de Sao Tomé-et-Principe
1146	141	ST	it	São Tomé e Príncipe	Repubblica democratica di São Tomé e Príncipe
1147	141	ST	zh	圣多美和普林西比	圣多美和普林西比民主共和国
1148	141	ST	ru	Сан-Томе и Принсипи	Демократическая Республика Сан-Томе и Принсипи
1149	156	SR	ar	سورينام	جمهورية سورينام 
1150	156	SR	en	Suriname	the Republic of Suriname
1151	156	SR	es	Suriname	la República de Suriname
1152	156	SR	fr	Suriname	la République du Suriname
1153	156	SR	it	Suriname	Repubblica di Suriname
1154	156	SR	zh	苏里南	苏里南共和国
1155	156	SR	ru	Суринам	Республика Суринам
1156	148	SK	ar	سلوفاكيا	السلوفاكية الجمهورية 
1157	148	SK	en	Slovakia	the Slovak Republic
1158	148	SK	es	Eslovaquia	la República Eslovaca
1159	148	SK	fr	Slovaquie	la République slovaque
1160	148	SK	it	Slovacchia	Repubblica slovacca
1161	148	SK	zh	斯洛伐克	斯洛伐克共和国
1162	148	SK	ru	Словакия	Словацкая Республика
1163	149	SI	ar	سلوفينيا	جمهورية سلوفينيا 
1164	149	SI	en	Slovenia	the Republic of Slovenia
1165	149	SI	es	Eslovenia	la República de Eslovenia
1166	149	SI	fr	Slovénie	la République de Slovénie
1167	149	SI	it	Slovenia	Repubblica di Slovenia
1168	149	SI	zh	斯洛文尼亚	斯洛文尼亚共和国
1169	149	SI	ru	Словения	Республика Словения
1170	158	SE	ar	السويد	مملكة السويد 
1171	158	SE	en	Sweden	the Kingdom of Sweden
1172	158	SE	es	Suecia	el Reino de Suecia
1173	158	SE	fr	Suède	le Royaume de Suède
1174	158	SE	it	Svezia	Regno di Svezia
1175	158	SE	zh	瑞 典	瑞典王国
1176	158	SE	ru	Швеция	Королевство Швеция
1177	157	SZ	ar	إسواتيني	مملكة إسواتيني
1178	157	SZ	en	Eswatini	the Kingdom of Eswatini
1179	157	SZ	es	Eswatini	el Reino de Eswatini
1180	157	SZ	fr	Eswatini (l')	le Royaume d’Eswatini
1181	157	SZ	it	Eswatini	il Regno di Eswatini
1182	157	SZ	zh	斯威士兰	斯威士兰王国
1183	157	SZ	ru	Эсватини	Королевство Эсватини
1184	145	SC	ar	سيشيل	جمهورية سيشيل 
1185	145	SC	en	Seychelles	the Republic of Seychelles
1186	145	SC	es	Seychelles	la República de Seychelles
1187	145	SC	fr	Seychelles	la République des Seychelles
1188	145	SC	it	Seychelles	Repubblica delle Seychelles  
1189	145	SC	zh	塞舌尔	塞舌尔共和国
1190	145	SC	ru	Сейшельские Острова	Республика Сейшельские Острова
1191	160	SY	ar	الجمهورية العربية السورية 	الجمهورية العربية السورية 
1192	160	SY	en	Syrian Arab Republic	the Syrian Arab Republic
1193	160	SY	es	República Árabe Siria	la República Árabe Siria
1194	160	SY	fr	République arabe syrienne	la République arabe syrienne
1195	160	SY	it	Siria	Repubblica araba siriana
1196	160	SY	zh	阿拉伯叙利亚共和国	阿拉伯叙利亚共和国
1197	160	SY	ru	Сирийская Арабская Республика	Сирийская Арабская Республика
1198	33	TD	ar	تشاد	تشاد جمهورية 
1199	33	TD	en	Chad	the Republic of Chad
1200	33	TD	es	Chad	la República del Chad
1201	33	TD	fr	Tchad	la République du Tchad
1202	33	TD	it	Ciad	Repubblica del Ciad
1203	33	TD	zh	乍 得	乍得共和国
1204	33	TD	ru	Чад	Республика Чад
1205	164	TG	ar	توغو	توغو جمهورية 
1206	164	TG	en	Togo	the Togolese Republic
1207	164	TG	es	Togo	la República Togolesa
1208	164	TG	fr	Togo	la République togolaise
1209	164	TG	it	Togo	Repubblica del Togo
1210	164	TG	zh	多 哥	多哥共和国
1211	164	TG	ru	Того	Тоголезская Республика
1212	162	TH	ar	تايلند	تايلند مملكة 
1213	162	TH	en	Thailand	the Kingdom of Thailand
1214	162	TH	es	Tailandia	el Reino de Tailandia
1215	162	TH	fr	Thaïlande	le Royaume de Thaïlande
1216	162	TH	it	Thailandia	Regno di Thailandia
1217	162	TH	zh	泰 国	泰王国
1218	162	TH	ru	Таиланд	Королевство Таиланд
1219	161	TJ	ar	طاجيكستان	جمهورية طاجيكستان 
1220	161	TJ	en	Tajikistan	the Republic of Tajikistan
1221	161	TJ	es	Tayikistán	la República de Tayikistán
1222	161	TJ	fr	Tadjikistan	la République du Tadjikistan
1223	161	TJ	it	Tagikistan	Repubblica del Tagikistan
1224	161	TJ	zh	塔吉克斯坦	塔吉克斯坦共和国
1225	161	TJ	ru	Таджикистан	Республика Таджикистан
1226	241	TK	ar	منتسب عضو - توكيلاو 	توكيلاو
1227	241	TK	en	Tokelau (Associate Member)	Tokelau
1228	241	TK	es	Tokelau (Miembro Asociado)	Tokelau
1229	241	TK	fr	Tokélaou (Membre associé)	les Tokélaou
1230	241	TK	it	Tokelau (Membro associato)	Tokelau
1231	241	TK	zh	托克劳（准成员）	托克劳
1232	241	TK	ru	Токелау (ассоциированный член)	Токелау
1233	169	TM	ar	تركمانستان	تركمانستان
1234	169	TM	en	Turkmenistan	Turkmenistan
1235	169	TM	es	Turkmenistán	Turkmenistán
1236	169	TM	fr	Turkménistan	le Turkménistan
1237	169	TM	it	Turkmenistan	Repubblica di Turkmenistan
1238	169	TM	zh	土库曼斯坦	土库曼斯坦
1239	169	TM	ru	Туркменистан	Туркменистан
1240	163	TL	ar	ليشتى تيمور- 	الديمقراطية ليشتى تيمور- جمهورية 
1241	163	TL	en	Timor-Leste	the Democratic Republic of Timor-Leste
1242	163	TL	es	Timor-Leste	la República Democrática de Timor-Leste
1243	163	TL	fr	Timor-Leste	la République démocratique du Timor-Leste
1244	163	TL	it	Timor-Leste	Repubblica democratica di Timor-Leste
1245	163	TL	zh	东帝汶	东帝汶民主共和国
1246	163	TL	ru	Тимор-Лешти	Демократическая Республика Тимор-Лешти
1247	165	TO	ar	تونغا	تونغا مملكة 
1248	165	TO	en	Tonga	the Kingdom of Tonga
1249	165	TO	es	Tonga	el Reino de Tonga
1250	165	TO	fr	Tonga	le Royaume des Tonga
1251	165	TO	it	Tonga	Regno di Tonga
1252	165	TO	zh	汤 加	汤加王国
1253	165	TO	ru	Тонга	Королевство Тонга
1254	166	TT	ar	وتوباغو ترينيداد 	وتوباغو ترينيداد جمهورية 
1255	166	TT	en	Trinidad and Tobago	the Republic of Trinidad and Tobago
1256	166	TT	es	Trinidad y Tabago	la República de Trinidad y Tabago
1257	166	TT	fr	Trinité-et-Tobago	la République de Trinité-et-Tobago
1258	166	TT	it	Trinidad e Tobago	Repubblica di Trinidad e Tobago
1259	166	TT	zh	特立尼达和多巴哥	特立尼达和多巴哥共和国
1260	166	TT	ru	Тринидад и Тобаго	Республика Тринидад и Тобаго
1261	167	TN	ar	تونس	الجمهورية التونسية 
1262	167	TN	en	Tunisia	the Republic of Tunisia
1263	167	TN	es	Túnez	la República de Túnez
1264	167	TN	fr	Tunisie	la République tunisienne
1265	167	TN	it	Tunisia	Repubblica tunisina
1266	167	TN	zh	突尼斯	突尼斯共和国
1267	167	TN	ru	Тунис	Тунисская Республика
1268	168	TR	ar	تركيا	الجمهورية التركية 
1270	168	TR	es	Turquía	la República de Turquía
1271	168	TR	fr	Turquie	la République turque
1272	168	TR	it	Turchia	Repubblica di Turchia
1273	168	TR	zh	土耳其	土耳其共和国
1274	168	TR	ru	Турция	Турецкая Республика
1275	170	TV	ar	توفالو	توفالو
1276	170	TV	en	Tuvalu	Tuvalu
1277	170	TV	es	Tuvalu	Tuvalu
1278	170	TV	fr	Tuvalu	les Tuvalu
1279	170	TV	it	Tuvalu	Tuvalu
1280	170	TV	zh	图瓦卢	图瓦卢
1281	170	TV	ru	Тувалу	Тувалу
1282	193	TZ	ar	جمهورية تنزانيا المتحدة 	جمهورية تنزانيا المتحدة 
1283	193	TZ	en	United Republic of Tanzania	the United Republic of Tanzania
1284	193	TZ	es	República Unida de Tanzanía	la República Unida de Tanzanía
1285	193	TZ	fr	République-Unie de Tanzanie	la République-Unie de Tanzanie
1286	193	TZ	it	Repubblica unita di Tanzania	Repubblica unita di Tanzania
1287	193	TZ	zh	坦桑尼亚联合共和国	坦桑尼亚联合共和国
1288	193	TZ	ru	Объединенная Республика Танзания	Объединенная Республика Танзания
1289	171	UG	ar	أوغندا	جمهورية أوغندا 
1290	171	UG	en	Uganda	the Republic of Uganda
1291	171	UG	es	Uganda	la República de Uganda
1292	171	UG	fr	Ouganda	la République de l'Ouganda
1293	171	UG	it	Uganda	Repubblica dell'Uganda
1294	171	UG	zh	乌干达	乌干达共和国
1295	171	UG	ru	Уганда	Республика Уганда
1296	172	UA	ar	أوكرانيا	أوكرانيا
1297	172	UA	en	Ukraine	Ukraine
1298	172	UA	es	Ucrania	Ucrania
1299	172	UA	fr	Ukraine	l'Ukraine
1300	172	UA	it	Ucraina	Ucraina
1301	172	UA	zh	乌克兰	乌克兰
1302	172	UA	ru	Украина	Украина
1303	174	UY	ar	أوروغواي	الشرقية أوروغواي جمهورية 
1304	174	UY	en	Uruguay	the Eastern Republic of Uruguay
1305	174	UY	es	Uruguay	la República Oriental del Uruguay
1306	174	UY	fr	Uruguay	la République orientale de l'Uruguay
1307	174	UY	it	Uruguay	Repubblica orientale dell'Uruguay
1308	174	UY	zh	乌拉圭	乌拉圭东岸共和国
1309	174	UY	ru	Уругвай	Восточная Республика Уругвай
1310	244	US	ar	الأمريكية المتحدة الولايات 	الأمريكية المتحدة الولايات 
1311	244	US	en	United States of America	the United States of America
1312	244	US	es	Estados Unidos de América	los Estados Unidos de América
1313	244	US	fr	États-Unis d'Amérique	les États-Unis d'Amérique
1314	244	US	it	Stati Uniti d`America	Stati Uniti d'America
1315	244	US	zh	美 国	美利坚合众国
1269	168	TR	en	Turkey	the Republic of Türkiye
1316	244	US	ru	Соединенные Штаты Америки	Соединенные Штаты Америки
1317	175	UZ	ar	أوزبكستان	جمهورية أوزبكستان 
1318	175	UZ	en	Uzbekistan	the Republic of Uzbekistan
1319	175	UZ	es	Uzbekistán	la República de Uzbekistán
1320	175	UZ	fr	Ouzbékistan	la République d'Ouzbékistan
1321	175	UZ	it	Uzbekistan	Repubblica dell'Uzbekistan
1322	175	UZ	zh	乌兹别克斯坦	乌兹别克斯坦共和国
1323	175	UZ	ru	Узбекистан	Республика Узбекистан
1324	245	VA	ar	الكرسي الرسولي 	الكرسي الرسولي 
1325	245	VA	en	Holy See	Holy see
1326	245	VA	es	Santa Sede	la Santa Sede
1327	245	VA	fr	Saint-Siège	le Saint-Siège
1328	245	VA	it	Santa Sede	Santa Sede
1329	245	VA	zh	教廷	教廷
1330	245	VA	ru	Святой Престол	Святой Престол
1331	138	VC	ar	سانت فنسنت وجزر غرينادين 	سانت فنسنت وجزر غرينادين 
1332	138	VC	en	Saint Vincent and the Grenadines	Saint Vincent and the Grenadines
1333	138	VC	es	San Vicente y las Granadinas	San Vicente y las Granadinas
1334	138	VC	fr	Saint-Vincent-et-les Grenadines	Saint-Vincent-et-les Grenadines
1335	138	VC	it	Saint Vincent e Grenadine	Saint Vincent e Grenadine
1336	138	VC	zh	圣文森特和格林纳丁斯	圣文森特和格林纳丁斯
1337	138	VC	ru	Сент-Винсент и Гренадины	Сент-Винсент и Гренадины
1338	194	VE	ar	البوليفارية - جمهورية - فنزويلا 	البوليفارية فنزويلا جمهورية 
1339	194	VE	en	Venezuela (Bolivarian Republic of)	the Bolivarian Republic of Venezuela
1340	194	VE	es	Venezuela (República Bolivariana de)	la República Bolivariana de Venezuela
1341	194	VE	fr	Venezuela (République bolivarienne du)	la République bolivarienne du Venezuela
1342	194	VE	it	Venezuela (Repubblica bolivariana di)	Repubblica bolivariana di Venezuela
1343	194	VE	zh	委内瑞拉 (玻利瓦尔共和国)	委内瑞拉玻利瓦尔共和国
1344	194	VE	ru	Венесуэла (Боливарианская Республика)	Боливарианская Республика Венесуэла
1345	177	VN	ar	فييت نام 	جمهورية فييت نام الاشتراكية 
1346	177	VN	en	Viet Nam	the Socialist Republic of Viet Nam
1347	177	VN	es	Viet Nam	la República Socialista de Viet Nam
1348	177	VN	fr	Viet Nam	la République socialiste du Viet Nam
1349	177	VN	it	Vietnam	Repubblica socialista del Vietnam
1350	177	VN	zh	越 南	越南社会主义共和国
1351	177	VN	ru	Вьетнам	Социалистическая Республика Вьетнам
1352	176	VU	ar	فانواتو	جمهورية فانواتو 
1353	176	VU	en	Vanuatu	the Republic of Vanuatu
1354	176	VU	es	Vanuatu	la República de Vanuatu
1355	176	VU	fr	Vanuatu	la République de Vanuatu
1356	176	VU	it	Vanuatu	Repubblica di Vanuatu
1357	176	VU	zh	瓦努阿图	瓦努阿图共和国
1358	176	VU	ru	Вануату	Республика Вануату
1359	139	WS	ar	ساموا	المستقلة ساموا دولة 
1360	139	WS	en	Samoa	the Independent State of Samoa
1361	139	WS	es	Samoa	el Estado Independiente de Samoa
1362	139	WS	fr	Samoa	l'État indépendant du Samoa
1363	139	WS	it	Samoa	Stato indipendente di Samoa
1364	139	WS	zh	萨摩亚	萨摩亚独立国
1365	139	WS	ru	Самоа	Независимое Государство Самоа
1366	178	YE	ar	اليمن	الجمهورية اليمنية 
1367	178	YE	en	Yemen	the Republic of Yemen
1368	178	YE	es	Yemen	la República del Yemen
1369	178	YE	fr	Yémen	la République du Yémen
1370	178	YE	it	Yemen	Repubblica dello Yemen
1371	178	YE	zh	也 门	也门共和国
1372	178	YE	ru	Йемен	Йеменская Республика
1373	152	ZA	ar	أفريقيا جنوب 	أفريقيا جنوب جمهورية 
1374	152	ZA	en	South Africa	the Republic of South Africa
1375	152	ZA	es	Sudáfrica	la República de Sudáfrica
1376	152	ZA	fr	Afrique du Sud	la République sud-africaine
1377	152	ZA	it	Sudafrica	Repubblica del Sudafrica
1378	152	ZA	zh	南 非	南非共和国
1379	152	ZA	ru	Южная Африка	Южно-Африканская Республика
1380	179	ZM	ar	زامبيا	جمهورية زامبيا 
1381	179	ZM	en	Zambia	the Republic of Zambia
1382	179	ZM	es	Zambia	la República de Zambia
1383	179	ZM	fr	Zambie	la République de Zambie
1384	179	ZM	it	Zambia	Repubblica dello Zambia
1385	179	ZM	zh	赞比亚	赞比亚共和国
1386	179	ZM	ru	Замбия	Республика Замбия
1387	180	ZW	ar	زمبابوي	جمهورية زمبابوي 
1388	180	ZW	en	Zimbabwe	the Republic of Zimbabwe
1389	180	ZW	es	Zimbabwe	la República de Zimbabwe
1390	180	ZW	fr	Zimbabwe	la République du Zimbabwe
1391	180	ZW	it	Zimbabwe	Repubblica dello Zimbabwe
1392	180	ZW	zh	津巴布韦	津巴布韦共和国
1393	180	ZW	ru	Зимбабве	Республика Зимбабве
\.


--
-- Data for Name: game_modes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_modes (gamemode_id, gamemode_name) FROM stdin;
2	Detecting
3	Flag Guessing
4	Coordinate Guessing
1	Drawing
\.


--
-- Data for Name: login_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_history (login_id, user_id, login_time, ip_address) FROM stdin;
1	14	2025-04-06 18:16:40.991439	127.0.0.1
2	47	2025-04-06 18:17:13.691703	127.0.0.1
3	47	2025-04-07 16:12:17.976205	127.0.0.1
4	47	2025-04-07 18:21:22.2306	127.0.0.1
5	47	2025-04-08 14:15:34.711883	127.0.0.1
6	14	2025-04-09 14:37:28.893185	127.0.0.1
7	47	2025-04-09 14:53:59.662883	127.0.0.1
8	50	2025-04-12 19:10:46.799461	127.0.0.1
9	47	2025-04-12 19:12:08.404787	127.0.0.1
10	47	2025-04-13 13:30:57.677527	127.0.0.1
11	47	2025-04-14 13:46:01.921786	127.0.0.1
12	47	2025-04-14 21:27:57.893188	127.0.0.1
13	47	2025-04-28 11:50:15.795198	127.0.0.1
14	14	2025-04-28 13:16:11.732359	127.0.0.1
15	47	2025-04-28 14:08:04.767417	127.0.0.1
16	52	2025-04-28 15:14:55.808233	127.0.0.1
17	54	2025-04-28 15:17:12.055041	127.0.0.1
18	47	2025-04-28 15:20:40.821858	127.0.0.1
19	14	2025-04-28 15:20:48.304448	127.0.0.1
20	14	2025-05-01 12:31:49.660351	127.0.0.1
21	14	2025-05-03 14:29:42.620369	127.0.0.1
22	47	2025-05-13 11:53:12.105811	127.0.0.1
23	47	2025-05-16 12:50:26.56301	127.0.0.1
24	47	2025-05-16 12:51:31.010246	127.0.0.1
25	14	2025-05-16 22:47:24.072189	127.0.0.1
26	47	2025-05-16 22:47:46.863223	127.0.0.1
27	47	2025-05-17 20:24:08.177592	127.0.0.1
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scores (score_id, user_id, gamemode_id, score, country_id) FROM stdin;
1	14	1	47.06	\N
2	14	1	26.92	\N
4	25	1	18.18	\N
5	25	1	40.91	\N
7	26	1	26.67	\N
8	26	1	51.85	\N
29	14	1	47.06	\N
30	14	1	65.22	\N
31	47	1	64.71	\N
32	47	1	50	\N
33	47	1	62.96	\N
34	47	1	38.1	\N
35	47	1	47.83	\N
36	47	1	29.63	\N
37	47	1	59.26	\N
38	47	1	0	\N
39	47	1	18.18	\N
40	47	1	65	\N
41	47	1	0	\N
42	47	1	27.27	\N
43	47	1	0	\N
44	47	1	0	\N
48	47	2	4	\N
49	47	2	1	\N
50	47	2	9	\N
51	14	2	0	\N
52	14	2	3	\N
53	14	2	4	\N
54	15	2	6	\N
70	14	1	40.91	\N
71	14	1	45.45	\N
73	14	2	0	\N
74	14	2	1	\N
75	14	2	3	\N
76	14	2	8	\N
77	14	1	27.27	19
78	14	1	35	7
79	14	1	0	14
80	14	1	52.38	6
81	14	1	0	9
82	14	1	0	12
83	14	1	0	6
84	14	1	0	19
86	14	1	33.33	18
87	14	1	60	20
88	14	2	21	\N
89	14	1	54.55	19
90	14	1	39.13	3
91	14	2	0	\N
92	47	2	0	\N
93	47	2	3	\N
94	47	2	0	\N
95	47	2	3	\N
96	47	2	1	\N
97	47	2	0	\N
98	47	2	1	\N
100	47	3	3	\N
101	14	3	3	\N
102	14	3	12	\N
103	14	3	1	\N
104	47	3	5	\N
105	47	3	12	\N
106	50	1	52.38	2
107	47	1	57.14	15
108	47	1	47.37	14
109	47	1	73.68	14
110	47	3	1	\N
3	25	1	53.57	10
6	26	1	52.17	11
85	14	1	5	5
72	14	1	66.67	9
111	47	3	0	\N
112	47	2	0	\N
113	47	3	2	\N
115	47	4	0	\N
116	47	4	3475	\N
117	47	4	0	\N
118	47	4	1360	\N
119	47	4	0	\N
120	47	4	0	\N
121	47	4	0	\N
122	47	4	0	\N
123	47	4	0	\N
124	47	4	0	\N
125	47	4	0	\N
126	47	4	0	\N
127	47	4	0	\N
128	47	4	0	\N
129	47	4	0	\N
130	47	4	0	\N
131	47	4	0	\N
132	47	4	0	\N
133	47	4	0	\N
134	47	4	0	\N
135	47	4	0	\N
136	47	4	0	\N
137	47	4	0	\N
138	47	4	2731	\N
139	47	4	0	\N
140	47	4	0	\N
141	47	4	0	\N
142	47	4	3437	\N
143	47	4	1644	\N
144	14	4	1329	\N
145	14	4	4403	\N
146	14	4	1754	\N
147	14	4	4682	\N
148	14	4	4682	\N
149	14	4	4682	\N
150	14	4	0	\N
151	14	4	0	\N
152	14	4	657	\N
153	14	4	657	\N
154	14	4	0	\N
155	14	4	0	\N
156	14	4	2682	\N
157	14	4	2682	\N
158	14	4	0	\N
159	14	4	3525	\N
160	47	4	0	\N
161	47	4	0	\N
162	47	4	380	\N
163	47	4	380	\N
164	47	4	0	\N
165	47	4	0	\N
166	47	4	3632	\N
167	54	4	2914	\N
168	14	4	417	\N
169	14	4	417	\N
170	14	4	4124	\N
171	14	4	4124	\N
172	14	4	4652	\N
173	14	4	4652	\N
174	14	4	798	\N
175	14	4	798	\N
176	14	4	0	\N
177	14	4	0	\N
178	14	4	2568	\N
179	14	4	2568	\N
180	14	4	1443	\N
181	14	4	1443	\N
182	14	4	0	\N
183	14	3	13	\N
184	14	2	2	\N
185	14	3	2	\N
186	14	4	0	\N
187	14	4	0	\N
188	14	4	0	\N
189	14	4	0	\N
190	14	4	0	\N
191	14	4	4723	\N
192	14	4	0	\N
193	14	4	0	\N
194	14	4	1956	\N
195	14	4	1956	\N
196	14	4	0	\N
197	14	4	0	\N
198	14	4	2814	\N
199	14	4	2814	\N
200	14	1	62.5	9
201	14	1	50	1
202	14	4	0	\N
203	14	4	0	\N
204	14	4	0	\N
205	14	4	0	\N
206	14	4	0	\N
207	14	4	0	\N
208	14	4	0	\N
209	14	4	0	\N
210	14	4	4759	\N
211	14	4	4759	\N
212	14	4	1694	\N
213	14	4	1694	\N
214	14	4	2465	\N
215	14	4	2465	\N
216	14	4	3488	\N
217	14	4	3488	\N
218	14	4	0	\N
219	14	4	0	\N
220	14	4	2477	\N
221	14	4	2477	\N
222	14	4	2321	\N
223	14	4	2321	\N
224	14	4	0	\N
225	14	4	0	\N
226	14	4	1240	\N
227	14	4	1240	\N
228	14	4	66	\N
229	14	4	66	\N
230	14	1	68.75	9
231	14	3	8	\N
232	14	2	4	\N
233	14	4	2420	\N
234	14	4	2420	\N
235	14	4	2771	\N
236	14	4	2771	\N
237	14	4	0	\N
238	14	4	0	\N
239	14	4	3134	\N
240	14	4	3134	\N
241	14	4	0	\N
242	14	4	0	\N
243	14	4	2268	\N
244	14	4	2268	\N
245	14	4	0	\N
246	14	4	0	\N
247	14	4	3779	\N
248	14	4	3779	\N
249	14	4	0	\N
250	14	4	0	\N
251	14	4	0	\N
252	14	4	0	\N
253	14	4	4471	\N
254	14	4	4471	\N
255	14	4	0	\N
256	47	4	0	\N
257	47	4	0	\N
258	47	4	0	\N
259	47	4	0	\N
260	47	4	3128	\N
261	47	4	3128	\N
262	47	4	0	\N
263	47	4	0	\N
264	47	4	0	\N
265	47	4	0	\N
266	47	4	0	\N
267	47	4	0	\N
268	47	4	3368	\N
269	47	4	3368	\N
270	47	4	0	\N
271	47	4	0	\N
272	47	4	3827	\N
273	47	4	3827	\N
274	47	4	2576	\N
275	47	4	2576	\N
276	47	4	588	\N
277	47	4	588	\N
278	47	4	3817	\N
279	47	4	3817	\N
280	47	4	0	\N
281	47	4	0	\N
282	47	4	0	\N
283	47	4	0	\N
284	47	4	0	\N
285	47	4	0	\N
288	47	4	0	\N
289	47	1	35	12
290	47	4	3859	\N
291	47	4	3859	\N
292	47	4	0	\N
293	47	4	0	\N
294	47	4	4918	\N
295	47	4	4918	\N
296	47	4	0	\N
297	47	4	0	\N
298	47	1	61.9	15
299	47	2	2	\N
300	47	2	1	\N
301	47	2	1	\N
302	47	3	0	\N
303	47	1	52.17	5
304	47	4	0	\N
305	47	4	0	\N
306	47	4	3078	\N
307	47	4	3078	\N
308	47	2	0	\N
309	47	2	2	\N
310	47	2	3	\N
311	47	2	10	\N
312	47	2	0	\N
313	47	2	3	\N
314	47	3	0	\N
315	47	2	0	\N
316	47	2	0	\N
317	47	2	0	\N
318	47	2	0	\N
319	47	2	0	\N
320	47	2	0	\N
321	47	2	0	\N
322	47	2	0	\N
323	47	2	0	\N
324	47	2	0	\N
325	47	2	1	\N
326	47	2	2	\N
327	47	2	0	\N
328	47	2	0	\N
329	47	2	2	\N
330	47	3	0	\N
331	47	3	3	\N
332	47	2	3	\N
333	47	1	29.41	17
334	47	2	9	\N
335	47	2	0	\N
336	47	3	0	\N
337	47	2	0	\N
338	47	2	0	\N
339	47	3	0	\N
340	47	4	2599	\N
341	47	1	25.93	18
342	47	1	34.78	13
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_name, user_password, user_email, user_salt) FROM stdin;
56	gdfgd	fdgdfg	gfdgdfg	\N
51	Hhunter2	c65c66dcf0a3500a30fc80497eb59a40879c8f791d315067797a7d19a4017745	fsdfsafa@gmail.com	ef93c4370967a3abcbcdfb999c2da3e5
52	Hhunter3	254ef576f3b84f64466ad9372eff34ffcbbe4c156185f16b718084a2f257556e	sdfsfsdadf@gmail.com	88a7776d69a7c79352f4e87a8161bb47
53	Hhunter4	cca4767795f4883262887b14e61572fdc70b2d8b118062387668d5455e69f165	dsfasd@gmail.com	818bd281ced51ed7d4b21867be603ba9
54	Hhunter5	d2d3d57f8de1788e606aaae0d974c56ec97f73de34cedecc2ab89cd8432a225b	jfgsdja@gmail.com	a6c067e39d3a60e1e88bff62eb59cb9e
14	usaloveman	500d138d9953b3b72db494645f71a76bbffa8fb01dd422dc0857390e9b4712c6	usaloveman@gmail.com	8d174e1e601540d1b576ca56c82a786c
15	admin	e43629b77c8d702ea02aa63ddebf9d5d4de57c496922a1d79e3155f158575fed	admin@gmail.com	837544831ace58644800648b4c18881e
16	admin1	8f47e84570f8b25819733154b7a2f25113fc7b675424e33eb9eef5c446a859ea	sasa@k.a	e88bda1ba9cd10ee05f001023b0696e1
17	test2	d798772b2ff64735f2601924cded06a71679d384f6cc9929f2c96f0ffa67f000	test2@gmail.com	2da0e3485f3c09d8be24edfbe5797132
18	dsds	400ca0fd6885fd4196aea1ac53770222723f02294ab4cad998f27d42255e14a5	fafk@gmail.com	4a6d78cd45419cd12f8286609951e382
19	Final_test	aec8b848b9738c2cdb3b65997f562091ff1dfe507dda4c3354f02abc00bc0bca	Final_test@gmail.com	a6222bb16e43be96af9df53d33d6347f
20	dsadasd	a0ee9aea4d9a5bd9e6955faaa14cdac1516d4ff7659df31484ad269f923fb126	dasdasd@asda.a	72d36676029e8e8f17bec85b80bb4ccb
21	dasda	301dc4da34cf3d1d9462ff8019174bf3ee6323ca958bca756c43a781bd4ae3eb	dasda@dsd.a	2470cd5e6bd96b0eacf8e9820ae4c30e
22	usaloveman1	de51550ba509d1d413e65229daa97eeac5c895c66b73fedf2dcfb9113c93b708	usaloveman@gmail.coma	d0ed272cb1c72ffc2284232727a3ddcb
23	dasdas	0f800d47b9b86f231219823d645b262528ba75be2d487429ef437c2c9ebacace	sda@ad.re	38f8eb03d8aaece65dd8e2a0a2939842
24	1234	4a9f521b03b81668ad13cd08b2cf8b00cf994cfcb451348fea4df1c40e33b88f	1@gmail.com	cd18550dc9cd308980fff4a41376a453
25	NXHhunter2	c4bdc270646861d08fb3fdbaef656a89793bdf8e8f6ed2101902e0379c462e9b	fsdf@fsdf.re	9836e96434ad1f64ecd5dc30d75d8477
26	MrBeast6000	7f9748a619142442c46eed25feae9a8e60e87d04111653ab0525b6cc29f876ab	dsada@fsd.d	c53d43129fe48b014d4be12b30157c3b
47	root	6ae3689052da52e0436092fcc438a12ad6b8eddc8cde1002f17d20fb66383017	dsada@das.com	4a39d7251e485ce39ffb3a8c295edff2
48	qwertyuioplkjhgfdsaz	0d37a3fda799c80d3410e92a676767ced94aabaf6509f0a7840f000c6c5cf2f6	sdfsadas@gds.com	024afb9066f8e1d9e468fa612d935851
50	MEGATEST	a77eab3b7b4fb664eea68e7971b8782ba47b83d7270bab3199cc2f621c53408a	2fdsfsf@mail.ru	59dc7655b8d023e2512dad585b70a604
\.


--
-- Name: coordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coordinates_id_seq', 317, true);


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 20, true);


--
-- Name: country_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_name_id_seq', 1393, true);


--
-- Name: login_history_login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_history_login_id_seq', 27, true);


--
-- Name: scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.scores_id_seq', 342, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 56, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: coordinates coordinates_image_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coordinates
    ADD CONSTRAINT coordinates_image_id_key UNIQUE (image_id);


--
-- Name: coordinates coordinates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coordinates
    ADD CONSTRAINT coordinates_pkey PRIMARY KEY (id);


--
-- Name: countries countries_country_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_id_key UNIQUE (country_id);


--
-- Name: countries countries_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_name_key UNIQUE (country_name);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: game_modes game_modes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_modes
    ADD CONSTRAINT game_modes_pkey PRIMARY KEY (gamemode_id);


--
-- Name: flag_names idx_17238_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flag_names
    ADD CONSTRAINT idx_17238_primary PRIMARY KEY (id);


--
-- Name: login_history login_history_login_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_login_id_key UNIQUE (login_id);


--
-- Name: login_history login_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_pkey PRIMARY KEY (login_id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (score_id);


--
-- Name: game_modes uq_game_modes_gamemode_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_modes
    ADD CONSTRAINT uq_game_modes_gamemode_id UNIQUE (gamemode_id);


--
-- Name: game_modes uq_game_modes_gamemode_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_modes
    ADD CONSTRAINT uq_game_modes_gamemode_name UNIQUE (gamemode_name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_email_key UNIQUE (user_email);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (user_name);


--
-- Name: login_history login_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: scores scores_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id);


--
-- Name: scores scores_gamemode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_gamemode_id_fkey FOREIGN KEY (gamemode_id) REFERENCES public.game_modes(gamemode_id);


--
-- Name: scores scores_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

