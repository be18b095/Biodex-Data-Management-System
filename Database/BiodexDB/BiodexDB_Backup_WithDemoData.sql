PGDMP         8                 y            BiodexDB    13.1    13.1 W                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            #           1262    18324    BiodexDB    DATABASE     g   CREATE DATABASE "BiodexDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'German_Austria.1252';
    DROP DATABASE "BiodexDB";
                postgres    false            �            1255    18683    display_selection(text)    FUNCTION     �  CREATE FUNCTION public.display_selection(_selection text) RETURNS TABLE(id bigint, created_at timestamp without time zone, exercise character varying, muscle character varying, repetition character varying, name_title character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY
	SELECT
		exercise_data.exercise_id,
		report_result.created_at,
		exercise_data.exercise,
		exercise_data.muscle,
		exercise_data.repetition,
		personal_data.name_title
	FROM 
		exercise_data
		INNER JOIN report_result ON report_result.report_id = exercise_data.exercise_id
		INNER JOIN personal_data ON report_result.report_id = personal_data.personal_data_id
		WHERE exercise_data.exercise LIKE '%' || _selection || '%';
END $$;
 9   DROP FUNCTION public.display_selection(_selection text);
       public          postgres    false            �            1255    18485    display_table()    FUNCTION     �  CREATE FUNCTION public.display_table() RETURNS TABLE(id bigint, created_at timestamp without time zone, exercise character varying, muscle character varying, repetition character varying, name_title character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY
	SELECT
		exercise_data.exercise_id,
		report_result.created_at,
		exercise_data.exercise,
		exercise_data.muscle,
		exercise_data.repetition,
		personal_data.name_title
	FROM 
		exercise_data
		INNER JOIN report_result ON report_result.report_id = exercise_data.exercise_id
		INNER JOIN personal_data ON report_result.report_id = personal_data.personal_data_id;
END $$;
 &   DROP FUNCTION public.display_table();
       public          postgres    false            �            1255    18604    insert_biodex_report()    FUNCTION     �   CREATE FUNCTION public.insert_biodex_report() RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO biodex_report DEFAULT VALUES;
	
	IF FOUND THEN RETURN (SELECT max(biodex_report_id) FROM biodex_report);
	ELSE RETURN 0;
	END IF;
	
END $$;
 -   DROP FUNCTION public.insert_biodex_report();
       public          postgres    false            �            1255    18674 *   insert_contains(integer, integer, integer)    FUNCTION     `  CREATE FUNCTION public.insert_contains(_report_id integer, _biodex_report_id integer, _elga_report_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO contains (report_id, biodex_report_id, elga_report_id)
	VALUES (_report_id, _biodex_report_id, _elga_report_id);
	
	IF FOUND THEN RETURN 1;
	ELSE RETURN 0;
	END IF;
	
END $$;
 n   DROP FUNCTION public.insert_contains(_report_id integer, _biodex_report_id integer, _elga_report_id integer);
       public          postgres    false            �            1255    18670    insert_elga_report()    FUNCTION     �   CREATE FUNCTION public.insert_elga_report() RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO elga_report DEFAULT VALUES;
	
	IF FOUND THEN RETURN (SELECT max(elga_report_id) FROM elga_report);
	ELSE RETURN 0;
	END IF;
	
END $$;
 +   DROP FUNCTION public.insert_elga_report();
       public          postgres    false            �            1255    18603 �   insert_exercise_data(character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     =  CREATE FUNCTION public.insert_exercise_data(_torque character varying, _angle character varying, _velocity character varying, _muscle character varying, _exercise character varying, _repetition character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO exercise_data(
    torque,
    angle,
    velocity,
    muscle,
    exercise,
    repetition)
	VALUES(
    _torque,
    _angle,
    _velocity,
    _muscle,
    _exercise,
    _repetition);
	
	IF FOUND THEN RETURN (SELECT max(exercise_id) FROM exercise_data);
	ELSE RETURN 0;
	END IF;
	
END $$;
 �   DROP FUNCTION public.insert_exercise_data(_torque character varying, _angle character varying, _velocity character varying, _muscle character varying, _exercise character varying, _repetition character varying);
       public          postgres    false            �            1255    18673 3   insert_gives_information(integer, integer, integer)    FUNCTION     �  CREATE FUNCTION public.insert_gives_information(_elga_report_id integer, _personal_data_id integer, _medical_data_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO gives_information (elga_report_id, personal_data_id, medical_data_id)
	VALUES (_elga_report_id, _personal_data_id, _medical_data_id);
	
	IF FOUND THEN RETURN 1;
	ELSE RETURN 0;
	END IF;
	
END $$;
 }   DROP FUNCTION public.insert_gives_information(_elga_report_id integer, _personal_data_id integer, _medical_data_id integer);
       public          postgres    false            �            1255    18487 �  insert_medical_data(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     [	  CREATE FUNCTION public.insert_medical_data(_hospital_start_date character varying, _hospital_end_date character varying, _hospital_address character varying, _hospital_department character varying, _hospital_admission_number character varying, _hospital_name character varying, _hospital_contact character varying, _hospital_responsible_doctor character varying, _diagnosis_state_at_release character varying, _diagnosis_summary character varying, _diagnosis_future_medication character varying, _diagnosis_rehabilitation_aim character varying, _diagnosis_recommended_measurements character varying, _diagnosis_physical_issue character varying, _medical_actions_by_hospital character varying, _medical_medication_during_stay character varying, _medical_medication_at_arrival character varying, _medical_risk_allergies character varying, _medical_previous_diseases character varying, _medical_anamnesis character varying, _medical_admission_reason character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO medical_data(
	hospital_start_date,
    hospital_end_date,
    hospital_address,
    hospital_department,
    hospital_admission_number,
    hospital_name,
    hospital_contact,
    hospital_responsible_doctor,
    diagnosis_state_at_release,
    diagnosis_summary,
    diagnosis_future_medication,
    diagnosis_rehabilitation_aim,
    diagnosis_recommended_measurements,
    diagnosis_physical_issue,
    medical_actions_by_hospital,
    medical_medication_during_stay,
    medical_medication_at_arrival,
    medical_risk_allergies,
    medical_previous_diseases,
    medical_anamnesis,
    medical_admission_reason)
	VALUES(
	_hospital_start_date,
    _hospital_end_date,
    _hospital_address,
    _hospital_department,
    _hospital_admission_number,
    _hospital_name,
    _hospital_contact,
    _hospital_responsible_doctor,
    _diagnosis_state_at_release,
    _diagnosis_summary,
    _diagnosis_future_medication,
    _diagnosis_rehabilitation_aim,
    _diagnosis_recommended_measurements,
    _diagnosis_physical_issue,
    _medical_actions_by_hospital,
    _medical_medication_during_stay,
    _medical_medication_at_arrival,
    _medical_risk_allergies,
    _medical_previous_diseases,
    _medical_anamnesis,
    _medical_admission_reason);
	
	IF FOUND THEN RETURN (SELECT max(medical_data_id) FROM medical_data);
	ELSE RETURN 0;
	END IF;
	
END $$;
 �  DROP FUNCTION public.insert_medical_data(_hospital_start_date character varying, _hospital_end_date character varying, _hospital_address character varying, _hospital_department character varying, _hospital_admission_number character varying, _hospital_name character varying, _hospital_contact character varying, _hospital_responsible_doctor character varying, _diagnosis_state_at_release character varying, _diagnosis_summary character varying, _diagnosis_future_medication character varying, _diagnosis_rehabilitation_aim character varying, _diagnosis_recommended_measurements character varying, _diagnosis_physical_issue character varying, _medical_actions_by_hospital character varying, _medical_medication_during_stay character varying, _medical_medication_at_arrival character varying, _medical_risk_allergies character varying, _medical_previous_diseases character varying, _medical_anamnesis character varying, _medical_admission_reason character varying);
       public          postgres    false            �            1255    18483   insert_personal_data(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     )  CREATE FUNCTION public.insert_personal_data(_sv_number character varying, _family_status character varying, _email character varying, _address character varying, _legal_guardian character varying, _religion character varying, _language character varying, _insurance character varying, _telephone_number character varying, _birth_place character varying, _birth_date character varying, _gender character varying, _name_title character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO personal_data(
    sv_number,
    family_status,
    email,
    address,
    legal_guardian,
    religion,
    language,
    insurance,
    telephone_number,
    birth_place,
    birth_date,
    gender,
    name_title)
	VALUES(
    _sv_number,
    _family_status,
    _email,
    _address,
    _legal_guardian,
    _religion,
    _language,
    _insurance,
    _telephone_number,
    _birth_place,
    _birth_date,
    _gender,
    _name_title);
	
	IF FOUND THEN RETURN (SELECT max(personal_data_id) FROM personal_data);
	ELSE RETURN 0;
	END IF;
	
END $$;
 �  DROP FUNCTION public.insert_personal_data(_sv_number character varying, _family_status character varying, _email character varying, _address character varying, _legal_guardian character varying, _religion character varying, _language character varying, _insurance character varying, _telephone_number character varying, _birth_place character varying, _birth_date character varying, _gender character varying, _name_title character varying);
       public          postgres    false            �            1255    18671    insert_report_result()    FUNCTION     �   CREATE FUNCTION public.insert_report_result() RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO report_result DEFAULT VALUES;
	
	IF FOUND THEN RETURN (SELECT max(report_id) FROM report_result);
	ELSE RETURN 0;
	END IF;
	
END $$;
 -   DROP FUNCTION public.insert_report_result();
       public          postgres    false            �            1255    18484   insert_settings(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     
  CREATE FUNCTION public.insert_settings(_powerhead_orientation character varying, _powerhead_height character varying, _powerhead_position character varying, _powerhead_attachment character varying, _powerhead_tilt character varying, _seat_height character varying, _seat_orientation character varying, _seat_tilt character varying, _seat_position character varying, _hip_flexion character varying, _footplate_tilt character varying, _knee_flexion character varying, _ankle_flexion character varying, _shoulder_abduction character varying, _shoulder_flexion character varying, _elbow_flexion character varying, _controller_mode character varying, _controller_cushion character varying, _controller_sensitivity character varying, _controller_rom_upper_limit character varying, _controller_rom_lower_limit character varying, _controller_rom_percentage character varying, _controller_eccentric_speed character varying, _controller_passive_speed character varying, _controller_torque_limits character varying, _controller_pause character varying, _controller_isokinetic_speed character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO settings(
	powerhead_orientation,
    powerhead_height,
    powerhead_position,
    powerhead_attachment,
    powerhead_tilt,
    seat_height,
    seat_orientation,
    seat_tilt,
    seat_position,
    hip_flexion,
    footplate_tilt,
    knee_flexion,
    ankle_flexion,
    shoulder_abduction,
    shoulder_flexion,
    elbow_flexion,
    controller_mode,
    controller_cushion,
    controller_sensitivity,
    controller_rom_upper_limit,
    controller_rom_lower_limit,
    controller_rom_percentage,
    controller_eccentric_speed,
    controller_passive_speed,
    controller_torque_limits,
    controller_pause,
    controller_isokinetic_speed)
	VALUES(
	_powerhead_orientation,
    _powerhead_height,
    _powerhead_position,
    _powerhead_attachment,
    _powerhead_tilt,
    _seat_height,
    _seat_orientation,
    _seat_tilt,
    _seat_position,
    _hip_flexion,
    _footplate_tilt,
    _knee_flexion,
    _ankle_flexion,
    _shoulder_abduction,
    _shoulder_flexion,
    _elbow_flexion,
    _controller_mode,
    _controller_cushion,
    _controller_sensitivity,
    _controller_rom_upper_limit,
    _controller_rom_lower_limit,
    _controller_rom_percentage,
    _controller_eccentric_speed,
    _controller_passive_speed,
    _controller_torque_limits,
    _controller_pause,
    _controller_isokinetic_speed);
	
	IF FOUND THEN RETURN (SELECT max(settings_id) FROM settings);
	ELSE RETURN 0;
	END IF;
	
END $$;
 A  DROP FUNCTION public.insert_settings(_powerhead_orientation character varying, _powerhead_height character varying, _powerhead_position character varying, _powerhead_attachment character varying, _powerhead_tilt character varying, _seat_height character varying, _seat_orientation character varying, _seat_tilt character varying, _seat_position character varying, _hip_flexion character varying, _footplate_tilt character varying, _knee_flexion character varying, _ankle_flexion character varying, _shoulder_abduction character varying, _shoulder_flexion character varying, _elbow_flexion character varying, _controller_mode character varying, _controller_cushion character varying, _controller_sensitivity character varying, _controller_rom_upper_limit character varying, _controller_rom_lower_limit character varying, _controller_rom_percentage character varying, _controller_eccentric_speed character varying, _controller_passive_speed character varying, _controller_torque_limits character varying, _controller_pause character varying, _controller_isokinetic_speed character varying);
       public          postgres    false            �            1255    18672 &   insert_uses(integer, integer, integer)    FUNCTION     U  CREATE FUNCTION public.insert_uses(_biodex_report_id integer, _exercise_id integer, _settings_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO uses (biodex_report_id, exercise_id, settings_id)
	VALUES (_biodex_report_id, _exercise_id, _settings_id);
	
	IF FOUND THEN RETURN 1;
	ELSE RETURN 0;
	END IF;
	
END $$;
 i   DROP FUNCTION public.insert_uses(_biodex_report_id integer, _exercise_id integer, _settings_id integer);
       public          postgres    false            �            1255    18926    renew_ids()    FUNCTION     (  CREATE FUNCTION public.renew_ids() RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	SELECT setval('report_result_report_id_seq', (SELECT max(report_id) FROM report_result));
	SELECT setval('biodex_report_biodex_report_id_seq', (SELECT max(report_id) FROM report_result));
	SELECT setval('elga_report_elga_report_id_seq', (SELECT max(report_id) FROM report_result));
	SELECT setval('exercise_data_exercise_id_seq', (SELECT max(report_id) FROM report_result));
	SELECT setval('settings_settings_id_seq', (SELECT max(report_id) FROM report_result));
	SELECT setval('medical_data_medical_data_id_seq', (SELECT max(report_id) FROM report_result));
	SELECT setval('personal_data_personal_data_id_seq', (SELECT max(report_id) FROM report_result));
	
	IF FOUND THEN RETURN 1;
	ELSE RETURN 0;
	END IF;
	
END $$;
 "   DROP FUNCTION public.renew_ids();
       public          postgres    false            �            1255    18687    return_angle(integer)    FUNCTION     �   CREATE FUNCTION public.return_angle(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT angle FROM exercise_data WHERE exercise_id = _id);
END $$;
 0   DROP FUNCTION public.return_angle(_id integer);
       public          postgres    false            �            1255    18686    return_torque(integer)    FUNCTION     �   CREATE FUNCTION public.return_torque(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT torque FROM exercise_data WHERE exercise_id = _id);
END $$;
 1   DROP FUNCTION public.return_torque(_id integer);
       public          postgres    false            �            1255    18688    return_velocity(integer)    FUNCTION     �   CREATE FUNCTION public.return_velocity(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT velocity FROM exercise_data WHERE exercise_id = _id);
END $$;
 3   DROP FUNCTION public.return_velocity(_id integer);
       public          postgres    false            �            1259    18746    biodex_report    TABLE     L   CREATE TABLE public.biodex_report (
    biodex_report_id bigint NOT NULL
);
 !   DROP TABLE public.biodex_report;
       public         heap    postgres    false            �            1259    18744 "   biodex_report_biodex_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.biodex_report_biodex_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.biodex_report_biodex_report_id_seq;
       public          postgres    false    203            $           0    0 "   biodex_report_biodex_report_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.biodex_report_biodex_report_id_seq OWNED BY public.biodex_report.biodex_report_id;
          public          postgres    false    202            �            1259    18804    contains    TABLE     �   CREATE TABLE public.contains (
    report_id bigint NOT NULL,
    biodex_report_id bigint NOT NULL,
    elga_report_id bigint NOT NULL
);
    DROP TABLE public.contains;
       public         heap    postgres    false            �            1259    18776    elga_report    TABLE     H   CREATE TABLE public.elga_report (
    elga_report_id bigint NOT NULL
);
    DROP TABLE public.elga_report;
       public         heap    postgres    false            �            1259    18774    elga_report_elga_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.elga_report_elga_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.elga_report_elga_report_id_seq;
       public          postgres    false    209            %           0    0    elga_report_elga_report_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.elga_report_elga_report_id_seq OWNED BY public.elga_report.elga_report_id;
          public          postgres    false    208            �            1259    18765    exercise_data    TABLE       CREATE TABLE public.exercise_data (
    exercise_id bigint NOT NULL,
    torque character varying,
    angle character varying,
    velocity character varying,
    muscle character varying,
    exercise character varying,
    repetition character varying
);
 !   DROP TABLE public.exercise_data;
       public         heap    postgres    false            �            1259    18763    exercise_data_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.exercise_data_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.exercise_data_exercise_id_seq;
       public          postgres    false    207            &           0    0    exercise_data_exercise_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.exercise_data_exercise_id_seq OWNED BY public.exercise_data.exercise_id;
          public          postgres    false    206            �            1259    18824    gives_information    TABLE     �   CREATE TABLE public.gives_information (
    elga_report_id bigint NOT NULL,
    personal_data_id bigint NOT NULL,
    medical_data_id bigint NOT NULL
);
 %   DROP TABLE public.gives_information;
       public         heap    postgres    false            �            1259    18795    medical_data    TABLE     $  CREATE TABLE public.medical_data (
    medical_data_id bigint NOT NULL,
    hospital_start_date character varying,
    hospital_end_date character varying,
    hospital_address character varying,
    hospital_department character varying,
    hospital_admission_number character varying,
    hospital_name character varying,
    hospital_contact character varying,
    hospital_responsible_doctor character varying,
    diagnosis_state_at_release character varying,
    diagnosis_summary character varying,
    diagnosis_future_medication character varying,
    diagnosis_rehabilitation_aim character varying,
    diagnosis_recommended_measurements character varying,
    diagnosis_physical_issue character varying,
    medical_actions_by_hospital character varying,
    medical_medication_during_stay character varying,
    medical_medication_at_arrival character varying,
    medical_risk_allergies character varying,
    medical_previous_diseases character varying,
    medical_anamnesis character varying,
    medical_admission_reason character varying
);
     DROP TABLE public.medical_data;
       public         heap    postgres    false            �            1259    18793     medical_data_medical_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.medical_data_medical_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.medical_data_medical_data_id_seq;
       public          postgres    false    213            '           0    0     medical_data_medical_data_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.medical_data_medical_data_id_seq OWNED BY public.medical_data.medical_data_id;
          public          postgres    false    212            �            1259    18784    personal_data    TABLE       CREATE TABLE public.personal_data (
    personal_data_id bigint NOT NULL,
    sv_number character varying,
    family_status character varying,
    email character varying,
    address character varying,
    legal_guardian character varying,
    religion character varying,
    language character varying,
    insurance character varying,
    telephone_number character varying,
    birth_place character varying,
    birth_date character varying,
    gender character varying,
    name_title character varying
);
 !   DROP TABLE public.personal_data;
       public         heap    postgres    false            �            1259    18782 "   personal_data_personal_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_data_personal_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.personal_data_personal_data_id_seq;
       public          postgres    false    211            (           0    0 "   personal_data_personal_data_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.personal_data_personal_data_id_seq OWNED BY public.personal_data.personal_data_id;
          public          postgres    false    210            �            1259    18737    report_result    TABLE     �   CREATE TABLE public.report_result (
    report_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0)
);
 !   DROP TABLE public.report_result;
       public         heap    postgres    false            �            1259    18735    report_result_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.report_result_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.report_result_report_id_seq;
       public          postgres    false    201            )           0    0    report_result_report_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.report_result_report_id_seq OWNED BY public.report_result.report_id;
          public          postgres    false    200            �            1259    18754    settings    TABLE     �  CREATE TABLE public.settings (
    settings_id bigint NOT NULL,
    powerhead_orientation character varying,
    powerhead_height character varying,
    powerhead_position character varying,
    powerhead_attachment character varying,
    powerhead_tilt character varying,
    seat_height character varying,
    seat_orientation character varying,
    seat_tilt character varying,
    seat_position character varying,
    hip_flexion character varying,
    footplate_tilt character varying,
    knee_flexion character varying,
    ankle_flexion character varying,
    shoulder_abduction character varying,
    shoulder_flexion character varying,
    elbow_flexion character varying,
    controller_mode character varying,
    controller_cushion character varying,
    controller_sensitivity character varying,
    controller_rom_upper_limit character varying,
    controller_rom_lower_limit character varying,
    controller_rom_percentage character varying,
    controller_eccentric_speed character varying,
    controller_passive_speed character varying,
    controller_torque_limits character varying,
    controller_pause character varying,
    controller_isokinetic_speed character varying
);
    DROP TABLE public.settings;
       public         heap    postgres    false            �            1259    18752    settings_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.settings_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.settings_settings_id_seq;
       public          postgres    false    205            *           0    0    settings_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.settings_settings_id_seq OWNED BY public.settings.settings_id;
          public          postgres    false    204            �            1259    18845    uses    TABLE     �   CREATE TABLE public.uses (
    biodex_report_id bigint NOT NULL,
    exercise_id bigint NOT NULL,
    settings_id bigint NOT NULL
);
    DROP TABLE public.uses;
       public         heap    postgres    false            h           2604    18749    biodex_report biodex_report_id    DEFAULT     �   ALTER TABLE ONLY public.biodex_report ALTER COLUMN biodex_report_id SET DEFAULT nextval('public.biodex_report_biodex_report_id_seq'::regclass);
 M   ALTER TABLE public.biodex_report ALTER COLUMN biodex_report_id DROP DEFAULT;
       public          postgres    false    203    202    203            k           2604    18779    elga_report elga_report_id    DEFAULT     �   ALTER TABLE ONLY public.elga_report ALTER COLUMN elga_report_id SET DEFAULT nextval('public.elga_report_elga_report_id_seq'::regclass);
 I   ALTER TABLE public.elga_report ALTER COLUMN elga_report_id DROP DEFAULT;
       public          postgres    false    209    208    209            j           2604    18768    exercise_data exercise_id    DEFAULT     �   ALTER TABLE ONLY public.exercise_data ALTER COLUMN exercise_id SET DEFAULT nextval('public.exercise_data_exercise_id_seq'::regclass);
 H   ALTER TABLE public.exercise_data ALTER COLUMN exercise_id DROP DEFAULT;
       public          postgres    false    207    206    207            m           2604    18798    medical_data medical_data_id    DEFAULT     �   ALTER TABLE ONLY public.medical_data ALTER COLUMN medical_data_id SET DEFAULT nextval('public.medical_data_medical_data_id_seq'::regclass);
 K   ALTER TABLE public.medical_data ALTER COLUMN medical_data_id DROP DEFAULT;
       public          postgres    false    212    213    213            l           2604    18787    personal_data personal_data_id    DEFAULT     �   ALTER TABLE ONLY public.personal_data ALTER COLUMN personal_data_id SET DEFAULT nextval('public.personal_data_personal_data_id_seq'::regclass);
 M   ALTER TABLE public.personal_data ALTER COLUMN personal_data_id DROP DEFAULT;
       public          postgres    false    211    210    211            f           2604    18740    report_result report_id    DEFAULT     �   ALTER TABLE ONLY public.report_result ALTER COLUMN report_id SET DEFAULT nextval('public.report_result_report_id_seq'::regclass);
 F   ALTER TABLE public.report_result ALTER COLUMN report_id DROP DEFAULT;
       public          postgres    false    201    200    201            i           2604    18757    settings settings_id    DEFAULT     |   ALTER TABLE ONLY public.settings ALTER COLUMN settings_id SET DEFAULT nextval('public.settings_settings_id_seq'::regclass);
 C   ALTER TABLE public.settings ALTER COLUMN settings_id DROP DEFAULT;
       public          postgres    false    204    205    205                      0    18746    biodex_report 
   TABLE DATA           9   COPY public.biodex_report (biodex_report_id) FROM stdin;
    public          postgres    false    203   ��                 0    18804    contains 
   TABLE DATA           O   COPY public.contains (report_id, biodex_report_id, elga_report_id) FROM stdin;
    public          postgres    false    214   ��                 0    18776    elga_report 
   TABLE DATA           5   COPY public.elga_report (elga_report_id) FROM stdin;
    public          postgres    false    209   �                 0    18765    exercise_data 
   TABLE DATA           k   COPY public.exercise_data (exercise_id, torque, angle, velocity, muscle, exercise, repetition) FROM stdin;
    public          postgres    false    207   	�                 0    18824    gives_information 
   TABLE DATA           ^   COPY public.gives_information (elga_report_id, personal_data_id, medical_data_id) FROM stdin;
    public          postgres    false    215   ��                 0    18795    medical_data 
   TABLE DATA           C  COPY public.medical_data (medical_data_id, hospital_start_date, hospital_end_date, hospital_address, hospital_department, hospital_admission_number, hospital_name, hospital_contact, hospital_responsible_doctor, diagnosis_state_at_release, diagnosis_summary, diagnosis_future_medication, diagnosis_rehabilitation_aim, diagnosis_recommended_measurements, diagnosis_physical_issue, medical_actions_by_hospital, medical_medication_during_stay, medical_medication_at_arrival, medical_risk_allergies, medical_previous_diseases, medical_anamnesis, medical_admission_reason) FROM stdin;
    public          postgres    false    213   ��                 0    18784    personal_data 
   TABLE DATA           �   COPY public.personal_data (personal_data_id, sv_number, family_status, email, address, legal_guardian, religion, language, insurance, telephone_number, birth_place, birth_date, gender, name_title) FROM stdin;
    public          postgres    false    211   ��                 0    18737    report_result 
   TABLE DATA           >   COPY public.report_result (report_id, created_at) FROM stdin;
    public          postgres    false    201   ,�                 0    18754    settings 
   TABLE DATA           I  COPY public.settings (settings_id, powerhead_orientation, powerhead_height, powerhead_position, powerhead_attachment, powerhead_tilt, seat_height, seat_orientation, seat_tilt, seat_position, hip_flexion, footplate_tilt, knee_flexion, ankle_flexion, shoulder_abduction, shoulder_flexion, elbow_flexion, controller_mode, controller_cushion, controller_sensitivity, controller_rom_upper_limit, controller_rom_lower_limit, controller_rom_percentage, controller_eccentric_speed, controller_passive_speed, controller_torque_limits, controller_pause, controller_isokinetic_speed) FROM stdin;
    public          postgres    false    205   u�                 0    18845    uses 
   TABLE DATA           J   COPY public.uses (biodex_report_id, exercise_id, settings_id) FROM stdin;
    public          postgres    false    216   ^�       +           0    0 "   biodex_report_biodex_report_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.biodex_report_biodex_report_id_seq', 4, true);
          public          postgres    false    202            ,           0    0    elga_report_elga_report_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.elga_report_elga_report_id_seq', 4, true);
          public          postgres    false    208            -           0    0    exercise_data_exercise_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.exercise_data_exercise_id_seq', 4, true);
          public          postgres    false    206            .           0    0     medical_data_medical_data_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.medical_data_medical_data_id_seq', 4, true);
          public          postgres    false    212            /           0    0 "   personal_data_personal_data_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.personal_data_personal_data_id_seq', 4, true);
          public          postgres    false    210            0           0    0    report_result_report_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.report_result_report_id_seq', 4, true);
          public          postgres    false    200            1           0    0    settings_settings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.settings_settings_id_seq', 4, true);
          public          postgres    false    204            q           2606    18751     biodex_report biodex_report_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.biodex_report
    ADD CONSTRAINT biodex_report_pkey PRIMARY KEY (biodex_report_id);
 J   ALTER TABLE ONLY public.biodex_report DROP CONSTRAINT biodex_report_pkey;
       public            postgres    false    203            }           2606    18808    contains contains_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_pkey PRIMARY KEY (report_id, biodex_report_id, elga_report_id);
 @   ALTER TABLE ONLY public.contains DROP CONSTRAINT contains_pkey;
       public            postgres    false    214    214    214            w           2606    18781    elga_report elga_report_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.elga_report
    ADD CONSTRAINT elga_report_pkey PRIMARY KEY (elga_report_id);
 F   ALTER TABLE ONLY public.elga_report DROP CONSTRAINT elga_report_pkey;
       public            postgres    false    209            u           2606    18773     exercise_data exercise_data_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.exercise_data
    ADD CONSTRAINT exercise_data_pkey PRIMARY KEY (exercise_id);
 J   ALTER TABLE ONLY public.exercise_data DROP CONSTRAINT exercise_data_pkey;
       public            postgres    false    207                       2606    18828 (   gives_information gives_information_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.gives_information
    ADD CONSTRAINT gives_information_pkey PRIMARY KEY (elga_report_id, personal_data_id, medical_data_id);
 R   ALTER TABLE ONLY public.gives_information DROP CONSTRAINT gives_information_pkey;
       public            postgres    false    215    215    215            {           2606    18803    medical_data medical_data_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.medical_data
    ADD CONSTRAINT medical_data_pkey PRIMARY KEY (medical_data_id);
 H   ALTER TABLE ONLY public.medical_data DROP CONSTRAINT medical_data_pkey;
       public            postgres    false    213            y           2606    18792     personal_data personal_data_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.personal_data
    ADD CONSTRAINT personal_data_pkey PRIMARY KEY (personal_data_id);
 J   ALTER TABLE ONLY public.personal_data DROP CONSTRAINT personal_data_pkey;
       public            postgres    false    211            o           2606    18743     report_result report_result_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.report_result
    ADD CONSTRAINT report_result_pkey PRIMARY KEY (report_id);
 J   ALTER TABLE ONLY public.report_result DROP CONSTRAINT report_result_pkey;
       public            postgres    false    201            s           2606    18762    settings settings_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (settings_id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            postgres    false    205            �           2606    18849    uses uses_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.uses
    ADD CONSTRAINT uses_pkey PRIMARY KEY (biodex_report_id, exercise_id, settings_id);
 8   ALTER TABLE ONLY public.uses DROP CONSTRAINT uses_pkey;
       public            postgres    false    216    216    216            �           2606    18814 '   contains contains_biodex_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_biodex_report_id_fkey FOREIGN KEY (biodex_report_id) REFERENCES public.biodex_report(biodex_report_id);
 Q   ALTER TABLE ONLY public.contains DROP CONSTRAINT contains_biodex_report_id_fkey;
       public          postgres    false    2929    203    214            �           2606    18819 %   contains contains_elga_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_elga_report_id_fkey FOREIGN KEY (elga_report_id) REFERENCES public.elga_report(elga_report_id);
 O   ALTER TABLE ONLY public.contains DROP CONSTRAINT contains_elga_report_id_fkey;
       public          postgres    false    209    214    2935            �           2606    18809     contains contains_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_report_id_fkey FOREIGN KEY (report_id) REFERENCES public.report_result(report_id);
 J   ALTER TABLE ONLY public.contains DROP CONSTRAINT contains_report_id_fkey;
       public          postgres    false    201    214    2927            �           2606    18829 7   gives_information gives_information_elga_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gives_information
    ADD CONSTRAINT gives_information_elga_report_id_fkey FOREIGN KEY (elga_report_id) REFERENCES public.elga_report(elga_report_id);
 a   ALTER TABLE ONLY public.gives_information DROP CONSTRAINT gives_information_elga_report_id_fkey;
       public          postgres    false    215    209    2935            �           2606    18839 8   gives_information gives_information_medical_data_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gives_information
    ADD CONSTRAINT gives_information_medical_data_id_fkey FOREIGN KEY (medical_data_id) REFERENCES public.medical_data(medical_data_id);
 b   ALTER TABLE ONLY public.gives_information DROP CONSTRAINT gives_information_medical_data_id_fkey;
       public          postgres    false    213    2939    215            �           2606    18834 9   gives_information gives_information_personal_data_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gives_information
    ADD CONSTRAINT gives_information_personal_data_id_fkey FOREIGN KEY (personal_data_id) REFERENCES public.personal_data(personal_data_id);
 c   ALTER TABLE ONLY public.gives_information DROP CONSTRAINT gives_information_personal_data_id_fkey;
       public          postgres    false    211    215    2937            �           2606    18850    uses uses_biodex_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.uses
    ADD CONSTRAINT uses_biodex_report_id_fkey FOREIGN KEY (biodex_report_id) REFERENCES public.biodex_report(biodex_report_id);
 I   ALTER TABLE ONLY public.uses DROP CONSTRAINT uses_biodex_report_id_fkey;
       public          postgres    false    2929    203    216            �           2606    18855    uses uses_exercise_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.uses
    ADD CONSTRAINT uses_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercise_data(exercise_id);
 D   ALTER TABLE ONLY public.uses DROP CONSTRAINT uses_exercise_id_fkey;
       public          postgres    false    2933    207    216            �           2606    18860    uses uses_settings_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.uses
    ADD CONSTRAINT uses_settings_id_fkey FOREIGN KEY (settings_id) REFERENCES public.settings(settings_id);
 D   ALTER TABLE ONLY public.uses DROP CONSTRAINT uses_settings_id_fkey;
       public          postgres    false    216    205    2931                  x�3�2�2�2����� �             x�3�4�4�2�B.cN �2�B�=... 4�w            x�3�2�2�2����� �            x��}M�������Wx��Q$E	w�����`z���&�y�p�����SU,R,��xx��^''�o���7�O}�R���aY޿�ê��s]�/[_�ϩ�Ō��t)��9�cd[G-՟ז��K�-�����qpI�����Ѱ�:����|H�L�H����0SՒ�j���h��~d7�<�q�҄q�ч��Їvl�]tl�<Zϵ���̭�o��O�vS��;�(����o��2����lm��-�Öh����GU�Gռϖ�6�"�-Ø.uQ��������U�����=��K��p�;�a���n��v��ϴ��S}���I�_��bz1g/ �l��!�Ftnn*��A_�S�jf�h��P�̠�L���Eʤ��+]@��6�aF2g�v�'2Y�y9ʩc22�w�	��ݐvv��ô�7��ƍ����[��Xs��A��w=-v1ȓ�Hx}�&�2r"����5�i�����s8e�se$_C�ƚe��`5m3���M�����?�uX��8�X�U >K �$�##���}��k7oD��R�zN���ɜ�o�8��Q2;a���2�S߰Z	5<�9H���:j�j�D��e.�����K{�'�������������:i�'�ރ<e<H�����NЀ.I�jɱ�K�w�,��i|W��b�D`:�)O@�#�s9�F� �^�ڑ��5��v�,v��V�N�D�4+�-N��vU(����k���7�n����1�Y2��1�(,NdF�]!�Q^��<�.�ᾓ�P��I.� ��5�E,m$"K"��L��D)L��ayQ�=^����,���M�=C�OR��4֊!�"��$O�e7���
