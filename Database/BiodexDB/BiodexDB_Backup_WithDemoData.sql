PGDMP     /    5                 y            BiodexDB    13.1    13.1 r    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            >           1262    18324    BiodexDB    DATABASE     g   CREATE DATABASE "BiodexDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'German_Austria.1252';
    DROP DATABASE "BiodexDB";
                postgres    false                       1255    18683    display_selection(text)    FUNCTION     �  CREATE FUNCTION public.display_selection(_selection text) RETURNS TABLE(id bigint, created_at timestamp without time zone, exercise character varying, muscle character varying, repetition character varying, name_title character varying)
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
       public          postgres    false            �            1255    26921    get_ankle_flexion(integer)    FUNCTION     �   CREATE FUNCTION public.get_ankle_flexion(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT ankle_flexion FROM settings WHERE settings_id = _id);
END $$;
 5   DROP FUNCTION public.get_ankle_flexion(_id integer);
       public          postgres    false            �            1255    26909    get_controller_cushion(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_cushion(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_cushion FROM settings WHERE settings_id = _id);
END $$;
 :   DROP FUNCTION public.get_controller_cushion(_id integer);
       public          postgres    false            �            1255    26914 '   get_controller_eccentric_speed(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_eccentric_speed(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_eccentric_speed FROM settings WHERE settings_id = _id);
END $$;
 B   DROP FUNCTION public.get_controller_eccentric_speed(_id integer);
       public          postgres    false            �            1255    26918 (   get_controller_isokinetic_speed(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_isokinetic_speed(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_isokinetic_speed FROM settings WHERE settings_id = _id);
END $$;
 C   DROP FUNCTION public.get_controller_isokinetic_speed(_id integer);
       public          postgres    false            �            1255    26908    get_controller_mode(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_mode(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_mode FROM settings WHERE settings_id = _id);
END $$;
 7   DROP FUNCTION public.get_controller_mode(_id integer);
       public          postgres    false            �            1255    26915 %   get_controller_passive_speed(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_passive_speed(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_passive_speed FROM settings WHERE settings_id = _id);
END $$;
 @   DROP FUNCTION public.get_controller_passive_speed(_id integer);
       public          postgres    false            �            1255    26917    get_controller_pause(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_pause(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_pause FROM settings WHERE settings_id = _id);
END $$;
 8   DROP FUNCTION public.get_controller_pause(_id integer);
       public          postgres    false            �            1255    26912 '   get_controller_rom_lower_limit(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_rom_lower_limit(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_rom_lower_limit FROM settings WHERE settings_id = _id);
END $$;
 B   DROP FUNCTION public.get_controller_rom_lower_limit(_id integer);
       public          postgres    false            �            1255    26913 &   get_controller_rom_percentage(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_rom_percentage(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_rom_percentage FROM settings WHERE settings_id = _id);
END $$;
 A   DROP FUNCTION public.get_controller_rom_percentage(_id integer);
       public          postgres    false            �            1255    26911 '   get_controller_rom_upper_limit(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_rom_upper_limit(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_rom_upper_limit FROM settings WHERE settings_id = _id);
END $$;
 B   DROP FUNCTION public.get_controller_rom_upper_limit(_id integer);
       public          postgres    false            �            1255    26910 #   get_controller_sensitivity(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_sensitivity(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_sensitivity FROM settings WHERE settings_id = _id);
END $$;
 >   DROP FUNCTION public.get_controller_sensitivity(_id integer);
       public          postgres    false            �            1255    26916 %   get_controller_torque_limits(integer)    FUNCTION     �   CREATE FUNCTION public.get_controller_torque_limits(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT controller_torque_limits FROM settings WHERE settings_id = _id);
END $$;
 @   DROP FUNCTION public.get_controller_torque_limits(_id integer);
       public          postgres    false                       1255    26924    get_elbow_flexion(integer)    FUNCTION     �   CREATE FUNCTION public.get_elbow_flexion(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT elbow_flexion FROM settings WHERE settings_id = _id);
END $$;
 5   DROP FUNCTION public.get_elbow_flexion(_id integer);
       public          postgres    false                       1255    26927    get_footplate_tilt(integer)    FUNCTION     �   CREATE FUNCTION public.get_footplate_tilt(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT footplate_tilt FROM settings WHERE settings_id = _id);
END $$;
 6   DROP FUNCTION public.get_footplate_tilt(_id integer);
       public          postgres    false            �            1255    26919    get_hip_flexion(integer)    FUNCTION     �   CREATE FUNCTION public.get_hip_flexion(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT hip_flexion FROM settings WHERE settings_id = _id);
END $$;
 3   DROP FUNCTION public.get_hip_flexion(_id integer);
       public          postgres    false            �            1255    26920    get_knee_flexion(integer)    FUNCTION     �   CREATE FUNCTION public.get_knee_flexion(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT knee_flexion FROM settings WHERE settings_id = _id);
END $$;
 4   DROP FUNCTION public.get_knee_flexion(_id integer);
       public          postgres    false            �            1255    26899    get_porientation(integer)    FUNCTION     �   CREATE FUNCTION public.get_porientation(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT powerhead_orientation FROM settings WHERE settings_id = _id);
END $$;
 4   DROP FUNCTION public.get_porientation(_id integer);
       public          postgres    false            �            1255    26902 !   get_powerhead_attachment(integer)    FUNCTION     �   CREATE FUNCTION public.get_powerhead_attachment(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT powerhead_attachment FROM settings WHERE settings_id = _id);
END $$;
 <   DROP FUNCTION public.get_powerhead_attachment(_id integer);
       public          postgres    false            �            1255    26900    get_powerhead_height(integer)    FUNCTION     �   CREATE FUNCTION public.get_powerhead_height(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT powerhead_height FROM settings WHERE settings_id = _id);
END $$;
 8   DROP FUNCTION public.get_powerhead_height(_id integer);
       public          postgres    false            �            1255    26901    get_powerhead_position(integer)    FUNCTION     �   CREATE FUNCTION public.get_powerhead_position(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT powerhead_position FROM settings WHERE settings_id = _id);
END $$;
 :   DROP FUNCTION public.get_powerhead_position(_id integer);
       public          postgres    false            �            1255    26903    get_powerhead_tilt(integer)    FUNCTION     �   CREATE FUNCTION public.get_powerhead_tilt(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT powerhead_tilt FROM settings WHERE settings_id = _id);
END $$;
 6   DROP FUNCTION public.get_powerhead_tilt(_id integer);
       public          postgres    false            �            1255    26904    get_seat_height(integer)    FUNCTION     �   CREATE FUNCTION public.get_seat_height(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT seat_height FROM settings WHERE settings_id = _id);
END $$;
 3   DROP FUNCTION public.get_seat_height(_id integer);
       public          postgres    false            �            1255    26905    get_seat_orientation(integer)    FUNCTION     �   CREATE FUNCTION public.get_seat_orientation(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT seat_orientation FROM settings WHERE settings_id = _id);
END $$;
 8   DROP FUNCTION public.get_seat_orientation(_id integer);
       public          postgres    false            �            1255    26907    get_seat_position(integer)    FUNCTION     �   CREATE FUNCTION public.get_seat_position(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT seat_position FROM settings WHERE settings_id = _id);
END $$;
 5   DROP FUNCTION public.get_seat_position(_id integer);
       public          postgres    false            �            1255    26906    get_seat_tilt(integer)    FUNCTION     �   CREATE FUNCTION public.get_seat_tilt(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT seat_tilt FROM settings WHERE settings_id = _id);
END $$;
 1   DROP FUNCTION public.get_seat_tilt(_id integer);
       public          postgres    false                        1255    26922    get_shoulder_abduction(integer)    FUNCTION     �   CREATE FUNCTION public.get_shoulder_abduction(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT shoulder_abduction FROM settings WHERE settings_id = _id);
END $$;
 :   DROP FUNCTION public.get_shoulder_abduction(_id integer);
       public          postgres    false                       1255    26923    get_shoulder_flexion(integer)    FUNCTION     �   CREATE FUNCTION public.get_shoulder_flexion(_id integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN (SELECT shoulder_flexion FROM settings WHERE settings_id = _id);
END $$;
 8   DROP FUNCTION public.get_shoulder_flexion(_id integer);
       public          postgres    false                       1255    18604    insert_biodex_report()    FUNCTION     �   CREATE FUNCTION public.insert_biodex_report() RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO biodex_report DEFAULT VALUES;
	
	IF FOUND THEN RETURN (SELECT max(biodex_report_id) FROM biodex_report);
	ELSE RETURN 0;
	END IF;
	
END $$;
 -   DROP FUNCTION public.insert_biodex_report();
       public          postgres    false                       1255    18674 *   insert_contains(integer, integer, integer)    FUNCTION     `  CREATE FUNCTION public.insert_contains(_report_id integer, _biodex_report_id integer, _elga_report_id integer) RETURNS integer
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
       public          postgres    false                       1255    18670    insert_elga_report()    FUNCTION     �   CREATE FUNCTION public.insert_elga_report() RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO elga_report DEFAULT VALUES;
	
	IF FOUND THEN RETURN (SELECT max(elga_report_id) FROM elga_report);
	ELSE RETURN 0;
	END IF;
	
END $$;
 +   DROP FUNCTION public.insert_elga_report();
       public          postgres    false                       1255    18603 �   insert_exercise_data(character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     =  CREATE FUNCTION public.insert_exercise_data(_torque character varying, _angle character varying, _velocity character varying, _muscle character varying, _exercise character varying, _repetition character varying) RETURNS integer
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
       public          postgres    false                       1255    18673 3   insert_gives_information(integer, integer, integer)    FUNCTION     �  CREATE FUNCTION public.insert_gives_information(_elga_report_id integer, _personal_data_id integer, _medical_data_id integer) RETURNS integer
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
       public          postgres    false                       1255    18487 �  insert_medical_data(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     [	  CREATE FUNCTION public.insert_medical_data(_hospital_start_date character varying, _hospital_end_date character varying, _hospital_address character varying, _hospital_department character varying, _hospital_admission_number character varying, _hospital_name character varying, _hospital_contact character varying, _hospital_responsible_doctor character varying, _diagnosis_state_at_release character varying, _diagnosis_summary character varying, _diagnosis_future_medication character varying, _diagnosis_rehabilitation_aim character varying, _diagnosis_recommended_measurements character varying, _diagnosis_physical_issue character varying, _medical_actions_by_hospital character varying, _medical_medication_during_stay character varying, _medical_medication_at_arrival character varying, _medical_risk_allergies character varying, _medical_previous_diseases character varying, _medical_anamnesis character varying, _medical_admission_reason character varying) RETURNS integer
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
       public          postgres    false            	           1255    18671    insert_report_result()    FUNCTION     �   CREATE FUNCTION public.insert_report_result() RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO report_result DEFAULT VALUES;
	
	IF FOUND THEN RETURN (SELECT max(report_id) FROM report_result);
	ELSE RETURN 0;
	END IF;
	
END $$;
 -   DROP FUNCTION public.insert_report_result();
       public          postgres    false                       1255    18484   insert_settings(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying)    FUNCTION     
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
       public          postgres    false            
           1255    18672 &   insert_uses(integer, integer, integer)    FUNCTION     U  CREATE FUNCTION public.insert_uses(_biodex_report_id integer, _exercise_id integer, _settings_id integer) RETURNS integer
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
       public          postgres    false                       1255    18926    renew_ids()    FUNCTION     (  CREATE FUNCTION public.renew_ids() RETURNS integer
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
       public          postgres    false    203            ?           0    0 "   biodex_report_biodex_report_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.biodex_report_biodex_report_id_seq OWNED BY public.biodex_report.biodex_report_id;
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
       public          postgres    false    209            @           0    0    elga_report_elga_report_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.elga_report_elga_report_id_seq OWNED BY public.elga_report.elga_report_id;
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
       public          postgres    false    207            A           0    0    exercise_data_exercise_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.exercise_data_exercise_id_seq OWNED BY public.exercise_data.exercise_id;
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
       public          postgres    false    213            B           0    0     medical_data_medical_data_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.medical_data_medical_data_id_seq OWNED BY public.medical_data.medical_data_id;
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
       public          postgres    false    211            C           0    0 "   personal_data_personal_data_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.personal_data_personal_data_id_seq OWNED BY public.personal_data.personal_data_id;
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
       public          postgres    false    201            D           0    0    report_result_report_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.report_result_report_id_seq OWNED BY public.report_result.report_id;
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
       public          postgres    false    205            E           0    0    settings_settings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.settings_settings_id_seq OWNED BY public.settings.settings_id;
          public          postgres    false    204            �            1259    18845    uses    TABLE     �   CREATE TABLE public.uses (
    biodex_report_id bigint NOT NULL,
    exercise_id bigint NOT NULL,
    settings_id bigint NOT NULL
);
    DROP TABLE public.uses;
       public         heap    postgres    false            �           2604    18749    biodex_report biodex_report_id    DEFAULT     �   ALTER TABLE ONLY public.biodex_report ALTER COLUMN biodex_report_id SET DEFAULT nextval('public.biodex_report_biodex_report_id_seq'::regclass);
 M   ALTER TABLE public.biodex_report ALTER COLUMN biodex_report_id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    18779    elga_report elga_report_id    DEFAULT     �   ALTER TABLE ONLY public.elga_report ALTER COLUMN elga_report_id SET DEFAULT nextval('public.elga_report_elga_report_id_seq'::regclass);
 I   ALTER TABLE public.elga_report ALTER COLUMN elga_report_id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    18768    exercise_data exercise_id    DEFAULT     �   ALTER TABLE ONLY public.exercise_data ALTER COLUMN exercise_id SET DEFAULT nextval('public.exercise_data_exercise_id_seq'::regclass);
 H   ALTER TABLE public.exercise_data ALTER COLUMN exercise_id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    18798    medical_data medical_data_id    DEFAULT     �   ALTER TABLE ONLY public.medical_data ALTER COLUMN medical_data_id SET DEFAULT nextval('public.medical_data_medical_data_id_seq'::regclass);
 K   ALTER TABLE public.medical_data ALTER COLUMN medical_data_id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    18787    personal_data personal_data_id    DEFAULT     �   ALTER TABLE ONLY public.personal_data ALTER COLUMN personal_data_id SET DEFAULT nextval('public.personal_data_personal_data_id_seq'::regclass);
 M   ALTER TABLE public.personal_data ALTER COLUMN personal_data_id DROP DEFAULT;
       public          postgres    false    210    211    211            �           2604    18740    report_result report_id    DEFAULT     �   ALTER TABLE ONLY public.report_result ALTER COLUMN report_id SET DEFAULT nextval('public.report_result_report_id_seq'::regclass);
 F   ALTER TABLE public.report_result ALTER COLUMN report_id DROP DEFAULT;
       public          postgres    false    201    200    201            �           2604    18757    settings settings_id    DEFAULT     |   ALTER TABLE ONLY public.settings ALTER COLUMN settings_id SET DEFAULT nextval('public.settings_settings_id_seq'::regclass);
 C   ALTER TABLE public.settings ALTER COLUMN settings_id DROP DEFAULT;
       public          postgres    false    204    205    205            +          0    18746    biodex_report 
   TABLE DATA           9   COPY public.biodex_report (biodex_report_id) FROM stdin;
    public          postgres    false    203   ��       6          0    18804    contains 
   TABLE DATA           O   COPY public.contains (report_id, biodex_report_id, elga_report_id) FROM stdin;
    public          postgres    false    214   ��       1          0    18776    elga_report 
   TABLE DATA           5   COPY public.elga_report (elga_report_id) FROM stdin;
    public          postgres    false    209   �       /          0    18765    exercise_data 
   TABLE DATA           k   COPY public.exercise_data (exercise_id, torque, angle, velocity, muscle, exercise, repetition) FROM stdin;
    public          postgres    false    207   -�       7          0    18824    gives_information 
   TABLE DATA           ^   COPY public.gives_information (elga_report_id, personal_data_id, medical_data_id) FROM stdin;
    public          postgres    false    215   �N      5          0    18795    medical_data 
   TABLE DATA           C  COPY public.medical_data (medical_data_id, hospital_start_date, hospital_end_date, hospital_address, hospital_department, hospital_admission_number, hospital_name, hospital_contact, hospital_responsible_doctor, diagnosis_state_at_release, diagnosis_summary, diagnosis_future_medication, diagnosis_rehabilitation_aim, diagnosis_recommended_measurements, diagnosis_physical_issue, medical_actions_by_hospital, medical_medication_during_stay, medical_medication_at_arrival, medical_risk_allergies, medical_previous_diseases, medical_anamnesis, medical_admission_reason) FROM stdin;
    public          postgres    false    213   8O      3          0    18784    personal_data 
   TABLE DATA           �   COPY public.personal_data (personal_data_id, sv_number, family_status, email, address, legal_guardian, religion, language, insurance, telephone_number, birth_place, birth_date, gender, name_title) FROM stdin;
    public          postgres    false    211   3T      )          0    18737    report_result 
   TABLE DATA           >   COPY public.report_result (report_id, created_at) FROM stdin;
    public          postgres    false    201   �V      -          0    18754    settings 
   TABLE DATA           I  COPY public.settings (settings_id, powerhead_orientation, powerhead_height, powerhead_position, powerhead_attachment, powerhead_tilt, seat_height, seat_orientation, seat_tilt, seat_position, hip_flexion, footplate_tilt, knee_flexion, ankle_flexion, shoulder_abduction, shoulder_flexion, elbow_flexion, controller_mode, controller_cushion, controller_sensitivity, controller_rom_upper_limit, controller_rom_lower_limit, controller_rom_percentage, controller_eccentric_speed, controller_passive_speed, controller_torque_limits, controller_pause, controller_isokinetic_speed) FROM stdin;
    public          postgres    false    205   &W      8          0    18845    uses 
   TABLE DATA           J   COPY public.uses (biodex_report_id, exercise_id, settings_id) FROM stdin;
    public          postgres    false    216   \X      F           0    0 "   biodex_report_biodex_report_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.biodex_report_biodex_report_id_seq', 7, true);
          public          postgres    false    202            G           0    0    elga_report_elga_report_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.elga_report_elga_report_id_seq', 7, true);
          public          postgres    false    208            H           0    0    exercise_data_exercise_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.exercise_data_exercise_id_seq', 7, true);
          public          postgres    false    206            I           0    0     medical_data_medical_data_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.medical_data_medical_data_id_seq', 7, true);
          public          postgres    false    212            J           0    0 "   personal_data_personal_data_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.personal_data_personal_data_id_seq', 7, true);
          public          postgres    false    210            K           0    0    report_result_report_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.report_result_report_id_seq', 7, true);
          public          postgres    false    200            L           0    0    settings_settings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.settings_settings_id_seq', 7, true);
          public          postgres    false    204            �           2606    18751     biodex_report biodex_report_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.biodex_report
    ADD CONSTRAINT biodex_report_pkey PRIMARY KEY (biodex_report_id);
 J   ALTER TABLE ONLY public.biodex_report DROP CONSTRAINT biodex_report_pkey;
       public            postgres    false    203            �           2606    18808    contains contains_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_pkey PRIMARY KEY (report_id, biodex_report_id, elga_report_id);
 @   ALTER TABLE ONLY public.contains DROP CONSTRAINT contains_pkey;
       public            postgres    false    214    214    214            �           2606    18781    elga_report elga_report_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.elga_report
    ADD CONSTRAINT elga_report_pkey PRIMARY KEY (elga_report_id);
 F   ALTER TABLE ONLY public.elga_report DROP CONSTRAINT elga_report_pkey;
       public            postgres    false    209            �           2606    18773     exercise_data exercise_data_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.exercise_data
    ADD CONSTRAINT exercise_data_pkey PRIMARY KEY (exercise_id);
 J   ALTER TABLE ONLY public.exercise_data DROP CONSTRAINT exercise_data_pkey;
       public            postgres    false    207            �           2606    18828 (   gives_information gives_information_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.gives_information
    ADD CONSTRAINT gives_information_pkey PRIMARY KEY (elga_report_id, personal_data_id, medical_data_id);
 R   ALTER TABLE ONLY public.gives_information DROP CONSTRAINT gives_information_pkey;
       public            postgres    false    215    215    215            �           2606    18803    medical_data medical_data_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.medical_data
    ADD CONSTRAINT medical_data_pkey PRIMARY KEY (medical_data_id);
 H   ALTER TABLE ONLY public.medical_data DROP CONSTRAINT medical_data_pkey;
       public            postgres    false    213            �           2606    18792     personal_data personal_data_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.personal_data
    ADD CONSTRAINT personal_data_pkey PRIMARY KEY (personal_data_id);
 J   ALTER TABLE ONLY public.personal_data DROP CONSTRAINT personal_data_pkey;
       public            postgres    false    211            �           2606    18743     report_result report_result_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.report_result
    ADD CONSTRAINT report_result_pkey PRIMARY KEY (report_id);
 J   ALTER TABLE ONLY public.report_result DROP CONSTRAINT report_result_pkey;
       public            postgres    false    201            �           2606    18762    settings settings_pkey 
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
       public          postgres    false    214    203    2956            �           2606    18819 %   contains contains_elga_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_elga_report_id_fkey FOREIGN KEY (elga_report_id) REFERENCES public.elga_report(elga_report_id);
 O   ALTER TABLE ONLY public.contains DROP CONSTRAINT contains_elga_report_id_fkey;
       public          postgres    false    2962    209    214            �           2606    18809     contains contains_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_report_id_fkey FOREIGN KEY (report_id) REFERENCES public.report_result(report_id);
 J   ALTER TABLE ONLY public.contains DROP CONSTRAINT contains_report_id_fkey;
       public          postgres    false    201    214    2954            �           2606    18829 7   gives_information gives_information_elga_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gives_information
    ADD CONSTRAINT gives_information_elga_report_id_fkey FOREIGN KEY (elga_report_id) REFERENCES public.elga_report(elga_report_id);
 a   ALTER TABLE ONLY public.gives_information DROP CONSTRAINT gives_information_elga_report_id_fkey;
       public          postgres    false    2962    209    215            �           2606    18839 8   gives_information gives_information_medical_data_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gives_information
    ADD CONSTRAINT gives_information_medical_data_id_fkey FOREIGN KEY (medical_data_id) REFERENCES public.medical_data(medical_data_id);
 b   ALTER TABLE ONLY public.gives_information DROP CONSTRAINT gives_information_medical_data_id_fkey;
       public          postgres    false    213    215    2966            �           2606    18834 9   gives_information gives_information_personal_data_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gives_information
    ADD CONSTRAINT gives_information_personal_data_id_fkey FOREIGN KEY (personal_data_id) REFERENCES public.personal_data(personal_data_id);
 c   ALTER TABLE ONLY public.gives_information DROP CONSTRAINT gives_information_personal_data_id_fkey;
       public          postgres    false    2964    211    215            �           2606    18850    uses uses_biodex_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.uses
    ADD CONSTRAINT uses_biodex_report_id_fkey FOREIGN KEY (biodex_report_id) REFERENCES public.biodex_report(biodex_report_id);
 I   ALTER TABLE ONLY public.uses DROP CONSTRAINT uses_biodex_report_id_fkey;
       public          postgres    false    216    2956    203            �           2606    18855    uses uses_exercise_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.uses
    ADD CONSTRAINT uses_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercise_data(exercise_id);
 D   ALTER TABLE ONLY public.uses DROP CONSTRAINT uses_exercise_id_fkey;
       public          postgres    false    216    207    2960            �           2606    18860    uses uses_settings_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.uses
    ADD CONSTRAINT uses_settings_id_fkey FOREIGN KEY (settings_id) REFERENCES public.settings(settings_id);
 D   ALTER TABLE ONLY public.uses DROP CONSTRAINT uses_settings_id_fkey;
       public          postgres    false    2958    205    216            +      x�3�2�2�2�2�2�2����� _[      6   *   x���  İw2R��2�?'�(�I�7a�K������      1      x�3�2�2�2�2�2�2����� _[      /      x���[�-��&���+�h�q��ԃ)w�
S�K�h�3S¨$C�c~�D�\�$3��;�:[�2�g1��`����z�VO�����V�����Rb���jZ�|��i�i���XY�^�{�ץ�y�\u�=-�)y�B���\�`��{���{�qܥg�|�U{y{��kHI=�q��[B������<�2a^�h�GD�C3��Ytl�2�/����̩~���g�fSC�w/�������:������4�X�Sb�c)��v��y�-e�M�[���m�������*WO9{�{�7��.�v-�?Ô�%
�4�ڞ�?�c�O����S��ɓfz�ͫ ���1���ѱ��k���JO���å�IZC���)_��0Y#R����K,t��\&��O9�&�o����_��4�����'�3�ZM��Ʈ�뤗��Y�U��U��Ƴ�7�Oʟgܴ��ĺ{ܡH6=�����HF41�c(��#����g�e���R�!�Lsϰ�Ap��7��6�_�*�����O�N+��'Rk��J$���|&I ����𑝂ަſn
�Fd^�%��DI��|S���5{S>*������pKc�j%Ԉx�<J�R��Yit�L�(M�&R��H�c)\�!�OR�{�[/7з뭏ߏK��VuR=�S4�A���դ�rB��y�t)��(�"���d�d��]9|CP��[���:�$g,�4O% G��f��Ҡ;O����[i:yM���':G�*��D�ť�)�M��u}�ig�d�J#DLo*���pWh�}��`�ϢIm���J�Jae��VT �w�w�Y�"�6�%�}�ld�T&Bϰ�h�hS���,M�&��!?&��DPϓs��)K���ӹF�n��%��?d��#�"ɩ��Q��?�U�J��D���Uj��<�ҳBU�T8_Ar�Pe�Z��RUJ�\s��UV�tt�J��p ����Z@��"A�	��AI��BS
�4���a����󊫶�-�y��aD�Q�BQ]�4�TIg��.�K-�nD����L9��P;�?o)�QO
�.�k�C���)���ܼ��n���+G�D������ɔy�Z�Q�Ŗ�r��B���\1�h��-N�٠V��v��q��S�b��v4��~�p��R�:�i�1ǽh�":G�s��<K��Nˀ.8�R%�ɩ;ߨ�j�7*�P�=.`f�љ�J���\,l���J�T��ڋݶc�B��c�v���[�������rJ8�!�<G �|����I(��pN1��b�n���j�l(�vkz5Ti��bS��G�3칅2S�$);�.Qtk�ч,>rA�ɦ��OjO�څ�f�ILQ*�&��uu����}NQ���	a���<a@�z^�y�s%w�2���8-�k�����e�����6��FD�6�S�N��:TL�?R�P��'ݽ���^�q�:u��%4�����V�Z)��.��&�r�U�%�a��E=�ON��_.����iF{��,���Qm��2����W?��m�$=��-�hq;L M��?�,���q�A��ڔ�[6\�l��.��-�����z�*u,FZ���s�o�mR?t�n�>7��2P�y��֣[�3�G+����{�֭#������C|����y_j���2��*˹	w�9o�y�|����s�����*��<H_�p�ZzEӯ�/Uӯ ��0�a�Ej ��؛20rWl�y�z���9���`��0Te�3�9s�\7,�� �2P����@��ld�L*���O����y1�׷���^�ƿd����|E��ڲL��,�ɕ�uY�qc�Ĳ��&�{9�mJ3q�a[r�f��G��j�g�Y��E����#�L:M}τ����Lܑ����,SV�	�Z�.��x����|��$���6�34����Q�e��#M��I{U7����3IraM����ٽ�g#V&�����Q�L.��h�����F���wˮW�߱fvY8��_ʙ��Q)���!��g訶���<FG�c�3��e�Б��ڛ�$M	9jĖ/%{�x&�����"�^��
�3Yg���z�- 
^�B����Z�����}Y&��&o����}�ZM&`��ɬ\&zZ�G�<��&�T&�d���˴�D��=xeyB�����W+ Ё^�S��l��A�2fx1 ���u�+8I��"��y�wdy?��p���ˇ�Y+d � �^MLO?Odv���P@��3�wc NX��^q�;�Hp��Lp�Ap3t8��d����h$^��v���Fy���) ���߭A0���� /� -��5�.��`t-��#0�����]�"1޿�E �"L+0��i��F�Wx�M�Ŀ0 �g@
�=��Ѝ��
J�^8��W0���fEb�G��y� � ��l��K&�4t�di�
�X#q�eݠ�
x�`�cx��1�πhmh��t���U��VZ��%.�{�c �@f���S��a�m|� ���t��㒴�C�pӚF�O
�#��V��B6����0�7�<�q��W�ɂ�pݱ1�p��ؼ��c�o�p����s�\�3-�ە�=�@3��p����s���BB�a��|��'�aي�d��$��;J<̍ Uüq0Fi2ႚN��C�Z R�&v������� �LJ@A��'a�$�F ��
�k=�k���e.&lAZ���p,�a߬����� �)$
��P/�L�$��2:��e�#�c�AB��7^2���]�guF>�<ox$
TKB>c�2��\��#�n�ǣ*�ʸ��[\#\
��08��l�A��KF>�$���> 3�@ >��s>L�%\�0	�`@���"�-(�09Iv�|����'!���H�D>�A���e c&�|3H�)0/x�1/C��<��<{3�1���NЧ����^K��`X���!����Θ������@�{ ����9Dфsˢ2�El�&)�Q�3�e(#.�:�P��
O�}#�G�G��+�(3I���A�&�Qz�bg����3'N'�b<	A��-�+A�9l
1P0��Hc����F���L���5�uv�rT���#���'x˦	v��P�L�v�%��-0o��vf���&�`J���]6�nh�1�`v�N�s�����Q��i�e�N;_��\Ӽ#��0�F�u�1̑�G{��/c+bh���`F�]a�E�~;��r E֑a �x���g��ؾc�CS���8]��zǾ+����!�E���Ќj�wm��ߞ�`� �6�\cb�*�4�[�̉�+�_T ɺ�\P��$��c��bYYV� ��'�@�;�z�� j�l�-���1`0B��12e�T���h�a�u�$ۂ%J���t�%](БIi
&؁d���Y1lLA��H&Spuv�����n0��lJ[���l��<J�������7|$� `�O������%s���k6W�� V�0�%<� {o�o������@H"[�dXd�'��pBHr�%Bfk��Rz�!H�ߚ�[�t�!�12 ׏|���������-����h�E�-!����-O���",Fx���:�N��f#�3Y	7���5����>�!����%F�M�-Y�#���c��͗h�lY6�ؐ"���5�(ݎ	x��������
�Q�9��~y�	�r��:��{LJ�c�-���c������2�ա����e��k���ty%�e��1��z�v`��5���@��ȡ��\��؏r�@��0� G�`F9��S����x�,����-AD�!������5p��}�>,}�<��#��@H;1-##KDFF��ldd$�ȸ� �"G�������l�0.�tO��K�D2�l�DrR%0vy�w���Y�������;���L��^��g�̮R�3�d/���|W���7�<&T��՜X>�*e�2�qb�v���J��ǅ�G��W|�Se��5�W%����g6����~hS쥋_�n��Ùrךk    ��w�e�:���F;���HQ�������n�J�hS_A�5�bn_��[9������T�<.�e��1�+�]�=:HU�5ps%G�ƭ&m����m��]��1��@l�f�G����Ff�д�2�Y�.S�=B��R>#k%���4�?�D�!��[���Z|� �߆��c	e
<�<}�������[��[�,ѯ�R=(~#��)M��n���h��)���:έz v9f	}�|�C�a�])8~Z�x:�W�N�\C<�5X<�r����/��/zB5�|�x��'�)K{.[�����"E���[c´�&`�;�۬}�u�X����>��m��w�n�iߴ��U������ƲӸ!��o&�L;6p?�_�8�I+G�]=}"eV���X���*�8�*��z�~'�39ʰ}�h?��q������X��Ey��'����9ѷ胛�}<�Y�YUmU��*�_�E�U�O��Cѡ�ʶL�./��������_�XUb��;��,�t��)���J��g��;xŅ���v�{ �X���op��x��������w���-}������ە6�[E_,����k{{���e�FA���_���/��U~���ۘ�=��?U�J���o�q��j�Kڤ��p]��`���+P�L4��,~��o�>�X���I��?B�|D�;�U!�G*���s�^ݱ��6u���:�hбn8~�X���U�F��E_�E?M�3���W��Ŵ�wa[�gK�V�z�%�܀Ʊ�]/~{�/l�{�\���^L�1��c�$��)�pR)x��%��㶤�8��(~�*���.E#�*��rT^�E?�����.���1 �bbxY��|��uJ4�A���Z���X�`HF���'��hL<���Mmӫ��ƨ���K9<�	?���S���9h�V����u=���ð��2.��.��[//�0nL(.�ɘL}�]��A�X]8y�.�bs0.s]g��y���YWE)�k��<�9�=(��G�B&=t~�M�����ܿˢ��˱V�������_?}��_����_�|�/��ˏ�|�ӏ��_����N�}k��pt1��h���xxԒ����|����z�[f��&\�����X��(�t�-�xf-��)�|$��S��7��N���8���x���Ƴ�^���n��������L��^މ'@�<��.Jv�������~�����/����~��_~y�����o?����5W�������/����;��Y�[��	������1�GfU������,tSm"���fzƻ~]|v���5��O�ku�=�cw��)��́E�i���mv~Z�Vߺ��R�+�櫚7p���m����X%�ݻK��b��w���I>��jkk��[��<��h���<�gl���{y�������������K��������c�w�^]A'_T^+/��*�]Nu]z�5]綧���5~EB��q<��-a<�-����&*�5_�Ƌ�Ɋc7�Ӥ^ji)��$��Kf�8u�~d�Z�Z�f\T��HR����J{G�)�����]���s��zR��5�\�9p��y��k�.a�R%T7���q~�w�����xR����s�V����X�VcU�v)�.�U[IQ"}��X��x��.�0Y#�lP��w�%j�p.P#����$�Wjxn��A����-<������ef��v5�WC6O�5��4�XD6�=�����--��/;�.Qtk�ч,n�S���4���I��iT�pՌk��R�I��${��N�{��)��<�{�����6P�y-�YΕܹ�Ě�㴈�j@J��\��(gގVC*j�'�X'w�sv�,��Sᱱ���v�ؙkyq��c��������I��
0u��LQ}�I��p�x����G�M�d]��I3�����i�Q��%q��4�#�&�S:���h�t`�W"}j�����=�Q��f�=b�Ӝݢz2�	�)��g��x�;.2�qS�<ϓ�W:��̞�Zօg�o���Uf�{]�Z���H�r��_�	4��8F����|n.\�e���i�G�g�V~g���"�[G������0���?����f��e\!
U�s�<�sގ�@�@�JU�
=J]1�U¹y���\���_1_��_J�	�Z�By�s�����+����~%�_��s�1����a��8g�s0�\�l�=d�FnϹ�J�y�K�o�1��%���ʯKkl�r�5�����o+���^�:v�4�qܥg�|�U{y{�ip�O� |����е��?[܁��X��\���΢c`��~���gN�1MuUJ�� P3:X�֣�z�q?2��8������=��Cv�<���S��V���{��ql�|ܨ��S�ou�s~Lf����r�Gǖ������>��å�I�Xp���]Zj�mJ�Ǽ�_��[Nd������rQ��Xԕ˳{���,�w�����r9q�a��]�l�T7�n�r!|��w@��dD�� ��]�Np{vY�˫���a�� ��w���5W����۫�]jro��>��}߭=޼Q��vs77���9Q��=��fo�G�R��� �[�ӎ�#^���)�ӟ����sY��Fk��^����s�#n�s���R�Cb�W,&ԫ�%��9��Mm�z�@{Y�X�ŷA�Q뺙���4���+n���w�^�4yE�ŉ�ѬJ98�qiz���{�Z&��^�сΐ��`�ϢIm���J�g������z��;��܀��D��}�5R�2z��K�hS��y��J�{�|�S��ݙ�T��:�k�͈-�.4�� Zڷ��qN������Ø{a��:��a�1��*����t�<dO��2)����3y��M�����i�p7�rhA�?B=0�˩��^O����!t���c��:B�����q��1�g5�Į*�Ŵ��*���`��9q`x+l�D��u<+�\�#=5�o��_#���Y��!�:<�nƳ��T�W�XlčwM�;x�ڢ��v��(��[l4�
ƍ[���Й����hV<�΂� �a��`�tl�,�H�W�B�u>3��x��Rt$�
�/h��H<(��N�r#����L�d&�¸<��`��	�v���Aˠ_8LP�Z$v���p,���ԣ��	���Di��`4��!��Qxy�&"C�<2[:ݨ��n�5���[��X<�:��(��[�`u<U�L�y(����, ?,v/�t����h�UU�2m2����� ���x��IP�:�n�0��H{1��E�O����N�`/�̕��ZH,g�"`iC�/��rR� ���C�/0��(�VH��:��*�
Ћ5O<�7f��St�}p��,���$�t2`�Z���.&�8腧���<|��L��ǩ	�����8]�v2�k`|}U��v��g9t��<�aBtvH9�^�������RI����b�A�#�0�j��C#b��\v	�,���`��DЎ-�m�0�lpB?;��9y��� q�A����8�0���,�U��`���ɝIYV� ��'��l��A'F�s �i6�h�~���ǈ���@������J���hw��0J�J��^$x9�%�'��Y�	�#:�x5�A�#+BGV7tD&&����{�H�,�!q��ktBVC
o5*��Mf(i��<.06�z`�I2 X���2�[�&�O3��'�d��� 
 ���a��o�p؛p1�VE c�H��D� I� g�Bi�0PB?��x�Q�7���H*��l~0P�P��9*R�4�]�
�ǳ��H�������/$���ἴxrGB�����_>.�*7@���h~	�2"#Zh�fK�H7bd���5DX��a16.uf�|�̔ȩ�LVE<������02��G0 !�!�c	�Qt�t����0�9��4��*a�%�6�
�9�fR�"7 Ի& àDC�jG��_ܤ%HM������s(ЍZ*dp�ÀfK�Ѝ���    	�ݍ�(�$�[6(�
�QNڀ[��:�\�Qg�@N@�sϭ�i�0.�(�	c���+1.ۂl2Ƒ,�]�6ۂ��W[��die�h�v`F���K!�X���<�9r��0�����~����ծ�	C�	rdf�#8`�0�\�l�]�w�.bR�����x��-J�0��2ho�!1�9��c�:r9����22�Ddd$��FFF�ь�k���� �x�-�bt����s���E��	�3 �ɉd�٘��J`���6�@%u���;���L��^��g�̮R�3�d/���|W���7�<&Tm���٭=\YQg_��y#3'6k������;)0&�=�̿�G�*<��*�H��� P���HV�g�5� ����7�0C��׷��Nb��g�K�٬��Wd;��-��K>�\)_�e7�H,�j"9��Sۦ4��%�o6�~T���qƝu�Yt����1R` ��}τ����LlJ�̞I�f �{�����	��H��8�Q7����g�!�g�2���w��]�G�r˸�%�e��J��m�IN��g訶���<FG�c�3��e�Б��ڛ�$M	9jĖ/%{�x&!܈�"����tk��g|_�m�x>:8�<9K�<)��� �������?�9���Iڛ�֤'���� H��ƿ���y6y	�b�9���������&� 9�+� �F��<��Q�r-� �`/E@�}�@�c�ߍ��bX3Bdg5l-� �M�_�n�7^���\�݄y�����{�o�p��X눁�51
�@��zM�~l� e�/���b�]���G��Hk1�V���
&�U��+�[-����|���" )R�@�u1�;m�0�q�C?2"��y� �>�\+�Qb�|�����H���%�dA%If��XAd���#�p%�2yb�b��sP���w
@�1z�$GC8>ܱ�%���L��H��u.��/W��� x��P�\���~�Τz���o\��H���_ڲ�w��-���6 u>U|���;#�����n� p��h}�f��r���O�]"�m���OB�� P"Ϡ�|��B���߈�f��G�Un �q���}� *�Bz6��ǎ�Q�[פ�l[Q��X�?ก�{i�Zzg;��Mj:����N�}��m��'=���Aѽ��aA�qV�@v��4�V��X��![���Z�S][]I�" EM�����FѵF|3*B�"�\-�iG樏+共 =*n�0�߿!v�6�k�m�A�{��G%��nQ��tu;"���V�����{�zD��f3,:9�	�H-��[�_����~5ʪ�j	xQO������+=��j|�^&� �ĸq]�����4���N��k20�g�~ɷ��)�!$�����ʘ�
Y?����]��V�xY��͗]09z���g�G��=��Z�r��֯?�^�E_���x~�e�)��2��c���%U���
��K�V���M���+�5*�ƻ� 'E����~��B��xI��S�N�}��L��1ƾp�-�h�B��Vi# Y�Z]7�F��1��O2G^�E��鞎0�	���,�1 �bbx3��|�h���ݙuJ4�A�L*�%Ղ��qi�lcv�dt��yr�ֺ1~~������DZc����D��)�:�*�}�AC����g�'rw���Θ茧ζ|���T)}�A\V�e,�Y/��X���21X�U�w%��{4`u��i�N0G�2�u�ʉ?6[���']O/.3+��X7r���Q)!=���G�B&=tr?�QB�ez%�����8�d��c*��vu�#GrT�?�F��v_h�\�����`{ �q�.����X���hr�G��6sY����m�O �c�끣�|\o#�th�~���c���a�ǂ������GM�O0�w�6ƨ�(����6(��Ay�߈?�c�<[�<���8w�Ir����78�������������/��wR�·b둥/�/�]�Ҁw��#4Y�Sc��l4өi�L��"}���*���h��j�s<�|g^;����y�3�臟��uZ��gz��UMf��&��|5��,u�'y����(��5~��N{�v��|sѹ~`����y��.ԫU�K%��?!��$K���|F�>/���G��~��'����+��m�{��O?������_��˟��������_~��_������������7������ߤ����~���/�Û��}���������6�{���⍰|���ͯ��Wu�����2׎ܪ�O��J��*K���+�^=���N��0�ϻX%Te�)�=��*a Y\��u���W�8��nLy7,_��`m]�*�Y���ͷ��^P*�N廱[�gg7�����M��?o)<������Ss��{s�|�_9����l�Ǌ/<�i�[��5���&�5_l]�ݺ.\^�*�n=����Jq���� ^6��mq�y͸ͅ�|�8+/�u4Q��q���cR�I��i.������2k�8��|~��y�
q�/� ��,U�?x�UBU�UxT�ԥ,��GmoDj_^/��hOE͓H��y60�P�{+u���4�?$�5I�O[$�K�^�
�S�m�ت[f��q7��j��)ڭ�U)�Rf�-�lX{t9�޽�2S�<(;�.Qtk�ч,>�㼛l��q�{jO�ګ�f\cޖIj�&�SNu����A����s�v��p�0��
=��<K�T��z�J��-���1� �z��TX�b6μ��TԾjOJ˷^'w�sv�,ݮ��S�=����voرjyT��bO���������.�����i�����[i���#��_�.~Ƥ�]��L�4�(�咸�L���.��4�g�@cL��� �k+;�>��#u�nf�#&=��-�'�.���?�,���q������)���h����e�dҲ<�|�4l�-[o]b���N_av��s�}E��B��J�՚,�d�Ys��{5D�J�Vo(�:	ϪY��:8~�}����s�8�Kmx�_��Pe97��c��84} Sun���8�CY%����n�@K�h��j��t�P-^�ht�y�����1��F�+i�j\�ӎ�� �CU�9��!�*f`�{@����9���Q��������f��_s8�q�����*y������=%7\�˖�;�̔�=�����#.�S����ܽ���u�����t���0������E���'�Wa��f�:�*�1z0���_��.=3��zj��S�^�?��!;�v�t��(6��[_mr������ߪ�9���֜;W��d�N�nL �ztl^�»��Z��Ԍ\ڛ����z�޻�p�7���X^fm+39��J[�o��N&b�S�\�-߳�ܑ"+�l�yw%�[��H���\.o��f�~�r��%��eZ�j���gw@wGrwqu�{�p�rYz��Zs�^����٠%��ma;ڣ�ڏ�{�DZk�qs�,�%9ڿ-*m��|t�:]�>^��5g�Z��l/���v�}�oM?.�����_¯��5�?��r(�;{��u�*�������*�9
�mT�n�9�,���[�����k�&�D^�D�h���ȿ�4=�I��]�oa��&��@?�/^N�z]���"��i����]-��fn�n��l�=��	�R5�q�K4��0D~_��r�Qc�.g�p!u:�(�[x]@�ߋ�@��oO����{������#�a'�'zzN]�U_���%����?n��M-��3^�����wBO��;!t���cN�z�k f���V��2��� i��<]OF�c�3��=P4jux���j��P��+Y���T�BAk<l�k��[�a�[��E�M��e�#�4�/
��[�� �Е�4��gV�΂� �a`�
�`.������hhEf�P9�Fx$�<j1��{��Lr�{���	jK��.t�] .7� 3:����Di�w�`.�%�Qx���g� �-�nT��ܪ�h.��*�wp@`@����ǋ��:����    ��f]��4젶 ���t�*�`�A��@�#���Z� k��ċҡ���`-�L���ZHg0q�xzų����QNAj�qt� �6��{�
�>ӭ�	�0Ƣ�X�t���q��O7��� ��]�����j��M�a�O7�tS�������T�yiqF��`�1*���ރ��P�!^\���x�����	���	?OAShb�;�z]�0$�V$�����#u���ֻ�>G� �^�om�sK��q�B��q�m��c%���-�m�0�l0����)f̉�+����s*	�SPe�l��*ɍ�Y�@��"�$�,�Q�Y����5�����R#�Af��4yv�#8��_���A_�+��zY���S-H��:���P�	^���/om���NZ�-*F%Q����	#S��?�'�wH~����Ё/I� �]F�����@�0���:6��K�eVY�A,���`&� P16����c���0 ����U)�(|x�h"�raV��F�`o��L�U@�U��HB����I�o�q���$�8Ă��8�7�Ȧ�$�z��H��tH3��G���v���O���੆�xqFB�������-�&7  �S@��!�/�<p]������ʈQ��m��?�	�XC���c�RG`&�7��L��J�d5�c��+��k �"}B 1hZBV���&�f�UÔ�H42�ck�͖h�$���<�Gl@���ps3���Zct�D��:zV���&-@jB�8rp� �
t����� �Àf�Ѝ���	�ݍ 3���Y�.�⬫n '`n�y���N��f}&s��`�0�ݬ�߲�����j�(.�}����@�T&�tl�e�+�?��bw����PpxX�!đ㴅8�xl��#((?�B�0#�0 � G`F8��Kװ �X�,���x-@D�!�����ǿ5p�b�b{+C6م͟$7ѳ�PH���pM����f ����O�OH�C�|I � �M�"�J���i��Q��G�6n�gJ�3��-G��b�Q���Kr�L��U�~���e3�>�Wm��7�	U=*�u�����Y�L�������Wj��g�{����8UxZ�yU�H+��Y�#Y���H���������o^�>[��W���/Yf����*�O,���o��|]�q��DbY�Uɉ�,�6���߰-9}������x�e�3��͢�_��V�WKTn>WL�dbS�d�L�D����K�~��	��H��8�Q7���[h�!�g�2���w��]�G�r˸�%�e��J��m�IN��g訶���<FG�c�3��e�Б��ڛ�$M	9jĖ/%{�x&!	��"��=�t�	��
�@�}��g�7xp7�yr�nQ][2��,`x*�ă��f�O�Zg�5�4c ���0/�&���X��
���(/���k_K��%,���bx*�B8��R��9��w���(/�5�!DvV��"B�%���|�ň���M��(��1���@�z���8H^�@4߸�B�P/�ڣ��0�q���q��B��zyLz�pAWȷZ�����B�H\��ckb�8���q�HƇ�v �}�P���Q��-��pE�KBɒJ���ͱ�� 19H��a^(��+e2H�QU�D\��f��# �X��+\y\&E\$��B�\��K\��^��r���ĥ�Τ�z��ĺ?G���w�iFV���$��p{��F��6 ܃uC?Z�Z�e���������� �?�{r@	<�"�m7 �� � p�?|4g�  n� ��׻��.�����8�y�uN϶�nێ����(��F�s����&���_��qd�mk䓾U����[����_��`E{��m]��u#M�ռ��*
:ܪ��� �Byӭ|:�Wq������������rxU�Ʒ�R��}�����^Vxո}�~��o�f�A�|�ӵ1�I= Ѓ�@?�5 ������5��q]�m�|M+����ڿ��"8ړw�.q?L�?Bܧ$.��������sp�Bú��;�A�djU�E_�E?M�3߹�;kmy�l�_(x��c�wInn\���+і�c�%��!!Gq�5�V���K��m��<Gu��_�oJǀݺ���1���#�M�(�E��4.���GXGT��2�����?��	���]��c�Sũ�ZS�.�����t�5넗f�T�%K������lc�k����f�-t�y(.y֛V��pc'����ff�40stԽx������\L>z7{.��2�4��^ȓ�(�#eb��p�JvB�h������w�`��^��̕l��k[=�z�|���ǳ��c��\��Hq�ʯ=j2�3����'.�+9<��'ISq̎�S9��J��� �u��K$��%����2����
ͅ6�O:59���vwl���0~��]��s�1�נ�g�ܧHz����f����i��̺G��O�}��Q��Яm<(~#���-O����:3�3��C9�٠y=2.��%np�uFg�!��$��6��6Ҽ�~>���pۨs�
o������$���-����i��LnZ<̖�����?`O3�3�#�&�uZ���]ޫ�&��b���c��7�vm��m���s���e~��]ڗ�����38n���홼Z��T�K%���d|z�S-�ϖ�Y����gp\}}�gt=��1��\ ���\}� ӷ����~������˗o���~��������߁��߹�n�/a�ꭞ{�zn��+��6����zZ�S�w��^�?~��GnR{�����#L�]������-��Џ��w�q������Ќ�vۨ��K���=s��n�<e��f��5/��������󫦌��)y=7��N�1s��ƫ��w���ݥܮ��g�2�DAb�f#_��gzc���U5s��7y�Lo�y�wV7&�{=:v�w�߻��Z��3�z��7Ik��G���)a�F��e��{<$�+���|���{��D&+]"�~�L�VDO�o�ʄk�3iWѶ�`�hA�~>�"+�j2�j�xְ��I�󌛖6�Xw�;ɦ'<�\�Ɉ�/&qe�xD7����l�WV�5��i�9�Μ�m��U��şt2��Z���U"�D�3I]�!~�Gv
z����ȼ�Kω��3����k��|Tp'�;r?��Ɗq/�Nx�':�_���FG�T��Th"�ˍ��1��e�$�����r}��������>mU'�у:E	�إ�rB��y�t)��(�"�n��s�g<R/�Q-Vo�.���N@�#�K9�F��Q뺙���4���+n��V�N^�4���:':G�*��D�ť�)�M��u}�i�G�/�F���T:#���(/�z�E��p��Е�ʂI��
 ���5.�0�TE�m$"K"��H��D�L��a}��=Ѧ��Y"��M�=C~LR���'�Y��,�.�N�e3����
