PGDMP          )        
         y            BiodexDB    13.1    13.1 W                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    209   Ы                 0    18765    exercise_data 
   TABLE DATA           k   COPY public.exercise_data (exercise_id, torque, angle, velocity, muscle, exercise, repetition) FROM stdin;
    public          postgres    false    207   ��                 0    18824    gives_information 
   TABLE DATA           ^   COPY public.gives_information (elga_report_id, personal_data_id, medical_data_id) FROM stdin;
    public          postgres    false    215   
�                 0    18795    medical_data 
   TABLE DATA           C  COPY public.medical_data (medical_data_id, hospital_start_date, hospital_end_date, hospital_address, hospital_department, hospital_admission_number, hospital_name, hospital_contact, hospital_responsible_doctor, diagnosis_state_at_release, diagnosis_summary, diagnosis_future_medication, diagnosis_rehabilitation_aim, diagnosis_recommended_measurements, diagnosis_physical_issue, medical_actions_by_hospital, medical_medication_during_stay, medical_medication_at_arrival, medical_risk_allergies, medical_previous_diseases, medical_anamnesis, medical_admission_reason) FROM stdin;
    public          postgres    false    213   '�                 0    18784    personal_data 
   TABLE DATA           �   COPY public.personal_data (personal_data_id, sv_number, family_status, email, address, legal_guardian, religion, language, insurance, telephone_number, birth_place, birth_date, gender, name_title) FROM stdin;
    public          postgres    false    211   D�                 0    18737    report_result 
   TABLE DATA           >   COPY public.report_result (report_id, created_at) FROM stdin;
    public          postgres    false    201   a�                 0    18754    settings 
   TABLE DATA           I  COPY public.settings (settings_id, powerhead_orientation, powerhead_height, powerhead_position, powerhead_attachment, powerhead_tilt, seat_height, seat_orientation, seat_tilt, seat_position, hip_flexion, footplate_tilt, knee_flexion, ankle_flexion, shoulder_abduction, shoulder_flexion, elbow_flexion, controller_mode, controller_cushion, controller_sensitivity, controller_rom_upper_limit, controller_rom_lower_limit, controller_rom_percentage, controller_eccentric_speed, controller_passive_speed, controller_torque_limits, controller_pause, controller_isokinetic_speed) FROM stdin;
    public          postgres    false    205   ~�                 0    18845    uses 
   TABLE DATA           J   COPY public.uses (biodex_report_id, exercise_id, settings_id) FROM stdin;
    public          postgres    false    216   ��       +           0    0 "   biodex_report_biodex_report_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.biodex_report_biodex_report_id_seq', 1, false);
          public          postgres    false    202            ,           0    0    elga_report_elga_report_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.elga_report_elga_report_id_seq', 1, false);
          public          postgres    false    208            -           0    0    exercise_data_exercise_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.exercise_data_exercise_id_seq', 1, false);
          public          postgres    false    206            .           0    0     medical_data_medical_data_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.medical_data_medical_data_id_seq', 1, false);
          public          postgres    false    212            /           0    0 "   personal_data_personal_data_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.personal_data_personal_data_id_seq', 1, false);
          public          postgres    false    210            0           0    0    report_result_report_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.report_result_report_id_seq', 1, false);
          public          postgres    false    200            1           0    0    settings_settings_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.settings_settings_id_seq', 1, false);
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
       public          postgres    false    216    205    2931                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     