��#��ə�;�e��Y���\H�?�M%!���m)5'TYJ��$g	Y��Ø*Q� d�%\i3K�����+��nXoI�<!R������i`K���s:l��u�|�p�׺����<�H1�Rȋ��$�"ig��:�r)e،(U�]	�r�"���  �j���N���M!I�f��d���Y�̉�x�-�mђI˞�ңbƒS2��@���Z0��hr2K3u&~d�J��-����̖W+������0o�aU���йL��9y��5�_-�E2`�6Zd�u�,�V=�#KȚ�rd�!��-.�`g���L��֜�l/��F�T��:�ݖ}RC�ʣ�v���[������_2R8�!�<g Z̒�s	�$
-[8��]�Xj[.:���|(��ܛZ	�*­X����Gf�,TTI��k�:�������d��
�'t��Qn�e;�§(�^�ɺ<�Y��uFQ���	n���:�A�5Tz��u�k!wm2��q[x�%`���=*ƅ�����-X�� ;l<�ϝp7�s(�����=
+N�{W��#���t��2�Gh<63E�.����'\_)M:`��lK���vx��&��\S��+g���Ʋ00��F�3�hS��S��~��{�cIj�sX��ⲛ@����E����"��ؔ�[V\����]�5��=jz�"��G��sps���mR�zn�`_�=�4Tz�0���������������uo�V�����	�6��y�z,���x=X!+r��];r��q�(o�z�C)\C��N�K�%\�緌��Q���]�_��� �[&�a�Y��{�MiX��j�#��uyN?<�԰Y����-����a�nY��W�mu�d�62Y��u��1ø��]����ģ,���������Yd?ϚM���y��g%�.�8�,_�y�Dbb�L��RL<�؞\�,������O���j�Ū�_�Ċ�Z�����G���g�K&p�,PH,�)���z-�.�,<�7��|,P$���w�&k?����.W����4�����9�$VV���r��<��Kc{����IN�3Q��'�cw�g���������x��g������j���-���@E��_�I�kt���Fk{\�Y�n�� ER䐳N��%���9����j����a�r�E�j$��
���P�8X�"Q�����ý/ˠ�z_�0���qy_�A�:P�܂dT6�iX���!��R���^컃!��[�Uk$��ޝ�,˻�A!����l'�@�ip�d�P��A#dtH�	��u0+I�\��F��od��`W�a�e�H,�e-	 &�>�a��9���	2Z�na)�c��˻�5�	��!g�b3la ξ[=,0�����`0�Vf���	ɬ�w�jv�Vy4�����vz730�~7���G9� K �k@���8��B�k���� ������w<�p`W�a����L���2���h���� ����o�|�����QAM0
kާ� �~�^�7#QJ�O����t�Ȅo�01x�0�0`����͓�%��X��	�A̵�����&����4i:ƥ#]���2�T+=��#t.c�	�9�1;`i ����l�!��b¤�4�˃��G�����&��A��ʣ��F����`h�5��u��:B�+�d��\�m��p�
�=��l`0n�a�:���g͌t nV����>,�j\>��� �.��5�5΁u��<��dF%Nf��{�AӰo,�Q�Lx�6�M�Ԣ�= �
�o}��
XF�X�I
@�A���L��H � DsF%0W$zx�zM@��\�ۃ�W/�$&`þq�~jXR?���(���z�`c� ���")�^�>=�0�E���6��y�:���)"C/�7f$
DK@>k�"��^��+�6��U��ul�g`��.	�Ͱ8x�ӺA�1KD>�$�nW> #�@ >����I�#\�0�`@�0�j`"�.��Lr����yI�OB�	�=A�xy�a�,��3a��t�yn6�"�	̣�ʻ7Bc�� }
&[Bc�$���4@�Pva��g̛G��*A�G ��2�9Dрsˢ"�yl�.)�Q1GD�PF��� B��<,�� ^M^a�w,=���uL�z���y�����x��&�֤�`� a��*�@�,��f+B!RD2	Z����1�Qe{�Pη�-�vD$��0���Hŋ`G�����p��p�6�Ӱ7��&�v�D����EEoC����o�E�KԼv�r$��H5/�w��3�c�+�w�v��h��.A;�9R���e�cA��s�:��G`��y^�o`7�9�@Q�u��f�9X�;nv��1ء*���߮�u��@�K��a�S���(֡U���X��>�.@^��!���>e
i@?�jy&�\��y�k���e->�AP�H8z�
"���y�30sz`� ����q�6�Fޡ^ca���Q����@����)��<�0WD�
}�%YLQ�GX�Md��.AG&�*`����):�`ة���%���j���e��`CQ	�� j�������[�G���3 X���x�7�d�Id�d���p6��0� �G	��+0����Z�l�F�d-��� � � �X�(��`��Q$���DH�0���=D�D��`��l��������M�@����y�- ���V�d�b=<{X��a�VZ�~��d�(f,���%#,�C6YK0���[��Gؐ�-�Z	�/^����&�"E(��t��^���Y�+�[��W�䣞�����	�Eg8����(���[T(�f��{��e��]}��%���_��W��=h�J���_�e�����'����+ꁗ��̑A��9��#=����>F9�A���rlO_�	�.h�x�1�k��RMV�|�����;��~�:�x�X���B�~i�#"2yc#"#�hD�5:��#ĸ���l��d��q��{ >`#�1f�&��*���~XM��* �lm��:˼�K���}�)9{&묪��A񴃑��5[�|!�9�f�����YU-�c�������,�a�WX���_>��L�^�xݔ|$��G|�Y���1��.�3    t��/Τ��l!�CLK�	y��&ԃ��q���W��u}nF���>�Uԯ�����;O����oKio�My�}��qw�溗%��u���>p�sF�֭&
}�a�~����*ޮX�O��m���Uz�t���]ڴm?�|֤n��)>[�g�ڻX��Mp���)6J#�5�/�i0���⍪`��>���)+P����}���v~Rk�f�rli�D��I�l���0ʧT���zZc�=[���`��[��e�&�	��Q��֓q�a��ag��K���_vu?A%�%���/��/zA'��	�	�~�O�{����JޭI�«1
�Ƹa�K�xw�Y����b�r��o�������ePx�c�{��W��y�/7���Q�gr�����avv���ۮ3�"�Wz�T���*|9�Y����':GrV`����>�l�UU=(����.^����w��$�Չ�C��=��:O�#�����-�^"�E_�^�����>��LI���"*��	_�߲h|Ĩ�W�1��@4�7�����tyyTS�tY�����������5ޡSs^%�#p?#��>�yC��Yz�j1���J���7�Hv�za�ޚe�wl\�hg�\B��_�E�������}�4��'+����=Mx�{��&]R��?���AT�rk Tm5�7��h�0��^�X������!@>"c�������BP�s�\=���.u�-i�9J��1�8����>D�l����/������]X���y�aZf�����ݳ%@+�=f�N�A�z��=��V�g|]�މ^t�1E�c�$ϕ)%wR}-�x��%8��� ����(��"��k���dD��z*/����Ɉ�BM�� He>1�3Gzx��U����1����*�o�$�cl ��U�iL�͆�EiS+��F����M9����?�L5���f�a8)b���n��q���Ú���h{uk�ƫ�_�kc��s���U�¼���߭����P����~�~����sk�U��zy)�u�S���w�d�}�U�8I�n�OpI��������}+^����������?}��_����/_���o�~��������o@��7��w�	K��%E5��Ȅ�Zb��a��w�(��4�e֌j�z��m�EJ� �v���̡��ip6~u¯J�m4B��� �� ~g�o�M�m,�������M;2��f���4��!�1������(x�_�@�v}��?���������˷���_��/����_����s>���ӿ��_���o�7��߳�Q��qx�0���1�GzU>�}g:9O�T'�-�۞>֯���W|����?���8�m�z�B<s��$ER�c�]�C+D��[k���͗u�!�u����{ױ������]@��}�� ��ᬯ��ʢ@�}��hspm��#�s�^�u������K�wA�e��b4��B��B�����tb��Z �&Tz��,\z��>ž���2g��)y�yAS�%2 �[D�ңbF��lاq9Mʥ����IY����L��١Ұ���'.0*�'�Z����n���0�|�e�?�0�2�&%F���!�fCx��"�a���6��H��9��~g9�#��:M[~�L��!�}e{��5Z%��dV�%y��K�NC�ʣ�v���hQf������/Q;�s�����")f��h��D����Km��bN�͈_)X<���J�T`eAٱ��r�L�老�-�>p�F1��N�Nqq���NȮ��O�o�܄�v\aߦN
�"9�uyz�ܛ댢��zę�6x�dZC�׭\�r�&K���7�PRb&�r�GŸ�~�
\�[�5)%��:���3�������4���I��\Ɋ��[ol���&-�H�O�E�P�a8lf��K]*������ƿ�X���K��Ϙ��vx��&��\w�Iqv�ڄ�Ʋ00
#Xi�H�Z&֘����?���rDLj�sXUM�S7�Tw�̋$�E:96���<(�^q���Ń^˲�J�����,�z���Ej��4��k���P@�*���\#�7����B�"�^;Ls9��8�{4�;3�~�i��3~��e����k޸K��<^GVȊ\�p׎��~\;����P��P�S��Rf	���-c�a5��G�{여�=@�:�S���z��i����!��+��l]�ӏ|�5,CV��=S�eN�U��o��[�a厌��_���3�1����xT^[�@V*o���55l+��Ѱ�:Wq{�0��!=3�#�:*[�L�w����hU������T]��83ԗ�Ў���΁��G빶�۞���$U������w0�V#�j�q=2ִ�V�����=��K��>�;矓��N����L��\���R�ON������s�6��S*�kcȣ�k�r�!8��=ub�f��6i��)?��oi�a�Ώ����'���d�����P��8ԕǳG����W������8�c�?<�,�T�a�� |7yw@�����/q5@��v���N��\._-�\y,��V<��ϣ���[j�n��=��{ߥ;�|Q��ns/���9Q��;���h�G�Q�x� �W�Í�#>�?x)��_�ʟ��s]��F��Q����u�#f�s�U�Q�->��	��������,2�����=K�;��g���� `/u�H��Zt;S���=�y"n��'ZK�*��D�ŵMC�D���Vz1I����Nd�|�����#x]*�}'-�KW�w�N/��5��p�z������HE���Dș�7��N�����N
���V�3�p%y:�(��{��5[o��[Zw��>#�ѿ��~�̡͎��`�Q�~�m�f�����ӓ��[�T�-�2xk�al�a���@��#�3m��W5�qƗ�A��;��W�m����U��쾤�&���(������g&�7�CU(�鎟Q/�YPDA���ā⭰�`�p<+~��Y����P}���k$W���9�V�߮�[��	T�!z�?č�vw��i�z����[�	?e�p�1��DP��.tf�J�����Q���;z�će�o�:�_Ǟ��/�N+���0���&�}|����V$3����gT�K&J2�$�ʸ�^��f�B���B�`\�LP�$f�/�9�1g=҈Vx�)�;��,~O�DA��
�G,�"1�<G@FC�F���g7���1ð@1��[��O����@�JVǯꡚif^
�+g�/�_,��u8
���huԍ*�*p٤#���;� ���1�T����v�E�Ж�h��E7L/��ex�?l�@@̀�eރ�2Q��[4M��I�忞o���cm飊@4��`�q��뤐X�k�0E���U�`k���z��O�'�ſzq��&�L�@#6���f�q��(f���F��?�2����ք}j�z�߮�;i�k�`}5�U3�m!�w9��q�Æ�h�(�r@����E�X�TH�h��b��=�0�N��9�zĪ�����F&�6�A����	@�i����a`,�	?W<���#^�%�u�
�<[� f���̑����˝��W=3��� 6a�3Ꮃ �a7�u��v��Q����@������J���hw�Y%	y%J�^$�mCIIDG&�-����5O�DG��,,6t�I �'���Yf����n,q�xpQ)�j�F���PRC�<.	0�F`��3 X���2�(o�`������d��� 2 ~B5ð뼃G��ހ��h�*(c)@�G�$�HR� 9�
{���3��ܼ!䈟����%,ź�Q��
��b	*��"�G�W�#F:H#��������#G��|\�*w@s��J�~	��##jh^g�Hע����-xX���a�w.v���?Sa2Y�Z��k��@�K���̹�,�%z��͜H���W6�c�����-��<�I�H�l@8���%��=KEp�� u!b*��&8�.A7�9�0�	��    4j��n<D0�N��6��oQ,�F9��Q�L��2k9u#�=�n5l�qQ�Ku@@iPL�6�/Ÿ���G���DM�%�E�/��2��ʄю���v��A!̡��(�p��T{����z`=ʁ�q h5k�rB,�)���>�(W��x4����5AD�&���>���q��1����M?�I����c���rX�'��edd���H,䍍��ģ���\1�-�7����{���E��`f�y���S�H��Xe?�&�g�J�Ա�2��Rů4q�zJΞ�:�j9.pP<�`$v�C�;_�yN�Y��.��n,i��w�s#�'[���Y�黨0&�=+̿|Ƴ�J+�l�)�H��� P�B~$+�3���D�[�a�3�P�.��ق�$��?�_��b�Kf��<k6��G.�AVV��4��㼳D|]�M���3��J1�c{r��8�����j?!V۫A�N+V
|u�b�pw����E���#IA��(�Pw#ᜅ�X��qw9t�|vb9z��S�h�~`��=�{ƝO�Z��Y���������~'9��ٳ���q�g-T�{���I�C�:���tz��LB��A2�a�R�($
�e�?Q4q�>:�8XCA�؋�
9@&/�f*�7�}�F�F��f�W� ��A����/;y��A�M<#_ot�L�ʝ�|杽t&� ��+� |F��8�E'^��,� {g/y@�|cG�c�|��ð�#���iؚ�AȚ��n�7>���<�ݹy��|��{�ot���79����31r�@�1�&{?vN��Ջ����0̬���O�HH�0�N�N�|
&�������y��|��< ���@�s1l;\@7��]?�"��� N}XyV�����P㼝�oy�<ɌJ���;v�H1��G��Jve����2�#f�*�����I����Kp1�q��a����\��_�p���	�^z���~F	gR��}�����'�q�/]و� ���~��ڀ�WU ����A�o��?�� ^�ڀ�η` av�_Ϸ����)�m���|����xy�۟�������7B��<گ�����. x諽 ��Ҳ96?L�T�ܛ&�g��R#�@K/����K���:;��R�(<V5
k�fKm9iI�_7y���C���Ҏ�����Vt�X�怐� h�$��B�f!�Wd!�)�,G?Պ�qdT�6Eh�Z:t�,���?1H��(�B�S�q���h�}b�c�7�QE����)�nGDVt�j�B�7���a���f�X��X&"9������~5ʢ�jq���oac׀Fc��L��B�/����/�k�6�Dj���C4�L��y���Q����!@>"c���:�B��!�������`��i�`�5�e��y��Mt��֪,�!����o�}�-%ޟ�_"�_ڔ��-jo]Rf�����i�hŻo6��`pM�n%��]EQy���I^�ſ4�/b�ЄN0^��ʔ�Q�X-`�5v��/<r�.� ��U��B�DU��F�2"&{�I�ȋ��?2=�z�Nđ觉�Q���:�q����ug�)^�
�2(ۖD������� ��16���*:�F����EiS+��F����>����S3�T���9;����<>~v[M�~�D�?u4i��U�����'�[kݦ��f�8'm��;y���^��s���a�q���c�V�L�����m�p��X�T��jF�M���Ƽ�mX�\�r'�Ԡ��^���t�澵S��ۂ���6�����7Ul�6�.O�s%[���:b#�U�����m������Ju���u/KvT������U�mTs��):���P�2~�m�]7���g����Ҧm�x�S(��B�S�|���}b�F=���	6T�����6��
ų��w�(O��;��j�g˔{�7sח$��N��W��]W�he�ݻٵ�ו�}�}�Np�%W�����U��G����jw�h���{3�%��"��P&���H����x|g\
7����q�F���2>��
^��ۯj��\�}�[��R�Kx2�/�����_t�/���ӳ7]޹�<?��vz|=��jo��/�H����I�l)�qj��^��ӽ�_�}[���������g��M�������_���}�o��?�������/�~���~���/������×߀~�O�����6���?�����~�ߘ��������o�ʸ�y�?��h^D~M��~��&�kE�,�i�4KȊ6�8l��z��i�q���C��:Ў�^�ҋ�����Ra����9楏�)c�rhU���U�Y�E�樫�Je�T��]�0<��x���H��?����v��|���ܻX�2g9���‧>��[�IM�q�����v�.\p��[������Y��3��*[�;�'nН#�s�2ج���%��-����O�aL�h�K��2s世�|d��H���A�@��H���|0G��5������E�����B���Ri����<���hQfs��Q�Kq�S�����8V$�,9��H���r�K�-g,�-�h��fį��*H�rojEJ*�Yp";V^].pw\*���5�av�t��b�W�]�+B����6ʭ�l��m*���*�#ᔧ7����^'\K���uB�j�����"�-�ɛ,G���6���?3�=����K��y�/ƅ��U���V�I)���`7<gs�Pt���&���yÆUɢ��[Rl��&-��%�����W��4NO�z,��/&��5��m�3&���DN��_����D��l��e	+!mVaք0�KB��2��C���S�1���aU5�O�u����I���5l��x�O��J߮N�������[%asiY����X����B�6X���G��J��L���g�E~���j�����r(�2	�U���U������	����y�z,���x=X!+r�D]�>��q�6n�z�&\C��~�K�%\+ȷ���Y���]�_��� ���Ȱ��m���V��ج�7��W��ٺ<�>�(kX����	z�\���S��o��[�a�ؗ�{�kR|��|�ܩW�p��Q�ym�S�T�bM�kj.�Rݎ�+:�̔�?��:*[�.�S�����hU�t����T��83ԗjܓw�s���^Xq�nm'�Rj�C��<[�t�ى��V�b[��z�F��%..��l�oǏ��gc������=S8B����{�ON���3����6��S*�kcȣ��ׇ��!8��=���b��6i�,&?��.)<��F�4�O�Y���LNd���rNy��D�wʓˣ��G��+Rd��N�O/��뎜���˃������,�_���q�������9\�Õ<<\=�=I�by,}��V<���c���Z�Z����;ʥ��|O��n/Q��9Q���ۢ��h�G=���	���4�9����`G�ۏ�k��zm���;��o��p��G��?�ڲ��w��s�,���1���*�:
���v�=g-��)�]����e���0����Jp"��ڦ!��X\�*�#�6�G'�A��ryի�ŮN���՜ӛۇR��;-\�I]����{�L��hR���r~1D��3�_y�po��d��<�[���=�����?࣬��t������v?b�~�]�lD�xO��T'���H� �R:����Z �G�����cB��7v���K�}I��y��+P �B�RZ1ƥ��4�6Sx2~#�Q���n#@���
��d wƩ�O
�i-�ӌ�G�`Էu�0ҳ�w��D���.�Š*���$��O�΀�� �aa1���F��<0*!:��Q��"D�2�D�H��#P�vH�u5ɮ�Ƣu$(-�P0;���a�<x��\@� j�#N��AQ�Qk�ߡZ@�b`�y^�����k���UvUH&X���Q	������+��@s��������k�ò� q  �U�j��fJ3D[b�	�]=0��fb�t��b#���y6�HD-Ć#�8�<�i�o���=��.0��R�A �	t��8d�uRH,�3Eŝ��Ƙ�ak��o0,����Y���0
�u�@� tj��	ufw�b�H��9W܃��oEؗ�a��	ʐ������=���b!��#��`��X0њ�h�(�p�S�+h
Ul4G�yJpR�	��Ɔ���:wσ�����:gȂ��(k�<D��Z�n�~��*��X�����	@�i�yd0��b�3���X�a�=����/(��lM��U�3G�n�@���W=3�΍N�7�f�������h;�w'~qw��װ���rg�W���qZ�=:��$����7Td�a�1�2�-���!��0)�GE/<*�`�P'0���T��ɓe�H,����E�_��<wSBG�2@G��R��6��g�z� ��*J8��o�Y؇�+ T���2���1D��J���E)��|M4��뼃F��ހ��hث���J���<�#�=8��߃��'�I�0B(���CGV5$a)�mJtT���G5���3x�^g����ˑ0��!^l�HH�q��}�e�`r200<98dkXr|�o�Y��,x�Ρ0bT$|k�����CB"��!�C��D߹0؉�&xR�L��d1�k��˯���",�B 1�Z B�=��f�Q���W2�cm�������<�G�@���p�)fD��1:E"q��=KEp� u!b�|�i���t����� p�� ��zl���d��)�W�YVm '`n�}�O�-����H� �A!a|۴�ߢ����~��DP"\T�r�/(�̩L�X��H��0���	ā�`�c��G���p��W�p l�f|=
�pB,)��
�6 \A,b]� ���� ����SS��V�=����٠v�?�o�e��3B�X= !�)~t��jM?h�!Ya $�%  Lpl�T�6�U�`�J$<C�v�P>�@P"��a:.�r��%F�չo=%g�d�U�8(�v03�ǚ-v���P���]�������nO�,p�Xl]&�g����2�8�߳���g<���������DZ�d�Zȏd4�"��n�<lc���e�?[��Y��/Yg����Ǉ)�"G_��4���ׁ��Λ&k�lߕb�q���2gq�g���~B��W�.V��*&�Z��Q���0���E.��#IA�(�,�~$����qb�2�.'�V�Ю@,G��uʜ���X\�G�bϸ��\���"+�?�3��r^���¯�$�5:{VX���=�󬅊r�^\�")r�Y'��N�ٜIH�b5Hf�W�`�D�����6�6��0����:�PT�Pؒ�e�SaT��t�5�}�:���O��9q���<�AMT���#0��0��^^"��Ͼ��-:��{*�B�	�w����9v��u�̇^>+:C�����+��K0��|�È���؝�����޻��FG�z��
?H<#Gt_���9BRW/F홒�0�&~�?#� ��0:;q��	�p�f�*�ov� ��M �\�?��}o��������H���u ����̻�����y;(#����9�X���}#��Nbv>�����|P�;�Oʤ�������d��$zG�A\q�%O��N�H��.y�/�����|�E'����vĥ�I	�"��s�,�\>�����Y%�zq�.����~�5 ����rA�˲� {�=� @ܝ��v��O➼���"� �@��O �Yy@:�K7 <��� Ȭi� FF�^³}C��v��,��J����X���K�E���+��L�o�rҶ�n� ���p��C������+S
�S��"4�|�^nTRlF i!�)*���^3x|�8a���g�$�a��W�oUP�]��������
{���ǋ��h��͗�]��T 5��	���X�X5��!�ч��ۈ���r�VP�T��t�E0����u��a܇��	��y����k�9��0�8ڎ�~�_�Z�}�cÿ苾觡aƘ�x�֔���h��}� ^�Go��
����{�W2�N�>/]B��櫣�؋�A�c4t�rI�#:���ײ�H��[�)�*�8ҳ���\D�K�FE�[`�a�a�d���.x�$z$��U�^m����0���LrM�{��d�5O/�2(K�D	��;2k��`����j����+t�z(�,7������b���M��<���ŭ��+���&o��^5�Z�6%��إ�͋}'O4V��zNw#d���:n�B�~���{�7���m��>�-�a5]�7��Y��6`z����j��k�Z�I�u'�ک�8�mA{�p4�
�OV�*�b���ܹ��B�N�����]��|I�=����Ju�
���i:�M6i ܪr6*"����v��i?۶��W��3PX�>(��)�nU����^\�ObwS��O�-��Y��7��_[x6P�N��W(���������x�֙�]��Dw��:�5�*'@+��.�g�$?���E�}��G'6:�N����H/ׇ ��?_���_��3#��i�c����y\
�g ������#�/&��:�xWSz��+�w�ǔ�oN^�:����2g㿘�e�7#���ن{�|i/�+��ށޠ���do�I/��D���IOՀ?[�g��繵>��z������j\mm&�5|U����o����~���ۿ���˷���/?���O?��O?|�������o����.��v             x�3�4�4�2�B.cN �2�B�=... 4�w         #  x���n�6���S̥�.�v%[��=Չ��p�Y(z���̚"�rb?�^�����Q�w ��iO�Cj�o~�b���C��tLMMi�>�tҧiS5>|]�O��rbn�҅Jzϔ�&4�Z�����J��K��y�*q�RW��4�tc*1ݧ�a6�i-Kn<-6*H-�eC����0�ƔtI���E��v[_�ɨm�w��O3ק���*�պ�ƈk�@�͕&V�bhp���:��*����.IT��;Yk��;�Q,fJ�y#�.�����Z>t�w��V���*<~?/��	��t��ҙ-��I��ĢXY�DOd�n�b�[v���^�ȎM�t��O�f�5�=1��8t�Feh���j���$��|a��ֻ�]Q��m�MF����TW⚍*��(�֩b�͡�v�dF�	T�)d�EhܞrV�c)�`����d�f����&Ub�.�hw�OWE�9�$�)�����9vI�>b'h4�ר ΢��f�4�R2Hӌč,�ն��s!Z#�����d9�VY��!x�d��4�f@ћCķ�ޥ pқ�=(;◷��P�k��7.(O��뼠#}����Y���	uc���X"MI�ޓ�VF��{	۩hӛ�vy��K���Ѐ�7�w���)�c˝�ac�  of�̐��j*�e�F�U�����+�X5��m	 "�����d�_m�-�50(���:ĭ,��K��	p��j-^���dH�i��5><�7�%�P�,T)(Xg�h�d�1'i�|�pgX*(W!��|G�\l>r�-�ݨ� �h���E���%u�"��t��[�]���u����;A� (i�e4\���]�Z)KY���H,�+`�3�f��Ӹ;_I���7�("�η��\�=�;cƀc{�T�i�;p9Hǽ,�z��.���o�9���:g�}�Z�^�1_��-"�r>FPG
;�=Fଋ$>M��wCآ�ǐ�����:�?�h�aM�h����L��w!���i�jUǛ��wY���'�z��ֆ�:ُ_�_��������t�h[u            x��Mn�0���)f� � Ɋlg���O[Hk �t3��6a���Q�2����/֡Z��� Ն��y�{�U._Q�E��g�jG�&;��|�^6;)�{v���r������ �"̲,�;����m����[�m�V�װr�>8cԧ��N�f����3�W�4Y�����]���^I
K�|k:8~�A�h���@kM�����'uQN����Y�e��Ue
�t��.O߬5�Y��ВpÝ��j1�U���3��R���b�5�n;:Pd��n;X&
 ������8����x�'��>�l8W=aC ��{-.{�L�'=��_}i�Q&�=ӆ��� �;�U�6G�9���!�f�D1U�b�EUT),��k�X�U�r�$�_r����bZ^V��B�������cf��hڴ��u���c���\K�"��[�]���!����seP�7����Up'�j�/PP/�M�88���i��ql5�ɾG; �,GH��U���0*J����׺7�<�݆1��7� ��	,oo��i�$? �b[�         9   x�]ȱ  �ڟ�0�C�a��Ck���C.�Ӹ��%Bm��D�=��6��] 
�f         �   x�e�An� EןSp�cc�˨j��"e�M6�P5	L�k�=Yl5i��Fh�7�`0_W�
Z�%F����\Y7���0@<*.2%kت�&��������	ˠ�Uw�ѫ�H�6�v)d���}?��<���-�_s|gO�I�6�`R�hti2_�K���F�� ��i�����J�����Zb�ll�����u}����X��[�w(�+!�7o6X:             x�3�4�4�2�B.cN �2�B�=... 4�w     