��=��$�$��G���DW�*�V�OkWI��:�XJ�
U�R�|�UB��k1�KU(�s�e�������*�*�^�j�k�[�]'TJ
5��|%����9ϸ,k�I>��jk�r`�GF�e-�UK�I��q�XA�b��2�F�
L�Δ{
�SQ���� �b��;�N���N�I�������r�N��hn��L��@��5_l�1-�K*D�?�㑋&���ԑ��ju[h��q�=5.V*oG�)�7��Ǫ�+�+�c��s܋�+�s�?wZγT�~���,U^xu�UBUm�F��7�ǅw݉=u�m�*}V{s���ƪ*�RP]:k/vێ-H1�Q�%Ro%j2��B�M(�\���h��[�&qP�h��9������e�f0�	̻Z��xڭ��P�! M��]ΰ��LM���p�Dѭ�F����&�    �w�>�1<�j��q'1E���dO����z��9EB�'�����6P�y-�YΕܹ�Ě�㴈�j�v4�V{��3oGk0�����D<O�;n��P1-�HaC{^�t��{���ԑg(�и;�f��[Mju�\,KO��V���5VY�\�mf�p?9M<���f�Wr��βp0��Fe0��S��W�_�P�w�Œ�4g��;���0�47���w�E9njSn�p�w�]���v��7��v��Y�Աi]��΍�-�=H��u���\�"�@���Z�n=����J��EZ��h����a�.�}�͞�˸B�,�&�y ������z��b(��s��!}��)h�M�b�TM����s�9�L�bo���]���9���c R>�A�P�qΠ���s�0��? �z�@�?rok !���2���W?����żo^�>[�T��W���/Yf��%_��<��,�{.� kr�|]�q�X"��㪉��^Nm��L�oؖ�����Q}G��2�w��f��fb�H-ӂNSG�3���3�%w�Ffh$6˔�fB����o6�m+*9�34�~s��fm�w�x٤�Hӳu�^��mfh�L�\X����rv��و����fbsT$���-'�1C817��1~��ݲ+���w��]���-�Ɨr&{tT�,�h�e)�:�m�j29��ѳ���~�G5t任�� 4ISB���Kɞ#�Ie�u�H��W�G$*�+f�� ���D[@�N��Lt��NT��8�-�,�	
�N���y^�?��d�[X���e��U{$�</R)��L'K�����2�� �s�&�J��� ���no�b�\(�5x�d6�nP�/$Z+<�Ү�$-��d����yIx��[�7-�!q�|h�H�D��`�U�jZ�јdv���P@��B>:`p"�Ε2{x�M��7�Ó'ః.�f&�pة� �ta�H��J�Nʇw�<�L���@��x��[s��]5>-���.���_���\ jQx �u� �`׭H��xX��m_���O�vH���x�u�SE�7���wxπХ�x��n,t��
x��w�]� `�C�͊��D�X � ��o��M�_�0������e 3H3�Hn5\�P�^+�^��d;�3 ZZƥ%]e,~�2������q�������Ƙ�T ����L����b�6�L��axP�a�qI� ��D��4�R�wy����w��l��������,��#T�rM<υ뎍��T���W�~[�0���3xn�kv�q��ghf}\���~���h�k j�ItX���%�dA%If�s#�����4�pAM�I�ԡ�- �J;N}��
XN&�d�I	h"2�`3a�$�F ��
�k=�k���e.&lAZ���p,�a߬����� �)$
��P/�L�$��2:��e�#�c�AB��7^2���]�guF>�<ox$
TKB>c�2�ᙻ��ܽ�� >@<(�{8oq�p) �����:��y�.�X� �C���0�p���0�pA�$��a ��rk@0�8��H/��$�%��:�R ��<��#A�xE�n ����0�� 	����mƼ}�h�����ǘG3;A�fK�nx-1o�`�J��#�H8c��cPB>D���8��E�-�����pG�ψ������ C�(<����y4y�Y߱B�2��*J��o��7)v�}�<s�t�)Ɠې�bA����æC�4v�m�a�H�$hI\�_G`�(G�m-<B�X{��l��`��n����`G�]����f�!�n`g`��Nk�f�D�l��eC�vo��G�+̼v�r���H3/�w��
�������6ڭs(Ўa��<�C��XC���X� 3z�
3/���i� g�(�������u<�`����rl���
Xg��;�]�u���.bĽX�fTþkc���\�y�Q��[�T�	�تeND^1��Iֵ4�′�� p��`%��Ȳ�%=�4 �܉��8P�f#��h������ǈ���@����);��=�0�D�{�%�,Q�._
[�Q҅���`r�����\�#+��)(�_�d
��n�_�8�&5��@i�xs��z�G��6�z`�I2 X@䓸D�7�d��d�d����p1H��0� �G	��+�ޛ�[z���f�d+��� �� Yx�	(���`���$���DH����"]af���#8cd�g���|+0"#Zh�fK�x��{���u����#,�ƥ��S+��ȩ�LVE屃q`d���`���!�c	�Qt�tKG��;�<��*a�%�6G��$6�En@�wM�2J�c=+epk����|�r���_�,AB������Dx�&`�X�l�|�z�ru�/;��q��k���1�;]^�r�����d������|M;�4з�9r��0�|d���6��('�&ȑ!�Q������,�&�%Kp�"&EKQj��=��0pܢ�@_��@3�-���4�N�C������D(:IF32�9�Ǹ�!���h%c��&�%��4� � ;��13��T	�]���f�|��D`j;�<�&u�*�����,����;��fba�Um��7�	U�m5'�ϺJ���p�ج]&�����qa���Qf�_<�TY�i��U�G"�|�뙍.�]wi���3O�v����6}�����]�|�ۮ�������2���7�_7HU��{�k�:`�k�/�n����	���jv=p��ρ��md�^tKݧ�6�S$����d�}���Ig똈�/�,��>�>�Pv������9>���I���1��e���.ճ��7"(�����i���l���
��ܪb�c��'�˧:Dە��u���z��5ē]��#h!�^��/��/��'T��'�' ^x������Ŋ�P�n-Rn�Q�5&Lmƽ3����]�������Z����I�F���M[�_E��?n,;��|�fRϴc���uZ����r����'Rf�ON�5�9�S�"�w��w�>���W�,���z���IY܍�{�p[���z�1�Lޚ}�>�i��S�5��U�Ve]��^*�E_�_���+?��l����":�����^1�%�U%Ư�c���H�/���ɭ�yyV:A��W\�nh׻�Ǎu݀���)߀W	��|��np��i��'y�>�Z���]i�U���N/���gخ[6n��jN!��/��__E�� K�����}�Se��n��w}�����M����/ �5�
6n-�E;�DC���'���铎u�ߟ�!�#�GtL��1Y�~4�rA	<1'��k�kS�ؐ�����w����(]�k��^�E_���4?s?q��^L�|��~{�$hů�\��hK����1��ƻ�ϥ����S.1�K�\��
'��'�8|]R�	?nK
��N���'P����rP4���bZ/G�E_���=Qo��� �*&��Ř���Q�D>�����O�Q��v�dt��yr����#hnx��6��h@k��O���ó��~�:�*�~���i�����Q��; z>�.�B��������Ƅ�B����`�Waޕ���рՅ�����/6�2�u��G�ڟuU��F�a�s���#كr_{�.d�C'�'ؤ9������,��P�k����?��׿�������������寿|�ݏ�����������~����o?���w�~�ӏ�������Ϸ�w�m�fӮ������f}�y�f}'uY�^�{�ץ�y�\u�=-�)y�/v��u{�quzO7���̔��j/o�0uI#�G >��{Kh4�#���h�}��6|D�>4c��E��6*��R;(mϜ��M�~�`6���}-z~�o��I=H]�t�6���R.�c�K�״����l)c�hJ�Z�ִ-{ޣ{?"W��)g�w���ݥܮ��g�2�DAb�f#_��gzc���U5s��7y�Lo�y�wV7&�{=:v�w�߻��Z��3�z��7    Ik���7��)a�F�h5yZ��B�n��� ���	�����F8�Ɋ�	�i&k+�'���(gµ�%R�h[z�N���~>�"+�j2�j�xְ��I�󌛖6�Xw�;ɦ'<�\�Ɉ�/&qe�xD7����l�WV�5��i�9OLϜ�m��U��şt��� �	O�D�+��g��4�>�S�۴���݈�˹d�(	?�o�_��fo�Gw�#�Sni�7��Gx��U��Yit�L�(M�&R��H�c)\�!�OR�{�[/7з뭏ߏK��VuR=�S4�A���k�,'�o�'@�"A����+��ra�O�A��[���r��u�I�X�i�0J$ �Z��4��Aw�^q���t�	o��9�9�U)'�/.MO�oRݬ�N;� c�4B����8�	w��Gy	�{�,�Ԇ�����VLjEU `�pW�qq���*bm#Y�G�F&Je"�닖�6%�`H��$n��c�ZH�<��-g�p!u:�(��-��DW���Q|$Y$9U78�0��'��TI���Z�JBՙ�RzV���
�+H��,]�1]�j@ɜk.;��_��.V	Uxb������H�uB��@P�qB���-����ː����󊫶�-�y��aD�Q�BQ]�4�TIg��.�K-�nD����L9��P;�?o)�QO
�.�k�C���)���ܼ��n���+G�D������ɔy�Z�Q�Ŗ�r��B���\1�h��-N�٠V��v��q��S�b��v4��~�p��R�:�i�1ǽh�":G�s��<K��Nˀ.8�R%��w�Q%T�VoT��z#z\x]��t��6��g�7�j���.ե��b��؂����]"u�V�&#�.��܄�j� ��6_��h��=�S�n�ت[fn�������ݚ^U"��T����{n���4I��K��m�!��\�n�i~���Өv�wS�J�I�t]�>��|�ST!�y�@�m��9O�i���r��\ɝ�L��<N�蚡lG#k�G�8�v�C�/���M����F���6�G��Iw�,��pܬNy�r	���n���դVG�Ų��k�� �\c�u�e�fvQ���ģ��Kj}%w��^�,cmTC�>�L�qu��E{w[,IOsv��#Z�HSp��:K�pw\d��6e���z�۵�Kkg�y�kn����J���������rۃ�]�p��ͅ+�z0�����������^�u�vp�<>��;��qޗ�칿�+D��rnr��q(h�@@���@��A�+��J87�җ+����^��+�K��+@�!L>G�s���+�����j����qyN;"�40U�z��?�K��?�����#��20�,�
�}���o~a^������Ϟ�y����e6k�_��Σj�2����&W��eǍ%�:��HN��Զ)����m��ͮ�wī-C�qg�n]�j&v��2-�4u�=n.?�_2qGjd�Fb�LYm&�jɺ�f�ٶ���9C��7w�@��`ֶG��Mj�4=['�U��f��$Ʌ5Y��/g�ڞ�X���k&6GE2�L�r�Q3�ss�g;�-�r\mǚ�e}<��2n|)g�GG���X�r����Ư&��=k�����yTCG��ko@�4%�[���9�T6nZW��x�E��3Yg����.�Y����t���Tݐ6�-�,�	
ρ���y^�?��d�[X� R�2�Ӫ=�w��I)��L�������eZ�A��Gh�A���A��*�H����&�Q��k$��t�v�2fx1 �Z�-;vuxZj�+����~���
o�i�������L��`�
/8��0Ȍw�P@��Bצ9`p"�.� 2{x�M��{��c���nv��	� vj2�a]X4��ͮ��t�2�L�]d]�������@t��_濣�e=��*:a�Z^�g�ë��^���,Z�v�����XO���x=���7���txπ�Q�x���n,t)�
xԭw��pxE4߬t�Q�H���?fg�7t���/]�X\{���2��G��A4\�k�^+�^����X-�C���e\Z�U��W)xT��0��=.�`p���^�3�:dvqy��1��VL�Ɨ	�A`?J7�?.IཛhӚF�O
�#�����౷a�o,x��U�\��s�cc�� �y��UǠ�$�2����䚝iAܮ���Y���@�Lx�����.$�ȇ�}��(pI&YPI�Y�����3?�`��d�5�&!�S�n#� ����>��A� '/���4� �l��0x@# тU�5	��^��2����Q�8�ܰo��NC��g�O 
��P/�L�$����c��@/c�3:�����1F�Z�<�3�1��`x�#Q�Z�93�!o��t���xT��A7ܳ�y�k�Kx�ց�7ȳxm#K^�> 3�@��n6�9G�=(�0	�`@���"�-�v�%�D>ZG^
䓐��Bpc$H"Ϡ�|�O7R��0��t	���2�	̣�ʳ7Cc��}
�-���ļV��*�.�|0> �y~�A	��
��(K�CM8�,*#\�6l��>#Z�2���e�K�P�4�� ���f}�
1�L�(qP��	j�ޤ�Y�y>�̉Ӊ�OBlCf��J�v�Ba ��m��2�"e$��%q�������b�	޲iGD��F�=�#/��v	v oL����<����xC;�I/�����Gh���m��,-`�0�2�1ʑ�b"ͼl�i�+�c�k�w�v��h�Ρ@;�92�h�e�cE��b��u�0����0�j����rF9��
��0��j}�:�q[�c���M9���t�3�����:��X1�^�C3�aߵ��~{.�]��ڨCp�-�m�҄~l�2'"��Q�$�Zpq@يOr�8R�Q���eydY�̒��? q�D�f��M��gh�X�~c`�cĀ�	hn�GX�ȔR�J�k�]��ׁ�l�(���,�-�(�B��LJS09�tS��KtdŰ1��K �L��٭��'�����(mA�on��Zo�(��>B�Z�#I ��Y\���`2��d2@�z�����׈$�jF`�x\�����f�7$[��D� ����N@)=���� K��� ��%B*��5��
C0cd ���#8Ce��[X��B�6[B��=�[����5DX��a16.u��Z��FN%f�*n,��k ##}CvYK0����[:�<Gؑ�)�V	�/Ѵ�8�l&�!E(rB�k�Q���Y�+�[#��䣖s����d	��`u8����(�$�[6(�
f���e��C}��%���_3�׌����J���_m&c���(�'���kځ���̑C����#;�嶁>F9a6A���r��H_e	6�.Y�;x1)Z��RC^����k���}X��ylYG.���vbZFF����$B����H2��q�>�E�1.FG+<7�,a\�� ��؉d�٘��J`���6�@%S���w4��W����$G�d�]��g��^603��j��o�yL��m�9�|�U�~d���f�2���F7�,��2�����Ok<�J>i�#^�lt����ت;���«Sy����h��To���v_x��e�0y��=7==.�e��1�+��28tk��<�R����.�������[�lw�'۱���Qz>.���Y:4m?��|֤�l�P|�����G���'�Co��ePĆ��E�c�� ��6��K(�n��y�8��;?���3F5��Y�_ۥz6P�F�S�B_�<�qў�S[�u�[�@�r��r�T���b�Rp����tX�����x�k�x-��K��E_�E_�j<���O�S��\�XqJޭE�­1
�Ƅi�M��w�Y���p�����;|VK�~��2)��1Ӿi���h���Ǎe�qC���L�vl�~0�N+ pp�V�v�z�Dʬ�ɩ�?GU�q�Ud]��3�N    �gr�a�
�%�~\o�VU3)���p/n���QO�=F��[s�o�7m�x���7��ڪ��U�K%������t凢Cѕm��]^D�7����+�����w̕Y"���Sv;��6/�J'Hw����z� �����P��:��*!t����#��7�[�$���W��q�+mܷ��X"�	�����u�ƍ�6^�)�� �E_���`�ӷ1�{@�~�l����Z���З0�I=���&U�ƭ�W�h�h�Y�D�C�<}ұ.����!$����	v2&�B֏T.(A�'�d��c�wm���u�Ѡc�p�N��=���r�Pۋ��~��ga�'��ًi���6��oϖ����K6��c�^��<�_�x���}��c��%�xI��SZ��R8����K
<��mI!q�	\Q��U�#�]�F�UL�娼�~��#�5]`� c@T���S�8b�#�h�'���9X���3��������4ON�јx��ڦWh�Q�	3��rx�~��Y�ZE�os�0����;�z<tDχaC�e\�{]V��^^�aܘP\ȓ1�,�*̻�݃�=��p�4�]���`\��<t��h�]����R^��1Ly.�?r${P�k�څLz�$��4G�=?��E���c�|��?���/�������Ϳ���/?���O?��O?|�;�o~�����?~�Û�]xۻ��+%��/!�Y_`^�Y�9]ֵW�^�uiu�:W]cO�{J��[c{��k\��Ӎ�.=3�#����#L]C�H���s����l|pw����kg�1���h��J�3��uS����M}7y_����_��uRR�)���i汔��/�R�5��5�>[�X/������5m����ޏ�U�z�����9dw)�ky��L-Q��������Ø~�oU͜��M�4ӛo^��Ս	�^����]��.8�Vz���.�M����̷�AJ��)ZM����P<��#���~�=�xF��Nd��i�;o��ڊ�	��!əp�xI�*ږ�m]����ʭ���Z�5�5l��~R�<㦥�&���E��	�/�$GF2���IC�&��M'�=�,�啕r)f�{�E���3�w���qGD��'��C�;H�E��*��J"�$��LE�����6-��-j7"�r.Y<'J����W��ٛ�Q��������[+��#:�^"�vxV5S1JS��T/7Rb�X
�eH<ēT�^�����z�#���R��U�TG�xP$��.�	��	ХHP#o,�Ċ:��T���n|����o����t��vG�3�r�'�	���u3MgiН�W����4��&i�[5tNt�fU�����K�S��T7����/�X*�1��,tF�]��Q^��<�&���"+�+���ZQ X?��k\�af��X�HD�D@�����R�=����{�M�/��D4�� {����A=On� �Y�\H��5�fp�/��!{IIN��:�����*UR�$��֮�PCu汔��*���
���*K�bL��P2��N%�ץ��UBU��"�=�Do)t�P))�@w���d���t��a'��⪭}ˁi1<D�j��PTW-M&U��b���R˰�*0=;S�)�NE��[Jrԓ������P;�r�:�&17/g�[�k�ʑ;Q:/<�-�mz2e���z�|��ƴ�/���8W�G.�df�SG�G6��m��j�md�ԸX��ͦ�߄{#���ԯ��uZg�q/x��Α��i9�R���2�γT	x���oT	U���j�ވ^G'6U�G�M��Y���¶���KAu鬽�m;� -�h<Fm�H����Ȼ�-7��s�"�s��Wjxn��A��m���/�ꖙ���&0�j���i��WC���+6�o{t9Þ[(35M����E�v}��#��l��a����4�]�jƝ���k�=]W��=��U}�0fpx�t�@�絜g9Wr�.k.��"�f����Z�Q6μ��n�oD8`�<E�D�Q�CŴ�#�E�Qxq��;/�7�SG��\B�)�o5�Ցr�,=��Zi2 +�Xe]r��]����4�(�咚A_ɝf�W:����_��ЦO-{\]~�C���K�Ӝݢ��������R<�丩M�eõ�y�v�����b��۽�g�R�b�u9;;7���� �C��\�ss�,��Lk=��8cx��;+��i�:�?��?������l���6{�/�
Q����p灜�v���>P�:7P�yPꊡ������
�h��W4���R5�
Pz���\�0���)#wŶ���j\�ӎ�H� CU�9��3��u������0�!u�Ƚ���F&ˤ�~_�t��_��y}�l���v^�ƿd����|E��ڲL��,�ɕ�uY�qc�Ĳ��&�{9�mJ3q�a[r�f��G��j�g�Y��E����#�L:M}τ����Lܑ����,SV�	�Z�.��x����|��$���6�34����Q�e��#M��I{U7����3IraM����ٽ�g#V&�����Q�L.��h�����F���wˮW�߱fvY8��_ʙ��Q)���!��g訶���<FG�c�3��e�Б��ڛ�$M	9jĖ/%{�x&�����"�^��B�(��L�$���KdV<�t�C=���=�B7��`�-�d��s��u�k����Oj5���:`T�L��j����<jRJe2��kot��a�Vc��9��xPt�`j�� :��j��Hxh��l<����^H�Vx��]����d�t9�_�8��nZ�C�f�P�/!� 0��E����� 2�D0�0�еh� ���*��^q�1�^����e��nf�. ���p�A�or��<]s��6�0E�G�$iఅ1�?*��3�ׂ����X���N�����Y�𪥠W$�{<kV������h�E;$��q�3^��&�M�_<�3 t:��g�]:�e�ū;^A�7+]`<��v��YC��R��K&�4t�d��������@����
�;��}��/VK�Limh��t���U
��,�~�K.\��4�0ƌ�
�]\F^`bL�&���et�Ã��K�x�&ڴ����B��ȣ�E�����?x�m���8B�+�d��\���`8HEl^lp�1�	ã�q;����fgZ�+1{��f֧��%P:����? �	����f�D�e+
\�IT�d�(�07�L��;�4�pAM�I�ԡ�-�3�ybǩx�@P+���K�<0)M!@&l&^��@�`UsMB��{�����ń-�A�qp�Eb�7�5����2�����%����;	���r&-���G���8�>�o�d̃��0��|y<��H���|�Le�Û)5]p>U|�xP��,p���R �����u`��,^��ǒ�W����3���M|��m
4L>P-,���sK��Ag�.��֑��$��� �	���3("t�Ӎc&�|3]rtü�mƼ}�h�����ǘG3;A�fK�nx-1o�`�J��#�H8c��cPB>D���8��E�-�����pG�ψ������ C�(<��3�y4y�Y߱B�2��*J��o��7)v�}�<s�t�)Ɠې�bA����æC�4v�m�a�H�$hI\�_G`�(G�m-<B�X{��l��`��n����`G�]����f�!�n`g`��Nk�f�D�l��eC�vo�3I�+̼v�r���H3/�w��
�������6ڭs(Ўa��<�C��X;�8 at��=�+̼��o`�1��Q���:2`�Z���g��ؾc�CS���8]��zǾ+����!�E���Ќj�wm��ߞ�`� �6�\cb�*�4�[�̉�+�_T ɺ�\P��$��c��bYYV� ��'�@�;�z�� j�l�-���1`0B��12e�T���h�a�u�$ۂ%J�-&Ka2J�P�#��L0ݵ���Y1lLA��H&Spuv�����n0��lJ[ �  ���l��<J�������H��bl���&���/����^�9�� �5!���X�W��7������ �V $�-@�,���PJ8!$9�!�5H@)=`��
��o��-D�����G>p����P���V`DF�Т͖��~������b#<GX��Ka�Vz��S������c���HC���CV���&閎,�vdy��U��K4m6�,�IlH�܀Pe�n�<zV���ֈ�u����c�<Y��n9�G��=&%�1��M�ʱ��F���x��P_vx	����5c|w����W[��di=
�I;0���v�i�os�Pma.����G�m��QN�M�#C0����)�WY�M�K���EL�� �Ԑ�{��a��Eǁ�l��>f[֑�i ������%"##�Pt622��fd\s��q�#B����J��M6Ki�'@�%v"c6f"9�����D��P���v�y�M��U&nk/��3YfW)�v��������f�o�v�jN,�u�����8�Y�L������ �ߣ��+�xĩ���ϫ��DZ���3]~��Σ����G^�3z��#/��a���^�v�/D�o�MN��u�twL�Ǌ䅷�
:7��o�>��.n���=��#���	�vlv=p��ρ��md�M�� #�5�2�#�-�3��Q"��I�Л*?�D�!��q��)8 ��q��ʡ��k�>������O�-��Q�-c���v���A����W7O{\�g��Vx�V=���>�\>�!�خ?�s<֫@'e�!��,A9�R�~�}�=�O>A<������-V\�Ҁwk��pk�­1aZh0��m�>�:\,n�p����Ҷ_��L
7r̴o���*�����qc�i���7�z��̯�
ܤ��ݮ�>�2+}rj���Q~�zYW�����eؾ�d	��۸U�L��n,��ۢ<}�p�Qd�֜�[��M�>��񍬪�*�j�R�/������']���Pte[�o���h������/A�*1~�se�D:~销�Nn��˳�	���BFpC��=�?n�c��7��N��J�G�kp��t���M�>�s���bu��J���/�Hw�xᵽ=�vݲq���Ws
�/H���*�X��mL��胟*[�Gp�ָ�{5�%mR��?~��IU�qk�(�&�n?���7O�t�K��$|��@>�c���ɪ����J���9Y��X�]�:ǆtxe4�X7�S,l�xE�\#���/�������CX���}�bZ廰���۳%A+~=�Mn@�X���=��6�=~.E�D/&ǘrp�1^���V8��<����O�q[RHwW?�b���m����tD�z9*/������zCM�� �U11�,�T>�X�:%��ɠ�eV-x��j�o�$�c� ͓St4&As������DZc�����償�{֩V���4L+E��D���a��w�^������~7&�dL&��
�d� |��.�<�|~�9���3��<Zx�������5rS�������ڣv!�:	?�&��}�O��e����X+���w��˯?����Ϳ��?��嗷�����×o���~���������/���?|���?�������~��75���o������a	�      7   *   x���  İw2R��2�?'�(�I�7a�K������      5   �  x���n�F�ף�8�	*��LIvV��(m%���@�͐<����03�#=O6}���b���-�dQd�ə�s���$���V4�cj�W�X&}�6u����U��ǵw�>�2�AoB��QF�ؿvzUK[wi)��h|-.���B�f���nl-����$���Ȋ�@˭�R���NN	�'y>��Kʮܯ�x.���2��V���K�V}��>-U�UEo��FZ+.eTl#W(M�l����l7Q\�N�l轿쒴Q��8�Z3}X��[�b�䁷�t�O����K�dP;e�V�����2ʂ`�O��.��
{iÊ�X�kg��Y���)X��}��|P�g[1]}��ܰ�������~�9T��ei�j��'|�Yf�=wa�̾l�E���5�f#����djq�V�Jk����r�G���E$
E��=H��X���`E!���6�9eCթ�oX��6�=R�`q�[��3�}z_FW�a�����܍c���	;A��}�"8K)�o�K�)e�� 'q%+崫�4C�|L���rqv:I�- �,�M��a��4��@ы�ŗ�~ �Io2���~E�]"U>E�E�
t�u>������WH�i,S؇��H[�v7�4�Jt#�v*��"�U޿��&z�v��9ҹB<��k4[ y3W6`��	GmM�,7�h�q-�C|���`�-!D\��Zղ͟q֕�Y$(�H����d%�\��&��^k��i��\�у��;H�]�FS��#|^�EJ���E�����*�I��(ܻ)T�j�'I>w�һU	TA����C�-�ɒ:'b��i��[�}���i�n׏������ T4�1
�y��Q�.�_+Gy>8�X&�+��G^�f�[��XK���z�bZ	�+u@t���pl�]��f�#������yo8�粼s��h.�LN�w7��6y_ᩡ/|���%ľ�ǣ�I�� ��a��D�Z���-8�;O;��w�G��Z�E�d`���Ԛ�����:���s��Sp�(|2�x�wic���?�����G� �0d�k�V�r?������״2*��ѻ�``?z�~���h���[�Y�� ���F�O#z_�m�k�&�1:,�ML�o,��ag-�r�1UK�3&��I���vF��}hE����L:��x�`�f�ޅS���p�v8|�¦�S��ĸ��_�����B�Dˈ�Q����lg�����ɳ�>���ӿ��N�?��<�      3   �  x��=r�0���)���2��hJre9�e'�Ǳ2v�fE�(�@P��ȗI�3��X�&?U�aC,\��e
�<Y�fE
���풭_�1��w��Jq��ݳ����a��v����tH8J���c�<�~���m�h25,z�pх���^���U��w�םK(����#���Z�s��5��R��\�sg_��Ób�g�T��ƒِٰs'��b�a��I3K/��1�ҩ.L'B:�j��ΰ�}���Զ�`��d<*��a�&��i4��j�����4���5���2{�ϯ;������C�b�i��d7r�Ѵ7��L��k�*q�^[6?�6��s�Z�2�Z^��\���;�A(I��D����B�£�c�"�9Y�N&chI�ݳ�v�!I�a~V��iV�%��n2�;C����\����Rʥ�+��!I�����#x��V|�C��JU�Ug ��R�����Y]c��8���i�o�Y�h��[2=ٝ@���f(���g�+���}�K�ձ�l�7�ʒ��O`AXT�_N�3X<����\Sl����Z7��6��L,�x`����{2MOíq��d�֝a<4�T�4�k�ú�`�F���7��#�ZƏʳ�F���p��!��SE�w�n�      )   P   x�]��� C�s=E���P �t�9Joɧ'���X�NS�S�6U��k��M}�Q:��1p���}5�V�5�� ���S      -   &  x����N�0���S�HӦՎ��m.\B��TI�^�g��p>��ɮ�V���t��j����az�A�uR��t��^�T���� ���(��5�-4hZ|қphY���t���3>��X�͠�Obq�D�o�̨�Qz�G��$5T<�	�)toBOK�q7M���[�#%��D6g%V�Y�Fzo>tF���]i �4 m	?��$���9����i�4���4��sY���`zaF���^��n�<(�a:ҡX0���A1KX�<A���ee�W��o���&      8   *   x���  İw2R��2�?'�(�I�7a�K������     