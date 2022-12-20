--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Debian 13.8-1.pgdg110+1)
-- Dumped by pg_dump version 13.8 (Debian 13.8-1.pgdg110+1)

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

--
-- Name: emaildeliverytype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.emaildeliverytype AS ENUM (
    'attachment',
    'inline'
);


ALTER TYPE public.emaildeliverytype OWNER TO postgres;

--
-- Name: objecttypes; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.objecttypes AS ENUM (
    'query',
    'chart',
    'dashboard',
    'dataset'
);


ALTER TYPE public.objecttypes OWNER TO postgres;

--
-- Name: sliceemailreportformat; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sliceemailreportformat AS ENUM (
    'visualization',
    'data'
);


ALTER TYPE public.sliceemailreportformat OWNER TO postgres;

--
-- Name: tagtypes; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tagtypes AS ENUM (
    'custom',
    'type',
    'owner',
    'favorited_by'
);


ALTER TYPE public.tagtypes OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO postgres;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_id_seq OWNER TO postgres;

--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO postgres;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_id_seq OWNER TO postgres;

--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO postgres;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_role_id_seq OWNER TO postgres;

--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    email character varying(64) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO postgres;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_register_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_register_user_id_seq OWNER TO postgres;

--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO postgres;

--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_role_id_seq OWNER TO postgres;

--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(64) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO postgres;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO postgres;

--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO postgres;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_role_id_seq OWNER TO postgres;

--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO postgres;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_view_menu_id_seq OWNER TO postgres;

--
-- Name: access_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_request (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    datasource_type character varying(200),
    datasource_id integer,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.access_request OWNER TO postgres;

--
-- Name: access_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.access_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_request_id_seq OWNER TO postgres;

--
-- Name: access_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.access_request_id_seq OWNED BY public.access_request.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: alert_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert_logs (
    id integer NOT NULL,
    scheduled_dttm timestamp without time zone,
    dttm_start timestamp without time zone,
    dttm_end timestamp without time zone,
    alert_id integer,
    state character varying(10)
);


ALTER TABLE public.alert_logs OWNER TO postgres;

--
-- Name: alert_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alert_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alert_logs_id_seq OWNER TO postgres;

--
-- Name: alert_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alert_logs_id_seq OWNED BY public.alert_logs.id;


--
-- Name: alert_owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert_owner (
    id integer NOT NULL,
    user_id integer,
    alert_id integer
);


ALTER TABLE public.alert_owner OWNER TO postgres;

--
-- Name: alert_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alert_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alert_owner_id_seq OWNER TO postgres;

--
-- Name: alert_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alert_owner_id_seq OWNED BY public.alert_owner.id;


--
-- Name: alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alerts (
    id integer NOT NULL,
    label character varying(150) NOT NULL,
    active boolean,
    crontab character varying(50) NOT NULL,
    alert_type character varying(50),
    log_retention integer NOT NULL,
    grace_period integer NOT NULL,
    recipients text,
    slice_id integer,
    dashboard_id integer,
    last_eval_dttm timestamp without time zone,
    last_state character varying(10),
    slack_channel text,
    changed_by_fk integer,
    changed_on timestamp without time zone,
    created_by_fk integer,
    created_on timestamp without time zone,
    validator_config text,
    database_id integer NOT NULL,
    sql text NOT NULL,
    validator_type character varying(100) NOT NULL
);


ALTER TABLE public.alerts OWNER TO postgres;

--
-- Name: alerts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alerts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alerts_id_seq OWNER TO postgres;

--
-- Name: alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alerts_id_seq OWNED BY public.alerts.id;


--
-- Name: annotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    layer_id integer,
    short_descr character varying(500),
    long_descr text,
    changed_by_fk integer,
    created_by_fk integer,
    json_metadata text
);


ALTER TABLE public.annotation OWNER TO postgres;

--
-- Name: annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_id_seq OWNER TO postgres;

--
-- Name: annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_id_seq OWNED BY public.annotation.id;


--
-- Name: annotation_layer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_layer (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    descr text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.annotation_layer OWNER TO postgres;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_layer_id_seq OWNER TO postgres;

--
-- Name: annotation_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_layer_id_seq OWNED BY public.annotation_layer.id;


--
-- Name: cache_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_keys (
    id integer NOT NULL,
    cache_key character varying(256) NOT NULL,
    cache_timeout integer,
    datasource_uid character varying(64) NOT NULL,
    created_on timestamp without time zone
);


ALTER TABLE public.cache_keys OWNER TO postgres;

--
-- Name: cache_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cache_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cache_keys_id_seq OWNER TO postgres;

--
-- Name: cache_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cache_keys_id_seq OWNED BY public.cache_keys.id;


--
-- Name: clusters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clusters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    cluster_name character varying(250) NOT NULL,
    broker_host character varying(255),
    broker_port integer,
    broker_endpoint character varying(255),
    metadata_last_refreshed timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    cache_timeout integer,
    verbose_name character varying(250),
    broker_pass bytea,
    broker_user character varying(255),
    uuid uuid
);


ALTER TABLE public.clusters OWNER TO postgres;

--
-- Name: clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_id_seq OWNER TO postgres;

--
-- Name: clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clusters_id_seq OWNED BY public.clusters.id;


--
-- Name: columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    column_name character varying(255) NOT NULL,
    is_active boolean,
    type character varying(32),
    groupby boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    dimension_spec_json text,
    verbose_name character varying(1024),
    datasource_id integer,
    uuid uuid,
    advanced_data_type character varying(255)
);


ALTER TABLE public.columns OWNER TO postgres;

--
-- Name: columns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.columns_id_seq OWNER TO postgres;

--
-- Name: columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.columns_id_seq OWNED BY public.columns.id;


--
-- Name: css_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.css_templates (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    template_name character varying(250),
    css text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.css_templates OWNER TO postgres;

--
-- Name: css_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.css_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.css_templates_id_seq OWNER TO postgres;

--
-- Name: css_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.css_templates_id_seq OWNED BY public.css_templates.id;


--
-- Name: dashboard_email_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_email_schedules (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    active boolean,
    crontab character varying(50),
    recipients text,
    deliver_as_group boolean,
    delivery_type public.emaildeliverytype,
    dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer,
    user_id integer,
    slack_channel text,
    uuid uuid
);


ALTER TABLE public.dashboard_email_schedules OWNER TO postgres;

--
-- Name: dashboard_email_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_email_schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_email_schedules_id_seq OWNER TO postgres;

--
-- Name: dashboard_email_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_email_schedules_id_seq OWNED BY public.dashboard_email_schedules.id;


--
-- Name: dashboard_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    dashboard_id integer
);


ALTER TABLE public.dashboard_roles OWNER TO postgres;

--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_roles_id_seq OWNER TO postgres;

--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_roles_id_seq OWNED BY public.dashboard_roles.id;


--
-- Name: dashboard_slices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_slices (
    id integer NOT NULL,
    dashboard_id integer,
    slice_id integer
);


ALTER TABLE public.dashboard_slices OWNER TO postgres;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_slices_id_seq OWNER TO postgres;

--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_slices_id_seq OWNED BY public.dashboard_slices.id;


--
-- Name: dashboard_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_user (
    id integer NOT NULL,
    user_id integer,
    dashboard_id integer
);


ALTER TABLE public.dashboard_user OWNER TO postgres;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_user_id_seq OWNER TO postgres;

--
-- Name: dashboard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_user_id_seq OWNED BY public.dashboard_user.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    dashboard_title character varying(500),
    position_json text,
    created_by_fk integer,
    changed_by_fk integer,
    css text,
    description text,
    slug character varying(255),
    json_metadata text,
    published boolean,
    uuid uuid,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dashboards OWNER TO postgres;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboards_id_seq OWNER TO postgres;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- Name: datasources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.datasources (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    datasource_name character varying(255) NOT NULL,
    is_featured boolean,
    is_hidden boolean,
    description text,
    default_endpoint text,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    cache_timeout integer,
    perm character varying(1000),
    filter_select_enabled boolean,
    params character varying(1000),
    fetch_values_from character varying(100),
    schema_perm character varying(1000),
    cluster_id integer NOT NULL,
    uuid uuid,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.datasources OWNER TO postgres;

--
-- Name: datasources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.datasources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.datasources_id_seq OWNER TO postgres;

--
-- Name: datasources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.datasources_id_seq OWNED BY public.datasources.id;


--
-- Name: dbs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dbs (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_name character varying(250) NOT NULL,
    sqlalchemy_uri character varying(1024) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    password bytea,
    cache_timeout integer,
    extra text,
    select_as_create_table_as boolean,
    allow_ctas boolean,
    expose_in_sqllab boolean,
    force_ctas_schema character varying(250),
    allow_run_async boolean,
    allow_dml boolean,
    verbose_name character varying(250),
    impersonate_user boolean,
    allow_file_upload boolean DEFAULT true NOT NULL,
    encrypted_extra bytea,
    server_cert bytea,
    allow_cvas boolean,
    uuid uuid,
    configuration_method character varying(255) DEFAULT 'sqlalchemy_form'::character varying,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dbs OWNER TO postgres;

--
-- Name: dbs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dbs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbs_id_seq OWNER TO postgres;

--
-- Name: dbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dbs_id_seq OWNED BY public.dbs.id;


--
-- Name: druiddatasource_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.druiddatasource_user (
    id integer NOT NULL,
    user_id integer,
    datasource_id integer
);


ALTER TABLE public.druiddatasource_user OWNER TO postgres;

--
-- Name: druiddatasource_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.druiddatasource_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.druiddatasource_user_id_seq OWNER TO postgres;

--
-- Name: druiddatasource_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.druiddatasource_user_id_seq OWNED BY public.druiddatasource_user.id;


--
-- Name: dynamic_plugin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dynamic_plugin (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    bundle_url character varying(1000) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.dynamic_plugin OWNER TO postgres;

--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dynamic_plugin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dynamic_plugin_id_seq OWNER TO postgres;

--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dynamic_plugin_id_seq OWNED BY public.dynamic_plugin.id;


--
-- Name: embedded_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.embedded_dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    allow_domain_list text,
    uuid uuid,
    dashboard_id integer NOT NULL,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.embedded_dashboards OWNER TO postgres;

--
-- Name: favstar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favstar (
    id integer NOT NULL,
    user_id integer,
    class_name character varying(50),
    obj_id integer,
    dttm timestamp without time zone
);


ALTER TABLE public.favstar OWNER TO postgres;

--
-- Name: favstar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favstar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favstar_id_seq OWNER TO postgres;

--
-- Name: favstar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favstar_id_seq OWNED BY public.favstar.id;


--
-- Name: filter_sets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filter_sets (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    description text,
    json_metadata text NOT NULL,
    owner_id integer NOT NULL,
    owner_type character varying(255) NOT NULL,
    dashboard_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.filter_sets OWNER TO postgres;

--
-- Name: filter_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filter_sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_sets_id_seq OWNER TO postgres;

--
-- Name: filter_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_sets_id_seq OWNED BY public.filter_sets.id;


--
-- Name: key_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.key_value (
    id integer NOT NULL,
    resource character varying(32) NOT NULL,
    value bytea NOT NULL,
    uuid uuid,
    created_on timestamp without time zone,
    created_by_fk integer,
    changed_on timestamp without time zone,
    changed_by_fk integer,
    expires_on timestamp without time zone
);


ALTER TABLE public.key_value OWNER TO postgres;

--
-- Name: key_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.key_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.key_value_id_seq OWNER TO postgres;

--
-- Name: key_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.key_value_id_seq OWNED BY public.key_value.id;


--
-- Name: keyvalue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keyvalue (
    id integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.keyvalue OWNER TO postgres;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keyvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keyvalue_id_seq OWNER TO postgres;

--
-- Name: keyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keyvalue_id_seq OWNED BY public.keyvalue.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(512),
    user_id integer,
    json text,
    dttm timestamp without time zone,
    dashboard_id integer,
    slice_id integer,
    duration_ms integer,
    referrer character varying(1024)
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO postgres;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metrics (
    id integer NOT NULL,
    metric_name character varying(255) NOT NULL,
    verbose_name character varying(1024),
    metric_type character varying(32),
    json text NOT NULL,
    description text,
    changed_by_fk integer,
    changed_on timestamp without time zone,
    created_by_fk integer,
    created_on timestamp without time zone,
    d3format character varying(128),
    warning_text text,
    datasource_id integer,
    uuid uuid
);


ALTER TABLE public.metrics OWNER TO postgres;

--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metrics_id_seq OWNER TO postgres;

--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metrics_id_seq OWNED BY public.metrics.id;


--
-- Name: query; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.query (
    id integer NOT NULL,
    client_id character varying(11) NOT NULL,
    database_id integer NOT NULL,
    tmp_table_name character varying(256),
    tab_name character varying(256),
    sql_editor_id character varying(256),
    user_id integer,
    status character varying(16),
    schema character varying(256),
    sql text,
    select_sql text,
    executed_sql text,
    "limit" integer,
    select_as_cta boolean,
    select_as_cta_used boolean,
    progress integer,
    rows integer,
    error_message text,
    start_time numeric(20,6),
    changed_on timestamp without time zone,
    end_time numeric(20,6),
    results_key character varying(64),
    start_running_time numeric(20,6),
    end_result_backend_time numeric(20,6),
    tracking_url text,
    extra_json text,
    tmp_schema_name character varying(256),
    ctas_method character varying(16),
    limiting_factor character varying(255) DEFAULT 'UNKNOWN'::character varying
);


ALTER TABLE public.query OWNER TO postgres;

--
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_id_seq OWNER TO postgres;

--
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.query_id_seq OWNED BY public.query.id;


--
-- Name: report_execution_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_execution_log (
    id integer NOT NULL,
    scheduled_dttm timestamp without time zone NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    value double precision,
    value_row_json text,
    state character varying(50) NOT NULL,
    error_message text,
    report_schedule_id integer NOT NULL,
    uuid uuid
);


ALTER TABLE public.report_execution_log OWNER TO postgres;

--
-- Name: report_execution_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_execution_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_execution_log_id_seq OWNER TO postgres;

--
-- Name: report_execution_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_execution_log_id_seq OWNED BY public.report_execution_log.id;


--
-- Name: report_recipient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_recipient (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    recipient_config_json text,
    report_schedule_id integer NOT NULL,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.report_recipient OWNER TO postgres;

--
-- Name: report_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_recipient_id_seq OWNER TO postgres;

--
-- Name: report_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_recipient_id_seq OWNED BY public.report_recipient.id;


--
-- Name: report_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_schedule (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    context_markdown text,
    active boolean,
    crontab character varying(1000) NOT NULL,
    sql text,
    chart_id integer,
    dashboard_id integer,
    database_id integer,
    last_eval_dttm timestamp without time zone,
    last_state character varying(50),
    last_value double precision,
    last_value_row_json text,
    validator_type character varying(100),
    validator_config_json text,
    log_retention integer,
    grace_period integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    working_timeout integer,
    report_format character varying(50) DEFAULT 'PNG'::character varying,
    creation_method character varying(255) DEFAULT 'alerts_reports'::character varying,
    timezone character varying(100) DEFAULT 'UTC'::character varying NOT NULL,
    extra_json text NOT NULL,
    force_screenshot boolean
);


ALTER TABLE public.report_schedule OWNER TO postgres;

--
-- Name: report_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_schedule_id_seq OWNER TO postgres;

--
-- Name: report_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_schedule_id_seq OWNED BY public.report_schedule.id;


--
-- Name: report_schedule_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_schedule_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    report_schedule_id integer NOT NULL
);


ALTER TABLE public.report_schedule_user OWNER TO postgres;

--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_schedule_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_schedule_user_id_seq OWNER TO postgres;

--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_schedule_user_id_seq OWNED BY public.report_schedule_user.id;


--
-- Name: rls_filter_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rls_filter_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_roles OWNER TO postgres;

--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rls_filter_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rls_filter_roles_id_seq OWNER TO postgres;

--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rls_filter_roles_id_seq OWNED BY public.rls_filter_roles.id;


--
-- Name: rls_filter_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rls_filter_tables (
    id integer NOT NULL,
    table_id integer,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_tables OWNER TO postgres;

--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rls_filter_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rls_filter_tables_id_seq OWNER TO postgres;

--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rls_filter_tables_id_seq OWNED BY public.rls_filter_tables.id;


--
-- Name: row_level_security_filters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.row_level_security_filters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    clause text NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    filter_type character varying(255),
    group_key character varying(255),
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.row_level_security_filters OWNER TO postgres;

--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.row_level_security_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.row_level_security_filters_id_seq OWNER TO postgres;

--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.row_level_security_filters_id_seq OWNED BY public.row_level_security_filters.id;


--
-- Name: saved_query; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saved_query (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    db_id integer,
    label character varying(256),
    schema character varying(128),
    sql text,
    description text,
    changed_by_fk integer,
    created_by_fk integer,
    extra_json text,
    last_run timestamp without time zone,
    rows integer,
    uuid uuid,
    template_parameters text
);


ALTER TABLE public.saved_query OWNER TO postgres;

--
-- Name: saved_query_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.saved_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_query_id_seq OWNER TO postgres;

--
-- Name: saved_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.saved_query_id_seq OWNED BY public.saved_query.id;


--
-- Name: sl_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_columns (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    is_aggregation boolean NOT NULL,
    is_additive boolean NOT NULL,
    is_dimensional boolean NOT NULL,
    is_filterable boolean NOT NULL,
    is_increase_desired boolean NOT NULL,
    is_managed_externally boolean NOT NULL,
    is_partition boolean NOT NULL,
    is_physical boolean NOT NULL,
    is_temporal boolean NOT NULL,
    is_spatial boolean NOT NULL,
    name text,
    type text,
    unit text,
    expression text,
    description text,
    warning_text text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer,
    advanced_data_type text
);


ALTER TABLE public.sl_columns OWNER TO postgres;

--
-- Name: sl_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sl_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sl_columns_id_seq OWNER TO postgres;

--
-- Name: sl_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sl_columns_id_seq OWNED BY public.sl_columns.id;


--
-- Name: sl_dataset_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_dataset_columns (
    dataset_id integer NOT NULL,
    column_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_columns OWNER TO postgres;

--
-- Name: sl_dataset_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_dataset_tables (
    dataset_id integer NOT NULL,
    table_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_tables OWNER TO postgres;

--
-- Name: sl_dataset_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_dataset_users (
    dataset_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_users OWNER TO postgres;

--
-- Name: sl_datasets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_datasets (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_id integer NOT NULL,
    is_physical boolean,
    is_managed_externally boolean NOT NULL,
    name text,
    expression text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.sl_datasets OWNER TO postgres;

--
-- Name: sl_datasets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sl_datasets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sl_datasets_id_seq OWNER TO postgres;

--
-- Name: sl_datasets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sl_datasets_id_seq OWNED BY public.sl_datasets.id;


--
-- Name: sl_table_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_table_columns (
    table_id integer NOT NULL,
    column_id integer NOT NULL
);


ALTER TABLE public.sl_table_columns OWNER TO postgres;

--
-- Name: sl_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_tables (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_id integer NOT NULL,
    is_managed_externally boolean NOT NULL,
    catalog text,
    schema text,
    name text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.sl_tables OWNER TO postgres;

--
-- Name: sl_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sl_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sl_tables_id_seq OWNER TO postgres;

--
-- Name: sl_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sl_tables_id_seq OWNED BY public.sl_tables.id;


--
-- Name: slice_email_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slice_email_schedules (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    active boolean,
    crontab character varying(50),
    recipients text,
    deliver_as_group boolean,
    delivery_type public.emaildeliverytype,
    slice_id integer,
    email_format public.sliceemailreportformat,
    created_by_fk integer,
    changed_by_fk integer,
    user_id integer,
    slack_channel text,
    uuid uuid
);


ALTER TABLE public.slice_email_schedules OWNER TO postgres;

--
-- Name: slice_email_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slice_email_schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slice_email_schedules_id_seq OWNER TO postgres;

--
-- Name: slice_email_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slice_email_schedules_id_seq OWNED BY public.slice_email_schedules.id;


--
-- Name: slice_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slice_user (
    id integer NOT NULL,
    user_id integer,
    slice_id integer
);


ALTER TABLE public.slice_user OWNER TO postgres;

--
-- Name: slice_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slice_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slice_user_id_seq OWNER TO postgres;

--
-- Name: slice_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slice_user_id_seq OWNED BY public.slice_user.id;


--
-- Name: slices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slices (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    slice_name character varying(250),
    datasource_type character varying(200),
    datasource_name character varying(2000),
    viz_type character varying(250),
    params text,
    created_by_fk integer,
    changed_by_fk integer,
    description text,
    cache_timeout integer,
    perm character varying(2000),
    datasource_id integer,
    schema_perm character varying(1000),
    uuid uuid,
    query_context text,
    last_saved_at timestamp without time zone,
    last_saved_by_fk integer,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.slices OWNER TO postgres;

--
-- Name: slices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slices_id_seq OWNER TO postgres;

--
-- Name: slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slices_id_seq OWNED BY public.slices.id;


--
-- Name: sql_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sql_metrics (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    metric_name character varying(255) NOT NULL,
    verbose_name character varying(1024),
    metric_type character varying(32),
    table_id integer,
    expression text NOT NULL,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    d3format character varying(128),
    warning_text text,
    extra text,
    uuid uuid
);


ALTER TABLE public.sql_metrics OWNER TO postgres;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sql_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_metrics_id_seq OWNER TO postgres;

--
-- Name: sql_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sql_metrics_id_seq OWNED BY public.sql_metrics.id;


--
-- Name: sql_observations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sql_observations (
    id integer NOT NULL,
    dttm timestamp without time zone,
    alert_id integer,
    value double precision,
    error_msg character varying(500)
);


ALTER TABLE public.sql_observations OWNER TO postgres;

--
-- Name: sql_observations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sql_observations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_observations_id_seq OWNER TO postgres;

--
-- Name: sql_observations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sql_observations_id_seq OWNED BY public.sql_observations.id;


--
-- Name: sqlatable_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sqlatable_user (
    id integer NOT NULL,
    user_id integer,
    table_id integer
);


ALTER TABLE public.sqlatable_user OWNER TO postgres;

--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sqlatable_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sqlatable_user_id_seq OWNER TO postgres;

--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sqlatable_user_id_seq OWNED BY public.sqlatable_user.id;


--
-- Name: tab_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_state (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    user_id integer,
    label character varying(256),
    active boolean,
    database_id integer,
    schema character varying(256),
    sql text,
    query_limit integer,
    latest_query_id character varying(11),
    autorun boolean NOT NULL,
    template_params text,
    created_by_fk integer,
    changed_by_fk integer,
    hide_left_bar boolean DEFAULT false NOT NULL,
    saved_query_id integer
);


ALTER TABLE public.tab_state OWNER TO postgres;

--
-- Name: tab_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_state_id_seq OWNER TO postgres;

--
-- Name: tab_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_state_id_seq OWNED BY public.tab_state.id;


--
-- Name: table_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.table_columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_id integer,
    column_name character varying(255) NOT NULL,
    is_dttm boolean,
    is_active boolean,
    type text,
    groupby boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    expression text,
    verbose_name character varying(1024),
    python_date_format character varying(255),
    uuid uuid,
    extra text,
    advanced_data_type character varying(255)
);


ALTER TABLE public.table_columns OWNER TO postgres;

--
-- Name: table_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_columns_id_seq OWNER TO postgres;

--
-- Name: table_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_columns_id_seq OWNED BY public.table_columns.id;


--
-- Name: table_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.table_schema (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    tab_state_id integer,
    database_id integer NOT NULL,
    schema character varying(256),
    "table" character varying(256),
    description text,
    expanded boolean,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.table_schema OWNER TO postgres;

--
-- Name: table_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_schema_id_seq OWNER TO postgres;

--
-- Name: table_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_schema_id_seq OWNED BY public.table_schema.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_name character varying(250) NOT NULL,
    main_dttm_col character varying(250),
    default_endpoint text,
    database_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    description text,
    is_featured boolean,
    cache_timeout integer,
    schema character varying(255),
    sql text,
    params text,
    perm character varying(1000),
    filter_select_enabled boolean,
    fetch_values_predicate text,
    is_sqllab_view boolean DEFAULT false,
    template_params text,
    schema_perm character varying(1000),
    extra text,
    uuid uuid,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_id_seq OWNER TO postgres;

--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    type public.tagtypes,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO postgres;

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tagged_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tagged_object (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    tag_id integer,
    object_id integer,
    object_type public.objecttypes,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.tagged_object OWNER TO postgres;

--
-- Name: tagged_object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tagged_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagged_object_id_seq OWNER TO postgres;

--
-- Name: tagged_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tagged_object_id_seq OWNED BY public.tagged_object.id;


--
-- Name: url; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.url (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    url text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.url OWNER TO postgres;

--
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.url_id_seq OWNER TO postgres;

--
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_attribute (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    welcome_dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.user_attribute OWNER TO postgres;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_attribute_id_seq OWNER TO postgres;

--
-- Name: user_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_attribute_id_seq OWNED BY public.user_attribute.id;


--
-- Name: access_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_request ALTER COLUMN id SET DEFAULT nextval('public.access_request_id_seq'::regclass);


--
-- Name: alert_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_logs ALTER COLUMN id SET DEFAULT nextval('public.alert_logs_id_seq'::regclass);


--
-- Name: alert_owner id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_owner ALTER COLUMN id SET DEFAULT nextval('public.alert_owner_id_seq'::regclass);


--
-- Name: alerts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts ALTER COLUMN id SET DEFAULT nextval('public.alerts_id_seq'::regclass);


--
-- Name: annotation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_id_seq'::regclass);


--
-- Name: annotation_layer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_layer ALTER COLUMN id SET DEFAULT nextval('public.annotation_layer_id_seq'::regclass);


--
-- Name: cache_keys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_keys ALTER COLUMN id SET DEFAULT nextval('public.cache_keys_id_seq'::regclass);


--
-- Name: clusters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters ALTER COLUMN id SET DEFAULT nextval('public.clusters_id_seq'::regclass);


--
-- Name: columns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns ALTER COLUMN id SET DEFAULT nextval('public.columns_id_seq'::regclass);


--
-- Name: css_templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.css_templates ALTER COLUMN id SET DEFAULT nextval('public.css_templates_id_seq'::regclass);


--
-- Name: dashboard_email_schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_email_schedules ALTER COLUMN id SET DEFAULT nextval('public.dashboard_email_schedules_id_seq'::regclass);


--
-- Name: dashboard_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_roles ALTER COLUMN id SET DEFAULT nextval('public.dashboard_roles_id_seq'::regclass);


--
-- Name: dashboard_slices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices ALTER COLUMN id SET DEFAULT nextval('public.dashboard_slices_id_seq'::regclass);


--
-- Name: dashboard_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_user ALTER COLUMN id SET DEFAULT nextval('public.dashboard_user_id_seq'::regclass);


--
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- Name: datasources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasources ALTER COLUMN id SET DEFAULT nextval('public.datasources_id_seq'::regclass);


--
-- Name: dbs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs ALTER COLUMN id SET DEFAULT nextval('public.dbs_id_seq'::regclass);


--
-- Name: druiddatasource_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.druiddatasource_user ALTER COLUMN id SET DEFAULT nextval('public.druiddatasource_user_id_seq'::regclass);


--
-- Name: dynamic_plugin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin ALTER COLUMN id SET DEFAULT nextval('public.dynamic_plugin_id_seq'::regclass);


--
-- Name: favstar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favstar ALTER COLUMN id SET DEFAULT nextval('public.favstar_id_seq'::regclass);


--
-- Name: filter_sets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets ALTER COLUMN id SET DEFAULT nextval('public.filter_sets_id_seq'::regclass);


--
-- Name: key_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value ALTER COLUMN id SET DEFAULT nextval('public.key_value_id_seq'::regclass);


--
-- Name: keyvalue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyvalue ALTER COLUMN id SET DEFAULT nextval('public.keyvalue_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: metrics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics ALTER COLUMN id SET DEFAULT nextval('public.metrics_id_seq'::regclass);


--
-- Name: query id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query ALTER COLUMN id SET DEFAULT nextval('public.query_id_seq'::regclass);


--
-- Name: report_execution_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_execution_log ALTER COLUMN id SET DEFAULT nextval('public.report_execution_log_id_seq'::regclass);


--
-- Name: report_recipient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient ALTER COLUMN id SET DEFAULT nextval('public.report_recipient_id_seq'::regclass);


--
-- Name: report_schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_id_seq'::regclass);


--
-- Name: report_schedule_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule_user ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_user_id_seq'::regclass);


--
-- Name: rls_filter_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_roles ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_roles_id_seq'::regclass);


--
-- Name: rls_filter_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_tables ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_tables_id_seq'::regclass);


--
-- Name: row_level_security_filters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters ALTER COLUMN id SET DEFAULT nextval('public.row_level_security_filters_id_seq'::regclass);


--
-- Name: saved_query id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query ALTER COLUMN id SET DEFAULT nextval('public.saved_query_id_seq'::regclass);


--
-- Name: sl_columns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns ALTER COLUMN id SET DEFAULT nextval('public.sl_columns_id_seq'::regclass);


--
-- Name: sl_datasets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets ALTER COLUMN id SET DEFAULT nextval('public.sl_datasets_id_seq'::regclass);


--
-- Name: sl_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables ALTER COLUMN id SET DEFAULT nextval('public.sl_tables_id_seq'::regclass);


--
-- Name: slice_email_schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_email_schedules ALTER COLUMN id SET DEFAULT nextval('public.slice_email_schedules_id_seq'::regclass);


--
-- Name: slice_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_user ALTER COLUMN id SET DEFAULT nextval('public.slice_user_id_seq'::regclass);


--
-- Name: slices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices ALTER COLUMN id SET DEFAULT nextval('public.slices_id_seq'::regclass);


--
-- Name: sql_metrics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics ALTER COLUMN id SET DEFAULT nextval('public.sql_metrics_id_seq'::regclass);


--
-- Name: sql_observations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_observations ALTER COLUMN id SET DEFAULT nextval('public.sql_observations_id_seq'::regclass);


--
-- Name: sqlatable_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sqlatable_user ALTER COLUMN id SET DEFAULT nextval('public.sqlatable_user_id_seq'::regclass);


--
-- Name: tab_state id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state ALTER COLUMN id SET DEFAULT nextval('public.tab_state_id_seq'::regclass);


--
-- Name: table_columns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns ALTER COLUMN id SET DEFAULT nextval('public.table_columns_id_seq'::regclass);


--
-- Name: table_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema ALTER COLUMN id SET DEFAULT nextval('public.table_schema_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: tagged_object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object ALTER COLUMN id SET DEFAULT nextval('public.tagged_object_id_seq'::regclass);


--
-- Name: url id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- Name: user_attribute id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute ALTER COLUMN id SET DEFAULT nextval('public.user_attribute_id_seq'::regclass);


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_read
2	can_write
3	can_this_form_get
4	can_this_form_post
5	can_add
6	can_show
7	can_delete
8	can_userinfo
9	can_list
10	can_edit
11	resetmypassword
12	resetpasswords
13	userinfoedit
14	copyrole
15	can_get
16	can_invalidate
17	can_export
18	can_get_embedded
19	can_delete_embedded
20	can_set_embedded
21	can_duplicate
22	can_import_
23	can_download
24	muldelete
25	can_query
26	can_query_form_data
27	can_time_range
28	can_save
29	can_samples
30	can_external_metadata_by_name
31	can_external_metadata
32	can_get_value
33	can_store
34	can_my_queries
35	can_created_dashboards
36	can_dashboard_permalink
37	can_save_dash
38	can_slice
39	can_sqllab_history
40	can_search_queries
41	can_fave_slices
42	can_sql_json
43	can_request_access
44	can_recent_activity
45	can_tables
46	can_sqllab_table_viz
47	can_stop_query
48	can_approve
49	can_dashboard
50	can_profile
51	can_copy_dash
52	can_datasources
53	can_log
54	can_sqllab_viz
55	can_import_dashboards
56	can_explore
57	can_available_domains
58	can_fave_dashboards_by_username
59	can_filter
60	can_created_slices
61	can_slice_json
62	can_queries
63	can_fave_dashboards
64	can_extra_table_metadata
65	can_explore_json
66	can_testconn
67	can_sqllab
68	can_schemas_access_for_file_upload
69	can_add_slices
70	can_validate_sql_json
71	can_csv
72	can_results
73	can_fetch_datasource_metadata
74	can_annotation_json
75	can_user_slices
76	can_estimate_query_cost
77	can_override_role_permissions
78	can_warm_up_cache
79	can_favstar
80	can_post
81	can_expanded
82	can_delete_query
83	can_put
84	can_activate
85	can_migrate_query
86	can_suggestions
87	can_tagged_objects
88	can_grant_guest_token
89	menu_access
90	all_datasource_access
91	all_database_access
92	all_query_access
93	can_share_dashboard
94	can_share_chart
102	database_access
103	datasource_access
104	schema_access
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	2	2
5	1	3
6	2	3
7	1	4
8	2	4
9	1	5
10	2	5
11	1	6
12	2	6
13	1	7
14	2	7
15	1	8
16	2	8
17	1	9
18	2	9
19	1	10
20	3	15
21	4	15
22	3	16
23	4	16
24	3	17
25	4	17
26	5	19
27	6	19
28	7	19
29	8	19
30	9	19
31	10	19
32	11	19
33	12	19
34	13	19
35	5	20
36	6	20
37	7	20
38	9	20
39	10	20
40	14	20
41	15	21
42	6	22
43	15	23
44	9	24
45	1	25
46	1	26
47	16	27
48	17	4
49	2	29
50	1	29
51	2	30
52	1	30
53	18	8
54	19	8
55	20	8
56	17	8
57	17	9
58	17	6
59	21	6
60	1	31
61	1	32
62	2	33
63	1	33
64	2	34
65	1	34
66	5	35
67	9	35
68	10	35
69	7	35
70	17	36
71	22	36
72	17	1
73	5	37
74	6	37
75	7	37
76	23	37
77	2	37
78	9	37
79	10	37
80	5	38
81	6	38
82	7	38
83	23	38
84	9	38
85	10	38
86	24	38
87	25	39
88	26	39
89	27	39
90	3	40
91	4	40
92	3	41
93	4	41
94	3	42
95	4	42
96	15	43
97	28	43
98	29	43
99	30	43
100	31	43
101	32	45
102	33	45
103	34	47
104	35	48
105	36	48
106	37	48
107	38	48
108	39	48
109	40	48
110	41	48
111	42	48
112	43	48
113	44	48
114	45	48
115	46	48
116	47	48
117	48	48
118	49	48
119	50	48
120	51	48
121	52	48
122	53	48
123	54	48
124	55	48
125	56	48
126	57	48
127	58	48
128	59	48
129	60	48
130	61	48
131	62	48
132	63	48
133	64	48
134	65	48
135	66	48
136	67	48
137	68	48
138	69	48
139	70	48
140	71	48
141	72	48
142	73	48
143	74	48
144	75	48
145	76	48
146	77	48
147	78	48
148	79	48
149	80	49
150	7	49
151	81	49
152	82	50
153	7	50
154	83	50
155	15	50
156	84	50
157	80	50
158	85	50
159	86	51
160	7	51
161	15	51
162	87	51
163	80	51
164	88	52
165	1	52
166	5	53
167	6	53
168	7	53
169	9	53
170	10	53
171	24	53
172	89	54
173	89	55
174	89	56
175	89	57
176	89	58
177	89	59
178	89	60
179	89	61
180	89	62
181	89	63
182	89	64
183	89	65
184	89	66
185	89	67
186	89	68
187	89	69
188	89	70
189	89	71
190	89	72
191	89	73
192	89	74
193	89	75
194	90	76
195	91	77
196	92	78
197	93	48
198	94	48
227	102	119
228	103	120
229	104	121
230	103	122
231	103	123
232	103	124
233	104	125
234	103	126
235	103	127
236	103	128
237	103	129
238	103	130
239	103	131
240	103	132
241	103	133
242	103	134
243	103	135
244	103	136
245	103	137
246	103	138
247	104	139
248	103	140
249	103	141
250	103	142
251	104	143
252	103	144
253	104	145
254	103	146
255	104	147
256	103	148
257	104	149
258	103	150
259	104	151
260	103	152
261	103	153
262	104	154
263	103	155
264	103	156
265	104	157
266	103	158
267	103	159
268	103	160
269	103	161
270	103	162
271	103	163
272	103	164
273	103	165
274	103	166
275	103	167
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	20	1
2	21	1
3	22	1
4	23	1
5	24	1
6	25	1
7	26	1
8	27	1
9	28	1
10	29	1
11	30	1
12	31	1
13	32	1
14	33	1
15	34	1
16	35	1
17	36	1
18	37	1
19	38	1
20	39	1
21	40	1
22	41	1
23	42	1
24	43	1
25	9	1
26	10	1
27	44	1
28	45	1
29	46	1
30	47	1
31	48	1
32	7	1
33	8	1
34	3	1
35	4	1
36	49	1
37	50	1
38	51	1
39	52	1
40	53	1
41	54	1
42	55	1
43	56	1
44	15	1
45	16	1
46	57	1
47	17	1
48	18	1
49	58	1
50	59	1
51	11	1
52	12	1
53	60	1
54	61	1
55	62	1
56	63	1
57	64	1
58	65	1
59	66	1
60	67	1
61	68	1
62	69	1
63	70	1
64	71	1
65	19	1
66	5	1
67	6	1
68	72	1
69	1	1
70	2	1
71	73	1
72	74	1
73	75	1
74	76	1
75	77	1
76	78	1
77	79	1
78	80	1
79	81	1
80	82	1
81	83	1
82	84	1
83	85	1
84	86	1
85	87	1
86	88	1
87	89	1
88	90	1
89	91	1
90	92	1
91	93	1
92	94	1
93	95	1
94	96	1
95	97	1
96	98	1
97	99	1
98	100	1
99	101	1
100	102	1
101	103	1
102	104	1
103	105	1
104	106	1
105	107	1
106	108	1
107	109	1
108	110	1
109	111	1
110	112	1
111	113	1
112	114	1
113	115	1
114	116	1
115	117	1
116	118	1
117	119	1
118	120	1
119	121	1
120	122	1
121	123	1
122	124	1
123	125	1
124	126	1
125	127	1
126	128	1
127	129	1
128	130	1
129	131	1
130	132	1
131	133	1
132	134	1
133	135	1
134	136	1
135	137	1
136	138	1
137	139	1
138	140	1
139	141	1
140	142	1
141	143	1
142	144	1
143	145	1
144	146	1
145	147	1
146	148	1
147	149	1
148	150	1
149	151	1
150	152	1
151	153	1
152	154	1
153	155	1
154	156	1
155	157	1
156	158	1
157	159	1
158	160	1
159	161	1
160	162	1
161	163	1
162	13	1
163	14	1
164	164	1
165	165	1
166	166	1
167	167	1
168	168	1
169	169	1
170	170	1
171	171	1
172	172	1
173	173	1
174	174	1
175	175	1
176	176	1
177	177	1
178	178	1
179	179	1
180	180	1
181	181	1
182	182	1
183	183	1
184	184	1
185	185	1
186	186	1
187	187	1
188	188	1
189	189	1
190	190	1
191	191	1
192	192	1
193	193	1
194	194	1
195	195	1
196	196	1
197	197	1
198	198	1
199	1	3
200	2	3
201	3	3
202	4	3
203	5	3
204	6	3
205	7	3
206	8	3
207	9	3
208	10	3
209	11	3
210	12	3
211	15	3
212	16	3
213	17	3
214	19	3
215	22	3
216	23	3
217	24	3
218	25	3
219	29	3
220	32	3
221	41	3
222	42	3
223	43	3
224	44	3
225	45	3
226	46	3
227	47	3
228	48	3
229	49	3
230	50	3
231	51	3
232	52	3
233	53	3
234	54	3
235	56	3
236	58	3
237	59	3
238	60	3
239	61	3
240	62	3
241	63	3
242	64	3
243	65	3
244	66	3
245	67	3
246	68	3
247	69	3
248	70	3
249	71	3
250	72	3
251	74	3
252	78	3
253	87	3
254	88	3
255	89	3
256	90	3
257	91	3
258	92	3
259	93	3
260	94	3
261	95	3
262	96	3
263	97	3
264	98	3
265	99	3
266	100	3
267	101	3
268	102	3
269	103	3
270	104	3
271	105	3
272	106	3
273	107	3
274	108	3
275	109	3
276	110	3
277	112	3
278	113	3
279	114	3
280	115	3
281	116	3
282	118	3
283	119	3
284	120	3
285	121	3
286	122	3
287	123	3
288	124	3
289	125	3
290	126	3
291	127	3
292	128	3
293	129	3
294	130	3
295	131	3
296	132	3
297	133	3
298	134	3
299	135	3
300	136	3
301	137	3
302	138	3
303	139	3
304	140	3
305	141	3
306	142	3
307	143	3
308	144	3
309	145	3
310	147	3
311	148	3
312	149	3
313	150	3
314	151	3
315	152	3
316	153	3
317	154	3
318	155	3
319	156	3
320	157	3
321	158	3
322	159	3
323	160	3
324	161	3
325	162	3
326	163	3
327	165	3
328	173	3
329	174	3
330	176	3
331	177	3
332	178	3
333	179	3
334	180	3
335	181	3
336	182	3
337	183	3
338	184	3
339	185	3
340	186	3
341	187	3
342	188	3
343	189	3
344	191	3
345	192	3
346	193	3
347	194	3
348	195	3
349	197	3
350	198	3
351	1	4
352	2	4
353	3	4
354	4	4
355	7	4
356	8	4
357	9	4
358	10	4
359	11	4
360	15	4
361	16	4
362	17	4
363	19	4
364	22	4
365	23	4
366	24	4
367	25	4
368	29	4
369	32	4
370	41	4
371	42	4
372	43	4
373	44	4
374	45	4
375	46	4
376	47	4
377	48	4
378	49	4
379	50	4
380	51	4
381	52	4
382	53	4
383	54	4
384	56	4
385	60	4
386	61	4
387	62	4
388	63	4
389	64	4
390	65	4
391	66	4
392	67	4
393	68	4
394	69	4
395	70	4
396	71	4
397	72	4
398	74	4
399	78	4
400	87	4
401	88	4
402	89	4
403	90	4
404	91	4
405	92	4
406	93	4
407	94	4
408	95	4
409	96	4
410	99	4
411	100	4
412	101	4
413	102	4
414	103	4
415	104	4
416	105	4
417	106	4
418	107	4
419	108	4
420	109	4
421	110	4
422	112	4
423	113	4
424	114	4
425	115	4
426	116	4
427	118	4
428	119	4
429	120	4
430	121	4
431	122	4
432	123	4
433	124	4
434	125	4
435	126	4
436	127	4
437	128	4
438	129	4
439	130	4
440	131	4
441	132	4
442	133	4
443	134	4
444	135	4
445	136	4
446	137	4
447	138	4
448	139	4
449	140	4
450	141	4
451	142	4
452	143	4
453	144	4
454	145	4
455	147	4
456	148	4
457	149	4
458	150	4
459	151	4
460	152	4
461	153	4
462	154	4
463	155	4
464	156	4
465	157	4
466	158	4
467	159	4
468	160	4
469	161	4
470	162	4
471	163	4
472	165	4
473	173	4
474	174	4
475	176	4
476	177	4
477	178	4
478	179	4
479	180	4
480	181	4
481	182	4
482	183	4
483	185	4
484	187	4
485	189	4
486	191	4
487	192	4
488	193	4
489	197	4
490	198	4
491	117	5
492	146	5
493	1	6
494	17	6
495	111	6
496	115	6
497	123	6
498	136	6
499	140	6
500	190	6
501	191	6
502	192	6
503	193	6
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
2	Public
3	Alpha
4	Gamma
5	granter
6	sql_lab
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	Superset	Admin	admin	pbkdf2:sha256:260000$EKRvLacJKKYRL6wh$e6acabe349b9d6ab19c75b4be23fcd202587693f64e24c176d014e8748821796	f	admin@superset.com	2022-11-25 13:06:47.864976	2	0	2022-11-24 13:52:17.631638	2022-11-25 13:07:29.27214	\N	35
35	Ecosystem	Admin	admin@ecosystem.ai	pbkdf2:sha256:260000$hTEPqNbWDDzX811y$8ef2be6690febc72bc5de9c581aea0c9971b806dcf78989fe1d419ac1b759312	t	admin@ecosystem.ai	2022-11-25 13:07:48.476037	3	0	2022-11-25 13:00:05.775047	2022-11-25 13:00:05.775057	1	1
36	Ecosystem	User	user@ecosystem.ai	pbkdf2:sha256:260000$T9RnrWrLIHrd0jOs$0c9699f64dd2e52138ceaecfc28bd72e20919fc7c00a5fca52a8f8a1d26ee0a9	t	user@ecosystem.ai	\N	\N	\N	2022-11-25 13:00:38.432064	2022-11-25 13:20:13.309812	1	35
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
35	35	1
37	36	3
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	SavedQuery
2	CssTemplate
3	ReportSchedule
4	Chart
5	Annotation
6	Dataset
7	Log
8	Dashboard
9	Database
10	Query
11	SupersetIndexView
12	UtilView
13	LocaleView
14	SecurityApi
15	ResetPasswordView
16	ResetMyPasswordView
17	UserInfoEditView
18	CustomAuthDBView
19	UserDBModelView
20	RoleModelView
21	OpenApi
22	SwaggerView
23	MenuApi
24	AsyncEventsRestApi
25	AdvancedDataType
26	AvailableDomains
27	CacheRestApi
28	CurrentUserRestApi
29	DashboardFilterStateRestApi
30	DashboardPermalinkRestApi
31	EmbeddedDashboard
32	Explore
33	ExploreFormDataRestApi
34	ExplorePermalinkRestApi
35	FilterSets
36	ImportExportRestApi
37	DynamicPlugin
38	RowLevelSecurityFiltersModelView
39	Api
40	CsvToDatabaseView
41	ExcelToDatabaseView
42	ColumnarToDatabaseView
43	Datasource
44	EmbeddedView
45	KV
46	R
47	SqlLab
48	Superset
49	TableSchemaView
50	TabStateView
51	TagView
52	SecurityRestApi
53	AccessRequestsModelView
54	Security
55	List Users
56	List Roles
57	Row Level Security
58	Action Log
59	Access requests
60	Home
61	Data
62	Databases
63	Dashboards
64	Charts
65	Datasets
66	Manage
67	Plugins
68	CSS Templates
69	Import Dashboards
70	Alerts & Report
71	Annotation Layers
72	SQL Lab
73	SQL Editor
74	Saved Queries
75	Query Search
76	all_datasource_access
77	all_database_access
78	all_query_access
119	[ecosystem_server].(id:2)
120	[ecosystem_server].[models_scoring_history_deeplearning](id:8)
121	[ecosystem_server].[ecosystem_meta]
122	[ecosystem_server].[models_variable_importances_deeplearning](id:9)
123	[ecosystem_server].[models_model_summary_deeplearning](id:10)
124	[ecosystem_server].[bank_transactions](id:11)
125	[ecosystem_server].[master]
126	[ecosystem_server].[bank_transactions_reliability](id:12)
127	[ecosystem_server].[bank_transactions_personality](id:13)
128	[ecosystem_server].[bank_customer](id:14)
129	[ecosystem_server].[bank_transactions_time_series](id:15)
130	[ecosystem_server].[models_scoring_history_xgboost](id:16)
131	[ecosystem_server].[models](id:17)
132	[ecosystem_server].[models_variable_importances_xgboost](id:18)
133	[ecosystem_server].[models_model_summary_xgboost](id:19)
134	[ecosystem_server].[models_scoring_history_gbm](id:20)
135	[ecosystem_server].[models_variable_importances_gbm](id:21)
136	[ecosystem_server].[models_model_summary_gbm](id:22)
137	[ecosystem_server].[models_cm_gbm](id:23)
138	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)
139	[ecosystem_server].[logging]
140	[ecosystem_server].[ecosystemruntime_summary_score](id:25)
141	[ecosystem_server].[ecosystemruntime_summary_response](id:26)
142	[ecosystem_server].[complaints](id:27)
143	[ecosystem_server].[complaints]
144	[ecosystem_server].[zip_location_all](id:28)
145	[ecosystem_server].[usa_banking]
146	[ecosystem_server].[clickstream_journeys](id:29)
147	[ecosystem_server].[bank_clickstream]
148	[ecosystem_server].[mixed_data](id:30)
149	[ecosystem_server].[automated_qa_prediction]
150	[ecosystem_server].[just4u_options](id:31)
151	[ecosystem_server].[telecommunications]
152	[ecosystem_server].[just4u](id:32)
153	[ecosystem_server].[account_transaction](id:33)
154	[ecosystem_server].[funds]
155	[ecosystem_server].[account_transaction_org](id:34)
156	[ecosystem_server].[collections_transactions_dashboard_rollup](id:35)
157	[ecosystem_server].[collections]
158	[ecosystem_server].[collections_transactions_s0_code](id:36)
159	[ecosystem_server].[collections_transactions](id:37)
160	[ecosystem_server].[collections_transactions_s_code](id:38)
161	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)
162	[ecosystem_server].[collections_transactions_reason_dashboard_rollup](id:40)
163	[ecosystem_server].[experiment_details_dashboard](id:41)
164	[ecosystem_server].[experiment_customers_dashboard](id:42)
165	[ecosystem_server].[experiment_interactions_dashboard](id:43)
166	[ecosystem_server].[experiment_calendar_dashboard](id:44)
167	[ecosystem_server].[rsn_desc_text_list_for_filter](id:45)
\.


--
-- Data for Name: access_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.access_request (created_on, changed_on, id, datasource_type, datasource_id, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
deb4c9d4a4ef
\.


--
-- Data for Name: alert_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alert_logs (id, scheduled_dttm, dttm_start, dttm_end, alert_id, state) FROM stdin;
\.


--
-- Data for Name: alert_owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alert_owner (id, user_id, alert_id) FROM stdin;
\.


--
-- Data for Name: alerts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alerts (id, label, active, crontab, alert_type, log_retention, grace_period, recipients, slice_id, dashboard_id, last_eval_dttm, last_state, slack_channel, changed_by_fk, changed_on, created_by_fk, created_on, validator_config, database_id, sql, validator_type) FROM stdin;
\.


--
-- Data for Name: annotation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation (created_on, changed_on, id, start_dttm, end_dttm, layer_id, short_descr, long_descr, changed_by_fk, created_by_fk, json_metadata) FROM stdin;
\.


--
-- Data for Name: annotation_layer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_layer (created_on, changed_on, id, name, descr, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: cache_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_keys (id, cache_key, cache_timeout, datasource_uid, created_on) FROM stdin;
\.


--
-- Data for Name: clusters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clusters (created_on, changed_on, id, cluster_name, broker_host, broker_port, broker_endpoint, metadata_last_refreshed, created_by_fk, changed_by_fk, cache_timeout, verbose_name, broker_pass, broker_user, uuid) FROM stdin;
\.


--
-- Data for Name: columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.columns (created_on, changed_on, id, column_name, is_active, type, groupby, filterable, description, created_by_fk, changed_by_fk, dimension_spec_json, verbose_name, datasource_id, uuid, advanced_data_type) FROM stdin;
\.


--
-- Data for Name: css_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.css_templates (created_on, changed_on, id, template_name, css, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: dashboard_email_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_email_schedules (created_on, changed_on, id, active, crontab, recipients, deliver_as_group, delivery_type, dashboard_id, created_by_fk, changed_by_fk, user_id, slack_channel, uuid) FROM stdin;
\.


--
-- Data for Name: dashboard_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_roles (id, role_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: dashboard_slices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_slices (id, dashboard_id, slice_id) FROM stdin;
24	4	28
25	4	27
26	4	30
27	4	25
28	4	31
29	4	32
30	4	24
31	4	29
32	4	26
33	5	35
34	5	38
35	5	33
36	5	54
37	5	53
38	5	45
39	5	48
40	5	41
41	5	43
42	5	40
43	5	42
44	5	37
45	5	52
46	5	46
47	5	50
48	5	36
49	5	39
50	5	34
51	5	44
52	5	49
53	5	55
54	5	47
55	5	51
56	6	62
57	6	64
58	6	58
59	6	57
60	6	63
61	6	60
62	6	61
63	6	56
64	6	59
65	7	75
66	7	77
67	7	68
68	7	72
69	7	74
70	7	69
71	7	70
72	7	65
73	7	73
74	7	67
75	7	66
76	7	76
77	7	71
78	8	88
79	8	91
80	8	86
81	8	90
82	8	87
83	8	89
84	8	80
85	8	78
86	8	92
87	8	83
88	8	79
89	8	81
90	8	82
91	8	84
92	8	85
93	9	97
94	9	95
95	9	103
96	9	108
97	9	98
98	9	106
99	9	102
100	9	93
101	9	99
102	9	100
103	9	104
104	9	105
105	9	107
106	9	96
107	9	101
108	9	94
109	10	111
110	10	109
111	10	110
112	11	115
113	11	114
114	11	120
115	11	125
116	11	118
117	11	124
118	11	121
119	11	113
120	11	119
121	11	123
122	11	116
123	11	122
124	11	112
125	11	117
126	11	126
127	12	137
128	12	140
129	12	128
130	12	135
131	12	142
132	12	132
133	12	141
134	12	133
135	12	136
136	12	146
137	12	138
138	12	134
139	12	131
140	12	143
141	12	139
142	12	129
143	12	127
144	12	130
145	12	144
146	12	145
147	13	153
148	13	159
149	13	158
150	13	155
151	13	160
152	13	157
153	13	148
154	13	154
155	13	150
156	13	152
157	13	147
158	13	151
159	13	156
160	13	161
161	13	149
162	14	170
163	14	162
164	14	172
165	14	174
166	14	163
167	14	179
168	14	171
169	14	180
170	14	167
171	14	181
172	14	178
173	14	166
174	14	177
175	14	185
176	14	164
177	14	173
178	14	165
179	14	184
180	14	183
181	14	168
182	14	176
183	14	175
184	14	182
185	14	169
186	15	188
187	15	189
188	15	187
189	15	186
190	15	190
191	16	193
192	16	192
193	16	191
194	17	194
195	17	196
196	17	200
197	17	195
198	17	198
199	17	208
200	17	181
201	17	201
202	17	185
203	17	203
204	17	207
205	17	199
206	17	202
207	17	184
208	17	183
209	17	205
210	17	204
211	17	197
212	17	206
\.


--
-- Data for Name: dashboard_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_user (id, user_id, dashboard_id) FROM stdin;
4	35	4
5	35	5
6	35	6
7	35	7
8	35	8
9	35	9
10	35	10
11	35	11
12	35	12
13	35	13
14	35	14
15	35	15
16	35	16
17	35	17
\.


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboards (created_on, changed_on, id, dashboard_title, position_json, created_by_fk, changed_by_fk, css, description, slug, json_metadata, published, uuid, certified_by, certification_details, is_managed_externally, external_url) FROM stdin;
2022-11-25 13:10:42.949267	2022-11-25 13:10:42.949274	4	ecosystem.Ai Workbench: Deep Learning 1.1	{"CHART-11u9FKbJmN": {"children": [], "id": "CHART-11u9FKbJmN", "meta": {"chartId": 28, "height": 95, "sliceName": "Deep Learning: Model Details", "uuid": "2868cfcf-e768-4b55-ba35-559200dbae34", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-R7Oxcik8b", "ROW-VZYIIiiq-"], "type": "CHART"}, "CHART-Cx9Xp9k6vL": {"children": [], "id": "CHART-Cx9Xp9k6vL", "meta": {"chartId": 26, "height": 47, "sliceName": "Deep Learning: Variable Importance", "uuid": "8320fc44-de62-46e8-8a90-d05862f1f917", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897", "ROW-qThPdehHD"], "type": "CHART"}, "CHART-SIGSzix909": {"children": [], "id": "CHART-SIGSzix909", "meta": {"chartId": 32, "height": 25, "sliceName": "Deep Learning: Model Summary", "uuid": "33918830-fc8e-469c-8432-017c23ea0cc9", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897", "ROW-2YbHOWyJN"], "type": "CHART"}, "CHART-SSNhS2cHqm": {"children": [], "id": "CHART-SSNhS2cHqm", "meta": {"chartId": 27, "height": 47, "sliceName": "Deep Learning: Variable Importances", "uuid": "9585bd2e-a5e3-4ab4-bb60-7f15cd0c043f", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897", "ROW-qThPdehHD"], "type": "CHART"}, "CHART-j91S5808cl": {"children": [], "id": "CHART-j91S5808cl", "meta": {"chartId": 31, "height": 24, "sliceName": "Deep Learning: Rate", "uuid": "b2c9d196-7e98-47f7-8a44-c72024f68a62", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897", "ROW-2YbHOWyJN"], "type": "CHART"}, "CHART-ozBm7cmq8_": {"children": [], "id": "CHART-ozBm7cmq8_", "meta": {"chartId": 24, "height": 53, "sliceName": "Deep Learning: Scores", "uuid": "9c464e6e-dd20-4f2a-b145-b3b1b0ae095b", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897", "ROW-m5ioKgtiR"], "type": "CHART"}, "CHART-pguV61brRS": {"children": [], "id": "CHART-pguV61brRS", "meta": {"chartId": 25, "height": 53, "sliceName": "Deep Learning: Model Validation Details", "uuid": "22030ed3-6843-4185-8d59-513598b8cddc", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897", "ROW-m5ioKgtiR"], "type": "CHART"}, "CHART-w-26uQKrpX": {"children": [], "id": "CHART-w-26uQKrpX", "meta": {"chartId": 30, "height": 25, "sliceName": "Deep Learning: Layers", "sliceNameOverride": "Layers", "uuid": "5bcabbcc-7e31-4a8e-ac26-ba0c827ce314", "width": 1}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897", "ROW-2YbHOWyJN"], "type": "CHART"}, "CHART-yvB1iF_Vdo": {"children": [], "id": "CHART-yvB1iF_Vdo", "meta": {"chartId": 29, "height": 24, "sliceName": "Select: Deep Learning Model", "uuid": "2b9f3aa6-c12a-4415-9b34-d8e30fea7c0e", "width": 3}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897", "ROW-2YbHOWyJN"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["TABS-9z7VnCbZYz"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "ecosystem.Ai Workbench: Deep Learning 1.1"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-2YbHOWyJN": {"children": ["CHART-yvB1iF_Vdo", "CHART-w-26uQKrpX", "CHART-j91S5808cl", "CHART-SIGSzix909"], "id": "ROW-2YbHOWyJN", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897"], "type": "ROW"}, "ROW-VZYIIiiq-": {"children": ["CHART-11u9FKbJmN"], "id": "ROW-VZYIIiiq-", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-R7Oxcik8b"], "type": "ROW"}, "ROW-m5ioKgtiR": {"children": ["CHART-ozBm7cmq8_", "CHART-pguV61brRS"], "id": "ROW-m5ioKgtiR", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897"], "type": "ROW"}, "ROW-qThPdehHD": {"children": ["CHART-SSNhS2cHqm", "CHART-Cx9Xp9k6vL"], "id": "ROW-qThPdehHD", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz", "TAB-daw8d7H897"], "type": "ROW"}, "TAB-R7Oxcik8b": {"children": ["ROW-VZYIIiiq-"], "id": "TAB-R7Oxcik8b", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Accuracy Detail"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz"], "type": "TAB"}, "TAB-daw8d7H897": {"children": ["ROW-2YbHOWyJN", "ROW-m5ioKgtiR", "ROW-qThPdehHD"], "id": "TAB-daw8d7H897", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Overview"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-9z7VnCbZYz"], "type": "TAB"}, "TABS-9z7VnCbZYz": {"children": ["TAB-daw8d7H897", "TAB-R7Oxcik8b"], "id": "TABS-9z7VnCbZYz", "meta": {}, "parents": ["ROOT_ID", "GRID_ID"], "type": "TABS"}}	35	35		\N	\N	{"timed_refresh_immune_slices": [], "expanded_slices": {}, "refresh_frequency": 0, "default_filters": "{}", "color_scheme": "", "remote_id": 1, "import_time": 1631260091, "show_native_filters": true, "label_colors": {}, "chart_configuration": {}, "shared_label_colors": {}}	f	b13b7ef0-4ad6-4eff-bfa3-2b466cfb9fae	\N	\N	f	\N
2022-11-25 13:10:42.964694	2022-11-25 13:10:42.9647	5	Customer Banking	{"CHART-1MTtrC2Xh8": {"children": [], "id": "CHART-1MTtrC2Xh8", "meta": {"chartId": 35, "height": 45, "sliceName": "Categories", "sliceNameOverride": "Categories", "uuid": "b2acc8cf-25ee-4ff0-90da-3c98f8500350", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW", "ROW-mLM6J4YE8"], "type": "CHART"}, "CHART-9q2ypTn1B1": {"children": [], "id": "CHART-9q2ypTn1B1", "meta": {"chartId": 45, "height": 128, "sliceName": "Transaction Limits", "uuid": "3d43c22a-357c-4994-b1c2-f10f65178a32", "width": 7}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-pNC-t559F", "ROW-TXnYnWKmb"], "type": "CHART"}, "CHART-AMNV2JVbB2": {"children": [], "id": "CHART-AMNV2JVbB2", "meta": {"chartId": 51, "height": 77, "sliceName": "Personality by Education", "uuid": "ed852bb9-608a-495c-98af-bc51ab90a1ab", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-lJ1zP74gZ", "ROW-13R0Xk_ja"], "type": "CHART"}, "CHART-Frz1KiKQBs": {"children": [], "id": "CHART-Frz1KiKQBs", "meta": {"chartId": 49, "height": 60, "sliceName": "Spend Category Specialization", "uuid": "16c70a29-3c33-494a-9fa8-53d7444685ce", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-lJ1zP74gZ", "ROW-C1fzooKwU"], "type": "CHART"}, "CHART-JCiN0Iesxo": {"children": [], "id": "CHART-JCiN0Iesxo", "meta": {"chartId": 48, "height": 60, "sliceName": "Personality Spectrum", "uuid": "02bf9b41-7d3d-4fc9-81da-f8bc3b68e89d", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-lJ1zP74gZ", "ROW-C1fzooKwU"], "type": "CHART"}, "CHART-KJ-8ga8Tc1": {"children": [], "id": "CHART-KJ-8ga8Tc1", "meta": {"chartId": 41, "height": 46, "sliceName": "Timeframe", "sliceNameOverride": "Timeframe", "uuid": "33deb6cf-d090-498f-b7ca-f8d92d9286a0", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW", "ROW-mLM6J4YE8"], "type": "CHART"}, "CHART-KqbWMtK6x0": {"children": [], "id": "CHART-KqbWMtK6x0", "meta": {"chartId": 37, "height": 77, "sliceName": "Reliability (Entropy)", "uuid": "756cac59-4712-403f-a0e6-427e4064be91", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-lJ1zP74gZ", "ROW-13R0Xk_ja"], "type": "CHART"}, "CHART-LplOH2IAX3": {"children": [], "id": "CHART-LplOH2IAX3", "meta": {"chartId": 52, "height": 46, "sliceName": "Transaction Spend Type", "uuid": "726d5bb1-1167-4dee-bc0a-82e005a4e62e", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW", "ROW-mLM6J4YE8"], "type": "CHART"}, "CHART-NU8Sz_pmZ9": {"children": [], "id": "CHART-NU8Sz_pmZ9", "meta": {"chartId": 33, "height": 80, "sliceName": "Spending Categories", "uuid": "d18ede4a-3e61-4b5f-8c3e-a7e1b3f5d058", "width": 7}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW", "ROW-FuUN8DXhM"], "type": "CHART"}, "CHART-UApyi1CECw": {"children": [], "id": "CHART-UApyi1CECw", "meta": {"chartId": 53, "height": 129, "sliceName": "Transaction Detail", "uuid": "8180b00a-dbc6-4ca5-9282-2c7301f15663", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-ruX656SDD", "ROW-tSAqcQSI1"], "type": "CHART"}, "CHART-cINvUitBU2": {"children": [], "id": "CHART-cINvUitBU2", "meta": {"chartId": 50, "height": 128, "sliceName": "Spend Type", "uuid": "83f54111-53aa-41cc-89b9-bfc5d279319c", "width": 5}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-pNC-t559F", "ROW-TXnYnWKmb"], "type": "CHART"}, "CHART-cOpHv_HZVy": {"children": [], "id": "CHART-cOpHv_HZVy", "meta": {"chartId": 38, "height": 45, "sliceName": "Transactions", "uuid": "11263c4a-9c33-49ce-8286-20f403e2a3b0", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW", "ROW-mLM6J4YE8"], "type": "CHART"}, "CHART-dz5YPHYYcI": {"children": [], "id": "CHART-dz5YPHYYcI", "meta": {"chartId": 42, "height": 56, "sliceName": "Customer Category Velocity", "uuid": "b1535b22-9bbc-42b2-89f1-ee95e5b5e09a", "width": 5}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-yRItQfy8c", "ROW-7c2Avnhvz"], "type": "CHART"}, "CHART-eOMAqdNJ-h": {"children": [], "id": "CHART-eOMAqdNJ-h", "meta": {"chartId": 34, "height": 46, "sliceName": "Customers", "uuid": "3c7036cf-ec6c-4697-b3bd-2e6d7e4cefad", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW", "ROW-mLM6J4YE8"], "type": "CHART"}, "CHART-f3NeeDpOHG": {"children": [], "id": "CHART-f3NeeDpOHG", "meta": {"chartId": 39, "height": 134, "sliceName": "Transaction Network", "uuid": "d290876f-576e-4dd6-a66a-1d91cebcb329", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-hw1T3VHMD", "ROW-buo5ap95X"], "type": "CHART"}, "CHART-h9fgKS4sp-": {"children": [], "id": "CHART-h9fgKS4sp-", "meta": {"chartId": 44, "height": 70, "sliceName": "Customer Transactions", "uuid": "34919f60-0bd6-4ad8-a01b-83477a019fc9", "width": 7}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-yRItQfy8c", "ROW-zAqXJvggv"], "type": "CHART"}, "CHART-iVZ6DU9rv7": {"children": [], "id": "CHART-iVZ6DU9rv7", "meta": {"chartId": 43, "height": 60, "sliceName": "Personality Profile", "uuid": "b8949ab7-5ddb-4d67-8efa-84259683db63", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-lJ1zP74gZ", "ROW-C1fzooKwU"], "type": "CHART"}, "CHART-lrfcqSshBw": {"children": [], "id": "CHART-lrfcqSshBw", "meta": {"chartId": 40, "height": 138, "sliceName": "Customer Transaction Network", "uuid": "0db684ca-8c7a-4aed-a5c5-9ffaffefb692", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-w4CIuRWpA", "ROW-yQiRpKv4L"], "type": "CHART"}, "CHART-mlG8xH1Q4G": {"children": [], "id": "CHART-mlG8xH1Q4G", "meta": {"chartId": 36, "height": 70, "sliceName": "Spend Category Velocity", "uuid": "c0acfb76-be15-4541-b158-f899a6a53c06", "width": 5}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-yRItQfy8c", "ROW-zAqXJvggv"], "type": "CHART"}, "CHART-nAPhD626y1": {"children": [], "id": "CHART-nAPhD626y1", "meta": {"chartId": 46, "height": 56, "sliceName": "Transactions EventFlow", "uuid": "83eff332-cadc-4b30-bc8b-19262677ad86", "width": 7}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-yRItQfy8c", "ROW-7c2Avnhvz"], "type": "CHART"}, "CHART-qMNoIzkqRt": {"children": [], "id": "CHART-qMNoIzkqRt", "meta": {"chartId": 54, "height": 139, "sliceName": "Transaction Time Series", "uuid": "d4a82480-b7b9-4c93-ab8c-27a948ee4d50", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0kS8ydCq1", "ROW-GwRQrYME6"], "type": "CHART"}, "CHART-tNxVu-pTUa": {"children": [], "id": "CHART-tNxVu-pTUa", "meta": {"chartId": 47, "height": 80, "sliceName": "Transactions Chord", "uuid": "604cf6f2-fafc-492e-bcfd-ccc8d10f6c71", "width": 5}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW", "ROW-FuUN8DXhM"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["TABS-8QDVvNdz_1", "ROW-N-17QP1P9Z"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Customer Banking"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-13R0Xk_ja": {"children": ["CHART-KqbWMtK6x0", "CHART-AMNV2JVbB2"], "id": "ROW-13R0Xk_ja", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-lJ1zP74gZ"], "type": "ROW"}, "ROW-7c2Avnhvz": {"children": ["CHART-dz5YPHYYcI", "CHART-nAPhD626y1"], "id": "ROW-7c2Avnhvz", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-yRItQfy8c"], "type": "ROW"}, "ROW-C1fzooKwU": {"children": ["CHART-JCiN0Iesxo", "CHART-iVZ6DU9rv7", "CHART-Frz1KiKQBs"], "id": "ROW-C1fzooKwU", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-lJ1zP74gZ"], "type": "ROW"}, "ROW-FuUN8DXhM": {"children": ["CHART-NU8Sz_pmZ9", "CHART-tNxVu-pTUa"], "id": "ROW-FuUN8DXhM", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW"], "type": "ROW"}, "ROW-GwRQrYME6": {"children": ["CHART-qMNoIzkqRt"], "id": "ROW-GwRQrYME6", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0kS8ydCq1"], "type": "ROW"}, "ROW-TXnYnWKmb": {"children": ["CHART-9q2ypTn1B1", "CHART-cINvUitBU2"], "id": "ROW-TXnYnWKmb", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-pNC-t559F"], "type": "ROW"}, "ROW-buo5ap95X": {"children": ["CHART-f3NeeDpOHG"], "id": "ROW-buo5ap95X", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-hw1T3VHMD"], "type": "ROW"}, "ROW-mLM6J4YE8": {"children": ["CHART-LplOH2IAX3", "CHART-eOMAqdNJ-h", "CHART-cOpHv_HZVy", "CHART-1MTtrC2Xh8", "CHART-KJ-8ga8Tc1"], "id": "ROW-mLM6J4YE8", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-0EFyhXgrsW"], "type": "ROW"}, "ROW-tSAqcQSI1": {"children": ["CHART-UApyi1CECw"], "id": "ROW-tSAqcQSI1", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-ruX656SDD"], "type": "ROW"}, "ROW-yQiRpKv4L": {"children": ["CHART-lrfcqSshBw"], "id": "ROW-yQiRpKv4L", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-w4CIuRWpA"], "type": "ROW"}, "ROW-zAqXJvggv": {"children": ["CHART-mlG8xH1Q4G", "CHART-h9fgKS4sp-"], "id": "ROW-zAqXJvggv", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1", "TAB-yRItQfy8c"], "type": "ROW"}, "TAB-0EFyhXgrsW": {"children": ["ROW-mLM6J4YE8", "ROW-FuUN8DXhM"], "id": "TAB-0EFyhXgrsW", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Dashboard"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1"], "type": "TAB"}, "TAB-0kS8ydCq1": {"children": ["ROW-GwRQrYME6"], "id": "TAB-0kS8ydCq1", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Time Series"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1"], "type": "TAB"}, "TAB-hw1T3VHMD": {"children": ["ROW-buo5ap95X"], "id": "TAB-hw1T3VHMD", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Transaction Network"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1"], "type": "TAB"}, "TAB-lJ1zP74gZ": {"children": ["ROW-C1fzooKwU", "ROW-13R0Xk_ja"], "id": "TAB-lJ1zP74gZ", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Spending Personality"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1"], "type": "TAB"}, "TAB-pNC-t559F": {"children": ["ROW-TXnYnWKmb"], "id": "TAB-pNC-t559F", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Categories"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1"], "type": "TAB"}, "TAB-ruX656SDD": {"children": ["ROW-tSAqcQSI1"], "id": "TAB-ruX656SDD", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Transactions"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1"], "type": "TAB"}, "TAB-w4CIuRWpA": {"children": ["ROW-yQiRpKv4L"], "id": "TAB-w4CIuRWpA", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Customer Transaction Network"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1"], "type": "TAB"}, "TAB-yRItQfy8c": {"children": ["ROW-7c2Avnhvz", "ROW-zAqXJvggv"], "id": "TAB-yRItQfy8c", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Detail"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-8QDVvNdz_1"], "type": "TAB"}, "TABS-8QDVvNdz_1": {"children": ["TAB-0EFyhXgrsW", "TAB-ruX656SDD", "TAB-0kS8ydCq1", "TAB-yRItQfy8c", "TAB-pNC-t559F", "TAB-hw1T3VHMD", "TAB-w4CIuRWpA", "TAB-lJ1zP74gZ"], "id": "TABS-8QDVvNdz_1", "meta": {}, "parents": ["ROOT_ID", "GRID_ID"], "type": "TABS"}, "ROW-N-17QP1P9Z": {"children": ["CHART-6BZICJSE"], "id": "ROW-N-17QP1P9Z", "meta": {"0": "ROOT_ID", "background": "BACKGROUND_TRANSPARENT"}, "type": "ROW", "parents": ["ROOT_ID", "GRID_ID"]}, "CHART-6BZICJSE": {"children": [], "id": "CHART-6BZICJSE", "meta": {"chartId": 55, "height": 50, "sliceName": "Bank Customer Personality Detail", "uuid": "1e8fc989-20cd-46ac-a027-c6bfb77b2ce4", "width": 4}, "type": "CHART", "parents": ["ROOT_ID", "GRID_ID", "ROW-N-17QP1P9Z"]}}	35	35		\N	customer-banking	{"timed_refresh_immune_slices": [], "expanded_slices": {}, "refresh_frequency": 0, "default_filters": "{}", "color_scheme": null, "remote_id": 3, "import_time": 1631277242, "show_native_filters": true, "native_filter_configuration": [{"id": "NATIVE_FILTER-zkKd5Myyc", "controlValues": {"enableEmptyFilter": false}, "name": "Date Range", "filterType": "filter_time", "targets": [{}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [37, 43, 48, 51]}, "type": "NATIVE_FILTER", "chartsInScope": [64, 3, 15, 4, 18, 1, 30, 65, 66, 19, 29, 12, 27, 28, 33, 16, 17, 32], "tabsInScope": ["TAB-0EFyhXgrsW", "TAB-0kS8ydCq1", "TAB-hw1T3VHMD", "TAB-lJ1zP74gZ", "TAB-pNC-t559F", "TAB-ruX656SDD", "TAB-w4CIuRWpA", "TAB-yRItQfy8c"]}, {"id": "NATIVE_FILTER-VAcdPuwCQ", "controlValues": {"multiSelect": true, "enableEmptyFilter": false, "defaultToFirstItem": false, "inverseSelection": false, "searchAllOptions": false, "sortAscending": true}, "name": "Customer", "filterType": "filter_select", "targets": [{"column": {"name": "customer"}, "datasetId": 11}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "chartsInScope": [64, 3, 15, 4, 18, 1, 30, 65, 66, 19, 29, 12, 27, 28, 33, 16, 17, 32], "tabsInScope": ["TAB-0EFyhXgrsW", "TAB-0kS8ydCq1", "TAB-hw1T3VHMD", "TAB-lJ1zP74gZ", "TAB-pNC-t559F", "TAB-ruX656SDD", "TAB-w4CIuRWpA", "TAB-yRItQfy8c"]}, {"id": "NATIVE_FILTER-oqy5bTbYb", "controlValues": {"multiSelect": true, "enableEmptyFilter": false, "defaultToFirstItem": false, "inverseSelection": false, "searchAllOptions": false, "sortAscending": true}, "name": "Category", "filterType": "filter_select", "targets": [{"column": {"name": "mcc_category"}, "datasetId": 11}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [37, 43, 48, 51]}, "sortMetric": "count", "type": "NATIVE_FILTER", "chartsInScope": [64, 3, 15, 4, 18, 1, 30, 65, 66, 19, 29, 12, 27, 28, 33, 16, 17, 32], "tabsInScope": ["TAB-0EFyhXgrsW", "TAB-0kS8ydCq1", "TAB-hw1T3VHMD", "TAB-lJ1zP74gZ", "TAB-pNC-t559F", "TAB-ruX656SDD", "TAB-w4CIuRWpA", "TAB-yRItQfy8c"]}, {"id": "NATIVE_FILTER-oMOP3QU67", "controlValues": {"multiSelect": true, "enableEmptyFilter": false, "defaultToFirstItem": false, "inverseSelection": false, "searchAllOptions": false}, "name": "Spend Type", "filterType": "filter_select", "targets": [{"column": {"name": "mcc_spend_type"}, "datasetId": 11}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [37, 43, 48, 51]}, "type": "NATIVE_FILTER", "chartsInScope": [64, 3, 15, 4, 18, 1, 30, 65, 66, 19, 29, 12, 27, 28, 33, 16, 17, 32], "tabsInScope": ["TAB-0EFyhXgrsW", "TAB-0kS8ydCq1", "TAB-hw1T3VHMD", "TAB-lJ1zP74gZ", "TAB-pNC-t559F", "TAB-ruX656SDD", "TAB-w4CIuRWpA", "TAB-yRItQfy8c"]}, {"id": "NATIVE_FILTER-xridOWJHy", "adhoc_filters": [{"expressionType": "SIMPLE", "subject": "trns_amt", "operator": ">", "operatorId": "GREATER_THAN", "comparator": -10000, "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_nljei5ca57_dhrkrkesb3o"}, {"expressionType": "SIMPLE", "subject": "trns_amt", "operator": "<", "operatorId": "LESS_THAN", "comparator": 100000, "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_3efvkqiipuv_9sjz35hq4ol"}], "time_range": "No filter", "controlValues": {"enableEmptyFilter": false}, "name": "Amount Range", "filterType": "filter_range", "targets": [{"column": {"name": "trns_amt"}, "datasetId": 11}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [37, 43, 48, 51]}, "type": "NATIVE_FILTER", "chartsInScope": [64, 3, 15, 4, 18, 1, 30, 65, 66, 19, 29, 12, 27, 28, 33, 16, 17, 32], "tabsInScope": ["TAB-0EFyhXgrsW", "TAB-0kS8ydCq1", "TAB-hw1T3VHMD", "TAB-lJ1zP74gZ", "TAB-pNC-t559F", "TAB-ruX656SDD", "TAB-w4CIuRWpA", "TAB-yRItQfy8c"]}], "label_colors": {}, "shared_label_colors": {}}	f	cbf441eb-058f-4891-9906-6d11e06a85c8	\N	\N	f	\N
2022-11-25 13:10:42.975857	2022-11-25 13:10:42.975863	6	ecosystem.Ai Workbench: XGBoost 1.1	{"CHART-3FYvU9HW79": {"children": [], "id": "CHART-3FYvU9HW79", "meta": {"chartId": 62, "height": 88, "sliceName": "XGBoost: Models", "uuid": "f21de1d1-dfb9-4264-88d8-9f68b9affaf7", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-_OJW6gZ1l", "ROW-QyjmD3pbP"], "type": "CHART"}, "CHART-AU0khn-fJD": {"children": [], "id": "CHART-AU0khn-fJD", "meta": {"chartId": 61, "height": 54, "sliceName": "XGBoost: Variable Importance", "uuid": "4f4c0a26-dea2-4840-9262-6d6af8d2ac3b", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-mRQN4obbPt", "ROW-aUXJevC-B"], "type": "CHART"}, "CHART-E4GXSxaw-u": {"children": [], "id": "CHART-E4GXSxaw-u", "meta": {"chartId": 63, "height": 120, "sliceName": "XGBoost: Model Details", "uuid": "30fe8964-90bc-4d92-91f9-5173074c6a0c", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-1Vj8O8kQw", "ROW-8BKoM0nB3"], "type": "CHART"}, "CHART-YZoQyNd4Ba": {"children": [], "id": "CHART-YZoQyNd4Ba", "meta": {"chartId": 56, "height": 29, "sliceName": "Total Models", "uuid": "90719c20-4288-478c-8b44-3d8aa320e311", "width": 1}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-_OJW6gZ1l", "ROW-X8mvIDG1f"], "type": "CHART"}, "CHART-eeKw0-Wxwx": {"children": [], "id": "CHART-eeKw0-Wxwx", "meta": {"chartId": 59, "height": 53, "sliceName": "XGBoost: Logloss", "uuid": "03409a53-14e2-4fc0-9895-9f40043af552", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-mRQN4obbPt", "ROW-fc6aAJdhx"], "type": "CHART"}, "CHART-ifzQe5kpwj": {"children": [], "id": "CHART-ifzQe5kpwj", "meta": {"chartId": 58, "height": 53, "sliceName": "XGBoost: Model Validation Details", "uuid": "54b5d36b-62d1-464b-bd1a-2e315835647c", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-mRQN4obbPt", "ROW-fc6aAJdhx"], "type": "CHART"}, "CHART-nM35VJhFrn": {"children": [], "id": "CHART-nM35VJhFrn", "meta": {"chartId": 64, "height": 28, "sliceName": "XGBoost: Model Summary", "uuid": "16716f06-9b58-4670-af03-7dd964cfa532", "width": 7}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-_OJW6gZ1l", "ROW-X8mvIDG1f"], "type": "CHART"}, "CHART-nX02X894wq": {"children": [], "id": "CHART-nX02X894wq", "meta": {"chartId": 60, "height": 54, "sliceName": "XGBoost: Variable Importances", "uuid": "88d71ede-97d8-4b1d-9913-51625489ec1d", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-mRQN4obbPt", "ROW-aUXJevC-B"], "type": "CHART"}, "CHART-zD1zouCdkN": {"children": [], "id": "CHART-zD1zouCdkN", "meta": {"chartId": 57, "height": 53, "sliceName": "XGBoost: Scores", "uuid": "eca04ebd-ed41-4021-b283-53fe83147617", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-mRQN4obbPt", "ROW-fc6aAJdhx"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["TABS-c-qKfEM7mc"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "ecosystem.Ai Workbench: XGBoost 1.1"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-8BKoM0nB3": {"children": ["CHART-E4GXSxaw-u"], "id": "ROW-8BKoM0nB3", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-1Vj8O8kQw"], "type": "ROW"}, "ROW-QyjmD3pbP": {"children": ["CHART-3FYvU9HW79"], "id": "ROW-QyjmD3pbP", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-_OJW6gZ1l"], "type": "ROW"}, "ROW-X8mvIDG1f": {"children": ["CHART-YZoQyNd4Ba", "CHART-nM35VJhFrn"], "id": "ROW-X8mvIDG1f", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-_OJW6gZ1l"], "type": "ROW"}, "ROW-aUXJevC-B": {"children": ["CHART-nX02X894wq", "CHART-AU0khn-fJD"], "id": "ROW-aUXJevC-B", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-mRQN4obbPt"], "type": "ROW"}, "ROW-fc6aAJdhx": {"children": ["CHART-zD1zouCdkN", "CHART-ifzQe5kpwj", "CHART-eeKw0-Wxwx"], "id": "ROW-fc6aAJdhx", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc", "TAB-mRQN4obbPt"], "type": "ROW"}, "TAB-1Vj8O8kQw": {"children": ["ROW-8BKoM0nB3"], "id": "TAB-1Vj8O8kQw", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Accuracy Detail"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc"], "type": "TAB"}, "TAB-_OJW6gZ1l": {"children": ["ROW-X8mvIDG1f", "ROW-QyjmD3pbP"], "id": "TAB-_OJW6gZ1l", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Overview"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc"], "type": "TAB"}, "TAB-mRQN4obbPt": {"children": ["ROW-fc6aAJdhx", "ROW-aUXJevC-B"], "id": "TAB-mRQN4obbPt", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Model Details"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-c-qKfEM7mc"], "type": "TAB"}, "TABS-c-qKfEM7mc": {"children": ["TAB-_OJW6gZ1l", "TAB-mRQN4obbPt", "TAB-1Vj8O8kQw"], "id": "TABS-c-qKfEM7mc", "meta": {}, "parents": ["ROOT_ID", "GRID_ID"], "type": "TABS"}}	35	35		\N	\N	{"timed_refresh_immune_slices": [], "expanded_slices": {}, "refresh_frequency": 0, "default_filters": "{}", "color_scheme": "", "remote_id": 4, "import_time": 1635252681, "show_native_filters": true, "label_colors": {}, "chart_configuration": {}, "native_filter_configuration": [{"id": "NATIVE_FILTER-C5rEQ8_xS", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Model", "filterType": "filter_select", "targets": [{"column": {"name": "model_identity"}, "datasetId": 16}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": ""}], "shared_label_colors": {}}	f	5c21cd3e-7b8e-422b-ab5d-1103b88eb7fc	\N	\N	f	\N
2022-11-25 13:10:42.986644	2022-11-25 13:10:42.98665	7	ecosystem.Ai Workbench: GBM 1.1	{"CHART-41Ss1Zpfk9": {"children": [], "id": "CHART-41Ss1Zpfk9", "meta": {"chartId": 71, "height": 24, "sliceName": "Total Models", "uuid": "75d72afc-f94a-4b37-9b9c-633e8b6f73df", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-f3JFaaFre1", "ROW-CSOEUBrUp"], "type": "CHART"}, "CHART-BgO-KZBASC": {"children": [], "id": "CHART-BgO-KZBASC", "meta": {"chartId": 75, "height": 91, "sliceName": "GBM: Confusion Matrix Heatmap", "uuid": "b941551f-043d-4105-bc16-22178dca47e8", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-80i5hRDPP", "ROW-uNM0r4N3X"], "type": "CHART"}, "CHART-GlZh0IyPEf": {"children": [], "id": "CHART-GlZh0IyPEf", "meta": {"chartId": 76, "height": 76, "sliceName": "GBM: Models", "uuid": "1afae3fb-4e2f-4405-9479-088223747d0d", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-f3JFaaFre1", "ROW-0_DEu0O1g"], "type": "CHART"}, "CHART-K6OhgCHriO": {"children": [], "id": "CHART-K6OhgCHriO", "meta": {"chartId": 74, "height": 47, "sliceName": "GBM: Logloss", "uuid": "39a860bd-8410-4c5f-b1b8-883f28192676", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ", "ROW-AQzFETFwd"], "type": "CHART"}, "CHART-PTmjLaDWrf": {"children": [], "id": "CHART-PTmjLaDWrf", "meta": {"chartId": 65, "height": 116, "sliceName": "GBM: Model Details", "uuid": "54b77fca-af84-4ae0-bd06-72bbe7051dc4", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-CjVHr2kfI", "ROW-mmEAL5P-O"], "type": "CHART"}, "CHART-Rknu2gLfdB": {"children": [], "id": "CHART-Rknu2gLfdB", "meta": {"chartId": 77, "height": 24, "sliceName": "GBM: Model Summary", "uuid": "16d663fe-98eb-46fa-98d3-c21333290a3c", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-f3JFaaFre1", "ROW-CSOEUBrUp"], "type": "CHART"}, "CHART-b3qPoBfLfR": {"children": [], "id": "CHART-b3qPoBfLfR", "meta": {"chartId": 72, "height": 91, "sliceName": "GBM: Confusion Matrix", "uuid": "8f02c489-588a-4014-b0d1-32b0d18e6b55", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-80i5hRDPP", "ROW-uNM0r4N3X"], "type": "CHART"}, "CHART-bW1zL21ZFf": {"children": [], "id": "CHART-bW1zL21ZFf", "meta": {"chartId": 70, "height": 48, "sliceName": "GBM: RMSE", "uuid": "05b9c02d-6593-4329-b8c3-c0a4bed2e09e", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ", "ROW-AQzFETFwd"], "type": "CHART"}, "CHART-cnYotm2vjg": {"children": [], "id": "CHART-cnYotm2vjg", "meta": {"chartId": 69, "height": 20, "sliceName": "GBM: Depth", "uuid": "09ee22aa-b54c-4cfa-bf44-9521898c7f08", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ", "ROW-M50DG7uZP"], "type": "CHART"}, "CHART-hIXOnT4As5": {"children": [], "id": "CHART-hIXOnT4As5", "meta": {"chartId": 66, "height": 54, "sliceName": "GBM: Variable Importances", "uuid": "2c3c9e3f-bcaa-4207-94d7-4e924354b075", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ", "ROW-KzzXL7SN_"], "type": "CHART"}, "CHART-mPgk5JD_c8": {"children": [], "id": "CHART-mPgk5JD_c8", "meta": {"chartId": 67, "height": 54, "sliceName": "GBM: Variable Importance", "uuid": "2e6e2439-a330-4208-b8b3-0b83477c6ba7", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ", "ROW-KzzXL7SN_"], "type": "CHART"}, "CHART-sevXNSQU1D": {"children": [], "id": "CHART-sevXNSQU1D", "meta": {"chartId": 73, "height": 48, "sliceName": "GBM: Model Validation Details", "uuid": "ae1e3ef4-9080-4931-9f14-70ca1fbcfd59", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ", "ROW-AQzFETFwd"], "type": "CHART"}, "CHART-vUvFPLc6Wt": {"children": [], "id": "CHART-vUvFPLc6Wt", "meta": {"chartId": 68, "height": 20, "sliceName": "GBM: Trees", "uuid": "30c5cfa7-aa92-44f3-9880-71ccad54fefe", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ", "ROW-M50DG7uZP"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["TABS-KXnu-Lw2VL"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "ecosystem.Ai Workbench: GBM 1.1"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-0_DEu0O1g": {"children": ["CHART-GlZh0IyPEf"], "id": "ROW-0_DEu0O1g", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-f3JFaaFre1"], "type": "ROW"}, "ROW-AQzFETFwd": {"children": ["CHART-bW1zL21ZFf", "CHART-sevXNSQU1D", "CHART-K6OhgCHriO"], "id": "ROW-AQzFETFwd", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ"], "type": "ROW"}, "ROW-CSOEUBrUp": {"children": ["CHART-41Ss1Zpfk9", "CHART-Rknu2gLfdB"], "id": "ROW-CSOEUBrUp", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-f3JFaaFre1"], "type": "ROW"}, "ROW-KzzXL7SN_": {"children": ["CHART-hIXOnT4As5", "CHART-mPgk5JD_c8"], "id": "ROW-KzzXL7SN_", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ"], "type": "ROW"}, "ROW-M50DG7uZP": {"children": ["CHART-vUvFPLc6Wt", "CHART-cnYotm2vjg"], "id": "ROW-M50DG7uZP", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-7sPlMogPZ"], "type": "ROW"}, "ROW-mmEAL5P-O": {"children": ["CHART-PTmjLaDWrf"], "id": "ROW-mmEAL5P-O", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-CjVHr2kfI"], "type": "ROW"}, "ROW-uNM0r4N3X": {"children": ["CHART-b3qPoBfLfR", "CHART-BgO-KZBASC"], "id": "ROW-uNM0r4N3X", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL", "TAB-80i5hRDPP"], "type": "ROW"}, "TAB-7sPlMogPZ": {"children": ["ROW-M50DG7uZP", "ROW-AQzFETFwd", "ROW-KzzXL7SN_"], "id": "TAB-7sPlMogPZ", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Model Details"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL"], "type": "TAB"}, "TAB-80i5hRDPP": {"children": ["ROW-uNM0r4N3X"], "id": "TAB-80i5hRDPP", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Confusion Matrix"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL"], "type": "TAB"}, "TAB-CjVHr2kfI": {"children": ["ROW-mmEAL5P-O"], "id": "TAB-CjVHr2kfI", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Accuracy Detail"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL"], "type": "TAB"}, "TAB-f3JFaaFre1": {"children": ["ROW-CSOEUBrUp", "ROW-0_DEu0O1g"], "id": "TAB-f3JFaaFre1", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Overview"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-KXnu-Lw2VL"], "type": "TAB"}, "TABS-KXnu-Lw2VL": {"children": ["TAB-f3JFaaFre1", "TAB-7sPlMogPZ", "TAB-80i5hRDPP", "TAB-CjVHr2kfI"], "id": "TABS-KXnu-Lw2VL", "meta": {}, "parents": ["ROOT_ID", "GRID_ID"], "type": "TABS"}}	35	35		\N	\N	{"timed_refresh_immune_slices": [], "expanded_slices": {}, "refresh_frequency": 0, "default_filters": "{}", "color_scheme": "", "remote_id": 2, "import_time": 1635253453, "show_native_filters": true, "native_filter_configuration": [{"id": "NATIVE_FILTER-xHeSnbxOV", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Model", "filterType": "filter_select", "targets": [{"column": {"name": "model_identity"}, "datasetId": 20}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["TAB-CjVHr2kfI", "TAB-80i5hRDPP", "TAB-yE-Bcd3hi", "TAB-f3JFaaFre1"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [21, 26, 46, 47], "tabsInScope": ["TAB-CjVHr2kfI", "TAB-f3JFaaFre1"]}], "label_colors": {}, "chart_configuration": {}, "shared_label_colors": {}}	f	cc96bc94-ea97-43f6-a320-50badc3517df	\N	\N	f	\N
2022-11-25 13:10:43.002896	2022-11-25 13:10:43.002904	8	Client Pulse Responder	{"CHART-1ntushMLs0": {"children": [], "id": "CHART-1ntushMLs0", "meta": {"chartId": 84, "height": 63, "sliceName": "CPR: Predictor Summary", "uuid": "8aa7f5b8-c44f-42b0-b5e8-6e2bae1c5d9e", "width": 5}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-XJE1NwY2W"], "type": "CHART"}, "CHART-2BZQnVZeN5": {"children": [], "id": "CHART-2BZQnVZeN5", "meta": {"chartId": 86, "height": 48, "sliceName": "CPR: Total Servers", "uuid": "34340b40-8ba2-4c29-b724-1ed37ff32702", "width": 2}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-_98jDnmta"], "type": "CHART"}, "CHART-8jBuChgatM": {"children": [], "id": "CHART-8jBuChgatM", "meta": {"chartId": 90, "height": 63, "sliceName": "CPR: Explore", "uuid": "df5cff84-4d70-4e2e-a5f6-db5351c1a748", "width": 4}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-XJE1NwY2W"], "type": "CHART"}, "CHART-IiBJ_dZ6sW": {"children": [], "id": "CHART-IiBJ_dZ6sW", "meta": {"chartId": 87, "height": 48, "sliceName": "CPR: Total Ports", "uuid": "5de35387-11a1-4bc2-8f16-626c47b46716", "width": 2}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-_98jDnmta"], "type": "CHART"}, "CHART-ItMO1xTQjn": {"children": [], "id": "CHART-ItMO1xTQjn", "meta": {"chartId": 82, "height": 58, "sliceName": "CPR: Scores", "uuid": "43534188-811d-43be-8cfb-70377bc08a7b", "width": 6}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-qMhOxI0zP", "ROW-zbHbMngJn"], "type": "CHART"}, "CHART-OTW3E5FK0f": {"children": [], "id": "CHART-OTW3E5FK0f", "meta": {"chartId": 79, "height": 57, "sliceName": "CPR: Response Times", "uuid": "4045d509-87f1-4498-9691-fd885b09af71", "width": 6}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-qMhOxI0zP", "ROW-qd7j67pjC"], "type": "CHART"}, "CHART-R2kdclarZq": {"children": [], "id": "CHART-R2kdclarZq", "meta": {"chartId": 92, "height": 48, "sliceName": "CPR: Total Count", "uuid": "836b9cd4-ff4f-4bb4-8abd-5c4451f2ab20", "width": 2}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-_98jDnmta"], "type": "CHART"}, "CHART-RO96JBpJHu": {"children": [], "id": "CHART-RO96JBpJHu", "meta": {"chartId": 89, "height": 48, "sliceName": "CPR: Total Aggregated Responses", "uuid": "a0bec49f-c338-4e69-8245-ba57fe77f227", "width": 2}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-_98jDnmta"], "type": "CHART"}, "CHART-WFXLIUiFe7": {"children": [], "id": "CHART-WFXLIUiFe7", "meta": {"chartId": 91, "height": 120, "sliceName": "CPR: Predictors", "uuid": "46d7cbc0-d2d0-4811-9e10-2e82793fa235", "width": 6}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-INT1YD00G", "ROW-TFBxMSeoe"], "type": "CHART"}, "CHART-YWXGcY7WOy": {"children": [], "id": "CHART-YWXGcY7WOy", "meta": {"chartId": 81, "height": 57, "sliceName": "CPR: Response Scores", "uuid": "d9102712-e827-4f54-b0a1-e0c96641baf9", "width": 6}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-qMhOxI0zP", "ROW-qd7j67pjC"], "type": "CHART"}, "CHART-__VXruqR2X": {"children": [], "id": "CHART-__VXruqR2X", "meta": {"chartId": 80, "height": 120, "sliceName": "CPR: Model Performance", "uuid": "7834f41c-826b-4bc5-b493-fbc7423f7d6c", "width": 6}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-INT1YD00G", "ROW-TFBxMSeoe"], "type": "CHART"}, "CHART-e_SmgFOUz_": {"children": [], "id": "CHART-e_SmgFOUz_", "meta": {"chartId": 83, "height": 63, "sliceName": "CPR: Count per Hour", "uuid": "4d7762c8-4ffc-4b01-bf08-cbdc2b2bfc36", "width": 3}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-XJE1NwY2W"], "type": "CHART"}, "CHART-hkrwZuzb-q": {"children": [], "id": "CHART-hkrwZuzb-q", "meta": {"chartId": 85, "height": 48, "sliceName": "CPR: Predictor Total", "uuid": "19c725e8-6f65-43fb-86f8-e864b5dc9908", "width": 2}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-_98jDnmta"], "type": "CHART"}, "CHART-sVwJWBL1Gq": {"children": [], "id": "CHART-sVwJWBL1Gq", "meta": {"chartId": 78, "height": 58, "sliceName": "CPR: Count", "uuid": "8774f1a1-af22-4c2d-b862-fa955f768d79", "width": 6}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-qMhOxI0zP", "ROW-zbHbMngJn"], "type": "CHART"}, "CHART-yIypMkSHLu": {"children": [], "id": "CHART-yIypMkSHLu", "meta": {"chartId": 88, "height": 48, "sliceName": "CPR: Total Aggregated Logs", "uuid": "bdf750fa-ab32-4dc1-8831-afe694d7f3d2", "width": 2}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit", "ROW-_98jDnmta"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": [], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Client Pulse Responder"}, "type": "HEADER"}, "ROOT_ID": {"children": ["TABS-9XF_V8ACwA"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-TFBxMSeoe": {"children": ["CHART-WFXLIUiFe7", "CHART-__VXruqR2X"], "id": "ROW-TFBxMSeoe", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-INT1YD00G"], "type": "ROW"}, "ROW-XJE1NwY2W": {"children": ["CHART-1ntushMLs0", "CHART-e_SmgFOUz_", "CHART-8jBuChgatM"], "id": "ROW-XJE1NwY2W", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit"], "type": "ROW"}, "ROW-_98jDnmta": {"children": ["CHART-hkrwZuzb-q", "CHART-2BZQnVZeN5", "CHART-IiBJ_dZ6sW", "CHART-yIypMkSHLu", "CHART-RO96JBpJHu", "CHART-R2kdclarZq"], "id": "ROW-_98jDnmta", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-mQ0jZpVSit"], "type": "ROW"}, "ROW-qd7j67pjC": {"children": ["CHART-YWXGcY7WOy", "CHART-OTW3E5FK0f"], "id": "ROW-qd7j67pjC", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-qMhOxI0zP"], "type": "ROW"}, "ROW-zbHbMngJn": {"children": ["CHART-ItMO1xTQjn", "CHART-sVwJWBL1Gq"], "id": "ROW-zbHbMngJn", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA", "TAB-qMhOxI0zP"], "type": "ROW"}, "TAB-INT1YD00G": {"children": ["ROW-TFBxMSeoe"], "id": "TAB-INT1YD00G", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Predictors"}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA"], "type": "TAB"}, "TAB-mQ0jZpVSit": {"children": ["ROW-_98jDnmta", "ROW-XJE1NwY2W"], "id": "TAB-mQ0jZpVSit", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Summary"}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA"], "type": "TAB"}, "TAB-qMhOxI0zP": {"children": ["ROW-zbHbMngJn", "ROW-qd7j67pjC"], "id": "TAB-qMhOxI0zP", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Details"}, "parents": ["ROOT_ID", "TABS-9XF_V8ACwA"], "type": "TAB"}, "TABS-9XF_V8ACwA": {"children": ["TAB-mQ0jZpVSit", "TAB-INT1YD00G", "TAB-qMhOxI0zP"], "id": "TABS-9XF_V8ACwA", "meta": {}, "parents": ["ROOT_ID"], "type": "TABS"}}	35	35		\N	\N	{"timed_refresh_immune_slices": [], "expanded_slices": {}, "refresh_frequency": 0, "default_filters": "{}", "color_scheme": "", "show_native_filters": true, "native_filter_configuration": [{"id": "NATIVE_FILTER-C0GxyRK_M", "controlValues": {"sortAscending": true, "enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Predictor", "filterType": "filter_select", "targets": [{"column": {"name": "predictor"}, "datasetId": 24}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [80, 81, 82]}, "type": "NATIVE_FILTER", "chartsInScope": [50, 51, 62, 135, 136, 137, 138, 139, 140, 141, 144, 145], "tabsInScope": ["TAB-mQ0jZpVSit", "TAB-INT1YD00G", "TAB-qMhOxI0zP"], "description": ""}, {"id": "NATIVE_FILTER-rNPASUyf3", "controlValues": {"enableEmptyFilter": false}, "name": "Date Range", "filterType": "filter_time", "targets": [{}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [80, 81, 82, 89, 90]}, "type": "NATIVE_FILTER", "description": ""}], "label_colors": {}, "chart_configuration": {}, "shared_label_colors": {}, "color_scheme_domain": []}	f	b5f6a263-f224-4e36-969e-4b0d0f128847	\N	\N	f	\N
2022-11-25 13:10:43.014804	2022-11-25 13:10:43.014814	9	Complaints	{"CHART-0XEjlkSQpa": {"children": [], "id": "CHART-0XEjlkSQpa", "meta": {"chartId": 98, "height": 50, "sliceName": "Complaints Companies", "uuid": "679a0839-9cea-4ccc-9a48-3223ecdf6409", "width": 2}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-XpLtV22F37", "ROW-xkBl2Nv0j"], "type": "CHART"}, "CHART-4HAKGd9-YX": {"children": [], "id": "CHART-4HAKGd9-YX", "meta": {"chartId": 104, "height": 111, "sliceName": "Total Issues by Bank", "uuid": "18c16c31-51e5-4446-a68d-a1d2aa01dfb2", "width": 12}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-0YovaUf8k", "ROW-pypwYKh29"], "type": "CHART"}, "CHART-6HY0tQPlMP": {"children": [], "id": "CHART-6HY0tQPlMP", "meta": {"chartId": 106, "height": 111, "sliceName": "Company Issue Summary", "uuid": "8b5b630f-8c06-4dc3-b36d-219159c4f9ff", "width": 12}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-mnuDiaWGj", "ROW-0CCMUzL10"], "type": "CHART"}, "CHART-7RD8WzokrI": {"children": [], "id": "CHART-7RD8WzokrI", "meta": {"chartId": 103, "height": 68, "sliceName": "Complaints by Company Time", "uuid": "9643a861-99af-4792-9726-5e22ab50b564", "width": 4}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-XpLtV22F37", "ROW-E7uryd3U9"], "type": "CHART"}, "CHART-8VWq-fueNJ": {"children": [], "id": "CHART-8VWq-fueNJ", "meta": {"chartId": 99, "height": 50, "sliceName": "Complaints Product Issues", "uuid": "1ffb63a2-53dc-46e9-98ba-7ff64654119b", "width": 8}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-XpLtV22F37", "ROW-xkBl2Nv0j"], "type": "CHART"}, "CHART-AT6RX6FnW6": {"children": [], "id": "CHART-AT6RX6FnW6", "meta": {"chartId": 94, "height": 111, "sliceName": "Complaints Company Product", "uuid": "736e4703-680b-4066-a967-8d517a28f060", "width": 6}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-MEceSxz8L", "ROW-AV4P9DXMc"], "type": "CHART"}, "CHART-BJHKWv2yXg": {"children": [], "id": "CHART-BJHKWv2yXg", "meta": {"chartId": 97, "height": 68, "sliceName": "Complaints Company Sub-Product Totals", "uuid": "545f8a14-74c4-4f48-a3ed-203789a5b63f", "width": 4}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-XpLtV22F37", "ROW-E7uryd3U9"], "type": "CHART"}, "CHART-DT_49e3H7s": {"children": [], "id": "CHART-DT_49e3H7s", "meta": {"chartId": 102, "height": 111, "sliceName": "Product Issue Sunburst", "uuid": "5c512e6f-7ac3-45ad-8db4-ab85095fab3b", "width": 12}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-6KDQuooDV", "ROW-hx5cSjVO1"], "type": "CHART"}, "CHART-GQnu0fDyI5": {"children": [], "id": "CHART-GQnu0fDyI5", "meta": {"chartId": 101, "height": 116, "sliceName": "Complaints Issue Product Sankey", "uuid": "f2b95aee-6731-40e2-b752-b2a405f45d2b", "width": 12}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-ZYlotxh11", "ROW-jSoo62WJs"], "type": "CHART"}, "CHART-PnOcILczVt": {"children": [], "id": "CHART-PnOcILczVt", "meta": {"chartId": 100, "height": 50, "sliceName": "Complaints Total Products", "uuid": "f5c37ac1-c9e2-4a7c-b997-793aab74fddb", "width": 2}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-XpLtV22F37", "ROW-xkBl2Nv0j"], "type": "CHART"}, "CHART-SoQjIMzALV": {"children": [], "id": "CHART-SoQjIMzALV", "meta": {"chartId": 105, "height": 111, "sliceName": "Total Issues by Bank Product", "uuid": "47f00af3-b027-45fa-8249-f7c8926e4fc7", "width": 12}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-74yHTof6i", "ROW-TH3IVGPiR"], "type": "CHART"}, "CHART-TJo7N8Q72Q": {"children": [], "id": "CHART-TJo7N8Q72Q", "meta": {"chartId": 95, "height": 111, "sliceName": "Complaint Issues", "uuid": "9a306103-e0e0-4faa-ac6d-d4cb8333d25d", "width": 6}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-MEceSxz8L", "ROW-AV4P9DXMc"], "type": "CHART"}, "CHART-explore-156-1": {"children": [], "id": "CHART-explore-156-1", "meta": {"chartId": 107, "height": 111, "sliceName": "USA Banks by Zip", "uuid": "7fb8553d-e714-402e-a9b8-647bf84ae4eb", "width": 12}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-Tlp5edG4E", "ROW-TedkcHf0d"], "type": "CHART"}, "CHART-explore-157-1": {"children": [], "id": "CHART-explore-157-1", "meta": {"chartId": 108, "height": 111, "sliceName": "USA Banks Master List", "uuid": "21b7fc8e-3ae6-465a-8d08-ee4b2a026c33", "width": 12}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-c5qjWo_Gx", "ROW-p3a2RkOm3"], "type": "CHART"}, "CHART-hPsrlkVE4e": {"children": [], "id": "CHART-hPsrlkVE4e", "meta": {"chartId": 93, "height": 116, "sliceName": "Complaints: Company Product Graph", "uuid": "987122d1-e7dc-4cb8-8ee6-81d8b67fabdd", "width": 12}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-Cs6fJP3wg", "ROW-JgP9OCfjL"], "type": "CHART"}, "CHART-raGe38L8b4": {"children": [], "id": "CHART-raGe38L8b4", "meta": {"chartId": 96, "height": 68, "sliceName": "Complaints Company Product Totals", "uuid": "2ff688c2-9a40-4a34-b01e-a6efb6c503c1", "width": 4}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-XpLtV22F37", "ROW-E7uryd3U9"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": [], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Complaints"}, "type": "HEADER"}, "ROOT_ID": {"children": ["TABS-R_xBimkau-"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-0CCMUzL10": {"children": ["CHART-6HY0tQPlMP"], "id": "ROW-0CCMUzL10", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-mnuDiaWGj"], "type": "ROW"}, "ROW-AV4P9DXMc": {"children": ["CHART-AT6RX6FnW6", "CHART-TJo7N8Q72Q"], "id": "ROW-AV4P9DXMc", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-MEceSxz8L"], "type": "ROW"}, "ROW-E7uryd3U9": {"children": ["CHART-raGe38L8b4", "CHART-BJHKWv2yXg", "CHART-7RD8WzokrI"], "id": "ROW-E7uryd3U9", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-XpLtV22F37"], "type": "ROW"}, "ROW-JgP9OCfjL": {"children": ["CHART-hPsrlkVE4e"], "id": "ROW-JgP9OCfjL", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-Cs6fJP3wg"], "type": "ROW"}, "ROW-TH3IVGPiR": {"children": ["CHART-SoQjIMzALV"], "id": "ROW-TH3IVGPiR", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-74yHTof6i"], "type": "ROW"}, "ROW-TedkcHf0d": {"children": ["CHART-explore-156-1"], "id": "ROW-TedkcHf0d", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-Tlp5edG4E"], "type": "ROW"}, "ROW-hx5cSjVO1": {"children": ["CHART-DT_49e3H7s"], "id": "ROW-hx5cSjVO1", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-6KDQuooDV"], "type": "ROW"}, "ROW-jSoo62WJs": {"children": ["CHART-GQnu0fDyI5"], "id": "ROW-jSoo62WJs", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-ZYlotxh11"], "type": "ROW"}, "ROW-p3a2RkOm3": {"children": ["CHART-explore-157-1"], "id": "ROW-p3a2RkOm3", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-c5qjWo_Gx"], "type": "ROW"}, "ROW-pypwYKh29": {"children": ["CHART-4HAKGd9-YX"], "id": "ROW-pypwYKh29", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-0YovaUf8k"], "type": "ROW"}, "ROW-xkBl2Nv0j": {"children": ["CHART-0XEjlkSQpa", "CHART-PnOcILczVt", "CHART-8VWq-fueNJ"], "id": "ROW-xkBl2Nv0j", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-", "TAB-XpLtV22F37"], "type": "ROW"}, "TAB-0YovaUf8k": {"children": ["ROW-pypwYKh29"], "id": "TAB-0YovaUf8k", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Total Issues by Bank"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-6KDQuooDV": {"children": ["ROW-hx5cSjVO1"], "id": "TAB-6KDQuooDV", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Product Issue Sunburst"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-74yHTof6i": {"children": ["ROW-TH3IVGPiR"], "id": "TAB-74yHTof6i", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Total Issues by Bank Product"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-Cs6fJP3wg": {"children": ["ROW-JgP9OCfjL"], "id": "TAB-Cs6fJP3wg", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Company Graph"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-MEceSxz8L": {"children": ["ROW-AV4P9DXMc"], "id": "TAB-MEceSxz8L", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Details"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-SQTWJuSeJ": {"children": [], "id": "TAB-SQTWJuSeJ", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "||"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-Tlp5edG4E": {"children": ["ROW-TedkcHf0d"], "id": "TAB-Tlp5edG4E", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "USA Banks"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-XpLtV22F37": {"children": ["ROW-xkBl2Nv0j", "ROW-E7uryd3U9"], "id": "TAB-XpLtV22F37", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Summary"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-ZYlotxh11": {"children": ["ROW-jSoo62WJs"], "id": "TAB-ZYlotxh11", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Product Issues"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-c5qjWo_Gx": {"children": ["ROW-p3a2RkOm3"], "id": "TAB-c5qjWo_Gx", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "USA Banks List"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TAB-mnuDiaWGj": {"children": ["ROW-0CCMUzL10"], "id": "TAB-mnuDiaWGj", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Company Issue Summary"}, "parents": ["ROOT_ID", "TABS-R_xBimkau-"], "type": "TAB"}, "TABS-R_xBimkau-": {"children": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-SQTWJuSeJ", "TAB-Tlp5edG4E", "TAB-c5qjWo_Gx"], "id": "TABS-R_xBimkau-", "meta": {}, "parents": ["ROOT_ID"], "type": "TABS"}}	35	35		\N	\N	{"timed_refresh_immune_slices": [], "expanded_slices": {}, "refresh_frequency": 0, "default_filters": "{}", "color_scheme": "", "label_colors": {}, "show_native_filters": true, "native_filter_configuration": [{"id": "NATIVE_FILTER_DIVIDER-Lw6dzjnAm", "type": "DIVIDER", "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "title": "Company and Location", "description": "", "chartsInScope": [], "tabsInScope": []}, {"id": "NATIVE_FILTER-y85rPBRhC", "controlValues": {"enableEmptyFilter": false}, "name": "Time Range", "filterType": "filter_time", "targets": [{}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 156, 157], "tabsInScope": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-Tlp5edG4E", "TAB-c5qjWo_Gx"]}, {"id": "NATIVE_FILTER-a74xYUQlg", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Company", "filterType": "filter_select", "targets": [{"column": {"name": "company"}, "datasetId": 27}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 156, 157], "tabsInScope": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-Tlp5edG4E", "TAB-c5qjWo_Gx"]}, {"id": "NATIVE_FILTER-7z1FARAap", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Zip Code", "filterType": "filter_select", "targets": [{"column": {"name": "zip_code"}, "datasetId": 27}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [107]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 157], "tabsInScope": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-c5qjWo_Gx"]}, {"id": "NATIVE_FILTER-TADjTvaAA", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "State", "filterType": "filter_select", "targets": [{"column": {"name": "state"}, "datasetId": 27}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [107]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 157], "tabsInScope": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-c5qjWo_Gx"]}, {"id": "NATIVE_FILTER_DIVIDER-voD7l2nc5", "type": "DIVIDER", "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "title": "Product and Issue", "description": "", "chartsInScope": [], "tabsInScope": []}, {"id": "NATIVE_FILTER-CAMS9xpyv", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Product", "filterType": "filter_select", "targets": [{"column": {"name": "product"}, "datasetId": 27}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 156, 157], "tabsInScope": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-Tlp5edG4E", "TAB-c5qjWo_Gx"]}, {"id": "NATIVE_FILTER-AkKE7HqYQ", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Sub Product", "filterType": "filter_select", "targets": [{"column": {"name": "sub-product"}, "datasetId": 27}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [107]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 157], "tabsInScope": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-c5qjWo_Gx"]}, {"id": "NATIVE_FILTER-aFoWPhScL", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Issue", "filterType": "filter_select", "targets": [{"column": {"name": "issue"}, "datasetId": 27}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 156, 157], "tabsInScope": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-Tlp5edG4E", "TAB-c5qjWo_Gx"]}, {"id": "NATIVE_FILTER-ev9Qcds0C", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Sub Issue", "filterType": "filter_select", "targets": [{"column": {"name": "sub_issue"}, "datasetId": 27}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [107]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 157], "tabsInScope": ["TAB-XpLtV22F37", "TAB-Cs6fJP3wg", "TAB-ZYlotxh11", "TAB-6KDQuooDV", "TAB-MEceSxz8L", "TAB-0YovaUf8k", "TAB-74yHTof6i", "TAB-mnuDiaWGj", "TAB-c5qjWo_Gx"]}], "chart_configuration": {}, "shared_label_colors": {}, "color_scheme_domain": []}	f	a511a820-ed8b-478e-a978-75b8c18dee58	\N	\N	f	\N
2022-11-25 13:10:43.026166	2022-11-25 13:10:43.026172	10	Bank ClickStream	{"CHART--GupkWgSTO": {"children": [], "id": "CHART--GupkWgSTO", "meta": {"chartId": 111, "height": 50, "sliceName": "Bank Realuiid per Day", "uuid": "117e9aed-53e0-43e5-af60-29c1f36c21b2", "width": 7}, "parents": ["ROOT_ID", "GRID_ID", "TABS-Kd-xY15S0b", "TAB-0NnqD91hQq", "ROW-KfAGnnbpA"], "type": "CHART"}, "CHART-1bEyGoDQKA": {"children": [], "id": "CHART-1bEyGoDQKA", "meta": {"chartId": 110, "height": 50, "sliceName": "Bank Action Types", "uuid": "91455f80-c788-41c7-9dc5-76ddf5f16a04", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-Kd-xY15S0b", "TAB-0NnqD91hQq", "ROW-KfAGnnbpA"], "type": "CHART"}, "CHART-yRsACJHLMm": {"children": [], "id": "CHART-yRsACJHLMm", "meta": {"chartId": 109, "height": 50, "sliceName": "Bank day activity", "uuid": "cd160bdc-b9d6-429b-911f-a42d423f65c7", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-Kd-xY15S0b", "TAB-Fn0Y13EAC", "ROW-j_ReEOkhn"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["TABS-Kd-xY15S0b"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Bank ClickStream"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-KfAGnnbpA": {"children": ["CHART--GupkWgSTO", "CHART-1bEyGoDQKA"], "id": "ROW-KfAGnnbpA", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-Kd-xY15S0b", "TAB-0NnqD91hQq"], "type": "ROW"}, "ROW-j_ReEOkhn": {"children": ["CHART-yRsACJHLMm"], "id": "ROW-j_ReEOkhn", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-Kd-xY15S0b", "TAB-Fn0Y13EAC"], "type": "ROW"}, "TAB-0NnqD91hQq": {"children": ["ROW-KfAGnnbpA"], "id": "TAB-0NnqD91hQq", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Details"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-Kd-xY15S0b"], "type": "TAB"}, "TAB-Fn0Y13EAC": {"children": ["ROW-j_ReEOkhn"], "id": "TAB-Fn0Y13EAC", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Activities"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-Kd-xY15S0b"], "type": "TAB"}, "TABS-Kd-xY15S0b": {"children": ["TAB-0NnqD91hQq", "TAB-Fn0Y13EAC"], "id": "TABS-Kd-xY15S0b", "meta": {}, "parents": ["ROOT_ID", "GRID_ID"], "type": "TABS"}}	35	35		\N	\N	{"show_native_filters": true, "color_scheme": "", "refresh_frequency": 0, "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "native_filter_configuration": [{"id": "NATIVE_FILTER-Npy545u2I", "controlValues": {"enableEmptyFilter": false}, "name": "Date Range", "filterType": "filter_time", "targets": [{}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [83], "tabsInScope": ["TAB-0NnqD91hQq"]}, {"id": "NATIVE_FILTER-agujH921o", "controlValues": {"multiSelect": true, "enableEmptyFilter": false, "defaultToFirstItem": false, "inverseSelection": false, "searchAllOptions": false}, "name": "Action", "filterType": "filter_select", "targets": [{"column": {"name": "action"}, "datasetId": 29}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": ""}]}	f	5f0bfc51-6198-415c-8b99-620d16bde1dc	\N	\N	f	\N
2022-11-25 13:10:43.04126	2022-11-25 13:10:43.041267	11	Automated QA Predicted	{"CHART-448Ezdedki": {"children": [], "id": "CHART-448Ezdedki", "meta": {"chartId": 119, "height": 63, "sliceName": "AQP MBTI Analysis", "uuid": "fadc5a1d-f408-4421-89e2-36006ac80835", "width": 6}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg", "ROW-1liK3cxDQB"], "type": "CHART"}, "CHART-ANXu_65ACj": {"children": [], "id": "CHART-ANXu_65ACj", "meta": {"chartId": 121, "height": 114, "sliceName": "AQP Reasons Over Time", "uuid": "443fdeb8-814b-49d8-a9aa-a008717b8da0", "width": 8}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-YLjdGm6Ea", "ROW-2iXZnVwql"], "type": "CHART"}, "CHART-BW3-8RhDso": {"children": [], "id": "CHART-BW3-8RhDso", "meta": {"chartId": 115, "height": 78, "sliceName": "AQP All Users", "uuid": "ffa56184-6fdd-445d-9b85-ba239587e411", "width": 8}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-5A2sNnYfI", "ROW-H4MW-PkvN"], "type": "CHART"}, "CHART-H99fs8a-a3": {"children": [], "id": "CHART-H99fs8a-a3", "meta": {"chartId": 125, "height": 114, "sliceName": "AQP Predictions", "uuid": "cbcefcb4-a0ee-409b-a151-5573e9e04b8f", "width": 4}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-YLjdGm6Ea", "ROW-2iXZnVwql"], "type": "CHART"}, "CHART-IlisUXL6o2": {"children": [], "id": "CHART-IlisUXL6o2", "meta": {"chartId": 114, "height": 78, "sliceName": "AQP Departments", "uuid": "b1eda9be-a6aa-4dd9-bf33-aa7aba474d68", "width": 4}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-5A2sNnYfI", "ROW-H4MW-PkvN"], "type": "CHART"}, "CHART-N6FYD09klP": {"children": [], "id": "CHART-N6FYD09klP", "meta": {"chartId": 116, "height": 38, "sliceName": "AQP Total Departments", "uuid": "db2fb19d-6cfa-420e-a7fe-a4a31203deeb", "width": 2}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg", "ROW-qeKsOuVJ8"], "type": "CHART"}, "CHART-SRw--TuDqU": {"children": [], "id": "CHART-SRw--TuDqU", "meta": {"chartId": 117, "height": 38, "sliceName": "AQP Total Reasons", "uuid": "5e305a33-9f80-4bdd-ae76-6b922aa0518c", "width": 2}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg", "ROW-qeKsOuVJ8"], "type": "CHART"}, "CHART-TBJF6lyOdG": {"children": [], "id": "CHART-TBJF6lyOdG", "meta": {"chartId": 113, "height": 38, "sliceName": "AQP Users", "uuid": "2526e14a-3015-4afe-baf9-d303fccd8abf", "width": 2}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg", "ROW-qeKsOuVJ8"], "type": "CHART"}, "CHART-UTAAtht8av": {"children": [], "id": "CHART-UTAAtht8av", "meta": {"chartId": 112, "height": 117, "sliceName": "AQP Predicted Prepared", "uuid": "ff2f9445-7e9c-4559-9f9e-dcbb2fbae2a1", "width": 12}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-0Fc-XIZEQ", "ROW-Oi1h5m7Vu"], "type": "CHART"}, "CHART-V9W-88LILR": {"children": [], "id": "CHART-V9W-88LILR", "meta": {"chartId": 118, "height": 63, "sliceName": "AQP B5 Personality", "uuid": "c67f23ce-42db-4921-aa73-2291f9c30f19", "width": 6}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg", "ROW-1liK3cxDQB"], "type": "CHART"}, "CHART-ZL_pS4aZSU": {"children": [], "id": "CHART-ZL_pS4aZSU", "meta": {"chartId": 126, "height": 115, "sliceName": "AQP Reason Network", "uuid": "5eae7161-ba82-4404-9263-f8a66768ec84", "width": 12}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-RdctWtVZG", "ROW-xnAtWVOyN"], "type": "CHART"}, "CHART-gQIRPcVfWi": {"children": [], "id": "CHART-gQIRPcVfWi", "meta": {"chartId": 123, "height": 38, "sliceName": "AQP Total Days", "uuid": "c2b816a2-9314-48e8-a214-4fcc29eeaf09", "width": 2}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg", "ROW-qeKsOuVJ8"], "type": "CHART"}, "CHART-g_CqsrlmZi": {"children": [], "id": "CHART-g_CqsrlmZi", "meta": {"chartId": 122, "height": 38, "sliceName": "AQP Total Reasons 1", "uuid": "f3f815f4-9e9a-443b-837f-85463b9d1feb", "width": 2}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg", "ROW-qeKsOuVJ8"], "type": "CHART"}, "CHART-nIsX7f5rqr": {"children": [], "id": "CHART-nIsX7f5rqr", "meta": {"chartId": 120, "height": 112, "sliceName": "AQP Activity Over Time", "uuid": "8841d49e-db4a-4702-b9f8-344c543dd8d2", "width": 12}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-eyEhMRpN_", "ROW-kl0koqZTV"], "type": "CHART"}, "CHART-u4Mt1QUI5v": {"children": [], "id": "CHART-u4Mt1QUI5v", "meta": {"chartId": 124, "height": 38, "sliceName": "AQP Total Verbs", "uuid": "15925e49-e6ea-4307-b783-efef61303072", "width": 2}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg", "ROW-qeKsOuVJ8"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": [], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Automated QA Predicted"}, "type": "HEADER"}, "ROOT_ID": {"children": ["TABS-bppq_KfkZp"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-1liK3cxDQB": {"children": ["CHART-V9W-88LILR", "CHART-448Ezdedki"], "id": "ROW-1liK3cxDQB", "meta": {"0": "ROOT_ID", "1": "TABS-bppq_KfkZp", "background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg"], "type": "ROW"}, "ROW-2iXZnVwql": {"children": ["CHART-ANXu_65ACj", "CHART-H99fs8a-a3"], "id": "ROW-2iXZnVwql", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-YLjdGm6Ea"], "type": "ROW"}, "ROW-H4MW-PkvN": {"children": ["CHART-IlisUXL6o2", "CHART-BW3-8RhDso"], "id": "ROW-H4MW-PkvN", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-5A2sNnYfI"], "type": "ROW"}, "ROW-Oi1h5m7Vu": {"children": ["CHART-UTAAtht8av"], "id": "ROW-Oi1h5m7Vu", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-0Fc-XIZEQ"], "type": "ROW"}, "ROW-kl0koqZTV": {"children": ["CHART-nIsX7f5rqr"], "id": "ROW-kl0koqZTV", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-eyEhMRpN_"], "type": "ROW"}, "ROW-qeKsOuVJ8": {"children": ["CHART-TBJF6lyOdG", "CHART-N6FYD09klP", "CHART-SRw--TuDqU", "CHART-g_CqsrlmZi", "CHART-gQIRPcVfWi", "CHART-u4Mt1QUI5v"], "id": "ROW-qeKsOuVJ8", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-B9zGpMousg"], "type": "ROW"}, "ROW-xnAtWVOyN": {"children": ["CHART-ZL_pS4aZSU"], "id": "ROW-xnAtWVOyN", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp", "TAB-RdctWtVZG"], "type": "ROW"}, "TAB-0Fc-XIZEQ": {"children": ["ROW-Oi1h5m7Vu"], "id": "TAB-0Fc-XIZEQ", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Details"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp"], "type": "TAB"}, "TAB-5A2sNnYfI": {"children": ["ROW-H4MW-PkvN"], "id": "TAB-5A2sNnYfI", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Users and Departments"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp"], "type": "TAB"}, "TAB-B9zGpMousg": {"children": ["ROW-qeKsOuVJ8", "ROW-1liK3cxDQB"], "id": "TAB-B9zGpMousg", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Main"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp"], "type": "TAB"}, "TAB-RdctWtVZG": {"children": ["ROW-xnAtWVOyN"], "id": "TAB-RdctWtVZG", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Reason Network"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp"], "type": "TAB"}, "TAB-YLjdGm6Ea": {"children": ["ROW-2iXZnVwql"], "id": "TAB-YLjdGm6Ea", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Reasons"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp"], "type": "TAB"}, "TAB-eyEhMRpN_": {"children": ["ROW-kl0koqZTV"], "id": "TAB-eyEhMRpN_", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Activity"}, "parents": ["ROOT_ID", "TABS-bppq_KfkZp"], "type": "TAB"}, "TABS-bppq_KfkZp": {"children": ["TAB-B9zGpMousg", "TAB-YLjdGm6Ea", "TAB-5A2sNnYfI", "TAB-eyEhMRpN_", "TAB-0Fc-XIZEQ", "TAB-RdctWtVZG"], "id": "TABS-bppq_KfkZp", "meta": {}, "parents": ["ROOT_ID"], "type": "TABS"}}	35	35		\N	\N	{"show_native_filters": true, "color_scheme": "", "refresh_frequency": 0, "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "native_filter_configuration": [{"id": "NATIVE_FILTER-yFDULe_Jb", "controlValues": {"multiSelect": true, "enableEmptyFilter": false, "defaultToFirstItem": false, "inverseSelection": false, "searchAllOptions": false}, "name": "Users", "filterType": "filter_select", "targets": [{"column": {"name": "userid"}, "datasetId": 30}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [87, 90, 91, 92, 93, 86, 88, 89], "tabsInScope": ["TAB-B9zGpMousg", "TAB-0Fc-XIZEQ", "TAB-5A2sNnYfI"]}, {"id": "NATIVE_FILTER-g5OgzVUTt", "controlValues": {"multiSelect": true, "enableEmptyFilter": false, "defaultToFirstItem": false, "inverseSelection": false, "searchAllOptions": false}, "name": "Department", "filterType": "filter_select", "targets": [{"column": {"name": "department"}, "datasetId": 30}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [87, 90, 91, 92, 93, 86, 88, 89], "tabsInScope": ["TAB-B9zGpMousg", "TAB-0Fc-XIZEQ", "TAB-5A2sNnYfI"]}, {"id": "NATIVE_FILTER-Bi85mt_1h", "controlValues": {"multiSelect": true, "enableEmptyFilter": false, "defaultToFirstItem": false, "inverseSelection": false, "searchAllOptions": false}, "name": "Reasons", "filterType": "filter_select", "targets": [{"column": {"name": "reason"}, "datasetId": 30}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [87, 90, 91, 92, 93, 94, 86, 88, 89], "tabsInScope": ["TAB-B9zGpMousg", "TAB-0Fc-XIZEQ", "TAB-5A2sNnYfI"]}]}	f	2f2c6cd3-1e80-477d-800b-cf795e6460e3	\N	\N	f	\N
2022-11-25 13:10:43.053022	2022-11-25 13:10:43.053035	12	Dynamic Recommender Just4U	{"CHART--z4UeWO25P": {"children": [], "id": "CHART--z4UeWO25P", "meta": {"chartId": 146, "height": 123, "sliceName": "Just4U Options Purchase Flag", "uuid": "6dd2b56b-e1f9-44ba-b883-89d135808f74", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-Gt4TYK0aQ", "ROW-q7USDDWzA"], "type": "CHART"}, "CHART-2P92w_Npda": {"children": [], "id": "CHART-2P92w_Npda", "meta": {"chartId": 127, "height": 155, "sliceName": "Just4U Options List", "uuid": "213d85ab-dcb1-4698-8017-2e0b0171a041", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-gBfdfT_gO", "ROW-Huv0cxnL0"], "type": "CHART"}, "CHART-5zJo5dpfRu": {"children": [], "id": "CHART-5zJo5dpfRu", "meta": {"chartId": 137, "height": 160, "sliceName": "Just4U Options Variable Dependency Graph", "uuid": "00ade148-6e38-4ace-9467-516580aeb47d", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-TrMQwzZx-", "ROW-O-WDA4DQd"], "type": "CHART"}, "CHART-67qDrK16a8": {"children": [], "id": "CHART-67qDrK16a8", "meta": {"chartId": 135, "height": 30, "sliceName": "Just4U Options Count Max Alpha", "uuid": "9c4904ef-59af-453f-91e9-28d604293f1f", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-hXkdmZq19"], "type": "CHART"}, "CHART-70YYY1Rk03": {"children": [], "id": "CHART-70YYY1Rk03", "meta": {"chartId": 130, "height": 155, "sliceName": "Just4U Options Options Key (Offer)", "uuid": "415a962b-6b66-4d14-92e3-56e79e9c8fbf", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-ThUOIHf1l", "ROW-HqPm3ixEl"], "type": "CHART"}, "CHART-7iATu8BPlj": {"children": [], "id": "CHART-7iATu8BPlj", "meta": {"chartId": 144, "height": 49, "sliceName": "Just4U Options Variable Two", "uuid": "54a681e6-db3a-432d-987e-291298ffece2", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-C_gghv9vM"], "type": "CHART"}, "CHART-8flgjSoIHS": {"children": [], "id": "CHART-8flgjSoIHS", "meta": {"chartId": 129, "height": 156, "sliceName": "Just4U Options Variable One", "uuid": "c92e4e5f-42f1-473b-b07b-a36eac2f9b1a", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-LuHOWtTQF", "ROW-CQEl_FMVf"], "type": "CHART"}, "CHART-9xDlN6cf-u": {"children": [], "id": "CHART-9xDlN6cf-u", "meta": {"chartId": 134, "height": 31, "sliceName": "Just4U Options Count Variable Two", "uuid": "964f3cea-f802-450f-908e-0148c04da23a", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-hXkdmZq19"], "type": "CHART"}, "CHART-Apensjqbwe": {"children": [], "id": "CHART-Apensjqbwe", "meta": {"chartId": 128, "height": 151, "sliceName": "Just4U Options Pivot by Offer", "uuid": "2d7405c1-b6ed-4d68-9453-a9560fd1080e", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-BZvfF1oYN", "ROW-7ONF-u6_g"], "type": "CHART"}, "CHART-BML8UP_N77": {"children": [], "id": "CHART-BML8UP_N77", "meta": {"chartId": 140, "height": 50, "sliceName": "Just4U Options Variable One and Two", "uuid": "2324818e-efad-4ddf-abd6-74ef0f42112a", "width": 3}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-C_gghv9vM"], "type": "CHART"}, "CHART-Gy6TKVh7Y6": {"children": [], "id": "CHART-Gy6TKVh7Y6", "meta": {"chartId": 131, "height": 31, "sliceName": "Just4U Options Count", "uuid": "dcb4702a-80bb-434d-aa7e-a0317df9534a", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-hXkdmZq19"], "type": "CHART"}, "CHART-KEFh0MsJFl": {"children": [], "id": "CHART-KEFh0MsJFl", "meta": {"chartId": 136, "height": 31, "sliceName": "Just4U Options Count Max Beta", "uuid": "730001cd-fb61-475c-be8a-09247584224b", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-hXkdmZq19"], "type": "CHART"}, "CHART-OWymaF1lTZ": {"children": [], "id": "CHART-OWymaF1lTZ", "meta": {"chartId": 138, "height": 154, "sliceName": "Just4U Options Variable Offer Alpha", "uuid": "6b2bccad-303c-4c45-8d95-055e125e986b", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-ph-C_pXO2", "ROW-YWNGmZQoM"], "type": "CHART"}, "CHART-WsP80USrCc": {"children": [], "id": "CHART-WsP80USrCc", "meta": {"chartId": 143, "height": 49, "sliceName": "Just4U Options Variable One", "uuid": "829c6301-d791-4ed5-b40d-aa4b2c45673d", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-C_gghv9vM"], "type": "CHART"}, "CHART-a9LgDC9aF6": {"children": [], "id": "CHART-a9LgDC9aF6", "meta": {"chartId": 145, "height": 50, "sliceName": "Just4U Options Options Offers", "uuid": "e82d5b19-8505-4325-afe1-0b9495356693", "width": 5}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-C_gghv9vM"], "type": "CHART"}, "CHART-bswquebcCT": {"children": [], "id": "CHART-bswquebcCT", "meta": {"chartId": 142, "height": 80, "sliceName": "Just4U Options Offers Alpha/Beta", "uuid": "787d821a-2cfd-4b07-ba27-86dfa8c6d8d3", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-qnSVClaaO"], "type": "CHART"}, "CHART-gNQTEZZC7S": {"children": [], "id": "CHART-gNQTEZZC7S", "meta": {"chartId": 139, "height": 155, "sliceName": "Just4U Options Variable Two Offer Alpha", "uuid": "8cb9a1c4-8eec-4157-b25b-8dc8d950ae33", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-ph-C_pXO2", "ROW-YWNGmZQoM"], "type": "CHART"}, "CHART-nTeBiAfQEF": {"children": [], "id": "CHART-nTeBiAfQEF", "meta": {"chartId": 133, "height": 30, "sliceName": "Just4U Options Count Variable One", "uuid": "fe488b3a-e91d-42be-bc28-49e9b68b4f3a", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-hXkdmZq19"], "type": "CHART"}, "CHART-xxGc_IF7Dk": {"children": [], "id": "CHART-xxGc_IF7Dk", "meta": {"chartId": 132, "height": 31, "sliceName": "Just4U Options Count Options", "uuid": "b5adc035-29af-4331-a7c6-0584c5605c81", "width": 2}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-hXkdmZq19"], "type": "CHART"}, "CHART-zOmfVuXcOu": {"children": [], "id": "CHART-zOmfVuXcOu", "meta": {"chartId": 141, "height": 80, "sliceName": "Just4U Options Offers Histogram", "uuid": "6572706b-24a1-4a2f-9396-c27e23e2c61a", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n", "ROW-qnSVClaaO"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["TABS-h3t0nljEXg"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Just4U Options"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-7ONF-u6_g": {"children": ["CHART-Apensjqbwe"], "id": "ROW-7ONF-u6_g", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-BZvfF1oYN"], "type": "ROW"}, "ROW-CQEl_FMVf": {"children": ["CHART-8flgjSoIHS"], "id": "ROW-CQEl_FMVf", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-LuHOWtTQF"], "type": "ROW"}, "ROW-C_gghv9vM": {"children": ["CHART-BML8UP_N77", "CHART-WsP80USrCc", "CHART-7iATu8BPlj", "CHART-a9LgDC9aF6"], "id": "ROW-C_gghv9vM", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n"], "type": "ROW"}, "ROW-HqPm3ixEl": {"children": ["CHART-70YYY1Rk03"], "id": "ROW-HqPm3ixEl", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-ThUOIHf1l"], "type": "ROW"}, "ROW-Huv0cxnL0": {"children": ["CHART-2P92w_Npda"], "id": "ROW-Huv0cxnL0", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-gBfdfT_gO"], "type": "ROW"}, "ROW-O-WDA4DQd": {"children": ["CHART-5zJo5dpfRu"], "id": "ROW-O-WDA4DQd", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-TrMQwzZx-"], "type": "ROW"}, "ROW-YWNGmZQoM": {"children": ["CHART-OWymaF1lTZ", "CHART-gNQTEZZC7S"], "id": "ROW-YWNGmZQoM", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-ph-C_pXO2"], "type": "ROW"}, "ROW-hXkdmZq19": {"children": ["CHART-Gy6TKVh7Y6", "CHART-xxGc_IF7Dk", "CHART-nTeBiAfQEF", "CHART-9xDlN6cf-u", "CHART-67qDrK16a8", "CHART-KEFh0MsJFl"], "id": "ROW-hXkdmZq19", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n"], "type": "ROW"}, "ROW-q7USDDWzA": {"children": ["CHART--z4UeWO25P"], "id": "ROW-q7USDDWzA", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-Gt4TYK0aQ"], "type": "ROW"}, "ROW-qnSVClaaO": {"children": ["CHART-zOmfVuXcOu", "CHART-bswquebcCT"], "id": "ROW-qnSVClaaO", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg", "TAB-jCPJ0Upn_n"], "type": "ROW"}, "TAB-BZvfF1oYN": {"children": ["ROW-7ONF-u6_g"], "id": "TAB-BZvfF1oYN", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Options Pivot"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg"], "type": "TAB"}, "TAB-Gt4TYK0aQ": {"children": ["ROW-q7USDDWzA"], "id": "TAB-Gt4TYK0aQ", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Case History"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg"], "type": "TAB"}, "TAB-LuHOWtTQF": {"children": ["ROW-CQEl_FMVf"], "id": "TAB-LuHOWtTQF", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Alpha/Beta Box - Variable One"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg"], "type": "TAB"}, "TAB-ThUOIHf1l": {"children": ["ROW-HqPm3ixEl"], "id": "TAB-ThUOIHf1l", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Alpha/Beta Box - Options Key"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg"], "type": "TAB"}, "TAB-TrMQwzZx-": {"children": ["ROW-O-WDA4DQd"], "id": "TAB-TrMQwzZx-", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Variable Dependency Graph"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg"], "type": "TAB"}, "TAB-gBfdfT_gO": {"children": ["ROW-Huv0cxnL0"], "id": "TAB-gBfdfT_gO", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Detail Listing"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg"], "type": "TAB"}, "TAB-jCPJ0Upn_n": {"children": ["ROW-hXkdmZq19", "ROW-C_gghv9vM", "ROW-qnSVClaaO"], "id": "TAB-jCPJ0Upn_n", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Main"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg"], "type": "TAB"}, "TAB-ph-C_pXO2": {"children": ["ROW-YWNGmZQoM"], "id": "TAB-ph-C_pXO2", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Contextual Variables"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-h3t0nljEXg"], "type": "TAB"}, "TABS-h3t0nljEXg": {"children": ["TAB-jCPJ0Upn_n", "TAB-Gt4TYK0aQ", "TAB-ph-C_pXO2", "TAB-gBfdfT_gO", "TAB-BZvfF1oYN", "TAB-LuHOWtTQF", "TAB-ThUOIHf1l", "TAB-TrMQwzZx-"], "id": "TABS-h3t0nljEXg", "meta": {}, "parents": ["ROOT_ID", "GRID_ID"], "type": "TABS"}}	35	35		\N	\N	{"show_native_filters": true, "color_scheme": "", "refresh_frequency": 0, "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "native_filter_configuration": [{"id": "NATIVE_FILTER-r-yaOAlhz", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": true, "inverseSelection": false}, "name": "Option Key", "filterType": "filter_select", "targets": [{"column": {"name": "optionkey"}, "datasetId": 31}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [101, 102, 103, 104], "tabsInScope": ["TAB-BZvfF1oYN", "TAB-LuHOWtTQF", "TAB-ThUOIHf1l", "TAB-gBfdfT_gO"]}, {"id": "NATIVE_FILTER-PFRJLmzsw", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": true, "inverseSelection": false}, "name": "Contextual Variable One", "filterType": "filter_select", "targets": [{"column": {"name": "contextual_variable_one"}, "datasetId": 31}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [101, 102, 103, 104], "tabsInScope": ["TAB-BZvfF1oYN", "TAB-LuHOWtTQF", "TAB-ThUOIHf1l", "TAB-gBfdfT_gO"]}, {"id": "NATIVE_FILTER-5vfh1Mdw7", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": true, "inverseSelection": false}, "name": "Contextual Variable Two", "filterType": "filter_select", "targets": [{"column": {"name": "contextual_variable_two"}, "datasetId": 31}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [101, 102, 103, 104], "tabsInScope": ["TAB-BZvfF1oYN", "TAB-LuHOWtTQF", "TAB-ThUOIHf1l", "TAB-gBfdfT_gO"]}], "shared_label_colors": {}}	f	0fcf613c-25a2-4cef-99d7-0acbf38950a0	\N	\N	f	\N
2022-11-25 13:10:43.064229	2022-11-25 13:10:43.064235	13	Funds	{"CHART-7GUMm9A_1H": {"children": [], "id": "CHART-7GUMm9A_1H", "meta": {"chartId": 150, "height": 74, "sliceName": "Funds Transaction Types", "uuid": "0038e063-d99e-4b49-a559-8f45ca839840", "width": 7}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE", "ROW-nDvJBQ_6p"], "type": "CHART"}, "CHART-9LLDjd0j5-": {"children": [], "id": "CHART-9LLDjd0j5-", "meta": {"chartId": 149, "height": 41, "sliceName": "Funds User Total", "uuid": "28ab4f35-2d28-45bf-b997-2ea8aaaaaa56", "width": 2}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE", "ROW-QIWPdej4D"], "type": "CHART"}, "CHART-C2obKxPrQr": {"children": [], "id": "CHART-C2obKxPrQr", "meta": {"chartId": 161, "height": 116, "sliceName": "Funds Events by User and Transaction Type", "uuid": "03468f39-2eff-44c5-bba6-3b332f08483d", "width": 12}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-sPDYvJsrq", "ROW-Svc2dZXHd"], "type": "CHART"}, "CHART-HJxhxQKtPi": {"children": [], "id": "CHART-HJxhxQKtPi", "meta": {"chartId": 157, "height": 117, "sliceName": "Funds Transaction Types Time Series", "uuid": "d95d3a20-137b-49dc-a80b-acd449dfe58b", "width": 12}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-xjI_KP202", "ROW-fqG6drxWL"], "type": "CHART"}, "CHART-IWAUIDHBny": {"children": [], "id": "CHART-IWAUIDHBny", "meta": {"chartId": 148, "height": 41, "sliceName": "Funds Transaction Types Totals", "uuid": "dbdd9964-5dc4-468f-910f-c88e1b61130b", "width": 2}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE", "ROW-QIWPdej4D"], "type": "CHART"}, "CHART-XmHwBZwvfv": {"children": [], "id": "CHART-XmHwBZwvfv", "meta": {"chartId": 159, "height": 117, "sliceName": "Funds Events by Transaction Type and User", "uuid": "81b1ca45-c57c-416e-a486-86a3b2c3ff1a", "width": 12}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-hRgWPnBEK", "ROW-oz1xwNyNT"], "type": "CHART"}, "CHART-ZsBnvvldkL": {"children": [], "id": "CHART-ZsBnvvldkL", "meta": {"chartId": 156, "height": 41, "sliceName": "Funds Total Days", "uuid": "a9260809-1e8c-46a6-998a-54c7fbaa1d6d", "width": 2}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE", "ROW-QIWPdej4D"], "type": "CHART"}, "CHART-aIaDURUcb9": {"children": [], "id": "CHART-aIaDURUcb9", "meta": {"chartId": 155, "height": 41, "sliceName": "Funds Total Transactions", "uuid": "1c4f70f6-eb05-411d-bacf-c1e7ccbe02f9", "width": 2}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE", "ROW-QIWPdej4D"], "type": "CHART"}, "CHART-h2o9xqjGOM": {"children": [], "id": "CHART-h2o9xqjGOM", "meta": {"chartId": 153, "height": 117, "sliceName": "Funds Updated User by Transactions Distribution", "uuid": "64706e48-0b82-46b5-9fec-ec55ce842993", "width": 6}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-WZ7uy9fST", "ROW-wfO1HnC8N"], "type": "CHART"}, "CHART-l7RYK5NGxl": {"children": [], "id": "CHART-l7RYK5NGxl", "meta": {"chartId": 151, "height": 74, "sliceName": "Funds Users", "uuid": "9261d85b-59e5-4a5d-bd5b-3c8052e29593", "width": 5}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE", "ROW-nDvJBQ_6p"], "type": "CHART"}, "CHART-lC_TEGS8xW": {"children": [], "id": "CHART-lC_TEGS8xW", "meta": {"chartId": 160, "height": 117, "sliceName": "Funds Top Types by Updated Bubble", "uuid": "357b8de0-3a76-45c8-ae9a-1030852fa261", "width": 12}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-ninsCc13F", "ROW-Gu5A_AUnf"], "type": "CHART"}, "CHART-stSv6GhZsi": {"children": [], "id": "CHART-stSv6GhZsi", "meta": {"chartId": 154, "height": 117, "sliceName": "Funds User Transactions Network", "uuid": "90feb6e6-4f39-4255-813f-5a7ed6900bd5", "width": 12}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-2Kvvb4NiF", "ROW-IlGKYnrqR"], "type": "CHART"}, "CHART-uX0P6x0vfe": {"children": [], "id": "CHART-uX0P6x0vfe", "meta": {"chartId": 147, "height": 117, "sliceName": "Funds Transactions by Updated User (Org)", "uuid": "28438710-906c-4272-88aa-8ed2251e5466", "width": 12}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-K0WegF_Vb", "ROW-Fv2MGla1n"], "type": "CHART"}, "CHART-wX7GNRE1lO": {"children": [], "id": "CHART-wX7GNRE1lO", "meta": {"chartId": 158, "height": 41, "sliceName": "Funds Word Cloud Transaction Types ", "uuid": "5ccbfa01-fd40-46f0-a54e-c0a838a5ed55", "width": 4}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE", "ROW-QIWPdej4D"], "type": "CHART"}, "CHART-wbI9g4Jmpq": {"children": [], "id": "CHART-wbI9g4Jmpq", "meta": {"chartId": 152, "height": 117, "sliceName": "Funds Transactions by Updated User Distribution", "uuid": "1a0849d8-c8d9-4852-b4eb-555e5bdc6fb7", "width": 6}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-WZ7uy9fST", "ROW-wfO1HnC8N"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": [], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Funds"}, "type": "HEADER"}, "ROOT_ID": {"children": ["TABS-1RiAQzjd9q"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-Fv2MGla1n": {"children": ["CHART-uX0P6x0vfe"], "id": "ROW-Fv2MGla1n", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-K0WegF_Vb"], "type": "ROW"}, "ROW-Gu5A_AUnf": {"children": ["CHART-lC_TEGS8xW"], "id": "ROW-Gu5A_AUnf", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-ninsCc13F"], "type": "ROW"}, "ROW-IlGKYnrqR": {"children": ["CHART-stSv6GhZsi"], "id": "ROW-IlGKYnrqR", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-2Kvvb4NiF"], "type": "ROW"}, "ROW-QIWPdej4D": {"children": ["CHART-9LLDjd0j5-", "CHART-IWAUIDHBny", "CHART-aIaDURUcb9", "CHART-ZsBnvvldkL", "CHART-wX7GNRE1lO"], "id": "ROW-QIWPdej4D", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE"], "type": "ROW"}, "ROW-Svc2dZXHd": {"children": ["CHART-C2obKxPrQr"], "id": "ROW-Svc2dZXHd", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-sPDYvJsrq"], "type": "ROW"}, "ROW-fqG6drxWL": {"children": ["CHART-HJxhxQKtPi"], "id": "ROW-fqG6drxWL", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-xjI_KP202"], "type": "ROW"}, "ROW-nDvJBQ_6p": {"children": ["CHART-7GUMm9A_1H", "CHART-l7RYK5NGxl"], "id": "ROW-nDvJBQ_6p", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-uv5UkZCkbE"], "type": "ROW"}, "ROW-oz1xwNyNT": {"children": ["CHART-XmHwBZwvfv"], "id": "ROW-oz1xwNyNT", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-hRgWPnBEK"], "type": "ROW"}, "ROW-wfO1HnC8N": {"children": ["CHART-h2o9xqjGOM", "CHART-wbI9g4Jmpq"], "id": "ROW-wfO1HnC8N", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q", "TAB-WZ7uy9fST"], "type": "ROW"}, "TAB-2Kvvb4NiF": {"children": ["ROW-IlGKYnrqR"], "id": "TAB-2Kvvb4NiF", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "User Transaction Graph"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q"], "type": "TAB"}, "TAB-K0WegF_Vb": {"children": ["ROW-Fv2MGla1n"], "id": "TAB-K0WegF_Vb", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Transactions by User"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q"], "type": "TAB"}, "TAB-WZ7uy9fST": {"children": ["ROW-wfO1HnC8N"], "id": "TAB-WZ7uy9fST", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Distributions"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q"], "type": "TAB"}, "TAB-hRgWPnBEK": {"children": ["ROW-oz1xwNyNT"], "id": "TAB-hRgWPnBEK", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Events (Transaction Type)"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q"], "type": "TAB"}, "TAB-ninsCc13F": {"children": ["ROW-Gu5A_AUnf"], "id": "TAB-ninsCc13F", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "User Updated top Types"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q"], "type": "TAB"}, "TAB-sPDYvJsrq": {"children": ["ROW-Svc2dZXHd"], "id": "TAB-sPDYvJsrq", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Events (By User)"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q"], "type": "TAB"}, "TAB-uv5UkZCkbE": {"children": ["ROW-QIWPdej4D", "ROW-nDvJBQ_6p"], "id": "TAB-uv5UkZCkbE", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Overview"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q"], "type": "TAB"}, "TAB-xjI_KP202": {"children": ["ROW-fqG6drxWL"], "id": "TAB-xjI_KP202", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Transaction Time Series"}, "parents": ["ROOT_ID", "TABS-1RiAQzjd9q"], "type": "TAB"}, "TABS-1RiAQzjd9q": {"children": ["TAB-uv5UkZCkbE", "TAB-K0WegF_Vb", "TAB-xjI_KP202", "TAB-ninsCc13F", "TAB-WZ7uy9fST", "TAB-2Kvvb4NiF", "TAB-hRgWPnBEK", "TAB-sPDYvJsrq"], "id": "TABS-1RiAQzjd9q", "meta": {}, "parents": ["ROOT_ID"], "type": "TABS"}}	35	35		\N	funds	{"show_native_filters": true, "color_scheme": "", "refresh_frequency": 0, "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "native_filter_configuration": [{"id": "NATIVE_FILTER-dvNGTs60Z", "controlValues": {"enableEmptyFilter": false}, "name": "Updated Date", "filterType": "filter_time", "targets": [{}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 142, 143], "tabsInScope": ["TAB-uv5UkZCkbE", "TAB-K0WegF_Vb", "TAB-xjI_KP202", "TAB-ninsCc13F", "TAB-WZ7uy9fST", "TAB-2Kvvb4NiF", "TAB-hRgWPnBEK", "TAB-sPDYvJsrq"]}, {"id": "NATIVE_FILTER_DIVIDER-GCieiFTFh", "type": "DIVIDER", "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "title": "Core Analysis", "description": "", "chartsInScope": [], "tabsInScope": []}, {"id": "NATIVE_FILTER-xcZcAgmG2", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Transaction Types", "filterType": "filter_select", "targets": [{"column": {"name": "ttyp_description"}, "datasetId": 33}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 142, 143], "tabsInScope": ["TAB-uv5UkZCkbE", "TAB-K0WegF_Vb", "TAB-xjI_KP202", "TAB-ninsCc13F", "TAB-WZ7uy9fST", "TAB-2Kvvb4NiF", "TAB-hRgWPnBEK", "TAB-sPDYvJsrq"]}, {"id": "NATIVE_FILTER-m4oNXTZhY", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "User", "filterType": "filter_select", "targets": [{"column": {"name": "actr_last_updated_by"}, "datasetId": 33}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 142, 143], "tabsInScope": ["TAB-uv5UkZCkbE", "TAB-K0WegF_Vb", "TAB-xjI_KP202", "TAB-ninsCc13F", "TAB-WZ7uy9fST", "TAB-2Kvvb4NiF", "TAB-hRgWPnBEK", "TAB-sPDYvJsrq"]}], "shared_label_colors": {}}	f	40599a42-f412-44b6-90e5-6cce2066f1c5	\N	\N	f	\N
2022-11-25 13:10:43.073117	2022-11-25 13:10:43.073124	14	Collections	{"CHART-E4byL4GnYf": {"children": [], "id": "CHART-E4byL4GnYf", "meta": {"chartId": 181, "height": 50, "sliceName": "Collections: Company By Day of Week", "uuid": "af2a48f9-97a7-4d5b-af58-bee2cc56cdd1", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_", "ROW-DfVFqFRuK"], "type": "CHART"}, "CHART-Ndj7M2p60k": {"children": [], "id": "CHART-Ndj7M2p60k", "meta": {"chartId": 182, "height": 50, "sliceName": "Collections: Company By Week and Day", "uuid": "cd9d474f-fba4-4fa0-bcf3-bab529ec8fe0", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_", "ROW-NDH_AzGUr"], "type": "CHART"}, "CHART-QKnMp_-Xeu": {"children": [], "id": "CHART-QKnMp_-Xeu", "meta": {"chartId": 183, "height": 50, "sliceName": "Collections: Company By Month", "uuid": "c3682731-ff40-46b2-86ec-95553807e568", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_", "ROW-RzXAbABH11"], "type": "CHART"}, "CHART-explore-146-1": {"children": [], "id": "CHART-explore-146-1", "meta": {"chartId": 162, "height": 124, "sliceName": "Collections: Debit Order Data", "uuid": "430570d6-47e1-4d0d-bd07-200c37411da4", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-9Ml2SbmuO", "ROW-0aY5c7cWF"], "type": "CHART"}, "CHART-explore-171-1": {"children": [], "id": "CHART-explore-171-1", "meta": {"chartId": 163, "height": 111, "sliceName": "Collections: Status Nominated Graph", "uuid": "39f3faff-dda0-4a89-beb3-a353fb897bfb", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-rBnPuOnOb", "ROW-b1Hl5LxH2"], "type": "CHART"}, "CHART-explore-172-1": {"children": [], "id": "CHART-explore-172-1", "meta": {"chartId": 164, "height": 82, "sliceName": "Collections: Accounts", "uuid": "0b2dbfb3-f615-4d24-a0a7-740410dfeb5b", "width": 6}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-j--CtFOeQw", "ROW-ppjYV6Pwa"], "type": "CHART"}, "CHART-explore-173-1": {"children": [], "id": "CHART-explore-173-1", "meta": {"chartId": 165, "height": 38, "sliceName": "Collections: Total Destination Accounts", "uuid": "3e367f5c-4b35-434d-9450-91e5e4334ecf", "width": 2}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-j--CtFOeQw", "ROW-jEc015DtcW"], "type": "CHART"}, "CHART-explore-174-1": {"children": [], "id": "CHART-explore-174-1", "meta": {"chartId": 166, "height": 38, "sliceName": "Collections: Total Nominated Accounts", "uuid": "409f6ed2-1396-42f6-b6fa-ccf06a743120", "width": 2}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-j--CtFOeQw", "ROW-jEc015DtcW"], "type": "CHART"}, "CHART-explore-175-1": {"children": [], "id": "CHART-explore-175-1", "meta": {"chartId": 167, "height": 38, "sliceName": "Collections: Total Amount Processed", "uuid": "7ec11d57-643a-4296-8bd3-d022a9b78cf7", "width": 2}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-j--CtFOeQw", "ROW-jEc015DtcW"], "type": "CHART"}, "CHART-explore-176-1": {"children": [], "id": "CHART-explore-176-1", "meta": {"chartId": 168, "height": 83, "sliceName": "Collections: Nominated Accounts > 100 Transactions", "uuid": "d985f82b-040c-418d-909d-81023f1ad5b8", "width": 6}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-j--CtFOeQw", "ROW-ppjYV6Pwa"], "type": "CHART"}, "CHART-explore-177-1": {"children": [], "id": "CHART-explore-177-1", "meta": {"chartId": 169, "height": 38, "sliceName": "Collections: Total by Status", "uuid": "a57f3c0a-7482-47ea-a0ed-a568b048f2f2", "width": 6}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-j--CtFOeQw", "ROW-jEc015DtcW"], "type": "CHART"}, "CHART-explore-179-1": {"children": [], "id": "CHART-explore-179-1", "meta": {"chartId": 171, "height": 50, "sliceName": "Collections: Amount Paid 2022", "uuid": "10d2b591-e056-4175-865d-521a2b24d030", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-NQN8UFgLF", "ROW-v2hIwI1t7"], "type": "CHART"}, "CHART-explore-180-1": {"children": [], "id": "CHART-explore-180-1", "meta": {"chartId": 172, "height": 50, "sliceName": "Collections: Transaction Count Monthly Trend", "uuid": "5b6971f4-7d00-4d92-bd05-401a4ac842ad", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-Ww_yiqUJy", "ROW-yYLRpTdMW"], "type": "CHART"}, "CHART-explore-181-1": {"children": [], "id": "CHART-explore-181-1", "meta": {"chartId": 173, "height": 50, "sliceName": "Collections: Transaction Count 2022", "uuid": "80c2d403-b25f-41e2-82bc-eef004fdbe8b", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-Ww_yiqUJy", "ROW-AsSBSSbrt"], "type": "CHART"}, "CHART-explore-182-1": {"children": [], "id": "CHART-explore-182-1", "meta": {"chartId": 174, "height": 39, "sliceName": "Collections: Total Clients", "uuid": "a09c05b4-fbc1-4073-ba31-8d779c26732b", "width": 2}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-fx7KDZQie", "ROW-G5Eb28au4"], "type": "CHART"}, "CHART-explore-183-1": {"children": [], "id": "CHART-explore-183-1", "meta": {"chartId": 175, "height": 39, "sliceName": "Collections: Total Destinations", "uuid": "90d93555-7b78-4b0a-aad2-bf216cd56e8c", "width": 2}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-fx7KDZQie", "ROW-G5Eb28au4"], "type": "CHART"}, "CHART-explore-184-1": {"children": [], "id": "CHART-explore-184-1", "meta": {"chartId": 176, "height": 39, "sliceName": "Collections: Total Nominated", "uuid": "b6705c15-8e58-4f77-a676-a07d13a04726", "width": 2}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-fx7KDZQie", "ROW-G5Eb28au4"], "type": "CHART"}, "CHART-explore-185-1": {"children": [], "id": "CHART-explore-185-1", "meta": {"chartId": 177, "height": 39, "sliceName": "Collections: Total Short Name", "uuid": "be7f9c25-eb23-4330-84c6-608dceb1338a", "width": 2}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-fx7KDZQie", "ROW-G5Eb28au4"], "type": "CHART"}, "CHART-explore-186-1": {"children": [], "id": "CHART-explore-186-1", "meta": {"chartId": 178, "height": 84, "sliceName": "Collections: Summary List Short", "uuid": "87724e34-9c52-4047-b3ea-42def95a73ad", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-fx7KDZQie", "ROW-e09CVRIe5"], "type": "CHART"}, "CHART-explore-187-1": {"children": [], "id": "CHART-explore-187-1", "meta": {"chartId": 179, "height": 109, "sliceName": "Collections: Transactions Status TimeSeries", "uuid": "cba80fed-8f04-4d1e-ac5b-214c6b5916d4", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-hJDf5KNLS", "ROW-7fuQBvNnw"], "type": "CHART"}, "CHART-jnHncz3nNn": {"children": [], "id": "CHART-jnHncz3nNn", "meta": {"chartId": 184, "height": 50, "sliceName": "Collections: Company By Day of Month", "uuid": "262afbcd-079a-4872-83c3-034a3cd58cb6", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_", "ROW-rP0wjG5BV"], "type": "CHART"}, "CHART-qOMkj03_2H": {"children": [], "id": "CHART-qOMkj03_2H", "meta": {"chartId": 180, "height": 50, "sliceName": "Collections: Company By Week of Month", "uuid": "83cdd465-d1ab-47af-ad3a-470989399357", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_", "ROW-hmasdlTBL"], "type": "CHART"}, "CHART-sBHxmoGfCx": {"children": [], "id": "CHART-sBHxmoGfCx", "meta": {"chartId": 170, "height": 50, "sliceName": "Collections: Amount Paid Monthly Trend", "uuid": "03bf1771-356a-481a-a383-456c3025aad6", "width": 12}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-NQN8UFgLF", "ROW-a7f--UpscJ"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": [], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER-9vR3tlDs9o": {"children": [], "id": "HEADER-9vR3tlDs9o", "meta": {"background": "BACKGROUND_TRANSPARENT", "headerSize": "MEDIUM_HEADER", "text": "Year on year comparison"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-Ww_yiqUJy"], "type": "HEADER"}, "HEADER-dYdKzEZP-b": {"children": [], "id": "HEADER-dYdKzEZP-b", "meta": {"background": "BACKGROUND_TRANSPARENT", "headerSize": "MEDIUM_HEADER", "text": "Year on year comparison"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-NQN8UFgLF"], "type": "HEADER"}, "HEADER-sP4JIem8HP": {"children": [], "id": "HEADER-sP4JIem8HP", "meta": {"background": "BACKGROUND_TRANSPARENT", "headerSize": "SMALL_HEADER", "text": "## Chart for 2021 to go here once data is available ##"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-NQN8UFgLF"], "type": "HEADER"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Collections"}, "type": "HEADER"}, "ROOT_ID": {"children": ["TABS-Pr3-ovkr1E"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-0aY5c7cWF": {"children": ["CHART-explore-146-1"], "id": "ROW-0aY5c7cWF", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-9Ml2SbmuO"], "type": "ROW"}, "ROW-7fuQBvNnw": {"children": ["CHART-explore-187-1"], "id": "ROW-7fuQBvNnw", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-hJDf5KNLS"], "type": "ROW"}, "ROW-AsSBSSbrt": {"children": ["CHART-explore-181-1"], "id": "ROW-AsSBSSbrt", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-Ww_yiqUJy"], "type": "ROW"}, "ROW-DfVFqFRuK": {"children": ["CHART-E4byL4GnYf"], "id": "ROW-DfVFqFRuK", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_"], "type": "ROW"}, "ROW-G5Eb28au4": {"children": ["CHART-explore-182-1", "CHART-explore-183-1", "CHART-explore-184-1", "CHART-explore-185-1"], "id": "ROW-G5Eb28au4", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-fx7KDZQie"], "type": "ROW"}, "ROW-NDH_AzGUr": {"children": ["CHART-Ndj7M2p60k"], "id": "ROW-NDH_AzGUr", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_"], "type": "ROW"}, "ROW-RzXAbABH11": {"children": ["CHART-QKnMp_-Xeu"], "id": "ROW-RzXAbABH11", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_"], "type": "ROW"}, "ROW-a7f--UpscJ": {"children": ["CHART-sBHxmoGfCx"], "id": "ROW-a7f--UpscJ", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-NQN8UFgLF"], "type": "ROW"}, "ROW-b1Hl5LxH2": {"children": ["CHART-explore-171-1"], "id": "ROW-b1Hl5LxH2", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-rBnPuOnOb"], "type": "ROW"}, "ROW-e09CVRIe5": {"children": ["CHART-explore-186-1"], "id": "ROW-e09CVRIe5", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-fx7KDZQie"], "type": "ROW"}, "ROW-hmasdlTBL": {"children": ["CHART-qOMkj03_2H"], "id": "ROW-hmasdlTBL", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_"], "type": "ROW"}, "ROW-jEc015DtcW": {"children": ["CHART-explore-173-1", "CHART-explore-174-1", "CHART-explore-175-1", "CHART-explore-177-1"], "id": "ROW-jEc015DtcW", "meta": {"0": "ROOT_ID", "1": "TABS-Pr3-ovkr1E", "background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-j--CtFOeQw"], "type": "ROW"}, "ROW-ppjYV6Pwa": {"children": ["CHART-explore-172-1", "CHART-explore-176-1"], "id": "ROW-ppjYV6Pwa", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-j--CtFOeQw"], "type": "ROW"}, "ROW-rP0wjG5BV": {"children": ["CHART-jnHncz3nNn"], "id": "ROW-rP0wjG5BV", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-u_HuQ35H_"], "type": "ROW"}, "ROW-v2hIwI1t7": {"children": ["CHART-explore-179-1"], "id": "ROW-v2hIwI1t7", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-NQN8UFgLF"], "type": "ROW"}, "ROW-yYLRpTdMW": {"children": ["CHART-explore-180-1"], "id": "ROW-yYLRpTdMW", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E", "TAB-Ww_yiqUJy"], "type": "ROW"}, "TAB-9Ml2SbmuO": {"children": ["ROW-0aY5c7cWF"], "id": "TAB-9Ml2SbmuO", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Collections Transactions"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E"], "type": "TAB"}, "TAB-NQN8UFgLF": {"children": ["ROW-a7f--UpscJ", "HEADER-dYdKzEZP-b", "ROW-v2hIwI1t7", "HEADER-sP4JIem8HP"], "id": "TAB-NQN8UFgLF", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Amount Paid"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E"], "type": "TAB"}, "TAB-Ww_yiqUJy": {"children": ["ROW-yYLRpTdMW", "HEADER-9vR3tlDs9o", "ROW-AsSBSSbrt"], "id": "TAB-Ww_yiqUJy", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Transaction Count"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E"], "type": "TAB"}, "TAB-fx7KDZQie": {"children": ["ROW-G5Eb28au4", "ROW-e09CVRIe5"], "id": "TAB-fx7KDZQie", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Totals"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E"], "type": "TAB"}, "TAB-hJDf5KNLS": {"children": ["ROW-7fuQBvNnw"], "id": "TAB-hJDf5KNLS", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Status Codes over Time"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E"], "type": "TAB"}, "TAB-j--CtFOeQw": {"children": ["ROW-jEc015DtcW", "ROW-ppjYV6Pwa"], "id": "TAB-j--CtFOeQw", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Overview"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E"], "type": "TAB"}, "TAB-rBnPuOnOb": {"children": ["ROW-b1Hl5LxH2"], "id": "TAB-rBnPuOnOb", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Status Nominated Accounts"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E"], "type": "TAB"}, "TAB-u_HuQ35H_": {"children": ["ROW-RzXAbABH11", "ROW-hmasdlTBL", "ROW-rP0wjG5BV", "ROW-DfVFqFRuK", "ROW-NDH_AzGUr"], "id": "TAB-u_HuQ35H_", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Company Views"}, "parents": ["ROOT_ID", "TABS-Pr3-ovkr1E"], "type": "TAB"}, "TABS-Pr3-ovkr1E": {"children": ["TAB-j--CtFOeQw", "TAB-fx7KDZQie", "TAB-hJDf5KNLS", "TAB-rBnPuOnOb", "TAB-9Ml2SbmuO", "TAB-NQN8UFgLF", "TAB-Ww_yiqUJy", "TAB-u_HuQ35H_"], "id": "TABS-Pr3-ovkr1E", "meta": {}, "parents": ["ROOT_ID"], "type": "TABS"}, "CHART-YTBABKRL": {"children": [], "id": "CHART-YTBABKRL", "meta": {"chartId": 185, "height": 50, "sliceName": "Collections: Reason Description by Bank", "uuid": "a809c03e-a5fc-4ec1-aae7-32ba62927e03", "width": 4}, "type": "CHART"}}	35	35		\N	\N	{"show_native_filters": true, "color_scheme": "", "refresh_frequency": 0, "shared_label_colors": {}, "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "color_scheme_domain": [], "native_filter_configuration": [{"id": "NATIVE_FILTER-nZWSUiqeE", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Debit Order Status", "filterType": "filter_select", "targets": [{"column": {"name": "ht10_sts_desc"}, "datasetId": 35}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [162]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [171, 172, 173, 174, 175, 176, 177, 178], "tabsInScope": ["TAB-j--CtFOeQw", "TAB-rBnPuOnOb", "TAB-NQN8UFgLF"]}, {"id": "NATIVE_FILTER-PX5HdxhkL", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Client ID", "filterType": "filter_select", "targets": [{"column": {"name": "ht03_clnt_id"}, "datasetId": 35}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [162]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [171, 172, 173, 174, 175, 176, 177, 178], "tabsInScope": ["TAB-j--CtFOeQw", "TAB-rBnPuOnOb", "TAB-NQN8UFgLF"]}, {"id": "NATIVE_FILTER-9qnNe5msq", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Nominated Account", "filterType": "filter_select", "targets": [{"column": {"name": "ht03_nmntd_ac_m"}, "datasetId": 36}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [162, 170]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [171, 172, 173, 174, 175, 176, 177, 179, 180, 181], "tabsInScope": ["TAB-j--CtFOeQw", "TAB-rBnPuOnOb", "TAB-NQN8UFgLF", "TAB-Ww_yiqUJy"]}]}	f	d3d703cd-f7cd-4a33-98f4-d7afb8267146	\N	\N	f	\N
2022-11-25 13:10:43.084224	2022-11-25 13:10:43.08423	15	Experiment Details	{"CHART-explore-159-1": {"children": [], "id": "CHART-explore-159-1", "meta": {"chartId": 186, "height": 50, "sliceName": "Average Take Up", "uuid": "bb62aafa-b396-42c7-a22e-57824071fcc5", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "ROW-3PuwsUQgjg"], "type": "CHART"}, "CHART-explore-160-1": {"children": [], "id": "CHART-explore-160-1", "meta": {"chartId": 187, "height": 50, "sliceName": "Interaction Count", "uuid": "a929dcbd-06a3-44e5-a2bd-271992bff0a6", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "ROW-3PuwsUQgjg"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["ROW-3PuwsUQgjg", "ROW-N-JIZOAB1L"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Experiment Details"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-3PuwsUQgjg": {"children": ["CHART-explore-159-1", "CHART-explore-160-1"], "id": "ROW-3PuwsUQgjg", "meta": {"0": "ROOT_ID", "background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID"], "type": "ROW"}, "ROW-N-JIZOAB1L": {"children": ["CHART-JW9GU8IV", "CHART-THHJSF0N", "CHART-PMPAW9Q7"], "id": "ROW-N-JIZOAB1L", "meta": {"0": "ROOT_ID", "background": "BACKGROUND_TRANSPARENT"}, "type": "ROW", "parents": ["ROOT_ID", "GRID_ID"]}, "CHART-JW9GU8IV": {"children": [], "id": "CHART-JW9GU8IV", "meta": {"chartId": 188, "height": 50, "sliceName": "Additional Data Distribution", "uuid": "83652cf6-6ee1-4585-9521-92b3f81a34e8", "width": 4}, "type": "CHART", "parents": ["ROOT_ID", "GRID_ID", "ROW-N-JIZOAB1L"]}, "CHART-THHJSF0N": {"children": [], "id": "CHART-THHJSF0N", "meta": {"chartId": 190, "height": 50, "sliceName": "No. of Other Experiments Customers are Influenced By", "uuid": "30cc928e-f351-46b6-a9d8-d570d66562de", "width": 4}, "type": "CHART", "parents": ["ROOT_ID", "GRID_ID", "ROW-N-JIZOAB1L"]}, "CHART-PMPAW9Q7": {"children": [], "id": "CHART-PMPAW9Q7", "meta": {"chartId": 189, "height": 50, "sliceName": "Take Up Rate", "uuid": "db254f70-de0d-4368-9067-089f878f9386", "width": 4}, "type": "CHART", "parents": ["ROOT_ID", "GRID_ID", "ROW-N-JIZOAB1L"]}}	35	35		\N	\N	{"show_native_filters": true, "color_scheme": "", "refresh_frequency": 0, "shared_label_colors": {}, "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "native_filter_configuration": [{"id": "NATIVE_FILTER-hjL43Sgpg", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": true, "multiSelect": false, "searchAllOptions": false, "inverseSelection": false}, "requiredFirst": true, "name": "Experiment", "filterType": "filter_select", "targets": [{"column": {"name": "experiment"}, "datasetId": 41}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [159, 160, 161, 162, 163], "tabsInScope": []}, {"id": "NATIVE_FILTER-O-RyIWfPl", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Contextual Variable One", "filterType": "filter_select", "targets": [{"column": {"name": "contextual_variable_one"}, "datasetId": 41}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [190]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [159, 160, 161, 162, 163], "tabsInScope": []}, {"id": "NATIVE_FILTER-Gke09ESGc", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Contextual Variable Two", "filterType": "filter_select", "targets": [{"column": {"name": "contextual_variable_two"}, "datasetId": 41}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [190]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [159, 160, 161, 162, 163], "tabsInScope": []}, {"id": "NATIVE_FILTER-XT2zEYiPR", "controlValues": {"enableEmptyFilter": true, "defaultToFirstItem": false, "multiSelect": false, "searchAllOptions": false, "inverseSelection": false}, "name": "Additional Data", "filterType": "filter_select", "targets": [{"column": {"name": "metric_name"}, "datasetId": 41}], "defaultDataMask": {"extraFormData": {"filters": [{"col": "metric_name", "op": "IN", "val": ["no_filter"]}]}, "filterState": {"validateMessage": false, "validateStatus": false, "label": "no_filter", "value": ["no_filter"]}, "__cache": {"validateMessage": false, "validateStatus": false, "label": "no_filter", "value": ["no_filter"]}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [190]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [159, 160, 161, 162, 163], "tabsInScope": []}, {"id": "NATIVE_FILTER-TEOLtMjU2", "controlValues": {"enableEmptyFilter": false}, "name": "Date Range", "filterType": "filter_time", "targets": [{}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [159, 160, 161, 162, 163], "tabsInScope": []}]}	f	d981c4c0-cd13-42e1-aff9-23c0074f085c	\N	\N	f	\N
2022-11-25 13:10:43.092672	2022-11-25 13:10:43.092679	16	Experiments Overview	{"CHART-explore-164-1": {"children": [], "id": "CHART-explore-164-1", "meta": {"chartId": 191, "height": 60, "sliceName": "Customers Influenced By Multiple Experiments", "uuid": "b9bfc0a9-87af-474e-a537-5e723baaa536", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "ROW-CUSu1ufur"], "type": "CHART"}, "CHART-explore-165-1": {"children": [], "id": "CHART-explore-165-1", "meta": {"chartId": 192, "height": 50, "sliceName": "No. of Experiments Running Daily Over The Last Month", "uuid": "ac2d8e69-e7a6-4f44-a196-210a84a3a80e", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "ROW-5w4kO5v6S7"], "type": "CHART"}, "CHART-explore-166-1": {"children": [], "id": "CHART-explore-166-1", "meta": {"chartId": 193, "height": 50, "sliceName": "Experiments Run", "uuid": "b1782467-3c4f-429c-94c6-bde4b2dd8e23", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "ROW-5w4kO5v6S7"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["ROW-5w4kO5v6S7", "ROW-CUSu1ufur"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Experiments Overview"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-5w4kO5v6S7": {"children": ["CHART-explore-165-1", "CHART-explore-166-1"], "id": "ROW-5w4kO5v6S7", "meta": {"0": "ROOT_ID", "background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID"], "type": "ROW"}, "ROW-CUSu1ufur": {"children": ["CHART-explore-164-1"], "id": "ROW-CUSu1ufur", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID"], "type": "ROW"}}	35	35		\N	\N	{"show_native_filters": true, "color_scheme": "", "refresh_frequency": 0, "shared_label_colors": {}, "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "native_filter_configuration": [{"id": "NATIVE_FILTER-MSh0YW3Bl", "controlValues": {"enableEmptyFilter": false}, "name": "Start Date", "filterType": "filter_time", "targets": [{}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": [192]}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [164, 166], "tabsInScope": []}]}	f	29904f63-b823-4f89-b7bc-0a5f14110f25	\N	\N	f	\N
2022-11-25 13:10:43.10423	2022-11-25 13:10:43.104237	17	Collections Company View	{"CHART-4RMDAXw49r": {"children": [], "id": "CHART-4RMDAXw49r", "meta": {"chartId": 200, "height": 31, "sliceName": "Number of groups", "uuid": "76c256aa-888b-4b60-8a39-f928dda92ae9", "width": 3}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-wchEKu1zGt"], "type": "CHART"}, "CHART-87TRHGTFwh": {"children": [], "id": "CHART-87TRHGTFwh", "meta": {"chartId": 184, "height": 50, "sliceName": "Collections: Company By Day of Month", "uuid": "262afbcd-079a-4872-83c3-034a3cd58cb6", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-kLszveIEe", "ROW-jHz7hWjDz"], "type": "CHART"}, "CHART-Oj1XHfL6ze": {"children": [], "id": "CHART-Oj1XHfL6ze", "meta": {"chartId": 195, "height": 50, "sliceName": "Collections: Company by Day and Reason", "uuid": "abdb627f-5b72-49ef-9c76-e892512c5ec0", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-QfhgnKQUs", "ROW-NBu1XsMAc"], "type": "CHART"}, "CHART-Ow1La18BGJ": {"children": [], "id": "CHART-Ow1La18BGJ", "meta": {"chartId": 197, "height": 50, "sliceName": "Collections: Accepted Volumes", "uuid": "1addaaec-7cfe-4533-b01c-363f381831cf", "width": 8}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-LMRRR2xMW"], "type": "CHART"}, "CHART-RkRpG6ELqm": {"children": [], "id": "CHART-RkRpG6ELqm", "meta": {"chartId": 194, "height": 50, "sliceName": "Collections: Company by Month and Reason", "uuid": "9a602656-0d6f-46f3-aa35-79e1200e37a3", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-QfhgnKQUs", "ROW-z1ffPBEb0c"], "type": "CHART"}, "CHART-SNe2zMYibq": {"children": [], "id": "CHART-SNe2zMYibq", "meta": {"chartId": 206, "height": 34, "sliceName": "Last Month Transactions", "uuid": "5bf1ce4b-6902-4014-a696-de859238c6bc", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-y8D6rkQLC"], "type": "CHART"}, "CHART-ZFUEvM98Me": {"children": [], "id": "CHART-ZFUEvM98Me", "meta": {"chartId": 205, "height": 31, "sliceName": "First Month Transactions", "uuid": "4e5c72d0-439a-4df9-a840-02706b955e8a", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-y8D6rkQLC"], "type": "CHART"}, "CHART-_A9cDxRN_u": {"children": [], "id": "CHART-_A9cDxRN_u", "meta": {"chartId": 181, "height": 50, "sliceName": "Collections: Company By Day of Week", "uuid": "af2a48f9-97a7-4d5b-af58-bee2cc56cdd1", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-kLszveIEe", "ROW-_fyU7_DVu"], "type": "CHART"}, "CHART-_KmtR-r-dy": {"children": [], "id": "CHART-_KmtR-r-dy", "meta": {"chartId": 198, "height": 50, "sliceName": "Collections: Transaction Volume by Bank", "uuid": "b659c4f7-29b2-41ab-ba77-3f5cec720467", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-lShDXtD4j"], "type": "CHART"}, "CHART-dnY1TyHTik": {"children": [], "id": "CHART-dnY1TyHTik", "meta": {"chartId": 202, "height": 31, "sliceName": "Number of short names", "uuid": "f199b454-7af8-480b-828c-b199bd9d1908", "width": 3}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-wchEKu1zGt"], "type": "CHART"}, "CHART-eNsEc7sTGu": {"children": [], "id": "CHART-eNsEc7sTGu", "meta": {"chartId": 196, "height": 50, "sliceName": "Collections: Transaction Volumes", "uuid": "152ea059-9964-4c1f-90d4-a80fb4a10ba9", "width": 8}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-lShDXtD4j"], "type": "CHART"}, "CHART-explore-207-1": {"children": [], "id": "CHART-explore-207-1", "meta": {"chartId": 207, "height": 50, "sliceName": "Collections: Transaction Volumes by Group", "uuid": "193e330e-307a-4a8b-a4ae-cfd36d698383", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-f7eWd086y"], "type": "CHART"}, "CHART-explore-208-1": {"children": [], "id": "CHART-explore-208-1", "meta": {"chartId": 208, "height": 50, "sliceName": "Collections: Accepted Volumes by Group", "uuid": "ae137048-7d3e-4b40-9919-a30c0c08e666", "width": 6}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-f7eWd086y"], "type": "CHART"}, "CHART-fuulIb6fAy": {"children": [], "id": "CHART-fuulIb6fAy", "meta": {"chartId": 201, "height": 31, "sliceName": "Number of client ids", "uuid": "c4653bd2-5d27-4530-ab84-53ea56e6a664", "width": 3}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-wchEKu1zGt"], "type": "CHART"}, "CHART-gzAlWvxKTe": {"children": [], "id": "CHART-gzAlWvxKTe", "meta": {"chartId": 204, "height": 31, "sliceName": "% of Transactions Successful", "uuid": "0458e755-5f1a-4e10-8200-021b19d4ff70", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-y8D6rkQLC"], "type": "CHART"}, "CHART-hBTGyzRM8-": {"children": [], "id": "CHART-hBTGyzRM8-", "meta": {"chartId": 185, "height": 64, "sliceName": "Collections: Reason Description by Bank", "uuid": "a809c03e-a5fc-4ec1-aae7-32ba62927e03", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-QfhgnKQUs", "ROW-cIPFF7LK27"], "type": "CHART"}, "CHART-jaPfHvlCdb": {"children": [], "id": "CHART-jaPfHvlCdb", "meta": {"chartId": 199, "height": 50, "sliceName": "Collections: Failed Transactions by Status", "uuid": "bb84b6a0-89d6-4bee-ad45-d1c3b425d6f2", "width": 4}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-LMRRR2xMW"], "type": "CHART"}, "CHART-u1v3pjchQj": {"children": [], "id": "CHART-u1v3pjchQj", "meta": {"chartId": 183, "height": 50, "sliceName": "Collections: Company By Month", "uuid": "c3682731-ff40-46b2-86ec-95553807e568", "width": 12}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-kLszveIEe", "ROW-X-eFHg7Oj"], "type": "CHART"}, "CHART-zr-x6ULdEI": {"children": [], "id": "CHART-zr-x6ULdEI", "meta": {"chartId": 203, "height": 31, "sliceName": "Number of nominated accounts", "uuid": "cf124170-dc89-47b4-b84f-501bb674ab84", "width": 3}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg", "ROW-wchEKu1zGt"], "type": "CHART"}, "DASHBOARD_VERSION_KEY": "v2", "GRID_ID": {"children": ["TABS-XaOGbJyKie"], "id": "GRID_ID", "parents": ["ROOT_ID"], "type": "GRID"}, "HEADER_ID": {"id": "HEADER_ID", "meta": {"text": "Collections Company View"}, "type": "HEADER"}, "ROOT_ID": {"children": ["GRID_ID"], "id": "ROOT_ID", "type": "ROOT"}, "ROW-LMRRR2xMW": {"children": ["CHART-Ow1La18BGJ", "CHART-jaPfHvlCdb"], "id": "ROW-LMRRR2xMW", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg"], "type": "ROW"}, "ROW-NBu1XsMAc": {"children": ["CHART-Oj1XHfL6ze"], "id": "ROW-NBu1XsMAc", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-QfhgnKQUs"], "type": "ROW"}, "ROW-X-eFHg7Oj": {"children": ["CHART-u1v3pjchQj"], "id": "ROW-X-eFHg7Oj", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-kLszveIEe"], "type": "ROW"}, "ROW-_fyU7_DVu": {"children": ["CHART-_A9cDxRN_u"], "id": "ROW-_fyU7_DVu", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-kLszveIEe"], "type": "ROW"}, "ROW-cIPFF7LK27": {"children": ["CHART-hBTGyzRM8-"], "id": "ROW-cIPFF7LK27", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-QfhgnKQUs"], "type": "ROW"}, "ROW-f7eWd086y": {"children": ["CHART-explore-207-1", "CHART-explore-208-1"], "id": "ROW-f7eWd086y", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg"], "type": "ROW"}, "ROW-jHz7hWjDz": {"children": ["CHART-87TRHGTFwh"], "id": "ROW-jHz7hWjDz", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-kLszveIEe"], "type": "ROW"}, "ROW-lShDXtD4j": {"children": ["CHART-eNsEc7sTGu", "CHART-_KmtR-r-dy"], "id": "ROW-lShDXtD4j", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg"], "type": "ROW"}, "ROW-wchEKu1zGt": {"children": ["CHART-4RMDAXw49r", "CHART-fuulIb6fAy", "CHART-zr-x6ULdEI", "CHART-dnY1TyHTik"], "id": "ROW-wchEKu1zGt", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg"], "type": "ROW"}, "ROW-y8D6rkQLC": {"children": ["CHART-gzAlWvxKTe", "CHART-ZFUEvM98Me", "CHART-SNe2zMYibq"], "id": "ROW-y8D6rkQLC", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-ujgu2PRTIg"], "type": "ROW"}, "ROW-z1ffPBEb0c": {"children": ["CHART-RkRpG6ELqm"], "id": "ROW-z1ffPBEb0c", "meta": {"background": "BACKGROUND_TRANSPARENT"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie", "TAB-QfhgnKQUs"], "type": "ROW"}, "TAB-QfhgnKQUs": {"children": ["ROW-z1ffPBEb0c", "ROW-NBu1XsMAc", "ROW-cIPFF7LK27"], "id": "TAB-QfhgnKQUs", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Reason drill down"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie"], "type": "TAB"}, "TAB-kLszveIEe": {"children": ["ROW-X-eFHg7Oj", "ROW-jHz7hWjDz", "ROW-_fyU7_DVu"], "id": "TAB-kLszveIEe", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Status drill down"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie"], "type": "TAB"}, "TAB-ujgu2PRTIg": {"children": ["ROW-y8D6rkQLC", "ROW-wchEKu1zGt", "ROW-lShDXtD4j", "ROW-LMRRR2xMW", "ROW-f7eWd086y"], "id": "TAB-ujgu2PRTIg", "meta": {"defaultText": "Tab title", "placeholder": "Tab title", "text": "Overview"}, "parents": ["ROOT_ID", "GRID_ID", "TABS-XaOGbJyKie"], "type": "TAB"}, "TABS-XaOGbJyKie": {"children": ["TAB-ujgu2PRTIg", "TAB-QfhgnKQUs", "TAB-kLszveIEe"], "id": "TABS-XaOGbJyKie", "meta": {}, "parents": ["ROOT_ID", "GRID_ID"], "type": "TABS"}}	35	35		\N	\N	{"show_native_filters": true, "shared_label_colors": {}, "color_scheme": "", "refresh_frequency": 0, "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "default_filters": "{}", "chart_configuration": {}, "native_filter_configuration": [{"id": "NATIVE_FILTER-MFGQkXA2D", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Group", "filterType": "filter_select", "targets": [{"column": {"name": "group_id"}, "datasetId": 39}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [189, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202], "tabsInScope": ["TAB-QfhgnKQUs", "TAB-kLszveIEe", "TAB-ujgu2PRTIg"]}, {"id": "NATIVE_FILTER-fK9KS6OVr", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Client ID", "filterType": "filter_select", "targets": [{"column": {"name": "ht03_clnt_id"}, "datasetId": 39}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": ["NATIVE_FILTER-MFGQkXA2D"], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [189, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202], "tabsInScope": ["TAB-QfhgnKQUs", "TAB-kLszveIEe", "TAB-ujgu2PRTIg"]}, {"id": "NATIVE_FILTER-aUx5fH3M8", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Abbreviated Short Name", "filterType": "filter_select", "targets": [{"column": {"name": "abbreviated_short_name_v_two"}, "datasetId": 39}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": ["NATIVE_FILTER-fK9KS6OVr", "NATIVE_FILTER-MFGQkXA2D"], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [189, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202], "tabsInScope": ["TAB-QfhgnKQUs", "TAB-kLszveIEe", "TAB-ujgu2PRTIg"]}, {"id": "NATIVE_FILTER-giPdRDwhX", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Nominated Account", "filterType": "filter_select", "targets": [{"column": {"name": "ht03_nmntd_ac_m"}, "datasetId": 39}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": ["NATIVE_FILTER-fK9KS6OVr", "NATIVE_FILTER-MFGQkXA2D"], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [189, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202], "tabsInScope": ["TAB-QfhgnKQUs", "TAB-kLszveIEe", "TAB-ujgu2PRTIg"]}, {"id": "NATIVE_FILTER-ZMj9R3s8X", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Month", "filterType": "filter_select", "targets": [{"column": {"name": "ht03_actn_d_month"}, "datasetId": 39}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [189, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202], "tabsInScope": ["TAB-QfhgnKQUs", "TAB-kLszveIEe", "TAB-ujgu2PRTIg"]}, {"id": "NATIVE_FILTER-rT8zXZLgy", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Bank Name", "filterType": "filter_select", "targets": [{"column": {"name": "bank_name"}, "datasetId": 39}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [189, 191, 192, 193, 194], "tabsInScope": ["TAB-QfhgnKQUs", "TAB-kLszveIEe"]}, {"id": "NATIVE_FILTER-iWrntvkrx", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Status", "filterType": "filter_select", "targets": [{"column": {"name": "ht10_sts_desc"}, "datasetId": 39}], "defaultDataMask": {"extraFormData": {"filters": [{"col": "ht10_sts_desc", "op": "IN", "val": ["ACB UNPAID (AUTOMATIC)", "PRODUCT SYSTEM UNPAID (AUTOMATIC)", "REJECTED DUE TO VALIDATION FAILURE", "PRODUCT SYSTEM UNPAID (MANUAL)"]}]}, "filterState": {"validateMessage": false, "validateStatus": false, "label": "ACB UNPAID (AUTOMATIC), PRODUCT SYSTEM UNPAID (AUTOMATIC), REJECTED DUE TO VALIDATION FAILURE, PRODUCT SYSTEM UNPAID (MANUAL)", "value": ["ACB UNPAID (AUTOMATIC)", "PRODUCT SYSTEM UNPAID (AUTOMATIC)", "REJECTED DUE TO VALIDATION FAILURE", "PRODUCT SYSTEM UNPAID (MANUAL)"]}, "__cache": {"validateMessage": false, "validateStatus": false, "label": "ACB UNPAID (AUTOMATIC), PRODUCT SYSTEM UNPAID (AUTOMATIC), REJECTED DUE TO VALIDATION FAILURE, PRODUCT SYSTEM UNPAID (MANUAL)", "value": ["ACB UNPAID (AUTOMATIC)", "PRODUCT SYSTEM UNPAID (AUTOMATIC)", "REJECTED DUE TO VALIDATION FAILURE", "PRODUCT SYSTEM UNPAID (MANUAL)"]}}, "cascadeParentIds": [], "scope": {"rootPath": ["TAB-kLszveIEe"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [189, 191, 192], "tabsInScope": ["TAB-kLszveIEe"]}, {"id": "NATIVE_FILTER-nuHbnbkjc", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "Reason Description", "filterType": "filter_select", "targets": [{"column": {"name": "ht03_rsn_desc_text"}, "datasetId": 45}], "defaultDataMask": {"extraFormData": {"filters": [{"col": "ht03_rsn_desc_text", "op": "IN", "val": ["ACCOUNT CLOSED", "ACCOUNT EFFECTS NOT CLEARED", "ACCOUNT FROZEN", "ACCOUNT HOLDER DECEASED", "AUTHORISATION CANCELLED", "CHARGES ACC INVALID FOR CLIENT", "COURT ORDER RECEIVED (C/O)", "DEBIT IN CONTRAVENTION OF PAYE", "DEBITS NOT ALLOWED TO THIS ACC", "INSOLVENT", "ITEM DR LIMIT(CLNT) EXCEEDED", "NO AUTHORITY TO DEBIT", "NO DEST. BRANCH CODE", "NO DESTINATION ACCT", "NO DESTINATION ACCT NAME", "NO SUCH ACCOUNT", "NOT PROVIDED FOR", "PAYMENT STOPPED", "PREVIOUSLY STOPPED VIA STOP PA"]}]}, "filterState": {"validateMessage": false, "validateStatus": false, "label": "ACCOUNT CLOSED, ACCOUNT EFFECTS NOT CLEARED, ACCOUNT FROZEN, ACCOUNT HOLDER DECEASED, AUTHORISATION CANCELLED, CHARGES ACC INVALID FOR CLIENT, COURT ORDER RECEIVED (C/O), DEBIT IN CONTRAVENTION OF PAYE, DEBITS NOT ALLOWED TO THIS ACC, INSOLVENT, ITEM DR LIMIT(CLNT) EXCEEDED, NO AUTHORITY TO DEBIT, NO DEST. BRANCH CODE, NO DESTINATION ACCT, NO DESTINATION ACCT NAME, NO SUCH ACCOUNT, NOT PROVIDED FOR, PAYMENT STOPPED, PREVIOUSLY STOPPED VIA STOP PA", "value": ["ACCOUNT CLOSED", "ACCOUNT EFFECTS NOT CLEARED", "ACCOUNT FROZEN", "ACCOUNT HOLDER DECEASED", "AUTHORISATION CANCELLED", "CHARGES ACC INVALID FOR CLIENT", "COURT ORDER RECEIVED (C/O)", "DEBIT IN CONTRAVENTION OF PAYE", "DEBITS NOT ALLOWED TO THIS ACC", "INSOLVENT", "ITEM DR LIMIT(CLNT) EXCEEDED", "NO AUTHORITY TO DEBIT", "NO DEST. BRANCH CODE", "NO DESTINATION ACCT", "NO DESTINATION ACCT NAME", "NO SUCH ACCOUNT", "NOT PROVIDED FOR", "PAYMENT STOPPED", "PREVIOUSLY STOPPED VIA STOP PA"]}, "__cache": {"validateMessage": false, "validateStatus": false, "label": "ACCOUNT CLOSED, ACCOUNT EFFECTS NOT CLEARED, ACCOUNT FROZEN, ACCOUNT HOLDER DECEASED, AUTHORISATION CANCELLED, CHARGES ACC INVALID FOR CLIENT, COURT ORDER RECEIVED (C/O), DEBIT IN CONTRAVENTION OF PAYE, DEBITS NOT ALLOWED TO THIS ACC, INSOLVENT, ITEM DR LIMIT(CLNT) EXCEEDED, NO AUTHORITY TO DEBIT, NO DEST. BRANCH CODE, NO DESTINATION ACCT, NO DESTINATION ACCT NAME, NO SUCH ACCOUNT, NOT PROVIDED FOR, PAYMENT STOPPED, PREVIOUSLY STOPPED VIA STOP PA", "value": ["ACCOUNT CLOSED", "ACCOUNT EFFECTS NOT CLEARED", "ACCOUNT FROZEN", "ACCOUNT HOLDER DECEASED", "AUTHORISATION CANCELLED", "CHARGES ACC INVALID FOR CLIENT", "COURT ORDER RECEIVED (C/O)", "DEBIT IN CONTRAVENTION OF PAYE", "DEBITS NOT ALLOWED TO THIS ACC", "INSOLVENT", "ITEM DR LIMIT(CLNT) EXCEEDED", "NO AUTHORITY TO DEBIT", "NO DEST. BRANCH CODE", "NO DESTINATION ACCT", "NO DESTINATION ACCT NAME", "NO SUCH ACCOUNT", "NOT PROVIDED FOR", "PAYMENT STOPPED", "PREVIOUSLY STOPPED VIA STOP PA"]}}, "cascadeParentIds": [], "scope": {"rootPath": ["TAB-QfhgnKQUs"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [193, 194], "tabsInScope": ["TAB-QfhgnKQUs"]}]}	f	4dee6330-e210-416a-b28c-7c57290e3233	\N	\N	f	\N
\.


--
-- Data for Name: datasources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.datasources (created_on, changed_on, id, datasource_name, is_featured, is_hidden, description, default_endpoint, created_by_fk, changed_by_fk, "offset", cache_timeout, perm, filter_select_enabled, params, fetch_values_from, schema_perm, cluster_id, uuid, is_managed_externally, external_url) FROM stdin;
\.


--
-- Data for Name: dbs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dbs (created_on, changed_on, id, database_name, sqlalchemy_uri, created_by_fk, changed_by_fk, password, cache_timeout, extra, select_as_create_table_as, allow_ctas, expose_in_sqllab, force_ctas_schema, allow_run_async, allow_dml, verbose_name, impersonate_user, allow_file_upload, encrypted_extra, server_cert, allow_cvas, uuid, configuration_method, is_managed_externally, external_url) FROM stdin;
2022-11-25 13:08:38.937797	2022-11-25 13:08:38.937804	2	ecosystem_server	presto://ecosystem-worker-presto:8084/local	35	35	\N	0	{"allows_virtual_table_explore": true, "cost_estimate_enabled": true, "cancel_query_on_windows_unload": true, "metadata_params": {}, "engine_params": {}, "schemas_allowed_for_file_upload": []}	f	f	t	\N	t	f	\N	f	t	\N	\N	f	4f508832-3a47-493e-ab0f-bb2da77bed92	sqlalchemy_form	f	\N
\.


--
-- Data for Name: druiddatasource_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.druiddatasource_user (id, user_id, datasource_id) FROM stdin;
\.


--
-- Data for Name: dynamic_plugin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dynamic_plugin (created_on, changed_on, id, name, key, bundle_url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: embedded_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.embedded_dashboards (created_on, changed_on, allow_domain_list, uuid, dashboard_id, changed_by_fk, created_by_fk) FROM stdin;
\.


--
-- Data for Name: favstar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favstar (id, user_id, class_name, obj_id, dttm) FROM stdin;
\.


--
-- Data for Name: filter_sets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter_sets (created_on, changed_on, id, name, description, json_metadata, owner_id, owner_type, dashboard_id, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: key_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.key_value (id, resource, value, uuid, created_on, created_by_fk, changed_on, changed_by_fk, expires_on) FROM stdin;
1	superset_metastore_cache	\\x8004953b030000000000007d94288c056f776e6572944b018c0576616c756594581e0300007b224e41544956455f46494c5445522d686a4c343353677067223a7b226964223a224e41544956455f46494c5445522d686a4c343353677067222c226578747261466f726d44617461223a7b7d2c2266696c7465725374617465223a7b7d2c226f776e5374617465223a7b7d7d2c224e41544956455f46494c5445522d4f2d5279495766506c223a7b226964223a224e41544956455f46494c5445522d4f2d5279495766506c222c226578747261466f726d44617461223a7b7d2c2266696c7465725374617465223a7b7d2c226f776e5374617465223a7b7d7d2c224e41544956455f46494c5445522d476b65303945534763223a7b226964223a224e41544956455f46494c5445522d476b65303945534763222c226578747261466f726d44617461223a7b7d2c2266696c7465725374617465223a7b7d2c226f776e5374617465223a7b7d7d2c224e41544956455f46494c5445522d5854327a4559695052223a7b226964223a224e41544956455f46494c5445522d5854327a4559695052222c226578747261466f726d44617461223a7b2266696c74657273223a5b7b22636f6c223a226d65747269635f6e616d65222c226f70223a22494e222c2276616c223a5b226e6f5f66696c746572225d7d5d7d2c2266696c7465725374617465223a7b2276616c69646174654d657373616765223a66616c73652c2276616c6964617465537461747573223a66616c73652c226c6162656c223a226e6f5f66696c746572222c2276616c7565223a5b226e6f5f66696c746572225d7d2c226f776e5374617465223a7b7d2c225f5f6361636865223a7b2276616c69646174654d657373616765223a66616c73652c2276616c6964617465537461747573223a66616c73652c226c6162656c223a226e6f5f66696c746572222c2276616c7565223a5b226e6f5f66696c746572225d7d7d2c224e41544956455f46494c5445522d54454f4c744d6a5532223a7b226964223a224e41544956455f46494c5445522d54454f4c744d6a5532222c226578747261466f726d44617461223a7b7d2c2266696c7465725374617465223a7b7d2c226f776e5374617465223a7b7d7d7d94752e	e553bf75-f570-35a2-a126-a4d97e034510	2022-11-24 14:27:05.591325	1	\N	\N	2023-02-22 14:27:05.573624
2	superset_metastore_cache	\\x80049544000000000000008c404c6e766e55685a556367626b317a65546b6f506c7741636d614535383474637a5a616934645a6839424855796b63767a6b4c78794448364b3544765a506d7a38942e	dd78ab37-770b-38c2-a9ac-1c09865ae0ce	2022-11-24 14:27:05.621507	1	\N	\N	2023-02-22 14:27:05.620042
\.


--
-- Data for Name: keyvalue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keyvalue (id, value) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id, action, user_id, json, dttm, dashboard_id, slice_id, duration_ms, referrer) FROM stdin;
1	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:54:00.824066	\N	0	254	\N
2	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:54:02.714583	\N	0	80	http://127.0.0.1:8080/superset/welcome/
3	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:54:19.596828	\N	0	82	http://127.0.0.1:8080/superset/welcome/
4	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:54:21.452904	\N	0	72	http://127.0.0.1:8080/superset/welcome/
5	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:55:00.49781	\N	0	87	http://127.0.0.1:8080/superset/welcome/
6	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:55:02.403383	\N	0	77	http://127.0.0.1:8080/superset/welcome/
7	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:57:20.213537	\N	0	1626	\N
8	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-24 13:57:21.283899	\N	0	225	http://127.0.0.1:8080/superset/welcome/
9	recent_activity	1	{"path": "/superset/recent_activity/1/", "limit": "6", "url_rule": "/superset/recent_activity/<int:user_id>/", "object_ref": "Superset.recent_activity", "user_id": 1}	2022-11-24 13:57:21.536254	\N	0	38	http://127.0.0.1:8080/superset/welcome/
10	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-24 13:57:21.598239	\N	0	131	http://127.0.0.1:8080/superset/welcome/
11	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:57:21.846364	\N	0	289	http://127.0.0.1:8080/superset/welcome/
12	SavedQueryRestApi.get_list	1	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:57:21.849951	\N	0	286	http://127.0.0.1:8080/superset/welcome/
13	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:57:22.083259	\N	0	279	http://127.0.0.1:8080/superset/welcome/
14	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:57:22.134088	\N	0	511	http://127.0.0.1:8080/superset/welcome/
15	log	1	{"impression_id": "8qAdJVBlJ", "version": "v2", "ts": 1669298240956, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "57m0RDZLZb", "visibility": "visible"}	2022-11-24 13:57:22.137848	\N	0	0	http://127.0.0.1:8080/superset/welcome/
16	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:57:22.40134	\N	0	547	http://127.0.0.1:8080/superset/welcome/
17	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 13:57:22.532354	\N	0	15	http://127.0.0.1:8080/superset/welcome/
18	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 13:57:22.540568	\N	0	29	http://127.0.0.1:8080/superset/welcome/
34	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:58:52.534242	\N	0	1719	\N
35	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-24 13:58:53.710703	\N	0	288	http://127.0.0.1:8080/superset/welcome/
36	recent_activity	1	{"path": "/superset/recent_activity/1/", "limit": "6", "url_rule": "/superset/recent_activity/<int:user_id>/", "object_ref": "Superset.recent_activity", "user_id": 1}	2022-11-24 13:58:53.944202	\N	0	63	http://127.0.0.1:8080/superset/welcome/
37	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-24 13:58:54.176972	\N	0	208	http://127.0.0.1:8080/superset/welcome/
38	SavedQueryRestApi.get_list	1	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:58:54.277209	\N	0	333	http://127.0.0.1:8080/superset/welcome/
39	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:58:54.398475	\N	0	417	http://127.0.0.1:8080/superset/welcome/
40	log	1	{"impression_id": "mzsCOnxQg", "version": "v2", "ts": 1669298333296, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "I9QqVwIn06", "visibility": "visible"}	2022-11-24 13:58:54.552745	\N	0	0	http://127.0.0.1:8080/superset/welcome/
41	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:58:54.664147	\N	0	702	http://127.0.0.1:8080/superset/welcome/
42	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:58:54.865547	\N	0	580	http://127.0.0.1:8080/superset/welcome/
124	DatasetRestApi.bulk_delete	35	{"path": "/api/v1/dataset/", "q": "!(7,6,5,4,3,2,1)", "object_ref": "DatasetRestApi.bulk_delete", "rison": [7, 6, 5, 4, 3, 2, 1]}	2022-11-25 13:01:47.277726	\N	0	246	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
129	log	35	{"impression_id": "lwxeTeYnn", "version": "v2", "ts": 1669381309061, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "-Czz-rWXc", "visibility": "visible"}	2022-11-25 13:01:50.083485	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
48	DatabaseRestApi.get_list	\N	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-24 13:59:04.478799	\N	0	203	http://127.0.0.1:8080/superset/welcome/
53	DashboardRestApi.get_list	\N	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:59:04.935422	\N	0	144	http://127.0.0.1:8080/superset/welcome/
61	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 14:24:56.465259	\N	0	100	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
65	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-24 14:25:18.527078	\N	0	88	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
69	log	1	{"impression_id": "J5-2eOfIt", "version": "v2", "ts": 1669299967804, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "QYRmXTVZu", "visibility": "visible"}	2022-11-24 14:26:08.842377	\N	0	0	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
132	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:04:42.826524	\N	0	70	http://127.0.0.1:8080/chart/list/
137	log	35	{"impression_id": "R5QmS_MAp", "version": "v2", "ts": 1669381482669, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "oPG43dqFY", "visibility": "visible"}	2022-11-25 13:04:43.962035	\N	0	0	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
141	DatasetRestApi.get_list	35	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:05:07.126152	\N	0	48	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
146	log	35	{"impression_id": "R5QmS_MAp", "version": "v2", "ts": 1669381506972, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "qqjvabbQH", "visibility": "visible"}	2022-11-25 13:05:09.68623	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
147	log	35	{"impression_id": "R5QmS_MAp", "version": "v2", "ts": 1669381507843, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "GC1I2X_jj", "visibility": "visible"}	2022-11-25 13:05:09.686241	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
148	log	35	{"impression_id": "R5QmS_MAp", "version": "v2", "ts": 1669381508661, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "TKRzG7SkN", "visibility": "visible"}	2022-11-25 13:05:09.686245	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
154	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:05:44.170562	\N	0	54	http://127.0.0.1:8080/tablemodelview/list/
160	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:05:47.94429	\N	0	91	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
164	DatabaseRestApi.delete	35	{"path": "/api/v1/database/1", "url_rule": "/api/v1/database/<int:pk>", "object_ref": "DatabaseRestApi.delete", "pk": 1}	2022-11-25 13:05:57.293276	\N	0	183	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
221	welcome	35	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 13:07:48.752876	\N	0	239	http://127.0.0.1:8080/login/
149	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:05:20.739718	\N	0	57	http://127.0.0.1:8080/dashboard/list/
226	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:50.018656	\N	0	313	http://127.0.0.1:8080/superset/welcome/
232	log	35	{"impression_id": "V_vAPX9hU", "version": "v2", "ts": 1669381669455, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "DpmQ0cj8XY", "visibility": "visible"}	2022-11-25 13:07:50.474453	\N	0	0	http://127.0.0.1:8080/superset/welcome/
236	ChartRestApi.info	35	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:08:11.405918	\N	0	33	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
43	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:58:54.933224	\N	0	637	http://127.0.0.1:8080/superset/welcome/
125	DatasetRestApi.get_list	35	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:01:47.406222	\N	0	49	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
133	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:04:42.834483	\N	0	93	http://127.0.0.1:8080/chart/list/
142	ChartRestApi.info	35	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:05:07.956582	\N	0	43	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
155	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:05:44.178839	\N	0	85	http://127.0.0.1:8080/tablemodelview/list/
150	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:05:20.767098	\N	0	82	http://127.0.0.1:8080/dashboard/list/
159	DatabaseRestApi.info	35	{"path": "/api/v1/database/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:05:47.942628	\N	0	25	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
222	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:07:49.767809	\N	0	178	http://127.0.0.1:8080/superset/welcome/
168	CssTemplateRestApi.info	35	{"path": "/api/v1/css_template/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:06:11.066352	\N	0	23	http://127.0.0.1:8080/csstemplatemodelview/list/?pageIndex=0&sortColumn=template_name&sortOrder=desc
173	log	35	{"impression_id": "Yick80muD", "version": "v2", "ts": 1669381575896, "event_name": "spa_navigation", "path": "/annotationlayer/list/", "event_type": "user", "event_id": "4xbf2nx3j", "visibility": "visible"}	2022-11-25 13:06:16.915234	\N	0	0	http://127.0.0.1:8080/annotationlayer/list/?pageIndex=0&sortColumn=name&sortOrder=desc
178	log	35	{"impression_id": "Yick80muD", "version": "v2", "ts": 1669381579049, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "v4hNKu3aT", "visibility": "visible"}	2022-11-25 13:06:21.135424	\N	0	0	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
179	log	35	{"impression_id": "Yick80muD", "version": "v2", "ts": 1669381580077, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "hJRVUlrrX", "visibility": "visible"}	2022-11-25 13:06:21.135432	\N	0	0	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
185	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:06:25.808695	\N	0	74	http://127.0.0.1:8080/superset/sqllab/
188	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:06:29.302771	\N	0	82	http://127.0.0.1:8080/savedqueryview/list/
193	log	35	{"impression_id": "urwT517Pb", "version": "v2", "ts": 1669381591579, "event_name": "spa_navigation", "path": "/superset/sqllab/history/", "event_type": "user", "event_id": "YZgMYdOPq", "visibility": "visible"}	2022-11-25 13:06:32.60326	\N	0	0	http://127.0.0.1:8080/superset/sqllab/history/?pageIndex=0&sortColumn=start_time&sortOrder=desc
199	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:06:49.467142	\N	0	302	http://127.0.0.1:8080/superset/welcome/
203	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:06:49.707456	\N	0	151	http://127.0.0.1:8080/superset/welcome/
206	log	1	{"impression_id": "Pl7SAovKT", "version": "v2", "ts": 1669381608981, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "9HJBGxk5N4", "visibility": "visible"}	2022-11-25 13:06:50.02783	\N	0	0	http://127.0.0.1:8080/superset/welcome/
227	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:50.110774	\N	0	127	http://127.0.0.1:8080/superset/welcome/
233	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:07:52.885357	\N	0	57	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
212	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:18.843354	\N	0	237	http://127.0.0.1:8080/superset/welcome/
217	ChartRestApi.info	35	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:07:19.258347	\N	0	14	http://127.0.0.1:8080/superset/welcome/
44	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 13:58:55.09061	\N	0	19	http://127.0.0.1:8080/superset/welcome/
126	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:01:49.225121	\N	0	38	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
130	DashboardRestApi.bulk_delete	35	{"path": "/api/v1/dashboard/", "q": "!(3,2,1)", "object_ref": "DashboardRestApi.bulk_delete", "rison": [3, 2, 1]}	2022-11-25 13:02:00.071851	\N	0	242	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
49	recent_activity	\N	{"path": "/superset/recent_activity/2/", "limit": "6", "url_rule": "/superset/recent_activity/<int:user_id>/", "object_ref": "Superset.recent_activity", "user_id": 2}	2022-11-24 13:59:04.602988	\N	0	297	http://127.0.0.1:8080/superset/welcome/
54	ChartRestApi.get_list	\N	{"path": "/api/v1/chart/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:59:04.99811	\N	0	180	http://127.0.0.1:8080/superset/welcome/
63	log	1	{"impression_id": "J5-2eOfIt", "version": "v2", "ts": 1669299895827, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "-593zt90oh", "visibility": "visible"}	2022-11-24 14:24:56.866949	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
71	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-24 14:26:11.013865	\N	0	143	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
134	ChartRestApi.info	35	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:04:43.121477	\N	0	36	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
138	ChartRestApi.bulk_delete	35	{"path": "/api/v1/chart/", "q": "!(23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1)", "object_ref": "ChartRestApi.bulk_delete", "rison": [23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]}	2022-11-25 13:05:01.711301	\N	0	334	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
143	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:05:08.039481	\N	0	119	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
156	DatasetRestApi.info	35	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:05:44.345555	\N	0	77	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
161	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:05:48.010872	\N	0	77	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
165	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:05:57.395951	\N	0	26	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
223	recent_activity	35	{"path": "/superset/recent_activity/35/", "limit": "6", "url_rule": "/superset/recent_activity/<int:user_id>/", "object_ref": "Superset.recent_activity", "user_id": 35}	2022-11-25 13:07:49.786755	\N	0	196	http://127.0.0.1:8080/superset/welcome/
167	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:06:10.937089	\N	0	121	http://127.0.0.1:8080/csstemplatemodelview/list/
171	AnnotationRestApi.info	35	{"path": "/api/v1/annotation_layer/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:06:16.150447	\N	0	27	http://127.0.0.1:8080/annotationlayer/list/?pageIndex=0&sortColumn=name&sortOrder=desc
177	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:06:20.280572	\N	0	60	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
183	sqllab	35	{"path": "/superset/sqllab/", "object_ref": "Superset.sqllab"}	2022-11-25 13:06:25.085238	\N	0	290	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
186	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:ct,value:''),(col:expose_in_sqllab,opr:eq,value:!t)),order_columns:database_name,order_direction:asc,page:0,page_size:100)", "rison": {"filters": [{"col": "database_name", "opr": "ct", "value": ""}, {"col": "expose_in_sqllab", "opr": "eq", "value": true}], "order_columns": "database_name", "order_direction": "asc", "page": 0, "page_size": 100}}	2022-11-25 13:06:26.53121	\N	0	123	http://127.0.0.1:8080/superset/sqllab/
207	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 13:07:10.923009	\N	0	0	http://127.0.0.1:8080/users/list/
211	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:07:18.825995	\N	0	302	http://127.0.0.1:8080/superset/welcome/
218	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:07:19.268312	\N	0	20	http://127.0.0.1:8080/superset/welcome/
45	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 13:58:55.103812	\N	0	38	http://127.0.0.1:8080/superset/welcome/
127	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:01:49.246866	\N	0	71	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
131	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:02:00.188634	\N	0	30	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
52	ChartRestApi.get_list	\N	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:59:04.752813	\N	0	309	http://127.0.0.1:8080/superset/welcome/
58	log	\N	{"impression_id": "xkMUsS_n9", "version": "v2", "ts": 1669298344195, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "qIERfy0tHZ", "visibility": "visible"}	2022-11-24 13:59:05.216559	\N	0	0	http://127.0.0.1:8080/superset/welcome/
62	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-24 14:24:56.558428	\N	0	226	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
66	DashboardRestApi.favorite_status	1	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [1]}	2022-11-24 14:25:18.802684	\N	0	21	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
70	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 14:26:10.943347	\N	0	79	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
135	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:04:43.374826	\N	0	316	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
139	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:05:02.092262	\N	0	61	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
144	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:05:08.80665	\N	0	54	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
157	DatasetRestApi.get_list	35	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:05:44.387868	\N	0	113	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
162	log	35	{"impression_id": "6xPb9OyeJ", "version": "v2", "ts": 1669381547724, "event_name": "spa_navigation", "path": "/databaseview/list/", "event_type": "user", "event_id": "MA1NmcMVP", "visibility": "visible"}	2022-11-25 13:05:48.775619	\N	0	0	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
224	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:07:49.862099	\N	0	312	http://127.0.0.1:8080/superset/welcome/
231	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:07:50.32001	\N	0	30	http://127.0.0.1:8080/superset/welcome/
152	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:05:20.997695	\N	0	64	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
166	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:06:10.929486	\N	0	111	http://127.0.0.1:8080/csstemplatemodelview/list/
172	AnnotationLayerRestApi.get_list	35	{"path": "/api/v1/annotation_layer/", "q": "(order_column:name,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "name", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:06:16.236487	\N	0	138	http://127.0.0.1:8080/annotationlayer/list/?pageIndex=0&sortColumn=name&sortOrder=desc
176	ChartRestApi.info	35	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:06:20.256375	\N	0	19	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
208	welcome	35	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 13:07:17.710374	\N	0	224	http://127.0.0.1:8080/login/
209	recent_activity	35	{"path": "/superset/recent_activity/35/", "limit": "6", "url_rule": "/superset/recent_activity/<int:user_id>/", "object_ref": "Superset.recent_activity", "user_id": 35}	2022-11-25 13:07:18.706646	\N	0	142	http://127.0.0.1:8080/superset/welcome/
215	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:19.080261	\N	0	189	http://127.0.0.1:8080/superset/welcome/
46	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:58:57.121627	\N	0	0	http://127.0.0.1:8080/superset/welcome/
128	DashboardRestApi.favorite_status	35	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3,2,1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3, 2, 1]}	2022-11-25 13:01:49.396651	\N	0	6	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
136	ChartRestApi.favorite_status	35	{"path": "/api/v1/chart/favorite_status/", "q": "!(23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1)", "object_ref": "ChartRestApi.favorite_status", "rison": [23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]}	2022-11-25 13:04:43.957888	\N	0	41	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
51	DatabaseRestApi.get_list	\N	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-24 13:59:04.723223	\N	0	413	http://127.0.0.1:8080/superset/welcome/
57	DashboardRestApi.info	\N	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 13:59:05.19285	\N	0	19	http://127.0.0.1:8080/superset/welcome/
60	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-24 14:24:56.012268	\N	0	107	http://127.0.0.1:8080/dashboard/list/
64	DashboardRestApi.import_	1	{"path": "/api/v1/dashboard/import/", "passwords": "{}", "object_ref": "DashboardRestApi.import_"}	2022-11-24 14:25:18.229258	\N	0	11081	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
67	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 14:26:08.048104	\N	0	48	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
72	DashboardRestApi.favorite_status	1	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [1]}	2022-11-24 14:26:11.418663	\N	0	11	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
140	DatasetRestApi.info	35	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:05:07.100777	\N	0	30	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
145	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:05:08.810918	\N	0	56	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
158	log	35	{"impression_id": "6xPb9OyeJ", "version": "v2", "ts": 1669381544038, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "CT6kKfMKdh", "visibility": "visible"}	2022-11-25 13:05:45.096341	\N	0	0	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
163	DatabaseRestApi.related_objects	35	{"path": "/api/v1/database/1/related_objects/", "url_rule": "/api/v1/database/<int:pk>/related_objects/", "object_ref": "DatabaseRestApi.related_objects", "pk": 1}	2022-11-25 13:05:53.64254	\N	0	46	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
225	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:49.914868	\N	0	248	http://127.0.0.1:8080/superset/welcome/
230	ChartRestApi.info	35	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:07:50.315992	\N	0	14	http://127.0.0.1:8080/superset/welcome/
153	log	35	{"impression_id": "dU_03F5f2", "version": "v2", "ts": 1669381520628, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "YBlrgNNxGi", "visibility": "visible"}	2022-11-25 13:05:21.655419	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
235	log	35	{"impression_id": "V_vAPX9hU", "version": "v2", "ts": 1669381672654, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "4TmT5Vt4t", "visibility": "visible"}	2022-11-25 13:07:53.674453	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
240	DatasetRestApi.get_list	35	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:08:12.586766	\N	0	41	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
245	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:08:18.040863	\N	0	87	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
254	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:20:22.735813	\N	0	145	http://127.0.0.1:8080/tablemodelview/list/
258	DatabaseRestApi.info	35	{"path": "/api/v1/database/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:20:32.447928	\N	0	45	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
263	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:20:38.02154	\N	0	193	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
268	DashboardRestApi.favorite_status	35	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(17,16,15,14,13,12,11,10,9,8,7,6,5,4)", "object_ref": "DashboardRestApi.favorite_status", "rison": [17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4]}	2022-11-25 13:20:40.110059	\N	0	6	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
228	SavedQueryRestApi.get_list	35	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:50.164877	\N	0	91	http://127.0.0.1:8080/superset/welcome/
234	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:07:52.88941	\N	0	56	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
239	DatasetRestApi.info	35	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:08:12.575637	\N	0	37	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
47	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-24 13:59:03.462002	\N	0	228	http://127.0.0.1:8080/login/
50	SavedQueryRestApi.get_list	\N	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:59:04.669682	\N	0	314	http://127.0.0.1:8080/superset/welcome/
55	DashboardRestApi.get_list	\N	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'2')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "2"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-24 13:59:05.044529	\N	0	119	http://127.0.0.1:8080/superset/welcome/
56	ChartRestApi.info	\N	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 13:59:05.129063	\N	0	14	http://127.0.0.1:8080/superset/welcome/
59	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-24 14:24:56.010218	\N	0	108	http://127.0.0.1:8080/dashboard/list/
68	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-24 14:26:08.219067	\N	0	196	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
73	log	1	{"impression_id": "J5-2eOfIt", "version": "v2", "ts": 1669299970773, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "PmRWb396u", "visibility": "visible"}	2022-11-24 14:26:11.795534	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
74	DashboardRestApi.import_	1	{"path": "/api/v1/dashboard/import/", "passwords": "{}", "object_ref": "DashboardRestApi.import_"}	2022-11-24 14:26:38.693193	\N	0	6301	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
75	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-24 14:26:39.037062	\N	0	95	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
76	DashboardRestApi.favorite_status	1	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(2,1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [2, 1]}	2022-11-24 14:26:39.19479	\N	0	11	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
77	DashboardRestApi.import_	1	{"path": "/api/v1/dashboard/import/", "passwords": "{}", "object_ref": "DashboardRestApi.import_"}	2022-11-24 14:26:54.950784	\N	0	6438	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
78	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-24 14:26:55.37123	\N	0	115	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
79	DashboardRestApi.favorite_status	1	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(3,2,1)", "object_ref": "DashboardRestApi.favorite_status", "rison": [3, 2, 1]}	2022-11-24 14:26:55.67006	\N	0	8	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
80	DashboardRestApi.get_charts	1	{"path": "/api/v1/dashboard/3/charts", "url_rule": "/api/v1/dashboard/<id_or_slug>/charts", "object_ref": "DashboardRestApi.get_charts", "id_or_slug": "3"}	2022-11-24 14:27:04.284562	\N	0	50	http://127.0.0.1:8080/superset/dashboard/3/
81	DashboardRestApi.get	1	{"path": "/api/v1/dashboard/3", "url_rule": "/api/v1/dashboard/<id_or_slug>", "object_ref": "DashboardRestApi.get", "dashboard_id": 3}	2022-11-24 14:27:04.286319	3	0	62	http://127.0.0.1:8080/superset/dashboard/3/
82	DashboardRestApi.get_datasets	1	{"path": "/api/v1/dashboard/3/datasets", "url_rule": "/api/v1/dashboard/<id_or_slug>/datasets", "object_ref": "DashboardRestApi.get_datasets", "id_or_slug": "3"}	2022-11-24 14:27:04.370957	\N	0	135	http://127.0.0.1:8080/superset/dashboard/3/
83	count	1	{"path": "/superset/favstar/Dashboard/3/count/", "url_rule": "/superset/favstar/<class_name>/<int:obj_id>/<action>/", "object_ref": "Superset.favstar", "class_name": "Dashboard", "obj_id": 3}	2022-11-24 14:27:04.928042	\N	0	6	http://127.0.0.1:8080/superset/dashboard/3/
84	DashboardFilterStateRestApi.post	1	{"path": "/api/v1/dashboard/3/filter_state", "tab_id": "1", "url_rule": "/api/v1/dashboard/<int:pk>/filter_state", "object_ref": "DashboardFilterStateRestApi.post", "pk": 3}	2022-11-24 14:27:05.632716	\N	0	90	http://127.0.0.1:8080/superset/dashboard/3/
85	log	1	{"impression_id": "J5-2eOfIt", "version": "v2", "ts": 1669300023943, "event_name": "spa_navigation", "path": "/superset/dashboard/3/", "event_type": "user", "event_id": "rgPuvA-R4", "visibility": "visible"}	2022-11-24 14:27:05.863081	\N	0	0	http://127.0.0.1:8080/superset/dashboard/3/?native_filters_key=LnvnUhZUcgbk1zeTkoPlwAcmaE584tczZai4dZh9BHUykcvzkLxyDH6K5DvZPmz8
86	log	1	{"source": "dashboard", "source_id": 3, "impression_id": "J5-2eOfIt", "version": "v2", "ts": 1669300024813, "event_name": "mount_dashboard", "is_soft_navigation": true, "is_edit_mode": false, "mount_duration": 869, "is_empty": false, "is_published": false, "bootstrap_data_length": 87823, "event_type": "user", "event_id": "lCf7cE_5h", "visibility": "visible"}	2022-11-24 14:27:05.86313	\N	0	0	http://127.0.0.1:8080/superset/dashboard/3/?native_filters_key=LnvnUhZUcgbk1zeTkoPlwAcmaE584tczZai4dZh9BHUykcvzkLxyDH6K5DvZPmz8
92	DatasetRestApi.get_list	1	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-24 14:27:17.255174	\N	0	145	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
98	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 12:59:17.270366	\N	0	407	http://127.0.0.1:8080/superset/welcome/
103	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 12:59:17.797935	\N	0	84	http://127.0.0.1:8080/superset/welcome/
106	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 13:00:44.798785	\N	0	0	http://127.0.0.1:8080/users/list/
111	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:00:52.512163	\N	0	279	http://127.0.0.1:8080/superset/welcome/
116	ChartRestApi.info	35	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:00:52.995633	\N	0	24	http://127.0.0.1:8080/superset/welcome/
229	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:50.168375	\N	0	115	http://127.0.0.1:8080/superset/welcome/
119	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:01:28.088471	\N	0	68	http://127.0.0.1:8080/tablemodelview/list/
87	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2022-11-24 14:27:08.452031	\N	0	3436	http://127.0.0.1:8080/superset/dashboard/3/
91	DatasetRestApi.info	1	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-24 14:27:17.152235	\N	0	39	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
94	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 12:59:15.755989	\N	0	535	\N
96	SavedQueryRestApi.get_list	1	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 12:59:17.15909	\N	0	254	http://127.0.0.1:8080/superset/welcome/
101	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 12:59:17.554943	\N	0	127	http://127.0.0.1:8080/superset/welcome/
109	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:00:52.439069	\N	0	259	http://127.0.0.1:8080/superset/welcome/
115	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:00:52.792216	\N	0	118	http://127.0.0.1:8080/superset/welcome/
237	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:08:11.485828	\N	0	123	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
242	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:08:13.527209	\N	0	51	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
247	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:08:18.278254	\N	0	119	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
253	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:20:22.726793	\N	0	137	http://127.0.0.1:8080/tablemodelview/list/
259	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:20:32.476933	\N	0	94	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
264	ChartRestApi.favorite_status	35	{"path": "/api/v1/chart/favorite_status/", "q": "!(208,207,206,205,204,203,202,201,200,199,198,197,196,195,194,193,192,191,190,189,188,187,186,185,184)", "object_ref": "ChartRestApi.favorite_status", "rison": [208, 207, 206, 205, 204, 203, 202, 201, 200, 199, 198, 197, 196, 195, 194, 193, 192, 191, 190, 189, 188, 187, 186, 185, 184]}	2022-11-25 13:20:38.697917	\N	0	50	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
269	log	35	{"impression_id": "6qwadY9wS", "version": "v2", "ts": 1669382439711, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "CS7yl-7Ov", "visibility": "visible"}	2022-11-25 13:20:40.733588	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
88	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2022-11-24 14:27:08.456564	\N	0	3413	http://127.0.0.1:8080/superset/dashboard/3/
93	log	1	{"source": "dashboard", "source_id": 3, "impression_id": "J5-2eOfIt", "version": "v2", "ts": 1669300037021, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "PDuFiwbgV", "visibility": "visible"}	2022-11-24 14:27:18.049691	3	0	0	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
97	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 12:59:17.242337	\N	0	381	http://127.0.0.1:8080/superset/welcome/
102	log	1	{"impression_id": "fIJK7ZmS0", "version": "v2", "ts": 1669381156578, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "02w1zVLyF", "visibility": "visible"}	2022-11-25 12:59:17.644163	\N	0	0	http://127.0.0.1:8080/superset/welcome/
107	welcome	35	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 13:00:51.286849	\N	0	1546	http://127.0.0.1:8080/login/
112	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:00:52.661423	\N	0	344	http://127.0.0.1:8080/superset/welcome/
118	log	35	{"impression_id": "VvPm3p81s", "version": "v2", "ts": 1669381252053, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "XB1fXgMPTb", "visibility": "visible"}	2022-11-25 13:00:53.105461	\N	0	0	http://127.0.0.1:8080/superset/welcome/
238	log	35	{"impression_id": "V_vAPX9hU", "version": "v2", "ts": 1669381691215, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "J5p_j-pcY", "visibility": "visible"}	2022-11-25 13:08:12.235917	\N	0	0	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
243	log	35	{"impression_id": "V_vAPX9hU", "version": "v2", "ts": 1669381692426, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "Veo_nJF8a", "visibility": "visible"}	2022-11-25 13:08:14.430966	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
244	log	35	{"impression_id": "V_vAPX9hU", "version": "v2", "ts": 1669381693407, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "EbasWcuMw", "visibility": "visible"}	2022-11-25 13:08:14.430976	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
248	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:08:18.294221	\N	0	75	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
250	DashboardRestApi.import_	35	{"path": "/api/v1/dashboard/import/", "passwords": "{}", "object_ref": "DashboardRestApi.import_"}	2022-11-25 13:10:43.13378	\N	0	131581	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
255	DatasetRestApi.info	35	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:20:22.886952	\N	0	63	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
151	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:05:20.995764	\N	0	65	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
260	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:20:32.499144	\N	0	99	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
122	DatasetRestApi.get_list	35	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:01:28.345053	\N	0	79	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
265	log	35	{"impression_id": "6qwadY9wS", "version": "v2", "ts": 1669382437676, "event_name": "spa_navigation", "path": "/chart/list/", "event_type": "user", "event_id": "YSMyjGG59", "visibility": "visible"}	2022-11-25 13:20:38.748872	\N	0	0	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
169	CssTemplateRestApi.get_list	35	{"path": "/api/v1/css_template/", "q": "(order_column:template_name,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "template_name", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:06:11.082515	\N	0	56	http://127.0.0.1:8080/csstemplatemodelview/list/?pageIndex=0&sortColumn=template_name&sortOrder=desc
174	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:06:19.24834	\N	0	50	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
180	DatasetRestApi.info	35	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:06:21.605563	\N	0	26	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
184	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:06:25.799986	\N	0	55	http://127.0.0.1:8080/superset/sqllab/
89	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2022-11-24 14:27:08.539682	\N	0	3489	http://127.0.0.1:8080/superset/dashboard/3/
95	recent_activity	1	{"path": "/superset/recent_activity/1/", "limit": "6", "url_rule": "/superset/recent_activity/<int:user_id>/", "object_ref": "Superset.recent_activity", "user_id": 1}	2022-11-25 12:59:16.923618	\N	0	102	http://127.0.0.1:8080/superset/welcome/
100	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 12:59:17.526978	\N	0	316	http://127.0.0.1:8080/superset/welcome/
110	SavedQueryRestApi.get_list	35	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:00:52.479718	\N	0	241	http://127.0.0.1:8080/superset/welcome/
117	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:00:52.997246	\N	0	41	http://127.0.0.1:8080/superset/welcome/
241	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:08:13.522546	\N	0	51	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
246	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:08:18.073725	\N	0	108	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
252	DashboardRestApi.favorite_status	35	{"path": "/api/v1/dashboard/favorite_status/", "q": "!(17,16,15,14,13,12,11,10,9,8,7,6,5,4)", "object_ref": "DashboardRestApi.favorite_status", "rison": [17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4]}	2022-11-25 13:10:43.774209	\N	0	7	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
170	log	35	{"impression_id": "Yick80muD", "version": "v2", "ts": 1669381570755, "event_name": "spa_navigation", "path": "/csstemplatemodelview/list/", "event_type": "user", "event_id": "Spy3-7w_qc", "visibility": "visible"}	2022-11-25 13:06:11.825322	\N	0	0	http://127.0.0.1:8080/csstemplatemodelview/list/?pageIndex=0&sortColumn=template_name&sortOrder=desc
175	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:06:19.249542	\N	0	50	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
181	DatasetRestApi.get_list	35	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:06:21.630434	\N	0	46	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
187	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:06:29.295735	\N	0	65	http://127.0.0.1:8080/savedqueryview/list/
192	QueryRestApi.get_list	35	{"path": "/api/v1/query/", "q": "(order_column:start_time,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "start_time", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:06:31.750965	\N	0	62	http://127.0.0.1:8080/superset/sqllab/history/?pageIndex=0&sortColumn=start_time&sortOrder=desc
196	recent_activity	1	{"path": "/superset/recent_activity/1/", "limit": "6", "url_rule": "/superset/recent_activity/<int:user_id>/", "object_ref": "Superset.recent_activity", "user_id": 1}	2022-11-25 13:06:49.272663	\N	0	149	http://127.0.0.1:8080/superset/welcome/
202	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:06:49.637186	\N	0	148	http://127.0.0.1:8080/superset/welcome/
257	log	35	{"impression_id": "6qwadY9wS", "version": "v2", "ts": 1669382422516, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "RKsRQr3uTq", "visibility": "visible"}	2022-11-25 13:20:23.566646	\N	0	0	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
262	ChartRestApi.info	35	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:20:37.848751	\N	0	25	http://127.0.0.1:8080/chart/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
266	DashboardRestApi.info	35	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:20:39.849509	\N	0	48	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
90	ChartDataRestApi.data	1	{"path": "/api/v1/chart/data", "object_ref": "ChartDataRestApi.data"}	2022-11-24 14:27:08.542595	\N	0	3476	http://127.0.0.1:8080/superset/dashboard/3/
99	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 12:59:17.370114	\N	0	455	http://127.0.0.1:8080/superset/welcome/
104	ChartRestApi.get_list	1	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 12:59:17.831624	\N	0	540	http://127.0.0.1:8080/superset/welcome/
105	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 12:59:17.937874	\N	0	10	http://127.0.0.1:8080/superset/welcome/
108	recent_activity	35	{"path": "/superset/recent_activity/35/", "limit": "6", "url_rule": "/superset/recent_activity/<int:user_id>/", "object_ref": "Superset.recent_activity", "user_id": 35}	2022-11-25 13:00:52.326128	\N	0	162	http://127.0.0.1:8080/superset/welcome/
113	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:00:52.720181	\N	0	161	http://127.0.0.1:8080/superset/welcome/
114	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:00:52.760207	\N	0	140	http://127.0.0.1:8080/superset/welcome/
249	log	35	{"impression_id": "9t2dqR9UO", "version": "v2", "ts": 1669381697899, "event_name": "spa_navigation", "path": "/dashboard/list/", "event_type": "user", "event_id": "9SKz6RQb0u", "visibility": "visible"}	2022-11-25 13:08:18.924843	\N	0	0	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
251	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:10:43.369833	\N	0	69	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
256	DatasetRestApi.get_list	35	{"path": "/api/v1/dataset/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:20:22.985132	\N	0	164	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
261	log	35	{"impression_id": "6qwadY9wS", "version": "v2", "ts": 1669382432241, "event_name": "spa_navigation", "path": "/databaseview/list/", "event_type": "user", "event_id": "jCEEg0v63", "visibility": "visible"}	2022-11-25 13:20:33.263887	\N	0	0	http://127.0.0.1:8080/databaseview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
182	log	35	{"impression_id": "Yick80muD", "version": "v2", "ts": 1669381581477, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "-6Xqy9-Lc", "visibility": "visible"}	2022-11-25 13:06:22.516333	\N	0	0	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
189	SavedQueryRestApi.info	35	{"path": "/api/v1/saved_query/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:06:29.445711	\N	0	49	http://127.0.0.1:8080/savedqueryview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
195	welcome	1	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 13:06:48.183936	\N	0	284	http://127.0.0.1:8080/login/
198	SavedQueryRestApi.get_list	1	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'1')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "1"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:06:49.36858	\N	0	219	http://127.0.0.1:8080/superset/welcome/
204	DashboardRestApi.info	1	{"path": "/api/v1/dashboard/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:06:49.771025	\N	0	31	http://127.0.0.1:8080/superset/welcome/
267	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:20:39.856397	\N	0	57	http://127.0.0.1:8080/dashboard/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc&viewMode=table
121	DatasetRestApi.info	35	{"path": "/api/v1/dataset/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:01:28.338207	\N	0	57	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
190	SavedQueryRestApi.get_list	35	{"path": "/api/v1/saved_query/", "q": "(order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:25)", "rison": {"order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 25}}	2022-11-25 13:06:29.53972	\N	0	137	http://127.0.0.1:8080/savedqueryview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
194	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 13:06:42.229105	\N	0	0	http://127.0.0.1:8080/superset/sqllab/history/?pageIndex=0&sortColumn=start_time&sortOrder=desc
200	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:06:49.485254	\N	0	394	http://127.0.0.1:8080/superset/welcome/
205	ChartRestApi.info	1	{"path": "/api/v1/chart/_info", "q": "(keys:!(permissions))", "rison": {"keys": ["permissions"]}}	2022-11-25 13:06:49.839036	\N	0	9	http://127.0.0.1:8080/superset/welcome/
123	log	35	{"impression_id": "lwxeTeYnn", "version": "v2", "ts": 1669381287956, "event_name": "spa_navigation", "path": "/tablemodelview/list/", "event_type": "user", "event_id": "evOMR9DSFa", "visibility": "visible"}	2022-11-25 13:01:29.013044	\N	0	0	http://127.0.0.1:8080/tablemodelview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
191	log	35	{"impression_id": "urwT517Pb", "version": "v2", "ts": 1669381589159, "event_name": "spa_navigation", "path": "/savedqueryview/list/", "event_type": "user", "event_id": "QUNCnrQvP9", "visibility": "visible"}	2022-11-25 13:06:30.2085	\N	0	0	http://127.0.0.1:8080/savedqueryview/list/?pageIndex=0&sortColumn=changed_on_delta_humanized&sortOrder=desc
197	DatabaseRestApi.get_list	1	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:06:49.355268	\N	0	258	http://127.0.0.1:8080/superset/welcome/
201	DashboardRestApi.get_list	1	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:06:49.627508	\N	0	123	http://127.0.0.1:8080/superset/welcome/
210	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:database_name,opr:neq,value:examples)))", "rison": {"filters": [{"col": "database_name", "opr": "neq", "value": "examples"}]}}	2022-11-25 13:07:18.797873	\N	0	264	http://127.0.0.1:8080/superset/welcome/
213	ChartRestApi.get_list	35	{"path": "/api/v1/chart/", "q": "(filters:!((col:owners,opr:rel_m_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "owners", "opr": "rel_m_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:18.95131	\N	0	235	http://127.0.0.1:8080/superset/welcome/
214	SavedQueryRestApi.get_list	35	{"path": "/api/v1/saved_query/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:'35')),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": "35"}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:19.071479	\N	0	116	http://127.0.0.1:8080/superset/welcome/
216	DashboardRestApi.get_list	35	{"path": "/api/v1/dashboard/", "q": "(filters:!((col:created_by,opr:rel_o_m,value:0)),order_column:changed_on_delta_humanized,order_direction:desc,page:0,page_size:5)", "rison": {"filters": [{"col": "created_by", "opr": "rel_o_m", "value": 0}], "order_column": "changed_on_delta_humanized", "order_direction": "desc", "page": 0, "page_size": 5}}	2022-11-25 13:07:19.093962	\N	0	96	http://127.0.0.1:8080/superset/welcome/
219	log	35	{"impression_id": "AnfLZOo9F", "version": "v2", "ts": 1669381638412, "event_name": "spa_navigation", "path": "/superset/welcome/", "event_type": "user", "event_id": "c3qdEzbiAe", "visibility": "visible"}	2022-11-25 13:07:19.438453	\N	0	0	http://127.0.0.1:8080/superset/welcome/
120	DatabaseRestApi.get_list	35	{"path": "/api/v1/database/", "q": "(filters:!((col:allow_file_upload,opr:upload_is_enabled,value:!t)))", "rison": {"filters": [{"col": "allow_file_upload", "opr": "upload_is_enabled", "value": true}]}}	2022-11-25 13:01:28.097213	\N	0	73	http://127.0.0.1:8080/tablemodelview/list/
220	welcome	\N	{"path": "/superset/welcome/", "object_ref": "Superset.welcome"}	2022-11-25 13:07:38.124891	\N	0	0	http://127.0.0.1:8080/users/list/
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metrics (id, metric_name, verbose_name, metric_type, json, description, changed_by_fk, changed_on, created_by_fk, created_on, d3format, warning_text, datasource_id, uuid) FROM stdin;
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.query (id, client_id, database_id, tmp_table_name, tab_name, sql_editor_id, user_id, status, schema, sql, select_sql, executed_sql, "limit", select_as_cta, select_as_cta_used, progress, rows, error_message, start_time, changed_on, end_time, results_key, start_running_time, end_result_backend_time, tracking_url, extra_json, tmp_schema_name, ctas_method, limiting_factor) FROM stdin;
\.


--
-- Data for Name: report_execution_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_execution_log (id, scheduled_dttm, start_dttm, end_dttm, value, value_row_json, state, error_message, report_schedule_id, uuid) FROM stdin;
\.


--
-- Data for Name: report_recipient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_recipient (id, type, recipient_config_json, report_schedule_id, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: report_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_schedule (id, type, name, description, context_markdown, active, crontab, sql, chart_id, dashboard_id, database_id, last_eval_dttm, last_state, last_value, last_value_row_json, validator_type, validator_config_json, log_retention, grace_period, created_on, changed_on, created_by_fk, changed_by_fk, working_timeout, report_format, creation_method, timezone, extra_json, force_screenshot) FROM stdin;
\.


--
-- Data for Name: report_schedule_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_schedule_user (id, user_id, report_schedule_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rls_filter_roles (id, role_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: rls_filter_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rls_filter_tables (id, table_id, rls_filter_id) FROM stdin;
\.


--
-- Data for Name: row_level_security_filters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.row_level_security_filters (created_on, changed_on, id, clause, created_by_fk, changed_by_fk, filter_type, group_key, name, description) FROM stdin;
\.


--
-- Data for Name: saved_query; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.saved_query (created_on, changed_on, id, user_id, db_id, label, schema, sql, description, changed_by_fk, created_by_fk, extra_json, last_run, rows, uuid, template_parameters) FROM stdin;
\.


--
-- Data for Name: sl_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sl_columns (uuid, created_on, changed_on, id, is_aggregation, is_additive, is_dimensional, is_filterable, is_increase_desired, is_managed_externally, is_partition, is_physical, is_temporal, is_spatial, name, type, unit, expression, description, warning_text, external_url, extra_json, created_by_fk, changed_by_fk, advanced_data_type) FROM stdin;
\.


--
-- Data for Name: sl_dataset_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sl_dataset_columns (dataset_id, column_id) FROM stdin;
\.


--
-- Data for Name: sl_dataset_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sl_dataset_tables (dataset_id, table_id) FROM stdin;
\.


--
-- Data for Name: sl_dataset_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sl_dataset_users (dataset_id, user_id) FROM stdin;
\.


--
-- Data for Name: sl_datasets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sl_datasets (uuid, created_on, changed_on, id, database_id, is_physical, is_managed_externally, name, expression, external_url, extra_json, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: sl_table_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sl_table_columns (table_id, column_id) FROM stdin;
\.


--
-- Data for Name: sl_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sl_tables (uuid, created_on, changed_on, id, database_id, is_managed_externally, catalog, schema, name, external_url, extra_json, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: slice_email_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slice_email_schedules (created_on, changed_on, id, active, crontab, recipients, deliver_as_group, delivery_type, slice_id, email_format, created_by_fk, changed_by_fk, user_id, slack_channel, uuid) FROM stdin;
\.


--
-- Data for Name: slice_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slice_user (id, user_id, slice_id) FROM stdin;
24	35	24
25	35	25
26	35	26
27	35	27
28	35	28
29	35	29
30	35	30
31	35	31
32	35	32
33	35	33
34	35	34
35	35	35
36	35	36
37	35	37
38	35	38
39	35	39
40	35	40
41	35	41
42	35	42
43	35	43
44	35	44
45	35	45
46	35	46
47	35	47
48	35	48
49	35	49
50	35	50
51	35	51
52	35	52
53	35	53
54	35	54
55	35	55
56	35	56
57	35	57
58	35	58
59	35	59
60	35	60
61	35	61
62	35	62
63	35	63
64	35	64
65	35	65
66	35	66
67	35	67
68	35	68
69	35	69
70	35	70
71	35	71
72	35	72
73	35	73
74	35	74
75	35	75
76	35	76
77	35	77
78	35	78
79	35	79
80	35	80
81	35	81
82	35	82
83	35	83
84	35	84
85	35	85
86	35	86
87	35	87
88	35	88
89	35	89
90	35	90
91	35	91
92	35	92
93	35	93
94	35	94
95	35	95
96	35	96
97	35	97
98	35	98
99	35	99
100	35	100
101	35	101
102	35	102
103	35	103
104	35	104
105	35	105
106	35	106
107	35	107
108	35	108
109	35	109
110	35	110
111	35	111
112	35	112
113	35	113
114	35	114
115	35	115
116	35	116
117	35	117
118	35	118
119	35	119
120	35	120
121	35	121
122	35	122
123	35	123
124	35	124
125	35	125
126	35	126
127	35	127
128	35	128
129	35	129
130	35	130
131	35	131
132	35	132
133	35	133
134	35	134
135	35	135
136	35	136
137	35	137
138	35	138
139	35	139
140	35	140
141	35	141
142	35	142
143	35	143
144	35	144
145	35	145
146	35	146
147	35	147
148	35	148
149	35	149
150	35	150
151	35	151
152	35	152
153	35	153
154	35	154
155	35	155
156	35	156
157	35	157
158	35	158
159	35	159
160	35	160
161	35	161
162	35	162
163	35	163
164	35	164
165	35	165
166	35	166
167	35	167
168	35	168
169	35	169
170	35	170
171	35	171
172	35	172
173	35	173
174	35	174
175	35	175
176	35	176
177	35	177
178	35	178
179	35	179
180	35	180
181	35	181
182	35	182
183	35	183
184	35	184
185	35	185
186	35	186
187	35	187
188	35	188
189	35	189
190	35	190
191	35	191
192	35	192
193	35	193
194	35	194
195	35	195
196	35	196
197	35	197
198	35	198
199	35	199
200	35	200
201	35	201
202	35	202
203	35	203
204	35	204
205	35	205
206	35	206
207	35	207
208	35	208
\.


--
-- Data for Name: slices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.slices (created_on, changed_on, id, slice_name, datasource_type, datasource_name, viz_type, params, created_by_fk, changed_by_fk, description, cache_timeout, perm, datasource_id, schema_perm, uuid, query_context, last_saved_at, last_saved_by_fk, certified_by, certification_details, is_managed_externally, external_url) FROM stdin;
2022-11-25 13:10:40.066546	2022-11-25 13:10:40.066554	24	Deep Learning: Scores	table	models_scoring_history_deeplearning	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "datasource": "1__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "timestamp", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": true, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"column_name": "training_rmse", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 505, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_rmse)", "optionName": "metric_h3k64rs0oj5_gxx5f6b16ha", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "validation_rmse", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 511, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_rmse)", "optionName": "metric_f79ndmwx4ch_qbsmjwlhkc", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "training_logloss", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 506, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_logloss)", "optionName": "metric_uspypk3cqh_fhbtvacfte7", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "validation_classification_error", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 514, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_classification_error)", "optionName": "metric_yoydlhqdwga_h6dux8jjg4m", "sqlExpression": null}], "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_legend": true, "slice_id": 4, "stack": false, "time_grain_sqla": "PT1S", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "xAxisShowMaxLabel": false, "xAxisShowMinLabel": false, "x_axis_time_format": "%Y-%m-%d", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "zoomable": true, "remote_id": 4, "datasource_name": "models_scoring_history_deeplearning", "schema": "ecosystem_meta", "database_name": "ecosystem_server", "import_time": 1631260708}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_deeplearning](id:8)	8	[ecosystem_server].[ecosystem_meta]	9c464e6e-dd20-4f2a-b145-b3b1b0ae095b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.207355	2022-11-25 13:10:40.207362	32	Deep Learning: Model Summary	table	models_model_summary_deeplearning	table	{"adhoc_filters": [], "all_columns": ["model_identity", "response_column_name", "type", "create_date"], "color_pn": true, "datasource": "6__table", "extra_form_data": {}, "granularity_sqla": null, "groupby": [], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_deeplearning](id:10)	10	[ecosystem_server].[ecosystem_meta]	33918830-fc8e-469c-8432-017c23ea0cc9	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.221688	2022-11-25 13:10:40.221695	33	Spending Categories	table	bank_transactions	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "groupby": ["mcc_category"], "label_colors": {}, "metrics": ["count"], "order_desc": true, "row_limit": 1000, "show_legend": true, "slice_id": 1, "time_range": "No filter", "url_params": {}, "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	d18ede4a-3e61-4b5f-8c3e-a7e1b3f5d058	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.235702	2022-11-25 13:10:40.235709	34	Customers	table	bank_transactions	big_number_total	{"adhoc_filters": [], "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "header_font_size": 0.2, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "customer", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 165, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(customer)", "optionName": "metric_7mlwj29o0cj_detqnp0wadr", "sqlExpression": null}, "slice_id": 3, "subheader": "Customers", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	3c7036cf-ec6c-4697-b3bd-2e6d7e4cefad	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.250414	2022-11-25 13:10:40.250421	35	Categories	table	bank_transactions	big_number_total	{"adhoc_filters": [], "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "header_font_size": 0.2, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "mcc_category", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 167, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(mcc_category)", "optionName": "metric_ickk5mo0239_pfm10he0a9", "sqlExpression": null}, "slice_id": 4, "subheader": "Categories", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	b2acc8cf-25ee-4ff0-90da-3c98f8500350	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.264646	2022-11-25 13:10:40.264652	36	Spend Category Velocity	table	bank_transactions	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "values", "contributionMode": null, "datasource": "12__table", "extra_form_data": {}, "forecastEnabled": false, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "effreformatted", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": true, "markerSize": 6, "metrics": ["count"], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 250, "seriesType": "smooth", "slice_id": 12, "stack": true, "time_grain_sqla": "P1W", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "zoomable": false}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	c0acfb76-be15-4541-b158-f899a6a53c06	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.278288	2022-11-25 13:10:40.278298	37	Reliability (Entropy)	table	bank_transactions_reliability	table	{"adhoc_filters": [], "all_columns": ["customer", "trns_amt_reliability"], "color_pn": true, "column_config": {"customer": {"horizontalAlign": "left", "showCellBars": false}}, "datasource": "15__table", "extra_form_data": {}, "granularity_sqla": null, "groupby": [], "order_by_cols": ["[\\"trns_amt_reliability\\", false]"], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "show_totals": true, "slice_id": 13, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[bank_transactions_reliability](id:12)	12	[ecosystem_server].[master]	756cac59-4712-403f-a0e6-427e4064be91	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.413984	2022-11-25 13:10:40.413992	46	Transactions EventFlow	table	bank_transactions	event_flow	{"adhoc_filters": [], "all_columns": [], "all_columns_x": "mcc_category", "datasource": "12__table", "entity": "customer", "extra_form_data": {}, "granularity_sqla": "effreformatted", "min_leaf_node_event_count": 1, "order_by_entity": false, "row_limit": 100, "slice_id": 29, "time_range": "No filter", "url_params": {}, "viz_type": "event_flow"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	83eff332-cadc-4b30-bc8b-19262677ad86	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.097181	2022-11-25 13:10:40.097189	25	Deep Learning: Model Validation Details	table	models_scoring_history_deeplearning	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "datasource": "1__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "timestamp", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"column_name": "validation_classification_error", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 514, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_classification_error)", "optionName": "metric_sb37s79d8mh_rgsjj8nykch", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "training_classification_error", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 508, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_classification_error)", "optionName": "metric_waifutpde29_cbiw8edtw7o", "sqlExpression": null}], "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "slice_id": 5, "time_grain_sqla": "PT1S", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "remote_id": 5, "datasource_name": "models_scoring_history_deeplearning", "schema": "ecosystem_meta", "database_name": "ecosystem_server", "import_time": 1631260708}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_deeplearning](id:8)	8	[ecosystem_server].[ecosystem_meta]	22030ed3-6843-4185-8d59-513598b8cddc	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.114066	2022-11-25 13:10:40.114073	26	Deep Learning: Variable Importance	table	models_variable_importances_deeplearning	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "12__table", "extra_form_data": {}, "groupby": ["variable"], "label_colors": {}, "metrics": [{"aggregate": "MAX", "column": {"column_name": "relative_importance", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 542, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(relative_importance)", "optionName": "metric_q0nadgbcxaf_zt4xfk2oxu", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "scaled_importance", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 543, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(scaled_importance)", "optionName": "metric_s7f81am0ego_6ieu6p4ybbc", "sqlExpression": null}], "order_desc": true, "row_limit": 10000, "slice_id": 34, "time_range": "Last week", "url_params": {}, "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "remote_id": 6, "datasource_name": "models_variable_importances_deeplearning", "schema": "ecosystem_meta", "database_name": "ecosystem_server", "import_time": 1631260708}	35	35	\N	\N	[ecosystem_server].[models_variable_importances_deeplearning](id:9)	9	[ecosystem_server].[ecosystem_meta]	8320fc44-de62-46e8-8a90-d05862f1f917	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.129047	2022-11-25 13:10:40.129055	27	Deep Learning: Variable Importances	table	models_variable_importances_deeplearning	table	{"adhoc_filters": [], "all_columns": ["variable", "relative_importance", "scaled_importance", "percentage"], "color_pn": true, "datasource": "12__table", "extra_form_data": {}, "groupby": [], "metrics": ["count"], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "Last week", "url_params": {}, "viz_type": "table", "remote_id": 7, "datasource_name": "models_variable_importances_deeplearning", "schema": "ecosystem_meta", "database_name": "ecosystem_server", "import_time": 1631260708}	35	35	\N	\N	[ecosystem_server].[models_variable_importances_deeplearning](id:9)	9	[ecosystem_server].[ecosystem_meta]	9585bd2e-a5e3-4ab4-bb60-7f15cd0c043f	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.142522	2022-11-25 13:10:40.142529	28	Deep Learning: Model Details	table	models_scoring_history_deeplearning	table	{"adhoc_filters": [], "all_columns": ["duration", "training_rmse", "validation_rmse", "training_logloss", "training_classification_error", "validation_logloss", "validation_classification_error", "iterations"], "color_pn": true, "datasource": "1__table", "extra_form_data": {}, "granularity_sqla": "timestamp", "groupby": [], "metrics": ["count"], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "slice_id": 8, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table", "remote_id": 8, "datasource_name": "models_scoring_history_deeplearning", "schema": "ecosystem_meta", "database_name": "ecosystem_server", "import_time": 1631260708}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_deeplearning](id:8)	8	[ecosystem_server].[ecosystem_meta]	2868cfcf-e768-4b55-ba35-559200dbae34	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.158502	2022-11-25 13:10:40.158509	29	Select: Deep Learning Model	table	models_model_summary_deeplearning	filter_box	{"adhoc_filters": [], "datasource": "6__table", "date_filter": false, "extra_form_data": {}, "filter_configs": [{"asc": true, "clearable": false, "column": "model_identity", "key": "vyYqjtGZp", "label": "Model ID", "multiple": false, "searchAllOptions": true}], "granularity_sqla": null, "instant_filtering": false, "slice_id": 11, "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "filter_box"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_deeplearning](id:10)	10	[ecosystem_server].[ecosystem_meta]	2b9f3aa6-c12a-4415-9b34-d8e30fea7c0e	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.173381	2022-11-25 13:10:40.173388	30	Deep Learning: Layers	table	models_model_summary_deeplearning	big_number_total	{"adhoc_filters": [], "datasource": "6__table", "extra_form_data": {}, "header_font_size": 0.2, "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "layer", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 62, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(layer)", "optionName": "metric_rn8qo1hbxr_zqvh4jk253o", "sqlExpression": null}, "slice_id": 35, "subheader": "Layers", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_deeplearning](id:10)	10	[ecosystem_server].[ecosystem_meta]	5bcabbcc-7e31-4a8e-ac26-ba0c827ce314	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.192464	2022-11-25 13:10:40.192471	31	Deep Learning: Rate	table	models_model_summary_deeplearning	big_number_total	{"adhoc_filters": [], "datasource": "6__table", "extra_form_data": {}, "header_font_size": 0.2, "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "mean_rate", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 68, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(mean_rate)", "optionName": "metric_rn8qo1hbxr_zqvh4jk253o", "sqlExpression": null}, "slice_id": 36, "subheader": "Mean Rate", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_deeplearning](id:10)	10	[ecosystem_server].[ecosystem_meta]	b2c9d196-7e98-47f7-8a44-c72024f68a62	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.295411	2022-11-25 13:10:40.295452	38	Transactions	table	bank_transactions	big_number_total	{"adhoc_filters": [], "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "header_font_size": 0.2, "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "customer", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 165, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(customer)", "optionName": "metric_c4udclxipuf_2unqndv2f4c", "sqlExpression": null}, "slice_id": 15, "subheader": "Transactions", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	11263c4a-9c33-49ce-8286-20f403e2a3b0	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.311413	2022-11-25 13:10:40.311422	39	Transaction Network	table	bank_transactions	graph_chart	{"adhoc_filters": [], "baseEdgeWidth": 5, "baseNodeSize": 20, "color_scheme": "supersetColors", "datasource": "12__table", "draggable": true, "edgeLength": 300, "edgeSymbol": "none,arrow", "extra_form_data": {}, "friction": 0.4, "granularity_sqla": "effreformatted", "gravity": 0.3, "layout": "force", "legendOrientation": "left", "legendType": "plain", "metric": "count", "repulsion": 1700, "roam": true, "row_limit": 100, "selectedMode": "multiple", "show_legend": true, "slice_id": 16, "source": "trns_type", "source_category": "trns_type", "target": "mcc_category", "target_category": "mcc_base_category", "time_range": "No filter", "url_params": {}, "viz_type": "graph_chart"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	d290876f-576e-4dd6-a66a-1d91cebcb329	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.324888	2022-11-25 13:10:40.324896	40	Customer Transaction Network	table	bank_transactions	graph_chart	{"adhoc_filters": [], "baseEdgeWidth": 3, "baseNodeSize": 20, "color_scheme": "supersetColors", "datasource": "12__table", "draggable": true, "edgeLength": 150, "edgeSymbol": "none,arrow", "extra_form_data": {}, "friction": 0.5, "granularity_sqla": "effreformatted", "gravity": 0.2, "layout": "force", "legendMargin": 100, "legendOrientation": "left", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "customer", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 165, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(customer)", "optionName": "metric_p50y27i88z_3gm0u8yg6qh", "sqlExpression": null}, "repulsion": 3000, "roam": true, "row_limit": 1000, "selectedMode": "multiple", "show_legend": true, "slice_id": 17, "source": "customer", "source_category": "customer", "target": "mcc_description", "target_category": "mcc_category", "time_range": "No filter", "url_params": {}, "viz_type": "graph_chart"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	0db684ca-8c7a-4aed-a5c5-9ffaffefb692	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.339723	2022-11-25 13:10:40.33973	41	Timeframe	table	bank_transactions	big_number_total	{"adhoc_filters": [], "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "header_font_size": 0.2, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "effreformatted", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 158, "is_certified": false, "is_dttm": true, "python_date_format": null, "type": "VARCHAR", "type_generic": 2, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(effreformatted)", "optionName": "metric_y5qx7al6xpm_dluxvlr3q5f", "sqlExpression": null}, "slice_id": 18, "subheader": "Date Range", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	33deb6cf-d090-498f-b7ca-f8d92d9286a0	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.354029	2022-11-25 13:10:40.354036	42	Customer Category Velocity	table	bank_transactions	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "12__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "effreformatted", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerSize": 6, "metrics": ["count"], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "slice_id": 19, "time_grain_sqla": "P1D", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	b1535b22-9bbc-42b2-89f1-ee95e5b5e09a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.368203	2022-11-25 13:10:40.36821	43	Personality Profile	table	bank_transactions_personality	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "13__table", "extra_form_data": {}, "granularity_sqla": null, "groupby": ["trait", "personality"], "label_colors": {}, "metrics": ["count"], "order_desc": true, "row_limit": 1000, "slice_id": 20, "time_range": "No filter", "url_params": {}, "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[bank_transactions_personality](id:13)	13	[ecosystem_server].[master]	b8949ab7-5ddb-4d67-8efa-84259683db63	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.383955	2022-11-25 13:10:40.383961	44	Customer Transactions	table	bank_transactions	pivot_table	{"adhoc_filters": [], "columns": ["mcc_sub_category"], "datasource": "12__table", "date_format": "smart_date", "extra_form_data": {}, "granularity_sqla": "effreformatted", "groupby": ["account_type"], "metrics": ["count"], "number_format": "SMART_NUMBER", "order_desc": true, "pandas_aggfunc": "sum", "pivot_margins": true, "row_limit": 250, "slice_id": 27, "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "pivot_table"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	34919f60-0bd6-4ad8-a01b-83477a019fc9	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.399518	2022-11-25 13:10:40.399525	45	Transaction Limits	table	bank_transactions	horizon	{"adhoc_filters": [], "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "groupby": ["mcc_description"], "horizon_color_scale": "change", "limit": 100, "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "mcc_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 169, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(mcc_description)", "optionName": "metric_vvsfndp372o_iq5n9nd03k", "sqlExpression": null}], "order_desc": true, "row_limit": 10000, "series_height": "25", "slice_id": 28, "time_range": "No filter", "url_params": {}, "viz_type": "horizon"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	3d43c22a-357c-4994-b1c2-f10f65178a32	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.428299	2022-11-25 13:10:40.428307	47	Transactions Chord	table	bank_transactions	chord	{"adhoc_filters": [], "color_scheme": "supersetColors", "columns": "mcc_description", "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "groupby": "mcc_spend_type", "label_colors": {}, "metric": "count", "row_limit": 10000, "slice_id": 30, "time_range": "No filter", "url_params": {}, "viz_type": "chord", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	604cf6f2-fafc-492e-bcfd-ccc8d10f6c71	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.442122	2022-11-25 13:10:40.442129	48	Personality Spectrum	table	bank_transactions_personality	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "13__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "granularity_sqla": null, "groupby": ["personality"], "innerRadius": 41, "label_line": true, "label_type": "key", "labels_outside": true, "legendOrientation": "bottom", "legendType": "scroll", "metric": "count", "number_format": "~g", "outerRadius": 67, "row_limit": 100, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "slice_id": 31, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[bank_transactions_personality](id:13)	13	[ecosystem_server].[master]	02bf9b41-7d3d-4fc9-81da-f8bc3b68e89d	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.456708	2022-11-25 13:10:40.456714	49	Spend Category Specialization	table	bank_transactions	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "percentage", "contributionMode": null, "datasource": "12__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "effreformatted", "groupby": ["mcc_spend_type"], "label_colors": {}, "legendOrientation": "top", "legendType": "plain", "limit": 100, "logAxis": false, "markerEnabled": false, "markerSize": 6, "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "mcc_spend_type", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 170, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(mcc_spend_type)", "optionName": "metric_2dta7e5kmy6_hof3nugrr55", "sqlExpression": null}], "min_periods": 5, "minorSplitLine": false, "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "rolling_periods": 7, "rolling_type": "mean", "row_limit": 250, "seriesType": "line", "show_legend": true, "show_value": false, "slice_id": 32, "stack": false, "time_compare": [], "time_grain_sqla": "P1D", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	16c70a29-3c33-494a-9fa8-53d7444685ce	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.471439	2022-11-25 13:10:40.471446	50	Spend Type	table	bank_transactions	sankey	{"adhoc_filters": [{"clause": "WHERE", "comparator": ["NA"], "expressionType": "SIMPLE", "filterOptionName": "filter_kxj7hc07ses_kpgk68wwumc", "isExtra": false, "isNew": false, "operator": "NOT IN", "operatorId": "NOT_IN", "sqlExpression": null, "subject": "mcc_description"}], "color_scheme": "supersetColors", "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "groupby": ["mcc_category", "mcc_spend_type"], "label_colors": {}, "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "customer", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 165, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(customer)", "optionName": "metric_r4z8eul37f_822s94ileha", "sqlExpression": null}, "row_limit": 10000, "slice_id": 33, "time_range": "No filter", "url_params": {}, "viz_type": "sankey"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	83f54111-53aa-41cc-89b9-bfc5d279319c	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.487325	2022-11-25 13:10:40.487333	51	Personality by Education	table	bank_customer	heatmap	{"adhoc_filters": [], "all_columns_x": "personality", "all_columns_y": "education", "bottom_margin": "auto", "canvas_image_rendering": "pixelated", "datasource": "16__table", "extra_form_data": {}, "granularity_sqla": null, "left_margin": "auto", "linear_color_scheme": "schemeOrRd", "metric": "count", "normalize_across": "heatmap", "row_limit": 10000, "show_perc": true, "slice_id": 34, "sort_x_axis": "alpha_asc", "sort_y_axis": "alpha_asc", "time_range": "No filter", "url_params": {}, "viz_type": "heatmap", "xscale_interval": null, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "yscale_interval": null}	35	35	\N	\N	[ecosystem_server].[bank_customer](id:14)	14	[ecosystem_server].[master]	ed852bb9-608a-495c-98af-bc51ab90a1ab	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.503763	2022-11-25 13:10:40.50377	52	Transaction Type	table	bank_transactions	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "12__table", "date_format": "smart_date", "extra_form_data": {}, "granularity_sqla": "effreformatted", "groupby": ["trns_type"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "top", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "mcc_spend_type", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 170, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(mcc_spend_type)", "optionName": "metric_e34b0nrp0k_y7nsu3p4vu", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "slice_id": 64, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	726d5bb1-1167-4dee-bc0a-82e005a4e62e	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.519593	2022-11-25 13:10:40.5196	53	Transaction Detail	table	bank_transactions	table	{"adhoc_filters": [], "all_columns": ["customer", "effreformatted", "trns_amt", "mcc_category", "mcc_base_category", "mcc_sub_category", "mcc_description"], "color_pn": true, "column_config": {"customer": {"horizontalAlign": "left", "showCellBars": false}, "trns_amt": {"d3NumberFormat": "~g"}}, "conditional_formatting": [{"colorScheme": "#EFA1AA", "column": "trns_amt", "operator": ">", "targetValue": 1000}], "datasource": "12__table", "extra_form_data": {}, "granularity_sqla": "effreformatted", "groupby": [], "include_search": true, "order_by_cols": ["[\\"customer\\", true]", "[\\"effreformatted\\", true]"], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "slice_id": 65, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[bank_transactions](id:11)	11	[ecosystem_server].[master]	8180b00a-dbc6-4ca5-9282-2c7301f15663	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.533965	2022-11-25 13:10:40.533972	54	Transaction Time Series	table	bank_transactions_time_series	echarts_timeseries_scatter	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "31__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "eff_date_date_start", "groupby": ["customer"], "label_colors": {}, "legendOrientation": "left", "legendType": "scroll", "limit": 100, "markerSize": 6, "metrics": [{"aggregate": "SUM", "column": {"certification_details": null, "certified_by": null, "column_name": "categories_count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1226, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "SUM(categories_count)", "optionName": "metric_kqbm89q9vrf_2h4jyivufeb", "sqlExpression": null}, {"aggregate": "SUM", "column": {"certification_details": null, "certified_by": null, "column_name": "grocery stores supermarkets_count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 837, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "SUM(grocery stores supermarkets_count)", "optionName": "metric_0k7l0n5ldigj_lfemedkprla", "sqlExpression": null}, {"aggregate": "SUM", "column": {"certification_details": null, "certified_by": null, "column_name": "fuel service stations_count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 863, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "SUM(fuel service stations_count)", "optionName": "metric_flyu60p4yt8_ntwgw85693e", "sqlExpression": null}], "minorSplitLine": false, "only_total": true, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "show_legend": true, "slice_id": 66, "stack": false, "time_grain_sqla": "P1D", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries_scatter", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title": "Transaction Count", "y_axis_title_margin": 15, "y_axis_title_position": "Left"}	35	35	\N	\N	[ecosystem_server].[bank_transactions_time_series](id:15)	15	[ecosystem_server].[master]	d4a82480-b7b9-4c93-ab8c-27a948ee4d50	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.54887	2022-11-25 13:10:40.548877	55	Bank Customer Personality Detail	table	bank_transactions_personality	table	{"datasource": "13__table", "viz_type": "table", "time_grain_sqla": "P1D", "time_range": "No filter", "query_mode": "raw", "groupby": [], "all_columns": ["customer", "industrious", "intentional", "experiential", "enthusiastic", "personality", "extrovert", "introvert", "trait"], "percent_metrics": [], "adhoc_filters": [], "order_by_cols": [], "row_limit": 1000, "server_page_length": 10, "order_desc": true, "table_timestamp_format": "smart_date", "show_cell_bars": true, "color_pn": true, "extra_form_data": {}, "dashboards": [6]}	35	35	\N	\N	[ecosystem_server].[bank_transactions_personality](id:13)	13	[ecosystem_server].[master]	1e8fc989-20cd-46ac-a027-c6bfb77b2ce4	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.563007	2022-11-25 13:10:40.563016	56	Total Models	table	models	big_number_total	{"adhoc_filters": [], "datasource": "18__table", "extra_form_data": {}, "granularity_sqla": null, "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "model_id", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 615, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "ROW", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(model_id)", "optionName": "metric_11tpdt5tthxa_6ddbgzhciwk", "sqlExpression": null}, "slice_id": 14, "subheader": "Models", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[models](id:17)	17	[ecosystem_server].[ecosystem_meta]	90719c20-4288-478c-8b44-3d8aa320e311	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.575308	2022-11-25 13:10:40.575314	57	XGBoost: Scores	table	models_scoring_history_xgboost	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "19__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "timestamp", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": true, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"column_name": "training_rmse", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 107, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_rmse)", "optionName": "metric_7zwj9au4nai_c9hun55sdwv", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "validation_rmse", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 113, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_rmse)", "optionName": "metric_ruq5bbbxi1b_a0nkd3jaalm", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "training_logloss", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 108, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_logloss)", "optionName": "metric_5nq87b07eaa_g2zrzoh0ti", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "validation_classification_error", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 118, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_classification_error)", "optionName": "metric_o7yad7x2zif_sollz4yx3ac", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_value": true, "slice_id": 37, "stack": true, "time_grain_sqla": "PT1S", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_xgboost](id:16)	16	[ecosystem_server].[ecosystem_meta]	eca04ebd-ed41-4021-b283-53fe83147617	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.589735	2022-11-25 13:10:40.589742	58	XGBoost: Model Validation Details	table	models_scoring_history_xgboost	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "19__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "timestamp", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": true, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"column_name": "training_classification_error", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 112, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_classification_error)", "optionName": "metric_6pgo74g79fh_a7ldueme32p", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "validation_classification_error", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 118, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_classification_error)", "optionName": "metric_p0gvi7cb1ns_oih1bn8ac1c", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_value": true, "slice_id": 38, "stack": true, "time_grain_sqla": "PT1S", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_xgboost](id:16)	16	[ecosystem_server].[ecosystem_meta]	54b5d36b-62d1-464b-bd1a-2e315835647c	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.606503	2022-11-25 13:10:40.606512	59	XGBoost: Logloss	table	models_scoring_history_xgboost	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "19__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "timestamp", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": true, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"column_name": "validation_logloss", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 114, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_logloss)", "optionName": "metric_i7836ydnsm_z5sdvfe1u1i", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "training_logloss", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 108, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_logloss)", "optionName": "metric_1f6wogstakn_29ow2wzkpl8", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_value": true, "slice_id": 39, "stack": true, "time_grain_sqla": "PT1S", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_xgboost](id:16)	16	[ecosystem_server].[ecosystem_meta]	03409a53-14e2-4fc0-9895-9f40043af552	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.620798	2022-11-25 13:10:40.620805	60	XGBoost: Variable Importances	table	models_variable_importances_xgboost	table	{"adhoc_filters": [], "all_columns": ["variable", "relative_importance", "scaled_importance", "percentage"], "color_pn": true, "datasource": "9__table", "extra_form_data": {}, "groupby": [], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table", "remote_id": 29, "datasource_name": "models_variable_importances_xgboost", "schema": "ecosystem_meta", "database_name": "ecosystem_server", "import_time": 1635252681}	35	35	\N	\N	[ecosystem_server].[models_variable_importances_xgboost](id:18)	18	[ecosystem_server].[ecosystem_meta]	88d71ede-97d8-4b1d-9913-51625489ec1d	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.6351	2022-11-25 13:10:40.635107	61	XGBoost: Variable Importance	table	models_variable_importances_xgboost	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "9__table", "extra_form_data": {}, "groupby": ["variable"], "label_colors": {}, "metrics": [{"aggregate": "MAX", "column": {"column_name": "relative_importance", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 125, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(relative_importance)", "optionName": "metric_ghonej7r3we_zm53wc0hpe", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "scaled_importance", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 126, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(scaled_importance)", "optionName": "metric_smq3098p73n_3dpw2000eyq", "sqlExpression": null}], "order_desc": true, "row_limit": 10000, "time_range": "No filter", "url_params": {}, "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "remote_id": 30, "datasource_name": "models_variable_importances_xgboost", "schema": "ecosystem_meta", "database_name": "ecosystem_server", "import_time": 1635252681}	35	35	\N	\N	[ecosystem_server].[models_variable_importances_xgboost](id:18)	18	[ecosystem_server].[ecosystem_meta]	4f4c0a26-dea2-4840-9262-6d6af8d2ac3b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.651122	2022-11-25 13:10:40.651129	62	XGBoost: Models	table	models_model_summary_xgboost	table	{"adhoc_filters": [], "all_columns": ["model_identity", "response_column_name", "number_of_trees", "create_date"], "color_pn": true, "datasource": "28__table", "extra_form_data": {}, "groupby": [], "order_by_cols": ["[\\"model_identity\\", true]"], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_xgboost](id:19)	19	[ecosystem_server].[ecosystem_meta]	f21de1d1-dfb9-4264-88d8-9f68b9affaf7	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.665574	2022-11-25 13:10:40.665594	63	XGBoost: Model Details	table	models_scoring_history_xgboost	table	{"adhoc_filters": [], "all_columns": ["model_identity", "number_of_trees", "training_rmse", "training_logloss", "training_auc", "training_pr_auc", "training_classification_error", "validation_rmse", "validation_logloss", "validation_auc", "validation_pr_auc", "validation_classification_error"], "color_pn": true, "datasource": "19__table", "extra_form_data": {}, "granularity_sqla": "timestamp", "groupby": [], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_xgboost](id:16)	16	[ecosystem_server].[ecosystem_meta]	30fe8964-90bc-4d92-91f9-5173074c6a0c	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.680286	2022-11-25 13:10:40.680293	64	XGBoost: Model Summary	table	models_model_summary_xgboost	table	{"adhoc_filters": [], "all_columns": ["model_identity", "response_column_name", "model_category", "create_date"], "color_pn": true, "datasource": "28__table", "extra_form_data": {}, "granularity_sqla": null, "groupby": [], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_xgboost](id:19)	19	[ecosystem_server].[ecosystem_meta]	16716f06-9b58-4670-af03-7dd964cfa532	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.700077	2022-11-25 13:10:40.700084	65	GBM: Model Details	table	models_scoring_history_gbm	table	{"adhoc_filters": [], "all_columns": ["duration", "training_rmse", "validation_rmse", "training_logloss", "validation_logloss", "validation_classification_error", "training_auc", "training_pr_auc", "validation_auc", "validation_pr_auc", "number_of_trees"], "color_pn": true, "datasource": "23__table", "extra_form_data": {}, "granularity_sqla": "create_date", "groupby": [], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "show_totals": true, "slice_id": 21, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_gbm](id:20)	20	[ecosystem_server].[ecosystem_meta]	54b77fca-af84-4ae0-bd06-72bbe7051dc4	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.71469	2022-11-25 13:10:40.714698	66	GBM: Variable Importances	table	models_variable_importances_gbm	table	{"adhoc_filters": [], "all_columns": [], "color_pn": true, "datasource": "21__table", "extra_form_data": {}, "granularity_sqla": null, "groupby": ["variable", "percentage", "relative_importance", "scaled_importance"], "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "percentage", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 663, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(percentage)", "optionName": "metric_tar8xy6p3lg_urnal8u86c", "sqlExpression": null}], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "aggregate", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "slice_id": 22, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[models_variable_importances_gbm](id:21)	21	[ecosystem_server].[ecosystem_meta]	2c3c9e3f-bcaa-4207-94d7-4e924354b075	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.728307	2022-11-25 13:10:40.728322	67	GBM: Variable Importance	table	models_variable_importances_gbm	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "21__table", "extra_form_data": {}, "granularity_sqla": null, "groupby": ["variable"], "label_colors": {}, "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "percentage", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 663, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(percentage)", "optionName": "metric_bqkspau9vb5_oulpltrvsfb", "sqlExpression": null}], "order_desc": true, "row_limit": 10000, "slice_id": 23, "time_range": "No filter", "url_params": {}, "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[models_variable_importances_gbm](id:21)	21	[ecosystem_server].[ecosystem_meta]	2e6e2439-a330-4208-b8b3-0b83477c6ba7	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.742078	2022-11-25 13:10:40.742084	68	GBM: Trees	table	models_model_summary_gbm	big_number_total	{"adhoc_filters": [], "datasource": "24__table", "extra_form_data": {}, "granularity_sqla": null, "header_font_size": 0.3, "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "number_of_trees", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 700, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(number_of_trees)", "optionName": "metric_4zrisesbit_0i6ei59px08u", "sqlExpression": null}, "slice_id": 24, "subheader": "Trees", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_gbm](id:22)	22	[ecosystem_server].[ecosystem_meta]	30c5cfa7-aa92-44f3-9880-71ccad54fefe	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.756766	2022-11-25 13:10:40.756773	69	GBM: Depth	table	models_model_summary_gbm	big_number_total	{"adhoc_filters": [], "datasource": "24__table", "extra_form_data": {}, "granularity_sqla": null, "header_font_size": 0.3, "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "max_depth", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 704, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(max_depth)", "optionName": "metric_z8znsr8gomr_i2ix7xiqkvk", "sqlExpression": null}, "slice_id": 25, "subheader": "Depth", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_gbm](id:22)	22	[ecosystem_server].[ecosystem_meta]	09ee22aa-b54c-4cfa-bf44-9521898c7f08	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.771146	2022-11-25 13:10:40.771153	70	GBM: RMSE	table	models_scoring_history_gbm	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "values", "contributionMode": null, "datasource": "23__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "timestamp", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": false, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "validation_rmse", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 683, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_rmse)", "optionName": "metric_pt00k7rvyo_77pp2xkienw", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_legend": true, "show_value": true, "slice_id": 26, "stack": false, "time_grain_sqla": "PT1S", "time_range": "No filter", "tooltipTimeFormat": "%Y-%m-%d %H:%M:%S", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "xAxisLabelRotation": 0, "x_axis_time_format": "%H:%M:%S", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": false}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_gbm](id:20)	20	[ecosystem_server].[ecosystem_meta]	05b9c02d-6593-4329-b8c3-c0a4bed2e09e	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.785929	2022-11-25 13:10:40.785936	71	Total Models	table	models	big_number_total	{"adhoc_filters": [], "database_name": "ecosystem_server", "datasource": "2__table", "datasource_name": "models", "extra_form_data": {}, "header_font_size": 0.3, "import_time": 1635253453, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"column_name": "model_identity", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1324, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(model_identity)", "optionName": "metric_zhpwqr2yl7_2b923o1kohi", "sqlExpression": null}, "remote_id": 10, "schema": "ecosystem_meta", "slice_id": 10, "subheader": "Models", "subheader_font_size": 0.125, "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[models](id:17)	17	[ecosystem_server].[ecosystem_meta]	75d72afc-f94a-4b37-9b9c-633e8b6f73df	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.802798	2022-11-25 13:10:40.802805	72	GBM: Confusion Matrix	table	models_cm_gbm	pivot_table	{"adhoc_filters": [], "columns": ["b1"], "datasource": "22__table", "date_format": "smart_date", "extra_form_data": {}, "groupby": ["key"], "metrics": [{"aggregate": "MAX", "column": {"column_name": "value", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 66, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(value)", "optionName": "metric_nmc7z3509i_dpniqsszy7q", "sqlExpression": null}], "number_format": "SMART_NUMBER", "order_desc": false, "pandas_aggfunc": "sum", "pivot_margins": false, "row_limit": 10000, "slice_id": 45, "time_grain_sqla": "P1D", "time_range": "Last week", "url_params": {}, "viz_type": "pivot_table"}	35	35	\N	\N	[ecosystem_server].[models_cm_gbm](id:23)	23	[ecosystem_server].[ecosystem_meta]	8f02c489-588a-4014-b0d1-32b0d18e6b55	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.818477	2022-11-25 13:10:40.818486	73	GBM: Model Validation Details	table	models_scoring_history_gbm	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "values", "contributionMode": null, "datasource": "23__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "timestamp", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 500, "markerEnabled": false, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"column_name": "training_classification_error", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 48, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_classification_error)", "optionName": "metric_r20by7btclp_k85i9ygcy8o", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "validation_classification_error", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 52, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_classification_error)", "optionName": "metric_dse6bf1rans_5q2brag2a9r", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "smooth", "show_legend": true, "show_value": true, "slice_id": 46, "stack": true, "time_grain_sqla": null, "time_range": "No filter", "tooltipTimeFormat": "%Y-%m-%d %H:%M:%S", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_gbm](id:20)	20	[ecosystem_server].[ecosystem_meta]	ae1e3ef4-9080-4931-9f14-70ca1fbcfd59	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.833573	2022-11-25 13:10:40.83358	74	GBM: Logloss	table	models_scoring_history_gbm	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "23__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "timestamp", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": true, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"column_name": "validation_logloss", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 51, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(validation_logloss)", "optionName": "metric_sih6p582dh_yvx6vd7ks1e", "sqlExpression": null}, {"aggregate": "MAX", "column": {"column_name": "training_logloss", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 47, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(training_logloss)", "optionName": "metric_xnmrl2vnlyi_f8hmygde2vr", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_legend": true, "show_value": true, "slice_id": 47, "stack": true, "time_grain_sqla": null, "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[models_scoring_history_gbm](id:20)	20	[ecosystem_server].[ecosystem_meta]	39a860bd-8410-4c5f-b1b8-883f28192676	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.848281	2022-11-25 13:10:40.848288	75	GBM: Confusion Matrix Heatmap	table	models_cm_gbm	heatmap	{"adhoc_filters": [], "all_columns_x": "a", "all_columns_y": "b", "bottom_margin": "auto", "canvas_image_rendering": "pixelated", "datasource": "22__table", "extra_form_data": {}, "left_margin": "auto", "linear_color_scheme": "oranges", "metric": {"aggregate": "AVG", "column": {"column_name": "value", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 66, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "verbose_name": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "AVG(value)", "optionName": "metric_0jk1k4p2jqpd_7jnut2s35dj", "sqlExpression": null}, "normalize_across": "heatmap", "normalized": true, "row_limit": 10000, "show_legend": true, "show_perc": true, "show_values": true, "slice_id": 48, "sort_by_metric": false, "sort_x_axis": "alpha_asc", "sort_y_axis": "alpha_asc", "time_range": "No filter", "url_params": {}, "viz_type": "heatmap", "xscale_interval": null, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "yscale_interval": null}	35	35	\N	\N	[ecosystem_server].[models_cm_gbm](id:23)	23	[ecosystem_server].[ecosystem_meta]	b941551f-043d-4105-bc16-22178dca47e8	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.861459	2022-11-25 13:10:40.861475	76	GBM: Models	table	models_model_summary_gbm	table	{"adhoc_filters": [], "all_columns": ["model_identity", "create_date", "algo", "number_of_trees", "number_of_internal_trees", "model_size_in_bytes", "min_depth", "max_depth", "mean_depth", "min_leaves", "max_leaves", "mean_leaves", "model_category"], "color_pn": true, "datasource": "24__table", "extra_form_data": {}, "granularity_sqla": null, "groupby": [], "order_by_cols": ["[\\"model_identity\\", true]"], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "slice_id": 54, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_gbm](id:22)	22	[ecosystem_server].[ecosystem_meta]	1afae3fb-4e2f-4405-9479-088223747d0d	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.875231	2022-11-25 13:10:40.875238	77	GBM: Model Summary	table	models_model_summary_gbm	table	{"adhoc_filters": [], "all_columns": ["model_identity", "response_column_name", "model_category", "create_date"], "color_pn": true, "datasource": "24__table", "extra_form_data": {}, "groupby": [], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "slice_id": 57, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[models_model_summary_gbm](id:22)	22	[ecosystem_server].[ecosystem_meta]	16d663fe-98eb-46fa-98d3-c21333290a3c	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.890224	2022-11-25 13:10:40.890231	78	CPR: Count	table	ecosystemruntime_summary_logging	echarts_area	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "26__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "date_log", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": false, "markerSize": 6, "metrics": [{"aggregate": "SUM", "column": {"certification_details": null, "certified_by": null, "column_name": "count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 741, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "SUM(count)", "optionName": "metric_5coat916r6r_y9ziej5mxhh", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_legend": false, "show_value": true, "slice_id": 50, "stack": true, "time_grain_sqla": "PT1M", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_area", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	8774f1a1-af22-4c2d-b862-fa955f768d79	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.90513	2022-11-25 13:10:40.905137	79	CPR: Response Times	table	ecosystemruntime_summary_logging	echarts_timeseries	{"adhoc_filters": [], "annotation_layers": [], "area": true, "color_scheme": "supersetColors", "comparison_type": "values", "contributionMode": null, "datasource": "26__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "date_log", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": true, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "duration_avg", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 733, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(duration_avg)", "optionName": "metric_pc588xvkzce_51ozn4g9mc5", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_value": true, "slice_id": 51, "stack": true, "time_grain_sqla": "PT1M", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_timeseries", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	4045d509-87f1-4498-9691-fd885b09af71	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.920578	2022-11-25 13:10:40.920585	80	CPR: Model Performance	table	ecosystemruntime_summary_score	pivot_table_v2	{"adhoc_filters": [], "aggregateFunction": "Sum", "colOrder": "key_a_to_z", "datasource": "27__table", "date_format": "smart_date", "extra_form_data": {}, "granularity_sqla": "date_log", "groupbyColumns": ["model"], "groupbyRows": ["predictor"], "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "score_avg", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 757, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(score_avg)", "optionName": "metric_z8hx06cyqfs_byjktcc348f", "sqlExpression": null}], "metricsLayout": "COLUMNS", "order_desc": true, "rowOrder": "key_a_to_z", "row_limit": 10000, "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "valueFormat": "SMART_NUMBER", "viz_type": "pivot_table_v2"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_score](id:25)	25	[ecosystem_server].[logging]	7834f41c-826b-4bc5-b493-fbc7423f7d6c	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.936725	2022-11-25 13:10:40.936732	81	CPR: Response Scores	table	ecosystemruntime_summary_response	echarts_area	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "30__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "date_log", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerEnabled": false, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "response_score_avg", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 811, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(response_score_avg)", "optionName": "metric_58voxwlqrny_f6s8d9cxq06", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_legend": false, "show_value": true, "stack": true, "time_grain_sqla": "PT1M", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_area", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_response](id:26)	26	[ecosystem_server].[logging]	d9102712-e827-4f54-b0a1-e0c96641baf9	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.9513	2022-11-25 13:10:40.951306	82	CPR: Scores	table	ecosystemruntime_summary_score	echarts_area	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "27__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "date_log", "groupby": [], "label_colors": {}, "legendOrientation": "top", "legendType": "scroll", "limit": 100, "markerSize": 6, "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "score_avg", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 757, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(score_avg)", "optionName": "metric_23czfv7c8vpi_lxx812unpuj", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_legend": true, "show_value": true, "slice_id": 61, "stack": true, "time_grain_sqla": "PT1M", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "truncateYAxis": true, "url_params": {}, "viz_type": "echarts_area", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_score](id:25)	25	[ecosystem_server].[logging]	43534188-811d-43be-8cfb-70377bc08a7b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.965758	2022-11-25 13:10:40.965765	83	CPR: Count per Hour	table	ecosystemruntime_summary_logging	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "26__table", "date_format": "smart_date", "extra_form_data": {}, "granularity_sqla": "date_log", "groupby": ["hour_index"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "top", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 741, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(count)", "optionName": "metric_p3tbwmaskoh_97pu7roebt", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	4d7762c8-4ffc-4b01-bf08-cbdc2b2bfc36	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.980372	2022-11-25 13:10:40.98038	84	CPR: Predictor Summary	table	ecosystemruntime_summary_logging	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "26__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "granularity_sqla": "date_log", "groupby": ["predictor"], "innerRadius": 30, "label_line": false, "label_type": "key", "labels_outside": true, "legendOrientation": "left", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "predictor", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 743, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(predictor)", "optionName": "metric_3nghgt2anod_lx587dk1kc8", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "sort_by_metric": true, "time_range": "No filter", "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	8aa7f5b8-c44f-42b0-b5e8-6e2bae1c5d9e	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.79849	2022-11-25 13:10:42.798496	199	Collections: Failed Transactions by Status	table	collections_transactions_grouped_dashboard_rollup	pie	{"adhoc_filters": [{"expressionType": "SIMPLE", "subject": "ht10_sts_desc", "operator": "!=", "operatorId": "NOT_EQUALS", "comparator": "ACCEPTED", "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_hw3l5ezc7o6_rzkql3rvap"}], "applied_time_extras": {}, "datasource": "53__table", "viz_type": "pie", "metric": "count_transactions", "time_range": "No filter", "granularity_sqla": null, "groupby": ["ht10_sts_desc"]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	bb84b6a0-89d6-4bee-ad45-d1c3b425d6f2	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:40.996388	2022-11-25 13:10:40.996398	85	CPR: Predictor Total	table	ecosystemruntime_summary_logging	big_number_total	{"adhoc_filters": [], "datasource": "26__table", "extra_form_data": {}, "granularity_sqla": "date_log", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "predictor", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 743, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(predictor)", "optionName": "metric_3nghgt2anod_lx587dk1kc8", "sqlExpression": null}, "slice_id": 136, "subheader": "Predictors", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	19c725e8-6f65-43fb-86f8-e864b5dc9908	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.013658	2022-11-25 13:10:41.013666	86	CPR: Total Servers	table	ecosystemruntime_summary_logging	big_number_total	{"adhoc_filters": [], "datasource": "26__table", "extra_form_data": {}, "granularity_sqla": "date_log", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "server", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 744, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(server)", "optionName": "metric_3nghgt2anod_lx587dk1kc8", "sqlExpression": null}, "slice_id": 137, "subheader": "Servers", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	34340b40-8ba2-4c29-b724-1ed37ff32702	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.028999	2022-11-25 13:10:41.029007	87	CPR: Total Ports	table	ecosystemruntime_summary_logging	big_number_total	{"adhoc_filters": [], "datasource": "26__table", "extra_form_data": {}, "granularity_sqla": "date_log", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "port", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 745, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(port)", "optionName": "metric_3nghgt2anod_lx587dk1kc8", "sqlExpression": null}, "slice_id": 138, "subheader": "Ports", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	5de35387-11a1-4bc2-8f16-626c47b46716	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.041699	2022-11-25 13:10:41.041706	88	CPR: Total Aggregated Logs	table	ecosystemruntime_summary_logging	big_number_total	{"adhoc_filters": [], "datasource": "26__table", "extra_form_data": {}, "granularity_sqla": "date_log", "header_font_size": 0.3, "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "predictor", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 743, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(predictor)", "optionName": "metric_3nghgt2anod_lx587dk1kc8", "sqlExpression": null}, "subheader": "Aggregated Logs", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	bdf750fa-ab32-4dc1-8831-afe694d7f3d2	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.057195	2022-11-25 13:10:41.057243	89	CPR: Total Aggregated Responses	table	ecosystemruntime_summary_response	big_number_total	{"adhoc_filters": [], "datasource": "30__table", "extra_form_data": {}, "granularity_sqla": "date_log", "header_font_size": 0.3, "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "predictor", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 822, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(predictor)", "optionName": "metric_yhom4dxvyel_rhbffg30vr", "sqlExpression": null}, "subheader": "Aggregated Responses", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_response](id:26)	26	[ecosystem_server].[logging]	a0bec49f-c338-4e69-8245-ba57fe77f227	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.071563	2022-11-25 13:10:41.07157	90	CPR: Explore	table	ecosystemruntime_summary_score	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "27__table", "date_format": "smart_date", "extra_form_data": {}, "granularity_sqla": "date_log", "groupby": ["explore"], "innerRadius": 30, "label_type": "key_value_percent", "labels_outside": true, "legendOrientation": "top", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "explore", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 771, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(explore)", "optionName": "metric_t6vw7ja33b_wim7mf028u", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 100, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "slice_id": 141, "sort_by_metric": true, "time_range": "No filter", "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_score](id:25)	25	[ecosystem_server].[logging]	df5cff84-4d70-4e2e-a5f6-db5351c1a748	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.812918	2022-11-25 13:10:42.812946	200	Number of groups	table	collections_transactions_grouped_dashboard_rollup	big_number_total	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "metric": {"aggregate": "COUNT_DISTINCT", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "group_id", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2154, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(group_id)", "optionName": "metric_cmu14lm5xo8_zntre5di3gn", "sqlExpression": null}, "slice_id": 199, "subheader": "", "viz_type": "big_number_total"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	76c256aa-888b-4b60-8a39-f928dda92ae9	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.085577	2022-11-25 13:10:41.085584	91	CPR: Predictors	table	ecosystemruntime_summary_logging	dist_bar	{"adhoc_filters": [], "bar_stacked": false, "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "26__table", "extra_form_data": {}, "granularity_sqla": "date_log", "groupby": ["predictor"], "metrics": [{"aggregate": "SUM", "column": {"certification_details": null, "certified_by": null, "column_name": "count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 741, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "SUM(count)", "optionName": "metric_mm2yn3n25uc_olkfxeupv1n", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "show_bar_value": true, "show_controls": false, "show_legend": false, "time_range": "No filter", "viz_type": "dist_bar", "x_axis_label": "Predictors", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_label": "Number of Items Presented"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	46d7cbc0-d2d0-4811-9e10-2e82793fa235	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.101332	2022-11-25 13:10:41.101339	92	CPR: Total Count	table	ecosystemruntime_summary_logging	big_number_total	{"adhoc_filters": [], "datasource": "26__table", "extra_form_data": {}, "granularity_sqla": "date_log", "header_font_size": 0.3, "metric": {"aggregate": "SUM", "column": {"certification_details": null, "certified_by": null, "column_name": "count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 741, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "SUM(count)", "optionName": "metric_s823wo9ins_h7u1hi5skwl", "sqlExpression": null}, "subheader": "Total Count", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	24	[ecosystem_server].[logging]	836b9cd4-ff4f-4bb4-8abd-5c4451f2ab20	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.115623	2022-11-25 13:10:41.11563	93	Complaints: Company Product Graph	table	complaints	graph_chart	{"adhoc_filters": [], "baseEdgeWidth": 3, "baseNodeSize": 20, "color_scheme": "supersetColors", "datasource": "33__table", "draggable": true, "edgeLength": 400, "edgeSymbol": "none,arrow", "extra_form_data": {}, "friction": 0.2, "gravity": 0.3, "layout": "force", "legendOrientation": "top", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "product", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1403, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(product)", "optionName": "metric_x25rimxdhan_kv96m3mdzx", "sqlExpression": null}, "repulsion": 1000, "roam": true, "row_limit": 10000, "selectedMode": "single", "slice_id": 69, "source": "company", "target": "product", "time_range": "No filter", "url_params": {}, "viz_type": "graph_chart"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	987122d1-e7dc-4cb8-8ee6-81d8b67fabdd	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.128851	2022-11-25 13:10:41.128862	94	Complaints Company Product	table	complaints	table	{"adhoc_filters": [], "all_columns": ["company", "product", "sub-product"], "color_pn": true, "conditional_formatting": [], "datasource": "33__table", "extra_form_data": {}, "groupby": [], "include_search": true, "order_by_cols": ["[\\"company\\", true]", "[\\"product\\", true]"], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	736e4703-680b-4066-a967-8d517a28f060	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.142416	2022-11-25 13:10:41.142423	95	Complaint Issues	table	complaints	table	{"datasource": "33__table", "viz_type": "table", "slice_id": 71, "granularity_sqla": "date_received_date", "time_grain_sqla": "P1D", "time_range": "No filter", "query_mode": "raw", "groupby": [], "all_columns": ["company", "product", "issue"], "percent_metrics": [], "adhoc_filters": [], "order_by_cols": ["[\\"company\\", true]", "[\\"product\\", true]"], "row_limit": 10000, "server_page_length": 10, "order_desc": true, "table_timestamp_format": "smart_date", "include_search": true, "show_cell_bars": true, "color_pn": true, "conditional_formatting": [], "extra_form_data": {}, "dashboards": [10]}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	9a306103-e0e0-4faa-ac6d-d4cb8333d25d	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.156247	2022-11-25 13:10:41.156254	96	Complaints Company Product Totals	table	complaints	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "33__table", "extra_form_data": {}, "groupby": ["product"], "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "company", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1402, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(company)", "optionName": "metric_5yyd2lwlfop_0qphezywma6h", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "time_range": "No filter", "url_params": {}, "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	2ff688c2-9a40-4a34-b01e-a6efb6c503c1	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.170178	2022-11-25 13:10:41.170185	97	Complaints Company Sub-Product Totals	table	complaints	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "33__table", "extra_form_data": {}, "groupby": ["sub-product"], "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "company", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1402, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(company)", "optionName": "metric_5yyd2lwlfop_0qphezywma6h", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "time_range": "No filter", "url_params": {}, "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	545f8a14-74c4-4f48-a3ed-203789a5b63f	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.18548	2022-11-25 13:10:41.185488	98	Complaints Companies	table	complaints	big_number_total	{"adhoc_filters": [], "datasource": "33__table", "extra_form_data": {}, "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "company", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1402, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(company)", "optionName": "metric_auqhyfrvjzd_1cikhgehjht", "sqlExpression": null}, "slice_id": 74, "subheader": "Companies", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	679a0839-9cea-4ccc-9a48-3223ecdf6409	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.203009	2022-11-25 13:10:41.203016	99	Complaints Product Issues	table	complaints	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "33__table", "date_format": "smart_date", "extra_form_data": {}, "groupby": ["product"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "left", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "issue", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1405, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(issue)", "optionName": "metric_auqhyfrvjzd_1cikhgehjht", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 100, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "slice_id": 75, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	1ffb63a2-53dc-46e9-98ba-7ff64654119b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.218216	2022-11-25 13:10:41.218223	100	Complaints Total Products	table	complaints	big_number_total	{"adhoc_filters": [], "datasource": "33__table", "extra_form_data": {}, "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "product", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1403, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(product)", "optionName": "metric_0m0pwhvivln_rzpp17u6t0s", "sqlExpression": null}, "subheader": "Products", "subheader_font_size": 0.125, "time_format": "%d-%m-%Y %H:%M:%S", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	f5c37ac1-c9e2-4a7c-b997-793aab74fddb	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.235358	2022-11-25 13:10:41.235365	101	Complaints Issue Product Sankey	table	complaints	sankey	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "33__table", "extra_form_data": {}, "groupby": ["product", "issue"], "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "sub-product", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1376, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(sub-product)", "optionName": "metric_c64ps8pm31_23f4h0k1cr7", "sqlExpression": null}, "row_limit": 10000, "slice_id": 77, "time_range": "No filter", "url_params": {}, "viz_type": "sankey"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	f2b95aee-6731-40e2-b752-b2a405f45d2b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.249514	2022-11-25 13:10:41.249521	102	Product Issue Sunburst	table	complaints	sunburst	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "33__table", "extra_form_data": {}, "groupby": ["sub_issue", "issue", "sub-product", "product"], "linear_color_scheme": "superset_seq_1", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "issue", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1405, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(issue)", "optionName": "metric_ntylvy3tkib_3bkekrvccfo", "sqlExpression": null}, "row_limit": 10000, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "sunburst"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	5c512e6f-7ac3-45ad-8db4-ab85095fab3b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.263701	2022-11-25 13:10:41.263709	103	Complaints by Company Time	table	complaints	echarts_area	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "33__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "date_received_date", "groupby": [], "legendOrientation": "top", "legendType": "scroll", "markerSize": 6, "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "company", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1402, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(company)", "optionName": "metric_lzy7qq8keoj_9jdgortgcl4", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "slice_id": 79, "time_grain_sqla": "P1D", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "url_params": {}, "viz_type": "echarts_area", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title": "Number of Company Issues", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	9643a861-99af-4792-9726-5e22ab50b564	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.277747	2022-11-25 13:10:41.277762	104	Total Issues by Bank	table	complaints	table	{"adhoc_filters": [], "all_columns": ["company"], "color_pn": true, "conditional_formatting": [], "datasource": "33__table", "extra_form_data": {}, "granularity_sqla": "date_received_date", "groupby": ["company", "product"], "include_search": true, "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "issue", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1405, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(issue)", "optionName": "metric_36e4j0jwtdn_vwwh1uq5oln", "sqlExpression": null}], "order_by_cols": ["[\\"company\\", true]"], "order_desc": true, "percent_metrics": [], "query_mode": "aggregate", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "show_totals": false, "slice_id": 80, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	18c16c31-51e5-4446-a68d-a1d2aa01dfb2	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.292517	2022-11-25 13:10:41.292524	105	Total Issues by Bank Product	table	complaints	table	{"adhoc_filters": [], "all_columns": [], "color_pn": true, "conditional_formatting": [], "datasource": "33__table", "extra_form_data": {}, "granularity_sqla": "date_received_date", "groupby": ["company", "product"], "include_search": true, "metrics": [{"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "issue", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1405, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(issue)", "optionName": "metric_5tzk8ka34fh_wqhnkdhu9ji", "sqlExpression": null}], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "aggregate", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "slice_id": 81, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	47f00af3-b027-45fa-8249-f7c8926e4fc7	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.308593	2022-11-25 13:10:41.308601	106	Company Issue Summary	table	complaints	table	{"adhoc_filters": [], "all_columns": [], "color_pn": true, "conditional_formatting": [], "datasource": "33__table", "extra_form_data": {}, "granularity_sqla": "date_received_date", "groupby": ["company", "issue"], "include_search": true, "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "issue", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1405, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(issue)", "optionName": "metric_668qbtdk6zk_3bp9n3rd61a", "sqlExpression": null}], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "aggregate", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "slice_id": 82, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[complaints](id:27)	27	[ecosystem_server].[complaints]	8b5b630f-8c06-4dc3-b36d-219159c4f9ff	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.324601	2022-11-25 13:10:41.324608	107	USA Banks by Zip	table	zip_location_all	mapbox	{"datasource": "43__table", "viz_type": "mapbox", "slice_id": 156, "time_range": "No filter", "all_columns_x": "lng", "all_columns_y": "lat", "clustering_radius": "60", "row_limit": 10000, "adhoc_filters": [], "groupby": [], "point_radius": "Auto", "point_radius_unit": "Pixels", "mapbox_label": [], "pandas_aggfunc": "sum", "render_while_dragging": false, "mapbox_style": "mapbox://styles/mapbox/dark-v9", "global_opacity": 1, "mapbox_color": "rgb(0, 139, 139)", "viewport_longitude": -149.92290944995747, "viewport_latitude": 42.65355614497669, "viewport_zoom": 3.082070012542551, "extra_form_data": {}, "dashboards": [10]}	35	35	\N	\N	[ecosystem_server].[zip_location_all](id:28)	28	[ecosystem_server].[usa_banking]	7fb8553d-e714-402e-a9b8-647bf84ae4eb	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.339396	2022-11-25 13:10:41.339403	108	USA Banks Master List	table	zip_location_all	table	{"datasource": "43__table", "viz_type": "table", "slice_id": 157, "time_grain_sqla": "P1D", "time_range": "No filter", "query_mode": "aggregate", "groupby": ["name", "address", "city", "county", "stalp", "stname"], "metrics": [], "all_columns": ["name", "cbsa_metro_name", "city", "county", "stname", "address"], "percent_metrics": [], "adhoc_filters": [{"clause": "WHERE", "comparator": "1", "expressionType": "SIMPLE", "filterOptionName": "filter_uzyat0zoz9q_8xd3mygzfcx", "isExtra": false, "isNew": false, "operator": "==", "operatorId": "EQUALS", "sqlExpression": null, "subject": "mainoff"}], "timeseries_limit_metric": {"aggregate": "COUNT_DISTINCT", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "name", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1928, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(name)", "optionName": "metric_wakt2yf3yn_njhav3cm6i", "sqlExpression": null}, "order_by_cols": [], "row_limit": 10000, "server_page_length": 10, "order_desc": true, "table_timestamp_format": "smart_date", "include_search": true, "show_cell_bars": true, "align_pn": false, "color_pn": true, "allow_rearrange_columns": true, "conditional_formatting": [], "extra_form_data": {}, "dashboards": [10]}	35	35	\N	\N	[ecosystem_server].[zip_location_all](id:28)	28	[ecosystem_server].[usa_banking]	21b7fc8e-3ae6-465a-8d08-ee4b2a026c33	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.354374	2022-11-25 13:10:41.354381	109	Bank day activity	table	clickstream_journeys	echarts_timeseries_line	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "34__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "readable_date_date", "groupby": [], "legendOrientation": "top", "legendType": "scroll", "markerSize": 6, "metrics": [{"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "new_ucn", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1410, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(new_ucn)", "optionName": "metric_5l07q59tz42_fisfh4hyh8", "sqlExpression": null}], "only_total": true, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "time_grain_sqla": "P1D", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "url_params": {}, "viz_type": "echarts_timeseries_line", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left"}	35	35	\N	\N	[ecosystem_server].[clickstream_journeys](id:29)	29	[ecosystem_server].[bank_clickstream]	cd160bdc-b9d6-429b-911f-a42d423f65c7	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.370097	2022-11-25 13:10:41.370107	110	Bank Action Types	table	clickstream_journeys	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "34__table", "date_format": "smart_date", "extra_form_data": {}, "granularity_sqla": "readable_date", "groupby": ["action"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "top", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "action", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1412, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(action)", "optionName": "metric_j385i0xueg8_klrogllfl3a", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[clickstream_journeys](id:29)	29	[ecosystem_server].[bank_clickstream]	91455f80-c788-41c7-9dc5-76ddf5f16a04	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.385234	2022-11-25 13:10:41.385241	111	Bank Realuiid per Day	table	clickstream_journeys	big_number	{"adhoc_filters": [], "color_picker": {"a": 1, "b": 135, "g": 122, "r": 0}, "datasource": "34__table", "extra_form_data": {}, "granularity_sqla": "readable_date_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "realuiid", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1416, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(realuiid)", "optionName": "metric_2jjo3gxuh86_nc2kziaj7ff", "sqlExpression": null}, "rolling_type": "None", "show_trend_line": true, "start_y_axis_at_zero": true, "subheader_font_size": 0.15, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "big_number", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[clickstream_journeys](id:29)	29	[ecosystem_server].[bank_clickstream]	117e9aed-53e0-43e5-af60-29c1f36c21b2	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.399843	2022-11-25 13:10:41.39985	112	AQP Predicted Prepared	table	mixed_data	table	{"adhoc_filters": [], "all_columns": ["callid", "reason", "reason_1", "reason_2", "segmentcampaign", "agent_b5", "agent_mbti", "agentid", "userid"], "color_pn": true, "datasource": "35__table", "extra_form_data": {}, "groupby": [], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	ff2f9445-7e9c-4559-9f9e-dcbb2fbae2a1	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.415137	2022-11-25 13:10:41.415145	113	AQP Users	table	mixed_data	big_number_total	{"adhoc_filters": [], "datasource": "35__table", "extra_form_data": {}, "granularity_sqla": "max_date_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "userid", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1453, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(userid)", "optionName": "metric_8gq8nhgybei_cez4n6rgca", "sqlExpression": null}, "slice_id": 87, "subheader": "Users", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	2526e14a-3015-4afe-baf9-d303fccd8abf	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.428959	2022-11-25 13:10:41.428967	114	AQP Departments	table	mixed_data	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "35__table", "date_format": "smart_date", "extra_form_data": {}, "granularity_sqla": "max_date_date", "groupby": ["department"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "top", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "department", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1458, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(department)", "optionName": "metric_ffhrvsqy8c_92x9o7n0lka", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	b1eda9be-a6aa-4dd9-bf33-aa7aba474d68	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.443196	2022-11-25 13:10:41.443203	115	AQP All Users	table	mixed_data	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "35__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "granularity_sqla": "max_date_date", "groupby": ["userid"], "innerRadius": 30, "label_line": false, "label_type": "key", "labels_outside": true, "legendOrientation": "left", "legendType": "plain", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "userid", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1453, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(userid)", "optionName": "metric_1gqc79in77k_ve6039k127k", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "slice_id": 89, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	ffa56184-6fdd-445d-9b85-ba239587e411	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.743838	2022-11-25 13:10:41.743853	135	Just4U Options Count Max Alpha	table	just4u_options	big_number_total	{"adhoc_filters": [], "datasource": "36__table", "extra_form_data": {}, "header_font_size": 0.3, "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_pa934u9iyym_hiqh0qlu168", "sqlExpression": null}, "subheader": "Max Alpha", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	9c4904ef-59af-453f-91e9-28d604293f1f	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.45815	2022-11-25 13:10:41.458156	116	AQP Total Departments	table	mixed_data	big_number_total	{"adhoc_filters": [], "datasource": "35__table", "extra_form_data": {}, "granularity_sqla": "max_date_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "department", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1458, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(department)", "optionName": "metric_5d7lkhyeqht_h9l29yz6cvc", "sqlExpression": null}, "slice_id": 90, "subheader": "Departments", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	db2fb19d-6cfa-420e-a7fe-a4a31203deeb	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.472845	2022-11-25 13:10:41.472853	117	AQP Total Reasons	table	mixed_data	big_number_total	{"adhoc_filters": [], "datasource": "35__table", "extra_form_data": {}, "granularity_sqla": "max_date_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "reason", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1448, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(reason)", "optionName": "metric_zdrmmfpjq3s_csyprghxl5e", "sqlExpression": null}, "subheader": "Reasons", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	5e305a33-9f80-4bdd-ae76-6b922aa0518c	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.487066	2022-11-25 13:10:41.487073	118	AQP B5 Personality	table	mixed_data	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "35__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "granularity_sqla": "max_date_date", "groupby": ["agent_b5"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "left", "legendType": "plain", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "agent_b5", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1520, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(agent_b5)", "optionName": "metric_u90v3z2538_h2fypliadcg", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 100, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	c67f23ce-42db-4921-aa73-2291f9c30f19	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.505437	2022-11-25 13:10:41.505444	119	AQP MBTI Analysis	table	mixed_data	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "35__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "granularity_sqla": "max_date_date", "groupby": ["agent_mbti"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "left", "legendType": "plain", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "agent_mbti", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1521, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(agent_mbti)", "optionName": "metric_4qqw9fk1lkc_8y0xnz2rll", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "slice_id": 93, "sort_by_metric": true, "time_range": "No filter", "url_params": {}, "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	fadc5a1d-f408-4421-89e2-36006ac80835	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.520045	2022-11-25 13:10:41.520052	120	AQP Activity Over Time	table	mixed_data	echarts_timeseries_line	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "35__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "max_date_date", "groupby": [], "legendOrientation": "top", "legendType": "scroll", "markerSize": 6, "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "userid", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1453, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(userid)", "optionName": "metric_ot6yv1l4lnm_w7uvpegneb", "sqlExpression": null}], "only_total": true, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "time_grain_sqla": "P1D", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "url_params": {}, "viz_type": "echarts_timeseries_line", "x_axis_time_format": "smart_date", "x_axis_title": "Date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title": "User Activity", "y_axis_title_margin": 15, "y_axis_title_position": "Left"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	8841d49e-db4a-4702-b9f8-344c543dd8d2	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.535963	2022-11-25 13:10:41.535971	121	AQP Reasons Over Time	table	mixed_data	bar	{"adhoc_filters": [], "annotation_layers": [], "bar_stacked": true, "bottom_margin": "auto", "color_scheme": "supersetColors", "comparison_type": "values", "contribution": false, "datasource": "35__table", "extra_form_data": {}, "granularity_sqla": "max_date_date", "groupby": ["reason"], "left_margin": "auto", "line_interpolation": "linear", "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "reason", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1448, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(reason)", "optionName": "metric_eq2tqktx23d_zamomqd34x", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "rolling_type": "None", "row_limit": 10000, "show_bar_value": false, "show_brush": "yes", "show_legend": true, "time_grain_sqla": "P1M", "time_range": "No filter", "url_params": {}, "viz_type": "bar", "x_axis_format": "smart_date", "x_axis_label": "Months", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_label": "Reason Count"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	443fdeb8-814b-49d8-a9aa-a008717b8da0	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.550642	2022-11-25 13:10:41.550648	122	AQP Total Reasons 1	table	mixed_data	big_number_total	{"adhoc_filters": [], "datasource": "35__table", "extra_form_data": {}, "granularity_sqla": "max_date_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "reason_1", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1461, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(reason_1)", "optionName": "metric_orakiy49wy_2k9ogn4ky22", "sqlExpression": null}, "subheader": "Reason 1", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	f3f815f4-9e9a-443b-837f-85463b9d1feb	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.566277	2022-11-25 13:10:41.566284	123	AQP Total Days	table	mixed_data	big_number_total	{"adhoc_filters": [], "datasource": "35__table", "extra_form_data": {}, "granularity_sqla": "max_date_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "max_date_day_of_year", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1526, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(max_date_day_of_year)", "optionName": "metric_nj37hyutc9_etuqcbfw6q7", "sqlExpression": null}, "slice_id": 97, "subheader": "Total Days", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	c2b816a2-9314-48e8-a214-4fcc29eeaf09	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.58045	2022-11-25 13:10:41.580458	124	AQP Total Verbs	table	mixed_data	big_number_total	{"adhoc_filters": [], "datasource": "35__table", "extra_form_data": {}, "granularity_sqla": "max_date_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "agent_verb", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1506, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(agent_verb)", "optionName": "metric_jlpbmjb2l8_ihhv78u8o6s", "sqlExpression": null}, "subheader": "Verbs", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	15925e49-e6ea-4307-b783-efef61303072	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.595091	2022-11-25 13:10:41.5951	125	AQP Predictions	table	mixed_data	table	{"adhoc_filters": [], "all_columns": ["reason", "_prediction"], "color_pn": true, "datasource": "35__table", "extra_form_data": {}, "granularity_sqla": "max_date_date", "groupby": [], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "url_params": {}, "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	cbcefcb4-a0ee-409b-a151-5573e9e04b8f	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.608451	2022-11-25 13:10:41.608459	126	AQP Reason Network	table	mixed_data	graph_chart	{"adhoc_filters": [], "baseEdgeWidth": 3, "baseNodeSize": 20, "color_scheme": "d3Category20", "datasource": "35__table", "draggable": true, "edgeLength": 400, "edgeSymbol": "none,arrow", "extra_form_data": {}, "friction": 0.2, "granularity_sqla": "max_date_date", "gravity": 0.3, "layout": "force", "legendOrientation": "left", "legendType": "plain", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "_prediction", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1536, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(_prediction)", "optionName": "metric_1vae34fbfn2_359v56dmqd", "sqlExpression": null}, "repulsion": 1000, "roam": true, "row_limit": 10000, "selectedMode": "single", "show_legend": true, "slice_id": 100, "source": "userid", "target": "reason", "time_range": "No filter", "url_params": {}, "viz_type": "graph_chart"}	35	35	\N	\N	[ecosystem_server].[mixed_data](id:30)	30	[ecosystem_server].[automated_qa_prediction]	5eae7161-ba82-4404-9263-f8a66768ec84	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.622841	2022-11-25 13:10:41.622849	127	Just4U Options List	table	just4u_options	table	{"adhoc_filters": [], "all_columns": ["optionkey", "contextual_variable_one", "contextual_variable_two", "customer", "alpha", "beta", "option"], "color_pn": true, "datasource": "36__table", "extra_form_data": {}, "groupby": [], "order_by_cols": ["[\\"optionkey\\", true]", "[\\"contextual_variable_one\\", true]", "[\\"contextual_variable_two\\", true]", "[\\"alpha\\", true]", "[\\"beta\\", true]"], "order_desc": true, "percent_metrics": [], "query_mode": "raw", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "slice_id": 101, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	213d85ab-dcb1-4698-8017-2e0b0171a041	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.637713	2022-11-25 13:10:41.637738	128	Just4U Options Pivot by Offer	table	just4u_options	pivot_table	{"adhoc_filters": [], "columns": [], "datasource": "36__table", "date_format": "smart_date", "extra_form_data": {}, "groupby": ["optionkey"], "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_5c7c2rp7trr_h9yz93ulhcd", "sqlExpression": null}, {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "beta", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1544, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(beta)", "optionName": "metric_mye6k6bjnte_llzinlcfutk", "sqlExpression": null}, {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "contextual_variable_one", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1540, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(contextual_variable_one)", "optionName": "metric_shl1pozrvpg_7426rmtzey4", "sqlExpression": null}, {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "contextual_variable_two", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1541, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(contextual_variable_two)", "optionName": "metric_89c9l08izdr_9qn279isnoq", "sqlExpression": null}], "number_format": "SMART_NUMBER", "order_desc": true, "pandas_aggfunc": "sum", "pivot_margins": true, "row_limit": 10000, "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "pivot_table"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	2d7405c1-b6ed-4d68-9453-a9560fd1080e	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.653126	2022-11-25 13:10:41.653138	129	Just4U Options Variable One	table	just4u_options	box_plot	{"adhoc_filters": [], "color_scheme": "supersetColors", "columns": ["contextual_variable_one"], "datasource": "36__table", "date_format": "smart_date", "extra_form_data": {}, "groupby": ["optionkey"], "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_yodnkrh0gd_4qqnrcu2xx6", "sqlExpression": null}, {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "beta", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1544, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(beta)", "optionName": "metric_pr26zigcy5_xjn0qg9m17", "sqlExpression": null}], "number_format": "SMART_NUMBER", "slice_id": 103, "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "box_plot", "whiskerOptions": "Tukey", "x_axis_title": "Option Key (Offer)", "x_axis_title_margin": 15, "x_ticks_layout": "auto", "y_axis_title": "Max Alpha / Beta", "y_axis_title_margin": 15, "y_axis_title_position": "Left"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	c92e4e5f-42f1-473b-b07b-a36eac2f9b1a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.668291	2022-11-25 13:10:41.668327	130	Just4U Options Options Key (Offer)	table	just4u_options	box_plot	{"adhoc_filters": [], "color_scheme": "supersetColors", "columns": ["optionkey"], "datasource": "36__table", "date_format": "smart_date", "extra_form_data": {}, "groupby": ["contextual_variable_one", "contextual_variable_two"], "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_yodnkrh0gd_4qqnrcu2xx6", "sqlExpression": null}, {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "beta", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1544, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(beta)", "optionName": "metric_pr26zigcy5_xjn0qg9m17", "sqlExpression": null}], "number_format": "SMART_NUMBER", "slice_id": 104, "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "box_plot", "whiskerOptions": "Tukey", "x_axis_title": "Contextual Variable One", "x_axis_title_margin": 15, "x_ticks_layout": "auto", "y_axis_title": "Max Alpha / Beta", "y_axis_title_margin": 15, "y_axis_title_position": "Left"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	415a962b-6b66-4d14-92e3-56e79e9c8fbf	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.684077	2022-11-25 13:10:41.684085	131	Just4U Options Count	table	just4u_options	big_number_total	{"adhoc_filters": [], "datasource": "36__table", "extra_form_data": {}, "header_font_size": 0.3, "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "uuid", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1537, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(uuid)", "optionName": "metric_pa934u9iyym_hiqh0qlu168", "sqlExpression": null}, "subheader": "Options Count", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	dcb4702a-80bb-434d-aa7e-a0317df9534a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.699458	2022-11-25 13:10:41.699465	132	Just4U Options Count Options	table	just4u_options	big_number_total	{"adhoc_filters": [], "datasource": "36__table", "extra_form_data": {}, "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "optionkey", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1539, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(optionkey)", "optionName": "metric_pa934u9iyym_hiqh0qlu168", "sqlExpression": null}, "subheader": "Options", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	b5adc035-29af-4331-a7c6-0584c5605c81	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.716194	2022-11-25 13:10:41.716201	133	Just4U Options Count Variable One	table	just4u_options	big_number_total	{"adhoc_filters": [], "datasource": "36__table", "extra_form_data": {}, "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "contextual_variable_one", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1540, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(contextual_variable_one)", "optionName": "metric_pa934u9iyym_hiqh0qlu168", "sqlExpression": null}, "subheader": "Variable One", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	fe488b3a-e91d-42be-bc28-49e9b68b4f3a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.731051	2022-11-25 13:10:41.731059	134	Just4U Options Count Variable Two	table	just4u_options	big_number_total	{"adhoc_filters": [], "datasource": "36__table", "extra_form_data": {}, "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "contextual_variable_two", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1541, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(contextual_variable_two)", "optionName": "metric_pa934u9iyym_hiqh0qlu168", "sqlExpression": null}, "subheader": "Variable Two", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	964f3cea-f802-450f-908e-0148c04da23a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.758318	2022-11-25 13:10:41.758325	136	Just4U Options Count Max Beta	table	just4u_options	big_number_total	{"adhoc_filters": [], "datasource": "36__table", "extra_form_data": {}, "header_font_size": 0.3, "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "beta", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1544, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(beta)", "optionName": "metric_pa934u9iyym_hiqh0qlu168", "sqlExpression": null}, "subheader": "Max Beta", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	730001cd-fb61-475c-be8a-09247584224b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.774461	2022-11-25 13:10:41.774468	137	Just4U Options Variable Dependency Graph	table	just4u_options	graph_chart	{"adhoc_filters": [], "baseEdgeWidth": 3, "baseNodeSize": 20, "color_scheme": "supersetColors", "datasource": "36__table", "draggable": true, "edgeLength": 400, "edgeSymbol": "none,arrow", "extra_form_data": {}, "friction": 0.2, "gravity": 0.3, "layout": "force", "legendOrientation": "left", "legendType": "scroll", "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_pa934u9iyym_hiqh0qlu168", "sqlExpression": null}, "repulsion": 1000, "roam": true, "row_limit": 10000, "selectedMode": "single", "show_legend": true, "slice_id": 111, "source": "contextual_variable_two", "target": "contextual_variable_one", "time_range": "No filter", "viz_type": "graph_chart"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	00ade148-6e38-4ace-9467-516580aeb47d	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.789175	2022-11-25 13:10:41.789182	138	Just4U Options Variable Offer Alpha	table	just4u_options	sankey	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "36__table", "extra_form_data": {}, "groupby": ["contextual_variable_one", "optionkey"], "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_vh6a6gjk8gn_duixeltqdkp", "sqlExpression": null}, "row_limit": 10000, "time_range": "No filter", "viz_type": "sankey"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	6b2bccad-303c-4c45-8d95-055e125e986b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.804329	2022-11-25 13:10:41.804336	139	Just4U Options Variable Two Offer Alpha	table	just4u_options	sankey	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "36__table", "extra_form_data": {}, "groupby": ["contextual_variable_two", "optionkey"], "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_vh6a6gjk8gn_duixeltqdkp", "sqlExpression": null}, "row_limit": 10000, "time_range": "No filter", "viz_type": "sankey"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	8cb9a1c4-8eec-4157-b25b-8dc8d950ae33	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.82231	2022-11-25 13:10:41.822318	140	Just4U Options Variable One and Two	table	just4u_options	sankey	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "36__table", "extra_form_data": {}, "groupby": ["contextual_variable_two", "contextual_variable_one"], "metric": {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_vh6a6gjk8gn_duixeltqdkp", "sqlExpression": null}, "row_limit": 10000, "time_range": "No filter", "viz_type": "sankey"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	2324818e-efad-4ddf-abd6-74ef0f42112a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.837211	2022-11-25 13:10:41.837218	141	Just4U Options Offers Histogram	table	just4u_options	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "36__table", "extra_form_data": {}, "groupby": ["optionkey"], "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "optionkey", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1539, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(optionkey)", "optionName": "metric_v9r1x2rwzu_o9m0adfv3bh", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "show_bar_value": true, "show_legend": false, "time_range": "No filter", "viz_type": "dist_bar", "x_axis_label": "Offers", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_label": "Offers Presented"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	6572706b-24a1-4a2f-9396-c27e23e2c61a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.019369	2022-11-25 13:10:42.019377	153	Funds Updated User by Transactions Distribution	table	account_transaction	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "39__table", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "groupby": ["ttyp_description"], "metrics": [{"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "actr_last_updated_by", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1669, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(actr_last_updated_by)", "optionName": "metric_2cztjgacou9_8ob581n6b4q", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "time_range": "No filter", "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	64706e48-0b82-46b5-9fec-ec55ce842993	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.852082	2022-11-25 13:10:41.852089	142	Just4U Options Offers Alpha/Beta	table	just4u_options	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "contribution": false, "datasource": "36__table", "extra_form_data": {}, "groupby": ["optionkey"], "metrics": [{"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "alpha", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1543, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(alpha)", "optionName": "metric_v9r1x2rwzu_o9m0adfv3bh", "sqlExpression": null}, {"aggregate": "MAX", "column": {"certification_details": null, "certified_by": null, "column_name": "beta", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1544, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(beta)", "optionName": "metric_tecgd710m0g_w8mq64ep0ci", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "show_bar_value": true, "show_controls": false, "show_legend": true, "time_range": "No filter", "viz_type": "dist_bar", "x_axis_label": "Offers", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_label": "Offers Presented"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	787d821a-2cfd-4b07-ba27-86dfa8c6d8d3	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.868019	2022-11-25 13:10:41.868027	143	Just4U Options Variable One	table	just4u_options	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "36__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "groupby": ["contextual_variable_one"], "innerRadius": 30, "label_line": false, "label_type": "key", "labels_outside": true, "legendOrientation": "top", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "contextual_variable_one", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1540, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(contextual_variable_one)", "optionName": "metric_c6lxmz4k27_34neqpn7nzx", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "show_legend": false, "sort_by_metric": true, "time_range": "No filter", "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	829c6301-d791-4ed5-b40d-aa4b2c45673d	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.883332	2022-11-25 13:10:41.883339	144	Just4U Options Variable Two	table	just4u_options	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "36__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "groupby": ["contextual_variable_two"], "innerRadius": 30, "label_line": false, "label_type": "key", "labels_outside": true, "legendOrientation": "top", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "contextual_variable_one", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1540, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(contextual_variable_one)", "optionName": "metric_c6lxmz4k27_34neqpn7nzx", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "show_legend": false, "sort_by_metric": true, "time_range": "No filter", "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	54a681e6-db3a-432d-987e-291298ffece2	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.898046	2022-11-25 13:10:41.898053	145	Just4U Options Options Offers	table	just4u_options	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "36__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "groupby": ["optionkey"], "innerRadius": 30, "label_line": false, "label_type": "key", "labels_outside": true, "legendOrientation": "left", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "optionkey", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1539, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(optionkey)", "optionName": "metric_c6lxmz4k27_34neqpn7nzx", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "slice_id": 120, "sort_by_metric": true, "time_range": "No filter", "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[just4u_options](id:31)	31	[ecosystem_server].[telecommunications]	e82d5b19-8505-4325-afe1-0b9495356693	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.912983	2022-11-25 13:10:41.912991	146	Just4U Options Purchase Flag	table	just4u	dist_bar	{"adhoc_filters": [], "bar_stacked": true, "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "37__table", "extra_form_data": {}, "granularity_sqla": "date_offered", "groupby": ["presented_offer"], "metrics": [{"aggregate": "SUM", "column": {"certification_details": null, "certified_by": null, "column_name": "purchased_flag", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1554, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "SUM(purchased_flag)", "optionName": "metric_oabbvwsmabb_3cfczfx991l", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "show_bar_value": true, "time_range": "No filter", "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[just4u](id:32)	32	[ecosystem_server].[telecommunications]	6dd2b56b-e1f9-44ba-b883-89d135808f74	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.733237	2022-11-25 13:10:42.733244	195	Collections: Company by Day and Reason	table	collections_transactions_reason_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "54__table", "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_day", "metrics": ["count_ratio"], "groupby": ["ht03_rsn_desc_text"], "truncate_metric": false}	35	35	\N	\N	[ecosystem_server].[collections_transactions_reason_dashboard_rollup](id:40)	40	[ecosystem_server].[collections]	abdb627f-5b72-49ef-9c76-e892512c5ec0	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.753863	2022-11-25 13:10:42.753872	196	Collections: Transaction Volumes	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_year_month", "metrics": ["count_transactions"], "truncate_metric": false, "granularity_sqla": null}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	152ea059-9964-4c1f-90d4-a80fb4a10ba9	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.92594	2022-11-25 13:10:41.925946	147	Funds Transactions by Updated User (Org)	table	account_transaction_org	echarts_area	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "38__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "actr_last_updated_date", "groupby": ["actr_last_updated_by"], "legendMargin": 300, "legendOrientation": "left", "legendType": "scroll", "markerSize": 6, "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "ttyp_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1598, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(ttyp_description)", "optionName": "metric_8d8zuoqw26c_f5ijub9wgkk", "sqlExpression": null}], "only_total": true, "opacity": 0.2, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "seriesType": "line", "show_legend": true, "slice_id": 122, "time_grain_sqla": "P1D", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "viz_type": "echarts_area", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left"}	35	35	\N	\N	[ecosystem_server].[account_transaction_org](id:34)	34	[ecosystem_server].[funds]	28438710-906c-4272-88aa-8ed2251e5466	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.940947	2022-11-25 13:10:41.940953	148	Funds Transaction Types Totals	table	account_transaction	big_number	{"adhoc_filters": [], "color_picker": {"a": 1, "b": 135, "g": 122, "r": 0}, "datasource": "39__table", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "header_font_size": 0.4, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "ttyp_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1683, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(ttyp_description)", "optionName": "metric_whkbrj2d6ip_7jfk9e6cr1p", "sqlExpression": null}, "rolling_type": "None", "show_trend_line": true, "slice_id": 123, "start_y_axis_at_zero": true, "subheader_font_size": 0.15, "time_format": "smart_date", "time_grain_sqla": "P1M", "time_range": "No filter", "viz_type": "big_number", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	dbdd9964-5dc4-468f-910f-c88e1b61130b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.956101	2022-11-25 13:10:41.956108	149	Funds User Total	table	account_transaction	big_number	{"adhoc_filters": [], "color_picker": {"a": 1, "b": 135, "g": 122, "r": 0}, "datasource": "39__table", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "header_font_size": 0.4, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "actr_last_updated_by", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1669, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(actr_last_updated_by)", "optionName": "metric_whkbrj2d6ip_7jfk9e6cr1p", "sqlExpression": null}, "rolling_type": "None", "show_trend_line": true, "start_y_axis_at_zero": true, "subheader_font_size": 0.15, "time_format": "smart_date", "time_grain_sqla": "P1M", "time_range": "No filter", "viz_type": "big_number", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	28ab4f35-2d28-45bf-b997-2ea8aaaaaa56	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.971345	2022-11-25 13:10:41.971352	150	Funds Transaction Types	table	account_transaction	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "39__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "groupby": ["ttyp_description"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "left", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "ttyp_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1683, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(ttyp_description)", "optionName": "metric_teastkbw51_oi5elfg4p6n", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "sort_by_metric": true, "time_range": "No filter", "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	0038e063-d99e-4b49-a559-8f45ca839840	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:41.986153	2022-11-25 13:10:41.98616	151	Funds Users	table	account_transaction	pie	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "39__table", "date_format": "smart_date", "donut": true, "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "groupby": ["actr_last_updated_by"], "innerRadius": 30, "label_type": "key", "labels_outside": true, "legendOrientation": "left", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "actr_last_updated_by", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1669, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(actr_last_updated_by)", "optionName": "metric_teastkbw51_oi5elfg4p6n", "sqlExpression": null}, "number_format": "SMART_NUMBER", "outerRadius": 70, "row_limit": 10000, "show_labels": true, "show_labels_threshold": 5, "show_legend": true, "sort_by_metric": true, "time_range": "No filter", "viz_type": "pie"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	9261d85b-59e5-4a5d-bd5b-3c8052e29593	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.001232	2022-11-25 13:10:42.001252	152	Funds Transactions by Updated User Distribution	table	account_transaction	dist_bar	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "columns": [], "datasource": "39__table", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "groupby": ["actr_last_updated_by"], "metrics": [{"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "ttyp_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1683, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(ttyp_description)", "optionName": "metric_2cztjgacou9_8ob581n6b4q", "sqlExpression": null}], "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "time_range": "No filter", "viz_type": "dist_bar", "x_ticks_layout": "auto", "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	1a0849d8-c8d9-4852-b4eb-555e5bdc6fb7	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.033628	2022-11-25 13:10:42.033635	154	Funds User Transactions Network	table	account_transaction	graph_chart	{"adhoc_filters": [], "baseEdgeWidth": 3, "baseNodeSize": 20, "color_scheme": "supersetColors", "datasource": "39__table", "draggable": true, "edgeLength": 400, "edgeSymbol": "none,arrow", "extra_form_data": {}, "friction": 0.2, "granularity_sqla": "actr_last_updated_date", "gravity": 0.3, "layout": "force", "legendMargin": 300, "legendOrientation": "left", "legendType": "scroll", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "ttyp_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1683, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(ttyp_description)", "optionName": "metric_6bub1gjxrm2_vzr8pe4zsao", "sqlExpression": null}, "repulsion": 1000, "roam": true, "row_limit": 10000, "selectedMode": "single", "show_legend": true, "slice_id": 129, "source": "ttyp_description", "source_category": "ttyp_description", "target": "actr_last_updated_by", "time_range": "No filter", "viz_type": "graph_chart"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	90feb6e6-4f39-4255-813f-5a7ed6900bd5	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.053103	2022-11-25 13:10:42.05311	155	Funds Total Transactions	table	account_transaction	big_number_total	{"adhoc_filters": [], "datasource": "39__table", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1724, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(count)", "optionName": "metric_8qqyyv8ewdn_hyysv2eed1b", "sqlExpression": null}, "subheader": "Transactions", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	1c4f70f6-eb05-411d-bacf-c1e7ccbe02f9	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.068708	2022-11-25 13:10:42.068715	156	Funds Total Days	table	account_transaction	big_number_total	{"adhoc_filters": [], "datasource": "39__table", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "header_font_size": 0.3, "metric": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "actr_last_updated_date", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1684, "is_certified": false, "is_dttm": true, "python_date_format": null, "type": "VARCHAR", "type_generic": 2, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(actr_last_updated_date)", "optionName": "metric_8qqyyv8ewdn_hyysv2eed1b", "sqlExpression": null}, "subheader": "Days", "subheader_font_size": 0.125, "time_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	a9260809-1e8c-46a6-998a-54c7fbaa1d6d	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.08334	2022-11-25 13:10:42.083347	157	Funds Transaction Types Time Series	table	account_transaction	echarts_timeseries_bar	{"adhoc_filters": [], "annotation_layers": [], "color_scheme": "supersetColors", "comparison_type": "values", "datasource": "39__table", "extra_form_data": {}, "forecastInterval": 0.8, "forecastPeriods": 10, "granularity_sqla": "actr_last_updated_date", "groupby": ["ttyp_description"], "legendMargin": 400, "legendOrientation": "left", "legendType": "scroll", "markerEnabled": false, "markerSize": 6, "metrics": [{"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "ttyp_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1683, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(ttyp_description)", "optionName": "metric_13fvbq39fi2_gukg2dtu82i", "sqlExpression": null}], "only_total": true, "order_desc": true, "rich_tooltip": true, "row_limit": 10000, "show_legend": true, "stack": true, "time_grain_sqla": "P1D", "time_range": "No filter", "tooltipTimeFormat": "smart_date", "viz_type": "echarts_timeseries_bar", "x_axis_time_format": "smart_date", "x_axis_title_margin": 15, "y_axis_bounds": [null, null], "y_axis_format": "SMART_NUMBER", "y_axis_title_margin": 15, "y_axis_title_position": "Left", "zoomable": true}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	d95d3a20-137b-49dc-a80b-acd449dfe58b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.09814	2022-11-25 13:10:42.098148	158	Funds Word Cloud Transaction Types 	table	account_transaction	word_cloud	{"adhoc_filters": [], "color_scheme": "supersetColors", "datasource": "39__table", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "metric": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "ttyp_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1683, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(ttyp_description)", "optionName": "metric_02pqnx8qlr2t_dccbw1mcbzq", "sqlExpression": null}, "rotation": "flat", "row_limit": 10000, "series": "ttyp_description", "size_from": 10, "size_to": 70, "time_range": "No filter", "viz_type": "word_cloud"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	5ccbfa01-fd40-46f0-a54e-c0a838a5ed55	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.111066	2022-11-25 13:10:42.111078	159	Funds Events by Transaction Type and User	table	account_transaction	event_flow	{"adhoc_filters": [{"clause": "WHERE", "comparator": "\\"2021-07-01\\"", "expressionType": "SIMPLE", "filterOptionName": "filter_t2ig1cbsgj_c3tcmsfxegv", "isExtra": false, "isNew": false, "operator": ">", "operatorId": "GREATER_THAN", "sqlExpression": null, "subject": "actr_last_updated_date"}], "all_columns": ["actr_last_updated_by"], "all_columns_x": "ttyp_description", "datasource": "39__table", "entity": "actr_last_updated_by", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "min_leaf_node_event_count": 1, "order_by_entity": true, "row_limit": "2000", "slice_id": 134, "time_range": "No filter", "viz_type": "event_flow"}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	81b1ca45-c57c-416e-a486-86a3b2c3ff1a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.124468	2022-11-25 13:10:42.124475	160	Funds Top Types by Updated Bubble	table	account_transaction	bubble	{"adhoc_filters": [], "bottom_margin": "auto", "color_scheme": "supersetColors", "datasource": "39__table", "entity": "ttyp_description", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "left_margin": "auto", "limit": 500, "max_bubble_size": "75", "show_legend": false, "size": {"aggregate": "COUNT", "column": {"certification_details": null, "certified_by": null, "column_name": "ttyp_description", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1683, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(ttyp_description)", "optionName": "metric_aik799hoeqp_swl8olssgc8", "sqlExpression": null}, "slice_id": 142, "time_range": "No filter", "viz_type": "bubble", "x": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "actr_last_updated_year_month", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1703, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(actr_last_updated_year_mo...", "optionName": "metric_uxvlgg5d62m_boy2ud5ry5o", "sqlExpression": null}, "x_axis_format": "~g", "x_axis_label": "Year Month", "x_axis_showminmax": true, "x_log_scale": false, "x_ticks_layout": "auto", "y": {"aggregate": "COUNT_DISTINCT", "column": {"certification_details": null, "certified_by": null, "column_name": "actr_last_updated_by", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1669, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT_DISTINCT(actr_last_updated_by)", "optionName": "metric_ca8ru43povt_lkdc4vn9lke", "sqlExpression": null}, "y_axis_bounds": [null, null], "y_axis_format": "~g", "y_axis_label": "Updated By", "y_axis_showminmax": true, "y_log_scale": false}	35	35	\N	\N	[ecosystem_server].[account_transaction](id:33)	33	[ecosystem_server].[funds]	357b8de0-3a76-45c8-ae9a-1030852fa261	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.139938	2022-11-25 13:10:42.139945	161	Funds Events by User and Transaction Type	table	account_transaction_org	event_flow	{"adhoc_filters": [{"clause": "WHERE", "comparator": "\\"2021-07-01\\"", "expressionType": "SIMPLE", "filterOptionName": "filter_hsqxtf6dqfc_nanvss77jpn", "isExtra": false, "isNew": false, "operator": ">", "operatorId": "GREATER_THAN", "sqlExpression": null, "subject": "actr_last_updated_date"}], "all_columns": [], "all_columns_x": "actr_last_updated_by", "datasource": "38__table", "entity": "ttyp_description", "extra_form_data": {}, "granularity_sqla": "actr_last_updated_date", "min_leaf_node_event_count": 1, "order_by_entity": true, "row_limit": "3000", "slice_id": 143, "time_range": "No filter", "viz_type": "event_flow"}	35	35	\N	\N	[ecosystem_server].[account_transaction_org](id:34)	34	[ecosystem_server].[funds]	03468f39-2eff-44c5-bba6-3b332f08483d	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.154628	2022-11-25 13:10:42.154635	162	Collections: Debit Order Data	table	collections_transactions	table	{"datasource": "48__table", "viz_type": "table", "slice_id": 146, "granularity_sqla": "ht03_actn_d_date", "time_grain_sqla": null, "time_range": "No filter", "query_mode": "raw", "groupby": [], "all_columns": ["ht03_clnt_id", "abbreviated_short_name", "ht03_nmntd_ac_num", "ht03_nmntd_ac_m", "ht03_dest_ac_h_num", "ht03_dest_ac_h_m", "ht03_sts_cde", "ht10_sts_desc", "ht03_actn_d_date", "ht03_pmt_a"], "percent_metrics": [], "adhoc_filters": [], "order_by_cols": [], "row_limit": 50000, "server_page_length": 10, "order_desc": true, "table_timestamp_format": "smart_date", "page_length": 200, "include_search": true, "show_cell_bars": true, "color_pn": true, "allow_rearrange_columns": true, "column_config": {"ht03_clnt_id": {"showCellBars": false}, "ht03_dest_ac_h_num": {"showCellBars": false}, "ht03_nmntd_ac_num": {"showCellBars": false}, "ht03_sts_cde": {"showCellBars": false}}, "conditional_formatting": [], "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions](id:37)	37	[ecosystem_server].[collections]	430570d6-47e1-4d0d-bd07-200c37411da4	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.169318	2022-11-25 13:10:42.169325	163	Collections: Status Nominated Graph	table	collections_transactions_s0_code	graph_chart	{"datasource": "50__table", "viz_type": "graph_chart", "slice_id": 171, "granularity_sqla": "ht03_actn_d_year_month_date", "time_range": "No filter", "source": "ht03_sts_cde", "target": "ht03_dest_ac_h_m", "metric": "count", "source_category": "ht03_clnt_id", "target_category": "ht03_nmntd_ac_m", "adhoc_filters": [], "row_limit": 1000, "color_scheme": "supersetColors", "show_legend": true, "legendType": "scroll", "legendOrientation": "left", "legendMargin": 400, "layout": "force", "edgeSymbol": "none,arrow", "draggable": true, "roam": true, "selectedMode": "single", "baseNodeSize": 20, "baseEdgeWidth": 3, "edgeLength": 400, "gravity": 0.3, "repulsion": 1000, "friction": 0.2, "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s0_code](id:36)	36	[ecosystem_server].[collections]	39f3faff-dda0-4a89-beb3-a353fb897bfb	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.184618	2022-11-25 13:10:42.184625	164	Collections: Accounts	table	collections_transactions_s0_code	pie	{"datasource": "50__table", "viz_type": "pie", "time_range": "No filter", "groupby": ["ht03_nmntd_ac_m"], "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_nmntd_ac_m", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2059, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(ht03_nmntd_ac_m)", "optionName": "metric_cziiifdlsyk_ccaknaz8zdq"}, "adhoc_filters": [], "row_limit": 10000, "sort_by_metric": true, "color_scheme": "supersetColors", "show_labels_threshold": 5, "show_legend": true, "legendType": "scroll", "legendOrientation": "left", "legendMargin": 200, "label_type": "key", "number_format": "SMART_NUMBER", "date_format": "smart_date", "show_labels": true, "labels_outside": true, "label_line": false, "show_total": false, "outerRadius": 71, "donut": true, "innerRadius": 30, "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s0_code](id:36)	36	[ecosystem_server].[collections]	0b2dbfb3-f615-4d24-a0a7-740410dfeb5b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.199923	2022-11-25 13:10:42.19993	165	Collections: Total Destination Accounts	table	collections_transactions_s0_code	big_number_total	{"datasource": "50__table", "viz_type": "big_number_total", "time_range": "No filter", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_dest_ac_h_m", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2055, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(ht03_dest_ac_h_m)", "optionName": "metric_uxt1astplzc_bnlry7rvn"}, "adhoc_filters": [], "subheader": "Destination Accounts", "header_font_size": 0.3, "subheader_font_size": 0.125, "y_axis_format": "SMART_NUMBER", "time_format": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s0_code](id:36)	36	[ecosystem_server].[collections]	3e367f5c-4b35-434d-9450-91e5e4334ecf	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.216659	2022-11-25 13:10:42.216665	166	Collections: Total Nominated Accounts	table	collections_transactions_s0_code	big_number_total	{"datasource": "50__table", "viz_type": "big_number_total", "time_range": "No filter", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_nmntd_ac_m", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2059, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(ht03_nmntd_ac_m)", "optionName": "metric_jusm2tku0r_iscc0412r4j"}, "adhoc_filters": [], "subheader": "Nominated Accounts", "header_font_size": 0.3, "subheader_font_size": 0.125, "y_axis_format": "SMART_NUMBER", "time_format": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s0_code](id:36)	36	[ecosystem_server].[collections]	409f6ed2-1396-42f6-b6fa-ccf06a743120	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.231641	2022-11-25 13:10:42.231648	167	Collections: Total Amount Processed	table	collections_transactions_s0_code	big_number_total	{"datasource": "50__table", "viz_type": "big_number_total", "time_range": "No filter", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "amount", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2056, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "FLOAT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "SUM", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "SUM(amount)", "optionName": "metric_ojej3f0j2l_4bn176ngfc4"}, "adhoc_filters": [], "subheader": "Total Amount Processed", "header_font_size": 0.3, "subheader_font_size": 0.125, "y_axis_format": "SMART_NUMBER", "time_format": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s0_code](id:36)	36	[ecosystem_server].[collections]	7ec11d57-643a-4296-8bd3-d022a9b78cf7	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.246251	2022-11-25 13:10:42.246259	168	Collections: Nominated Accounts > 100 Transactions	table	collections_transactions_s0_code	funnel	{"datasource": "50__table", "viz_type": "funnel", "time_range": "No filter", "groupby": ["ht03_nmntd_ac_m"], "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_nmntd_ac_num", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2058, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT(ht03_nmntd_ac_num)", "optionName": "metric_ruqhiho0vs8_t0ul39b6ghg"}, "adhoc_filters": [{"expressionType": "SIMPLE", "subject": "count", "operator": ">", "operatorId": "GREATER_THAN", "comparator": "100", "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_qsjl0i71zm_jj4fxcggs"}], "row_limit": 50, "sort_by_metric": true, "color_scheme": "supersetColors", "show_legend": true, "legendOrientation": "top", "number_format": "SMART_NUMBER", "show_labels": true, "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s0_code](id:36)	36	[ecosystem_server].[collections]	d985f82b-040c-418d-909d-81023f1ad5b8	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.259766	2022-11-25 13:10:42.259773	169	Collections: Total by Status	table	collections_transactions_s0_code	pie	{"datasource": "50__table", "viz_type": "pie", "slice_id": 177, "time_range": "No filter", "groupby": ["ht10_sts_desc"], "metric": {"aggregate": "COUNT", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_sts_cde", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2057, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "COUNT(ht03_sts_cde)", "optionName": "metric_8mwyoz92msx_vruwvx91brm", "sqlExpression": null}, "adhoc_filters": [], "row_limit": 10000, "sort_by_metric": true, "color_scheme": "supersetColors", "show_labels_threshold": 5, "show_legend": true, "legendType": "scroll", "legendOrientation": "left", "label_type": "key", "number_format": "SMART_NUMBER", "date_format": "smart_date", "show_labels": true, "labels_outside": true, "label_line": false, "show_total": true, "outerRadius": 70, "donut": true, "innerRadius": 30, "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s0_code](id:36)	36	[ecosystem_server].[collections]	a57f3c0a-7482-47ea-a0ed-a568b048f2f2	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.275733	2022-11-25 13:10:42.27574	170	Collections: Amount Paid Monthly Trend	table	collections_transactions_dashboard_rollup	echarts_timeseries_bar	{"datasource": "51__table", "viz_type": "echarts_timeseries_bar", "slice_id": 178, "granularity_sqla": null, "time_range": "No filter", "x_axis": "ht03_actn_d_month", "time_grain_sqla": "P1D", "metrics": ["amount_ratio"], "groupby": ["ht10_sts_desc"], "adhoc_filters": [], "timeseries_limit_metric": [], "row_limit": 10000, "truncate_metric": true, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "orientation": "vertical", "x_axis_title_margin": 15, "y_axis_title_margin": 15, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "only_total": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_dashboard_rollup](id:35)	35	[ecosystem_server].[collections]	03bf1771-356a-481a-a383-456c3025aad6	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.290454	2022-11-25 13:10:42.290461	171	Collections: Amount Paid 2022	table	collections_transactions_dashboard_rollup	echarts_timeseries_bar	{"datasource": "51__table", "viz_type": "echarts_timeseries_bar", "time_range": "No filter", "x_axis": "ht03_actn_d_year_month", "time_grain_sqla": "P1D", "metrics": ["amount_ratio"], "groupby": ["ht10_sts_desc"], "adhoc_filters": [{"expressionType": "SIMPLE", "subject": "ht03_actn_d_year", "operator": "==", "operatorId": "EQUALS", "comparator": "2022", "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_6a07ra8i0lb_rxum5fnnmx"}], "timeseries_limit_metric": [], "row_limit": 10000, "truncate_metric": true, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "orientation": "vertical", "x_axis_title_margin": 15, "y_axis_title_margin": 15, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "only_total": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_dashboard_rollup](id:35)	35	[ecosystem_server].[collections]	10d2b591-e056-4175-865d-521a2b24d030	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.305512	2022-11-25 13:10:42.305518	172	Collections: Transaction Count Monthly Trend	table	collections_transactions_dashboard_rollup	echarts_timeseries_bar	{"datasource": "51__table", "viz_type": "echarts_timeseries_bar", "time_range": "No filter", "x_axis": "ht03_actn_d_month", "time_grain_sqla": "P1D", "metrics": ["count_ratio"], "groupby": ["ht10_sts_desc"], "adhoc_filters": [], "timeseries_limit_metric": [], "row_limit": 10000, "truncate_metric": true, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "orientation": "vertical", "x_axis_title_margin": 15, "y_axis_title_margin": 15, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "only_total": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_dashboard_rollup](id:35)	35	[ecosystem_server].[collections]	5b6971f4-7d00-4d92-bd05-401a4ac842ad	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.323714	2022-11-25 13:10:42.323721	173	Collections: Transaction Count 2022	table	collections_transactions_dashboard_rollup	echarts_timeseries_bar	{"datasource": "51__table", "viz_type": "echarts_timeseries_bar", "time_range": "No filter", "x_axis": "ht03_actn_d_year_month", "time_grain_sqla": "P1D", "metrics": ["count_ratio"], "groupby": ["ht10_sts_desc"], "adhoc_filters": [{"expressionType": "SIMPLE", "subject": "ht03_actn_d_year", "operator": "==", "operatorId": "EQUALS", "comparator": "2022", "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_o36o14gkmd_1i1izcrydenh"}], "timeseries_limit_metric": [], "row_limit": 10000, "truncate_metric": true, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "orientation": "vertical", "x_axis_title_margin": 15, "y_axis_title_margin": 15, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "only_total": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_dashboard_rollup](id:35)	35	[ecosystem_server].[collections]	80c2d403-b25f-41e2-82bc-eef004fdbe8b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.339594	2022-11-25 13:10:42.3396	174	Collections: Total Clients	table	collections_transactions_s_code	big_number_total	{"datasource": "52__table", "viz_type": "big_number_total", "time_range": "No filter", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_clnt_id", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2121, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(ht03_clnt_id)", "optionName": "metric_7dji4pb29gd_rqlrimuckao"}, "adhoc_filters": [], "subheader": "Clients", "header_font_size": 0.3, "subheader_font_size": 0.125, "y_axis_format": "SMART_NUMBER", "time_format": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s_code](id:38)	38	[ecosystem_server].[collections]	a09c05b4-fbc1-4073-ba31-8d779c26732b	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.354039	2022-11-25 13:10:42.354046	175	Collections: Total Destinations	table	collections_transactions_s_code	big_number_total	{"datasource": "52__table", "viz_type": "big_number_total", "slice_id": 183, "time_range": "No filter", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_dest_ac_h_num", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2131, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(ht03_dest_ac_h_num)", "optionName": "metric_7dji4pb29gd_rqlrimuckao"}, "adhoc_filters": [], "subheader": "Destination", "header_font_size": 0.3, "subheader_font_size": 0.125, "y_axis_format": "SMART_NUMBER", "time_format": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s_code](id:38)	38	[ecosystem_server].[collections]	90d93555-7b78-4b0a-aad2-bf216cd56e8c	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.368715	2022-11-25 13:10:42.368722	176	Collections: Total Nominated	table	collections_transactions_s_code	big_number_total	{"datasource": "52__table", "viz_type": "big_number_total", "slice_id": 183, "time_range": "No filter", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_nmntd_ac_num", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2128, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(ht03_nmntd_ac_num)", "optionName": "metric_7dji4pb29gd_rqlrimuckao"}, "adhoc_filters": [], "subheader": "Nominated", "header_font_size": 0.3, "subheader_font_size": 0.125, "y_axis_format": "SMART_NUMBER", "time_format": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s_code](id:38)	38	[ecosystem_server].[collections]	b6705c15-8e58-4f77-a676-a07d13a04726	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.383026	2022-11-25 13:10:42.383034	177	Collections: Total Short Name	table	collections_transactions_s_code	big_number_total	{"datasource": "52__table", "viz_type": "big_number_total", "slice_id": 184, "time_range": "No filter", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "abbreviated_short_name", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2124, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(abbreviated_short_name)", "optionName": "metric_7dji4pb29gd_rqlrimuckao"}, "adhoc_filters": [], "subheader": "Short Name", "header_font_size": 0.3, "subheader_font_size": 0.125, "y_axis_format": "SMART_NUMBER", "time_format": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s_code](id:38)	38	[ecosystem_server].[collections]	be7f9c25-eb23-4330-84c6-608dceb1338a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.397436	2022-11-25 13:10:42.397443	178	Collections: Summary List Short	table	collections_transactions_s_code	table	{"datasource": "52__table", "viz_type": "table", "time_grain_sqla": "P1D", "time_range": "No filter", "query_mode": "raw", "groupby": [], "all_columns": ["ht03_clnt_id", "ht03_nmntd_ac_m", "abbreviated_short_name", "ht03_dest_ac_h_m", "ht03_sts_cde", "amount", "count"], "percent_metrics": [], "adhoc_filters": [], "order_by_cols": [], "row_limit": 1000, "server_page_length": 10, "order_desc": true, "table_timestamp_format": "smart_date", "show_cell_bars": true, "color_pn": true, "column_config": {"ht03_clnt_id": {"showCellBars": false}, "ht03_sts_cde": {"showCellBars": false}}, "conditional_formatting": [], "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s_code](id:38)	38	[ecosystem_server].[collections]	87724e34-9c52-4047-b3ea-42def95a73ad	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.769263	2022-11-25 13:10:42.769269	197	Collections: Accepted Volumes	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [{"expressionType": "SIMPLE", "subject": "ht10_sts_desc", "operator": "==", "operatorId": "EQUALS", "comparator": "ACCEPTED", "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_ztafmfw8i0b_94jte9f4cok"}], "applied_time_extras": {}, "datasource": "53__table", "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_month", "truncate_metric": false, "metrics": ["count_transactions"]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	1addaaec-7cfe-4533-b01c-363f381831cf	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.413052	2022-11-25 13:10:42.41306	179	Collections: Transactions Status TimeSeries	table	collections_transactions_s_code	echarts_area	{"datasource": "52__table", "viz_type": "echarts_area", "slice_id": 187, "granularity_sqla": "ht03_actn_d_year_month_date", "time_range": "No filter", "x_axis": "ht03_actn_d_year_month_date", "time_grain_sqla": "P1M", "metrics": [{"aggregate": "SUM", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2130, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "SUM(count)", "optionName": "metric_x8nq79avqz_gwbysb02slv", "sqlExpression": null}], "groupby": ["ht03_sts_cde"], "adhoc_filters": [], "order_desc": true, "row_limit": 10000, "truncate_metric": true, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "x_axis_title": "Date", "x_axis_title_margin": 15, "y_axis_title": "Transaction Count per Status", "y_axis_title_margin": 50, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "seriesType": "line", "opacity": 0.2, "show_value": true, "only_total": true, "markerSize": 6, "zoomable": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_s_code](id:38)	38	[ecosystem_server].[collections]	cba80fed-8f04-4d1e-ac5b-214c6b5916d4	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.426612	2022-11-25 13:10:42.426619	180	Collections: Company By Week of Month	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "groupby": ["ht10_sts_desc"], "metrics": ["amount_ratio"], "slice_id": 188, "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_week_of_month"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	83cdd465-d1ab-47af-ad3a-470989399357	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.440464	2022-11-25 13:10:42.44047	181	Collections: Company By Day of Week	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "groupby": ["ht10_sts_desc"], "metrics": ["amount_ratio"], "slice_id": 189, "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_day_of_week", "granularity_sqla": null}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	af2a48f9-97a7-4d5b-af58-bee2cc56cdd1	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.45524	2022-11-25 13:10:42.455247	182	Collections: Company By Week and Day	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "groupby": ["ht10_sts_desc"], "metrics": ["amount_ratio"], "slice_id": 190, "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_week_and_day"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	cd9d474f-fba4-4fa0-bcf3-bab529ec8fe0	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.469716	2022-11-25 13:10:42.469723	183	Collections: Company By Month	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "groupby": ["ht10_sts_desc"], "metrics": ["amount_ratio"], "slice_id": 191, "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_month"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	c3682731-ff40-46b2-86ec-95553807e568	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.484934	2022-11-25 13:10:42.484941	184	Collections: Company By Day of Month	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "groupby": ["ht10_sts_desc"], "metrics": ["amount_ratio"], "slice_id": 192, "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_day"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	262afbcd-079a-4872-83c3-034a3cd58cb6	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.500493	2022-11-25 13:10:42.5005	185	Collections: Reason Description by Bank	table	collections_transactions_reason_dashboard_rollup	treemap_v2	{"datasource": "54__table", "viz_type": "treemap_v2", "time_range": "No filter", "groupby": ["bank_name", "ht03_rsn_desc_text"], "metric": "count_transactions", "row_limit": 10000, "adhoc_filters": [], "color_scheme": "supersetColors", "show_labels": true, "show_upper_labels": true, "label_type": "key_value", "number_format": "SMART_NUMBER", "date_format": "smart_date", "extra_form_data": {}, "dashboards": [15]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_reason_dashboard_rollup](id:40)	40	[ecosystem_server].[collections]	a809c03e-a5fc-4ec1-aae7-32ba62927e03	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.516871	2022-11-25 13:10:42.516878	186	Average Take Up	table	experiment_details_dashboard	echarts_timeseries_bar	{"datasource": "44__table", "viz_type": "echarts_timeseries_bar", "granularity_sqla": "date", "time_range": "No filter", "x_axis": "offer", "time_grain_sqla": "P1D", "metrics": [{"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "take_up", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1947, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "AVG", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "AVG(take_up)", "optionName": "metric_x0hevlkcrym_ubu8ba8622p"}], "groupby": ["metric_value"], "adhoc_filters": [], "timeseries_limit_metric": [], "row_limit": 50000, "truncate_metric": true, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "orientation": "vertical", "x_axis_title_margin": 15, "y_axis_title_margin": 15, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "only_total": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "extra_form_data": {}, "dashboards": [16]}	35	35	\N	\N	[ecosystem_server].[experiment_details_dashboard](id:41)	41	[ecosystem_server].[logging]	bb62aafa-b396-42c7-a22e-57824071fcc5	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.783818	2022-11-25 13:10:42.783825	198	Collections: Transaction Volume by Bank	table	collections_transactions_grouped_dashboard_rollup	pie	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "viz_type": "pie", "groupby": ["bank_name"], "metric": "count_transactions", "donut": true}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	b659c4f7-29b2-41ab-ba77-3f5cec720467	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.53311	2022-11-25 13:10:42.533128	187	Interaction Count	table	experiment_details_dashboard	echarts_timeseries_bar	{"datasource": "44__table", "viz_type": "echarts_timeseries_bar", "granularity_sqla": "date", "time_range": "No filter", "x_axis": "offer", "time_grain_sqla": "P1D", "metrics": ["count"], "groupby": ["metric_value"], "adhoc_filters": [], "timeseries_limit_metric": [], "row_limit": 50000, "truncate_metric": true, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "orientation": "vertical", "x_axis_title_margin": 15, "y_axis_title_margin": 15, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "only_total": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "extra_form_data": {}, "dashboards": [16]}	35	35	\N	\N	[ecosystem_server].[experiment_details_dashboard](id:41)	41	[ecosystem_server].[logging]	a929dcbd-06a3-44e5-a2bd-271992bff0a6	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.558016	2022-11-25 13:10:42.558027	188	Additional Data Distribution	table	experiment_details_dashboard	pie	{"datasource": "44__table", "viz_type": "pie", "slice_id": 161, "granularity_sqla": "date", "time_range": "No filter", "groupby": ["metric_value"], "metric": "count", "adhoc_filters": [], "row_limit": 10000, "sort_by_metric": false, "color_scheme": "supersetColors", "show_labels_threshold": 5, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "label_type": "key", "number_format": "SMART_NUMBER", "date_format": "smart_date", "show_labels": true, "labels_outside": true, "outerRadius": 70, "donut": true, "innerRadius": 30, "extra_form_data": {}, "dashboards": [16]}	35	35	\N	\N	[ecosystem_server].[experiment_details_dashboard](id:41)	41	[ecosystem_server].[logging]	83652cf6-6ee1-4585-9521-92b3f81a34e8	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.579021	2022-11-25 13:10:42.579029	189	Take Up Rate	table	experiment_details_dashboard	table	{"datasource": "44__table", "viz_type": "table", "granularity_sqla": "date", "time_grain_sqla": "P1D", "time_range": "No filter", "query_mode": "aggregate", "groupby": ["metric_value"], "metrics": ["avg_take_up"], "all_columns": [], "percent_metrics": [], "adhoc_filters": [], "order_by_cols": [], "row_limit": 1000, "server_page_length": 10, "order_desc": true, "table_timestamp_format": "smart_date", "show_cell_bars": true, "color_pn": true, "allow_rearrange_columns": true, "column_config": {"avg_take_up": {"d3NumberFormat": ",.1%", "d3SmallNumberFormat": ",.1%"}}, "conditional_formatting": [], "extra_form_data": {}, "dashboards": [16]}	35	35	\N	\N	[ecosystem_server].[experiment_details_dashboard](id:41)	41	[ecosystem_server].[logging]	db254f70-de0d-4368-9067-089f878f9386	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.605834	2022-11-25 13:10:42.605842	190	No. of Other Experiments Customers are Influenced By	table	experiment_customers_dashboard	echarts_timeseries_line	{"datasource": "45__table", "viz_type": "echarts_timeseries_line", "slice_id": 163, "granularity_sqla": "date", "time_range": "No filter", "x_axis": "date", "time_grain_sqla": "P1D", "metrics": ["count"], "groupby": ["experiment_count"], "adhoc_filters": [], "order_desc": true, "row_limit": 10000, "truncate_metric": true, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "x_axis_title": "Date", "x_axis_title_margin": 50, "y_axis_title": "Number of customers", "y_axis_title_margin": 50, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "seriesType": "line", "only_total": true, "opacity": 0.2, "markerSize": 6, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "%Y-%m-%d", "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "extra_form_data": {}, "dashboards": [16]}	35	35	\N	\N	[ecosystem_server].[experiment_customers_dashboard](id:42)	42	[ecosystem_server].[logging]	30cc928e-f351-46b6-a9d8-d570d66562de	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.626464	2022-11-25 13:10:42.626474	191	Customers Influenced By Multiple Experiments	table	experiment_interactions_dashboard	graph_chart	{"datasource": "46__table", "viz_type": "graph_chart", "slice_id": 164, "granularity_sqla": "start_date", "time_range": "No filter", "source": "experiment_count_display", "target": "experiment", "metric": "count", "target_category": "experiment", "adhoc_filters": [], "row_limit": 10000, "color_scheme": "supersetColors", "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "layout": "force", "edgeSymbol": "none,none", "draggable": true, "roam": true, "selectedMode": "single", "baseNodeSize": 20, "baseEdgeWidth": 3, "edgeLength": 400, "gravity": 0.3, "repulsion": 500, "friction": 0.2, "extra_form_data": {}, "dashboards": [17]}	35	35	\N	\N	[ecosystem_server].[experiment_interactions_dashboard](id:43)	43	[ecosystem_server].[logging]	b9bfc0a9-87af-474e-a537-5e723baaa536	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.65366	2022-11-25 13:10:42.65369	192	No. of Experiments Running Daily Over The Last Month	table	experiment_calendar_dashboard	cal_heatmap	{"datasource": "47__table", "viz_type": "cal_heatmap", "slice_id": 165, "granularity_sqla": "start_date", "time_range": "Last month", "domain_granularity": "month", "subdomain_granularity": "day", "metrics": [{"aggregate": "MAX", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "experiment_count", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 1966, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "expressionType": "SIMPLE", "hasCustomLabel": false, "isNew": false, "label": "MAX(experiment_count)", "optionName": "metric_e15v245vi94_0pb2sdyzpof", "sqlExpression": null}], "adhoc_filters": [], "linear_color_scheme": "schemeYlOrRd", "cell_size": 30, "cell_padding": 2, "steps": 10, "y_axis_format": "SMART_NUMBER", "x_axis_time_format": "smart_date", "show_legend": true, "show_metric_name": false, "extra_form_data": {}, "dashboards": [17]}	35	35	\N	\N	[ecosystem_server].[experiment_calendar_dashboard](id:44)	44	[ecosystem_server].[logging]	ac2d8e69-e7a6-4f44-a196-210a84a3a80e	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.676206	2022-11-25 13:10:42.676213	193	Experiments Run	table	experiment_interactions_dashboard	table	{"adhoc_filters": [], "all_columns": [], "applied_time_extras": {}, "color_pn": true, "dashboards": [17], "datasource": "46__table", "granularity_sqla": "start_date", "groupby": ["experiment"], "metrics": ["interaction_sum", "customer_count"], "order_by_cols": [], "order_desc": true, "percent_metrics": [], "query_mode": "aggregate", "row_limit": 10000, "server_page_length": 10, "show_cell_bars": true, "show_totals": false, "slice_id": 166, "table_timestamp_format": "smart_date", "time_grain_sqla": "P1D", "time_range": "No filter", "viz_type": "table"}	35	35	\N	\N	[ecosystem_server].[experiment_interactions_dashboard](id:43)	43	[ecosystem_server].[logging]	b1782467-3c4f-429c-94c6-bde4b2dd8e23	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.708105	2022-11-25 13:10:42.708113	194	Collections: Company by Month and Reason	table	collections_transactions_reason_dashboard_rollup	echarts_timeseries_bar	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "54__table", "viz_type": "echarts_timeseries_bar", "x_axis": "ht03_actn_d_month", "metrics": ["count_ratio"], "groupby": ["ht03_rsn_desc_text"], "truncate_metric": false}	35	35	\N	\N	[ecosystem_server].[collections_transactions_reason_dashboard_rollup](id:40)	40	[ecosystem_server].[collections]	9a602656-0d6f-46f3-aa35-79e1200e37a3	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.827426	2022-11-25 13:10:42.827442	201	Number of client ids	table	collections_transactions_grouped_dashboard_rollup	big_number_total	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_clnt_id", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2142, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "BIGINT", "type_generic": 0, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(ht03_clnt_id)", "optionName": "metric_cmu14lm5xo8_zntre5di3gn"}, "slice_id": 199, "subheader": "", "viz_type": "big_number_total"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	c4653bd2-5d27-4530-ab84-53ea56e6a664	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.842344	2022-11-25 13:10:42.842351	202	Number of short names	table	collections_transactions_grouped_dashboard_rollup	big_number_total	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "abbreviated_short_name_v_two", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2148, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(abbreviated_short_name_v_...", "optionName": "metric_swnt1te0s6s_px9us76cuv"}, "slice_id": 200, "subheader": "", "viz_type": "big_number_total"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	f199b454-7af8-480b-828c-b199bd9d1908	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.85756	2022-11-25 13:10:42.857567	203	Number of nominated accounts	table	collections_transactions_grouped_dashboard_rollup	big_number_total	{"adhoc_filters": [], "applied_time_extras": {}, "datasource": "53__table", "metric": {"expressionType": "SIMPLE", "column": {"advanced_data_type": null, "certification_details": null, "certified_by": null, "column_name": "ht03_nmntd_ac_m", "description": null, "expression": null, "filterable": true, "groupby": true, "id": 2147, "is_certified": false, "is_dttm": false, "python_date_format": null, "type": "VARCHAR", "type_generic": 1, "verbose_name": null, "warning_markdown": null}, "aggregate": "COUNT_DISTINCT", "sqlExpression": null, "isNew": false, "hasCustomLabel": false, "label": "COUNT_DISTINCT(ht03_nmntd_ac_m)", "optionName": "metric_5fxbsf4tmvr_yyui8oy2jh"}, "slice_id": 201, "subheader": "", "viz_type": "big_number_total"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	cf124170-dc89-47b4-b84f-501bb674ab84	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.872337	2022-11-25 13:10:42.872345	204	% of Transactions Successful	table	collections_transactions_grouped_dashboard_rollup	big_number_total	{"adhoc_filters": [{"expressionType": "SIMPLE", "subject": "ht10_sts_desc", "operator": "==", "operatorId": "EQUALS", "comparator": "ACCEPTED", "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_msa71v9jz29_z0hqsndsr4"}], "applied_time_extras": {}, "datasource": "53__table", "viz_type": "big_number_total", "metric": "count_ratio", "y_axis_format": ",.1%"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	0458e755-5f1a-4e10-8200-021b19d4ff70	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.887032	2022-11-25 13:10:42.887039	205	First Month Transactions	table	collections_transactions_grouped_dashboard_rollup	big_number_total	{"adhoc_filters": [{"expressionType": "SIMPLE", "subject": "ht03_actn_d_month", "operator": "==", "operatorId": "EQUALS", "comparator": "5", "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_7wpc3ea07_ctzu7jo2p6c"}], "applied_time_extras": {}, "datasource": "53__table", "metric": "count_transactions", "slice_id": 203, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	4e5c72d0-439a-4df9-a840-02706b955e8a	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.90293	2022-11-25 13:10:42.902937	206	Last Month Transactions	table	collections_transactions_grouped_dashboard_rollup	big_number_total	{"adhoc_filters": [{"expressionType": "SIMPLE", "subject": "ht03_actn_d_month", "operator": "==", "operatorId": "EQUALS", "comparator": "8", "clause": "WHERE", "sqlExpression": null, "isExtra": false, "isNew": false, "filterOptionName": "filter_7wpc3ea07_ctzu7jo2p6c"}], "applied_time_extras": {}, "datasource": "53__table", "metric": "count_transactions", "slice_id": 204, "viz_type": "big_number_total", "y_axis_format": "SMART_NUMBER"}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	5bf1ce4b-6902-4014-a696-de859238c6bc	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.91747	2022-11-25 13:10:42.917477	207	Collections: Transaction Volumes by Group	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"datasource": "53__table", "viz_type": "echarts_timeseries_bar", "slice_id": 195, "granularity_sqla": null, "time_range": "No filter", "x_axis": "ht03_actn_d_year_month", "time_grain_sqla": "P1D", "metrics": ["count_transactions"], "groupby": ["group_id"], "adhoc_filters": [], "timeseries_limit_metric": [], "row_limit": 10000, "truncate_metric": false, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "orientation": "vertical", "x_axis_title_margin": 15, "y_axis_title_margin": 15, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "only_total": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "extra_form_data": {}, "dashboards": [18]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	193e330e-307a-4a8b-a4ae-cfd36d698383	\N	\N	\N	\N	\N	f	\N
2022-11-25 13:10:42.937029	2022-11-25 13:10:42.937035	208	Collections: Accepted Volumes by Group	table	collections_transactions_grouped_dashboard_rollup	echarts_timeseries_bar	{"datasource": "53__table", "viz_type": "echarts_timeseries_bar", "slice_id": 196, "time_range": "No filter", "x_axis": "ht03_actn_d_month", "time_grain_sqla": "P1D", "metrics": ["count_transactions"], "groupby": ["group_id"], "adhoc_filters": [{"clause": "WHERE", "comparator": "ACCEPTED", "expressionType": "SIMPLE", "filterOptionName": "filter_ztafmfw8i0b_94jte9f4cok", "isExtra": false, "isNew": false, "operator": "==", "operatorId": "EQUALS", "sqlExpression": null, "subject": "ht10_sts_desc"}], "timeseries_limit_metric": [], "row_limit": 10000, "truncate_metric": false, "show_empty_columns": true, "comparison_type": "values", "annotation_layers": [], "forecastPeriods": 10, "forecastInterval": 0.8, "orientation": "vertical", "x_axis_title_margin": 15, "y_axis_title_margin": 15, "y_axis_title_position": "Left", "color_scheme": "supersetColors", "only_total": true, "show_legend": true, "legendType": "scroll", "legendOrientation": "top", "x_axis_time_format": "smart_date", "y_axis_format": "SMART_NUMBER", "y_axis_bounds": [null, null], "rich_tooltip": true, "tooltipTimeFormat": "smart_date", "extra_form_data": {}, "dashboards": [18]}	35	35	\N	\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	39	[ecosystem_server].[collections]	ae137048-7d3e-4b40-9919-a30c0c08e666	\N	\N	\N	\N	\N	f	\N
\.


--
-- Data for Name: sql_metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sql_metrics (created_on, changed_on, id, metric_name, verbose_name, metric_type, table_id, expression, description, created_by_fk, changed_by_fk, d3format, warning_text, extra, uuid) FROM stdin;
2022-11-25 13:08:38.994149	2022-11-25 13:08:38.994155	12	count	COUNT(*)	\N	8	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": null}	24bf5686-0fed-440b-a799-5be1bbfce1e9
2022-11-25 13:08:42.384151	2022-11-25 13:08:42.384158	13	count	COUNT(*)	count	9	COUNT(*)	\N	35	35	\N	\N	\N	19f98e16-ecdc-41b1-8a92-745710960a9d
2022-11-25 13:08:45.374998	2022-11-25 13:08:45.375005	14	count	COUNT(*)	\N	10	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": null}	7d71d9fe-380f-4507-bf3a-a59707b8bc9e
2022-11-25 13:08:48.464758	2022-11-25 13:08:48.464768	15	count	COUNT(*)	\N	11	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": null}	c6506876-a922-4812-b5b8-d19b055144f8
2022-11-25 13:08:51.547978	2022-11-25 13:08:51.547993	16	count	COUNT(*)	count	12	COUNT(*)	\N	35	35	\N	\N	\N	8db0c42b-24f6-46d7-93e5-dbb87178ae79
2022-11-25 13:08:54.521571	2022-11-25 13:08:54.521586	17	count	COUNT(*)	count	13	COUNT(*)	\N	35	35	\N	\N	\N	eaf1e4b4-1087-445c-a8aa-875bec6f03a7
2022-11-25 13:08:57.511686	2022-11-25 13:08:57.511692	18	count	COUNT(*)	\N	14	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	3e9a9757-5db7-40c6-9e31-829e3742ec8d
2022-11-25 13:09:00.584857	2022-11-25 13:09:00.584864	19	count	COUNT(*)	count	15	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	136676e3-3527-446c-a804-9d92fc72f1ad
2022-11-25 13:09:06.09787	2022-11-25 13:09:06.097876	20	count	COUNT(*)	count	16	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	18577534-feb6-4748-ba99-7cc54452200e
2022-11-25 13:09:09.155056	2022-11-25 13:09:09.155062	21	count	COUNT(*)	\N	17	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": null}	abe1c07a-49d8-40f8-a8da-fd7373ceb401
2022-11-25 13:09:12.183822	2022-11-25 13:09:12.18383	22	count	COUNT(*)	\N	18	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": null}	69ade010-aa8f-4f4d-8152-586ce462afa6
2022-11-25 13:09:15.18466	2022-11-25 13:09:15.184666	23	count	COUNT(*)	\N	19	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	b93b58dc-9a5b-4f4a-97f1-42f5a4601184
2022-11-25 13:09:18.212436	2022-11-25 13:09:18.212446	24	count	COUNT(*)	\N	20	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": null}	5fb21ab3-aa25-4ac7-9a4f-381c463262d8
2022-11-25 13:09:21.358996	2022-11-25 13:09:21.35901	25	count	COUNT(*)	\N	21	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": null}	d23aa3f1-bb42-479b-8862-73dd241bf60c
2022-11-25 13:09:24.380619	2022-11-25 13:09:24.380627	26	count	COUNT(*)	\N	22	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	127e9f96-74ea-427a-9e70-2cebceef5a73
2022-11-25 13:09:27.454445	2022-11-25 13:09:27.454453	27	count	COUNT(*)	count	23	COUNT(*)	\N	35	35	\N	\N	\N	6a30057b-d756-479c-8fed-50faa35f728a
2022-11-25 13:09:30.470563	2022-11-25 13:09:30.470568	28	count	COUNT(*)	count	24	COUNT(*)	\N	35	35	\N	\N	{}	ef70066f-b104-4b8b-abc5-e540591a1859
2022-11-25 13:09:33.589918	2022-11-25 13:09:33.589924	29	count	COUNT(*)	count	25	COUNT(*)	\N	35	35	\N	\N	\N	f1f67756-abb5-454d-b7aa-60b8b2e4d32f
2022-11-25 13:09:36.715316	2022-11-25 13:09:36.715321	30	count	COUNT(*)	count	26	COUNT(*)	\N	35	35	\N	\N	\N	ac967036-f938-448e-8bd0-83cd3d859da2
2022-11-25 13:09:39.798474	2022-11-25 13:09:39.79848	31	count	COUNT(*)	\N	27	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	4febc75d-fa10-4836-8b0b-02680da3a8ab
2022-11-25 13:09:42.988791	2022-11-25 13:09:42.988797	32	count	COUNT(*)	count	28	COUNT(*)	\N	35	35	\N	\N	\N	ef0de811-f778-41fb-b961-03311683b2b8
2022-11-25 13:09:46.129465	2022-11-25 13:09:46.129472	33	count	COUNT(*)	\N	29	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	64a2bdf7-c55e-4276-bad4-e3f9cae533b7
2022-11-25 13:09:49.331953	2022-11-25 13:09:49.33196	34	count	COUNT(*)	\N	30	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	248a910c-cb26-448f-ba5e-ae73b0706de5
2022-11-25 13:09:52.758159	2022-11-25 13:09:52.758166	35	count	COUNT(*)	count	31	COUNT(*)	\N	35	35	\N	\N	\N	dfc8be35-1f31-4a03-9c52-dd9392540bbb
2022-11-25 13:09:55.898467	2022-11-25 13:09:55.898475	36	count	COUNT(*)	\N	32	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	fd61780c-017f-4a56-a03e-93d74cef1020
2022-11-25 13:09:58.956179	2022-11-25 13:09:58.956187	37	count	COUNT(*)	count	33	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	1a393b7f-8c9f-4328-9408-7bf2716f6755
2022-11-25 13:10:02.301945	2022-11-25 13:10:02.301951	38	count	COUNT(*)	count	34	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	1e4d2b90-667d-435a-bbb6-39cc12d215ca
2022-11-25 13:10:05.835789	2022-11-25 13:10:05.835796	39	count_ratio	Number of Transactions	\N	35	SUM(number_of_transactions)/SUM(total_number_of_transactions)	\N	35	35	\N	\N	{}	cace35c0-b020-43ee-8b3c-8c64f1c76a80
2022-11-25 13:10:05.840729	2022-11-25 13:10:05.840736	40	amount_ratio	Transaction Amount	\N	35	SUM(transaction_amount)/SUM(total_transaction_amount)	\N	35	35	\N	\N	{"warning_markdown": ""}	a759bff5-c3e4-49fa-809e-8db81171f3de
2022-11-25 13:10:05.849167	2022-11-25 13:10:05.849174	41	count	COUNT(*)	\N	35	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	3b16d825-8f36-4270-a22f-04acc2db8dde
2022-11-25 13:10:08.933986	2022-11-25 13:10:08.933992	42	count	COUNT(*)	\N	36	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	42dea49a-f153-4785-8aa2-22f681484298
2022-11-25 13:10:11.982571	2022-11-25 13:10:11.982578	43	count	COUNT(*)	\N	37	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	1490d9fe-1621-4926-a371-2979406e56c1
2022-11-25 13:10:15.616758	2022-11-25 13:10:15.616765	44	count	COUNT(*)	\N	38	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	661756f7-733b-4b1f-976e-59cc24d37cfe
2022-11-25 13:10:18.673856	2022-11-25 13:10:18.673862	45	count_transactions	Sum of Transaction Count	\N	39	SUM(number_of_transactions)	\N	35	35	\N	\N	{}	eadd58f0-4c8a-4bbf-9a9f-b4322f799419
2022-11-25 13:10:18.681314	2022-11-25 13:10:18.68132	46	count_ratio	Number of Transactions	\N	39	SUM(number_of_transactions)/SUM(total_number_of_transactions)	\N	35	35	\N	\N	{"warning_markdown": ""}	9b452943-c851-4989-ad48-db580b59b572
2022-11-25 13:10:18.686478	2022-11-25 13:10:18.686484	47	amount_ratio	Transaction Amount	\N	39	SUM(transaction_amount)/SUM(total_transaction_amount)	\N	35	35	\N	\N	{"warning_markdown": ""}	363f699d-dbab-445c-8350-6a26c7b9fdd0
2022-11-25 13:10:18.691115	2022-11-25 13:10:18.691121	48	count	COUNT(*)	\N	39	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	4013ffef-1d71-4244-87ba-3d6cff4423a6
2022-11-25 13:10:21.786081	2022-11-25 13:10:21.786087	49	count_transactions	Sum of Transaction Count	\N	40	SUM(number_of_transactions)	\N	35	35	\N	\N	{}	6fc6c5ed-0f5a-4175-99b4-359d2fb4a1fd
2022-11-25 13:10:21.790884	2022-11-25 13:10:21.79089	50	count_ratio	Number of Transactions	\N	40	SUM(number_of_transactions)/SUM(total_number_of_transactions)	\N	35	35	\N	\N	{"warning_markdown": ""}	feda4f5b-3834-4b78-9290-993d6b64bc46
2022-11-25 13:10:21.797216	2022-11-25 13:10:21.797223	51	count	COUNT(*)	\N	40	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	50bf0b1d-502f-43f2-990d-5a4515bcb9a4
2022-11-25 13:10:24.920876	2022-11-25 13:10:24.920883	52	avg_take_up	Take Up	\N	41	AVG(take_up)	\N	35	35	\N	\N	{"warning_markdown": ""}	e2824327-6622-45b1-826a-ef5a443a2356
2022-11-25 13:10:24.926301	2022-11-25 13:10:24.926308	53	count	COUNT(*)	\N	41	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	8f4bd49e-5eb0-4aa8-8a63-4e9099a41501
2022-11-25 13:10:27.9825	2022-11-25 13:10:27.982507	54	max_exp_count	Number of Experiments	\N	42	MAX(experiment_count)	\N	35	35	\N	\N	{"warning_markdown": ""}	de7bb0bb-a1fc-4110-9157-b9538e3000d2
2022-11-25 13:10:27.987577	2022-11-25 13:10:27.987584	55	count	COUNT(*)	\N	42	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	296ce33e-2bf9-410a-b1ae-6d02dd7a799c
2022-11-25 13:10:31.0122	2022-11-25 13:10:31.012209	56	customer_count	Unique Customers	\N	43	COUNT(*)	\N	35	35	\N	\N	{}	12cec23d-10ec-4be7-90e7-6c8db632d587
2022-11-25 13:10:31.018525	2022-11-25 13:10:31.018534	57	interaction_sum	Total Interactions	\N	43	SUM(experiment_interactions)	\N	35	35	\N	\N	{}	43bc45ed-9ab2-433d-b610-a55c1c9b2abf
2022-11-25 13:10:31.034081	2022-11-25 13:10:31.034089	58	count	COUNT(*)	\N	43	COUNT(*)	\N	35	35	\N	\N	{}	9cf3517c-f3cd-4416-bc44-387e22192d7a
2022-11-25 13:10:34.062374	2022-11-25 13:10:34.062382	59	count	COUNT(*)	\N	44	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	adcc3e12-3dff-4476-8751-c8de788d9427
2022-11-25 13:10:37.042466	2022-11-25 13:10:37.042473	60	count	COUNT(*)	count	45	COUNT(*)	\N	35	35	\N	\N	{"warning_markdown": ""}	f5d8c2ce-e762-495f-a942-27896fa7e5a1
\.


--
-- Data for Name: sql_observations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sql_observations (id, dttm, alert_id, value, error_msg) FROM stdin;
\.


--
-- Data for Name: sqlatable_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sqlatable_user (id, user_id, table_id) FROM stdin;
8	35	8
9	35	9
10	35	10
11	35	11
12	35	12
13	35	13
14	35	14
15	35	15
16	35	16
17	35	17
18	35	18
19	35	19
20	35	20
21	35	21
22	35	22
23	35	23
24	35	24
25	35	25
26	35	26
27	35	27
28	35	28
29	35	29
30	35	30
31	35	31
32	35	32
33	35	33
34	35	34
35	35	35
36	35	36
37	35	37
38	35	38
39	35	39
40	35	40
41	35	41
42	35	42
43	35	43
44	35	44
45	35	45
\.


--
-- Data for Name: tab_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tab_state (created_on, changed_on, extra_json, id, user_id, label, active, database_id, schema, sql, query_limit, latest_query_id, autorun, template_params, created_by_fk, changed_by_fk, hide_left_bar, saved_query_id) FROM stdin;
2022-11-25 13:06:25.987762	2022-11-25 13:06:25.987772	{}	1	35	Untitled Query 1	t	\N	\N	SELECT ...	1000	\N	f	\N	35	35	f	\N
\.


--
-- Data for Name: table_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.table_columns (created_on, changed_on, id, table_id, column_name, is_dttm, is_active, type, groupby, filterable, description, created_by_fk, changed_by_fk, expression, verbose_name, python_date_format, uuid, extra, advanced_data_type) FROM stdin;
2022-11-25 13:08:39.000191	2022-11-25 13:08:39.000197	104	8	validation_r2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3a620c93-1065-4882-811f-6c3e27cf855d	\N	\N
2022-11-25 13:08:39.009286	2022-11-25 13:08:39.009296	105	8	training_r2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8f83c9f9-f4ca-47a1-9898-2154833d3e3d	\N	\N
2022-11-25 13:08:39.01541	2022-11-25 13:08:39.015415	106	8	validation_classification_error	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	21a444a5-e754-4adb-8760-c5c08f8b9dd5	\N	\N
2022-11-25 13:08:39.020164	2022-11-25 13:08:39.020169	107	8	training_classification_error	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b62f3921-0eab-4227-9b75-be417b04ca47	\N	\N
2022-11-25 13:08:39.026361	2022-11-25 13:08:39.026368	108	8	validation_pr_auc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e982f0bb-d421-43a5-b9c4-b57e514a981a	\N	\N
2022-11-25 13:08:39.031379	2022-11-25 13:08:39.031385	109	8	training_pr_auc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1d5c0143-9186-4984-b482-789595b87075	\N	\N
2022-11-25 13:08:39.036336	2022-11-25 13:08:39.036342	110	8	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	431c1795-7147-4bf1-8125-d0f26ab8a747	\N	\N
2022-11-25 13:08:39.042126	2022-11-25 13:08:39.042137	111	8	validation_auc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6b6478db-a50e-4f6d-9a9b-f366b6c4f8c3	\N	\N
2022-11-25 13:08:39.047335	2022-11-25 13:08:39.047341	112	8	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a92307d9-1646-46ae-8e11-e23288a94148	\N	\N
2022-11-25 13:08:39.051788	2022-11-25 13:08:39.051794	113	8	training_auc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5393f0b4-ba58-40fa-a0ac-7140b943101e	\N	\N
2022-11-25 13:08:39.057334	2022-11-25 13:08:39.05737	114	8	validation_rmse	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	259dcf73-f6a2-41e2-9464-cf7d094d4cb2	\N	\N
2022-11-25 13:08:39.063954	2022-11-25 13:08:39.063959	115	8	validation_logloss	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	881db056-42e8-4a52-8fa6-70cb57b3581b	\N	\N
2022-11-25 13:08:39.069044	2022-11-25 13:08:39.06905	116	8	training_speed	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	84ba77f3-edca-4b81-9c64-d66c238ed785	\N	\N
2022-11-25 13:08:39.076053	2022-11-25 13:08:39.076061	117	8	training_rmse	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d363529f-e0d8-4ed9-8c96-72d01afc2de3	\N	\N
2022-11-25 13:08:39.081201	2022-11-25 13:08:39.081207	118	8	training_logloss	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c12a054c-e8a1-48c4-b69d-794708444eea	\N	\N
2022-11-25 13:08:39.08636	2022-11-25 13:08:39.086367	119	8	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5bd4bb53-d90d-46a8-b3bb-6b6f2be29cdb	\N	\N
2022-11-25 13:08:39.093166	2022-11-25 13:08:39.093173	120	8	duration	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d059f8f4-297c-40d1-ac8c-e662a2b17e6f	\N	\N
2022-11-25 13:08:39.098021	2022-11-25 13:08:39.098027	121	8	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	834cd51f-3c24-4377-89bb-4196a6d0e1f2	\N	\N
2022-11-25 13:08:39.102538	2022-11-25 13:08:39.102544	122	8	user	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d43a9b3f-eb40-4ca0-b7f1-82a5b2779cbb	\N	\N
2022-11-25 13:08:39.109593	2022-11-25 13:08:39.109609	123	8	timestamp	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1407e1ba-0697-446a-a638-ccce268fc623	\N	\N
2022-11-25 13:08:39.115253	2022-11-25 13:08:39.115259	124	8	iterations	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fd034ebd-efa1-41ba-9666-e3ba7326e3f3	\N	\N
2022-11-25 13:08:39.120115	2022-11-25 13:08:39.120121	125	8	samples	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f391c4c0-b2a3-49c3-9a46-e6dbb1e788fa	\N	\N
2022-11-25 13:08:42.316448	2022-11-25 13:08:42.316459	126	8	epochs	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	42208ce8-ac38-433b-b7f1-b0e442f7d5f4	\N	\N
2022-11-25 13:08:42.389008	2022-11-25 13:08:42.389014	127	9	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6019ac52-6b8e-48d8-9dcb-4e447b3aed95	\N	\N
2022-11-25 13:08:42.395442	2022-11-25 13:08:42.395448	128	9	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d6b8b39b-6476-4070-9ea2-6a73baf9e6d5	\N	\N
2022-11-25 13:08:42.400348	2022-11-25 13:08:42.400354	129	9	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	00e3a047-2cae-45b3-ab8f-15077e828700	\N	\N
2022-11-25 13:08:42.405099	2022-11-25 13:08:42.405105	130	9	variable	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7595861b-42fe-450a-aef2-e024454cdec2	\N	\N
2022-11-25 13:08:42.411101	2022-11-25 13:08:42.411107	131	9	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	81e2ac83-27b8-4979-a3d8-7caaaa115eeb	\N	\N
2022-11-25 13:08:42.416188	2022-11-25 13:08:42.416195	132	9	user	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5a7eb121-0465-41e9-9ead-71cd78257223	\N	\N
2022-11-25 13:08:42.42128	2022-11-25 13:08:42.421285	133	9	scaled_importance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	62b9ee57-3178-4978-9524-6342d953afbd	\N	\N
2022-11-25 13:08:42.42707	2022-11-25 13:08:42.427077	134	9	relative_importance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	647aea1b-30f4-481b-9d02-aae081a7e7fd	\N	\N
2022-11-25 13:08:45.327055	2022-11-25 13:08:45.327067	135	9	percentage	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	75becf18-568b-4717-bc4c-05df3d655a86	\N	\N
2022-11-25 13:08:45.380432	2022-11-25 13:08:45.380438	136	10	l1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3fdd1976-88c4-4461-952b-ca4fe1003028	{"warning_markdown": null}	\N
2022-11-25 13:08:45.386124	2022-11-25 13:08:45.386131	137	10	l2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1a09a0d2-8d79-431c-85c4-c76d9630292c	{"warning_markdown": null}	\N
2022-11-25 13:08:45.391373	2022-11-25 13:08:45.39138	138	10	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2284971d-f913-4a69-a8bd-216f1f2c2bd3	{"warning_markdown": null}	\N
2022-11-25 13:08:45.396262	2022-11-25 13:08:45.396269	139	10	mean_bias	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	dda60bff-6e32-4505-b147-d2ad4a6f0c18	{"warning_markdown": null}	\N
2022-11-25 13:08:45.403799	2022-11-25 13:08:45.403805	140	10	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a5807aa7-655c-4397-80af-9c4992cf13cd	{"warning_markdown": null}	\N
2022-11-25 13:08:45.409532	2022-11-25 13:08:45.409538	141	10	mean_rate	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	45d5ebff-0d4e-4bac-b332-0e6a90bcb874	{"warning_markdown": null}	\N
2022-11-25 13:08:45.414968	2022-11-25 13:08:45.414975	142	10	bias_rms	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	bb0a92e0-3dbe-4563-8925-b00a8af358c8	{"warning_markdown": null}	\N
2022-11-25 13:08:45.420189	2022-11-25 13:08:45.420197	143	10	mean_weight	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0620980a-860f-4030-ac9a-fe94064cb426	{"warning_markdown": null}	\N
2022-11-25 13:08:45.425633	2022-11-25 13:08:45.42564	144	10	rate_rms	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8efa18af-9a7b-4b9f-aa88-5ad5022448d1	{"warning_markdown": null}	\N
2022-11-25 13:08:45.431242	2022-11-25 13:08:45.431249	145	10	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0bb560e3-819d-49a8-a12f-934e8c3df2c7	{"warning_markdown": null}	\N
2022-11-25 13:08:45.435917	2022-11-25 13:08:45.435923	146	10	weight_rms	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9225aa49-9fae-406d-8827-07c1699c5946	{"warning_markdown": null}	\N
2022-11-25 13:08:45.440317	2022-11-25 13:08:45.440323	147	10	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	84aad9de-73b8-4b4d-b160-fe5c916a0934	{"warning_markdown": null}	\N
2022-11-25 13:08:45.445624	2022-11-25 13:08:45.445632	148	10	momentum	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a755111f-80fd-4adb-88ba-43c9dca5cb80	{"warning_markdown": null}	\N
2022-11-25 13:08:45.450541	2022-11-25 13:08:45.450547	149	10	type	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3e4255c1-d5ec-4cff-bfff-50a4adbb28a2	{"warning_markdown": null}	\N
2022-11-25 13:08:45.455497	2022-11-25 13:08:45.455503	150	10	user	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d27233aa-3e4e-411f-b8c7-9a40ac239ad7	{"warning_markdown": null}	\N
2022-11-25 13:08:45.460265	2022-11-25 13:08:45.460271	151	10	layer	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b339190d-735f-447b-b640-3568a4c89e4f	{"warning_markdown": null}	\N
2022-11-25 13:08:45.465173	2022-11-25 13:08:45.465179	152	10	dropout	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	589db827-6b66-45a0-8360-81178c913ddc	{"warning_markdown": null}	\N
2022-11-25 13:08:48.368144	2022-11-25 13:08:48.368154	153	10	units	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	da247852-23ab-4f60-96d8-1c3f80228242	{"warning_markdown": null}	\N
2022-11-25 13:08:48.481175	2022-11-25 13:08:48.481185	154	11	mcc_base_category	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	baf98757-7ae4-45d8-8395-57bbb8910249	\N	\N
2022-11-25 13:08:48.489552	2022-11-25 13:08:48.489562	155	11	mcc_sub_category	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d4c6e27b-ad80-4966-9ba5-9dd79e9e135e	\N	\N
2022-11-25 13:08:48.502729	2022-11-25 13:08:48.502739	156	11	mcc_category_tree	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	72e8e226-2a60-4a10-80d3-6410f797f40b	\N	\N
2022-11-25 13:08:48.513686	2022-11-25 13:08:48.513693	157	11	mcc_spend_type	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6394aebe-1875-4410-8304-ba02505f60ff	\N	\N
2022-11-25 13:08:48.52128	2022-11-25 13:08:48.521286	158	11	mcc_category	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	05b3ad94-baea-4363-a76a-8127e931afb1	\N	\N
2022-11-25 13:08:48.529689	2022-11-25 13:08:48.529695	159	11	account_type	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0e7dacad-0206-4039-bcbe-7fca6b6b3ed4	\N	\N
2022-11-25 13:08:48.537489	2022-11-25 13:08:48.537499	160	11	eff_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c78f2abe-303d-4bb3-a3c8-6ca83f8e2cb7	\N	\N
2022-11-25 13:08:48.546913	2022-11-25 13:08:48.546922	161	11	mcc_description	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7d42664e-5a00-45f8-9cbc-6a264b6360ea	\N	\N
2022-11-25 13:08:48.556076	2022-11-25 13:08:48.556087	162	11	intl_ind	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1b397ccd-2f63-4781-a8d5-bd174424ac86	\N	\N
2022-11-25 13:08:48.564814	2022-11-25 13:08:48.564828	163	11	trns_type	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	68f37322-82d5-4b12-9bf2-d0fee553cb60	\N	\N
2022-11-25 13:08:48.57331	2022-11-25 13:08:48.573318	164	11	effyearmonth	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3674655c-d34a-4fae-94b1-64710990b171	\N	\N
2022-11-25 13:08:48.582657	2022-11-25 13:08:48.58267	165	11	effreformatted	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	05144fca-b06a-404a-a583-991987376641	\N	\N
2022-11-25 13:08:48.590314	2022-11-25 13:08:48.590327	166	11	trns_amt	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	62babd30-de80-47b4-9fd8-2e2f97e53f79	\N	\N
2022-11-25 13:08:48.601027	2022-11-25 13:08:48.601035	167	11	mcc	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	1251ed7d-852d-46fe-85b8-d6b0f2eafdd2	\N	\N
2022-11-25 13:08:51.499865	2022-11-25 13:08:51.499874	168	11	customer	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0433b06c-8a79-4e0c-9608-f6eae612a697	\N	\N
2022-11-25 13:08:51.554556	2022-11-25 13:08:51.554563	169	12	trns_amt_reliability	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1e20a2bd-873a-44a8-bf18-7640ea9d35b6	\N	\N
2022-11-25 13:08:54.47411	2022-11-25 13:08:54.47412	170	12	customer	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	76387e99-d273-478d-9577-ac95c4deac35	\N	\N
2022-11-25 13:08:54.527513	2022-11-25 13:08:54.52752	171	13	personality	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	dc155dab-5991-4de3-b209-2aa27e3a765f	\N	\N
2022-11-25 13:08:54.533126	2022-11-25 13:08:54.533134	172	13	trait	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	594087c7-9f6a-40aa-86e8-f441f4ac0c8d	\N	\N
2022-11-25 13:08:54.541	2022-11-25 13:08:54.541006	173	13	enthusiastic	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1c0ca37f-0adf-4257-b1f1-a61c7d1d0bcf	\N	\N
2022-11-25 13:08:54.547531	2022-11-25 13:08:54.54754	174	13	experiential	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b799b692-a7b9-4f22-99a5-18774db0a1d7	\N	\N
2022-11-25 13:08:54.553075	2022-11-25 13:08:54.553082	175	13	intentional	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c4f41cee-2bf4-4d5f-bcb2-972ca11f1647	\N	\N
2022-11-25 13:08:54.560202	2022-11-25 13:08:54.560212	176	13	count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e89b5094-9d44-4a2b-9f60-526cfce4b1d1	\N	\N
2022-11-25 13:08:54.565442	2022-11-25 13:08:54.565448	177	13	industrious	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1b725e8a-d16a-475b-bcaa-1ece5a7a7e69	\N	\N
2022-11-25 13:08:54.570214	2022-11-25 13:08:54.570221	178	13	extrovert	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9bc085ec-93e5-4df4-8f14-039dc7eac93c	\N	\N
2022-11-25 13:08:54.576169	2022-11-25 13:08:54.576176	179	13	introvert	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0045e6cd-0a9f-42d5-8650-4259db87422d	\N	\N
2022-11-25 13:08:57.470563	2022-11-25 13:08:57.470568	180	13	customer	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c7533278-6bdf-4fde-b4d7-51c13fa3e298	\N	\N
2022-11-25 13:08:57.516807	2022-11-25 13:08:57.516813	181	14	maritalstatus	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4b90ed71-1c2e-46dd-a406-44a571388cfa	{"warning_markdown": null}	\N
2022-11-25 13:08:57.522161	2022-11-25 13:08:57.522167	182	14	changeindicatorthree	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	aee1eb83-f112-4ac6-bb8d-2e7a6191ca4c	{"warning_markdown": null}	\N
2022-11-25 13:08:57.529788	2022-11-25 13:08:57.529799	183	14	changeindicatorsix	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7782c82e-5e60-4a7c-8032-0f3640045db4	{"warning_markdown": null}	\N
2022-11-25 13:08:57.535886	2022-11-25 13:08:57.535932	184	14	language	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ad0afd93-18d5-41a8-8843-927137049ac8	{"warning_markdown": null}	\N
2022-11-25 13:08:57.543372	2022-11-25 13:08:57.543379	185	14	education	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ea90eb7b-03b4-41f8-bed6-938d5f44eaa0	{"warning_markdown": null}	\N
2022-11-25 13:08:57.549032	2022-11-25 13:08:57.549038	186	14	gender	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3f5b5138-7d24-4394-83df-77438dbc681c	{"warning_markdown": null}	\N
2022-11-25 13:08:57.553852	2022-11-25 13:08:57.553858	187	14	proprtyownership	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3506a38a-e7f3-45a8-b8a9-3ec72e441021	{"warning_markdown": null}	\N
2022-11-25 13:08:57.561725	2022-11-25 13:08:57.561732	188	14	segment_enum	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b8acd7cb-c5c5-485b-8225-25dd81b6ce55	{"warning_markdown": null}	\N
2022-11-25 13:08:57.566692	2022-11-25 13:08:57.5667	189	14	numberofaddresses	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c18e74b9-a581-4a92-b9e4-d58845d121d6	{"warning_markdown": null}	\N
2022-11-25 13:08:57.571848	2022-11-25 13:08:57.571855	190	14	age	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e5f99e8a-3926-42b3-b045-f02f172925cd	{"warning_markdown": null}	\N
2022-11-25 13:08:57.578658	2022-11-25 13:08:57.57867	191	14	numberofchildren	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5795faff-96dc-405f-b666-4db11768e108	{"warning_markdown": null}	\N
2022-11-25 13:08:57.584435	2022-11-25 13:08:57.584442	192	14	numberofproducts	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f7d3ca56-479e-41dd-9679-f751725810f7	{"warning_markdown": null}	\N
2022-11-25 13:08:57.589848	2022-11-25 13:08:57.589856	193	14	customer	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	77516c6e-20c5-4bbc-9195-8a885578eddc	{"warning_markdown": null}	\N
2022-11-25 13:08:57.596121	2022-11-25 13:08:57.596127	194	14	region	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	44d26fb7-75c1-4e34-9c28-9a92fc8638ca	{"warning_markdown": null}	\N
2022-11-25 13:08:57.601848	2022-11-25 13:08:57.601856	195	14	personality	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2629673e-b2cd-46ac-b2e4-c1874caf55cc	{}	\N
2022-11-25 13:08:57.60758	2022-11-25 13:08:57.607588	196	14	trait	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	08a0bc40-81c6-40e0-b4f4-19b5ff8fce0c	{}	\N
2022-11-25 13:08:57.614515	2022-11-25 13:08:57.61457	197	14	enthusiastic	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6f66649a-374c-46e6-bdb9-19d2c2c73d55	{}	\N
2022-11-25 13:08:57.62015	2022-11-25 13:08:57.620157	198	14	experiential	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	921c4708-85ca-4f60-81d2-064eef7068dc	{}	\N
2022-11-25 13:08:57.628012	2022-11-25 13:08:57.628019	199	14	intentional	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	172b6b06-4e6f-4acb-9079-355c66d2d9bd	{}	\N
2022-11-25 13:08:57.633598	2022-11-25 13:08:57.633605	200	14	industrious	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	457e5fa2-ab16-4e74-8a99-99e74af20f19	{}	\N
2022-11-25 13:08:57.638879	2022-11-25 13:08:57.638884	201	14	extrovert	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8a00a9bf-4848-4e64-8269-5c4a6f7bb6ec	{}	\N
2022-11-25 13:09:00.536218	2022-11-25 13:09:00.536224	202	14	introvert	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	032e395a-40dd-4b6b-b403-e00c6dcc9f15	{}	\N
2022-11-25 13:09:00.589598	2022-11-25 13:09:00.589605	203	15	liquor stores beer wine alcohol_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	96a48786-c721-41e1-a649-b919e0825cb6	{}	\N
2022-11-25 13:09:00.596604	2022-11-25 13:09:00.596611	204	15	liquor stores beer wine alcohol_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	dc794234-0b4b-4679-96f1-23ec86219231	{}	\N
2022-11-25 13:09:00.602582	2022-11-25 13:09:00.602589	205	15	liquor stores beer wine alcohol_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	852c43cb-6398-4c4d-8fa7-fbf150db46da	{}	\N
2022-11-25 13:09:00.609982	2022-11-25 13:09:00.609991	206	15	liquor stores beer wine alcohol_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3459344b-bcd6-4e8f-b8dc-3120754cd803	{}	\N
2022-11-25 13:09:00.616367	2022-11-25 13:09:00.616374	207	15	liquor stores beer wine alcohol_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9dae9550-9816-4870-afde-b66c5a02729e	{}	\N
2022-11-25 13:09:00.620996	2022-11-25 13:09:00.621002	208	15	liquor stores beer wine alcohol_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	10ef1b4a-21b6-4c1a-bac8-e28f823c7cbd	{}	\N
2022-11-25 13:09:00.627389	2022-11-25 13:09:00.627397	209	15	liquor stores beer wine alcohol_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cee0c0db-fd94-4514-b9bb-1f45a7af411d	{}	\N
2022-11-25 13:09:00.633835	2022-11-25 13:09:00.633841	210	15	liquor stores beer wine alcohol_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	862f48e6-6a70-4a4a-89cb-5c960c14eed0	{}	\N
2022-11-25 13:09:00.638906	2022-11-25 13:09:00.638914	211	15	liquor stores beer wine alcohol_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	16b280a1-fe04-4f5d-97a3-cd08d0bbe2e5	{}	\N
2022-11-25 13:09:00.645457	2022-11-25 13:09:00.645464	212	15	liquor stores beer wine alcohol_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	73c397a3-8c88-47d7-a4e7-e34bf089db2b	{}	\N
2022-11-25 13:09:00.650234	2022-11-25 13:09:00.650241	213	15	liquor stores beer wine alcohol_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	84b1019e-04e7-4e67-b5fa-5818678fe5e2	{}	\N
2022-11-25 13:09:00.654998	2022-11-25 13:09:00.655004	214	15	liquor stores beer wine alcohol_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	522a1763-1d4b-4a36-b168-f434569ed9a2	{}	\N
2022-11-25 13:09:00.662533	2022-11-25 13:09:00.66254	215	15	liquor stores beer wine alcohol	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bd729009-3961-4123-bf17-a44b804dfe0b	{}	\N
2022-11-25 13:09:00.668138	2022-11-25 13:09:00.668152	216	15	cable satellite television services_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	abd1c417-053a-4348-9c3e-6ddf41abb02d	{}	\N
2022-11-25 13:09:00.673876	2022-11-25 13:09:00.673882	217	15	health and wellness stores_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	218558ff-3ab7-4071-a5dd-da3e97a8c855	{}	\N
2022-11-25 13:09:00.680586	2022-11-25 13:09:00.680592	218	15	tolls road bridge fees_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bcb15cdf-0bd4-4e9f-9bd2-22eb7220fdf9	{}	\N
2022-11-25 13:09:00.687493	2022-11-25 13:09:00.687503	219	15	cable satellite television services_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b12a5a14-1347-4ba7-8242-f5515066137c	{}	\N
2022-11-25 13:09:00.695062	2022-11-25 13:09:00.695069	220	15	health and wellness stores_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	67968b97-3d7c-422b-9b53-256c407b2641	{}	\N
2022-11-25 13:09:00.700475	2022-11-25 13:09:00.700482	221	15	tolls road bridge fees_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	74f9ae97-68ac-4af0-8b06-893d5b8de4e4	{}	\N
2022-11-25 13:09:00.707119	2022-11-25 13:09:00.707126	222	15	cable satellite television services_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1c57999c-14cb-4f36-a7d0-f815cf72c503	{}	\N
2022-11-25 13:09:00.713825	2022-11-25 13:09:00.713831	223	15	health and wellness stores_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c2fe8972-b36a-47f8-a5e1-863332536764	{}	\N
2022-11-25 13:09:00.72049	2022-11-25 13:09:00.720499	224	15	tolls road bridge fees_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4950f438-ca0d-4663-85d5-db045c5d95f2	{}	\N
2022-11-25 13:09:00.726411	2022-11-25 13:09:00.726421	225	15	cable satellite television services_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d957dc92-6a87-4688-98d9-90e6cd3567c6	{}	\N
2022-11-25 13:09:00.731992	2022-11-25 13:09:00.731998	226	15	cable satellite television services_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6b7c1faa-2592-4057-956e-8bba771eb742	{}	\N
2022-11-25 13:09:00.737834	2022-11-25 13:09:00.737841	227	15	health and wellness stores_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6dd0ebd0-cf71-4aa4-a692-029814c87522	{}	\N
2022-11-25 13:09:00.74459	2022-11-25 13:09:00.744597	228	15	health and wellness stores_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	efae8b28-b643-4ae6-94fd-8514bef22d34	{}	\N
2022-11-25 13:09:00.749836	2022-11-25 13:09:00.749844	229	15	tolls road bridge fees_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	59372539-d574-4bb1-8d73-f5bc054fe3ee	{}	\N
2022-11-25 13:09:00.75646	2022-11-25 13:09:00.756467	230	15	tolls road bridge fees_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	14b2168b-76ee-4c45-a4b6-726f9c1d5a2d	{}	\N
2022-11-25 13:09:00.763728	2022-11-25 13:09:00.763737	231	15	cable satellite television services_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f20d4494-0936-45a6-a533-d025a44b9cb6	{}	\N
2022-11-25 13:09:00.769784	2022-11-25 13:09:00.769792	232	15	cable satellite television services_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	62844bf7-2db6-4919-9168-5d833986e9a9	{}	\N
2022-11-25 13:09:00.77681	2022-11-25 13:09:00.77682	233	15	cable satellite television services_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d040cc40-d1d3-411f-a013-b58162f966b6	{}	\N
2022-11-25 13:09:00.782829	2022-11-25 13:09:00.782835	234	15	cable satellite television services_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bccde3fb-2a17-4695-96b6-947ba33d8afd	{}	\N
2022-11-25 13:09:00.788869	2022-11-25 13:09:00.788879	235	15	health and wellness stores_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	867b36ca-4c4a-4bec-8968-0d415f252a85	{}	\N
2022-11-25 13:09:00.795755	2022-11-25 13:09:00.795764	236	15	health and wellness stores_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0f4d5849-aade-4cbb-90de-7053960f43e3	{}	\N
2022-11-25 13:09:00.801343	2022-11-25 13:09:00.801351	237	15	health and wellness stores_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ce80c823-ed10-4aad-8cd0-cb5cf9cda892	{}	\N
2022-11-25 13:09:00.806533	2022-11-25 13:09:00.80654	238	15	health and wellness stores_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	db0ebad4-94e2-4c1d-ab32-49257c61b109	{}	\N
2022-11-25 13:09:00.812852	2022-11-25 13:09:00.812858	239	15	cable satellite television services_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ba5f357c-6947-4533-af4a-cc791ee937d4	{}	\N
2022-11-25 13:09:00.818175	2022-11-25 13:09:00.818182	240	15	cable satellite television services_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5070ae10-facd-439e-93b4-6340447b938f	{}	\N
2022-11-25 13:09:00.825877	2022-11-25 13:09:00.825887	241	15	cable satellite television services_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	94354847-5db2-4208-a2a6-1457594e6dc0	{}	\N
2022-11-25 13:09:00.831568	2022-11-25 13:09:00.831574	242	15	tolls road bridge fees_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0873c786-cbef-4833-9517-ce2bcc2ddc39	{}	\N
2022-11-25 13:09:00.837039	2022-11-25 13:09:00.837047	243	15	tolls road bridge fees_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2867048f-00b6-4ce2-bfc4-095e133a709d	{}	\N
2022-11-25 13:09:00.844192	2022-11-25 13:09:00.844198	244	15	tolls road bridge fees_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	eaf3ed82-0149-439a-b6d4-4bee7bfb6cbc	{}	\N
2022-11-25 13:09:00.849645	2022-11-25 13:09:00.849652	245	15	tolls road bridge fees_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	eb3c985a-f882-4c9d-b0cb-933c8727332e	{}	\N
2022-11-25 13:09:00.854725	2022-11-25 13:09:00.854732	246	15	health and wellness stores_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	156332e1-8165-4b69-9cc6-8856ffbf5ba8	{}	\N
2022-11-25 13:09:00.863407	2022-11-25 13:09:00.863419	247	15	health and wellness stores_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0baadb36-62f2-4857-b2f7-6ac47ed32f6a	{}	\N
2022-11-25 13:09:00.869847	2022-11-25 13:09:00.869853	248	15	health and wellness stores_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2e7e84a0-21eb-4aae-9cc2-6c580c45fd5a	{}	\N
2022-11-25 13:09:00.879013	2022-11-25 13:09:00.87902	249	15	tolls road bridge fees_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4c106dff-8985-4262-acf7-a55525d03082	{}	\N
2022-11-25 13:09:00.884627	2022-11-25 13:09:00.884634	250	15	tolls road bridge fees_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	10aa5ac5-643b-4f17-b17b-197483268e9f	{}	\N
2022-11-25 13:09:00.889868	2022-11-25 13:09:00.889874	251	15	tolls road bridge fees_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	98bd63d0-f647-4e14-b6ae-46f8719c737b	{}	\N
2022-11-25 13:09:00.897484	2022-11-25 13:09:00.897491	252	15	cable satellite television services	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	83b3a41a-4f8a-4157-8a2e-9dd419719969	{}	\N
2022-11-25 13:09:00.902704	2022-11-25 13:09:00.902711	253	15	health and wellness stores	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	130645b0-e36c-4f70-848b-e74e8e833fda	{}	\N
2022-11-25 13:09:00.908511	2022-11-25 13:09:00.90852	254	15	tolls road bridge fees	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	dfccfbae-550e-4d88-b19d-ca7597573861	{}	\N
2022-11-25 13:09:00.916758	2022-11-25 13:09:00.916764	255	15	eating places restaurants_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9f703f2d-8d36-4490-aacd-063e942f7a62	{}	\N
2022-11-25 13:09:00.921845	2022-11-25 13:09:00.921857	256	15	fast food restaurants_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	59140cc1-8cf5-4a1a-8cfc-480ec1d5c9a5	{}	\N
2022-11-25 13:09:00.928854	2022-11-25 13:09:00.92886	257	15	misc general merchandise_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	616399bd-5191-4fb3-92c0-da54a0573140	{}	\N
2022-11-25 13:09:00.935022	2022-11-25 13:09:00.935036	258	15	ride hailing services_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b4e26745-228d-4d4d-b285-b884b3eac0fc	{}	\N
2022-11-25 13:09:00.940512	2022-11-25 13:09:00.940519	259	15	insurance underwriting premiums_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	00e3f8a3-26a4-4811-902a-9195d8439644	{}	\N
2022-11-25 13:09:00.947728	2022-11-25 13:09:00.947737	260	15	grocery stores supermarkets_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bbada612-1884-4ecf-b096-d121562b3351	{}	\N
2022-11-25 13:09:00.953892	2022-11-25 13:09:00.953898	261	15	fuel service stations_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ffc833a4-5baa-46e4-bce1-7cdeb227fe51	{}	\N
2022-11-25 13:09:00.961662	2022-11-25 13:09:00.961669	262	15	family clothing stores_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	704212fe-a4d4-4a8f-90b4-d2a2ab2e8d45	{}	\N
2022-11-25 13:09:00.967579	2022-11-25 13:09:00.967588	263	15	online music subscriptions_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	17f13d3a-d61b-4da9-9ac5-80dea440c4f4	{}	\N
2022-11-25 13:09:00.973066	2022-11-25 13:09:00.973072	264	15	cell phone services_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	43dab729-e5d4-4451-9506-5ccc0d038ab3	{}	\N
2022-11-25 13:09:00.981389	2022-11-25 13:09:00.981398	265	15	eating places restaurants_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ff63f7ba-4b62-4827-acd7-b9c483aa7627	{}	\N
2022-11-25 13:09:00.987086	2022-11-25 13:09:00.987191	266	15	fast food restaurants_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cbcfc9ff-b8c4-487d-b59f-497bca846fb0	{}	\N
2022-11-25 13:09:00.996907	2022-11-25 13:09:00.996913	267	15	misc general merchandise_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3ec0af97-742a-4e95-8b2a-2a57592f169c	{}	\N
2022-11-25 13:09:01.002134	2022-11-25 13:09:01.00214	268	15	ride hailing services_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e9a6324b-58d9-4f5b-a999-5a45ca99e02d	{}	\N
2022-11-25 13:09:01.007492	2022-11-25 13:09:01.007498	269	15	insurance underwriting premiums_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e1cb648d-c6f3-4ea0-9b01-26bd8a8fd021	{}	\N
2022-11-25 13:09:01.014432	2022-11-25 13:09:01.014438	270	15	grocery stores supermarkets_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	33aa6617-d6fb-4833-90de-9a96ac490399	{}	\N
2022-11-25 13:09:01.019439	2022-11-25 13:09:01.019446	271	15	fuel service stations_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2aff6934-f90c-448b-b2fa-650d905a01ff	{}	\N
2022-11-25 13:09:01.02773	2022-11-25 13:09:01.027737	272	15	family clothing stores_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	40a168ea-9dd0-4483-b276-ff4c152e90ea	{}	\N
2022-11-25 13:09:01.032884	2022-11-25 13:09:01.032891	273	15	online music subscriptions_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8602e5da-f94c-4f3e-8f57-2ea78f27f290	{}	\N
2022-11-25 13:09:01.037949	2022-11-25 13:09:01.037955	274	15	cell phone services_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bd3bdaad-d96a-442d-914f-939f0af5070b	{}	\N
2022-11-25 13:09:01.043711	2022-11-25 13:09:01.043721	275	15	eating places restaurants_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5538d418-e299-48fb-850d-4f0a273587d1	{}	\N
2022-11-25 13:09:01.049281	2022-11-25 13:09:01.049288	276	15	fast food restaurants_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	175ea971-d1bd-49cb-a75c-2f9a88e4617b	{}	\N
2022-11-25 13:09:01.054855	2022-11-25 13:09:01.054861	277	15	misc general merchandise_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a43433e5-9385-4973-8d37-d84c8b9c14c7	{}	\N
2022-11-25 13:09:01.060774	2022-11-25 13:09:01.060781	278	15	ride hailing services_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5247fbea-a28a-45e1-aae2-643cff523bce	{}	\N
2022-11-25 13:09:01.066833	2022-11-25 13:09:01.066839	279	15	insurance underwriting premiums_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6a37274e-eed2-4ee0-ba64-4ec0f1ee4a92	{}	\N
2022-11-25 13:09:01.07245	2022-11-25 13:09:01.072456	280	15	grocery stores supermarkets_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	227f635d-c3c7-4497-a39e-3b63b66364e3	{}	\N
2022-11-25 13:09:01.081433	2022-11-25 13:09:01.081442	281	15	fuel service stations_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	28f34bcb-892f-4290-89e5-b0d88cf1d119	{}	\N
2022-11-25 13:09:01.087912	2022-11-25 13:09:01.087919	282	15	family clothing stores_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1837cfd9-4cd1-422a-904b-fe684c0bb9cc	{}	\N
2022-11-25 13:09:01.095287	2022-11-25 13:09:01.095293	283	15	online music subscriptions_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	56425d73-4c65-4a73-bba6-9e441e850805	{}	\N
2022-11-25 13:09:01.101309	2022-11-25 13:09:01.101315	284	15	cell phone services_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d06b9296-83ac-4605-ae6a-d525bdd36f8a	{}	\N
2022-11-25 13:09:01.106823	2022-11-25 13:09:01.10683	285	15	eating places restaurants_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	28173cda-808b-4633-ba66-5197e7b4e33d	{}	\N
2022-11-25 13:09:01.11466	2022-11-25 13:09:01.114666	286	15	eating places restaurants_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5cf8ee42-0616-4687-9780-e1d8cf424bf3	{}	\N
2022-11-25 13:09:01.120529	2022-11-25 13:09:01.120538	287	15	fast food restaurants_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ef4d9938-baac-4dfb-b74c-8920fa261413	{}	\N
2022-11-25 13:09:01.127428	2022-11-25 13:09:01.127434	288	15	fast food restaurants_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d9140c5f-d866-4fef-b449-d246dfcc7ca7	{}	\N
2022-11-25 13:09:01.133346	2022-11-25 13:09:01.133354	289	15	misc general merchandise_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f99421fc-baf4-41ef-936a-731e691ce768	{}	\N
2022-11-25 13:09:01.138032	2022-11-25 13:09:01.138038	290	15	misc general merchandise_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	743b81a7-e7ba-4f39-b1ef-24836e48c874	{}	\N
2022-11-25 13:09:01.143861	2022-11-25 13:09:01.14387	291	15	ride hailing services_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7859bff6-d00e-43c6-9247-35c00b1a68d8	{}	\N
2022-11-25 13:09:01.149376	2022-11-25 13:09:01.149382	292	15	insurance underwriting premiums_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	dc433a2c-d869-48df-b8db-aeef92287328	{}	\N
2022-11-25 13:09:01.156453	2022-11-25 13:09:01.156463	293	15	grocery stores supermarkets_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1144f25b-9e85-4ccf-ad1f-388285fe2c57	{}	\N
2022-11-25 13:09:01.163427	2022-11-25 13:09:01.163437	294	15	fuel service stations_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6749af40-7d11-4f5f-aeb1-11f8db6288f7	{}	\N
2022-11-25 13:09:01.168301	2022-11-25 13:09:01.168308	295	15	ride hailing services_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fa6373a0-b528-4a52-aade-160c440e55e7	{}	\N
2022-11-25 13:09:01.174332	2022-11-25 13:09:01.174338	296	15	insurance underwriting premiums_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b9940f77-6bfc-4885-ab2d-73e7dce0e334	{}	\N
2022-11-25 13:09:01.182114	2022-11-25 13:09:01.182122	297	15	family clothing stores_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a5d1d0d9-19e9-43c4-b0ec-55220d6498cb	{}	\N
2022-11-25 13:09:01.187193	2022-11-25 13:09:01.1872	298	15	grocery stores supermarkets_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	67d77026-2736-4bdc-a881-e69e49558f73	{}	\N
2022-11-25 13:09:01.195951	2022-11-25 13:09:01.195958	299	15	fuel service stations_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	43e542af-3bb2-421e-85c4-f56432b27a9b	{}	\N
2022-11-25 13:09:01.200979	2022-11-25 13:09:01.200985	300	15	family clothing stores_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4243fb3b-23c7-4471-8d30-f9f5bc235e5c	{}	\N
2022-11-25 13:09:01.207321	2022-11-25 13:09:01.207329	301	15	online music subscriptions_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	81b14452-e740-465c-85c8-09a5e4c4aded	{}	\N
2022-11-25 13:09:01.216682	2022-11-25 13:09:01.216691	302	15	online music subscriptions_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b96bb5a7-692e-4b6a-9579-5f86d9f436a1	{}	\N
2022-11-25 13:09:01.221686	2022-11-25 13:09:01.221692	303	15	cell phone services_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	076bf3b5-eedf-4ebd-9606-e5159da21783	{}	\N
2022-11-25 13:09:01.228055	2022-11-25 13:09:01.228061	304	15	cell phone services_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f08df322-a51f-4cfe-ae28-34076af4942f	{}	\N
2022-11-25 13:09:01.232743	2022-11-25 13:09:01.232748	305	15	eating places restaurants_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c26903c1-a0b7-4634-a835-f4385d783362	{}	\N
2022-11-25 13:09:01.237528	2022-11-25 13:09:01.237535	306	15	eating places restaurants_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ebeb3b2c-054f-4645-814f-4c812090d90b	{}	\N
2022-11-25 13:09:01.244133	2022-11-25 13:09:01.244148	307	15	eating places restaurants_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ac8f9a3c-1e6d-42ec-b049-e7a1c298e0b2	{}	\N
2022-11-25 13:09:01.24946	2022-11-25 13:09:01.249468	308	15	eating places restaurants_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d87eadda-8b06-4246-81e4-85519f2a3011	{}	\N
2022-11-25 13:09:01.255295	2022-11-25 13:09:01.255302	309	15	eating places restaurants_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	15fc4d88-9692-4f62-875e-2f64e7d4bac0	{}	\N
2022-11-25 13:09:01.26161	2022-11-25 13:09:01.261616	310	15	eating places restaurants_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	201f7ab4-428e-4cbc-a8d0-bcc1566a7560	{}	\N
2022-11-25 13:09:01.26675	2022-11-25 13:09:01.266757	311	15	eating places restaurants_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	47b6e6eb-b021-4d34-a180-ecd36a9ceb2d	{}	\N
2022-11-25 13:09:01.271619	2022-11-25 13:09:01.271625	312	15	fast food restaurants_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1e8e9ae4-1832-49ef-835d-2967ec8af733	{}	\N
2022-11-25 13:09:01.278834	2022-11-25 13:09:01.27884	313	15	fast food restaurants_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c380f85e-39fb-4675-88d5-232018371c6e	{}	\N
2022-11-25 13:09:01.284396	2022-11-25 13:09:01.284404	314	15	fast food restaurants_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9ae9eb39-804d-4140-9724-4bfbbf8862d1	{}	\N
2022-11-25 13:09:01.293708	2022-11-25 13:09:01.293718	315	15	fast food restaurants_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9c5fe611-a70f-4412-9dfc-73c71e4021ec	{}	\N
2022-11-25 13:09:01.299147	2022-11-25 13:09:01.299153	316	15	misc general merchandise_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	564b0b06-c6f3-4bde-9158-ec0ccfd9b8c8	{}	\N
2022-11-25 13:09:01.303801	2022-11-25 13:09:01.303807	317	15	misc general merchandise_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	619c9a9d-611e-4b92-b002-5f67c3cc8449	{}	\N
2022-11-25 13:09:01.311323	2022-11-25 13:09:01.311336	318	15	misc general merchandise_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a4f12f16-147f-4694-bb30-49c124ea86ed	{}	\N
2022-11-25 13:09:01.316779	2022-11-25 13:09:01.316785	319	15	misc general merchandise_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bc459860-568a-41c6-87e5-675630c7fa6f	{}	\N
2022-11-25 13:09:01.323393	2022-11-25 13:09:01.323401	320	15	fast food restaurants_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7cd4e03c-be6d-42d9-a17e-33ac0e5551f1	{}	\N
2022-11-25 13:09:01.331101	2022-11-25 13:09:01.331108	321	15	fast food restaurants_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	071c393c-fcae-4e78-81f5-92bebf38dacf	{}	\N
2022-11-25 13:09:01.336927	2022-11-25 13:09:01.336934	322	15	fast food restaurants_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bdb29a8d-5739-4ad8-90e7-295be5626025	{}	\N
2022-11-25 13:09:01.344098	2022-11-25 13:09:01.344111	323	15	misc general merchandise_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	57f7cea8-3516-4aaf-a543-8bb11182e49c	{}	\N
2022-11-25 13:09:01.349605	2022-11-25 13:09:01.349612	324	15	misc general merchandise_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1a4dea44-a17e-431d-bd81-b48c24401eb0	{}	\N
2022-11-25 13:09:01.356011	2022-11-25 13:09:01.356019	325	15	misc general merchandise_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	54a59faa-2f7b-421a-be5c-0867b7014665	{}	\N
2022-11-25 13:09:01.36258	2022-11-25 13:09:01.362588	326	15	ride hailing services_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9ad2d7be-648f-4b6a-8384-0b6d3ef78cfb	{}	\N
2022-11-25 13:09:01.368551	2022-11-25 13:09:01.368559	327	15	insurance underwriting premiums_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b76aeeba-5aee-4b18-a4f3-5472f5b33854	{}	\N
2022-11-25 13:09:01.373995	2022-11-25 13:09:01.374002	328	15	grocery stores supermarkets_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0cfb2e1c-5fb6-48fc-9da6-cb6eab25a3d9	{}	\N
2022-11-25 13:09:01.381616	2022-11-25 13:09:01.381625	329	15	fuel service stations_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5427c549-6c5e-4cb6-adae-631b77970678	{}	\N
2022-11-25 13:09:01.38838	2022-11-25 13:09:01.388386	330	15	ride hailing services_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c0858f83-c707-43cd-aa88-caebb1d285cb	{}	\N
2022-11-25 13:09:01.395115	2022-11-25 13:09:01.395121	331	15	ride hailing services_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8834f422-78be-4fbd-b045-72f95cdc6dfd	{}	\N
2022-11-25 13:09:01.400824	2022-11-25 13:09:01.400831	332	15	insurance underwriting premiums_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	40d417e5-da46-450d-8c69-b6ceec451378	{}	\N
2022-11-25 13:09:01.406114	2022-11-25 13:09:01.40612	333	15	insurance underwriting premiums_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f8348814-9bb7-4f46-9904-acd049c86e8f	{}	\N
2022-11-25 13:09:01.412085	2022-11-25 13:09:01.412092	334	15	ride hailing services_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f238a490-22fa-4216-b02a-086f37ae9b36	{}	\N
2022-11-25 13:09:01.417152	2022-11-25 13:09:01.417158	335	15	insurance underwriting premiums_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e157e2a0-9f18-4d37-851f-b3545bb46d8d	{}	\N
2022-11-25 13:09:01.422218	2022-11-25 13:09:01.422224	336	15	family clothing stores_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	42e0b899-6e2e-4acf-ab2a-fc6355896621	{}	\N
2022-11-25 13:09:01.428343	2022-11-25 13:09:01.42835	337	15	grocery stores supermarkets_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	71264ff5-c002-49b5-b293-c22c31d41f59	{}	\N
2022-11-25 13:09:01.434566	2022-11-25 13:09:01.434574	338	15	grocery stores supermarkets_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ea39a12f-fbca-46ee-89b5-e60bbd41d53a	{}	\N
2022-11-25 13:09:01.440108	2022-11-25 13:09:01.440117	339	15	grocery stores supermarkets_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c0c41f07-fcd6-4924-aa5c-8ed23a566eed	{}	\N
2022-11-25 13:09:01.446476	2022-11-25 13:09:01.446485	340	15	fuel service stations_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5bb0007d-0779-4112-af1f-cc5541692c2b	{}	\N
2022-11-25 13:09:01.451782	2022-11-25 13:09:01.451789	341	15	fuel service stations_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3df3e141-b27d-4d39-815d-dc7d992ca8c4	{}	\N
2022-11-25 13:09:01.457483	2022-11-25 13:09:01.457491	342	15	fuel service stations_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3ec4090e-aa21-486b-8e1f-393d3097bf3b	{}	\N
2022-11-25 13:09:01.46396	2022-11-25 13:09:01.463967	343	15	family clothing stores_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e22d949f-194b-49e9-9eb7-ab94020d65c1	{}	\N
2022-11-25 13:09:01.469434	2022-11-25 13:09:01.469442	344	15	family clothing stores_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e78e6ffd-2e9d-4d15-8308-649e3d5b20b1	{}	\N
2022-11-25 13:09:01.475238	2022-11-25 13:09:01.475247	345	15	family clothing stores_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b3136028-b32f-44c4-be7d-4fb32a8f35a3	{}	\N
2022-11-25 13:09:01.482275	2022-11-25 13:09:01.482284	346	15	online music subscriptions_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ce6674b4-90ef-4584-8f3e-36fc6115cc45	{}	\N
2022-11-25 13:09:01.487794	2022-11-25 13:09:01.487804	347	15	online music subscriptions_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c952e332-b452-4adf-8a19-8f666d46fc14	{}	\N
2022-11-25 13:09:01.496414	2022-11-25 13:09:01.496421	348	15	online music subscriptions_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fe2edf3f-2e80-49d2-bb21-cd9ef7c003f6	{}	\N
2022-11-25 13:09:01.503453	2022-11-25 13:09:01.50348	349	15	online music subscriptions_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	307309a5-b91a-4c03-b6bf-f309c64eeee6	{}	\N
2022-11-25 13:09:01.510064	2022-11-25 13:09:01.510073	350	15	cell phone services_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f30cd94b-1ef2-44c4-8d5c-e8dc171230d8	{}	\N
2022-11-25 13:09:01.516437	2022-11-25 13:09:01.516443	351	15	ride hailing services_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4f7a1787-fa1e-4825-a997-d35b798d499e	{}	\N
2022-11-25 13:09:01.521857	2022-11-25 13:09:01.521867	352	15	insurance underwriting premiums_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cac75e2f-0368-454e-8c40-71b61ed31661	{}	\N
2022-11-25 13:09:01.528862	2022-11-25 13:09:01.528869	353	15	cell phone services_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	85c1eb1e-12b6-431a-9d5b-6b75ad2fd646	{}	\N
2022-11-25 13:09:01.534337	2022-11-25 13:09:01.534346	354	15	cell phone services_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	26193c32-2d04-4b5f-936f-a669a6656986	{}	\N
2022-11-25 13:09:01.539203	2022-11-25 13:09:01.539209	355	15	grocery stores supermarkets_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ed1bf903-dabe-4aac-9cb0-a8fc9c6a3ec2	{}	\N
2022-11-25 13:09:43.014932	2022-11-25 13:09:43.014938	817	28	csa	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ef0762fe-9ccc-4f86-99fe-27e5475fb90d	\N	\N
2022-11-25 13:09:01.54565	2022-11-25 13:09:01.545657	356	15	cell phone services_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ce0be070-8a9b-476a-b938-20437fbb9183	{}	\N
2022-11-25 13:09:01.551543	2022-11-25 13:09:01.551549	357	15	fuel service stations_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fd4f5b3b-7e46-47d1-852e-24709d52d1b3	{}	\N
2022-11-25 13:09:01.557196	2022-11-25 13:09:01.557204	358	15	family clothing stores_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0f49e297-49b8-42bd-877b-2c2030218c0d	{}	\N
2022-11-25 13:09:01.563877	2022-11-25 13:09:01.563883	359	15	ride hailing services_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fa45b0cd-bab7-4dc2-bedb-021b5ce0c5e2	{}	\N
2022-11-25 13:09:01.568797	2022-11-25 13:09:01.568803	360	15	insurance underwriting premiums_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	57d8a89c-5b7b-4666-8f3c-d14db2ed8146	{}	\N
2022-11-25 13:09:01.574651	2022-11-25 13:09:01.574663	361	15	grocery stores supermarkets_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2ae90998-adfc-48ac-bfda-9945437a8965	{}	\N
2022-11-25 13:09:01.58164	2022-11-25 13:09:01.581669	362	15	fuel service stations_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fa93914e-5810-4e4f-9b66-c648a611b96a	{}	\N
2022-11-25 13:09:01.588043	2022-11-25 13:09:01.58805	363	15	family clothing stores_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	eb4e6392-dd5a-4641-8180-3256c941b024	{}	\N
2022-11-25 13:09:01.594534	2022-11-25 13:09:01.594541	364	15	ride hailing services_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6fb2450d-36f2-427c-971a-b1fd551ecb3e	{}	\N
2022-11-25 13:09:01.599888	2022-11-25 13:09:01.599895	365	15	insurance underwriting premiums_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	791bc067-4b42-4540-abd9-32ba7a7ec73e	{}	\N
2022-11-25 13:09:01.605584	2022-11-25 13:09:01.605591	366	15	grocery stores supermarkets_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8f32c34b-e44c-4ab9-a187-4a52397c04a4	{}	\N
2022-11-25 13:09:01.613175	2022-11-25 13:09:01.613182	367	15	fuel service stations_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	423737e2-3fb4-40a2-9e93-befc41b8e99a	{}	\N
2022-11-25 13:09:01.618278	2022-11-25 13:09:01.618285	368	15	family clothing stores_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3c89bbbe-90ae-4b8e-b7dd-7520a2b0e424	{}	\N
2022-11-25 13:09:01.625965	2022-11-25 13:09:01.625978	369	15	online music subscriptions_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7e0f5ecf-e785-47c1-8c65-a2c637c7bde7	{}	\N
2022-11-25 13:09:01.632103	2022-11-25 13:09:01.632109	370	15	online music subscriptions_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b8696c98-7c3f-4fd0-899b-248943456591	{}	\N
2022-11-25 13:09:01.637883	2022-11-25 13:09:01.637892	371	15	online music subscriptions_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9886fe40-7cd1-426d-83e7-1a422306f5fb	{}	\N
2022-11-25 13:09:01.645947	2022-11-25 13:09:01.645956	372	15	cell phone services_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7b422a2e-df5d-4de6-9ea9-2ed0dd970ec8	{}	\N
2022-11-25 13:09:01.652279	2022-11-25 13:09:01.652288	373	15	cell phone services_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c674a764-ba58-43b8-9015-8610e65e0d5a	{}	\N
2022-11-25 13:09:01.657527	2022-11-25 13:09:01.657534	374	15	cell phone services_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a908d43e-8137-4481-8911-202cc5938665	{}	\N
2022-11-25 13:09:01.664797	2022-11-25 13:09:01.664805	375	15	eating places restaurants	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	df298bdb-1a9d-4a70-8ac4-4d88f53e7e70	{}	\N
2022-11-25 13:09:01.670091	2022-11-25 13:09:01.670096	376	15	fast food restaurants	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	28548c2d-4571-469c-ac5e-431f3c944264	{}	\N
2022-11-25 13:09:01.676168	2022-11-25 13:09:01.676179	377	15	misc general merchandise	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	01cc95d7-6f26-4d02-a5ba-6399cd5eb977	{}	\N
2022-11-25 13:09:01.682109	2022-11-25 13:09:01.682115	378	15	ride hailing services	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	80da8690-a748-42ca-b0f0-d4d5202b1d4d	{}	\N
2022-11-25 13:09:01.688259	2022-11-25 13:09:01.688265	379	15	insurance underwriting premiums	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a77d7b1f-deeb-4b2f-a419-e7152a49dc36	{}	\N
2022-11-25 13:09:01.694775	2022-11-25 13:09:01.694782	380	15	grocery stores supermarkets	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	030ab3b1-b0c1-4752-8adf-105496096536	{}	\N
2022-11-25 13:09:01.700765	2022-11-25 13:09:01.700774	381	15	fuel service stations	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a381fe3b-0b4d-46e2-8956-08c8f97a1bb9	{}	\N
2022-11-25 13:09:01.706186	2022-11-25 13:09:01.706192	382	15	family clothing stores	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bccaf0d1-9fae-4a88-938a-1441c634c22c	{}	\N
2022-11-25 13:09:01.713923	2022-11-25 13:09:01.71393	383	15	online music subscriptions	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	36ba1873-8b12-421c-a991-d4a55818d89c	{}	\N
2022-11-25 13:09:01.722353	2022-11-25 13:09:01.722359	384	15	cell phone services	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e351530c-3b19-4a1c-9f95-befa4fe1ce6c	{}	\N
2022-11-25 13:09:01.729348	2022-11-25 13:09:01.729355	385	15	gambling transactions_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ebfbcaec-b640-4109-947b-88e21211cca5	{}	\N
2022-11-25 13:09:01.735218	2022-11-25 13:09:01.735226	386	15	funeral insurance_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1f10b9af-b1cf-43c5-bd67-d54c044ca94d	{}	\N
2022-11-25 13:09:01.740482	2022-11-25 13:09:01.740488	387	15	hardware stores_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f89ea175-c878-4d2e-9e50-dc98dd84795b	{}	\N
2022-11-25 13:09:01.747677	2022-11-25 13:09:01.747686	388	15	loan repayments_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8913dbb3-d230-41e3-9d4e-584382d94feb	{}	\N
2022-11-25 13:09:01.753493	2022-11-25 13:09:01.7535	389	15	budget repayments_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0d514b2b-d689-449b-b248-0f8fa098efc5	{}	\N
2022-11-25 13:09:01.75876	2022-11-25 13:09:01.758769	390	15	bank fees_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	648bc196-83ff-4145-9fd1-ad7c5a017afb	{}	\N
2022-11-25 13:09:01.765923	2022-11-25 13:09:01.765929	391	15	vehicle finance_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	05228003-dd67-4686-b4e2-2ee10f240062	{}	\N
2022-11-25 13:09:01.771562	2022-11-25 13:09:01.77157	392	15	vehicle insurance_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3ec5cc99-c9bd-4f3c-bf69-98f74caf8848	{}	\N
2022-11-25 13:09:01.778728	2022-11-25 13:09:01.778735	393	15	life insurance_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1676fc58-0916-4f22-a21f-8bcf263b922c	{}	\N
2022-11-25 13:09:01.784017	2022-11-25 13:09:01.784023	394	15	money transfers_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d8bc44e0-86d5-47b7-917c-490d03d8ca80	{}	\N
2022-11-25 13:09:01.789212	2022-11-25 13:09:01.789219	395	15	meat provisioners_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ec1e94dd-5411-4710-867f-b9fc0928f5bd	{}	\N
2022-11-25 13:09:01.798765	2022-11-25 13:09:01.798771	396	15	debit orders_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	efa7c9bd-cc79-4ed2-a473-f4fb1fa4589f	{}	\N
2022-11-25 13:09:01.804745	2022-11-25 13:09:01.804752	397	15	electricity services_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d2db9034-c903-44c4-803a-3f49dac26bb2	{}	\N
2022-11-25 13:09:01.812438	2022-11-25 13:09:01.812447	398	15	gambling transactions_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f59a3524-90ca-4374-a556-b68fd3aa7627	{}	\N
2022-11-25 13:09:01.817528	2022-11-25 13:09:01.817534	399	15	funeral insurance_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6248ba80-8e18-44dc-a2c1-8f918c382429	{}	\N
2022-11-25 13:09:01.82331	2022-11-25 13:09:01.823316	400	15	hardware stores_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	474c24ab-38f6-4b43-b776-10864357c0f6	{}	\N
2022-11-25 13:09:01.829625	2022-11-25 13:09:01.829631	401	15	loan repayments_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3b849466-b4a1-476e-913a-37423f51713a	{}	\N
2022-11-25 13:09:01.835021	2022-11-25 13:09:01.835027	402	15	budget repayments_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2d8e0982-1b15-4e74-975b-fbee072fa019	{}	\N
2022-11-25 13:09:01.8407	2022-11-25 13:09:01.840706	403	15	bank fees_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ac31565b-6038-460f-a161-0665f3f3a923	{}	\N
2022-11-25 13:09:01.84733	2022-11-25 13:09:01.847335	404	15	vehicle finance_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	17b17f5f-c259-48a4-b37d-0cc3dc80c151	{}	\N
2022-11-25 13:09:01.852935	2022-11-25 13:09:01.852942	405	15	vehicle insurance_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	80269852-1829-410e-b16d-d5c0c25a252a	{}	\N
2022-11-25 13:09:01.860352	2022-11-25 13:09:01.860361	406	15	life insurance_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	568a51ec-d701-49d9-bfa5-fae5cb1c6732	{}	\N
2022-11-25 13:09:01.866296	2022-11-25 13:09:01.866304	407	15	money transfers_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2cfe7f6c-edff-4647-8957-921733a95237	{}	\N
2022-11-25 13:09:01.871454	2022-11-25 13:09:01.871461	408	15	meat provisioners_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	611ebe2c-d3f8-41cb-81cf-97c15d00541e	{}	\N
2022-11-25 13:09:01.880526	2022-11-25 13:09:01.880536	409	15	debit orders_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	419b036c-0c56-410e-b617-8e8c40166851	{}	\N
2022-11-25 13:09:01.88551	2022-11-25 13:09:01.885516	410	15	electricity services_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e56378ed-3c90-495c-9c9c-00593f7198c8	{}	\N
2022-11-25 13:09:01.891477	2022-11-25 13:09:01.891486	411	15	gambling transactions_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d4323057-7ea6-4da7-b210-e529f341c15e	{}	\N
2022-11-25 13:09:01.897875	2022-11-25 13:09:01.897881	412	15	funeral insurance_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f3cf99c0-fc5b-4a91-9abe-3334ceefab1f	{}	\N
2022-11-25 13:09:01.902784	2022-11-25 13:09:01.90279	413	15	hardware stores_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	52ef9fbc-3f96-4700-9409-1596b2643442	{}	\N
2022-11-25 13:09:01.908264	2022-11-25 13:09:01.908277	414	15	loan repayments_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cc0d78df-5da3-4f67-af73-bb6da161967b	{}	\N
2022-11-25 13:09:01.914421	2022-11-25 13:09:01.914427	415	15	budget repayments_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	22851952-b23a-4ec1-b345-0761b0c064d2	{}	\N
2022-11-25 13:09:01.919385	2022-11-25 13:09:01.919391	416	15	bank fees_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f142d79b-a7b3-4c5d-b87a-11717d4de4b7	{}	\N
2022-11-25 13:09:01.925807	2022-11-25 13:09:01.925832	417	15	vehicle finance_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0f6ac7dc-3131-491c-9154-b60eb0626e88	{}	\N
2022-11-25 13:09:01.931566	2022-11-25 13:09:01.931572	418	15	vehicle insurance_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4c054995-9345-4668-a15d-698d3e4b60fc	{}	\N
2022-11-25 13:09:01.936825	2022-11-25 13:09:01.936834	419	15	life insurance_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	11c24a24-609f-4285-b646-62f1a2e0bea6	{}	\N
2022-11-25 13:09:01.94374	2022-11-25 13:09:01.943749	420	15	money transfers_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3f5a9b68-9bcc-4f52-beb9-c2057e9fdb74	{}	\N
2022-11-25 13:09:01.949765	2022-11-25 13:09:01.949771	421	15	meat provisioners_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	77e5e9ab-bdc2-4206-a120-d0bd8af92731	{}	\N
2022-11-25 13:09:01.955592	2022-11-25 13:09:01.955598	422	15	debit orders_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ed99ffc7-b1af-4d5e-bd1b-bc4b7c313700	{}	\N
2022-11-25 13:09:01.962581	2022-11-25 13:09:01.962588	423	15	electricity services_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4f20b85d-da5c-47f2-9d2a-ca30b30f14d1	{}	\N
2022-11-25 13:09:01.967577	2022-11-25 13:09:01.967583	424	15	gambling transactions_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6ba357df-7c75-4ab4-a489-68d864920c49	{}	\N
2022-11-25 13:09:01.972751	2022-11-25 13:09:01.972757	425	15	gambling transactions_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a8582fd0-5473-4ce5-85c6-b4d984e4a374	{}	\N
2022-11-25 13:09:01.980348	2022-11-25 13:09:01.980355	426	15	funeral insurance_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8fceac3b-ee8e-4ed8-a826-61240a0231fc	{}	\N
2022-11-25 13:09:01.986168	2022-11-25 13:09:01.986176	427	15	funeral insurance_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2a45679e-f801-436d-a1ad-d53dcd3697f3	{}	\N
2022-11-25 13:09:01.991193	2022-11-25 13:09:01.991199	428	15	hardware stores_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	77a457d3-80c9-4088-97f2-5f8ec562efc8	{}	\N
2022-11-25 13:09:01.998258	2022-11-25 13:09:01.998266	429	15	loan repayments_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3d256711-0e5c-4438-bc82-4234f0132cb9	{}	\N
2022-11-25 13:09:02.006346	2022-11-25 13:09:02.006353	430	15	hardware stores_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	62d2bb12-998c-4826-aa28-6ddb169849f0	{}	\N
2022-11-25 13:09:02.014383	2022-11-25 13:09:02.014389	431	15	loan repayments_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fe4604da-b847-40f5-9aef-f5f4f2815710	{}	\N
2022-11-25 13:09:02.020467	2022-11-25 13:09:02.020476	432	15	budget repayments_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	43554893-8e0c-4c52-b39d-6d67d63ef8db	{}	\N
2022-11-25 13:09:02.026958	2022-11-25 13:09:02.026969	433	15	budget repayments_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	56d2aca4-dd2d-4194-a8e9-bbcca54c153d	{}	\N
2022-11-25 13:09:02.032675	2022-11-25 13:09:02.032682	434	15	bank fees_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9b5ba0a0-2252-4c29-9e4c-fa06c5a988eb	{}	\N
2022-11-25 13:09:02.038312	2022-11-25 13:09:02.03832	435	15	bank fees_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b008bd2b-2187-4ca9-951b-6c0e217a8474	{}	\N
2022-11-25 13:09:02.044358	2022-11-25 13:09:02.044366	436	15	vehicle finance_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ae43d870-9cac-49a9-ab4f-667c5f49d9a5	{}	\N
2022-11-25 13:09:02.049702	2022-11-25 13:09:02.049708	437	15	vehicle insurance_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b883fbc7-ab0a-414f-9aef-20f4a706f4fe	{}	\N
2022-11-25 13:09:02.05533	2022-11-25 13:09:02.055337	438	15	vehicle finance_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2b6fa702-30c6-44a0-a4d0-f73b2deaebde	{}	\N
2022-11-25 13:09:02.061776	2022-11-25 13:09:02.061787	439	15	vehicle insurance_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	37c347f2-9841-454e-b401-c57ce602e597	{}	\N
2022-11-25 13:09:02.067192	2022-11-25 13:09:02.067198	440	15	life insurance_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	583208d2-6385-4ea0-b18a-90fc2b75a066	{}	\N
2022-11-25 13:09:02.072238	2022-11-25 13:09:02.072244	441	15	life insurance_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9588d8fc-8e76-4cef-a588-62c407c66eca	{}	\N
2022-11-25 13:09:02.080298	2022-11-25 13:09:02.080305	442	15	money transfers_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cc37bae1-5efe-43a7-a15d-a16200accedf	{}	\N
2022-11-25 13:09:02.08601	2022-11-25 13:09:02.086016	443	15	meat provisioners_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9efe8f6f-71fa-4528-945b-7eba184d50c7	{}	\N
2022-11-25 13:09:02.090928	2022-11-25 13:09:02.090936	444	15	money transfers_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f5dbf325-88fb-445d-9f98-dbbf34e054ea	{}	\N
2022-11-25 13:09:02.098216	2022-11-25 13:09:02.098222	445	15	meat provisioners_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2d7f7933-5a43-4ade-8a3a-f2fc2ff6dd89	{}	\N
2022-11-25 13:09:02.103243	2022-11-25 13:09:02.103249	446	15	debit orders_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a05c2225-9909-4f0e-a964-15775102098c	{}	\N
2022-11-25 13:09:02.109097	2022-11-25 13:09:02.109106	447	15	debit orders_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4778ed57-a72b-4aed-92e6-71543b1a969a	{}	\N
2022-11-25 13:09:02.115023	2022-11-25 13:09:02.115037	448	15	electricity services_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f756abe8-605d-4a20-b896-9988b0093d19	{}	\N
2022-11-25 13:09:02.120148	2022-11-25 13:09:02.120155	449	15	electricity services_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	16a9d018-09a3-4b9e-a6d8-8e8b08b3f129	{}	\N
2022-11-25 13:09:02.125642	2022-11-25 13:09:02.125657	450	15	gambling transactions_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a6026717-deeb-41b9-a57e-c4f464e6985b	{}	\N
2022-11-25 13:09:02.131837	2022-11-25 13:09:02.131843	451	15	gambling transactions_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d2398bce-c5e6-423b-9cee-c44705857b20	{}	\N
2022-11-25 13:09:02.137002	2022-11-25 13:09:02.137007	452	15	gambling transactions_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a326810e-5b98-4da3-9df2-a862a8e927ea	{}	\N
2022-11-25 13:09:02.143802	2022-11-25 13:09:02.143809	453	15	gambling transactions_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5f167215-8ca3-4933-9ff8-2c99bc055197	{}	\N
2022-11-25 13:09:02.148964	2022-11-25 13:09:02.14897	454	15	gambling transactions_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	32e6c629-ecfa-440a-a470-6b1d4e444d61	{}	\N
2022-11-25 13:09:02.154487	2022-11-25 13:09:02.154495	455	15	gambling transactions_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f33894f0-2901-476b-9fe9-52725cf3a053	{}	\N
2022-11-25 13:09:02.161816	2022-11-25 13:09:02.161823	456	15	gambling transactions_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	dbec518f-e72d-45d6-a626-1a66ac523802	{}	\N
2022-11-25 13:09:02.166869	2022-11-25 13:09:02.166876	457	15	funeral insurance_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b8010870-f930-481e-a392-77521c2ddbdd	{}	\N
2022-11-25 13:09:02.171758	2022-11-25 13:09:02.171773	458	15	funeral insurance_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	52ced072-b02a-4f29-8ca8-a9c61774521f	{}	\N
2022-11-25 13:09:02.180251	2022-11-25 13:09:02.180257	459	15	funeral insurance_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	47635d5d-98c5-430d-81fa-102586da9814	{}	\N
2022-11-25 13:09:02.186326	2022-11-25 13:09:02.186335	460	15	funeral insurance_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a41ab527-7bdf-41fb-b3ac-1e44778c0d3f	{}	\N
2022-11-25 13:09:02.19236	2022-11-25 13:09:02.192374	461	15	hardware stores_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b1bbb087-3c9f-491a-b438-1728794505aa	{}	\N
2022-11-25 13:09:02.198505	2022-11-25 13:09:02.198511	462	15	loan repayments_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	57adacc3-af92-4bbd-950b-026d0334c4f1	{}	\N
2022-11-25 13:09:02.203529	2022-11-25 13:09:02.203535	463	15	hardware stores_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	113020bd-d054-4ae4-a3ee-098318b730c4	{}	\N
2022-11-25 13:09:02.210456	2022-11-25 13:09:02.210465	464	15	hardware stores_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	72485393-90cf-4a35-850d-696cf867d5aa	{}	\N
2022-11-25 13:09:02.216422	2022-11-25 13:09:02.216431	465	15	hardware stores_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2b419f2f-b51b-4d31-9f56-1d25f35bcc3e	{}	\N
2022-11-25 13:09:02.223729	2022-11-25 13:09:02.223735	466	15	loan repayments_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	850ddb1b-6b9c-487d-9880-bbf8725bcfc7	{}	\N
2022-11-25 13:09:02.232442	2022-11-25 13:09:02.23245	467	15	loan repayments_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bbd41da7-3db1-4b2b-8b62-a8e331f0c1ed	{}	\N
2022-11-25 13:09:02.238785	2022-11-25 13:09:02.238793	468	15	loan repayments_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	94942b9b-0626-4edc-b437-b470ddbc46c5	{}	\N
2022-11-25 13:09:02.246282	2022-11-25 13:09:02.246289	469	15	budget repayments_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1de6c200-eb77-4d2f-b3bf-9cff5d0980a6	{}	\N
2022-11-25 13:09:02.2513	2022-11-25 13:09:02.251306	470	15	budget repayments_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1599d103-c712-4955-8219-2f999b7660b3	{}	\N
2022-11-25 13:09:02.257797	2022-11-25 13:09:02.257803	471	15	budget repayments_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9ed60583-66df-4730-b6e3-d6fc25e6ce5e	{}	\N
2022-11-25 13:09:02.264594	2022-11-25 13:09:02.264601	472	15	budget repayments_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	032e2604-12d6-4118-8a32-d7148f370e19	{}	\N
2022-11-25 13:09:02.271041	2022-11-25 13:09:02.271049	473	15	bank fees_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e4195937-3b25-4309-a80f-b1ef47e7d59e	{}	\N
2022-11-25 13:09:02.277581	2022-11-25 13:09:02.277588	474	15	bank fees_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b89e2317-fe89-4d9a-9a64-61aecf06819e	{}	\N
2022-11-25 13:09:02.283496	2022-11-25 13:09:02.283503	475	15	bank fees_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	96bdd072-a8ab-4d9c-8a8b-516967ef463c	{}	\N
2022-11-25 13:09:02.289093	2022-11-25 13:09:02.289099	476	15	bank fees_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	75526796-45dd-4670-bcaa-870aeaaaf160	{}	\N
2022-11-25 13:09:02.295586	2022-11-25 13:09:02.295593	477	15	vehicle finance_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	34409517-0f18-49aa-9434-ca3f8f5754a5	{}	\N
2022-11-25 13:09:02.301283	2022-11-25 13:09:02.301293	478	15	vehicle insurance_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	eef86b59-3a07-492f-afc7-bb040e8ce656	{}	\N
2022-11-25 13:09:02.306736	2022-11-25 13:09:02.306742	479	15	vehicle finance_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	71094342-e861-4a4f-b739-f685fddd5aa0	{}	\N
2022-11-25 13:09:02.314052	2022-11-25 13:09:02.314058	480	15	vehicle finance_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a7eaed16-9305-4544-9fac-3b93e3bf51a6	{}	\N
2022-11-25 13:09:02.319754	2022-11-25 13:09:02.319761	481	15	vehicle finance_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2f1783e7-6f17-4073-87d3-1fecd72f103e	{}	\N
2022-11-25 13:09:02.326203	2022-11-25 13:09:02.326213	482	15	vehicle insurance_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	24433e69-15ff-4e47-b1a8-e92eee22f632	{}	\N
2022-11-25 13:09:02.332593	2022-11-25 13:09:02.332602	483	15	vehicle insurance_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	62572112-37c8-44cf-9ac0-2dd8b850983e	{}	\N
2022-11-25 13:09:02.337601	2022-11-25 13:09:02.337607	484	15	vehicle insurance_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3c79252e-772f-4344-ac28-6deb24c4f8f6	{}	\N
2022-11-25 13:09:02.34366	2022-11-25 13:09:02.34367	485	15	funeral insurance_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	75aabf27-acdf-4fea-8935-85e7d86510c9	{}	\N
2022-11-25 13:09:02.350414	2022-11-25 13:09:02.35042	486	15	funeral insurance_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e77b321c-fd43-48bf-ba98-b857d858fc7c	{}	\N
2022-11-25 13:09:02.355897	2022-11-25 13:09:02.355904	487	15	life insurance_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8bdfb881-253b-48b4-a130-5d441e09a4f1	{}	\N
2022-11-25 13:09:02.362435	2022-11-25 13:09:02.362444	488	15	hardware stores_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3a2f3f47-7507-4087-ba9a-131d886e790b	{}	\N
2022-11-25 13:09:02.367747	2022-11-25 13:09:02.367753	489	15	life insurance_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	81890ee5-a55d-4053-8b19-1ffef5f5e589	{}	\N
2022-11-25 13:09:02.372874	2022-11-25 13:09:02.37288	490	15	life insurance_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a27083b4-fb95-4710-9f7f-7e9b6aa9a7ba	{}	\N
2022-11-25 13:09:02.379674	2022-11-25 13:09:02.37968	491	15	funeral insurance_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7d518cea-6e8d-4631-8a02-ad6259ed07e3	{}	\N
2022-11-25 13:09:02.385723	2022-11-25 13:09:02.385731	492	15	life insurance_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	495a481f-8433-46fe-94b4-f0b7f6f46cc1	{}	\N
2022-11-25 13:09:02.391154	2022-11-25 13:09:02.391167	493	15	loan repayments_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2edbfc27-37cf-465a-9dda-fc22db50faa5	{}	\N
2022-11-25 13:09:02.399682	2022-11-25 13:09:02.399689	494	15	hardware stores_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	10b24b5c-f80d-45ef-aa3e-f5582bf8d723	{}	\N
2022-11-25 13:09:02.405534	2022-11-25 13:09:02.405543	495	15	loan repayments_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5014564f-ca7f-49ee-b634-c08bbce3af36	{}	\N
2022-11-25 13:09:02.413253	2022-11-25 13:09:02.41326	496	15	money transfers_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	10fcac0b-cdf0-4cde-b41b-2eae7a93bde1	{}	\N
2022-11-25 13:09:02.419301	2022-11-25 13:09:02.419309	497	15	meat provisioners_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1ccafb99-45d7-4cff-be65-16b41e65bd7d	{}	\N
2022-11-25 13:09:02.424532	2022-11-25 13:09:02.424539	498	15	hardware stores_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9ea9cbd7-1867-42bc-841f-4fe8bcc37f1a	{}	\N
2022-11-25 13:09:02.432226	2022-11-25 13:09:02.432235	499	15	money transfers_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b6bf4419-5a7b-4bbd-a750-4f2b2797f6db	{}	\N
2022-11-25 13:09:02.438111	2022-11-25 13:09:02.43812	500	15	money transfers_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a10a8f37-6b89-4a33-bade-8e8a7c9e4dcd	{}	\N
2022-11-25 13:09:02.445565	2022-11-25 13:09:02.445573	501	15	money transfers_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7939a1d6-89af-4f9f-ae21-65444b8e4b22	{}	\N
2022-11-25 13:09:02.451427	2022-11-25 13:09:02.451434	502	15	meat provisioners_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ef8532ca-c0ab-4054-bf48-0f263afd72f7	{}	\N
2022-11-25 13:09:02.457159	2022-11-25 13:09:02.457165	503	15	meat provisioners_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8649015b-188d-4994-bf02-18cbfdeb9e9f	{}	\N
2022-11-25 13:09:02.464681	2022-11-25 13:09:02.46469	504	15	meat provisioners_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e7333dd2-a11f-48b9-b1e5-bc323e94a076	{}	\N
2022-11-25 13:09:02.469874	2022-11-25 13:09:02.46988	505	15	loan repayments_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2dfd8e73-8d77-4a91-84f1-bd2445b9cbf8	{}	\N
2022-11-25 13:09:02.476566	2022-11-25 13:09:02.476573	506	15	budget repayments_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	622afbbb-658b-456b-a4a2-fcd0d8d2d7ad	{}	\N
2022-11-25 13:09:02.482266	2022-11-25 13:09:02.482278	507	15	bank fees_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	16accff9-bedb-421d-b16c-972267b2c720	{}	\N
2022-11-25 13:09:02.487884	2022-11-25 13:09:02.487891	508	15	budget repayments_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e0eef547-fd17-49d5-b1cb-c0bead372e0e	{}	\N
2022-11-25 13:09:02.494631	2022-11-25 13:09:02.494638	509	15	debit orders_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4aba6fc1-cdf9-4954-85a4-3bf795d3a27e	{}	\N
2022-11-25 13:09:02.500619	2022-11-25 13:09:02.500627	510	15	bank fees_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0f561d07-63c9-40e9-ade2-3d803aad0dcd	{}	\N
2022-11-25 13:09:02.51487	2022-11-25 13:09:02.514877	511	15	debit orders_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c5b1efeb-76d7-4eb2-bdf1-726e40760faa	{}	\N
2022-11-25 13:09:02.526251	2022-11-25 13:09:02.526262	512	15	debit orders_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ca8b3c3f-9641-44a0-b25d-93ad1a96c627	{}	\N
2022-11-25 13:09:02.534929	2022-11-25 13:09:02.534938	513	15	debit orders_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6745d5a2-5c53-46e0-a803-c2a9681edd69	{}	\N
2022-11-25 13:09:02.551853	2022-11-25 13:09:02.551867	514	15	budget repayments_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b2a18d4c-c0c1-4218-8948-e5f68b3735b2	{}	\N
2022-11-25 13:09:02.561148	2022-11-25 13:09:02.561162	515	15	bank fees_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	596f3184-4124-4171-a839-68f496ce146d	{}	\N
2022-11-25 13:09:02.570561	2022-11-25 13:09:02.57057	516	15	electricity services_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4647346e-6994-48c1-81bd-403908048d2f	{}	\N
2022-11-25 13:09:02.578572	2022-11-25 13:09:02.578579	517	15	electricity services_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ff8396d7-4970-4818-a7a1-7a9ce0cafd33	{}	\N
2022-11-25 13:09:02.590649	2022-11-25 13:09:02.590659	518	15	electricity services_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c9182827-20a2-4c8e-ac82-acd7a0258aba	{}	\N
2022-11-25 13:09:02.598915	2022-11-25 13:09:02.598923	519	15	electricity services_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	75ee7177-ef99-457b-b6bb-61ccbab11da0	{}	\N
2022-11-25 13:09:02.606589	2022-11-25 13:09:02.606598	520	15	vehicle finance_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8442e764-8f09-49fc-b794-b87b78416a05	{}	\N
2022-11-25 13:09:02.617117	2022-11-25 13:09:02.617126	521	15	vehicle insurance_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e2a0a7d7-ef6b-432d-ad8f-32b23430c8de	{}	\N
2022-11-25 13:09:02.628839	2022-11-25 13:09:02.628851	522	15	vehicle finance_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a89d4723-e850-4739-ba0f-6e9ba135febd	{}	\N
2022-11-25 13:09:02.636078	2022-11-25 13:09:02.636088	523	15	vehicle insurance_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6b47fc2f-667e-4c8b-968e-76b5942523d6	{}	\N
2022-11-25 13:09:02.648352	2022-11-25 13:09:02.648365	524	15	vehicle finance_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	94368e6a-e869-4974-8a9d-d397413863b5	{}	\N
2022-11-25 13:09:02.655787	2022-11-25 13:09:02.655794	525	15	vehicle insurance_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9edb2a2c-bd61-430d-aa58-8ddab13c1898	{}	\N
2022-11-25 13:09:02.668446	2022-11-25 13:09:02.668456	526	15	life insurance_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	81967f5d-5a69-4500-97b2-55dae18d762a	{}	\N
2022-11-25 13:09:02.676229	2022-11-25 13:09:02.676238	527	15	life insurance_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	44853977-a8c8-4a18-ba55-bab967d3aa9e	{}	\N
2022-11-25 13:09:02.693314	2022-11-25 13:09:02.693328	528	15	life insurance_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b7f2eeeb-11f0-4155-99f7-65915691bf7c	{}	\N
2022-11-25 13:09:02.701758	2022-11-25 13:09:02.701767	529	15	money transfers_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c2eaf144-a927-42f0-a248-f216cae681f7	{}	\N
2022-11-25 13:09:02.710147	2022-11-25 13:09:02.710157	530	15	meat provisioners_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7282bf6e-1fa8-450e-8e1e-960137d7fcad	{}	\N
2022-11-25 13:09:02.716685	2022-11-25 13:09:02.716691	531	15	money transfers_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2279db0b-09a2-48cb-afcd-4b89624ed05d	{}	\N
2022-11-25 13:09:02.72421	2022-11-25 13:09:02.724217	532	15	meat provisioners_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a6904ea0-4ee1-4737-b078-3ac4272a31f6	{}	\N
2022-11-25 13:09:02.734377	2022-11-25 13:09:02.734386	533	15	money transfers_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e9bd5715-454d-4e2d-9a08-0103d92b88fe	{}	\N
2022-11-25 13:09:02.742341	2022-11-25 13:09:02.742355	534	15	meat provisioners_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b5966b6e-a5b1-4e7c-93f3-1a947172c94e	{}	\N
2022-11-25 13:09:02.748631	2022-11-25 13:09:02.748637	535	15	debit orders_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b0edc298-a8f4-4bce-a682-63278693d730	{}	\N
2022-11-25 13:09:02.753773	2022-11-25 13:09:02.753779	536	15	debit orders_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	23a18a0b-cb9c-4c36-bc8b-d1cc15cc827e	{}	\N
2022-11-25 13:09:02.761225	2022-11-25 13:09:02.761233	537	15	debit orders_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	91af9067-6b3c-4172-9e8f-fce4fb19e54a	{}	\N
2022-11-25 13:09:02.766673	2022-11-25 13:09:02.766679	538	15	electricity services_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	96bec9d4-6fa1-4ab9-b7da-b2f0264ee195	{}	\N
2022-11-25 13:09:02.772145	2022-11-25 13:09:02.772152	539	15	electricity services_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1e73b8d6-29fa-430a-af24-3141a17db3c6	{}	\N
2022-11-25 13:09:02.780264	2022-11-25 13:09:02.780273	540	15	electricity services_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	333390d2-bf2b-42e5-969f-583fea5cc408	{}	\N
2022-11-25 13:09:02.785632	2022-11-25 13:09:02.785638	541	15	gambling transactions	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b4d2584e-df75-42e9-871d-1cf83f322958	{}	\N
2022-11-25 13:09:02.791704	2022-11-25 13:09:02.791713	542	15	funeral insurance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	66ab5e20-a936-4087-86df-51f6244cd878	{}	\N
2022-11-25 13:09:02.798158	2022-11-25 13:09:02.798164	543	15	hardware stores	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5bf9241e-5e2b-4e43-a44e-9795f5829cdb	{}	\N
2022-11-25 13:09:02.803497	2022-11-25 13:09:02.803503	544	15	loan repayments	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	faefe8d7-7cba-4110-8fc6-729848f0b136	{}	\N
2022-11-25 13:09:02.809439	2022-11-25 13:09:02.809453	545	15	budget repayments	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6ac8f35f-c71e-4acb-b9bd-b3608ca41df6	{}	\N
2022-11-25 13:09:02.815691	2022-11-25 13:09:02.815698	546	15	bank fees	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4e15c89c-0197-46f5-9cbd-0fe1701469c8	{}	\N
2022-11-25 13:09:02.82145	2022-11-25 13:09:02.821457	547	15	vehicle finance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c5755adf-6b7c-4930-b919-2f027a8ce7f8	{}	\N
2022-11-25 13:09:02.828371	2022-11-25 13:09:02.828377	548	15	vehicle insurance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2b1e7778-2a2a-426d-b40d-9660d3c14180	{}	\N
2022-11-25 13:09:02.833756	2022-11-25 13:09:02.833761	549	15	life insurance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c58cde75-b92f-4a50-be5d-4cbf6c207b6f	{}	\N
2022-11-25 13:09:02.839343	2022-11-25 13:09:02.839349	550	15	money transfers	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	44183a41-2289-41ad-b565-d13654b1a307	{}	\N
2022-11-25 13:09:02.846611	2022-11-25 13:09:02.846619	551	15	meat provisioners	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	62c1e5fd-6339-4098-aeb3-cc2c1bb3a3b9	{}	\N
2022-11-25 13:09:02.852382	2022-11-25 13:09:02.852392	552	15	debit orders	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	019593ec-55d2-4e22-928b-cae2cb7b6fd8	{}	\N
2022-11-25 13:09:02.859754	2022-11-25 13:09:02.859769	553	15	electricity services	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	30759de3-02ee-455b-9008-aa6e1a1078d6	{}	\N
2022-11-25 13:09:02.865737	2022-11-25 13:09:02.865743	554	15	na_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ad6b87b6-0cce-43f6-ad7f-83e752686cda	{}	\N
2022-11-25 13:09:02.871072	2022-11-25 13:09:02.871078	555	15	moneysend_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	40041a57-593a-45cf-93eb-f335436f4158	{}	\N
2022-11-25 13:09:02.877362	2022-11-25 13:09:02.877393	556	15	interest_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a055165c-3ac6-49b7-b3cb-23ba51000281	{}	\N
2022-11-25 13:09:02.883333	2022-11-25 13:09:02.883341	557	15	na_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5f406cbc-ca08-474f-baf5-88e4a415108a	{}	\N
2022-11-25 13:09:02.889154	2022-11-25 13:09:02.88916	558	15	moneysend_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bc5f7dc6-766d-4011-83fc-ce4b6375fa4a	{}	\N
2022-11-25 13:09:02.895934	2022-11-25 13:09:02.895942	559	15	interest_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fa75b5d8-ec4d-42b4-b470-70104d460a46	{}	\N
2022-11-25 13:09:02.902573	2022-11-25 13:09:02.902581	560	15	na_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a302b09b-0aeb-4504-9f9b-5072c2430182	{}	\N
2022-11-25 13:09:02.907692	2022-11-25 13:09:02.907698	561	15	moneysend_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	dd32ca1f-58c5-4869-8cb5-1a4b0390a99f	{}	\N
2022-11-25 13:09:02.914741	2022-11-25 13:09:02.91475	562	15	interest_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	082582b5-a5b6-408b-b485-f72af89feb23	{}	\N
2022-11-25 13:09:02.920053	2022-11-25 13:09:02.920059	563	15	eff_date_date_start	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	34037971-e43e-4f98-9379-d88b80760331	{}	\N
2022-11-25 13:09:02.926325	2022-11-25 13:09:02.926334	564	15	eff_date_date_end	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	65b38eee-568c-42d4-8d9d-51f0aeabbe0b	{}	\N
2022-11-25 13:09:02.931887	2022-11-25 13:09:02.931921	565	15	eff_date_date	f	t	ARRAY	t	t	\N	35	35	\N	\N	\N	4ddb2e87-f983-41cc-9fdf-8f1373bc8b08	{}	\N
2022-11-25 13:09:02.938247	2022-11-25 13:09:02.938255	566	15	categories_total_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	799ad200-dfa8-4eae-b1ac-2a3ce90aa039	{}	\N
2022-11-25 13:09:02.944514	2022-11-25 13:09:02.944521	567	15	categories_total_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3516dfa0-772c-4692-bb36-fd46bbd5c3f1	{}	\N
2022-11-25 13:09:02.949759	2022-11-25 13:09:02.949767	568	15	categories_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5a11daaa-af60-41ef-9223-dcf6321b5024	{}	\N
2022-11-25 13:09:02.956004	2022-11-25 13:09:02.956012	569	15	categories_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	09b0de62-16af-40a3-9c7b-a3f2c286dade	{}	\N
2022-11-25 13:09:02.96299	2022-11-25 13:09:02.962996	570	15	na_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	18d2e994-1241-4d7a-8eee-1509b840066a	{}	\N
2022-11-25 13:09:02.96956	2022-11-25 13:09:02.969566	571	15	na_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5077cd7f-674b-4a48-a7ba-dd7cd4db2ed4	{}	\N
2022-11-25 13:09:02.976525	2022-11-25 13:09:02.976535	572	15	moneysend_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9fccb620-1bd3-4bda-8254-b949341f1c3c	{}	\N
2022-11-25 13:09:02.982629	2022-11-25 13:09:02.982635	573	15	interest_count_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	de695242-6984-47bb-8e6e-657326cb03b8	{}	\N
2022-11-25 13:09:02.988095	2022-11-25 13:09:02.988102	574	15	moneysend_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1ceb8bf3-89f3-4b33-9021-993d9cf787ad	{}	\N
2022-11-25 13:09:02.995603	2022-11-25 13:09:02.995614	575	15	interest_count_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c9c6d434-e102-4fca-b662-89e55e0a4595	{}	\N
2022-11-25 13:09:03.001233	2022-11-25 13:09:03.001239	576	15	categories_total	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5718fb78-a27c-4449-9250-b6db643156fb	{}	\N
2022-11-25 13:09:03.007698	2022-11-25 13:09:03.007704	577	15	na_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	11bc75ec-608b-44fd-b637-ad1a3df9f2e5	{}	\N
2022-11-25 13:09:03.015863	2022-11-25 13:09:03.015869	578	15	na_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	16a6f984-cc1b-4e15-84fe-5ee2dac7e8e0	{}	\N
2022-11-25 13:09:03.022379	2022-11-25 13:09:03.022387	579	15	na_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f2828814-5b17-40ec-b893-710c4be53915	{}	\N
2022-11-25 13:09:03.028783	2022-11-25 13:09:03.02879	580	15	na_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9f81b7e1-a921-457c-b7e9-660bdd73ffbb	{}	\N
2022-11-25 13:09:03.034342	2022-11-25 13:09:03.034348	581	15	categories_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4f52dbe3-6415-476e-a258-33c7c7709e26	{}	\N
2022-11-25 13:09:03.039303	2022-11-25 13:09:03.039309	582	15	na_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e65c79d7-29dd-43bc-b8e7-86ff82524867	{}	\N
2022-11-25 13:09:03.045768	2022-11-25 13:09:03.045775	583	15	moneysend_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	541b468b-cea7-4b5f-aa1c-88183de8ec23	{}	\N
2022-11-25 13:09:03.051144	2022-11-25 13:09:03.05115	584	15	na_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a550f4a0-354b-46d7-9309-ab680a694e15	{}	\N
2022-11-25 13:09:03.056107	2022-11-25 13:09:03.056113	585	15	interest_lagdiff	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4d2503a9-8b05-4328-bf7c-31b285760db5	{}	\N
2022-11-25 13:09:03.06537	2022-11-25 13:09:03.065379	586	15	moneysend_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4f29c3c2-8ea3-4beb-87aa-d010d6a483bf	{}	\N
2022-11-25 13:09:03.071094	2022-11-25 13:09:03.071104	587	15	moneysend_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	adc63392-9c48-4242-850d-1ed29bf408d8	{}	\N
2022-11-25 13:09:03.078467	2022-11-25 13:09:03.078474	588	15	moneysend_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	751912b6-51d0-4712-8dcb-011142a43e8a	{}	\N
2022-11-25 13:09:03.085186	2022-11-25 13:09:03.085194	589	15	interest_lag	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cdb2254e-bdcf-4526-b1e4-b189567b2dd4	{}	\N
2022-11-25 13:09:03.090951	2022-11-25 13:09:03.090962	590	15	interest_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	617b6778-3f17-483e-85b5-b81bb842be7c	{}	\N
2022-11-25 13:09:03.098328	2022-11-25 13:09:03.098335	591	15	interest_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	44d4d1ed-f44b-4734-836f-0658fa1e5495	{}	\N
2022-11-25 13:09:03.108459	2022-11-25 13:09:03.108473	592	15	na_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fe29a892-dd03-40d0-bd1e-6d7defb5126e	{}	\N
2022-11-25 13:09:03.115124	2022-11-25 13:09:03.11513	593	15	moneysend_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e77ccb28-1e1a-43d5-a18c-7bf4072eaace	{}	\N
2022-11-25 13:09:03.120448	2022-11-25 13:09:03.120456	594	15	interest_count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	91dc832b-79eb-43db-b2a2-5493119f0e3b	{}	\N
2022-11-25 13:09:03.128775	2022-11-25 13:09:03.128782	595	15	moneysend_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5edfe1f0-3791-4753-9ed2-74fdd3625ffd	{}	\N
2022-11-25 13:09:03.134094	2022-11-25 13:09:03.1341	596	15	interest_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b0c4f2b6-2d26-4993-826a-ace524dbf0db	{}	\N
2022-11-25 13:09:03.139633	2022-11-25 13:09:03.139639	597	15	moneysend_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f077a3e0-2865-4753-a05e-83a7cef2705f	{}	\N
2022-11-25 13:09:03.146214	2022-11-25 13:09:03.14622	598	15	interest_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4a35f77b-1c0f-4545-b7a6-39b7bf228368	{}	\N
2022-11-25 13:09:03.151593	2022-11-25 13:09:03.151599	599	15	na	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	684f6ddc-416e-4387-90b3-cc1bb16b0d9f	{}	\N
2022-11-25 13:09:03.157592	2022-11-25 13:09:03.157599	600	15	moneysend	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3356c6d7-fb9e-451d-9909-87b9f8554dd8	{}	\N
2022-11-25 13:09:03.164315	2022-11-25 13:09:03.164321	601	15	interest	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e5fb5118-b80d-4d54-a9bb-76a2e9f88fd9	{}	\N
2022-11-25 13:09:06.058709	2022-11-25 13:09:06.058718	602	15	customer	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	026a79e2-8e3b-4806-ba18-f08cc3a36df4	{}	\N
2022-11-25 13:09:06.103046	2022-11-25 13:09:06.103052	603	16	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	bce9d59b-4e60-49c3-b362-450e0f50b411	\N	\N
2022-11-25 13:09:06.109817	2022-11-25 13:09:06.109825	604	16	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	16e68bd3-880b-4bd5-baea-b9d68fea9500	\N	\N
2022-11-25 13:09:06.116159	2022-11-25 13:09:06.116167	605	16	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	98f4d04e-7c4a-4cae-b169-8296a4c4eb90	\N	\N
2022-11-25 13:09:06.121668	2022-11-25 13:09:06.121674	606	16	duration	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1111a528-5620-4790-8c83-fb06961d760b	\N	\N
2022-11-25 13:09:06.128409	2022-11-25 13:09:06.128416	607	16	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f57ce186-af38-41db-9b37-3c0776642a97	\N	\N
2022-11-25 13:09:06.134584	2022-11-25 13:09:06.134592	608	16	user	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2064e219-911f-4ec8-a877-bc8638412d96	\N	\N
2022-11-25 13:09:06.140152	2022-11-25 13:09:06.14016	609	16	timestamp	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	42a3e764-5376-486d-9a13-f7b101db4826	\N	\N
2022-11-25 13:09:06.148376	2022-11-25 13:09:06.148383	610	16	validation_classification_error	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8f28f89e-1741-46c5-86b9-625dc3b53553	\N	\N
2022-11-25 13:09:06.154018	2022-11-25 13:09:06.154027	611	16	training_classification_error	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3dc57e19-4266-4d73-b5ba-753220224493	\N	\N
2022-11-25 13:09:06.15984	2022-11-25 13:09:06.159847	612	16	validation_pr_auc	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4c2de04d-9825-4b26-afdb-151a6e70d034	\N	\N
2022-11-25 13:09:06.16577	2022-11-25 13:09:06.165776	613	16	training_pr_auc	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5750331d-89cf-4e3a-8e65-d6f305d1f604	\N	\N
2022-11-25 13:09:06.170722	2022-11-25 13:09:06.170729	614	16	number_of_trees	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5941b097-552b-4c5c-88c6-163de77cc1b4	\N	\N
2022-11-25 13:09:06.176167	2022-11-25 13:09:06.176177	615	16	validation_auc	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	87926686-a43b-4a81-bbdd-bd3c33507a51	\N	\N
2022-11-25 13:09:06.182969	2022-11-25 13:09:06.182974	616	16	training_auc	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	108d37ce-e77f-4a1b-93ca-157d0116f202	\N	\N
2022-11-25 13:09:06.18816	2022-11-25 13:09:06.188167	617	16	validation_rmse	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cba6bbfe-57ec-4948-80e8-976d062edf5c	\N	\N
2022-11-25 13:09:06.194632	2022-11-25 13:09:06.194639	618	16	validation_lift	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f0f76564-edfb-457b-8240-3107699647f6	\N	\N
2022-11-25 13:09:06.200099	2022-11-25 13:09:06.200105	619	16	validation_logloss	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4e9b5f27-6162-49ae-aadf-bb4db78d5b44	\N	\N
2022-11-25 13:09:06.205253	2022-11-25 13:09:06.205259	620	16	training_rmse	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	153e91aa-316a-49bd-8936-780db5fb83c3	\N	\N
2022-11-25 13:09:06.21167	2022-11-25 13:09:06.21168	621	16	training_lift	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	988da4a2-2b1c-4b0c-9456-fd12fdb4e0a8	\N	\N
2022-11-25 13:09:09.110117	2022-11-25 13:09:09.110128	622	16	training_logloss	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ab9a8178-20c8-49c5-94b4-8c7440386dee	\N	\N
2022-11-25 13:09:09.160697	2022-11-25 13:09:09.160707	623	17	timestamp	f	t	VARCHAR	t	t	\N	35	35	\N	\N	%Y/%d/%m	7bcc3f42-bb91-46ee-9e96-41633d7d0ce1	{"warning_markdown": null}	\N
2022-11-25 13:09:09.166441	2022-11-25 13:09:09.166447	624	17	algo_full_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b9b92888-f10c-492e-9843-334c18b8e545	{"warning_markdown": null}	\N
2022-11-25 13:09:09.171241	2022-11-25 13:09:09.171247	625	17	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8df40750-20c1-400c-ba78-88fa446b217c	{"warning_markdown": null}	\N
2022-11-25 13:09:09.176857	2022-11-25 13:09:09.176864	626	17	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2113b301-f721-4f00-a6e8-feb386d50a5d	{"warning_markdown": null}	\N
2022-11-25 13:09:09.182881	2022-11-25 13:09:09.182887	627	17	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6443757b-cdd2-4272-9e03-9f18e475170d	{"warning_markdown": null}	\N
2022-11-25 13:09:09.188892	2022-11-25 13:09:09.188898	628	17	userid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0ea09459-1c85-4718-9a10-e3336a894721	{"warning_markdown": null}	\N
2022-11-25 13:09:09.195997	2022-11-25 13:09:09.196007	629	17	have_mojo	f	t	BOOLEAN	t	t	\N	35	35	\N	\N	\N	e3f60f31-7b66-43f5-8390-c7ec5160ccfe	{"warning_markdown": null}	\N
2022-11-25 13:09:09.201016	2022-11-25 13:09:09.201022	630	17	have_pojo	f	t	BOOLEAN	t	t	\N	35	35	\N	\N	\N	397a7834-09cc-4bc4-a48a-f3ec838ed48e	{"warning_markdown": null}	\N
2022-11-25 13:09:09.205751	2022-11-25 13:09:09.205757	631	17	__meta	f	t	ROW	t	t	\N	35	35	\N	\N	\N	df8434dd-f17e-4556-a26d-812da7ee6251	{"warning_markdown": null}	\N
2022-11-25 13:09:09.212443	2022-11-25 13:09:09.212449	632	17	data_frame	f	t	ROW	t	t	\N	35	35	\N	\N	\N	b83c5f14-77d5-4bdc-912f-a77cc1b2d30c	{"warning_markdown": null}	\N
2022-11-25 13:09:12.121837	2022-11-25 13:09:12.122007	633	17	model_id	f	t	ROW	t	t	\N	35	35	\N	\N	\N	a290fdb2-3136-45e8-9ad7-a932334ae3a1	{"warning_markdown": null}	\N
2022-11-25 13:09:12.195451	2022-11-25 13:09:12.195458	634	18	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	25f533db-0ace-4624-ac3d-88d80be54f16	{"warning_markdown": null}	\N
2022-11-25 13:09:12.201872	2022-11-25 13:09:12.20188	635	18	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e47e4050-42c2-459f-935f-c63ae392966d	{"warning_markdown": null}	\N
2022-11-25 13:09:12.208784	2022-11-25 13:09:12.208794	636	18	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d3b0db54-2ae2-4bc4-9836-0a049d762f45	{"warning_markdown": null}	\N
2022-11-25 13:09:12.215703	2022-11-25 13:09:12.21571	637	18	variable	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	852f6214-9b08-41a8-bf45-f8463ab6ecab	{"warning_markdown": null}	\N
2022-11-25 13:09:12.22146	2022-11-25 13:09:12.221466	638	18	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b5bcad27-e45f-4f02-926d-9c5369817b30	{"warning_markdown": null}	\N
2022-11-25 13:09:12.227989	2022-11-25 13:09:12.227996	639	18	user	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7284bee1-d7a5-4979-847f-0f7a75b8658b	{"warning_markdown": null}	\N
2022-11-25 13:09:12.233248	2022-11-25 13:09:12.233255	640	18	scaled_importance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	54d617a0-3112-48eb-837e-0b675b106cec	{"warning_markdown": null}	\N
2022-11-25 13:09:12.238227	2022-11-25 13:09:12.238233	641	18	relative_importance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	11a9a305-1278-4e84-bc41-eac132108d80	{"warning_markdown": null}	\N
2022-11-25 13:09:15.141017	2022-11-25 13:09:15.141025	642	18	percentage	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5bc9f762-79cc-4bfd-a913-c0e6fb145bac	{"warning_markdown": null}	\N
2022-11-25 13:09:15.18926	2022-11-25 13:09:15.189266	643	19	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3a3ccad7-d86e-40e5-8692-cee7fbaf860f	{"warning_markdown": null}	\N
2022-11-25 13:09:15.195412	2022-11-25 13:09:15.195419	644	19	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	88f331ab-e1b2-47a1-8684-63ef864ac65c	{"warning_markdown": null}	\N
2022-11-25 13:09:15.200664	2022-11-25 13:09:15.200671	645	19	model_category	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	cd7ead3f-e39a-4870-bc33-f5546cc6e4a8	{"warning_markdown": null}	\N
2022-11-25 13:09:15.205413	2022-11-25 13:09:15.205419	646	19	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	296c90bd-8fbd-4aa8-ab4c-1b5a19cf01a2	{"warning_markdown": null}	\N
2022-11-25 13:09:15.211521	2022-11-25 13:09:15.211527	647	19	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	eefc1136-d0f4-4f8d-8870-15210aefa1e9	{"warning_markdown": null}	\N
2022-11-25 13:09:15.216471	2022-11-25 13:09:15.216476	648	19	user	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a1795053-3c57-4759-938f-2c29ae86caeb	{"warning_markdown": null}	\N
2022-11-25 13:09:18.135493	2022-11-25 13:09:18.135502	649	19	number_of_trees	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9cfc565a-0a66-419f-9239-88cbbda6c932	{"warning_markdown": null}	\N
2022-11-25 13:09:18.220187	2022-11-25 13:09:18.220201	650	20	validation_pr_auc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	cdb53dee-a3ba-4334-8339-8ce82b7df1c9	\N	\N
2022-11-25 13:09:18.233273	2022-11-25 13:09:18.233281	651	20	training_pr_auc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	55c38158-dd61-4b7f-81c9-238471aa3a3c	\N	\N
2022-11-25 13:09:18.240261	2022-11-25 13:09:18.24027	652	20	algo_full_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7055b5fc-74eb-401d-aedb-988fb553aedb	\N	\N
2022-11-25 13:09:18.256284	2022-11-25 13:09:18.256325	653	20	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0776ee03-ed86-4e8c-a117-2ae4ee21752b	\N	\N
2022-11-25 13:09:18.26487	2022-11-25 13:09:18.264885	654	20	validation_auc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c7254735-3d69-4f51-a3f4-37d5c4b7aaa4	\N	\N
2022-11-25 13:09:18.272623	2022-11-25 13:09:18.272631	655	20	training_auc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	566a5256-294d-4347-b610-4e45273934a7	\N	\N
2022-11-25 13:09:18.280811	2022-11-25 13:09:18.280821	656	20	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	06363efd-2d8f-4102-a7dd-6e86f5a917c7	\N	\N
2022-11-25 13:09:18.289243	2022-11-25 13:09:18.28925	657	20	duration	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	bf65f999-ce58-430b-b0c9-6e379d54ed71	\N	\N
2022-11-25 13:09:18.298581	2022-11-25 13:09:18.2986	658	20	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7cc6f484-85f7-48a3-ab32-36c895e52044	\N	\N
2022-11-25 13:09:18.315968	2022-11-25 13:09:18.315978	659	20	create_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f4b9401e-83c3-4bd4-b7a3-0577c5985f86	\N	\N
2022-11-25 13:09:18.323949	2022-11-25 13:09:18.323965	660	20	timestamp	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b5a67fca-897d-4c68-9439-182cb8efe266	\N	\N
2022-11-25 13:09:18.339726	2022-11-25 13:09:18.339736	661	20	validation_classification_error	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1cb3d3fe-32fe-4cc5-bc30-69a0b6f8ada5	\N	\N
2022-11-25 13:09:18.352865	2022-11-25 13:09:18.352871	662	20	training_classification_error	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a2121bdf-6baf-4640-a6c5-c234d468e072	\N	\N
2022-11-25 13:09:18.358156	2022-11-25 13:09:18.358163	663	20	number_of_trees	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	aa0a536d-5eca-4070-9486-f55dcceae9e8	\N	\N
2022-11-25 13:09:18.367002	2022-11-25 13:09:18.367011	664	20	validation_rmse	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8e81ef93-494a-41a3-92bf-a211ea92669d	\N	\N
2022-11-25 13:09:18.373387	2022-11-25 13:09:18.373396	665	20	validation_logloss	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	43862ee4-b0da-4af8-ae88-b4eb840d39fb	\N	\N
2022-11-25 13:09:18.379893	2022-11-25 13:09:18.3799	666	20	training_rmse	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8057df72-428b-4839-9c39-52c3f3459861	\N	\N
2022-11-25 13:09:18.385277	2022-11-25 13:09:18.385298	667	20	training_logloss	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	302a6a7a-0c3c-4c17-84f9-16e60284a7c4	\N	\N
2022-11-25 13:09:21.290545	2022-11-25 13:09:21.290562	668	20	run_time	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7070d97d-bd4b-49ce-86bd-e80a7e8a9ee6	\N	\N
2022-11-25 13:09:21.367523	2022-11-25 13:09:21.367532	669	21	algo_full_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0e3ee4fa-aa90-4318-8013-69ec4cc89e76	\N	\N
2022-11-25 13:09:21.376196	2022-11-25 13:09:21.37621	670	21	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	804432d3-78ef-401d-bbc2-b0d662a146ac	\N	\N
2022-11-25 13:09:21.384878	2022-11-25 13:09:21.384888	671	21	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ff5d0792-bb2b-4a04-bd30-76ba6b82f54d	\N	\N
2022-11-25 13:09:21.39339	2022-11-25 13:09:21.39353	672	21	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ac2de961-6103-40e9-a820-a2fb28b11655	\N	\N
2022-11-25 13:09:21.401588	2022-11-25 13:09:21.401598	673	21	variable	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6a6c0443-87da-4bf1-91e8-f631a6acf701	\N	\N
2022-11-25 13:09:21.41164	2022-11-25 13:09:21.411647	674	21	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c5b2893e-474e-4aeb-bf9b-598bdc109970	\N	\N
2022-11-25 13:09:21.41707	2022-11-25 13:09:21.417076	675	21	scaled_importance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2d566aad-bc27-4de1-b988-d209fdbc9df9	\N	\N
2022-11-25 13:09:21.422255	2022-11-25 13:09:21.422262	676	21	relative_importance	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1b3cc15e-6d57-46b7-860f-5469f303721d	\N	\N
2022-11-25 13:09:21.428467	2022-11-25 13:09:21.428474	677	21	run_time	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	02d5704d-1990-407b-8f33-0cbf072a5c85	\N	\N
2022-11-25 13:09:24.324849	2022-11-25 13:09:24.324861	678	21	percentage	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1e9a54ee-ec03-4662-b008-341fd9f1a023	\N	\N
2022-11-25 13:09:24.386558	2022-11-25 13:09:24.386565	679	22	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7efda3c6-0fd7-4031-8ff2-8fcc5859defd	{"warning_markdown": null}	\N
2022-11-25 13:09:24.393844	2022-11-25 13:09:24.393858	680	22	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1706960b-3f15-4435-b98a-b855648af3df	{"warning_markdown": null}	\N
2022-11-25 13:09:24.400207	2022-11-25 13:09:24.400214	681	22	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e97dcc64-b84d-43f0-8e16-1b4e27c430b5	{"warning_markdown": null}	\N
2022-11-25 13:09:24.405426	2022-11-25 13:09:24.405432	682	22	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8ba15de7-623c-4e52-93a4-a9c974c5e53f	{"warning_markdown": null}	\N
2022-11-25 13:09:24.41184	2022-11-25 13:09:24.411847	683	22	number_of_internal_trees	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4b8fdb12-2564-4ff7-8eb3-6d1655d67e64	{"warning_markdown": null}	\N
2022-11-25 13:09:24.416627	2022-11-25 13:09:24.416633	684	22	model_size_in_bytes	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0795def3-aadd-4351-84ba-b786b41c329f	{"warning_markdown": null}	\N
2022-11-25 13:09:24.421208	2022-11-25 13:09:24.421214	685	22	number_of_trees	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9fb82131-f63f-4d9b-9594-5e53f4503bf4	{"warning_markdown": null}	\N
2022-11-25 13:09:24.428378	2022-11-25 13:09:24.428385	686	22	mean_leaves	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9674087d-8f98-407d-b4d8-eb83ef3e26da	{"warning_markdown": null}	\N
2022-11-25 13:09:24.433529	2022-11-25 13:09:24.433535	687	22	max_leaves	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4af93c23-5e59-4c18-aea9-18fecc342d3e	{"warning_markdown": null}	\N
2022-11-25 13:09:24.438351	2022-11-25 13:09:24.438357	688	22	mean_depth	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f6f4eec4-7c76-4ac2-a537-2fb9b1dba8f0	{"warning_markdown": null}	\N
2022-11-25 13:09:24.444745	2022-11-25 13:09:24.444754	689	22	max_depth	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f56b9bec-a8e3-4bf3-9bd1-67e23f560fd2	{"warning_markdown": null}	\N
2022-11-25 13:09:24.449943	2022-11-25 13:09:24.449949	690	22	min_leaves	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1c66a31b-5fc6-4638-bb61-afce9d0494d3	{"warning_markdown": null}	\N
2022-11-25 13:09:24.454694	2022-11-25 13:09:24.4547	691	22	min_depth	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a2f1d825-fa96-422c-8ec5-016feead43c1	{"warning_markdown": null}	\N
2022-11-25 13:09:24.461725	2022-11-25 13:09:24.461732	692	22	model_category	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ecc3c188-b8a9-4f37-a949-c9a51cbf7012	{}	\N
2022-11-25 13:09:27.397542	2022-11-25 13:09:27.397557	693	22	user	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8372f34b-73c7-417a-8791-de198ee5d763	{}	\N
2022-11-25 13:09:27.461706	2022-11-25 13:09:27.461718	694	23	a1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ef3d9af5-3e02-4f67-8064-784b75bace60	\N	\N
2022-11-25 13:09:27.467508	2022-11-25 13:09:27.467515	695	23	b1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	81ce9be6-abd0-4377-9de8-ac3c73d4047e	\N	\N
2022-11-25 13:09:27.473367	2022-11-25 13:09:27.473374	696	23	response_column_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3541e226-3579-487d-9fd1-07cc565dff57	\N	\N
2022-11-25 13:09:27.480352	2022-11-25 13:09:27.480359	697	23	create_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1f84426b-bb16-4538-843e-af318ab59921	\N	\N
2022-11-25 13:09:27.486167	2022-11-25 13:09:27.486175	698	23	model_identity	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fb520ceb-16a8-4ad5-81b9-461d7acda86b	\N	\N
2022-11-25 13:09:27.491528	2022-11-25 13:09:27.491535	699	23	algo	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	92e1c4c7-d8c6-4169-a4e0-28fc930b6bcf	\N	\N
2022-11-25 13:09:27.498682	2022-11-25 13:09:27.498689	700	23	key	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	666547c5-00df-4495-945b-119364df9ff2	\N	\N
2022-11-25 13:09:27.50429	2022-11-25 13:09:27.504297	701	23	user	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	01426fb5-5aa4-4b88-a013-5bb8445b213e	\N	\N
2022-11-25 13:09:27.510381	2022-11-25 13:09:27.5104	702	23	value	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	08ffede0-c45f-4e19-beb7-37d2a233296a	\N	\N
2022-11-25 13:09:27.516678	2022-11-25 13:09:27.516685	703	23	a	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	53aad836-bb97-42c8-b010-0a0352a9991e	\N	\N
2022-11-25 13:09:30.424574	2022-11-25 13:09:30.424591	704	23	b	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	693f0506-602f-450e-983c-27aeb2030efd	\N	\N
2022-11-25 13:09:30.476196	2022-11-25 13:09:30.476204	705	24	duration_paramsdb_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e092582c-97ec-4895-9db5-b111e213d286	{}	\N
2022-11-25 13:09:30.482196	2022-11-25 13:09:30.482202	706	24	duration_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	222a33af-48e0-4864-81bf-d1b37d9ec54b	{}	\N
2022-11-25 13:09:30.487889	2022-11-25 13:09:30.487895	707	24	duration_paramsdb_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4b3b26e1-125f-485a-8fc4-faf6eace3fe8	{}	\N
2022-11-25 13:09:30.493955	2022-11-25 13:09:30.493966	708	24	duration_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	012093ed-793f-4bfe-9a0b-19b447366838	{}	\N
2022-11-25 13:09:30.500912	2022-11-25 13:09:30.500919	709	24	duration_paramsdb_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3e87407b-4c63-49a0-8ab2-327952b38069	{}	\N
2022-11-25 13:09:30.506186	2022-11-25 13:09:30.506193	710	24	duration_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9250a447-cec7-4179-a5d6-24dd030109d0	{}	\N
2022-11-25 13:09:30.514494	2022-11-25 13:09:30.514501	711	24	predictor	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	149085a4-24d1-43df-a60b-700dfa6cff4a	{}	\N
2022-11-25 13:09:30.519425	2022-11-25 13:09:30.519435	712	24	server	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4b2233f9-84bf-45ac-bf8f-ed1e0caf5a2e	{}	\N
2022-11-25 13:09:30.524767	2022-11-25 13:09:30.524774	713	24	type	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	76229e27-53ee-4105-a97a-5961a7b39bb1	{}	\N
2022-11-25 13:09:30.531433	2022-11-25 13:09:30.531439	714	24	port	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0a0d4fe4-c516-4300-961c-f21d704ff6ea	{}	\N
2022-11-25 13:09:30.536619	2022-11-25 13:09:30.536624	715	24	date_log	t	t	TIMESTAMP	t	t	\N	35	35	\N	\N	\N	9c970c71-7998-43b7-bb6f-7328651e1c19	{}	\N
2022-11-25 13:09:30.541757	2022-11-25 13:09:30.541764	716	24	duration_paramsdb_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bb060127-283b-42e8-a10e-a4c93aaae434	{}	\N
2022-11-25 13:09:30.547805	2022-11-25 13:09:30.547812	717	24	duration_paramsdb_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c609622e-c6eb-49a1-a5e5-7a3606cc8dd0	{}	\N
2022-11-25 13:09:30.552938	2022-11-25 13:09:30.552944	718	24	duration_paramsdb_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0cecaf12-046a-4bf3-9b9a-0eae000b9246	{}	\N
2022-11-25 13:09:30.55813	2022-11-25 13:09:30.558135	719	24	duration_paramsdb_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	32362f43-8d23-488f-84fb-07f32cc084d4	{}	\N
2022-11-25 13:09:30.564088	2022-11-25 13:09:30.564094	720	24	duration_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0ee31ae0-59f0-4f0b-b755-cbcb5009771e	{}	\N
2022-11-25 13:09:30.568796	2022-11-25 13:09:30.568802	721	24	duration_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5ce25ff3-1e2c-4d69-b4e4-40d85b6b602b	{}	\N
2022-11-25 13:09:30.573563	2022-11-25 13:09:30.573569	722	24	duration_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9654159a-365d-48a4-bcf5-5392407a3998	{}	\N
2022-11-25 13:09:30.580346	2022-11-25 13:09:30.580357	723	24	duration_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fd57b539-c8b3-43b6-adee-b897bb4e34e6	{}	\N
2022-11-25 13:09:30.585803	2022-11-25 13:09:30.585809	724	24	date_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	8f3604dd-0365-41e0-ac36-92f28d21a256	{}	\N
2022-11-25 13:09:30.591045	2022-11-25 13:09:30.591051	725	24	day_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	91fe77d0-e996-442a-830c-f7a6df45df3b	{}	\N
2022-11-25 13:09:30.597235	2022-11-25 13:09:30.59724	726	24	minute_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c92b4088-4d61-4e8a-99b8-33555ede7e5b	{}	\N
2022-11-25 13:09:30.602338	2022-11-25 13:09:30.602344	727	24	hour_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ea7e0ad6-b5f1-4981-b605-e260b9ae40d7	{}	\N
2022-11-25 13:09:33.538677	2022-11-25 13:09:33.538693	728	24	count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f6de26c8-46e7-46b8-8c4b-badaf0c95de6	{}	\N
2022-11-25 13:09:33.595285	2022-11-25 13:09:33.595291	729	25	offer_value_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	63df8d33-82fe-42dd-aecf-34c2dfc4818f	\N	\N
2022-11-25 13:09:33.599845	2022-11-25 13:09:33.599851	730	25	score_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3141e3af-8b2f-401e-97cf-faa344a42b79	\N	\N
2022-11-25 13:09:33.60472	2022-11-25 13:09:33.604726	731	25	offer_value_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8a5223f7-e03f-497e-aff4-28d75ee59b22	\N	\N
2022-11-25 13:09:33.610123	2022-11-25 13:09:33.61013	732	25	score_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7e12606f-f94a-494d-b6f7-b6ae506f091f	\N	\N
2022-11-25 13:09:33.614909	2022-11-25 13:09:33.614923	733	25	offer_value_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	aefe2ab1-6fda-4b8c-b976-48b3f38c466f	\N	\N
2022-11-25 13:09:33.619677	2022-11-25 13:09:33.619683	734	25	score_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	91bf98d6-9ed6-4d9b-9614-dc96d4639bcf	\N	\N
2022-11-25 13:09:33.624849	2022-11-25 13:09:33.624856	735	25	predictor	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c4676145-81ec-4586-9c13-604c88754211	\N	\N
2022-11-25 13:09:33.629822	2022-11-25 13:09:33.629829	736	25	model	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8dcc3143-8a86-4e48-b5d0-21ce7fe219d5	\N	\N
2022-11-25 13:09:33.63629	2022-11-25 13:09:33.636296	737	25	type	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6510d163-f7a2-4d07-9e94-b59fa6aecddc	\N	\N
2022-11-25 13:09:33.641624	2022-11-25 13:09:33.641631	738	25	date_log	t	t	TIMESTAMP	t	t	\N	35	35	\N	\N	\N	c2d1da4c-9ab1-4bd9-a7bd-e20a62143beb	\N	\N
2022-11-25 13:09:33.646849	2022-11-25 13:09:33.646878	739	25	offer_value_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	42323846-f5f3-4006-87b4-144d82b2ffd5	\N	\N
2022-11-25 13:09:33.651662	2022-11-25 13:09:33.651668	740	25	offer_value_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ab2fefcb-373a-4f00-858d-bcd5da767555	\N	\N
2022-11-25 13:09:33.656972	2022-11-25 13:09:33.656978	741	25	score_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	76426d14-6600-4eae-be2d-0d340286caef	\N	\N
2022-11-25 13:09:33.66185	2022-11-25 13:09:33.661856	742	25	score_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d42b4c67-7e78-448d-afcb-3642fb417ff6	\N	\N
2022-11-25 13:09:33.666566	2022-11-25 13:09:33.666572	743	25	score_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5322a0d4-f619-4d97-b072-9c2e2780209d	\N	\N
2022-11-25 13:09:33.671686	2022-11-25 13:09:33.671703	744	25	score_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5a48fb40-6f7f-4bd6-82a8-e815c6d7cbf7	\N	\N
2022-11-25 13:09:33.679389	2022-11-25 13:09:33.679395	745	25	offer_value_max	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5e3f695f-4881-4a2a-803f-8b8cc3771575	\N	\N
2022-11-25 13:09:33.684517	2022-11-25 13:09:33.684523	746	25	offer_value_min	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	14f65738-a812-478a-86e4-9b71a0df2660	\N	\N
2022-11-25 13:09:33.689514	2022-11-25 13:09:33.68952	747	25	offer_value_sum	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c139a022-f030-4031-abb0-d5cdf4712f6e	\N	\N
2022-11-25 13:09:33.694251	2022-11-25 13:09:33.694257	748	25	date_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	42d957df-55dd-4f94-9e5f-d89215a127b7	\N	\N
2022-11-25 13:09:33.698794	2022-11-25 13:09:33.6988	749	25	day_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5cebc8ca-fdff-4cb0-ae19-24d40110f4ac	\N	\N
2022-11-25 13:09:33.703734	2022-11-25 13:09:33.70374	750	25	price_sum	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	96d439a0-48b6-4c7b-9d59-29fdab1ed40b	\N	\N
2022-11-25 13:09:33.708289	2022-11-25 13:09:33.708296	751	25	minute_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f25f68b1-7435-4a05-8cc7-eb0aa2b07faf	\N	\N
2022-11-25 13:09:33.713015	2022-11-25 13:09:33.71302	752	25	hour_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	7dc5d523-10d9-4295-ad0d-b88e26c67e21	\N	\N
2022-11-25 13:09:33.717949	2022-11-25 13:09:33.717956	753	25	count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	64ec1425-33c7-4346-9c2b-088d9d06d810	\N	\N
2022-11-25 13:09:36.658382	2022-11-25 13:09:36.658403	754	25	explore	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e253407f-ec61-412f-9565-beff3a5500b6	\N	\N
2022-11-25 13:09:36.720319	2022-11-25 13:09:36.720325	755	26	response_score_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f6a258d8-93a5-48fd-abaf-c33e0e150176	\N	\N
2022-11-25 13:09:36.726185	2022-11-25 13:09:36.726191	756	26	response_offer_90	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b9ab00f6-d499-4309-bbd7-0e57d40f47c4	\N	\N
2022-11-25 13:09:36.730985	2022-11-25 13:09:36.730991	757	26	response_score_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3a10902f-e906-4f7a-98c7-858bf3444eb6	\N	\N
2022-11-25 13:09:36.735975	2022-11-25 13:09:36.735981	758	26	response_offer_75	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0126c9b0-4bfc-421b-a636-5ffbf7a92a68	\N	\N
2022-11-25 13:09:36.740857	2022-11-25 13:09:36.740862	759	26	response_score_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f9c85b30-05c0-4c72-bfba-1566250e33d6	\N	\N
2022-11-25 13:09:36.745782	2022-11-25 13:09:36.745805	760	26	response_offer_95	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3ba3e40b-23de-415f-882a-d991d50bdd6b	\N	\N
2022-11-25 13:09:36.752643	2022-11-25 13:09:36.752649	761	26	predictor	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0fb55e7b-cea0-48f8-94b8-da14ecc320e3	\N	\N
2022-11-25 13:09:36.757487	2022-11-25 13:09:36.757493	762	26	model	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	768f39ba-5dc3-4092-b913-71f04e74b33c	\N	\N
2022-11-25 13:09:36.762577	2022-11-25 13:09:36.762583	763	26	type	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2512aae5-d616-4659-b38b-d9952af885cc	\N	\N
2022-11-25 13:09:36.767178	2022-11-25 13:09:36.767183	764	26	date_log	t	t	TIMESTAMP	t	t	\N	35	35	\N	\N	\N	c9280089-af97-47b8-a55a-0f57e9614094	\N	\N
2022-11-25 13:09:36.772406	2022-11-25 13:09:36.772412	765	26	response_score_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	33052bc2-6002-4562-baf0-30a72f4f42b0	\N	\N
2022-11-25 13:09:36.777159	2022-11-25 13:09:36.777165	766	26	response_score_max	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	41ee6d34-b9c2-4dd3-81ac-242a419382f6	\N	\N
2022-11-25 13:09:36.78199	2022-11-25 13:09:36.781996	767	26	response_offer_avg	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2bd043d1-be48-4550-8d4b-d75b38670eff	\N	\N
2022-11-25 13:09:36.787419	2022-11-25 13:09:36.787425	768	26	response_score_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d7a53b9e-0db7-43ba-8b63-100be4fc1806	\N	\N
2022-11-25 13:09:36.793153	2022-11-25 13:09:36.79316	769	26	response_score_min	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7b79a5ed-651e-468d-9b62-9292c55ebf9f	\N	\N
2022-11-25 13:09:36.798417	2022-11-25 13:09:36.798423	770	26	response_offer_stddevpop	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9ca5d88b-1899-486b-a7ac-5683f6868195	\N	\N
2022-11-25 13:09:36.803368	2022-11-25 13:09:36.803374	771	26	response_offer_max	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e81807b8-bc55-46ca-806b-3f3089ec65d5	\N	\N
2022-11-25 13:09:36.807928	2022-11-25 13:09:36.807934	772	26	response_offer_min	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2af06c8d-c40f-4432-a23e-b6b54e313825	\N	\N
2022-11-25 13:09:36.812709	2022-11-25 13:09:36.812715	773	26	response_offer_sum	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a2bb6ebe-ecdb-44dc-bb48-7b8a5743344d	\N	\N
2022-11-25 13:09:36.818518	2022-11-25 13:09:36.818524	774	26	date_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0a61d3eb-fad7-4937-86b7-2dc4cf3519b2	\N	\N
2022-11-25 13:09:36.823585	2022-11-25 13:09:36.823591	775	26	day_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	956015b3-a86a-45cc-a4dc-a370012b0c7e	\N	\N
2022-11-25 13:09:36.828457	2022-11-25 13:09:36.828463	776	26	minute_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	58cf995e-523f-4990-b963-444453efa23a	\N	\N
2022-11-25 13:09:36.833404	2022-11-25 13:09:36.833409	777	26	hour_index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b49eef9b-989b-4b5b-85ec-50498ef3636c	\N	\N
2022-11-25 13:09:36.838108	2022-11-25 13:09:36.838115	778	26	count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5af293da-2536-4d87-ac94-3b5e0c1f2152	\N	\N
2022-11-25 13:09:39.740914	2022-11-25 13:09:39.740921	779	26	explore	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	df48a37a-5001-4a36-8a06-f629672311cc	\N	\N
2022-11-25 13:09:39.804251	2022-11-25 13:09:39.804269	780	27	date sent to company	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e1825b4c-2cdd-4881-96f2-847fb6ccbf21	{"warning_markdown": null}	\N
2022-11-25 13:09:39.810836	2022-11-25 13:09:39.810851	781	27	company response to consumer	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	40b13a3f-908e-4eff-8418-5d3135062027	{"warning_markdown": null}	\N
2022-11-25 13:09:39.816283	2022-11-25 13:09:39.816289	782	27	consumer consent provided?	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	31ae8123-4768-46ac-8527-9e61b8cf6063	{"warning_markdown": null}	\N
2022-11-25 13:09:39.821526	2022-11-25 13:09:39.821533	783	27	company public response	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1660c52d-cbf4-4363-acba-55efce294532	{"warning_markdown": null}	\N
2022-11-25 13:09:39.827291	2022-11-25 13:09:39.827298	784	27	consumer disputed?	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6421fc96-3085-4e81-83c0-500e3c67fc53	{"warning_markdown": null}	\N
2022-11-25 13:09:39.832743	2022-11-25 13:09:39.832749	785	27	timely response?	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	96772b9b-955a-4d2e-a1f4-7e710e997459	{"warning_markdown": null}	\N
2022-11-25 13:09:39.83775	2022-11-25 13:09:39.837755	786	27	submitted via	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4ce359a1-b511-4131-ad93-1390fce05dea	{"warning_markdown": null}	\N
2022-11-25 13:09:39.844315	2022-11-25 13:09:39.844322	787	27	complaint id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0509b7eb-75ab-47ef-9ec4-eb33c943369f	{"warning_markdown": null}	\N
2022-11-25 13:09:39.849537	2022-11-25 13:09:39.849544	788	27	sub-product	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4d2a52b8-d7c9-41ba-b882-33261c79813c	{"warning_markdown": null}	\N
2022-11-25 13:09:39.854561	2022-11-25 13:09:39.854567	789	27	date_received_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6cfa8f9d-17cd-47fe-bebc-93a95f10507b	{"warning_markdown": null}	\N
2022-11-25 13:09:39.859711	2022-11-25 13:09:39.85972	790	27	date_received_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a7dfa3ca-a98c-4771-a17f-790e2b75c7b7	{"warning_markdown": null}	\N
2022-11-25 13:09:39.865422	2022-11-25 13:09:39.865429	791	27	date_received_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f6bc8850-fa9e-46fe-bfb6-a0954cc755c3	{"warning_markdown": null}	\N
2022-11-25 13:09:39.87103	2022-11-25 13:09:39.871036	792	27	date_received_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b384e55f-acbd-48fe-b98b-4b7e76259e6e	{"warning_markdown": null}	\N
2022-11-25 13:09:39.877576	2022-11-25 13:09:39.877583	793	27	consumer_complaint_narrative	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	60d33f6b-d759-4a3b-9972-a84c03a9a02c	{"warning_markdown": null}	\N
2022-11-25 13:09:39.883095	2022-11-25 13:09:39.883101	794	27	date_received_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	40e0826d-6140-4c74-b324-0587449a65eb	{"warning_markdown": null}	\N
2022-11-25 13:09:39.888068	2022-11-25 13:09:39.888077	795	27	date_received	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d10ade37-8522-482f-abe5-0872007422a7	{"warning_markdown": null}	\N
2022-11-25 13:09:39.894046	2022-11-25 13:09:39.894053	796	27	sub_issue	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	cbc9dccf-90b7-45c0-8ebc-4dc1bf57ece0	{"warning_markdown": null}	\N
2022-11-25 13:09:39.902738	2022-11-25 13:09:39.902745	797	27	company	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b04fa99e-8749-473b-a605-e8647210eec2	{"warning_markdown": null}	\N
2022-11-25 13:09:39.908261	2022-11-25 13:09:39.908267	798	27	state	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f547ea34-e9c6-4215-a63f-3e3598283787	{"warning_markdown": null}	\N
2022-11-25 13:09:39.915019	2022-11-25 13:09:39.915026	799	27	tags	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	164fbba5-c3ca-43ac-9762-8d191555709c	{"warning_markdown": null}	\N
2022-11-25 13:09:39.920191	2022-11-25 13:09:39.920198	800	27	product	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	88e77c76-2492-4257-bde5-f455270497ad	{"warning_markdown": null}	\N
2022-11-25 13:09:39.925865	2022-11-25 13:09:39.925875	801	27	issue	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ceedbff5-a7e4-43e6-937d-1fe9be9bf197	{"warning_markdown": null}	\N
2022-11-25 13:09:39.933312	2022-11-25 13:09:39.933318	802	27	date_received_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a21cdfc8-88c7-4139-a6a8-329559ed86e4	{"warning_markdown": null}	\N
2022-11-25 13:09:39.938418	2022-11-25 13:09:39.938424	803	27	count	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	29d5af03-be40-4a68-8dc0-250a15738db3	{"warning_markdown": null}	\N
2022-11-25 13:09:39.944379	2022-11-25 13:09:39.944387	804	27	date_received_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0f4cd774-6e6d-46bb-8e52-d2715e368d5a	{"warning_markdown": null}	\N
2022-11-25 13:09:39.949278	2022-11-25 13:09:39.949299	805	27	date_received_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0ccb23b5-eb80-44cb-8e43-3719847a1182	{"warning_markdown": null}	\N
2022-11-25 13:09:39.954056	2022-11-25 13:09:39.954062	806	27	date_received_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c1c33e7e-9744-4e5c-ae8d-1fee4a53ed96	{"warning_markdown": null}	\N
2022-11-25 13:09:39.960206	2022-11-25 13:09:39.960213	807	27	date_received_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	eddc394d-09b8-45b4-923e-2a6c0f99a31c	{"warning_markdown": null}	\N
2022-11-25 13:09:39.965524	2022-11-25 13:09:39.965531	808	27	date_received_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d3f54c7c-1762-48ad-9d30-e578ad8c6119	{"warning_markdown": null}	\N
2022-11-25 13:09:39.971827	2022-11-25 13:09:39.971833	809	27	date_received_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	52049f94-bea0-4c69-96f6-c9149b532e10	{"warning_markdown": null}	\N
2022-11-25 13:09:39.977212	2022-11-25 13:09:39.977218	810	27	date_received_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e258944c-2da9-4125-bff7-a60be82b484a	{"warning_markdown": null}	\N
2022-11-25 13:09:39.981993	2022-11-25 13:09:39.982	811	27	date_received_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	895b9591-7336-4b43-aa03-b2d7ee250c78	{"warning_markdown": null}	\N
2022-11-25 13:09:42.929307	2022-11-25 13:09:42.929324	812	27	zip_code	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	9c59be69-9e09-4f95-9cf4-b0708847b3bd	{"warning_markdown": null}	\N
2022-11-25 13:09:42.994054	2022-11-25 13:09:42.99406	813	28	cbsa_metro_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	81a64f0f-dadd-4543-8916-5d04fe95e943	\N	\N
2022-11-25 13:09:42.998642	2022-11-25 13:09:42.998647	814	28	cbsa_div	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	960803fc-5644-41b6-ae46-5ab76b6d9d96	\N	\N
2022-11-25 13:09:43.004899	2022-11-25 13:09:43.004906	815	28	bkclass	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	58087c36-61c6-4d67-a776-1d939e3dbade	\N	\N
2022-11-25 13:09:43.010046	2022-11-25 13:09:43.010052	816	28	cbsa	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	42c4d5bf-9323-491f-a20c-3b22d9f10507	\N	\N
2022-11-25 13:09:43.019719	2022-11-25 13:09:43.019725	818	28	address	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1e2cbd26-42e7-456d-92ed-ba1ba3d45b7d	\N	\N
2022-11-25 13:09:43.025953	2022-11-25 13:09:43.02596	819	28	rundate	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5d8acff3-1ebd-4799-9a3d-1584dc68e508	\N	\N
2022-11-25 13:09:43.030786	2022-11-25 13:09:43.030792	820	28	offname	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	44117791-a495-480c-9fa4-7fc0904abc2c	\N	\N
2022-11-25 13:09:43.035687	2022-11-25 13:09:43.035693	821	28	stname	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6926df6b-3831-4ead-9ffb-c11de96d4789	\N	\N
2022-11-25 13:09:43.040517	2022-11-25 13:09:43.040523	822	28	name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	278b3051-d369-44a9-8268-20ab3941a05e	\N	\N
2022-11-25 13:09:43.045458	2022-11-25 13:09:43.045464	823	28	stalp	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	730fc296-1535-4b4a-bdbe-76969c7bcae4	\N	\N
2022-11-25 13:09:43.050343	2022-11-25 13:09:43.050349	824	28	city	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8d599311-3001-4e7f-9a3d-759120b7638b	\N	\N
2022-11-25 13:09:43.056334	2022-11-25 13:09:43.056342	825	28	county	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3e3de202-a98f-4184-84f6-dd8e8804a301	\N	\N
2022-11-25 13:09:43.062178	2022-11-25 13:09:43.062184	826	28	estymd	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7c8edc74-fb75-400c-91f3-1290244bbec5	\N	\N
2022-11-25 13:09:43.067275	2022-11-25 13:09:43.067281	827	28	lat	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	62ec69f5-8c3f-4fbe-affc-d77e6fa26dc7	\N	\N
2022-11-25 13:09:43.072214	2022-11-25 13:09:43.072219	828	28	lng	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	afa8d63c-894f-47ee-9ff4-82652bdfa9a8	\N	\N
2022-11-25 13:09:43.077082	2022-11-25 13:09:43.077143	829	28	cbsa_micro_flg	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	cc9fed2f-8714-498f-9118-465a469507bd	\N	\N
2022-11-25 13:09:43.081856	2022-11-25 13:09:43.081862	830	28	cbsa_div_flg	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b0f67a3e-06de-4521-91ca-11437f0248de	\N	\N
2022-11-25 13:09:43.0868	2022-11-25 13:09:43.086806	831	28	cbsa_div_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	57e4a8f0-8204-4c22-9b09-1b13d839bced	\N	\N
2022-11-25 13:09:43.09162	2022-11-25 13:09:43.091626	832	28	cbsa_metro_flg	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2a347f1c-1691-4047-9465-4a377dd14d80	\N	\N
2022-11-25 13:09:43.096647	2022-11-25 13:09:43.096653	833	28	cbsa_metro	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c1695e09-12c6-4e93-bde7-13f3610b6cc7	\N	\N
2022-11-25 13:09:43.102074	2022-11-25 13:09:43.102084	834	28	cbsa_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	fcd2a5a2-a3f3-4b68-a029-58d237dc4dd7	\N	\N
2022-11-25 13:09:43.108929	2022-11-25 13:09:43.108938	835	28	csa_flg	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d82b195d-2e32-40ac-9ad0-9a4ec55c648d	\N	\N
2022-11-25 13:09:43.113983	2022-11-25 13:09:43.113989	836	28	csa_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b7c60450-874c-4469-84bf-b06cf6b640ee	\N	\N
2022-11-25 13:09:43.119023	2022-11-25 13:09:43.11903	837	28	fi_uninum	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b364a2fc-83e1-4b3e-a936-8b712d684adc	\N	\N
2022-11-25 13:09:43.123868	2022-11-25 13:09:43.123874	838	28	mainoff	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	7e77d75a-5031-489b-84d8-cd09fc95c9be	\N	\N
2022-11-25 13:09:43.128724	2022-11-25 13:09:43.12873	839	28	cert	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	671f3f31-e615-4853-b199-30c043654bc6	\N	\N
2022-11-25 13:09:43.133768	2022-11-25 13:09:43.133775	840	28	stcnty	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ce107e95-c735-4f60-9cc6-74804451aef2	\N	\N
2022-11-25 13:09:43.13878	2022-11-25 13:09:43.138786	841	28	servtype	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	95f5abb2-c150-4c4e-b700-8d6a3b045fe1	\N	\N
2022-11-25 13:09:43.143876	2022-11-25 13:09:43.143882	842	28	offnum	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	99b8225c-e98b-4816-9cb3-60c5e12eb05e	\N	\N
2022-11-25 13:09:43.148651	2022-11-25 13:09:43.148657	843	28	uninum	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f58b73a7-c4df-49cf-894a-c66486d1c282	\N	\N
2022-11-25 13:09:46.073834	2022-11-25 13:09:46.073846	844	28	zip	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	eedbc1d2-606f-4396-ae32-acd08d781969	\N	\N
2022-11-25 13:09:46.136806	2022-11-25 13:09:46.136813	845	29	field= "realuiid"_enum_string	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2fc58099-a2af-4e0b-8d32-53182cfb2397	{"warning_markdown": null}	\N
2022-11-25 13:09:46.143398	2022-11-25 13:09:46.143405	846	29	field= "realuiid"_enum	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	76596d28-da5f-40d0-af8e-b5e7fdcbed80	{"warning_markdown": null}	\N
2022-11-25 13:09:46.149186	2022-11-25 13:09:46.149192	847	29	readable_date_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a3590b5a-4f25-4fbf-b29b-23cc77cdc1a5	{"warning_markdown": null}	\N
2022-11-25 13:09:46.15611	2022-11-25 13:09:46.156117	848	29	readable_date_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0a3a17bf-60d4-41de-8a29-3609bc43fd75	{"warning_markdown": null}	\N
2022-11-25 13:09:46.162799	2022-11-25 13:09:46.162806	849	29	readable_date_time_of_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	eed1aed7-021a-4c29-aad4-7081131184d4	{"warning_markdown": null}	\N
2022-11-25 13:09:46.167671	2022-11-25 13:09:46.167682	850	29	readable_date_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	06c28957-6728-4a7c-844c-94aa41ffbc7b	{"warning_markdown": null}	\N
2022-11-25 13:09:46.172948	2022-11-25 13:09:46.172954	851	29	readable_date_time_eat	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	85888dac-50fd-4c6d-ae4c-cf2fdf9cff7c	{"warning_markdown": null}	\N
2022-11-25 13:09:46.180332	2022-11-25 13:09:46.180337	852	29	readable_date_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c57029eb-aab1-460b-9093-cdd1e0d7c1cf	{"warning_markdown": null}	\N
2022-11-25 13:09:46.185987	2022-11-25 13:09:46.185993	853	29	readable_date_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	90f2f8de-ab8b-44f6-b0a8-07dc03d11f24	{"warning_markdown": null}	\N
2022-11-25 13:09:46.191268	2022-11-25 13:09:46.191273	854	29	readable_date_time	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	32e2969c-8824-4a85-be7e-fe0308ba7310	{"warning_markdown": null}	\N
2022-11-25 13:09:46.197137	2022-11-25 13:09:46.197143	855	29	analytical_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	aa8c1ac2-ea40-475d-87ed-977264f4545d	{"warning_markdown": null}	\N
2022-11-25 13:09:46.203752	2022-11-25 13:09:46.203758	856	29	activity_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	808bb2e3-1b47-456e-acec-11b20e94d057	{"warning_markdown": null}	\N
2022-11-25 13:09:46.208784	2022-11-25 13:09:46.208798	857	29	key_clean	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	987449f8-cd72-4702-a351-f29a63b19877	{"warning_markdown": null}	\N
2022-11-25 13:09:46.215345	2022-11-25 13:09:46.215352	858	29	level_three	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8765ba53-d9de-4df2-8650-20dbbda1fd14	{"warning_markdown": null}	\N
2022-11-25 13:09:46.220497	2022-11-25 13:09:46.220503	859	29	level_one	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3180a7ca-14e0-4231-be50-0e8979631874	{"warning_markdown": null}	\N
2022-11-25 13:09:46.227116	2022-11-25 13:09:46.227122	860	29	level_four	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0bc547f3-0592-462a-9c46-939e61eb83d1	{"warning_markdown": null}	\N
2022-11-25 13:09:46.23298	2022-11-25 13:09:46.232986	861	29	level_two	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fe379931-d098-4fca-a360-71232ed5e4e8	{"warning_markdown": null}	\N
2022-11-25 13:09:46.238485	2022-11-25 13:09:46.238491	862	29	realuiid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4a06180f-f301-49dd-8da2-a3950ed1be4f	{"warning_markdown": null}	\N
2022-11-25 13:09:46.24531	2022-11-25 13:09:46.245317	863	29	description	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	889a3785-fe25-472e-8a91-323f731500bc	{"warning_markdown": null}	\N
2022-11-25 13:09:46.25047	2022-11-25 13:09:46.250476	864	29	sessionid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1e976b70-04a1-4135-b8a6-efdf216171d9	{"warning_markdown": null}	\N
2022-11-25 13:09:46.255471	2022-11-25 13:09:46.255478	865	29	uiid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	86efe4e5-c918-4785-aa3a-763300f14261	{"warning_markdown": null}	\N
2022-11-25 13:09:46.263824	2022-11-25 13:09:46.26383	866	29	readable_date_date_full	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6ea8b98a-f6e7-42a7-89d3-61ad04841ce8	{"warning_markdown": null}	\N
2022-11-25 13:09:46.269401	2022-11-25 13:09:46.269416	867	29	readable_date_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	821bcc55-25bd-4f24-b1bd-1edf419c9348	{"warning_markdown": null}	\N
2022-11-25 13:09:46.274914	2022-11-25 13:09:46.27492	868	29	readable_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	90019289-7996-4eab-b4b8-12393b3c3c96	{"warning_markdown": null}	\N
2022-11-25 13:09:46.281092	2022-11-25 13:09:46.281098	869	29	readable_date_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	1ac5b2aa-8b1e-40cb-b4b5-ee3526cd0ecb	{"warning_markdown": null}	\N
2022-11-25 13:09:46.286472	2022-11-25 13:09:46.286478	870	29	readable_date_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	8b90fbff-a048-441c-8ce5-d5d2d2caea06	{"warning_markdown": null}	\N
2022-11-25 13:09:46.292119	2022-11-25 13:09:46.292125	871	29	readable_date_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d6e43b31-e76d-4854-9fcf-f3c3a3eef10d	{"warning_markdown": null}	\N
2022-11-25 13:09:46.297954	2022-11-25 13:09:46.29796	872	29	readable_date_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	401748e0-5242-4f21-8a73-65ae2355a997	{"warning_markdown": null}	\N
2022-11-25 13:09:46.303269	2022-11-25 13:09:46.303283	873	29	readable_date_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ca5c855a-438f-4631-ae42-0ffd24958ea6	{"warning_markdown": null}	\N
2022-11-25 13:09:46.308337	2022-11-25 13:09:46.308343	874	29	readable_date_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a5d5ce50-0f1b-48c4-bc89-e52f2a5013ef	{"warning_markdown": null}	\N
2022-11-25 13:09:46.314134	2022-11-25 13:09:46.31414	875	29	readable_date_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	56c93283-b405-462a-a2a3-fcded5511982	{"warning_markdown": null}	\N
2022-11-25 13:09:46.319969	2022-11-25 13:09:46.319976	876	29	readable_date_minutes	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	814904f2-8d55-448f-a93d-877b276a98fa	{"warning_markdown": null}	\N
2022-11-25 13:09:46.325845	2022-11-25 13:09:46.325854	877	29	readable_date_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d87a3636-1389-4ad5-87e8-441e11338678	{"warning_markdown": null}	\N
2022-11-25 13:09:46.33257	2022-11-25 13:09:46.332576	878	29	readable_date_hour	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	953cafad-eb13-4740-9862-449983742de4	{"warning_markdown": null}	\N
2022-11-25 13:09:46.338744	2022-11-25 13:09:46.338751	879	29	new_ucn	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	be4e1d12-d448-48db-b440-8004bcec407e	{"warning_markdown": null}	\N
2022-11-25 13:09:46.345123	2022-11-25 13:09:46.345129	880	29	action	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	1f4956d0-7488-4435-8c74-a59d5017ce91	{"warning_markdown": null}	\N
2022-11-25 13:09:49.275519	2022-11-25 13:09:49.275532	881	29	restime	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e6f09228-e6cd-404e-893c-2b4270ea7403	{"warning_markdown": null}	\N
2022-11-25 13:09:49.338097	2022-11-25 13:09:49.338118	882	30	agent_pos_verb_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	41ded351-05be-4fe9-bdb5-f990f3b5a050	{"warning_markdown": null}	\N
2022-11-25 13:09:49.344112	2022-11-25 13:09:49.344132	883	30	agent_ner_word_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	866c27f3-1a17-44c9-ad1b-7cdfbc48b50d	{"warning_markdown": null}	\N
2022-11-25 13:09:49.34935	2022-11-25 13:09:49.349356	884	30	agent_ner_entity_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e2c65640-2edb-4039-a809-6d050233a95f	{"warning_markdown": null}	\N
2022-11-25 13:09:49.354449	2022-11-25 13:09:49.354455	885	30	agent_pos_noun_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	34981acc-80f2-464a-9e27-58d979e5261c	{"warning_markdown": null}	\N
2022-11-25 13:09:49.359613	2022-11-25 13:09:49.359619	886	30	customer_pos_verb_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b7cdd4c0-3d25-46c3-bab4-a9f153d6ce67	{"warning_markdown": null}	\N
2022-11-25 13:09:49.364346	2022-11-25 13:09:49.364351	887	30	customer_ner_word_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	beb08640-367b-4ab6-9c9e-30334ef9b660	{"warning_markdown": null}	\N
2022-11-25 13:09:49.369731	2022-11-25 13:09:49.369737	888	30	customer_ner_entity_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	93886d35-df85-45ba-952d-ea8238e7007e	{"warning_markdown": null}	\N
2022-11-25 13:09:49.374792	2022-11-25 13:09:49.374798	889	30	customer_pos_noun_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	427dc095-30e5-4d58-953b-a455dbee269d	{"warning_markdown": null}	\N
2022-11-25 13:09:49.379868	2022-11-25 13:09:49.379874	890	30	reason_1	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3617b34c-89d3-4b74-b7bc-9f3bf835ae92	{"warning_markdown": null}	\N
2022-11-25 13:09:49.38488	2022-11-25 13:09:49.384887	891	30	agent_pos_verb_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f1344a92-8626-47f7-b30d-67086a2e1b16	{"warning_markdown": null}	\N
2022-11-25 13:09:49.389786	2022-11-25 13:09:49.389792	892	30	agent_ner_word_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5efae295-084b-46dc-978b-0ddc54e95fb6	{"warning_markdown": null}	\N
2022-11-25 13:09:49.394647	2022-11-25 13:09:49.394653	893	30	agent_ner_entity_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7f28e56a-0c03-45ad-b2bc-5dcef7136b62	{"warning_markdown": null}	\N
2022-11-25 13:09:49.39924	2022-11-25 13:09:49.399245	894	30	agent_pos_noun_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6fa41dfd-1fa1-4000-bc96-d9d6d897eb0c	{"warning_markdown": null}	\N
2022-11-25 13:09:49.404114	2022-11-25 13:09:49.404119	895	30	customer_pos_verb_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a41fc395-23d6-4757-b30c-1686e9ee907a	{"warning_markdown": null}	\N
2022-11-25 13:09:49.409237	2022-11-25 13:09:49.409249	896	30	customer_ner_word_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c067d7d0-df1a-4728-8e1c-66cdd1c94ea3	{"warning_markdown": null}	\N
2022-11-25 13:09:49.414036	2022-11-25 13:09:49.414043	897	30	customer_ner_entity_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ff6a508b-923f-453a-92cb-05237a24dce1	{"warning_markdown": null}	\N
2022-11-25 13:09:49.419588	2022-11-25 13:09:49.419595	898	30	customer_pos_noun_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9c7875c3-aa6f-483c-9e7c-97ae210282d3	{"warning_markdown": null}	\N
2022-11-25 13:09:49.424695	2022-11-25 13:09:49.424702	899	30	reason_2	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b2d20e31-0559-4412-b6c4-99e1c02b0f8a	{"warning_markdown": null}	\N
2022-11-25 13:09:49.429784	2022-11-25 13:09:49.42979	900	30	agent_pos_verb_3	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ce5b9a85-abe6-4198-af82-7a389180a21a	{"warning_markdown": null}	\N
2022-11-25 13:09:49.434772	2022-11-25 13:09:49.434778	901	30	agent_ner_word_3	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	81896c2c-f1fb-4c4d-a97e-20ca81ae903c	{"warning_markdown": null}	\N
2022-11-25 13:09:49.439364	2022-11-25 13:09:49.43937	902	30	agent_ner_entity_3	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b0c3bb7d-6e57-4195-b8ba-018cf9a10490	{"warning_markdown": null}	\N
2022-11-25 13:09:49.444572	2022-11-25 13:09:49.444578	903	30	agent_pos_noun_3	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	bfa10509-64e6-43b3-9df0-746cc5ad1fd7	{"warning_markdown": null}	\N
2022-11-25 13:09:49.450225	2022-11-25 13:09:49.450231	904	30	customer_pos_verb_3	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4290b9ad-59da-403f-85eb-d7eefd4fc5d6	{"warning_markdown": null}	\N
2022-11-25 13:09:49.454964	2022-11-25 13:09:49.454969	905	30	customer_ner_word_3	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8c0f5186-22c2-47a3-94cc-6fd27ca00b68	{"warning_markdown": null}	\N
2022-11-25 13:09:49.460027	2022-11-25 13:09:49.460033	906	30	customer_ner_entity_3	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0a667450-5c28-4dd7-8315-6b42f07298d4	{"warning_markdown": null}	\N
2022-11-25 13:09:49.465009	2022-11-25 13:09:49.465015	907	30	customer_pos_noun_3	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	71b05b9f-1f6c-4c46-8987-1975f5e0cba0	{"warning_markdown": null}	\N
2022-11-25 13:09:49.469596	2022-11-25 13:09:49.469602	908	30	reason_3	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8dea27f3-1ac5-414c-a05d-b57a583d8d66	{"warning_markdown": null}	\N
2022-11-25 13:09:49.474261	2022-11-25 13:09:49.474266	909	30	agent_b5	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b6630328-562b-4949-a68a-ebf52246cd63	{"warning_markdown": null}	\N
2022-11-25 13:09:49.479071	2022-11-25 13:09:49.479077	910	30	customer_b5	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0dcd56cb-41aa-439f-9c16-55db313928a5	{"warning_markdown": null}	\N
2022-11-25 13:09:49.484131	2022-11-25 13:09:49.484137	911	30	max_date_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	965046d1-1247-4bd4-9625-e8c9ecd441e0	{"warning_markdown": null}	\N
2022-11-25 13:09:49.488812	2022-11-25 13:09:49.488818	912	30	max_date_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	22725902-fc17-4280-bf45-661da4b3b18f	{"warning_markdown": null}	\N
2022-11-25 13:09:49.493666	2022-11-25 13:09:49.493672	913	30	max_date_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a613be54-0d6b-47b8-9b06-82334488b1cf	{"warning_markdown": null}	\N
2022-11-25 13:09:49.498307	2022-11-25 13:09:49.498312	914	30	max_date_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	04bc3631-7790-4a55-b686-5e8f49524309	{"warning_markdown": null}	\N
2022-11-25 13:09:49.502975	2022-11-25 13:09:49.502982	915	30	max_date_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8d17c25d-e0d7-4959-b9b4-ed79a2e7eba4	{"warning_markdown": null}	\N
2022-11-25 13:09:49.507543	2022-11-25 13:09:49.50755	916	30	max_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5b3435dc-da30-4cc3-991d-f70280752166	{"warning_markdown": null}	\N
2022-11-25 13:09:49.51284	2022-11-25 13:09:49.512847	917	30	agent_mbti	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9bb69444-e8e6-4abb-a65e-05319baf7819	{"warning_markdown": null}	\N
2022-11-25 13:09:49.517534	2022-11-25 13:09:49.517541	918	30	customer_mbti	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	eafe9c14-b150-4baa-afee-f70f4bc737f9	{"warning_markdown": null}	\N
2022-11-25 13:09:49.522109	2022-11-25 13:09:49.522115	919	30	callagentclass	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1e8bf8f8-97ab-41fb-99a1-04d46782477f	{"warning_markdown": null}	\N
2022-11-25 13:09:49.527326	2022-11-25 13:09:49.527333	920	30	segmentcampaign	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8826d48e-046b-48fc-ac90-db172dc89894	{"warning_markdown": null}	\N
2022-11-25 13:09:49.532184	2022-11-25 13:09:49.53219	921	30	callrecordingurl	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	19223cd5-37ec-45ad-bb25-20509f4165a5	{"warning_markdown": null}	\N
2022-11-25 13:09:49.536795	2022-11-25 13:09:49.536801	922	30	department	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	60a88407-9c85-4fc7-a5d8-e0a43aaeef3c	{"warning_markdown": null}	\N
2022-11-25 13:09:49.541398	2022-11-25 13:09:49.541404	923	30	reason	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fbd011f1-95e5-4847-9d6f-b7038a7be7e3	{"warning_markdown": null}	\N
2022-11-25 13:09:49.546658	2022-11-25 13:09:49.546664	924	30	connectionid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c480fce4-a0b2-4f44-a641-1f5e5d434f0b	{"warning_markdown": null}	\N
2022-11-25 13:09:49.551269	2022-11-25 13:09:49.551274	925	30	userid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1d7703ae-7429-4222-9344-1a96484f9b92	{"warning_markdown": null}	\N
2022-11-25 13:09:49.555982	2022-11-25 13:09:49.555988	926	30	max_date_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	96f2f700-c018-42d1-81fb-b9597d872ecf	{"warning_markdown": null}	\N
2022-11-25 13:09:49.561121	2022-11-25 13:09:49.561128	927	30	agent_adj	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fa5fa427-2d6c-4df2-8435-90a2fef46d23	{"warning_markdown": null}	\N
2022-11-25 13:09:49.565964	2022-11-25 13:09:49.56597	928	30	agent_adp	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2ced2327-09ad-479d-9381-77d508bf0a71	{"warning_markdown": null}	\N
2022-11-25 13:09:49.57055	2022-11-25 13:09:49.570559	929	30	agent_adv	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	3c75c020-44fd-4470-89fd-5625dfcba12d	{"warning_markdown": null}	\N
2022-11-25 13:09:49.575219	2022-11-25 13:09:49.575225	930	30	agent_part	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2cd2d9ac-d15f-458c-85b8-d989ef7c133c	{"warning_markdown": null}	\N
2022-11-25 13:09:49.580258	2022-11-25 13:09:49.580271	931	30	agent_aux	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ff82ef10-935f-4f0e-b9b8-9df5a1fb7952	{"warning_markdown": null}	\N
2022-11-25 13:09:49.585038	2022-11-25 13:09:49.585044	932	30	agent_verb	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e5e6f2db-8d29-45bb-900f-2819c5e305ea	{"warning_markdown": null}	\N
2022-11-25 13:09:49.589692	2022-11-25 13:09:49.589698	933	30	agent_cconj	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c3b2b109-2b60-4883-a3aa-747956b5d555	{"warning_markdown": null}	\N
2022-11-25 13:09:49.594588	2022-11-25 13:09:49.594594	934	30	customer_adj	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cbe3706e-a2f8-444a-aff8-a79d9ec64c24	{"warning_markdown": null}	\N
2022-11-25 13:09:49.599221	2022-11-25 13:09:49.599227	935	30	customer_adp	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	c798a7bf-71f0-4912-8c9c-d98afbf28126	{"warning_markdown": null}	\N
2022-11-25 13:09:49.604021	2022-11-25 13:09:49.604026	936	30	customer_adv	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0ce3303d-25a6-4675-8186-adf4dc8ca2c9	{"warning_markdown": null}	\N
2022-11-25 13:09:49.610604	2022-11-25 13:09:49.61061	937	30	agent_sconj	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	97c27663-62db-4a36-8096-6c1d3d6cccf9	{"warning_markdown": null}	\N
2022-11-25 13:09:49.617529	2022-11-25 13:09:49.617567	938	30	customer_part	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d2fc4b17-0cf2-4908-85cf-64aeb377431f	{"warning_markdown": null}	\N
2022-11-25 13:09:49.623145	2022-11-25 13:09:49.623151	939	30	customer_aux	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0103ba0d-4414-4e6b-a6c6-79d412c1756b	{"warning_markdown": null}	\N
2022-11-25 13:09:49.628387	2022-11-25 13:09:49.628393	940	30	agent_det	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	69743d9a-8bb5-474f-8db3-a0843da0e832	{"warning_markdown": null}	\N
2022-11-25 13:09:49.634058	2022-11-25 13:09:49.634065	941	30	agent_intj	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	0903687d-8771-4ac6-bdab-c1f85e545709	{"warning_markdown": null}	\N
2022-11-25 13:09:49.638956	2022-11-25 13:09:49.638962	942	30	agent_num	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ad9bb509-0fdc-410f-b2dc-fe64db050b45	{"warning_markdown": null}	\N
2022-11-25 13:09:49.643814	2022-11-25 13:09:49.64382	943	30	agent_noun	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	8f77cf15-5329-4da7-8a6b-82164c6f5aa9	{"warning_markdown": null}	\N
2022-11-25 13:09:49.648507	2022-11-25 13:09:49.648512	944	30	agent_propn	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	778c6c1d-99aa-4d64-836a-2708b3c329c9	{"warning_markdown": null}	\N
2022-11-25 13:09:49.653198	2022-11-25 13:09:49.653204	945	30	agent_pron	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	51c06ff2-71a6-47d5-9aa8-4559a1522477	{"warning_markdown": null}	\N
2022-11-25 13:09:49.658081	2022-11-25 13:09:49.658087	946	30	agent_x	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	840477d8-a1f8-45ed-9fd2-22fd40de2a1c	{"warning_markdown": null}	\N
2022-11-25 13:09:49.663016	2022-11-25 13:09:49.663022	947	30	customer_verb	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	19dd9164-b89b-4275-a096-852c513b726b	{"warning_markdown": null}	\N
2022-11-25 13:09:49.667622	2022-11-25 13:09:49.667628	948	30	customer_cconj	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d9e0617b-c1b1-4c35-972e-7300d3e15f97	{"warning_markdown": null}	\N
2022-11-25 13:09:49.673068	2022-11-25 13:09:49.673074	949	30	customer_sconj	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	216afff1-f782-40f9-af39-ac20671bf41a	{"warning_markdown": null}	\N
2022-11-25 13:09:49.677895	2022-11-25 13:09:49.677901	950	30	customer_det	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	9e4fdfe4-aabc-4da2-b4c4-d195f235ffb7	{"warning_markdown": null}	\N
2022-11-25 13:09:49.682645	2022-11-25 13:09:49.682651	951	30	customer_intj	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	abe9773f-e32f-43f7-be50-472bc08c8139	{"warning_markdown": null}	\N
2022-11-25 13:09:49.687762	2022-11-25 13:09:49.687781	952	30	customer_num	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4a8eace9-aae1-40bf-965a-783ccd5171a6	{"warning_markdown": null}	\N
2022-11-25 13:09:49.692842	2022-11-25 13:09:49.692849	953	30	customer_noun	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1946a12a-9ba3-4c10-bf9d-535d5e161c03	{"warning_markdown": null}	\N
2022-11-25 13:09:49.697513	2022-11-25 13:09:49.697519	954	30	customer_propn	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	07a5d431-2c26-40de-8e4e-631a299b0538	{"warning_markdown": null}	\N
2022-11-25 13:09:49.702416	2022-11-25 13:09:49.702422	955	30	customer_pron	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b72caf99-a755-4d91-a75f-04a76df533d6	{"warning_markdown": null}	\N
2022-11-25 13:09:49.707124	2022-11-25 13:09:49.70713	956	30	customer_x	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b7a15bb1-337b-4f2c-ba27-5220a7ec4192	{"warning_markdown": null}	\N
2022-11-25 13:09:49.712205	2022-11-25 13:09:49.712211	957	30	teamleader	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	625ed28c-1823-4dc5-9007-e2962936b61e	{"warning_markdown": null}	\N
2022-11-25 13:09:49.717008	2022-11-25 13:09:49.717014	958	30	manager	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	604a9038-cee6-4183-9e14-15ade9540d33	{"warning_markdown": null}	\N
2022-11-25 13:09:49.721798	2022-11-25 13:09:49.721804	959	30	agentid	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	7ffe8121-0c11-4ac8-9b3f-a210344ea53f	{"warning_markdown": null}	\N
2022-11-25 13:09:49.72696	2022-11-25 13:09:49.726966	960	30	max_date_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	3f688c32-3695-498e-8a52-0f5f09e19250	{"warning_markdown": null}	\N
2022-11-25 13:09:49.731623	2022-11-25 13:09:49.731629	961	30	max_date_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2ffe7822-1d3c-4e03-be7a-55021fb11da4	{"warning_markdown": null}	\N
2022-11-25 13:09:49.737168	2022-11-25 13:09:49.737174	962	30	max_date_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e0972078-8ba8-4e9f-bf06-67567991fbd7	{"warning_markdown": null}	\N
2022-11-25 13:09:49.742379	2022-11-25 13:09:49.742385	963	30	max_date_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5a2df059-89d1-460c-90a5-d8897953b309	{"warning_markdown": null}	\N
2022-11-25 13:09:49.747133	2022-11-25 13:09:49.747138	964	30	max_date_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5279d822-ed9d-440d-bfea-58bfd1e52582	{"warning_markdown": null}	\N
2022-11-25 13:09:49.753497	2022-11-25 13:09:49.753504	965	30	max_date_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5111b05f-13e6-464b-b70c-2cd2eb85b68a	{"warning_markdown": null}	\N
2022-11-25 13:09:49.759578	2022-11-25 13:09:49.759585	966	30	max_date_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	6ea84ed9-9956-4148-b044-fae3df62ecb1	{"warning_markdown": null}	\N
2022-11-25 13:09:49.764563	2022-11-25 13:09:49.764568	967	30	max_date_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	6a7b2302-8a60-4b1a-a6b1-6f8dfe70ce35	{"warning_markdown": null}	\N
2022-11-25 13:09:49.769766	2022-11-25 13:09:49.769771	968	30	campaignid	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	02960fd9-d3b3-4456-b00b-b6c892296841	{"warning_markdown": null}	\N
2022-11-25 13:09:49.77443	2022-11-25 13:09:49.774435	969	30	bicaptureid	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	729a87f1-4aa3-4610-8d64-d28f1aefe8e5	{"warning_markdown": null}	\N
2022-11-25 13:09:49.779596	2022-11-25 13:09:49.779602	970	30	callid	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	be232fcf-3cac-4497-8a8b-d51b08809985	{"warning_markdown": null}	\N
2022-11-25 13:09:49.784607	2022-11-25 13:09:49.784613	971	30	index	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2387e1a7-8d4e-4f62-a7d4-63678727c50a	{"warning_markdown": null}	\N
2022-11-25 13:09:52.714669	2022-11-25 13:09:52.71468	972	30	_prediction	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f604e332-b61f-47a1-b6e0-89c121d839c9	{}	\N
2022-11-25 13:09:52.763544	2022-11-25 13:09:52.76355	973	31	contextual_variable_one	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9b479518-6c01-4fca-b234-df89c6963eb4	\N	\N
2022-11-25 13:09:52.768236	2022-11-25 13:09:52.768242	974	31	contextual_variable_two	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	46c3635e-38b5-4114-90bd-2eb09246725f	\N	\N
2022-11-25 13:09:52.773579	2022-11-25 13:09:52.773585	975	31	customer	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	46bdb513-62be-4dff-9d15-11ba073da96e	\N	\N
2022-11-25 13:09:52.77848	2022-11-25 13:09:52.778488	976	31	uuid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ada4e312-e633-4f80-9c5b-a73bb3d41b78	\N	\N
2022-11-25 13:09:52.783318	2022-11-25 13:09:52.783324	977	31	id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4dd7dc5c-d8f1-4f38-8468-f18a1f143a5f	\N	\N
2022-11-25 13:09:52.788604	2022-11-25 13:09:52.788616	978	31	optionkey	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0a100c82-3624-4d86-b5cc-c1814b7a5866	\N	\N
2022-11-25 13:09:52.793914	2022-11-25 13:09:52.79392	979	31	option	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9d97ffe6-76b3-483e-a2d5-6bf2572d0ee3	\N	\N
2022-11-25 13:09:52.799076	2022-11-25 13:09:52.799082	980	31	alpha_zero	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	2f0338ec-3762-452d-928d-f5d90e4053bc	\N	\N
2022-11-25 13:09:52.804185	2022-11-25 13:09:52.804191	981	31	beta_zero	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	5603fee7-d85b-4891-95ed-0f7d30f47685	\N	\N
2022-11-25 13:09:52.809152	2022-11-25 13:09:52.809161	982	31	epsilon_nominated	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	e42555ad-4c0a-48d8-a732-205032b5cf06	\N	\N
2022-11-25 13:09:52.814086	2022-11-25 13:09:52.814092	983	31	alpha	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	6c865c9e-55dd-425f-a869-c8a162245282	\N	\N
2022-11-25 13:09:52.819592	2022-11-25 13:09:52.819599	984	31	beta	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	102984bb-b88b-464a-9e36-48d97b48c910	\N	\N
2022-11-25 13:09:52.825	2022-11-25 13:09:52.825006	985	31	weighting	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	142ca422-6948-469c-baa2-a8f4b5aa768d	\N	\N
2022-11-25 13:09:55.811819	2022-11-25 13:09:55.811849	986	31	propensity	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f4d8feb7-706b-418b-a6bd-19b9828b3ff3	\N	\N
2022-11-25 13:09:55.90374	2022-11-25 13:09:55.903746	987	32	data_bundle_cnt_500_1024mb	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	59a87b8e-7099-42ea-a7f2-887d280ed7ab	{"warning_markdown": null}	\N
2022-11-25 13:09:55.909981	2022-11-25 13:09:55.909993	988	32	data_bundle_cnt_250_500mb	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	b6ebcf07-f537-49bd-b35b-5fa8fef23d83	{"warning_markdown": null}	\N
2022-11-25 13:09:55.915194	2022-11-25 13:09:55.9152	989	32	data_bundle_cnt_1024_2048mb	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bb377833-d025-4c86-9393-515db68cd1c5	{"warning_markdown": null}	\N
2022-11-25 13:09:55.920018	2022-11-25 13:09:55.920024	990	32	data_bundle_cnt_2048_5120mb	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	f6b82fdb-2686-420d-96cf-09c1141dc6b8	{"warning_markdown": null}	\N
2022-11-25 13:09:55.925039	2022-11-25 13:09:55.925045	991	32	data_bundle_cnt_50_250mb	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fa292b09-8081-4076-9cbb-8d1a4c21aff1	{"warning_markdown": null}	\N
2022-11-25 13:09:55.929744	2022-11-25 13:09:55.929749	992	32	data_bundle_cnt_0_50mb	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c5acefa8-ebfa-4463-8fef-c58004d15a52	{"warning_markdown": null}	\N
2022-11-25 13:09:55.93431	2022-11-25 13:09:55.934316	993	32	data_bundle_cnt_5120mb_plus	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a39ff26e-2539-426d-98a0-7d4b1259b8f8	{"warning_markdown": null}	\N
2022-11-25 13:09:55.940643	2022-11-25 13:09:55.940665	994	32	data_behav_seg	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f6653095-fb67-4063-a44d-a32efac76760	{"warning_markdown": null}	\N
2022-11-25 13:09:55.945966	2022-11-25 13:09:55.945971	995	32	data_rev_status	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ba3fd59a-3754-4272-93fc-5f1800b505f3	{"warning_markdown": null}	\N
2022-11-25 13:09:55.950661	2022-11-25 13:09:55.950667	996	32	active_day_segment	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a9216ce7-b60f-4808-a99a-2e2de8bff42f	{"warning_markdown": null}	\N
2022-11-25 13:09:55.955449	2022-11-25 13:09:55.955456	997	32	presented_offer	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1e52a4cd-1daa-431b-827c-e52759e52992	{"warning_markdown": null}	\N
2022-11-25 13:09:55.960225	2022-11-25 13:09:55.960232	998	32	uuid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	139baa43-bcf3-44ea-af26-0a37888852ca	{"warning_markdown": null}	\N
2022-11-25 13:09:55.965515	2022-11-25 13:09:55.965521	999	32	purchased_flag	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	286946a2-874e-4ee1-bec1-f34c970ce45e	{"warning_markdown": null}	\N
2022-11-25 13:09:58.897855	2022-11-25 13:09:58.897874	1000	32	date_offered	t	t	BIGINT	t	t	\N	35	35	\N	\N	\N	86effde4-5876-4b38-9569-57283ab39b28	{"warning_markdown": null}	\N
2022-11-25 13:09:58.962841	2022-11-25 13:09:58.962848	1001	33	actr_last_updated_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2eb77ba3-14c5-41df-afa9-b2da932dbd36	{}	\N
2022-11-25 13:09:58.967954	2022-11-25 13:09:58.96796	1002	33	actr_is_cost_base_adj_applied	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4ab803c5-085b-464c-ac7e-088ddd93c04a	{}	\N
2022-11-25 13:09:58.972689	2022-11-25 13:09:58.972695	1003	33	actr_processed_date_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	86bc97ec-f597-433c-85c5-4806ce7950b0	{}	\N
2022-11-25 13:09:58.97771	2022-11-25 13:09:58.977716	1004	33	actr_last_updated_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	961dcbbc-2963-4903-ba83-472fa5a7db98	{}	\N
2022-11-25 13:09:58.982574	2022-11-25 13:09:58.98258	1005	33	actr_last_updated_time_of_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4da6ae15-b7dd-435e-914b-cd1efe34b35d	{}	\N
2022-11-25 13:09:58.987278	2022-11-25 13:09:58.987283	1006	33	actr_processed_date_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6890f6fa-baf9-42a7-b5c4-050b20727dc1	{}	\N
2022-11-25 13:09:58.992109	2022-11-25 13:09:58.992114	1007	33	actr_processed_date_time_of_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3d5d99bf-5e7d-4ca4-a32e-d65940e731b0	{}	\N
2022-11-25 13:09:58.997236	2022-11-25 13:09:58.997242	1008	33	actr_last_updated_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2a4097c1-8f20-42bb-aed7-4d4594e61a9b	{}	\N
2022-11-25 13:09:59.002097	2022-11-25 13:09:59.002104	1009	33	actr_last_updated_time_eat	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	77b5d72c-c52e-432b-8da2-2ca1268109ec	{}	\N
2022-11-25 13:09:59.010945	2022-11-25 13:09:59.010952	1010	33	actr_last_updated_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b23ba7a3-0adf-44ee-ab53-c29ad1863786	{}	\N
2022-11-25 13:09:59.016456	2022-11-25 13:09:59.016463	1011	33	actr_processed_date_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9400a2f4-0904-4b03-800e-1ab1c3a6aea4	{}	\N
2022-11-25 13:09:59.021526	2022-11-25 13:09:59.021532	1012	33	actr_match_status_code_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	217976c7-1df3-4674-80f3-da74a439457f	{}	\N
2022-11-25 13:09:59.026705	2022-11-25 13:09:59.026711	1013	33	actr_processed_date_time_eat	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	63287b40-537c-489a-8328-95b6a7059fb5	{}	\N
2022-11-25 13:09:59.031608	2022-11-25 13:09:59.031614	1014	33	actr_processed_date_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e8d45ca4-9614-4034-a3d5-5c81093d8fd9	{}	\N
2022-11-25 13:09:59.036379	2022-11-25 13:09:59.036385	1015	33	actr_is_contrib_invest_master	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	53875eda-8cad-4aac-a5f3-355f98913701	{}	\N
2022-11-25 13:09:59.041157	2022-11-25 13:09:59.041162	1016	33	actr_financial_acct_period	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	83a3cd76-cee5-4153-96d2-253696bc9503	{}	\N
2022-11-25 13:09:59.04614	2022-11-25 13:09:59.046146	1017	33	actr_last_updated_by	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e67faba9-60b8-44f5-a40c-8a80018b2e99	{}	\N
2022-11-25 13:09:59.050744	2022-11-25 13:09:59.05075	1018	33	actr_last_updated_time	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ea9fa3c6-de39-4b92-89ce-66f0e6166bd8	{}	\N
2022-11-25 13:09:59.056465	2022-11-25 13:09:59.056471	1019	33	actr_processed_date_time	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2b3ba25e-a42f-467c-a0c3-36f0e3e54c4c	{}	\N
2022-11-25 13:09:59.061535	2022-11-25 13:09:59.061541	1020	33	actr_price_code_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	64ba8c11-f574-4437-8b28-91f4ba3b1300	{}	\N
2022-11-25 13:09:59.066326	2022-11-25 13:09:59.066339	1021	33	actr_pmnt_eff_ind	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	18933d64-3438-45c6-b395-7cfe20bc06ff	{}	\N
2022-11-25 13:09:59.071148	2022-11-25 13:09:59.071154	1022	33	actr_date_transmitted	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a7b42a67-24bd-4054-97c6-07f8e1a14ee4	{}	\N
2022-11-25 13:09:59.075783	2022-11-25 13:09:59.075789	1023	33	actr_last_updated	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3371a5af-4390-465f-a05e-7be592653c9d	{}	\N
2022-11-25 13:09:59.080538	2022-11-25 13:09:59.080544	1024	33	actr_tax_year	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	da7a71b5-6ff9-4c61-9707-67c65501fb6d	{}	\N
2022-11-25 13:09:59.085539	2022-11-25 13:09:59.085545	1025	33	actr_processed_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	13717f11-dcc1-45df-a24d-5273f4950c5e	{}	\N
2022-11-25 13:09:59.090127	2022-11-25 13:09:59.090133	1026	33	actr_commission_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f7eb1a11-a0f5-4ca7-9c73-65ae816f2623	{}	\N
2022-11-25 13:09:59.095226	2022-11-25 13:09:59.095233	1027	33	actr_activity_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7b5912be-2351-46b8-b348-4acb5c1ecd24	{}	\N
2022-11-25 13:09:59.100548	2022-11-25 13:09:59.100555	1028	33	actr_dadj_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	cf0732f9-641a-4d84-a434-13e130c85dc6	{}	\N
2022-11-25 13:09:59.105437	2022-11-25 13:09:59.105443	1029	33	actr_due_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4283f766-6aac-4fc5-af09-27676023253c	{}	\N
2022-11-25 13:09:59.110197	2022-11-25 13:09:59.110203	1030	33	actr_other_amount	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f9313831-fb62-40a2-8452-66c7340aa347	{}	\N
2022-11-25 13:09:59.115034	2022-11-25 13:09:59.11504	1031	33	actr_dbcf_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	67851c4e-81fb-449b-b1b9-3ec1363fbbce	{}	\N
2022-11-25 13:09:59.119525	2022-11-25 13:09:59.11953	1032	33	actr_benefit_sequence	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	10f65a15-aedb-4508-9392-ac11b1d652d2	{}	\N
2022-11-25 13:09:59.12422	2022-11-25 13:09:59.124226	1033	33	actr_currency_code	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	75ebc9a9-1280-40ca-8908-e9556f645a61	{}	\N
2022-11-25 13:09:59.128935	2022-11-25 13:09:59.12894	1034	33	actr_increment_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f8463db3-fe8a-48b3-8c50-d4705faf84e4	{}	\N
2022-11-25 13:09:59.134424	2022-11-25 13:09:59.13443	1035	33	trev_effective_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	74bff88d-eac1-4a70-aab3-53783c158fdf	{}	\N
2022-11-25 13:09:59.139222	2022-11-25 13:09:59.139228	1036	33	trev_is_priced	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c17cc38b-5c47-4911-9ad5-92efb8923ef2	{}	\N
2022-11-25 13:09:59.144015	2022-11-25 13:09:59.144021	1037	33	ttyp_description	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	62c039f6-95c5-49d5-a010-e9a9a2fdc309	{}	\N
2022-11-25 13:09:59.149729	2022-11-25 13:09:59.149736	1038	33	actr_last_updated_date_full	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5bdf72cd-6476-4429-be5a-b601d7455e28	{}	\N
2022-11-25 13:09:59.154826	2022-11-25 13:09:59.154832	1039	33	actr_processed_date_date_full	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6fbae673-b487-4237-a859-42bf6cac5f86	{}	\N
2022-11-25 13:09:59.159369	2022-11-25 13:09:59.159389	1040	33	actr_last_updated_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1e693e1c-34a7-4c56-9674-5c5e741d9040	{}	\N
2022-11-25 13:09:59.164209	2022-11-25 13:09:59.164215	1041	33	actr_processed_date_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c8ae8cdc-cb0c-4238-9e5a-efc2fb490fa6	{}	\N
2022-11-25 13:09:59.168863	2022-11-25 13:09:59.168869	1042	33	actr_rdbms_tx_id	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bf0b4cf4-a6b8-406b-942b-ddfdfd9fc91f	{}	\N
2022-11-25 13:09:59.17342	2022-11-25 13:09:59.173426	1043	33	actr_expense_group_id	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	72d72b07-41fb-4383-9080-f0bc0eeb392f	{}	\N
2022-11-25 13:09:59.17954	2022-11-25 13:09:59.179553	1044	33	actr_last_updated_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	df925546-c86b-4f4e-88b3-0b8ea9a672d8	{}	\N
2022-11-25 13:09:59.184971	2022-11-25 13:09:59.184977	1045	33	actr_processed_date_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b2e56437-933c-4450-9a14-a754aa939990	{}	\N
2022-11-25 13:09:59.189512	2022-11-25 13:09:59.189519	1046	33	actr_last_updated_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d1e91dfd-1968-4c62-9bb0-433568a84985	{}	\N
2022-11-25 13:09:59.195226	2022-11-25 13:09:59.195233	1047	33	actr_processed_date_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	3293aaf6-78eb-42f0-8360-203002616d6b	{}	\N
2022-11-25 13:09:59.199937	2022-11-25 13:09:59.199943	1048	33	actr_last_updated_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ee6996a6-e4ec-4e96-a4ef-098d18dacfad	{}	\N
2022-11-25 13:09:59.204595	2022-11-25 13:09:59.204601	1049	33	actr_processed_date_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	bb56c8ea-430f-47aa-bd12-3a71f7a7ebe3	{}	\N
2022-11-25 13:09:59.209396	2022-11-25 13:09:59.209408	1050	33	actr_last_updated_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	7e1ef712-bc27-407b-82d2-5932c46473aa	{}	\N
2022-11-25 13:09:59.21563	2022-11-25 13:09:59.215636	1051	33	actr_processed_date_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	9cb875e3-b090-4d9c-8581-3e997e14bae9	{}	\N
2022-11-25 13:09:59.220343	2022-11-25 13:09:59.220348	1052	33	actr_last_updated_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	050f7d20-cb47-4dd4-b070-6bdf5c4bc543	{}	\N
2022-11-25 13:09:59.225	2022-11-25 13:09:59.225006	1053	33	actr_processed_date_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	9794fc86-2e83-4b61-8f7f-58c2baa526df	{}	\N
2022-11-25 13:09:59.230108	2022-11-25 13:09:59.230127	1054	33	trev_trans_status_code_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	fcbe320c-063f-4dcb-a32a-d535fd119683	{}	\N
2022-11-25 13:09:59.23515	2022-11-25 13:09:59.235156	1055	33	actr_last_updated_day	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	df327bbe-7f71-4f29-8d91-f460018cf2f8	{}	\N
2022-11-25 13:09:59.239829	2022-11-25 13:09:59.239835	1056	33	actr_last_updated_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	753e7679-7165-4a33-b7b7-f5464832a8f7	{}	\N
2022-11-25 13:09:59.245172	2022-11-25 13:09:59.245178	1057	33	actr_processed_date_day	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	42b5550d-790f-4a1f-ac3d-a8dad294f0fe	{}	\N
2022-11-25 13:09:59.249922	2022-11-25 13:09:59.249927	1058	33	actr_processed_date_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ed0c052c-b503-4194-aa26-51955578da63	{}	\N
2022-11-25 13:09:59.254672	2022-11-25 13:09:59.254678	1059	33	actr_last_updated_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b1ab1222-c2e2-4a25-a53d-c9f39c4783bb	{}	\N
2022-11-25 13:09:59.259865	2022-11-25 13:09:59.259871	1060	33	actr_transaction_event_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2459c793-d55e-4a00-a02f-fe079d8078bb	{}	\N
2022-11-25 13:09:59.264748	2022-11-25 13:09:59.264754	1061	33	actr_transaction_type_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	fe9e2bc8-1be9-46d6-a8df-23e561755b93	{}	\N
2022-11-25 13:09:59.270071	2022-11-25 13:09:59.270077	1062	33	actr_last_updated_minutes	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	17a6b049-bde5-462a-b8d4-4fbc1bd2a5a5	{}	\N
2022-11-25 13:09:59.274904	2022-11-25 13:09:59.27491	1063	33	actr_last_updated_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b68eaed0-671c-4f51-87d4-5c21a7df6eb8	{}	\N
2022-11-25 13:09:59.279738	2022-11-25 13:09:59.279744	1064	33	actr_last_updated_hour	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f3c8e038-9977-4128-a43f-3d4f5f00652f	{}	\N
2022-11-25 13:09:59.284481	2022-11-25 13:09:59.284487	1065	33	actr_processed_date_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e72a0981-b24b-4496-91f3-044a5d7cc050	{}	\N
2022-11-25 13:09:59.28938	2022-11-25 13:09:59.289386	1066	33	actr_processed_date_minutes	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	99edb015-6222-4266-861f-02213ae50957	{}	\N
2022-11-25 13:09:59.294184	2022-11-25 13:09:59.29419	1067	33	actr_processed_date_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d14d5c02-94b5-48aa-b1e7-40a84d526257	{}	\N
2022-11-25 13:09:59.298953	2022-11-25 13:09:59.298959	1068	33	actr_processed_date_hour	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c39bfa8d-9f9f-450e-ab5e-3c70f96719d8	{}	\N
2022-11-25 13:09:59.303882	2022-11-25 13:09:59.303888	1069	33	actr_carb_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	fa968872-db4d-4f24-b90e-e1603d074e78	{}	\N
2022-11-25 13:09:59.309286	2022-11-25 13:09:59.309293	1070	33	actr_account_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	477a8ed0-f03e-4132-b286-7ebef895b60a	{}	\N
2022-11-25 13:09:59.314076	2022-11-25 13:09:59.314082	1071	33	actr_gross_amount	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f74e7234-a284-4997-83fc-7813e0cd08a7	{}	\N
2022-11-25 13:09:59.31862	2022-11-25 13:09:59.318626	1072	33	actr_client_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a7df7493-74fb-44ff-9a09-5398d4c50935	{}	\N
2022-11-25 13:09:59.324123	2022-11-25 13:09:59.324129	1073	33	actr_timestamp	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	abde6aa5-cb46-45ce-af23-ccffecf4752e	{}	\N
2022-11-25 13:09:59.328957	2022-11-25 13:09:59.328962	1074	33	actr_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b2cd40e4-bf87-4be1-957c-024fca9165e6	{}	\N
2022-11-25 13:10:02.259725	2022-11-25 13:10:02.25974	1075	33	count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ba15737d-c516-4532-9225-f70ad20a2b99	{}	\N
2022-11-25 13:10:02.307064	2022-11-25 13:10:02.307071	1076	34	actr_last_updated_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	83591607-d979-4c0a-8b9a-fe2d58c773c3	{}	\N
2022-11-25 13:10:02.312458	2022-11-25 13:10:02.312464	1077	34	actr_is_cost_base_adj_applied	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	eb10df73-82c7-4caa-8223-fc8906ea03ef	{}	\N
2022-11-25 13:10:02.316998	2022-11-25 13:10:02.317004	1078	34	actr_processed_date_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	11319646-d372-480b-843c-6d6fadbc1e7a	{}	\N
2022-11-25 13:10:02.321715	2022-11-25 13:10:02.321722	1079	34	actr_last_updated_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1773b031-c514-4fbd-80ad-62e75d5c226b	{}	\N
2022-11-25 13:10:02.326671	2022-11-25 13:10:02.326677	1080	34	actr_last_updated_time_of_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	898f0dbb-acbf-41a9-b82e-1e02b42636cf	{}	\N
2022-11-25 13:10:02.331229	2022-11-25 13:10:02.331234	1081	34	actr_processed_date_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a2627f87-b76d-42f2-87e2-ccce917fd81f	{}	\N
2022-11-25 13:10:02.335747	2022-11-25 13:10:02.335753	1082	34	actr_processed_date_time_of_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	89a79bdc-8212-4dcb-ac21-42b316c175e5	{}	\N
2022-11-25 13:10:02.340599	2022-11-25 13:10:02.340605	1083	34	actr_last_updated_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e0258d0d-7c9b-421c-8940-83f4a015e41e	{}	\N
2022-11-25 13:10:02.34532	2022-11-25 13:10:02.345326	1084	34	actr_last_updated_time_eat	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fecaa9c9-8b90-48c0-ab3a-a4b553c57cd1	{}	\N
2022-11-25 13:10:02.355615	2022-11-25 13:10:02.355631	1085	34	actr_last_updated_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	93036b4a-f06f-46be-a924-4c98b7bf86e7	{}	\N
2022-11-25 13:10:02.364115	2022-11-25 13:10:02.364149	1086	34	actr_processed_date_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fbaeff8e-202e-4e13-a9ca-965ba4bd1c47	{}	\N
2022-11-25 13:10:02.373393	2022-11-25 13:10:02.373405	1087	34	actr_match_status_code_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	cfaa8de5-2922-4ffd-af6d-d2208876a40d	{}	\N
2022-11-25 13:10:02.380428	2022-11-25 13:10:02.380434	1088	34	actr_processed_date_time_eat	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8d97f60c-7381-4ed7-868b-2514f88128f5	{}	\N
2022-11-25 13:10:02.38553	2022-11-25 13:10:02.385541	1089	34	actr_processed_date_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c82ed01c-e312-4d6c-b8b2-3b6a02f7ad73	{}	\N
2022-11-25 13:10:02.390281	2022-11-25 13:10:02.390286	1090	34	actr_is_contrib_invest_master	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	05d54746-1488-405d-9c84-433b5a43b1ef	{}	\N
2022-11-25 13:10:02.395982	2022-11-25 13:10:02.395988	1091	34	actr_financial_acct_period	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	bcd2ef08-45c8-4eef-aa2b-cae433590be0	{}	\N
2022-11-25 13:10:02.400705	2022-11-25 13:10:02.400711	1092	34	actr_last_updated_by	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ff21222c-c11e-4dc8-9173-61b9feb933a5	{}	\N
2022-11-25 13:10:02.405663	2022-11-25 13:10:02.405668	1093	34	actr_last_updated_time	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	60c8fafe-8027-4f66-85ae-b82327d20e6e	{}	\N
2022-11-25 13:10:02.410262	2022-11-25 13:10:02.410268	1094	34	actr_processed_date_time	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3dca9f5d-bb3c-4952-bba5-1b80fe2dafd0	{}	\N
2022-11-25 13:10:02.415197	2022-11-25 13:10:02.415203	1095	34	actr_price_code_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fb55b7ef-c353-4a07-959f-257a39abc108	{}	\N
2022-11-25 13:10:02.420192	2022-11-25 13:10:02.420198	1096	34	actr_pmnt_eff_ind	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fb12d75e-d718-426a-86fe-482901a1f97f	{}	\N
2022-11-25 13:10:02.425368	2022-11-25 13:10:02.425374	1097	34	actr_date_transmitted	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9afb5ff4-e7c4-494f-9e49-7903af0b2e36	{}	\N
2022-11-25 13:10:02.430032	2022-11-25 13:10:02.430037	1098	34	actr_last_updated	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9f37733a-ef04-43e6-bd80-59e52f27a17a	{}	\N
2022-11-25 13:10:02.434826	2022-11-25 13:10:02.434832	1099	34	actr_tax_year	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3d005b6e-2dde-4b53-9109-42e541c313d0	{}	\N
2022-11-25 13:10:02.439389	2022-11-25 13:10:02.439395	1100	34	actr_processed_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	59c5e097-5020-4e65-ad50-6c4f6152c643	{}	\N
2022-11-25 13:10:02.444073	2022-11-25 13:10:02.444079	1101	34	actr_commission_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b4ad98b6-23ea-4365-bc3f-4c21d56ad175	{}	\N
2022-11-25 13:10:02.448907	2022-11-25 13:10:02.448913	1102	34	actr_activity_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2b679dce-6c2e-453c-8af2-cbafc14a4168	{}	\N
2022-11-25 13:10:02.453728	2022-11-25 13:10:02.453733	1103	34	actr_dadj_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5f3cc226-6032-4cda-bec4-7da657001fbe	{}	\N
2022-11-25 13:10:02.458399	2022-11-25 13:10:02.458404	1104	34	actr_due_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d543a81a-8f17-4d8d-968a-65529b960439	{}	\N
2022-11-25 13:10:02.463373	2022-11-25 13:10:02.463379	1105	34	actr_other_amount	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fb22a006-0c89-4acd-8bc0-f9f08ef44221	{}	\N
2022-11-25 13:10:02.468164	2022-11-25 13:10:02.46817	1106	34	actr_dbcf_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4a6ed636-8932-40d5-8135-b046d25abbfd	{}	\N
2022-11-25 13:10:02.472632	2022-11-25 13:10:02.472638	1107	34	actr_benefit_sequence	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c7ad44ce-4749-4e2e-870f-2dea9b01fe00	{}	\N
2022-11-25 13:10:02.477375	2022-11-25 13:10:02.477381	1108	34	actr_currency_code	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8fd23460-80a1-43c2-aae8-df16b5164de4	{}	\N
2022-11-25 13:10:02.483529	2022-11-25 13:10:02.483535	1109	34	actr_increment_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	eddad6be-c44f-4e86-8b88-f4ec11932a3e	{}	\N
2022-11-25 13:10:02.489216	2022-11-25 13:10:02.489221	1110	34	trev_effective_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d955ba05-c361-4f81-8a13-6d2e3e521c0c	{}	\N
2022-11-25 13:10:02.494432	2022-11-25 13:10:02.494438	1111	34	trev_is_priced	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b873d32c-0b9b-4fbc-b4de-f6e6455a58f7	{}	\N
2022-11-25 13:10:02.500007	2022-11-25 13:10:02.500013	1112	34	ttyp_description	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	89755db0-27a9-403d-bc34-6e5d4c5c4cb3	{}	\N
2022-11-25 13:10:02.504673	2022-11-25 13:10:02.504679	1113	34	linemanagersurname	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6f4b9a48-a2c4-45f2-be69-e8954ec13865	{}	\N
2022-11-25 13:10:02.509233	2022-11-25 13:10:02.509246	1114	34	jobcodename	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7a434dd9-e493-4cf7-a9de-62700ff21b5e	{}	\N
2022-11-25 13:10:02.516522	2022-11-25 13:10:02.516531	1115	34	track	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f1e2d175-2088-474f-a924-2fdaed28e148	{}	\N
2022-11-25 13:10:02.522601	2022-11-25 13:10:02.522607	1116	34	department	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2ae8ac7a-8186-49c0-8405-88e856898c00	{}	\N
2022-11-25 13:10:02.529774	2022-11-25 13:10:02.529804	1117	34	team	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7f9db825-9907-42a4-a2fe-b5379e96e664	{}	\N
2022-11-25 13:10:02.540819	2022-11-25 13:10:02.54083	1118	34	businessunit	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	10559217-9b0e-4273-85bd-075da7ceb026	{}	\N
2022-11-25 13:10:02.548388	2022-11-25 13:10:02.548401	1119	34	jobtitle	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	26904b11-a7c3-47c7-bf3a-fd7a3fc243b1	{}	\N
2022-11-25 13:10:02.555268	2022-11-25 13:10:02.555276	1120	34	costcentre	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2990d617-bb1f-4fb0-882a-ccef2d595b8d	{}	\N
2022-11-25 13:10:02.562998	2022-11-25 13:10:02.563012	1121	34	division	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e25edd80-555f-478e-8980-0547813c7317	{}	\N
2022-11-25 13:10:02.569865	2022-11-25 13:10:02.569871	1122	34	positiontitle	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d6fa5edd-6f3e-4b1c-9c9f-04dd4e8b20c7	{}	\N
2022-11-25 13:10:02.577239	2022-11-25 13:10:02.577262	1123	34	actr_last_updated_date_full	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b8956c99-bafd-4491-822e-488226efdbfd	{}	\N
2022-11-25 13:10:02.585297	2022-11-25 13:10:02.585304	1124	34	actr_processed_date_date_full	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	824770d3-6ed4-4168-8454-97f46a54748b	{}	\N
2022-11-25 13:10:02.593075	2022-11-25 13:10:02.593085	1125	34	actr_last_updated_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fea5c58e-f867-44fb-bc7f-71937f068abd	{}	\N
2022-11-25 13:10:02.601073	2022-11-25 13:10:02.60108	1126	34	actr_processed_date_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b6646bf4-bd2f-4258-90e0-afd3b672bc59	{}	\N
2022-11-25 13:10:02.610455	2022-11-25 13:10:02.610462	1127	34	actr_rdbms_tx_id	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	bd1a533e-9e90-4f23-bb23-b1c123feb9b3	{}	\N
2022-11-25 13:10:02.619702	2022-11-25 13:10:02.619751	1128	34	actr_expense_group_id	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	245da4a7-ef3c-4d30-938b-73c8ea47e85f	{}	\N
2022-11-25 13:10:02.627434	2022-11-25 13:10:02.627447	1129	34	actr_gross_amount	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	45d43a23-a471-4cc8-be42-bd5a33f393d9	{}	\N
2022-11-25 13:10:02.635454	2022-11-25 13:10:02.63547	1130	34	actr_last_updated_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b10edcce-cac2-4d76-84b5-020559ead6a6	{}	\N
2022-11-25 13:10:02.643502	2022-11-25 13:10:02.643515	1131	34	actr_processed_date_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	412a6955-49fe-4ebc-bce1-7bb29056722e	{}	\N
2022-11-25 13:10:02.650381	2022-11-25 13:10:02.650387	1132	34	actr_last_updated_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a97d5a79-03f7-432f-8f43-f45fcaaea315	{}	\N
2022-11-25 13:10:02.657983	2022-11-25 13:10:02.657989	1133	34	actr_processed_date_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a52640a3-4077-42b6-ba98-988c0587ea46	{}	\N
2022-11-25 13:10:02.664568	2022-11-25 13:10:02.664581	1134	34	actr_last_updated_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	637ab6a6-6a52-4a18-a800-945c2a1dc5dd	{}	\N
2022-11-25 13:10:02.673405	2022-11-25 13:10:02.673414	1135	34	actr_processed_date_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	b7e0e326-c191-4336-b904-2caa461b8420	{}	\N
2022-11-25 13:10:02.683201	2022-11-25 13:10:02.683209	1136	34	actr_last_updated_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ab53f6bb-58a8-4a82-8ca8-23144386052b	{}	\N
2022-11-25 13:10:02.692148	2022-11-25 13:10:02.692158	1137	34	actr_processed_date_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	78b68168-c89c-474b-8f02-405a96d6c8a6	{}	\N
2022-11-25 13:10:02.699622	2022-11-25 13:10:02.699629	1138	34	actr_last_updated_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d5682e50-653a-4873-a355-5e027e78738b	{}	\N
2022-11-25 13:10:02.705547	2022-11-25 13:10:02.705555	1139	34	actr_processed_date_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ede87250-ffea-418b-bbb7-5f6abea7fea3	{}	\N
2022-11-25 13:10:02.712679	2022-11-25 13:10:02.712689	1140	34	trev_trans_status_code_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	3e0b6fe3-7b27-4cf4-8ff3-1d0327392a1a	{}	\N
2022-11-25 13:10:02.71957	2022-11-25 13:10:02.719577	1141	34	actr_last_updated_day	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	bf9d80f9-7ac6-45fe-ba9b-839ae9f6bb51	{}	\N
2022-11-25 13:10:02.726303	2022-11-25 13:10:02.726314	1142	34	actr_last_updated_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	524e0c96-aa39-4c8c-9a02-29eedf1374a7	{}	\N
2022-11-25 13:10:02.732283	2022-11-25 13:10:02.732289	1143	34	actr_processed_date_day	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	37d3e2c6-ad8b-400e-bd6e-972f92b08bc5	{}	\N
2022-11-25 13:10:02.73695	2022-11-25 13:10:02.736956	1144	34	actr_processed_date_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	7a803cd8-2a0b-46ec-aead-e5d038561cc8	{}	\N
2022-11-25 13:10:02.741502	2022-11-25 13:10:02.741508	1145	34	actr_last_updated_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	934a0301-589c-4a69-96dd-322598c9e598	{}	\N
2022-11-25 13:10:02.745936	2022-11-25 13:10:02.745942	1146	34	actr_transaction_event_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	9b907346-f914-43c4-a328-482d870b338c	{}	\N
2022-11-25 13:10:02.75029	2022-11-25 13:10:02.750296	1147	34	actr_transaction_type_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	778fe7d2-1d54-4f61-9ba3-0f9a9804c5ad	{}	\N
2022-11-25 13:10:02.755899	2022-11-25 13:10:02.755905	1148	34	actr_last_updated_minutes	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	97857b91-bad9-4f7b-b9fc-296e0864aabc	{}	\N
2022-11-25 13:10:02.760718	2022-11-25 13:10:02.760724	1149	34	actr_last_updated_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	8783fce4-f386-4c3a-a2ae-fddda0f85733	{}	\N
2022-11-25 13:10:02.765366	2022-11-25 13:10:02.765372	1150	34	actr_last_updated_hour	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2ee051d5-f787-4ea0-a227-b719bfcb6716	{}	\N
2022-11-25 13:10:02.769896	2022-11-25 13:10:02.769901	1151	34	actr_processed_date_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d3ab8aba-7f79-4ee1-9b44-ebfa73038934	{}	\N
2022-11-25 13:10:02.774589	2022-11-25 13:10:02.774595	1152	34	actr_processed_date_minutes	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5889d722-5e93-4338-bea1-b849535eff3c	{}	\N
2022-11-25 13:10:02.779199	2022-11-25 13:10:02.779205	1153	34	actr_processed_date_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	7b68fe54-ef99-4995-8b56-01481f229eb3	{}	\N
2022-11-25 13:10:02.784126	2022-11-25 13:10:02.784133	1154	34	actr_processed_date_hour	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	4c3aeb3e-a33c-4ab5-a615-811dc5db34d5	{}	\N
2022-11-25 13:10:02.788742	2022-11-25 13:10:02.788748	1155	34	actr_carb_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	16b5f4ba-9ceb-4c6d-b804-8e642f10534f	{}	\N
2022-11-25 13:10:02.793492	2022-11-25 13:10:02.793498	1156	34	actr_account_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c5b4cf1c-c7fc-4a1c-9be0-67734dfcb385	{}	\N
2022-11-25 13:10:02.798038	2022-11-25 13:10:02.798043	1157	34	actr_client_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	79e72513-79e9-4c4a-bcf6-5587b3ee74f6	{}	\N
2022-11-25 13:10:02.802864	2022-11-25 13:10:02.802883	1158	34	actr_timestamp	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0610a093-ba89-4371-a84f-4eb5b33e9180	{}	\N
2022-11-25 13:10:02.807539	2022-11-25 13:10:02.807545	1159	34	actr_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	86ee6c03-bff7-4f29-831c-6ab5183bebbd	{}	\N
2022-11-25 13:10:05.758383	2022-11-25 13:10:05.758401	1160	34	count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	73891afe-1d02-4094-99d4-ff70e853c17c	{}	\N
2022-11-25 13:10:05.854143	2022-11-25 13:10:05.854165	1161	35	ht10_sts_desc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	30d8fd12-bf85-4b17-8b6f-3e28855e35fb	{}	\N
2022-11-25 13:10:05.859634	2022-11-25 13:10:05.859649	1162	35	ht03_actn_d_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6697bc16-7013-4fb0-a6e4-6f684e82c79c	{}	\N
2022-11-25 13:10:05.868483	2022-11-25 13:10:05.86849	1163	35	ht03_actn_d_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	75467c2e-e28a-4c26-be61-0e637729334c	{}	\N
2022-11-25 13:10:05.873269	2022-11-25 13:10:05.873275	1164	35	ht03_actn_d_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	6647ea30-53c4-4722-91ca-5fa498256218	{}	\N
2022-11-25 13:10:05.88106	2022-11-25 13:10:05.881067	1165	35	ht03_clnt_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f6632616-789f-419a-b4ac-85588a2a3c8d	{}	\N
2022-11-25 13:10:05.885915	2022-11-25 13:10:05.885922	1166	35	abbreviated_short_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d685563f-9a00-40ae-abb9-525b849c3173	{}	\N
2022-11-25 13:10:05.891441	2022-11-25 13:10:05.891447	1167	35	total_number_of_transactions	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	cf805fe3-4761-4fa6-aade-fc6ed74e8fc9	{}	\N
2022-11-25 13:10:05.899243	2022-11-25 13:10:05.899249	1168	35	total_transaction_amount	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	229469f5-e27b-418f-b401-b021ecc07438	{}	\N
2022-11-25 13:10:05.905181	2022-11-25 13:10:05.905187	1169	35	number_of_transactions	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a5ed4ffa-83d0-484a-9650-80d57094bbe8	{}	\N
2022-11-25 13:10:05.913078	2022-11-25 13:10:05.913093	1170	35	transaction_amount	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	04361bf8-c98a-48e9-981b-ffb40331d4b3	{}	\N
2022-11-25 13:10:05.919891	2022-11-25 13:10:05.919898	1171	35	lookup_field	f	t	ROW	t	t	\N	35	35	\N	\N	\N	cb39e1df-8d45-435e-a8e2-5b467931c71b	{}	\N
2022-11-25 13:10:08.87485	2022-11-25 13:10:08.874863	1172	35	_id	f	t	ROW	t	t	\N	35	35	\N	\N	\N	cc6f72ed-0323-4d7d-8296-2da86d2f45cb	{}	\N
2022-11-25 13:10:08.939539	2022-11-25 13:10:08.939545	1173	36	ht10_sts_desc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	406472f9-4363-41d5-80da-d4afba6f222b	{}	\N
2022-11-25 13:10:08.94631	2022-11-25 13:10:08.946354	1174	36	ht10_sts_type_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	cec3d93d-a520-41dc-8670-fd37ad797c7e	{}	\N
2022-11-25 13:10:08.951502	2022-11-25 13:10:08.951508	1175	36	ht03_actn_d_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4222f66d-05c8-4ca9-ad11-9b63aaa7eba1	{}	\N
2022-11-25 13:10:08.956681	2022-11-25 13:10:08.956688	1176	36	ht03_nmntd_ac_m	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7a235d0f-a899-48b3-8b99-39ade0ebf470	{}	\N
2022-11-25 13:10:08.96379	2022-11-25 13:10:08.963799	1177	36	ht03_dest_ac_h_m	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	885cedff-3ddf-4e38-960d-4312c060da02	{}	\N
2022-11-25 13:10:08.969277	2022-11-25 13:10:08.969284	1178	36	ht03_actn_d_year_month_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	894f4ba9-187b-45d8-b19d-f1bd3a027af5	{}	\N
2022-11-25 13:10:08.977435	2022-11-25 13:10:08.977448	1179	36	ht03_dest_ac_h_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e7515e18-ecd7-40a3-b5fb-91edcfc85e17	{}	\N
2022-11-25 13:10:08.983451	2022-11-25 13:10:08.983458	1180	36	ht03_nmntd_ac_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	de15f203-0b33-4227-80cc-4debd4bffd1f	{}	\N
2022-11-25 13:10:08.988465	2022-11-25 13:10:08.988471	1181	36	ht03_sts_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	089aecd2-8ae3-45b1-bab8-0c278f6c9b9e	{}	\N
2022-11-25 13:10:08.995822	2022-11-25 13:10:08.995828	1182	36	ht03_clnt_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	1ce55550-0db6-457a-b1e6-a41323541a8e	{}	\N
2022-11-25 13:10:09.00091	2022-11-25 13:10:09.000917	1183	36	amount	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	ac92af16-89bf-49a5-ae73-353d0d63200a	{}	\N
2022-11-25 13:10:11.927144	2022-11-25 13:10:11.927169	1184	36	count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	cd4fce84-f2e2-4f98-b8ba-3130561b0788	{}	\N
2022-11-25 13:10:11.987799	2022-11-25 13:10:11.987805	1185	37	ht03_dest_ac_h_cry	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2effe15f-3f7d-4b85-b909-6d649f1d05b4	{"warning_markdown": null}	\N
2022-11-25 13:10:11.994629	2022-11-25 13:10:11.994641	1186	37	ht03_tran_type_cl_c	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	bcf4d711-4eb0-4f87-9b76-b59b09a09043	{"warning_markdown": null}	\N
2022-11-25 13:10:12.000989	2022-11-25 13:10:12.000998	1187	37	ht03_dest_ac_h_m	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	97787ff0-d232-43a1-9b5f-f196577f1eae	{"warning_markdown": null}	\N
2022-11-25 13:10:12.006429	2022-11-25 13:10:12.006435	1188	37	ht03_orgn_pmt_r_n	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2081f00a-10bd-486c-9d34-5446fadf2238	{"warning_markdown": null}	\N
2022-11-25 13:10:12.013282	2022-11-25 13:10:12.013289	1189	37	ht03_pch_nmntd_ac	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	aa53e93e-db73-4bbc-98ac-a2ba33ec7b5f	{"warning_markdown": null}	\N
2022-11-25 13:10:15.670503	2022-11-25 13:10:15.67051	1309	38	ht03_clnt_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f14fb59f-49a5-4525-9b6e-02b49c1f5e34	{}	\N
2022-11-25 13:10:12.018093	2022-11-25 13:10:12.018099	1190	37	ht03_nmntd_ac_cry	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e2f99224-ad77-489c-bd7f-cff10796a195	{"warning_markdown": null}	\N
2022-11-25 13:10:12.024077	2022-11-25 13:10:12.024097	1191	37	ht03_orig_actn_d	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2ba86f64-6099-4c21-8b12-69c36229e951	{"warning_markdown": null}	\N
2022-11-25 13:10:12.030835	2022-11-25 13:10:12.030841	1192	37	ht03_nmntd_ac_m	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e8e809a7-66ce-4318-97b5-845a27327d80	{"warning_markdown": null}	\N
2022-11-25 13:10:12.035608	2022-11-25 13:10:12.035614	1193	37	ht03_pmt_a_cry	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2c96e611-0044-4b93-915a-6380b1e2c55b	{"warning_markdown": null}	\N
2022-11-25 13:10:12.040493	2022-11-25 13:10:12.0405	1194	37	ht03_ben_rfrnc_des	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b2eb45e1-01f2-40e2-907b-7ffe1ee4398a	{"warning_markdown": null}	\N
2022-11-25 13:10:12.047615	2022-11-25 13:10:12.047621	1195	37	ht03_sub_clnt_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5bb13e8e-fe99-48f5-9eaa-75ab456888fb	{"warning_markdown": null}	\N
2022-11-25 13:10:12.052456	2022-11-25 13:10:12.052468	1196	37	ht03_product_cl_c	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	cc87df2a-f8b2-4ca3-a2dd-4e29dfede018	{"warning_markdown": null}	\N
2022-11-25 13:10:12.057369	2022-11-25 13:10:12.057375	1197	37	ht03_vendor_cl_c	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	895ecbf2-7381-4b66-88e2-13c36fe243f8	{"warning_markdown": null}	\N
2022-11-25 13:10:12.063748	2022-11-25 13:10:12.063754	1198	37	ht03_dest_cdi_ref	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	9b5ae227-2e21-4d23-aed8-7d111452a349	{"warning_markdown": null}	\N
2022-11-25 13:10:12.068378	2022-11-25 13:10:12.068384	1199	37	ht03_efctd_dte_tm	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	4eaf2a42-7402-4301-ada3-53c996dc29c0	{"warning_markdown": null}	\N
2022-11-25 13:10:12.073167	2022-11-25 13:10:12.073173	1200	37	ht03_nmntd_cdi_ref	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7f6a3c0b-dec7-42ad-b691-fdf01bab9ff8	{"warning_markdown": null}	\N
2022-11-25 13:10:12.079429	2022-11-25 13:10:12.079436	1201	37	ht03_dest_cdi_num	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6e19f5f0-46d0-47c7-aea9-0c0fd884b263	{"warning_markdown": null}	\N
2022-11-25 13:10:12.084167	2022-11-25 13:10:12.084172	1202	37	ht03_rec_upd_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	bfb84d05-dacb-49c7-9656-e4eeb5a28e1c	{"warning_markdown": null}	\N
2022-11-25 13:10:12.089002	2022-11-25 13:10:12.089027	1203	37	ht03_rec_upd_d	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	85053bff-2dad-47a0-a63a-065fc44be9c3	{"warning_markdown": null}	\N
2022-11-25 13:10:12.094615	2022-11-25 13:10:12.094624	1204	37	ht03_rsn_desc_text	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	80eae871-4b3d-40ae-9919-73da3b83d3c9	{"warning_markdown": null}	\N
2022-11-25 13:10:12.099668	2022-11-25 13:10:12.099674	1205	37	ht03_dest_user_c	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	50ceb1bd-d4c2-49ad-b4e6-a01217d89204	{"warning_markdown": null}	\N
2022-11-25 13:10:12.104725	2022-11-25 13:10:12.104731	1206	37	ht03_dest_plstc_n	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	779b6bef-bcf7-45f6-9133-9fa43fae324d	{"warning_markdown": null}	\N
2022-11-25 13:10:12.109368	2022-11-25 13:10:12.109374	1207	37	ht03_nmntd_user_c	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6e403b0c-4159-416e-af97-0c1c11b0769a	{"warning_markdown": null}	\N
2022-11-25 13:10:12.115604	2022-11-25 13:10:12.115609	1208	37	ht03_rec_upd_t	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c29e7ec8-3eb0-4243-a9a2-fab8c5466e7e	{"warning_markdown": null}	\N
2022-11-25 13:10:12.121191	2022-11-25 13:10:12.121204	1209	37	ht03_nmntd_plstc_n	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c27f92db-a746-4d60-a8d9-46eb2837f7bc	{"warning_markdown": null}	\N
2022-11-25 13:10:12.128506	2022-11-25 13:10:12.128513	1210	37	ht03_clrhs_ref_n	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	56f53da0-702d-4296-8af9-213f641288c0	{"warning_markdown": null}	\N
2022-11-25 13:10:12.133385	2022-11-25 13:10:12.133391	1211	37	ht03_actn_d	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ae4d3c14-1101-4037-b3f7-da41a13da45c	{"warning_markdown": null}	\N
2022-11-25 13:10:12.138292	2022-11-25 13:10:12.138298	1212	37	ht03_rfrnc_desc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1a49c2f1-c69e-4a2b-b2e7-ccc29387ad8f	{"warning_markdown": null}	\N
2022-11-25 13:10:12.144468	2022-11-25 13:10:12.14448	1213	37	ht03_pch_c	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b0ef0daa-36c6-4015-bdb2-420479017c8c	{"warning_markdown": null}	\N
2022-11-25 13:10:12.149428	2022-11-25 13:10:12.149434	1214	37	ht03_efct_d	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	13eeaf6e-f351-4253-9d4c-c667b706cf20	{"warning_markdown": null}	\N
2022-11-25 13:10:12.15421	2022-11-25 13:10:12.154215	1215	37	ht03_file_d	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e5300cdc-1c48-4834-a7eb-df0cbd5c29e9	{"warning_markdown": null}	\N
2022-11-25 13:10:12.158778	2022-11-25 13:10:12.158785	1216	37	ht03_extrt_ind	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d78d6d97-bdfc-45db-b1ae-182264aa34a8	{"warning_markdown": null}	\N
2022-11-25 13:10:12.164912	2022-11-25 13:10:12.164918	1217	37	ht03_cptr	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7f48fa62-f99a-4bba-aa61-618ac2922df2	{"warning_markdown": null}	\N
2022-11-25 13:10:12.169856	2022-11-25 13:10:12.169862	1218	37	ht03_guid	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	f8131a61-1695-42fd-b6e7-b102076a4fb7	{"warning_markdown": null}	\N
2022-11-25 13:10:12.174716	2022-11-25 13:10:12.174722	1219	37	ht03_rlsr	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	b32cc4fd-9ea7-44c3-b4a4-d8da5a8342b3	{"warning_markdown": null}	\N
2022-11-25 13:10:12.180658	2022-11-25 13:10:12.180664	1220	37	ht03_pmt_a	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	634b4ca4-501b-4352-b6d8-59469acfbd84	{"warning_markdown": null}	\N
2022-11-25 13:10:12.185702	2022-11-25 13:10:12.185709	1221	37	ht03_chrg_ac_cl_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	dc05a4ae-fe99-4325-8048-866a6e1fee79	{"warning_markdown": null}	\N
2022-11-25 13:10:12.190473	2022-11-25 13:10:12.190479	1222	37	ht03_dest_ac_cl_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c9d4dc24-e349-4756-b369-2731c2bb0177	{"warning_markdown": null}	\N
2022-11-25 13:10:12.196623	2022-11-25 13:10:12.19663	1223	37	ht03_nmntd_ac_cl_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a8357c44-c54a-4513-8f34-3a4e79c54fcb	{"warning_markdown": null}	\N
2022-11-25 13:10:12.201604	2022-11-25 13:10:12.20161	1224	37	ht03_phys_chanl_cl_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ca95dc2c-f85a-4e8d-a65b-ff909c0783ea	{"warning_markdown": null}	\N
2022-11-25 13:10:12.206305	2022-11-25 13:10:12.206311	1225	37	ht03_dest_ac_h_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ffe332f6-f663-4a53-8adc-4cfd9396f6e2	{"warning_markdown": null}	\N
2022-11-25 13:10:12.212574	2022-11-25 13:10:12.21258	1226	37	ht03_srvc_cl_typ_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0f86977b-92cc-463d-a0c6-1d336c17cee3	{"warning_markdown": null}	\N
2022-11-25 13:10:12.217658	2022-11-25 13:10:12.217663	1227	37	ht03_srvc_cl_u_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	7ac50969-412b-4ab0-9b11-e33b49674bb4	{"warning_markdown": null}	\N
2022-11-25 13:10:12.222679	2022-11-25 13:10:12.222685	1228	37	ht03_pmt_cl_typ_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0a3abd0a-29b6-4154-8830-902e73a6b524	{"warning_markdown": null}	\N
2022-11-25 13:10:12.228987	2022-11-25 13:10:12.228994	1229	37	ht03_dest_on_us_i	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	8224982f-b939-468d-9b2b-d02b99eba165	{"warning_markdown": null}	\N
2022-11-25 13:10:12.23398	2022-11-25 13:10:12.233985	1230	37	ht03_nmntd_on_us_i	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5ad61a4b-1dbc-49e5-a614-27ba12254038	{"warning_markdown": null}	\N
2022-11-25 13:10:12.23931	2022-11-25 13:10:12.239316	1231	37	ht03_chrg_ac_cltp	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ba8f4696-0652-427f-b58d-23a15856952e	{"warning_markdown": null}	\N
2022-11-25 13:10:12.245187	2022-11-25 13:10:12.245201	1232	37	ht03_dest_ac_cltp	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	72b23862-d2af-478d-9623-2b60a8e5d25e	{"warning_markdown": null}	\N
2022-11-25 13:10:12.251434	2022-11-25 13:10:12.251441	1233	37	ht03_nmntd_ac_cltp	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	21e05193-d246-4b5c-8ecf-fa4af1968a38	{"warning_markdown": null}	\N
2022-11-25 13:10:12.257165	2022-11-25 13:10:12.257171	1234	37	ht03_chrg_ac_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	93cf8a6b-5a92-4511-bf7b-211fb652324b	{"warning_markdown": null}	\N
2022-11-25 13:10:12.263665	2022-11-25 13:10:12.263671	1235	37	ht03_nmntd_ac_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	6ee32ed4-ba88-405f-8446-7daf960df238	{"warning_markdown": null}	\N
2022-11-25 13:10:12.268355	2022-11-25 13:10:12.268378	1236	37	ht03_tran_seq_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d93a4212-3568-476a-a924-c66036454a36	{"warning_markdown": null}	\N
2022-11-25 13:10:12.273099	2022-11-25 13:10:12.273105	1237	37	ht03_sub_bch_rf	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d60621c0-bb61-4c06-9567-e292e95340eb	{"warning_markdown": null}	\N
2022-11-25 13:10:12.279942	2022-11-25 13:10:12.279949	1238	37	ht03_pch_nmntd_br	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	4bf4df06-9506-4e8b-a778-f8515839a50c	{"warning_markdown": null}	\N
2022-11-25 13:10:12.285927	2022-11-25 13:10:12.285933	1239	37	ht03_srvc_cl_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ee00a453-ba88-4b39-abba-55201b1c11b4	{"warning_markdown": null}	\N
2022-11-25 13:10:12.290539	2022-11-25 13:10:12.290545	1240	37	ht03_pmt_cl_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a6e0b254-56b0-4634-907d-dce490aedbb5	{"warning_markdown": null}	\N
2022-11-25 13:10:12.297173	2022-11-25 13:10:12.297179	1241	37	ht03_pch_user_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	876ec143-54c5-492f-bd57-f901ad8de003	{"warning_markdown": null}	\N
2022-11-25 13:10:12.301859	2022-11-25 13:10:12.301865	1242	37	ht03_entry_cl_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f7cedc24-8f3c-4c04-98bd-afd6955b4e87	{"warning_markdown": null}	\N
2022-11-25 13:10:12.306542	2022-11-25 13:10:12.306548	1243	37	ht03_chrg_sort_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	42aac03d-f425-4f90-84ea-3b7bdea45092	{"warning_markdown": null}	\N
2022-11-25 13:10:12.313782	2022-11-25 13:10:12.313789	1244	37	ht03_nmntd_cdi_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	daece4b3-2c1b-423a-b8b4-5bfdf6eb0271	{"warning_markdown": null}	\N
2022-11-25 13:10:12.318525	2022-11-25 13:10:12.318531	1245	37	ht03_dest_sort_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e733bf53-37ba-4531-82ad-f7485d5b0dcb	{"warning_markdown": null}	\N
2022-11-25 13:10:12.323189	2022-11-25 13:10:12.323195	1246	37	ht03_sts_typ_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	45abd87c-e702-4e10-92fc-c657950c888d	{"warning_markdown": null}	\N
2022-11-25 13:10:12.329699	2022-11-25 13:10:12.329705	1247	37	ht03_nmntd_sort_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	7f5257d0-6802-4777-a14a-411f60e4db0c	{"warning_markdown": null}	\N
2022-11-25 13:10:12.334612	2022-11-25 13:10:12.334618	1248	37	ht03_pmt_instr_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	3b229ea8-ad29-4894-980f-0076632e0f40	{"warning_markdown": null}	\N
2022-11-25 13:10:12.339268	2022-11-25 13:10:12.339273	1249	37	ht03_file_seq_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	8fe0b863-02d6-45b7-86be-0ee76359d545	{"warning_markdown": null}	\N
2022-11-25 13:10:12.345508	2022-11-25 13:10:12.345515	1250	37	ht03_late_tran	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	fc5fae2d-2d16-4240-8b04-037939c38ee6	{"warning_markdown": null}	\N
2022-11-25 13:10:12.350205	2022-11-25 13:10:12.350211	1251	37	ht03_sts_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	13c31e9d-4d95-4005-bc46-522dde0fc06b	{"warning_markdown": null}	\N
2022-11-25 13:10:12.354772	2022-11-25 13:10:12.354778	1252	37	ht03_clnt_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f6fadcba-d5be-4ca9-b96e-0009ae79d4a7	{"warning_markdown": null}	\N
2022-11-25 13:10:12.362411	2022-11-25 13:10:12.362424	1253	37	ht03_rsn_c	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	1305516a-a416-4624-8971-1b9947d628ef	{"warning_markdown": null}	\N
2022-11-25 13:10:12.368134	2022-11-25 13:10:12.36814	1254	37	snapshot_dts	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5bd996e0-cff2-4655-a756-984b2a260b81	{"warning_markdown": null}	\N
2022-11-25 13:10:12.37335	2022-11-25 13:10:12.37336	1255	37	ht10_sts_desc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	62771eb7-16cf-4a1e-b26c-0636019f8324	{}	\N
2022-11-25 13:10:12.380393	2022-11-25 13:10:12.380399	1256	37	ht10_sts_type_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	7ff78645-583c-4e13-b545-5907f1bf2f1f	{}	\N
2022-11-25 13:10:12.384986	2022-11-25 13:10:12.384992	1257	37	ht03_orig_actn_d_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0cd49f95-50f7-4208-bc06-157cdec5c2cf	{}	\N
2022-11-25 13:10:12.38962	2022-11-25 13:10:12.389625	1258	37	ht03_orig_actn_d_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0ebd25e7-8e41-4e1d-84c3-38ffffa29e45	{}	\N
2022-11-25 13:10:12.39654	2022-11-25 13:10:12.396547	1259	37	ht03_actn_d_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1feda2a1-0cf7-46c3-8b27-7c9c824854db	{}	\N
2022-11-25 13:10:12.401149	2022-11-25 13:10:12.401156	1260	37	ht03_orig_actn_d_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a4866628-a375-40aa-a130-4e1a8c8a2d45	{}	\N
2022-11-25 13:10:12.405901	2022-11-25 13:10:12.405907	1261	37	ht03_actn_d_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a81a10e9-0c36-47fb-b985-e57b5bd38361	{}	\N
2022-11-25 13:10:12.412042	2022-11-25 13:10:12.412049	1262	37	ht03_orig_actn_d_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3b6f2a7b-af81-4076-bce9-dffac50af7f3	{}	\N
2022-11-25 13:10:12.416724	2022-11-25 13:10:12.41673	1263	37	ht03_file_d_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d9001577-9dbc-48dd-94da-71d2fa745a45	{}	\N
2022-11-25 13:10:12.421231	2022-11-25 13:10:12.421257	1264	37	ht03_file_d_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3d8202f2-9487-42b2-93c2-122325ab3bd4	{}	\N
2022-11-25 13:10:12.426078	2022-11-25 13:10:12.426084	1265	37	ht03_actn_d_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	35155e43-3b86-44a8-b7d8-7ca3bcf1102d	{}	\N
2022-11-25 13:10:12.432173	2022-11-25 13:10:12.432178	1266	37	ht03_orig_actn_d_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	69431ed7-930d-4bcd-8ea4-519f89a707e5	{}	\N
2022-11-25 13:10:12.436919	2022-11-25 13:10:12.436925	1267	37	ht03_orig_actn_d_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7a5dfe21-60b0-425f-b481-4bb5077fd4cb	{}	\N
2022-11-25 13:10:12.442027	2022-11-25 13:10:12.442032	1268	37	ht03_actn_d_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5ef7f65d-1dd5-4ce1-b07c-09a8da936737	{}	\N
2022-11-25 13:10:12.448115	2022-11-25 13:10:12.448121	1269	37	ht03_file_d_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	385e54ef-d276-4eb7-b675-fd42fc25afde	{}	\N
2022-11-25 13:10:12.452841	2022-11-25 13:10:12.452846	1270	37	ht03_file_d_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e2dccbd3-3e08-420e-a9da-9fa936ae4825	{}	\N
2022-11-25 13:10:12.458671	2022-11-25 13:10:12.458676	1271	37	ht03_actn_d_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	015f675a-7f7a-4e68-b650-3cf1a416f6df	{}	\N
2022-11-25 13:10:12.46512	2022-11-25 13:10:12.465126	1272	37	ht03_file_d_date	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3dcdb090-5adb-4072-95a9-ccd32d3eb44e	{}	\N
2022-11-25 13:10:12.469672	2022-11-25 13:10:12.469678	1273	37	ht03_file_d_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6d37cba5-3d9b-4bc5-9de4-e7bd2f65d1d8	{}	\N
2022-11-25 13:10:12.474551	2022-11-25 13:10:12.474557	1274	37	ht03_actn_d_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a7398a52-a63e-475d-8829-5de3e5b58c40	{}	\N
2022-11-25 13:10:12.481431	2022-11-25 13:10:12.481437	1275	37	ht03_orig_actn_d_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	dbb93c0d-d495-4788-a0d9-bbca0d28d1ee	{}	\N
2022-11-25 13:10:12.486162	2022-11-25 13:10:12.486168	1276	37	ht03_orig_actn_d_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0842141a-2bb2-4209-a010-15e39e75b388	{}	\N
2022-11-25 13:10:12.490638	2022-11-25 13:10:12.490644	1277	37	ht03_actn_d_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	0fcc3137-b0d0-4897-aa37-987794d013f8	{}	\N
2022-11-25 13:10:12.496589	2022-11-25 13:10:12.496613	1278	37	ht03_orig_actn_d_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	1cecf900-7f83-47af-8ce2-0f6772e39f68	{}	\N
2022-11-25 13:10:12.50312	2022-11-25 13:10:12.503126	1279	37	ht03_orig_actn_d_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	71d1d284-cb4e-4881-a083-5225d39ed585	{}	\N
2022-11-25 13:10:12.50875	2022-11-25 13:10:12.508756	1280	37	ht03_file_d_day_of_week_no	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	1168c348-b454-47e1-8c28-45237fbf323a	{}	\N
2022-11-25 13:10:12.51489	2022-11-25 13:10:12.514896	1281	37	ht03_actn_d_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a9ee2f45-2f45-4894-a514-a8d406e90720	{}	\N
2022-11-25 13:10:12.52012	2022-11-25 13:10:12.520126	1282	37	ht03_orig_actn_d_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	313680c7-bcf9-455e-94de-88cbdca351a9	{}	\N
2022-11-25 13:10:12.52471	2022-11-25 13:10:12.524716	1283	37	ht03_actn_d_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	e47a8bd6-0bef-4669-b81a-88c5aa9319a0	{}	\N
2022-11-25 13:10:12.530761	2022-11-25 13:10:12.530767	1284	37	ht03_file_d_day_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	af49f737-c8a2-4e59-8f84-5fd2563e2821	{}	\N
2022-11-25 13:10:12.535732	2022-11-25 13:10:12.535738	1285	37	ht03_actn_d_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	389d0a7d-58dc-4a3d-806c-81a041883399	{}	\N
2022-11-25 13:10:12.540289	2022-11-25 13:10:12.540295	1286	37	ht03_file_d_week_of_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d34c24b2-5d6a-48bf-9b6f-032d2e026b1b	{}	\N
2022-11-25 13:10:12.546855	2022-11-25 13:10:12.546862	1287	37	ht03_file_d_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	3a1f3b77-36c6-4039-bfec-f264838e30a9	{}	\N
2022-11-25 13:10:12.551592	2022-11-25 13:10:12.551598	1288	37	ht03_actn_d_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	de5a31a1-048b-4e88-86e1-0bc3b1b428b8	{}	\N
2022-11-25 13:10:12.556252	2022-11-25 13:10:12.556257	1289	37	ht03_orig_actn_d_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2744fa92-0105-4152-9e44-b548a3f1236a	{}	\N
2022-11-25 13:10:12.562456	2022-11-25 13:10:12.562463	1290	37	ht03_orig_actn_d_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f705b472-e6ef-40e1-85a0-774e4ff0b6e7	{}	\N
2022-11-25 13:10:12.567657	2022-11-25 13:10:12.567663	1291	37	ht03_orig_actn_d_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	01cc15ee-9b91-4afe-8553-6708757523cd	{}	\N
2022-11-25 13:10:12.572241	2022-11-25 13:10:12.572247	1292	37	ht03_file_d_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	67a5103e-d1f0-40e2-bfff-538b6a3f76fe	{}	\N
2022-11-25 13:10:12.578306	2022-11-25 13:10:12.578316	1293	37	ht03_actn_d_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	aa57330a-b50b-423d-b654-85a778402e5e	{}	\N
2022-11-25 13:10:12.583506	2022-11-25 13:10:12.583512	1294	37	ht03_actn_d_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	90ae4782-08b4-4140-b0d1-3b74e4ebdaf0	{}	\N
2022-11-25 13:10:12.588086	2022-11-25 13:10:12.588092	1295	37	ht03_actn_d_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	3c93af14-e0a2-42cd-908e-713fc50ddc6f	{}	\N
2022-11-25 13:10:12.592576	2022-11-25 13:10:12.592582	1296	37	ht03_file_d_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	d83b1cb5-9ac4-4ade-8197-95d063b2056b	{}	\N
2022-11-25 13:10:12.598953	2022-11-25 13:10:12.598959	1297	37	ht03_file_d_epoch	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	329bbe54-dd76-4089-8f10-e98464cd4ede	{}	\N
2022-11-25 13:10:12.603441	2022-11-25 13:10:12.603447	1298	37	ht03_file_d_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ae8ca8a6-6633-4c8c-8e42-5b4c8e019ebc	{}	\N
2022-11-25 13:10:15.555132	2022-11-25 13:10:15.555142	1299	37	abbreviated_short_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	c232f3ca-237b-4e01-864a-84a188df255a	{}	\N
2022-11-25 13:10:15.621563	2022-11-25 13:10:15.62157	1300	38	ht10_sts_desc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	670fa20a-2463-46fd-9207-3087bda86432	{}	\N
2022-11-25 13:10:15.626385	2022-11-25 13:10:15.626394	1301	38	ht10_sts_type_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	33c9eb7c-1da2-4387-9d2a-739d0a052e9b	{}	\N
2022-11-25 13:10:15.632474	2022-11-25 13:10:15.632479	1302	38	ht03_actn_d_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5bbc4d09-721b-451e-93fd-5b25470e5293	{}	\N
2022-11-25 13:10:15.637026	2022-11-25 13:10:15.637032	1303	38	ht03_dest_ac_h_m	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	da83e7e4-af07-402f-a84f-8900effc6c29	{}	\N
2022-11-25 13:10:15.641503	2022-11-25 13:10:15.641509	1304	38	ht03_nmntd_ac_m	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	16e1667c-7de9-4593-9c01-9d3cde41f2a8	{}	\N
2022-11-25 13:10:15.648775	2022-11-25 13:10:15.648781	1305	38	ht03_actn_d_year_month_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	72f9d538-c508-4560-a632-678500f4bca5	{}	\N
2022-11-25 13:10:15.653437	2022-11-25 13:10:15.653444	1306	38	ht03_dest_ac_h_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	a2aeed8f-2d19-48e9-94ce-cd7213b8b858	{}	\N
2022-11-25 13:10:15.658266	2022-11-25 13:10:15.658271	1307	38	ht03_nmntd_ac_num	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	3f624637-20bd-4e20-bf1d-4fb8810b7e68	{}	\N
2022-11-25 13:10:15.665244	2022-11-25 13:10:15.66525	1308	38	ht03_sts_cde	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	f3e85782-3b0d-4ecc-9447-29e220dc32d0	{}	\N
2022-11-25 13:10:15.675142	2022-11-25 13:10:15.675148	1310	38	abbreviated_short_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5bdc6496-3fca-4753-944e-dab5ebd692d7	{}	\N
2022-11-25 13:10:15.682216	2022-11-25 13:10:15.682222	1311	38	amount	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	dc7c2c4e-7ef5-43d2-8897-092a55679b8a	{}	\N
2022-11-25 13:10:18.629442	2022-11-25 13:10:18.629455	1312	38	count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	8b801b53-c954-4735-8ab0-0b3a0eca2736	{}	\N
2022-11-25 13:10:18.697227	2022-11-25 13:10:18.697234	1313	39	ht10_sts_desc	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	8e9e7769-575f-48bd-b7d6-de6f75156d16	{"warning_markdown": null}	\N
2022-11-25 13:10:18.702332	2022-11-25 13:10:18.702338	1314	39	ht03_actn_d_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6d411edb-536e-4fb0-9545-2f5a0723a629	{"warning_markdown": null}	\N
2022-11-25 13:10:18.707045	2022-11-25 13:10:18.707051	1315	39	ht03_actn_d_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2555b2a9-241c-4073-96fb-b8317bd158c0	{"warning_markdown": null}	\N
2022-11-25 13:10:18.712896	2022-11-25 13:10:18.712903	1316	39	ht03_actn_d_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a5d31c16-611b-450f-9b21-320530264a6a	{"warning_markdown": null}	\N
2022-11-25 13:10:18.719514	2022-11-25 13:10:18.71952	1317	39	ht03_actn_d_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	7cfe04e3-9218-4ac8-b63c-ea8a60c822e0	{"warning_markdown": null}	\N
2022-11-25 13:10:18.724356	2022-11-25 13:10:18.724413	1318	39	ht03_actn_d_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	3e4bbdf9-74b3-489f-af62-3492765178c5	{"warning_markdown": null}	\N
2022-11-25 13:10:18.730446	2022-11-25 13:10:18.730452	1319	39	ht03_nmntd_ac_m	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	496a457e-bed4-4b5d-bbdc-1a26e4217b14	{"warning_markdown": null}	\N
2022-11-25 13:10:18.735555	2022-11-25 13:10:18.73556	1320	39	ht03_actn_d_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c2e844d2-9a15-4e65-abd0-112ce03ce29c	{"warning_markdown": null}	\N
2022-11-25 13:10:18.740215	2022-11-25 13:10:18.740221	1321	39	ht03_actn_d_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2d9ae9ea-01d8-4a50-bb91-dd3ea333fda1	{"warning_markdown": null}	\N
2022-11-25 13:10:18.746207	2022-11-25 13:10:18.746214	1322	39	ht03_actn_d_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	961f7159-bf5e-4d87-922c-ac5a65d65d37	{"warning_markdown": null}	\N
2022-11-25 13:10:18.751117	2022-11-25 13:10:18.751124	1323	39	ht03_actn_d_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	ea043077-b18b-41da-9365-c0a353290b2a	{"warning_markdown": null}	\N
2022-11-25 13:10:18.755725	2022-11-25 13:10:18.755731	1324	39	ht03_clnt_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	be7b26a5-fe10-4075-a1ce-8ef247bb4a9d	{"warning_markdown": null}	\N
2022-11-25 13:10:18.762295	2022-11-25 13:10:18.762303	1325	39	abbreviated_short_name_v_two	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	655876cc-ecd3-43e9-8a65-5ad1659f011e	{"warning_markdown": null}	\N
2022-11-25 13:10:18.767207	2022-11-25 13:10:18.767214	1326	39	bank_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	07084486-29fe-4ce4-a58c-581c33d2a57c	{"warning_markdown": null}	\N
2022-11-25 13:10:18.77205	2022-11-25 13:10:18.772056	1327	39	group_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	698195b6-1beb-417d-b704-21e8246f5a8a	{"warning_markdown": null}	\N
2022-11-25 13:10:18.778475	2022-11-25 13:10:18.778481	1328	39	total_number_of_transactions	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	4e0c4699-94d4-4707-a0b9-ed6e95488d0f	{"warning_markdown": null}	\N
2022-11-25 13:10:18.783678	2022-11-25 13:10:18.783684	1329	39	total_transaction_amount	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	a326a1a1-3211-49a3-b6ac-97c9a3ac7f95	{"warning_markdown": null}	\N
2022-11-25 13:10:18.788343	2022-11-25 13:10:18.788349	1330	39	number_of_transactions	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1f462bdb-75ab-4e28-97f6-be5a50c856aa	{"warning_markdown": null}	\N
2022-11-25 13:10:18.794863	2022-11-25 13:10:18.79487	1331	39	transaction_amount	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	fa7dd006-092b-4bd3-91e4-9b4ba8c5f4ea	{"warning_markdown": null}	\N
2022-11-25 13:10:18.800063	2022-11-25 13:10:18.800069	1332	39	lookup_field	f	t	ROW	t	t	\N	35	35	\N	\N	\N	8c9f6065-2204-48d8-b4fb-69462e84a3c4	{"warning_markdown": null}	\N
2022-11-25 13:10:21.726689	2022-11-25 13:10:21.726708	1333	39	_id	f	t	ROW	t	t	\N	35	35	\N	\N	\N	b14171d5-b8a2-40d6-825b-4439498b4929	{"warning_markdown": null}	\N
2022-11-25 13:10:21.802093	2022-11-25 13:10:21.802099	1334	40	ht03_actn_d_week_and_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	6c301f12-01fd-4d1c-8c43-c634ee9d7222	{"warning_markdown": null}	\N
2022-11-25 13:10:21.806843	2022-11-25 13:10:21.806849	1335	40	ht03_actn_d_day_of_week	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	73bf8de9-d112-4397-995d-9db17db19b46	{"warning_markdown": null}	\N
2022-11-25 13:10:21.814039	2022-11-25 13:10:21.814046	1336	40	ht03_actn_d_public_holiday	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	63ea8b4c-bf04-417c-b73f-8c4cfd79227a	{"warning_markdown": null}	\N
2022-11-25 13:10:21.818858	2022-11-25 13:10:21.818863	1337	40	ht03_actn_d_year_month	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	09cb19a4-d15a-49ae-9cf0-6351d3e7f6ac	{"warning_markdown": null}	\N
2022-11-25 13:10:21.8236	2022-11-25 13:10:21.823606	1338	40	ht03_actn_d_day	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e1563e0c-0f8a-427c-abf7-35becf8769e8	{"warning_markdown": null}	\N
2022-11-25 13:10:21.83017	2022-11-25 13:10:21.830177	1339	40	ht03_nmntd_ac_m	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	29daaf70-e2ff-432a-bcc2-dc6d0b90cbc2	{"warning_markdown": null}	\N
2022-11-25 13:10:21.835076	2022-11-25 13:10:21.835082	1340	40	ht03_rsn_desc_text	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2c83cd1c-26f3-4983-89d1-783f7e3ba628	{"warning_markdown": null}	\N
2022-11-25 13:10:21.839547	2022-11-25 13:10:21.839553	1341	40	ht03_actn_d_week_of_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	cd687b4f-1297-4646-b8d8-bc25d9139ab3	{"warning_markdown": null}	\N
2022-11-25 13:10:21.845936	2022-11-25 13:10:21.845942	1342	40	ht03_actn_d_day_weekend	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	bd2a0eac-cb9e-4521-9572-25ff77f0e068	{"warning_markdown": null}	\N
2022-11-25 13:10:21.850697	2022-11-25 13:10:21.850703	1343	40	ht03_actn_d_year	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	2f8222b9-9c31-40c5-9313-f37e7f3f0d32	{"warning_markdown": null}	\N
2022-11-25 13:10:21.855553	2022-11-25 13:10:21.855558	1344	40	ht03_actn_d_month	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	32ae5a56-082f-4ff2-b149-ef229932e1a6	{"warning_markdown": null}	\N
2022-11-25 13:10:21.860847	2022-11-25 13:10:21.86086	1345	40	ht03_clnt_id	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	c0230c9d-dc94-43e4-9d56-0b3c492409ec	{"warning_markdown": null}	\N
2022-11-25 13:10:21.866504	2022-11-25 13:10:21.86651	1346	40	abbreviated_short_name_v_two	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2af3d64d-9c8b-4bdb-b739-b9a627d5c088	{"warning_markdown": null}	\N
2022-11-25 13:10:21.87119	2022-11-25 13:10:21.871196	1347	40	bank_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0b97704c-eddb-4dc2-8aa4-a43985167cde	{"warning_markdown": null}	\N
2022-11-25 13:10:21.876032	2022-11-25 13:10:21.876038	1348	40	group_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	441ccce7-e0c6-4f69-ad1c-4b41e9a83d50	{"warning_markdown": null}	\N
2022-11-25 13:10:21.882042	2022-11-25 13:10:21.882047	1349	40	total_number_of_transactions	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	1d98cd8b-0134-4678-a112-0bc5d99fa5f8	{"warning_markdown": null}	\N
2022-11-25 13:10:21.88672	2022-11-25 13:10:21.886725	1350	40	total_transaction_amount	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	aeb7632e-7104-4eb5-be6a-0553bd13bbaf	{"warning_markdown": null}	\N
2022-11-25 13:10:21.892178	2022-11-25 13:10:21.892184	1351	40	number_of_transactions	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	79621c5a-9195-4f42-90b4-709a1bea7a73	{"warning_markdown": null}	\N
2022-11-25 13:10:21.89856	2022-11-25 13:10:21.898566	1352	40	transaction_amount	f	t	FLOAT	t	t	\N	35	35	\N	\N	\N	d4e8fb75-c052-4012-9f70-d060d9a97bc7	{"warning_markdown": null}	\N
2022-11-25 13:10:21.903228	2022-11-25 13:10:21.903234	1353	40	lookup_field	f	t	ROW	t	t	\N	35	35	\N	\N	\N	c6428f5d-e73e-4e56-9db3-26fe4770fa01	{"warning_markdown": null}	\N
2022-11-25 13:10:24.869644	2022-11-25 13:10:24.869657	1354	40	_id	f	t	ROW	t	t	\N	35	35	\N	\N	\N	26c4bd84-6d7a-45bb-b9fe-9d2524d8d62b	{"warning_markdown": null}	\N
2022-11-25 13:10:24.933384	2022-11-25 13:10:24.933391	1355	41	metric_value	f	t	VARCHAR	t	t	\N	35	35	\N	Interaction Segmentation	\N	79df7b77-5393-4d88-b9a2-05317e6f1269	{"warning_markdown": null}	\N
2022-11-25 13:10:24.938845	2022-11-25 13:10:24.938852	1356	41	date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	%Y-%m-%dT%H:%M:%S.%fZ	d47b969f-d1b0-4579-a41c-8c1c2a81fdd0	{"warning_markdown": null}	\N
2022-11-25 13:10:24.945216	2022-11-25 13:10:24.945223	1357	41	contextual_variable_one_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	ab01648e-d9a9-4eaf-a66f-7c6bebd98277	{"warning_markdown": null}	\N
2022-11-25 13:10:24.950384	2022-11-25 13:10:24.95039	1358	41	contextual_variable_two_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	afda5498-b07e-4f5b-af10-e7eb152f6af9	{"warning_markdown": null}	\N
2022-11-25 13:10:24.955302	2022-11-25 13:10:24.955309	1359	41	contextual_variable_one	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e56eac22-ab51-449a-9bb3-c9ae608ae46e	{"warning_markdown": null}	\N
2022-11-25 13:10:24.960314	2022-11-25 13:10:24.96033	1360	41	contextual_variable_two	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	d3e40a69-937d-47a7-a392-9b1192d5b630	{"warning_markdown": null}	\N
2022-11-25 13:10:24.966018	2022-11-25 13:10:24.966024	1361	41	metric_name	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	855514ee-6d3f-4e54-8401-37bf5663c42b	{"warning_markdown": null}	\N
2022-11-25 13:10:24.970785	2022-11-25 13:10:24.970792	1362	41	customer	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0bfd68c6-1ea7-464d-ac35-7bb92d02abc8	{"warning_markdown": null}	\N
2022-11-25 13:10:24.97551	2022-11-25 13:10:24.975516	1363	41	experiment	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	63e84341-160a-4893-8c86-790d5ea57b58	{"warning_markdown": null}	\N
2022-11-25 13:10:24.982247	2022-11-25 13:10:24.982253	1364	41	offer	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	963b3811-8ad9-41e1-985f-596a2aba3dbd	{"warning_markdown": null}	\N
2022-11-25 13:10:27.916671	2022-11-25 13:10:27.916685	1365	41	take_up	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	984d4d9a-bd22-4a1d-85f0-de2e18cc293f	{"warning_markdown": null}	\N
2022-11-25 13:10:27.992784	2022-11-25 13:10:27.992791	1366	42	date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	%Y-%m-%d	8215480b-b42e-47df-aa8a-c0d8ff03a415	{}	\N
2022-11-25 13:10:28.000217	2022-11-25 13:10:28.000224	1367	42	customer	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	5ae02eb8-255a-4fb0-b224-6d3bb9771659	{}	\N
2022-11-25 13:10:28.007209	2022-11-25 13:10:28.007217	1368	42	experiment	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	fac65177-bcfd-48c4-9b25-89cb4c8e7926	{}	\N
2022-11-25 13:10:28.014282	2022-11-25 13:10:28.014289	1369	42	experiment_count_display	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	1623097e-512a-4e78-be1b-a9dbba1e068b	{}	\N
2022-11-25 13:10:28.018834	2022-11-25 13:10:28.01884	1370	42	customer_type	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	412bca38-a356-4e25-9718-53e4a2b5bdb0	{}	\N
2022-11-25 13:10:30.951233	2022-11-25 13:10:30.951247	1371	42	experiment_count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	9fc37457-c1a6-43a3-bb8b-f8524c21d998	{}	\N
2022-11-25 13:10:31.0393	2022-11-25 13:10:31.039306	1372	43	start_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	%Y-%m-%dT%H:%M:%S.%fZ	4a054d6e-e8f7-45f0-992c-76c9ec9e97b5	{}	\N
2022-11-25 13:10:31.04628	2022-11-25 13:10:31.046286	1373	43	end_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	%Y-%m-%dT%H:%M:%S.%fZ	ee708168-db5d-4659-b09a-b467d3c9ec4e	{}	\N
2022-11-25 13:10:31.051591	2022-11-25 13:10:31.051597	1374	43	customer	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	e10b0814-935b-4dc1-8828-7db4dfbc8847	{}	\N
2022-11-25 13:10:31.056335	2022-11-25 13:10:31.05634	1375	43	experiment	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	0b519557-be61-43a4-ba5f-a4cd90de928d	{}	\N
2022-11-25 13:10:31.06295	2022-11-25 13:10:31.062957	1376	43	experiment_count_display	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	2bcbc87c-ca45-4ef5-ae6c-ce37b5295caf	{}	\N
2022-11-25 13:10:31.067689	2022-11-25 13:10:31.067695	1377	43	experiment_list	f	t	ARRAY	t	t	\N	35	35	\N	\N	\N	d049bdc1-cba5-4649-b212-2c5965c93272	{}	\N
2022-11-25 13:10:31.072242	2022-11-25 13:10:31.072248	1378	43	experiment_count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	db525bcf-38a4-4458-ac41-d9c54e3c2c7e	{}	\N
2022-11-25 13:10:31.078602	2022-11-25 13:10:31.078612	1379	43	experiment_interactions	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	5cdb5e61-53f2-45e0-906c-89238f799731	{}	\N
2022-11-25 13:10:34.009863	2022-11-25 13:10:34.009875	1380	43	_id	f	t	ROW	t	t	\N	35	35	\N	\N	\N	efd6cdf9-3fa4-4181-95f7-ca37aa6cfbc7	{}	\N
2022-11-25 13:10:34.067307	2022-11-25 13:10:34.067313	1381	44	start_date	t	t	VARCHAR	t	t	\N	35	35	\N	\N	%Y-%m-%dT%H:%M:%S	85bcd872-a207-47ce-bf0c-35832357c4f7	{}	\N
2022-11-25 13:10:36.984843	2022-11-25 13:10:36.984858	1382	44	experiment_count	f	t	BIGINT	t	t	\N	35	35	\N	\N	\N	28afe57e-32be-4d16-b33a-8d18d30bbf61	{}	\N
2022-11-25 13:10:37.049328	2022-11-25 13:10:37.049335	1383	45	ht03_rsn_desc_text	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	a79e5073-f255-4f62-9c73-b83287e9d6ea	{}	\N
2022-11-25 13:10:40.032677	2022-11-25 13:10:40.03269	1384	45	_id	f	t	VARCHAR	t	t	\N	35	35	\N	\N	\N	65464635-617d-491a-91ac-d4891e8b9ed2	{}	\N
\.


--
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.table_schema (created_on, changed_on, extra_json, id, tab_state_id, database_id, schema, "table", description, expanded, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (created_on, changed_on, id, table_name, main_dttm_col, default_endpoint, database_id, created_by_fk, changed_by_fk, "offset", description, is_featured, cache_timeout, schema, sql, params, perm, filter_select_enabled, fetch_values_predicate, is_sqllab_view, template_params, schema_perm, extra, uuid, is_managed_externally, external_url) FROM stdin;
2022-11-25 13:08:51.518807	2022-11-25 13:08:51.537912	12	bank_transactions_reliability	\N	\N	2	35	35	0	\N	f	\N	master	\N	{"remote_id": 9, "database_name": "ecosystem_server", "import_time": 1631277242}	[ecosystem_server].[bank_transactions_reliability](id:12)	f	\N	f	\N	[ecosystem_server].[master]	\N	36dc52de-79a3-4be0-8440-a848e500f33b	f	\N
2022-11-25 13:08:54.4948	2022-11-25 13:08:54.515569	13	bank_transactions_personality	\N	\N	2	35	35	0	\N	f	\N	master	\N	{"remote_id": 7, "database_name": "ecosystem_server", "import_time": 1631277242}	[ecosystem_server].[bank_transactions_personality](id:13)	f	\N	f	\N	[ecosystem_server].[master]	\N	e59869b4-750c-4ad7-bb68-93ef7343cdcf	f	\N
2022-11-25 13:08:57.486909	2022-11-25 13:08:57.504363	14	bank_customer	\N	\N	2	35	35	0	\N	f	\N	master		\N	[ecosystem_server].[bank_customer](id:14)	f	\N	f	\N	[ecosystem_server].[master]	\N	f9960f74-53cc-445e-bde1-1f922a99ebf9	f	\N
2022-11-25 13:09:00.556159	2022-11-25 13:09:00.577932	15	bank_transactions_time_series	\N	\N	2	35	35	0	\N	f	\N	master		\N	[ecosystem_server].[bank_transactions_time_series](id:15)	f	\N	f	\N	[ecosystem_server].[master]	\N	5a91355f-ed82-4e13-854d-b0f80cc75860	f	\N
2022-11-25 13:09:06.074535	2022-11-25 13:09:06.090322	16	models_scoring_history_xgboost	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta		{"remote_id": 8, "database_name": "ecosystem_server", "import_time": 1635252681}	[ecosystem_server].[models_scoring_history_xgboost](id:16)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	d0e68b84-3449-4bb5-9163-a34996588b4a	f	\N
2022-11-25 13:08:38.965628	2022-11-25 13:08:38.985276	8	models_scoring_history_deeplearning	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta		{"remote_id": 1, "database_name": "ecosystem_server", "import_time": 1631260091}	[ecosystem_server].[models_scoring_history_deeplearning](id:8)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	edf8c3b9-3bf8-4ddd-9ab6-bfb99f9ad316	f	\N
2022-11-25 13:08:42.348582	2022-11-25 13:08:42.378231	9	models_variable_importances_deeplearning	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta	\N	{"remote_id": 3, "database_name": "ecosystem_server", "import_time": 1631260091}	[ecosystem_server].[models_variable_importances_deeplearning](id:9)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	09894d24-5e8a-43df-b6db-e28260813b30	f	\N
2022-11-25 13:08:45.350346	2022-11-25 13:08:45.367942	10	models_model_summary_deeplearning	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta	\N	{"remote_id": 10, "database_name": "ecosystem_server", "import_time": 1631260091}	[ecosystem_server].[models_model_summary_deeplearning](id:10)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	4f1d9871-411c-4f67-a7bb-9035b8c2bb1c	f	\N
2022-11-25 13:08:48.407089	2022-11-25 13:08:48.455037	11	bank_transactions	\N	\N	2	35	35	0	\N	f	\N	master		{"remote_id": 6, "database_name": "ecosystem_server", "import_time": 1631277242}	[ecosystem_server].[bank_transactions](id:11)	f	\N	f	\N	[ecosystem_server].[master]	\N	1f7adfad-d52c-46ca-8bd5-7ddca4e97828	f	\N
2022-11-25 13:09:09.133271	2022-11-25 13:09:09.148926	17	models	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta		{"remote_id": 2, "database_name": "ecosystem_server", "import_time": 1635252681}	[ecosystem_server].[models](id:17)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	f4f39a91-ff42-4179-b3dc-c4cbc9346d81	f	\N
2022-11-25 13:09:12.148203	2022-11-25 13:09:12.167418	18	models_variable_importances_xgboost	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta	\N	{"remote_id": 9, "database_name": "ecosystem_server", "import_time": 1635252681}	[ecosystem_server].[models_variable_importances_xgboost](id:18)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	b19ac612-0a28-4064-8dc5-fd49264b90cc	f	\N
2022-11-25 13:09:15.162266	2022-11-25 13:09:15.178264	19	models_model_summary_xgboost	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta		\N	[ecosystem_server].[models_model_summary_xgboost](id:19)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	f6d5e47c-da77-4c02-a5ec-743b27f3abf9	f	\N
2022-11-25 13:09:18.157349	2022-11-25 13:09:18.199475	20	models_scoring_history_gbm	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta		{"remote_id": 5, "database_name": "ecosystem_server", "import_time": 1635253453}	[ecosystem_server].[models_scoring_history_gbm](id:20)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	072c3c37-5f45-4ab4-aa82-a5d287769195	f	\N
2022-11-25 13:09:21.324026	2022-11-25 13:09:21.349392	21	models_variable_importances_gbm	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta		{"remote_id": 4, "database_name": "ecosystem_server", "import_time": 1635253453}	[ecosystem_server].[models_variable_importances_gbm](id:21)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	9a6ea864-acc3-472e-96b0-089cefc0318a	f	\N
2022-11-25 13:09:24.352918	2022-11-25 13:09:24.371642	22	models_model_summary_gbm	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta		{"remote_id": 7, "database_name": "ecosystem_server", "import_time": 1635253453}	[ecosystem_server].[models_model_summary_gbm](id:22)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	d16f5ccc-2d50-49d5-977b-c213400a6007	f	\N
2022-11-25 13:09:27.424663	2022-11-25 13:09:27.447194	23	models_cm_gbm	\N	\N	2	35	35	0	\N	f	\N	ecosystem_meta	\N	{"remote_id": 6, "database_name": "ecosystem_server", "import_time": 1635253453}	[ecosystem_server].[models_cm_gbm](id:23)	f	\N	f	\N	[ecosystem_server].[ecosystem_meta]	\N	78f1bf82-5ac4-4b3d-b765-33e92c7896e3	f	\N
2022-11-25 13:09:30.441931	2022-11-25 13:09:30.463688	24	ecosystemruntime_summary_logging	date_log	\N	2	35	35	0	\N	f	\N	logging	\N	\N	[ecosystem_server].[ecosystemruntime_summary_logging](id:24)	f	\N	f	\N	[ecosystem_server].[logging]	\N	7f7b6243-04c4-448f-ac4f-fd862bb94bf1	f	\N
2022-11-25 13:09:33.564956	2022-11-25 13:09:33.583951	25	ecosystemruntime_summary_score	date_log	\N	2	35	35	0	\N	f	\N	logging	\N	\N	[ecosystem_server].[ecosystemruntime_summary_score](id:25)	f	\N	f	\N	[ecosystem_server].[logging]	\N	d219d932-43bb-4715-b8f5-1b215cdc11c2	f	\N
2022-11-25 13:09:36.688805	2022-11-25 13:09:36.709563	26	ecosystemruntime_summary_response	date_log	\N	2	35	35	0	\N	f	\N	logging	\N	\N	[ecosystem_server].[ecosystemruntime_summary_response](id:26)	f	\N	f	\N	[ecosystem_server].[logging]	\N	c1178002-d9e4-436a-b0cd-04ce616acc45	f	\N
2022-11-25 13:09:39.758122	2022-11-25 13:09:39.790246	27	complaints	\N	\N	2	35	35	0	\N	f	\N	complaints		\N	[ecosystem_server].[complaints](id:27)	f	\N	f	\N	[ecosystem_server].[complaints]	\N	ddcfc9fc-bb80-474a-be97-35486d542812	f	\N
2022-11-25 13:09:42.955397	2022-11-25 13:09:42.983291	28	zip_location_all	\N	\N	2	35	35	0	\N	f	\N	usa_banking	\N	\N	[ecosystem_server].[zip_location_all](id:28)	f	\N	f	\N	[ecosystem_server].[usa_banking]	\N	230cc2fa-f7f3-4651-b0fb-e20d59c3cdf6	f	\N
2022-11-25 13:09:46.100725	2022-11-25 13:09:46.122009	29	clickstream_journeys	\N	\N	2	35	35	0	\N	f	\N	bank_clickstream		\N	[ecosystem_server].[clickstream_journeys](id:29)	f	\N	f	\N	[ecosystem_server].[bank_clickstream]	\N	654eb9ab-c032-48a6-af93-8df95aebefee	f	\N
2022-11-25 13:09:49.30417	2022-11-25 13:09:49.324958	30	mixed_data	\N	\N	2	35	35	0	\N	f	\N	automated_qa_prediction		\N	[ecosystem_server].[mixed_data](id:30)	f	\N	f	\N	[ecosystem_server].[automated_qa_prediction]	\N	3081159e-e4ea-4bd1-9382-525ec74a6cf9	f	\N
2022-11-25 13:09:52.731607	2022-11-25 13:09:52.750882	31	just4u_options	\N	\N	2	35	35	0	\N	f	\N	telecommunications	\N	\N	[ecosystem_server].[just4u_options](id:31)	f	\N	f	\N	[ecosystem_server].[telecommunications]	\N	4a9ba356-79e4-4002-ab49-f5b54ba4c685	f	\N
2022-11-25 13:09:55.851358	2022-11-25 13:09:55.884908	32	just4u	\N	\N	2	35	35	0	\N	f	\N	telecommunications		\N	[ecosystem_server].[just4u](id:32)	f	\N	f	\N	[ecosystem_server].[telecommunications]	\N	406679e6-f5ea-43e8-bed7-bcd5aeac447d	f	\N
2022-11-25 13:09:58.925657	2022-11-25 13:09:58.949368	33	account_transaction	\N	\N	2	35	35	0	\N	f	\N	funds		\N	[ecosystem_server].[account_transaction](id:33)	f	\N	f	\N	[ecosystem_server].[funds]	\N	5f6930e7-9fb1-4085-a89a-efae3355749f	f	\N
2022-11-25 13:10:02.278366	2022-11-25 13:10:02.296354	34	account_transaction_org	\N	\N	2	35	35	0	\N	f	\N	funds		\N	[ecosystem_server].[account_transaction_org](id:34)	f	\N	f	\N	[ecosystem_server].[funds]	\N	3f3c9c6a-0672-40e9-b4eb-d8cca420e8bf	f	\N
2022-11-25 13:10:05.795503	2022-11-25 13:10:05.824365	35	collections_transactions_dashboard_rollup	\N	\N	2	35	35	0	\N	f	\N	collections		\N	[ecosystem_server].[collections_transactions_dashboard_rollup](id:35)	f	\N	f	\N	[ecosystem_server].[collections]	\N	94c02cc5-0817-4afa-a087-a5c3c609be69	f	\N
2022-11-25 13:10:08.904015	2022-11-25 13:10:08.926422	36	collections_transactions_s0_code	\N	\N	2	35	35	0	\N	f	\N	collections		\N	[ecosystem_server].[collections_transactions_s0_code](id:36)	f	\N	f	\N	[ecosystem_server].[collections]	\N	36a26166-c7d3-400f-8dcb-7c17c3d73b2a	f	\N
2022-11-25 13:10:11.95729	2022-11-25 13:10:11.974408	37	collections_transactions	\N	\N	2	35	35	0	\N	f	\N	collections		\N	[ecosystem_server].[collections_transactions](id:37)	f	\N	f	\N	[ecosystem_server].[collections]	\N	c4a05b0a-25ff-4663-80f9-266782084aca	f	\N
2022-11-25 13:10:15.581592	2022-11-25 13:10:15.607244	38	collections_transactions_s_code	\N	\N	2	35	35	0	\N	f	\N	collections		\N	[ecosystem_server].[collections_transactions_s_code](id:38)	f	\N	f	\N	[ecosystem_server].[collections]	\N	b2f7c464-7d0b-49d4-8f67-70b8a3217e5d	f	\N
2022-11-25 13:10:18.648484	2022-11-25 13:10:18.667624	39	collections_transactions_grouped_dashboard_rollup	\N	\N	2	35	35	0	\N	f	\N	collections		\N	[ecosystem_server].[collections_transactions_grouped_dashboard_rollup](id:39)	f	\N	f	\N	[ecosystem_server].[collections]	\N	e706581c-4d6b-42e2-bb01-b61de0f18f2e	f	\N
2022-11-25 13:10:21.760062	2022-11-25 13:10:21.779342	40	collections_transactions_reason_dashboard_rollup	\N	\N	2	35	35	0	\N	f	\N	collections		\N	[ecosystem_server].[collections_transactions_reason_dashboard_rollup](id:40)	f	\N	f	\N	[ecosystem_server].[collections]	\N	61e06c15-1433-4b1b-b3db-f7d59054630f	f	\N
2022-11-25 13:10:24.895988	2022-11-25 13:10:24.914356	41	experiment_details_dashboard	\N	\N	2	35	35	0	\N	f	\N	logging		\N	[ecosystem_server].[experiment_details_dashboard](id:41)	f	\N	f	\N	[ecosystem_server].[logging]	\N	e94287c8-1393-4f6e-94ed-502945c725b9	f	\N
2022-11-25 13:10:27.95082	2022-11-25 13:10:27.974094	42	experiment_customers_dashboard	\N	\N	2	35	35	0	\N	f	\N	logging		\N	[ecosystem_server].[experiment_customers_dashboard](id:42)	f	\N	f	\N	[ecosystem_server].[logging]	\N	b938bc09-79bd-407b-b92d-9ecce4048fb8	f	\N
2022-11-25 13:10:30.981559	2022-11-25 13:10:31.002196	43	experiment_interactions_dashboard	\N	\N	2	35	35	0	\N	f	\N	logging		\N	[ecosystem_server].[experiment_interactions_dashboard](id:43)	f	\N	f	\N	[ecosystem_server].[logging]	\N	64b56d5c-2cdb-4d89-bd6b-fa22ec491821	f	\N
2022-11-25 13:10:34.037873	2022-11-25 13:10:34.054969	44	experiment_calendar_dashboard	\N	\N	2	35	35	0	\N	f	\N	logging		\N	[ecosystem_server].[experiment_calendar_dashboard](id:44)	f	\N	f	\N	[ecosystem_server].[logging]	\N	738c9f25-7c40-48a7-829f-7d460fbf941d	f	\N
2022-11-25 13:10:37.015416	2022-11-25 13:10:37.035128	45	rsn_desc_text_list_for_filter	\N	\N	2	35	35	0	\N	f	\N	collections		\N	[ecosystem_server].[rsn_desc_text_list_for_filter](id:45)	f	\N	f	\N	[ecosystem_server].[collections]	\N	8e4af5fb-a042-4164-924f-e6329aa61930	f	\N
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (created_on, changed_on, id, name, type, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: tagged_object; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tagged_object (created_on, changed_on, id, tag_id, object_id, object_type, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.url (created_on, changed_on, id, url, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_attribute (created_on, changed_on, id, user_id, welcome_dashboard_id, created_by_fk, changed_by_fk) FROM stdin;
\.


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 104, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 275, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 528, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 35, true);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 36, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 37, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 167, true);


--
-- Name: access_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.access_request_id_seq', 1, false);


--
-- Name: alert_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alert_logs_id_seq', 1, false);


--
-- Name: alert_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alert_owner_id_seq', 1, false);


--
-- Name: alerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alerts_id_seq', 1, false);


--
-- Name: annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_id_seq', 1, false);


--
-- Name: annotation_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_layer_id_seq', 1, false);


--
-- Name: cache_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cache_keys_id_seq', 1, false);


--
-- Name: clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clusters_id_seq', 1, false);


--
-- Name: columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.columns_id_seq', 1, false);


--
-- Name: css_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.css_templates_id_seq', 1, false);


--
-- Name: dashboard_email_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_email_schedules_id_seq', 1, false);


--
-- Name: dashboard_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_roles_id_seq', 1, false);


--
-- Name: dashboard_slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_slices_id_seq', 212, true);


--
-- Name: dashboard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_user_id_seq', 17, true);


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 17, true);


--
-- Name: datasources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.datasources_id_seq', 1, false);


--
-- Name: dbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dbs_id_seq', 2, true);


--
-- Name: druiddatasource_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.druiddatasource_user_id_seq', 1, false);


--
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dynamic_plugin_id_seq', 1, false);


--
-- Name: favstar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favstar_id_seq', 1, false);


--
-- Name: filter_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_sets_id_seq', 1, false);


--
-- Name: key_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.key_value_id_seq', 2, true);


--
-- Name: keyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keyvalue_id_seq', 1, false);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 269, true);


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metrics_id_seq', 1, false);


--
-- Name: query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.query_id_seq', 1, false);


--
-- Name: report_execution_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_execution_log_id_seq', 1, false);


--
-- Name: report_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_recipient_id_seq', 1, false);


--
-- Name: report_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_schedule_id_seq', 1, false);


--
-- Name: report_schedule_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_schedule_user_id_seq', 1, false);


--
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rls_filter_roles_id_seq', 1, false);


--
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rls_filter_tables_id_seq', 1, false);


--
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.row_level_security_filters_id_seq', 1, false);


--
-- Name: saved_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.saved_query_id_seq', 1, false);


--
-- Name: sl_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sl_columns_id_seq', 1, false);


--
-- Name: sl_datasets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sl_datasets_id_seq', 1, false);


--
-- Name: sl_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sl_tables_id_seq', 1, false);


--
-- Name: slice_email_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slice_email_schedules_id_seq', 1, false);


--
-- Name: slice_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slice_user_id_seq', 208, true);


--
-- Name: slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slices_id_seq', 208, true);


--
-- Name: sql_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sql_metrics_id_seq', 60, true);


--
-- Name: sql_observations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sql_observations_id_seq', 1, false);


--
-- Name: sqlatable_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sqlatable_user_id_seq', 45, true);


--
-- Name: tab_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_state_id_seq', 1, true);


--
-- Name: table_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_columns_id_seq', 1384, true);


--
-- Name: table_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_schema_id_seq', 1, false);


--
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tables_id_seq', 45, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- Name: tagged_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tagged_object_id_seq', 1, false);


--
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.url_id_seq', 1, false);


--
-- Name: user_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_attribute_id_seq', 1, false);


--
-- Name: tables _customer_location_uc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT _customer_location_uc UNIQUE (database_id, schema, table_name);


--
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: access_request access_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: alert_logs alert_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_logs
    ADD CONSTRAINT alert_logs_pkey PRIMARY KEY (id);


--
-- Name: alert_owner alert_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_owner
    ADD CONSTRAINT alert_owner_pkey PRIMARY KEY (id);


--
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- Name: annotation_layer annotation_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_pkey PRIMARY KEY (id);


--
-- Name: annotation annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_pkey PRIMARY KEY (id);


--
-- Name: cache_keys cache_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_keys
    ADD CONSTRAINT cache_keys_pkey PRIMARY KEY (id);


--
-- Name: query client_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT client_id UNIQUE (client_id);


--
-- Name: clusters clusters_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_cluster_name_key UNIQUE (cluster_name);


--
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);


--
-- Name: clusters clusters_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_verbose_name_key UNIQUE (verbose_name);


--
-- Name: columns columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_pkey PRIMARY KEY (id);


--
-- Name: css_templates css_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_pkey PRIMARY KEY (id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_pkey PRIMARY KEY (id);


--
-- Name: dashboard_roles dashboard_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_pkey PRIMARY KEY (id);


--
-- Name: dashboard_slices dashboard_slices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_pkey PRIMARY KEY (id);


--
-- Name: dashboard_user dashboard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_pkey PRIMARY KEY (id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: datasources datasources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_database_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_database_name_key UNIQUE (database_name);


--
-- Name: dbs dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_pkey PRIMARY KEY (id);


--
-- Name: dbs dbs_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_verbose_name_key UNIQUE (verbose_name);


--
-- Name: druiddatasource_user druiddatasource_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.druiddatasource_user
    ADD CONSTRAINT druiddatasource_user_pkey PRIMARY KEY (id);


--
-- Name: dynamic_plugin dynamic_plugin_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_key_key UNIQUE (key);


--
-- Name: dynamic_plugin dynamic_plugin_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_name_key UNIQUE (name);


--
-- Name: dynamic_plugin dynamic_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_pkey PRIMARY KEY (id);


--
-- Name: favstar favstar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_pkey PRIMARY KEY (id);


--
-- Name: filter_sets filter_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_pkey PRIMARY KEY (id);


--
-- Name: dashboards idx_unique_slug; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT idx_unique_slug UNIQUE (slug);


--
-- Name: key_value key_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_pkey PRIMARY KEY (id);


--
-- Name: keyvalue keyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyvalue
    ADD CONSTRAINT keyvalue_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: metrics metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- Name: report_execution_log report_execution_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_pkey PRIMARY KEY (id);


--
-- Name: report_recipient report_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_pkey PRIMARY KEY (id);


--
-- Name: report_schedule report_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_pkey PRIMARY KEY (id);


--
-- Name: report_schedule_user report_schedule_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_roles rls_filter_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_pkey PRIMARY KEY (id);


--
-- Name: rls_filter_tables rls_filter_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_pkey PRIMARY KEY (id);


--
-- Name: row_level_security_filters row_level_security_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_pkey PRIMARY KEY (id);


--
-- Name: saved_query saved_query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_pkey PRIMARY KEY (id);


--
-- Name: sl_columns sl_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_pkey PRIMARY KEY (id);


--
-- Name: sl_columns sl_columns_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_uuid_key UNIQUE (uuid);


--
-- Name: sl_dataset_columns sl_dataset_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_pkey PRIMARY KEY (dataset_id, column_id);


--
-- Name: sl_dataset_tables sl_dataset_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_pkey PRIMARY KEY (dataset_id, table_id);


--
-- Name: sl_dataset_users sl_dataset_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_pkey PRIMARY KEY (dataset_id, user_id);


--
-- Name: sl_datasets sl_datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_pkey PRIMARY KEY (id);


--
-- Name: sl_datasets sl_datasets_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_uuid_key UNIQUE (uuid);


--
-- Name: sl_table_columns sl_table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_pkey PRIMARY KEY (table_id, column_id);


--
-- Name: sl_tables sl_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_pkey PRIMARY KEY (id);


--
-- Name: sl_tables sl_tables_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_uuid_key UNIQUE (uuid);


--
-- Name: slice_email_schedules slice_email_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_pkey PRIMARY KEY (id);


--
-- Name: slice_user slice_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_pkey PRIMARY KEY (id);


--
-- Name: slices slices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_pkey PRIMARY KEY (id);


--
-- Name: sql_metrics sql_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_pkey PRIMARY KEY (id);


--
-- Name: sql_observations sql_observations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_observations
    ADD CONSTRAINT sql_observations_pkey PRIMARY KEY (id);


--
-- Name: sqlatable_user sqlatable_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_pkey PRIMARY KEY (id);


--
-- Name: tab_state tab_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_pkey PRIMARY KEY (id);


--
-- Name: table_columns table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_pkey PRIMARY KEY (id);


--
-- Name: table_schema table_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_pkey PRIMARY KEY (id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tagged_object tagged_object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_pkey PRIMARY KEY (id);


--
-- Name: clusters uq_clusters_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT uq_clusters_uuid UNIQUE (uuid);


--
-- Name: columns uq_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT uq_columns_column_name UNIQUE (column_name, datasource_id);


--
-- Name: columns uq_columns_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT uq_columns_uuid UNIQUE (uuid);


--
-- Name: dashboard_email_schedules uq_dashboard_email_schedules_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT uq_dashboard_email_schedules_uuid UNIQUE (uuid);


--
-- Name: dashboard_slices uq_dashboard_slice; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT uq_dashboard_slice UNIQUE (dashboard_id, slice_id);


--
-- Name: dashboards uq_dashboards_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT uq_dashboards_uuid UNIQUE (uuid);


--
-- Name: datasources uq_datasources_cluster_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT uq_datasources_cluster_id UNIQUE (cluster_id, datasource_name);


--
-- Name: datasources uq_datasources_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT uq_datasources_uuid UNIQUE (uuid);


--
-- Name: dbs uq_dbs_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT uq_dbs_uuid UNIQUE (uuid);


--
-- Name: metrics uq_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT uq_metrics_metric_name UNIQUE (metric_name, datasource_id);


--
-- Name: metrics uq_metrics_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT uq_metrics_uuid UNIQUE (uuid);


--
-- Name: report_schedule uq_report_schedule_name_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT uq_report_schedule_name_type UNIQUE (name, type);


--
-- Name: row_level_security_filters uq_rls_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT uq_rls_name UNIQUE (name);


--
-- Name: saved_query uq_saved_query_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT uq_saved_query_uuid UNIQUE (uuid);


--
-- Name: slice_email_schedules uq_slice_email_schedules_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT uq_slice_email_schedules_uuid UNIQUE (uuid);


--
-- Name: slices uq_slices_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT uq_slices_uuid UNIQUE (uuid);


--
-- Name: sql_metrics uq_sql_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_metric_name UNIQUE (metric_name, table_id);


--
-- Name: sql_metrics uq_sql_metrics_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_uuid UNIQUE (uuid);


--
-- Name: table_columns uq_table_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_column_name UNIQUE (column_name, table_id);


--
-- Name: table_columns uq_table_columns_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_uuid UNIQUE (uuid);


--
-- Name: tables uq_tables_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT uq_tables_uuid UNIQUE (uuid);


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- Name: ix_alerts_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_alerts_active ON public.alerts USING btree (active);


--
-- Name: ix_cache_keys_datasource_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_cache_keys_datasource_uid ON public.cache_keys USING btree (datasource_uid);


--
-- Name: ix_creation_method; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_creation_method ON public.report_schedule USING btree (creation_method);


--
-- Name: ix_dashboard_email_schedules_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_dashboard_email_schedules_active ON public.dashboard_email_schedules USING btree (active);


--
-- Name: ix_key_value_expires_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_key_value_expires_on ON public.key_value USING btree (expires_on);


--
-- Name: ix_key_value_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_key_value_uuid ON public.key_value USING btree (uuid);


--
-- Name: ix_logs_user_id_dttm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_logs_user_id_dttm ON public.logs USING btree (user_id, dttm);


--
-- Name: ix_query_results_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_query_results_key ON public.query USING btree (results_key);


--
-- Name: ix_report_schedule_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_report_schedule_active ON public.report_schedule USING btree (active);


--
-- Name: ix_row_level_security_filters_filter_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_row_level_security_filters_filter_type ON public.row_level_security_filters USING btree (filter_type);


--
-- Name: ix_slice_email_schedules_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_slice_email_schedules_active ON public.slice_email_schedules USING btree (active);


--
-- Name: ix_sql_observations_dttm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_sql_observations_dttm ON public.sql_observations USING btree (dttm);


--
-- Name: ix_tab_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_tab_state_id ON public.tab_state USING btree (id);


--
-- Name: ix_table_schema_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_table_schema_id ON public.table_schema USING btree (id);


--
-- Name: ix_tagged_object_object_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_tagged_object_object_id ON public.tagged_object USING btree (object_id);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_dag_state ON public.annotation USING btree (layer_id, start_dttm, end_dttm);


--
-- Name: ti_user_id_changed_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_user_id_changed_on ON public.query USING btree (user_id, changed_on);


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: access_request access_request_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: access_request access_request_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_request
    ADD CONSTRAINT access_request_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: alert_logs alert_logs_alert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_logs
    ADD CONSTRAINT alert_logs_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES public.alerts(id);


--
-- Name: alert_owner alert_owner_alert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_owner
    ADD CONSTRAINT alert_owner_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES public.alerts(id);


--
-- Name: alert_owner alert_owner_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert_owner
    ADD CONSTRAINT alert_owner_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: alerts alerts_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: alerts alerts_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: alerts alerts_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_ibfk_3 FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: alerts alerts_ibfk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_ibfk_4 FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: alerts alerts_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: annotation annotation_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation_layer annotation_layer_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: annotation annotation_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.annotation_layer(id);


--
-- Name: clusters clusters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: clusters clusters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: columns columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: columns columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: css_templates css_templates_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_email_schedules dashboard_email_schedules_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_email_schedules
    ADD CONSTRAINT dashboard_email_schedules_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dashboard_roles dashboard_roles_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_roles dashboard_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: dashboard_slices dashboard_slices_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_slices dashboard_slices_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: dashboard_user dashboard_user_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: dashboard_user dashboard_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dashboards dashboards_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: datasources datasources_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT datasources_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dbs dbs_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: druiddatasource_user druiddatasource_user_datasource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.druiddatasource_user
    ADD CONSTRAINT druiddatasource_user_datasource_id_fkey FOREIGN KEY (datasource_id) REFERENCES public.datasources(id);


--
-- Name: druiddatasource_user druiddatasource_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.druiddatasource_user
    ADD CONSTRAINT druiddatasource_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: dynamic_plugin dynamic_plugin_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: embedded_dashboards embedded_dashboards_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.embedded_dashboards
    ADD CONSTRAINT embedded_dashboards_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: favstar favstar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: filter_sets filter_sets_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: columns fk_columns_datasource_id_datasources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.columns
    ADD CONSTRAINT fk_columns_datasource_id_datasources FOREIGN KEY (datasource_id) REFERENCES public.datasources(id);


--
-- Name: datasources fk_datasources_cluster_id_clusters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.datasources
    ADD CONSTRAINT fk_datasources_cluster_id_clusters FOREIGN KEY (cluster_id) REFERENCES public.clusters(id);


--
-- Name: metrics fk_metrics_datasource_id_datasources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT fk_metrics_datasource_id_datasources FOREIGN KEY (datasource_id) REFERENCES public.datasources(id);


--
-- Name: key_value key_value_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: key_value key_value_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: logs logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: metrics metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: metrics metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: query query_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: query query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: report_execution_log report_execution_log_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_recipient report_recipient_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_recipient report_recipient_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_schedule report_schedule_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_chart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_chart_id_fkey FOREIGN KEY (chart_id) REFERENCES public.slices(id);


--
-- Name: report_schedule report_schedule_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: report_schedule report_schedule_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- Name: report_schedule report_schedule_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: report_schedule_user report_schedule_user_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- Name: report_schedule_user report_schedule_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: rls_filter_roles rls_filter_roles_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_roles rls_filter_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: rls_filter_tables rls_filter_tables_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- Name: rls_filter_tables rls_filter_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: row_level_security_filters row_level_security_filters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: row_level_security_filters row_level_security_filters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: saved_query saved_query_db_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_db_id_fkey FOREIGN KEY (db_id) REFERENCES public.dbs(id);


--
-- Name: tab_state saved_query_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT saved_query_id FOREIGN KEY (saved_query_id) REFERENCES public.saved_query(id) ON DELETE SET NULL;


--
-- Name: saved_query saved_query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: sl_columns sl_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_columns sl_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_dataset_columns sl_dataset_columns_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_column_id_fkey FOREIGN KEY (column_id) REFERENCES public.sl_columns(id);


--
-- Name: sl_dataset_columns sl_dataset_columns_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- Name: sl_dataset_tables sl_dataset_tables_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- Name: sl_dataset_tables sl_dataset_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.sl_tables(id);


--
-- Name: sl_dataset_users sl_dataset_users_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- Name: sl_dataset_users sl_dataset_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: sl_datasets sl_datasets_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_datasets sl_datasets_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_datasets sl_datasets_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: sl_table_columns sl_table_columns_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_column_id_fkey FOREIGN KEY (column_id) REFERENCES public.sl_columns(id);


--
-- Name: sl_table_columns sl_table_columns_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.sl_tables(id);


--
-- Name: sl_tables sl_tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_tables sl_tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sl_tables sl_tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: slice_email_schedules slice_email_schedules_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slice_email_schedules slice_email_schedules_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slice_email_schedules slice_email_schedules_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: slice_email_schedules slice_email_schedules_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_email_schedules
    ADD CONSTRAINT slice_email_schedules_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slice_user slice_user_slice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_slice_id_fkey FOREIGN KEY (slice_id) REFERENCES public.slices(id);


--
-- Name: slice_user slice_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: slices slices_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: slices slices_last_saved_by_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_last_saved_by_fk FOREIGN KEY (last_saved_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: sql_metrics sql_metrics_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: sql_observations sql_observations_alert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_observations
    ADD CONSTRAINT sql_observations_alert_id_fkey FOREIGN KEY (alert_id) REFERENCES public.alerts(id);


--
-- Name: sqlatable_user sqlatable_user_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: sqlatable_user sqlatable_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tab_state tab_state_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: tab_state tab_state_latest_query_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_latest_query_id_fkey FOREIGN KEY (latest_query_id) REFERENCES public.query(client_id) ON DELETE SET NULL;


--
-- Name: tab_state tab_state_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_columns table_columns_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- Name: table_schema table_schema_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: table_schema table_schema_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- Name: table_schema table_schema_tab_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_tab_state_id_fkey FOREIGN KEY (tab_state_id) REFERENCES public.tab_state(id) ON DELETE CASCADE;


--
-- Name: tables tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tables tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- Name: tag tag_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tag tag_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: tagged_object tagged_object_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: url url_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: url url_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: user_attribute user_attribute_welcome_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_welcome_dashboard_id_fkey FOREIGN KEY (welcome_dashboard_id) REFERENCES public.dashboards(id);


--
-- PostgreSQL database dump complete
--

