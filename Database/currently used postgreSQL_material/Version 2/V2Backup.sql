PGDMP     :                     x            biodexv2    13.1    13.1 ?               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16776    biodexv2    DATABASE     e   CREATE DATABASE biodexv2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'German_Austria.1252';
    DROP DATABASE biodexv2;
                postgres    false            �            1259    17228    biodex_report    TABLE       CREATE TABLE public.biodex_report (
    biodexreport_id bigint NOT NULL,
    angular_speed real[],
    force real[],
    torque real[],
    exercise character varying(50),
    repetition character varying(50),
    muscle character varying(50),
    settings_id bigint
);
 !   DROP TABLE public.biodex_report;
       public         heap    postgres    false            �            1259    17226 !   biodex_report_biodexreport_id_seq    SEQUENCE     �   CREATE SEQUENCE public.biodex_report_biodexreport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.biodex_report_biodexreport_id_seq;
       public          postgres    false    206                       0    0 !   biodex_report_biodexreport_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.biodex_report_biodexreport_id_seq OWNED BY public.biodex_report.biodexreport_id;
          public          postgres    false    205            �            1259    17244 
   elgareport    TABLE     @   CREATE TABLE public.elgareport (
    elga_id bigint NOT NULL
);
    DROP TABLE public.elgareport;
       public         heap    postgres    false            �            1259    17242    elgareport_elga_id_seq    SEQUENCE        CREATE SEQUENCE public.elgareport_elga_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.elgareport_elga_id_seq;
       public          postgres    false    208                       0    0    elgareport_elga_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.elgareport_elga_id_seq OWNED BY public.elgareport.elga_id;
          public          postgres    false    207            �            1259    17301    givesinforamtion    TABLE     �   CREATE TABLE public.givesinforamtion (
    elga_id bigint NOT NULL,
    sv_number bigint NOT NULL,
    medicaldata_id bigint NOT NULL
);
 $   DROP TABLE public.givesinforamtion;
       public         heap    postgres    false            �            1259    17270 
   maycontain    TABLE     �   CREATE TABLE public.maycontain (
    report_id bigint NOT NULL,
    biodexreport_id bigint NOT NULL,
    elga_id bigint NOT NULL
);
    DROP TABLE public.maycontain;
       public         heap    postgres    false            �            1259    17261    medicaldata    TABLE       CREATE TABLE public.medicaldata (
    medicaldata_id bigint NOT NULL,
    hospitalstartdate character varying(50),
    hospitalenddate character varying(50),
    hospitaladress character varying(50),
    hospitaldepartment character varying(50),
    hospitaladmissionnumber character varying(50),
    hospitalname character varying(50),
    hospitalcontact character varying(50),
    hospitalresponsibledoctor character varying(50),
    diagstateatrelease character varying(50),
    diagsummary character varying(50),
    diagfuturemedication character varying(50),
    diagrehaaim character varying(50),
    diagrecommendedmeasurement character varying(50),
    diagphysicalissue character varying(50),
    medactionsbyhospital character varying(50),
    medmedicationduringstay character varying(50),
    medmedicationatarrival character varying(50),
    medriskalergies character varying(50),
    medpreviousdisease character varying(50),
    medanamnesis character varying(50),
    medadmissionreason character varying(50)
);
    DROP TABLE public.medicaldata;
       public         heap    postgres    false            �            1259    17259    medicaldata_medicaldata_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medicaldata_medicaldata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.medicaldata_medicaldata_id_seq;
       public          postgres    false    210            	           0    0    medicaldata_medicaldata_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.medicaldata_medicaldata_id_seq OWNED BY public.medicaldata.medicaldata_id;
          public          postgres    false    209            �            1259    17292    personaldata    TABLE     �  CREATE TABLE public.personaldata (
    sv_number bigint NOT NULL,
    familystatus character varying(50),
    email character varying(50),
    adress character varying(50),
    legalguardian character varying(50),
    religion character varying(50),
    language character varying(50),
    insurance character varying(50),
    telnumber character varying(50),
    birthplace character varying(50),
    birthdate character varying(50),
    gender character varying(50),
    nametitel character varying(50)
);
     DROP TABLE public.personaldata;
       public         heap    postgres    false            �            1259    17290    personaldata_sv_number_seq    SEQUENCE     �   CREATE SEQUENCE public.personaldata_sv_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.personaldata_sv_number_seq;
       public          postgres    false    213            
           0    0    personaldata_sv_number_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.personaldata_sv_number_seq OWNED BY public.personaldata.sv_number;
          public          postgres    false    212            �            1259    17197    proband    TABLE     �   CREATE TABLE public.proband (
    matriculation_number character varying(50) NOT NULL,
    proband_name character varying(50)
);
    DROP TABLE public.proband;
       public         heap    postgres    false            �            1259    17204    report_result    TABLE     �   CREATE TABLE public.report_result (
    report_id bigint NOT NULL,
    matriculation_number character varying(50),
    date_time timestamp without time zone
);
 !   DROP TABLE public.report_result;
       public         heap    postgres    false            �            1259    17202    report_result_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.report_result_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.report_result_report_id_seq;
       public          postgres    false    202                       0    0    report_result_report_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.report_result_report_id_seq OWNED BY public.report_result.report_id;
          public          postgres    false    201            �            1259    17217    settings    TABLE     �  CREATE TABLE public.settings (
    settings_id bigint NOT NULL,
    powerhead_orientation character varying(50),
    powerhead_height character varying(50),
    powerhead_position character varying(50),
    powerhead_attachment character varying(50),
    powerhead_tilt character varying(50),
    seat_height character varying(50),
    seat_orientation character varying(50),
    seat_tilt character varying(50),
    seat_position character varying(50),
    hip_flexion character varying(50),
    footplate_tilt character varying(50),
    knee_flexion character varying(50),
    ankle_flexion character varying(50),
    shoulder_abduction character varying(50),
    shoulder_flexion character varying(50),
    controller_mode character varying(50),
    controller_cushion character varying(50),
    controller_sensitivity character varying(50),
    controller_rom_limit character varying(50),
    controller_rom_percentage character varying(50),
    controller_eccentric_speed character varying(50),
    controller_passive_speed character varying(50),
    controller_torque_limits character varying(50),
    controller_pause character varying(50),
    controller_isokinetic_speed character varying(50)
);
    DROP TABLE public.settings;
       public         heap    postgres    false            �            1259    17215    settings_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.settings_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.settings_settings_id_seq;
       public          postgres    false    204                       0    0    settings_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.settings_settings_id_seq OWNED BY public.settings.settings_id;
          public          postgres    false    203            R           2604    17231    biodex_report biodexreport_id    DEFAULT     �   ALTER TABLE ONLY public.biodex_report ALTER COLUMN biodexreport_id SET DEFAULT nextval('public.biodex_report_biodexreport_id_seq'::regclass);
 L   ALTER TABLE public.biodex_report ALTER COLUMN biodexreport_id DROP DEFAULT;
       public          postgres    false    206    205    206            S           2604    17247    elgareport elga_id    DEFAULT     x   ALTER TABLE ONLY public.elgareport ALTER COLUMN elga_id SET DEFAULT nextval('public.elgareport_elga_id_seq'::regclass);
 A   ALTER TABLE public.elgareport ALTER COLUMN elga_id DROP DEFAULT;
       public          postgres    false    207    208    208            T           2604    17264    medicaldata medicaldata_id    DEFAULT     �   ALTER TABLE ONLY public.medicaldata ALTER COLUMN medicaldata_id SET DEFAULT nextval('public.medicaldata_medicaldata_id_seq'::regclass);
 I   ALTER TABLE public.medicaldata ALTER COLUMN medicaldata_id DROP DEFAULT;
       public          postgres    false    209    210    210            U           2604    17295    personaldata sv_number    DEFAULT     �   ALTER TABLE ONLY public.personaldata ALTER COLUMN sv_number SET DEFAULT nextval('public.personaldata_sv_number_seq'::regclass);
 E   ALTER TABLE public.personaldata ALTER COLUMN sv_number DROP DEFAULT;
       public          postgres    false    212    213    213            P           2604    17207    report_result report_id    DEFAULT     �   ALTER TABLE ONLY public.report_result ALTER COLUMN report_id SET DEFAULT nextval('public.report_result_report_id_seq'::regclass);
 F   ALTER TABLE public.report_result ALTER COLUMN report_id DROP DEFAULT;
       public          postgres    false    202    201    202            Q           2604    17220    settings settings_id    DEFAULT     |   ALTER TABLE ONLY public.settings ALTER COLUMN settings_id SET DEFAULT nextval('public.settings_settings_id_seq'::regclass);
 C   ALTER TABLE public.settings ALTER COLUMN settings_id DROP DEFAULT;
       public          postgres    false    204    203    204            �          0    17228    biodex_report 
   TABLE DATA           �   COPY public.biodex_report (biodexreport_id, angular_speed, force, torque, exercise, repetition, muscle, settings_id) FROM stdin;
    public          postgres    false    206   �X       �          0    17244 
   elgareport 
   TABLE DATA           -   COPY public.elgareport (elga_id) FROM stdin;
    public          postgres    false    208    Y                  0    17301    givesinforamtion 
   TABLE DATA           N   COPY public.givesinforamtion (elga_id, sv_number, medicaldata_id) FROM stdin;
    public          postgres    false    214   !Y       �          0    17270 
   maycontain 
   TABLE DATA           I   COPY public.maycontain (report_id, biodexreport_id, elga_id) FROM stdin;
    public          postgres    false    211   FY       �          0    17261    medicaldata 
   TABLE DATA           �  COPY public.medicaldata (medicaldata_id, hospitalstartdate, hospitalenddate, hospitaladress, hospitaldepartment, hospitaladmissionnumber, hospitalname, hospitalcontact, hospitalresponsibledoctor, diagstateatrelease, diagsummary, diagfuturemedication, diagrehaaim, diagrecommendedmeasurement, diagphysicalissue, medactionsbyhospital, medmedicationduringstay, medmedicationatarrival, medriskalergies, medpreviousdisease, medanamnesis, medadmissionreason) FROM stdin;
    public          postgres    false    210   kY       �          0    17292    personaldata 
   TABLE DATA           �   COPY public.personaldata (sv_number, familystatus, email, adress, legalguardian, religion, language, insurance, telnumber, birthplace, birthdate, gender, nametitel) FROM stdin;
    public          postgres    false    213   �Y       �          0    17197    proband 
   TABLE DATA           E   COPY public.proband (matriculation_number, proband_name) FROM stdin;
    public          postgres    false    200   Z       �          0    17204    report_result 
   TABLE DATA           S   COPY public.report_result (report_id, matriculation_number, date_time) FROM stdin;
    public          postgres    false    202   7Z       �          0    17217    settings 
   TABLE DATA             COPY public.settings (settings_id, powerhead_orientation, powerhead_height, powerhead_position, powerhead_attachment, powerhead_tilt, seat_height, seat_orientation, seat_tilt, seat_position, hip_flexion, footplate_tilt, knee_flexion, ankle_flexion, shoulder_abduction, shoulder_flexion, controller_mode, controller_cushion, controller_sensitivity, controller_rom_limit, controller_rom_percentage, controller_eccentric_speed, controller_passive_speed, controller_torque_limits, controller_pause, controller_isokinetic_speed) FROM stdin;
    public          postgres    false    204   sZ                  0    0 !   biodex_report_biodexreport_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.biodex_report_biodexreport_id_seq', 1, true);
          public          postgres    false    205                       0    0    elgareport_elga_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.elgareport_elga_id_seq', 1, false);
          public          postgres    false    207                       0    0    medicaldata_medicaldata_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.medicaldata_medicaldata_id_seq', 1, true);
          public          postgres    false    209                       0    0    personaldata_sv_number_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.personaldata_sv_number_seq', 1, true);
          public          postgres    false    212                       0    0    report_result_report_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.report_result_report_id_seq', 1, true);
          public          postgres    false    201                       0    0    settings_settings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.settings_settings_id_seq', 1, true);
          public          postgres    false    203            ]           2606    17236     biodex_report biodex_report_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.biodex_report
    ADD CONSTRAINT biodex_report_pkey PRIMARY KEY (biodexreport_id);
 J   ALTER TABLE ONLY public.biodex_report DROP CONSTRAINT biodex_report_pkey;
       public            postgres    false    206            _           2606    17249    elgareport elgareport_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.elgareport
    ADD CONSTRAINT elgareport_pkey PRIMARY KEY (elga_id);
 D   ALTER TABLE ONLY public.elgareport DROP CONSTRAINT elgareport_pkey;
       public            postgres    false    208            g           2606    17305 &   givesinforamtion givesinforamtion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.givesinforamtion
    ADD CONSTRAINT givesinforamtion_pkey PRIMARY KEY (elga_id, sv_number, medicaldata_id);
 P   ALTER TABLE ONLY public.givesinforamtion DROP CONSTRAINT givesinforamtion_pkey;
       public            postgres    false    214    214    214            c           2606    17274    maycontain maycontain_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.maycontain
    ADD CONSTRAINT maycontain_pkey PRIMARY KEY (report_id, biodexreport_id, elga_id);
 D   ALTER TABLE ONLY public.maycontain DROP CONSTRAINT maycontain_pkey;
       public            postgres    false    211    211    211            a           2606    17269    medicaldata medicaldata_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.medicaldata
    ADD CONSTRAINT medicaldata_pkey PRIMARY KEY (medicaldata_id);
 F   ALTER TABLE ONLY public.medicaldata DROP CONSTRAINT medicaldata_pkey;
       public            postgres    false    210            e           2606    17300    personaldata personaldata_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.personaldata
    ADD CONSTRAINT personaldata_pkey PRIMARY KEY (sv_number);
 H   ALTER TABLE ONLY public.personaldata DROP CONSTRAINT personaldata_pkey;
       public            postgres    false    213            W           2606    17201    proband proband_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.proband
    ADD CONSTRAINT proband_pkey PRIMARY KEY (matriculation_number);
 >   ALTER TABLE ONLY public.proband DROP CONSTRAINT proband_pkey;
       public            postgres    false    200            Y           2606    17209     report_result report_result_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.report_result
    ADD CONSTRAINT report_result_pkey PRIMARY KEY (report_id);
 J   ALTER TABLE ONLY public.report_result DROP CONSTRAINT report_result_pkey;
       public            postgres    false    202            [           2606    17225    settings settings_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (settings_id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            postgres    false    204            i           2606    17237 ,   biodex_report biodex_report_settings_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.biodex_report
    ADD CONSTRAINT biodex_report_settings_id_fkey FOREIGN KEY (settings_id) REFERENCES public.settings(settings_id);
 V   ALTER TABLE ONLY public.biodex_report DROP CONSTRAINT biodex_report_settings_id_fkey;
       public          postgres    false    206    2907    204            m           2606    17306 .   givesinforamtion givesinforamtion_elga_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.givesinforamtion
    ADD CONSTRAINT givesinforamtion_elga_id_fkey FOREIGN KEY (elga_id) REFERENCES public.elgareport(elga_id);
 X   ALTER TABLE ONLY public.givesinforamtion DROP CONSTRAINT givesinforamtion_elga_id_fkey;
       public          postgres    false    2911    208    214            o           2606    17316 5   givesinforamtion givesinforamtion_medicaldata_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.givesinforamtion
    ADD CONSTRAINT givesinforamtion_medicaldata_id_fkey FOREIGN KEY (medicaldata_id) REFERENCES public.medicaldata(medicaldata_id);
 _   ALTER TABLE ONLY public.givesinforamtion DROP CONSTRAINT givesinforamtion_medicaldata_id_fkey;
       public          postgres    false    210    2913    214            n           2606    17311 0   givesinforamtion givesinforamtion_sv_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.givesinforamtion
    ADD CONSTRAINT givesinforamtion_sv_number_fkey FOREIGN KEY (sv_number) REFERENCES public.personaldata(sv_number);
 Z   ALTER TABLE ONLY public.givesinforamtion DROP CONSTRAINT givesinforamtion_sv_number_fkey;
       public          postgres    false    213    214    2917            k           2606    17280 *   maycontain maycontain_biodexreport_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maycontain
    ADD CONSTRAINT maycontain_biodexreport_id_fkey FOREIGN KEY (biodexreport_id) REFERENCES public.biodex_report(biodexreport_id);
 T   ALTER TABLE ONLY public.maycontain DROP CONSTRAINT maycontain_biodexreport_id_fkey;
       public          postgres    false    206    2909    211            l           2606    17285 "   maycontain maycontain_elga_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maycontain
    ADD CONSTRAINT maycontain_elga_id_fkey FOREIGN KEY (elga_id) REFERENCES public.elgareport(elga_id);
 L   ALTER TABLE ONLY public.maycontain DROP CONSTRAINT maycontain_elga_id_fkey;
       public          postgres    false    211    208    2911            j           2606    17275 $   maycontain maycontain_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maycontain
    ADD CONSTRAINT maycontain_report_id_fkey FOREIGN KEY (report_id) REFERENCES public.report_result(report_id);
 N   ALTER TABLE ONLY public.maycontain DROP CONSTRAINT maycontain_report_id_fkey;
       public          postgres    false    2905    202    211            h           2606    17210 5   report_result report_result_matriculation_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.report_result
    ADD CONSTRAINT report_result_matriculation_number_fkey FOREIGN KEY (matriculation_number) REFERENCES public.proband(matriculation_number);
 _   ALTER TABLE ONLY public.report_result DROP CONSTRAINT report_result_matriculation_number_fkey;
       public          postgres    false    202    2903    200            �   1   x�3��"�����Ң�b8OG!�B�$�dg�sr��qqq ���      �      x�340������ �D             x�340�4�4����� ��      �      x�3�4�440������ ��      �   9   x�3��!���Ԝ���Ԣ<�.䔚��TT���
H��L����D������ ��      �   A   x�3��--)I-�,IM����.�u(�L��K,��"��Ғ���pwooNCcc�T�W� +�       �   "   x�KJ5�H250�t���qR�s�u����� Y��      �   ,   x�3�LJ5�H250�4204�50�52R0��24�22����� ���      �   &   x�3�4pIM/JM��#9�$+8b������ 5     