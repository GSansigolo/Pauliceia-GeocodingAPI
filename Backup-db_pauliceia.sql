PGDMP     $    &                u            db_pauliceia    9.6.2    9.6.2 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       1262    41621    db_pauliceia    DATABASE     �   CREATE DATABASE db_pauliceia WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE db_pauliceia;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            	            2615    43226    topology    SCHEMA        CREATE SCHEMA topology;
    DROP SCHEMA topology;
             postgres    false                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    2                        3079    43227 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                  false                       0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                       false    1                        3079    41622    hstore 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;
    DROP EXTENSION hstore;
                  false    7                       0    0    EXTENSION hstore    COMMENT     S   COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';
                       false    5                        3079    41745    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    7                       0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    4                        3079    43236    unaccent 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;
    DROP EXTENSION unaccent;
                  false    7                       0    0    EXTENSION unaccent    COMMENT     P   COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';
                       false    3            �           1247    43245    getfaceedges_returntype    TYPE     M   CREATE TYPE getfaceedges_returntype AS (
	sequence integer,
	edge integer
);
 ,   DROP TYPE topology.getfaceedges_returntype;
       topology       postgres    false    9            �           1247    43246    topoelement    DOMAIN     �   CREATE DOMAIN topoelement AS integer[]
	CONSTRAINT dimensions CHECK (((array_upper(VALUE, 2) IS NULL) AND (array_upper(VALUE, 1) = 2)))
	CONSTRAINT lower_dimension CHECK ((array_lower(VALUE, 1) = 1))
	CONSTRAINT type_range CHECK (((VALUE)[2] > 0));
 "   DROP DOMAIN topology.topoelement;
       topology       postgres    false    9            �           1247    43250    topoelementarray    DOMAIN     �   CREATE DOMAIN topoelementarray AS integer[]
	CONSTRAINT dimensions CHECK (((array_upper(VALUE, 2) IS NOT NULL) AND (array_upper(VALUE, 2) = 2) AND (array_upper(VALUE, 3) IS NULL)));
 '   DROP DOMAIN topology.topoelementarray;
       topology       postgres    false    9            �           1247    43254    topogeometry    TYPE     e   CREATE TYPE topogeometry AS (
	topology_id integer,
	layer_id integer,
	id integer,
	type integer
);
 !   DROP TYPE topology.topogeometry;
       topology       postgres    false    9            �           1247    43257    validatetopology_returntype    TYPE     e   CREATE TYPE validatetopology_returntype AS (
	error character varying,
	id1 integer,
	id2 integer
);
 0   DROP TYPE topology.validatetopology_returntype;
       topology       postgres    false    9            H           1255    43261 |   affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION       CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;
 �   DROP FUNCTION public.affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43270    asgml(geometry)    FUNCTION     �   CREATE FUNCTION asgml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0, null, null)$_$;
 &   DROP FUNCTION public.asgml(geometry);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            @           1255    43271    asgml(geometry, integer)    FUNCTION     �   CREATE FUNCTION asgml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0, null, null)$_$;
 /   DROP FUNCTION public.asgml(geometry, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43274    askml(geometry)    FUNCTION     �   CREATE FUNCTION askml(geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), 15, null)$_$;
 &   DROP FUNCTION public.askml(geometry);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43275    askml(geometry, integer)    FUNCTION     �   CREATE FUNCTION askml(geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_transform($1,4326), $2, null)$_$;
 /   DROP FUNCTION public.askml(geometry, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43276 !   askml(integer, geometry, integer)    FUNCTION     �   CREATE FUNCTION askml(integer, geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), $3, null)$_$;
 8   DROP FUNCTION public.askml(integer, geometry, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43282    bdmpolyfromtext(text, integer)    FUNCTION     �  CREATE FUNCTION bdmpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_Multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$;
 5   DROP FUNCTION public.bdmpolyfromtext(text, integer);
       public       postgres    false    2    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43283    bdpolyfromtext(text, integer)    FUNCTION     $  CREATE FUNCTION bdpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;
 4   DROP FUNCTION public.bdpolyfromtext(text, integer);
       public       postgres    false    2    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43286 +   buffer(geometry, double precision, integer)    FUNCTION     �   CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Buffer($1, $2, $3)$_$;
 B   DROP FUNCTION public.buffer(geometry, double precision, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43312    find_extent(text, text)    FUNCTION     O  CREATE FUNCTION find_extent(text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") As extent FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;
 .   DROP FUNCTION public.find_extent(text, text);
       public       postgres    false    4    4    7    4    7    7    7    2            �           1255    43313    find_extent(text, text, text)    FUNCTION     �  CREATE FUNCTION find_extent(text, text, text) RETURNS box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '" As extent ' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;
 4   DROP FUNCTION public.find_extent(text, text, text);
       public       postgres    false    4    4    7    4    7    7    7    2            �           1255    43314    fix_geometry_columns()    FUNCTION     !  CREATE FUNCTION fix_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;
	foundschema integer;
BEGIN

	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	
	return 'This function is obsolete now that geometry_columns is a view';

END;
$$;
 -   DROP FUNCTION public.fix_geometry_columns();
       public       postgres    false    7    2            �           1255    43322    geomcollfromtext(text)    FUNCTION     �   CREATE FUNCTION geomcollfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;
 -   DROP FUNCTION public.geomcollfromtext(text);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43323    geomcollfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION geomcollfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;
 6   DROP FUNCTION public.geomcollfromtext(text, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43324    geomcollfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION geomcollfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 -   DROP FUNCTION public.geomcollfromwkb(bytea);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43325    geomcollfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION geomcollfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 6   DROP FUNCTION public.geomcollfromwkb(bytea, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43329    geomfromtext(text)    FUNCTION        CREATE FUNCTION geomfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_GeomFromText($1)$_$;
 )   DROP FUNCTION public.geomfromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43330    geomfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION geomfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_GeomFromText($1, $2)$_$;
 2   DROP FUNCTION public.geomfromtext(text, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43332    geomfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION geomfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;
 2   DROP FUNCTION public.geomfromwkb(bytea, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43355    linefromtext(text)    FUNCTION     �   CREATE FUNCTION linefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;
 )   DROP FUNCTION public.linefromtext(text);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43356    linefromtext(text, integer)    FUNCTION     �   CREATE FUNCTION linefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;
 2   DROP FUNCTION public.linefromtext(text, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43357    linefromwkb(bytea)    FUNCTION     �   CREATE FUNCTION linefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 )   DROP FUNCTION public.linefromwkb(bytea);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43358    linefromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION linefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 2   DROP FUNCTION public.linefromwkb(bytea, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43360    linestringfromtext(text)    FUNCTION     �   CREATE FUNCTION linestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1)$_$;
 /   DROP FUNCTION public.linestringfromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43361 !   linestringfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION linestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1, $2)$_$;
 8   DROP FUNCTION public.linestringfromtext(text, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43362    linestringfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION linestringfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 /   DROP FUNCTION public.linestringfromwkb(bytea);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43363 !   linestringfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION linestringfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 8   DROP FUNCTION public.linestringfromwkb(bytea, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43364 0   locate_along_measure(geometry, double precision)    FUNCTION     �   CREATE FUNCTION locate_along_measure(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_locate_between_measures($1, $2, $2) $_$;
 G   DROP FUNCTION public.locate_along_measure(geometry, double precision);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43379    mlinefromtext(text)    FUNCTION     �   CREATE FUNCTION mlinefromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;
 *   DROP FUNCTION public.mlinefromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43380    mlinefromtext(text, integer)    FUNCTION     �   CREATE FUNCTION mlinefromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;
 3   DROP FUNCTION public.mlinefromtext(text, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43381    mlinefromwkb(bytea)    FUNCTION     �   CREATE FUNCTION mlinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 *   DROP FUNCTION public.mlinefromwkb(bytea);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43382    mlinefromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION mlinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 3   DROP FUNCTION public.mlinefromwkb(bytea, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43383    mpointfromtext(text)    FUNCTION     �   CREATE FUNCTION mpointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;
 +   DROP FUNCTION public.mpointfromtext(text);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43384    mpointfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION mpointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;
 4   DROP FUNCTION public.mpointfromtext(text, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43385    mpointfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION mpointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 +   DROP FUNCTION public.mpointfromwkb(bytea);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43386    mpointfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION mpointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 4   DROP FUNCTION public.mpointfromwkb(bytea, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43387    mpolyfromtext(text)    FUNCTION     �   CREATE FUNCTION mpolyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;
 *   DROP FUNCTION public.mpolyfromtext(text);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43388    mpolyfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION mpolyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;
 3   DROP FUNCTION public.mpolyfromtext(text, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43389    mpolyfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION mpolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 *   DROP FUNCTION public.mpolyfromwkb(bytea);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43390    mpolyfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION mpolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 3   DROP FUNCTION public.mpolyfromwkb(bytea, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43392    multilinefromwkb(bytea)    FUNCTION     �   CREATE FUNCTION multilinefromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 .   DROP FUNCTION public.multilinefromwkb(bytea);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43393     multilinefromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION multilinefromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 7   DROP FUNCTION public.multilinefromwkb(bytea, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43394    multilinestringfromtext(text)    FUNCTION     �   CREATE FUNCTION multilinestringfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;
 4   DROP FUNCTION public.multilinestringfromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43395 &   multilinestringfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION multilinestringfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;
 =   DROP FUNCTION public.multilinestringfromtext(text, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43396    multipointfromtext(text)    FUNCTION     �   CREATE FUNCTION multipointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;
 /   DROP FUNCTION public.multipointfromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43397 !   multipointfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION multipointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1, $2)$_$;
 8   DROP FUNCTION public.multipointfromtext(text, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43398    multipointfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION multipointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 /   DROP FUNCTION public.multipointfromwkb(bytea);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43399 !   multipointfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION multipointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 8   DROP FUNCTION public.multipointfromwkb(bytea, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43400    multipolyfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION multipolyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 .   DROP FUNCTION public.multipolyfromwkb(bytea);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43401     multipolyfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION multipolyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 7   DROP FUNCTION public.multipolyfromwkb(bytea, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43402    multipolygonfromtext(text)    FUNCTION     �   CREATE FUNCTION multipolygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;
 1   DROP FUNCTION public.multipolygonfromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43403 #   multipolygonfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION multipolygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;
 :   DROP FUNCTION public.multipolygonfromtext(text, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43416    pointfromtext(text)    FUNCTION     �   CREATE FUNCTION pointfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;
 *   DROP FUNCTION public.pointfromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43417    pointfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION pointfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;
 3   DROP FUNCTION public.pointfromtext(text, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43418    pointfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION pointfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 *   DROP FUNCTION public.pointfromwkb(bytea);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43419    pointfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION pointfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 3   DROP FUNCTION public.pointfromwkb(bytea, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43422    polyfromtext(text)    FUNCTION     �   CREATE FUNCTION polyfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;
 )   DROP FUNCTION public.polyfromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43423    polyfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION polyfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;
 2   DROP FUNCTION public.polyfromtext(text, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43424    polyfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION polyfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 )   DROP FUNCTION public.polyfromwkb(bytea);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43425    polyfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION polyfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 2   DROP FUNCTION public.polyfromwkb(bytea, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43426    polygonfromtext(text)    FUNCTION        CREATE FUNCTION polygonfromtext(text) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1)$_$;
 ,   DROP FUNCTION public.polygonfromtext(text);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43427    polygonfromtext(text, integer)    FUNCTION     �   CREATE FUNCTION polygonfromtext(text, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;
 5   DROP FUNCTION public.polygonfromtext(text, integer);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43428    polygonfromwkb(bytea)    FUNCTION     �   CREATE FUNCTION polygonfromwkb(bytea) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;
 ,   DROP FUNCTION public.polygonfromwkb(bytea);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43429    polygonfromwkb(bytea, integer)    FUNCTION     �   CREATE FUNCTION polygonfromwkb(bytea, integer) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;
 5   DROP FUNCTION public.polygonfromwkb(bytea, integer);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �           1255    43431    probe_geometry_columns()    FUNCTION     �   CREATE FUNCTION probe_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN


	RETURN 'This function is obsolete now that geometry_columns is a view';
END

$$;
 /   DROP FUNCTION public.probe_geometry_columns();
       public       postgres    false    2    7            �           1255    43435 #   rename_geometry_table_constraints()    FUNCTION     �   CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$;
 :   DROP FUNCTION public.rename_geometry_table_constraints();
       public       postgres    false    7            �           1255    43437 "   rotate(geometry, double precision)    FUNCTION     �   CREATE FUNCTION rotate(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_rotateZ($1, $2)$_$;
 9   DROP FUNCTION public.rotate(geometry, double precision);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43438 #   rotatex(geometry, double precision)    FUNCTION     �   CREATE FUNCTION rotatex(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;
 :   DROP FUNCTION public.rotatex(geometry, double precision);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43439 #   rotatey(geometry, double precision)    FUNCTION     �   CREATE FUNCTION rotatey(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;
 :   DROP FUNCTION public.rotatey(geometry, double precision);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43440 #   rotatez(geometry, double precision)    FUNCTION     �   CREATE FUNCTION rotatez(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;
 :   DROP FUNCTION public.rotatez(geometry, double precision);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43441 3   scale(geometry, double precision, double precision)    FUNCTION     �   CREATE FUNCTION scale(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_scale($1, $2, $3, 1)$_$;
 J   DROP FUNCTION public.scale(geometry, double precision, double precision);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43442 E   scale(geometry, double precision, double precision, double precision)    FUNCTION     �   CREATE FUNCTION scale(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;
 \   DROP FUNCTION public.scale(geometry, double precision, double precision, double precision);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43443 )   se_envelopesintersect(geometry, geometry)    FUNCTION     �   CREATE FUNCTION se_envelopesintersect(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 && $2
	$_$;
 @   DROP FUNCTION public.se_envelopesintersect(geometry, geometry);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43446 *   se_locatealong(geometry, double precision)    FUNCTION     �   CREATE FUNCTION se_locatealong(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT SE_LocateBetween($1, $2, $2) $_$;
 A   DROP FUNCTION public.se_locatealong(geometry, double precision);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43455 &   snaptogrid(geometry, double precision)    FUNCTION     �   CREATE FUNCTION snaptogrid(geometry, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;
 =   DROP FUNCTION public.snaptogrid(geometry, double precision);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43456 8   snaptogrid(geometry, double precision, double precision)    FUNCTION     �   CREATE FUNCTION snaptogrid(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;
 O   DROP FUNCTION public.snaptogrid(geometry, double precision, double precision);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43460    st_asbinary(text)    FUNCTION     �   CREATE FUNCTION st_asbinary(text) RETURNS bytea
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsBinary($1::geometry);$_$;
 (   DROP FUNCTION public.st_asbinary(text);
       public       postgres    false    7            �           1255    43461    st_astext(bytea)    FUNCTION        CREATE FUNCTION st_astext(bytea) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsText($1::geometry);$_$;
 '   DROP FUNCTION public.st_astext(bytea);
       public       postgres    false    7            �           1255    43495 7   translate(geometry, double precision, double precision)    FUNCTION     �   CREATE FUNCTION translate(geometry, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_translate($1, $2, $3, 0)$_$;
 N   DROP FUNCTION public.translate(geometry, double precision, double precision);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43496 I   translate(geometry, double precision, double precision, double precision)    FUNCTION     �   CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;
 `   DROP FUNCTION public.translate(geometry, double precision, double precision, double precision);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43497 \   transscale(geometry, double precision, double precision, double precision, double precision)    FUNCTION     �   CREATE FUNCTION transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;
 s   DROP FUNCTION public.transscale(geometry, double precision, double precision, double precision, double precision);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43499    within(geometry, geometry)    FUNCTION     �   CREATE FUNCTION within(geometry, geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Within($1, $2)$_$;
 1   DROP FUNCTION public.within(geometry, geometry);
       public       postgres    false    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43510 g   _asgmledge(integer, integer, integer, public.geometry, regclass, text, integer, integer, text, integer)    FUNCTION     |
  CREATE FUNCTION _asgmledge(edge_id integer, start_node integer, end_node integer, line public.geometry, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  visited bool;
  nsprefix text;
  gml text;
BEGIN

  nsprefix := 'gml:';
  IF nsprefix_in IS NOT NULL THEN
    IF nsprefix_in = '' THEN
      nsprefix = nsprefix_in;
    ELSE
      nsprefix = nsprefix_in || ':';
    END IF;
  END IF;

  gml := '<' || nsprefix || 'Edge ' || nsprefix
    || 'id="' || idprefix || 'E' || edge_id || '">';

  -- Start node
  gml = gml || '<' || nsprefix || 'directedNode orientation="-"';
  -- Do visited bookkeeping if visitedTable was given
  visited = NULL;
  IF visitedTable IS NOT NULL THEN
    EXECUTE 'SELECT true FROM '
            || visitedTable::text
            || ' WHERE element_type = 1 AND element_id = '
            || start_node LIMIT 1 INTO visited;
    IF visited IS NOT NULL THEN
      gml = gml || ' xlink:href="#' || idprefix || 'N' || start_node || '" />';
    ELSE
      -- Mark as visited 
      EXECUTE 'INSERT INTO ' || visitedTable::text
        || '(element_type, element_id) VALUES (1, '
        || start_node || ')';
    END IF;
  END IF;
  IF visited IS NULL THEN
    gml = gml || '>';
    gml = gml || topology._AsGMLNode(start_node, NULL, nsprefix_in,
                                     prec, options, idprefix, gmlver);
    gml = gml || '</' || nsprefix || 'directedNode>';
  END IF;

  -- End node
  gml = gml || '<' || nsprefix || 'directedNode';
  -- Do visited bookkeeping if visitedTable was given
  visited = NULL;
  IF visitedTable IS NOT NULL THEN
    EXECUTE 'SELECT true FROM '
            || visitedTable::text
            || ' WHERE element_type = 1 AND element_id = '
            || end_node LIMIT 1 INTO visited;
    IF visited IS NOT NULL THEN
      gml = gml || ' xlink:href="#' || idprefix || 'N' || end_node || '" />';
    ELSE
      -- Mark as visited 
      EXECUTE 'INSERT INTO ' || visitedTable::text
        || '(element_type, element_id) VALUES (1, '
        || end_node || ')';
    END IF;
  END IF;
  IF visited IS NULL THEN
    gml = gml || '>';
    gml = gml || topology._AsGMLNode(end_node, NULL, nsprefix_in,
                                     prec, options, idprefix, gmlver);
    gml = gml || '</' || nsprefix || 'directedNode>';
  END IF;

  IF line IS NOT NULL THEN
    gml = gml || '<' || nsprefix || 'curveProperty>'
              || ST_AsGML(gmlver, line, prec, options, nsprefix_in)
              || '</' || nsprefix || 'curveProperty>';
  END IF;

  gml = gml || '</' || nsprefix || 'Edge>';

  RETURN gml;
END
$$;
 �   DROP FUNCTION topology._asgmledge(edge_id integer, start_node integer, end_node integer, line public.geometry, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer);
       topology       postgres    false    2    9    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            �           1255    43511 J   _asgmlface(text, integer, regclass, text, integer, integer, text, integer)    FUNCTION     <  CREATE FUNCTION _asgmlface(toponame text, face_id integer, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE
  visited bool;
  nsprefix text;
  gml text;
  rec RECORD;
  rec2 RECORD;
  bounds geometry;
BEGIN

  nsprefix := 'gml:';
  IF nsprefix_in IS NOT NULL THEN
    IF nsprefix_in = '' THEN
      nsprefix = nsprefix_in;
    ELSE
      nsprefix = nsprefix_in || ':';
    END IF;
  END IF;

  gml := '<' || nsprefix || 'Face ' || nsprefix
    || 'id="' || idprefix || 'F' || face_id || '">';

  -- Construct the face geometry, then for each polygon:
  FOR rec IN SELECT (ST_DumpRings((ST_Dump(ST_ForceRHR(
    topology.ST_GetFaceGeometry(toponame, face_id)))).geom)).geom
  LOOP

      -- Contents of a directed face are the list of edges
      -- that cover the specific ring
      bounds = ST_Boundary(rec.geom);

      FOR rec2 IN EXECUTE
        'SELECT e.*, ST_LineLocatePoint($1'
        || ', ST_LineInterpolatePoint(e.geom, 0.2)) as pos'
        || ', ST_LineLocatePoint($1'
        || ', ST_LineInterpolatePoint(e.geom, 0.8)) as pos2 FROM '
        || quote_ident(toponame)
        || '.edge e WHERE ( e.left_face = $2'
        || ' OR e.right_face = $2'
        || ') AND ST_Covers($1'
        || ', e.geom) ORDER BY pos'
        USING bounds, face_id
      LOOP

        gml = gml || '<' || nsprefix || 'directedEdge';

        -- if this edge goes in same direction to the
        --       ring bounds, make it with negative orientation
        IF rec2.pos2 > rec2.pos THEN -- edge goes in same direction
          gml = gml || ' orientation="-"';
        END IF;

        -- Do visited bookkeeping if visitedTable was given
        IF visitedTable IS NOT NULL THEN

          EXECUTE 'SELECT true FROM '
            || visitedTable::text
            || ' WHERE element_type = 2 AND element_id = '
            || rec2.edge_id LIMIT 1 INTO visited;
          IF visited THEN
            -- Use xlink:href if visited
            gml = gml || ' xlink:href="#' || idprefix || 'E'
                      || rec2.edge_id || '" />';
            CONTINUE;
          ELSE
            -- Mark as visited otherwise
            EXECUTE 'INSERT INTO ' || visitedTable::text
              || '(element_type, element_id) VALUES (2, '
              || rec2.edge_id || ')';
          END IF;

        END IF;

        gml = gml || '>';

        gml = gml || topology._AsGMLEdge(rec2.edge_id, rec2.start_node,
                                        rec2.end_node, rec2.geom,
                                        visitedTable, nsprefix_in,
                                        prec, options, idprefix, gmlver);
        gml = gml || '</' || nsprefix || 'directedEdge>';

      END LOOP;
    END LOOP;

  gml = gml || '</' || nsprefix || 'Face>';

  RETURN gml;
END
$_$;
 �   DROP FUNCTION topology._asgmlface(toponame text, face_id integer, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer);
       topology       postgres    false    9    2                        1255    43512 K   _asgmlnode(integer, public.geometry, text, integer, integer, text, integer)    FUNCTION     T  CREATE FUNCTION _asgmlnode(id integer, point public.geometry, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
  nsprefix text;
  gml text;
BEGIN

  nsprefix := 'gml:';
  IF NOT nsprefix_in IS NULL THEN
    IF nsprefix_in = '' THEN
      nsprefix = nsprefix_in;
    ELSE
      nsprefix = nsprefix_in || ':';
    END IF;
  END IF;

  gml := '<' || nsprefix || 'Node ' || nsprefix
    || 'id="' || idprefix || 'N' || id || '"';
  IF point IS NOT NULL THEN
    gml = gml || '>'
              || '<' || nsprefix || 'pointProperty>'
              || ST_AsGML(gmlver, point, prec, options, nsprefix_in)
              || '</' || nsprefix || 'pointProperty>'
              || '</' || nsprefix || 'Node>';
  ELSE
    gml = gml || '/>';
  END IF;
  RETURN gml;
END
$$;
 �   DROP FUNCTION topology._asgmlnode(id integer, point public.geometry, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer);
       topology       postgres    false    9    2    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7                       1255    43513 >   _st_addfacesplit(character varying, integer, integer, boolean)    FUNCTION     �  CREATE FUNCTION _st_addfacesplit(atopology character varying, anedge integer, oface integer, mbr_only boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
  fan RECORD;
  newface INTEGER;
  sql TEXT;
  isccw BOOLEAN;
  ishole BOOLEAN;

BEGIN

  IF oface = 0 AND mbr_only THEN
    RETURN NULL;
  END IF;

  SELECT null::int[] as newring_edges,
         null::geometry as shell
  INTO fan;

  SELECT array_agg(edge)
  FROM topology.getringedges(atopology, anedge)
  INTO STRICT fan.newring_edges;


  -- You can't get to the other side of an edge forming a ring 
  IF fan.newring_edges @> ARRAY[-anedge] THEN
    RETURN 0;
  END IF;


  sql := 'WITH ids as ( select row_number() over () as seq, edge '
    || 'from unnest($1) u(edge) ), edges AS ( select CASE WHEN i.edge < 0 '
    || 'THEN ST_Reverse(e.geom) ELSE e.geom END as g FROM ids i left join '
    || quote_ident(atopology) || '.edge_data e ON(e.edge_id = abs(i.edge)) '
    || 'ORDER BY seq) SELECT ST_MakePolygon(ST_MakeLine(g.g)) FROM edges g';
  EXECUTE sql INTO fan.shell USING
    fan.newring_edges
  ;


  isccw := NOT ST_OrderingEquals(fan.shell, ST_ForceRHR(fan.shell));


  IF oface = 0 THEN
    IF NOT isccw THEN
      RETURN NULL;
    END IF;
  END IF;

  IF mbr_only AND oface != 0 THEN
    -- Update old face mbr (nothing to do if we're opening an hole)
    IF isccw THEN -- {
      sql := 'UPDATE '
        || quote_ident(atopology)
        || '.face SET mbr = $1 WHERE face_id = $2';
    	EXECUTE sql USING
        ST_Envelope(fan.shell),
        oface
      ;
    END IF; -- }
    RETURN NULL;
  END IF;

  IF oface != 0 AND NOT isccw THEN -- {
    -- Face created an hole in an outer face
    sql := 'INSERT INTO '
      || quote_ident(atopology) || '.face(mbr) SELECT mbr FROM '
      || quote_ident(atopology)
      || '.face WHERE face_id = ' || oface
      || ' RETURNING face_id';
  ELSE
    sql := 'INSERT INTO '
      || quote_ident(atopology) || '.face(mbr) VALUES ($1) RETURNING face_id';
  END IF; -- }

  -- Insert new face
  EXECUTE sql INTO STRICT newface USING ST_Envelope(fan.shell);

  -- Update forward edges
  sql := 'UPDATE ' || quote_ident(atopology) ||
    '.edge_data SET left_face = $1 WHERE edge_id = ANY($3)'
  ;
  EXECUTE sql USING newface, oface,
    array(select +x from unnest(fan.newring_edges) u(x) where x > 0)
  ;

  -- Update backward edges
  sql := 'UPDATE ' || quote_ident(atopology) ||
    '.edge_data SET right_face = $1 WHERE edge_id = ANY($3)'
  ;
  EXECUTE sql USING newface, oface,
    array(select -x from unnest(fan.newring_edges) u(x) where x < 0)
  ;

  IF oface != 0 AND NOT isccw THEN -- {
    -- face shrinked, must update all non-contained edges and nodes
    ishole := true;
  ELSE
    ishole := false;
  END IF; -- }

  -- Update edges bounding the old face
  sql := 'UPDATE '
    || quote_ident(atopology)
    || '.edge_data SET left_face = CASE WHEN left_face = $2 THEN $3'
    || ' ELSE left_face END, right_face = CASE WHEN right_face = $2 '
    || ' THEN $3 ELSE right_face END WHERE ( left_face = $2 '
    || ' OR right_face = $2 ) AND NOT edge_id = ANY ($4) AND ';
  IF ishole THEN sql := sql || 'NOT '; END IF;
  sql := sql || '($1 && geom AND _ST_Contains($1'
    -- We only need to check a single point, but must not be an endpoint
    || ', ST_LineInterpolatePoint(geom, 0.2)) )';
  EXECUTE sql USING fan.shell, oface, newface,
    array(select abs(x) from unnest(fan.newring_edges) u(x));

  -- Update isolated nodes in new new face 
  sql := 'UPDATE '
    || quote_ident(atopology) || '.node SET containing_face = $2 '
    || ' WHERE containing_face = $3 AND ';
  IF ishole THEN sql := sql || 'NOT '; END IF;
  sql := sql || 'ST_Contains($1, geom)';
  EXECUTE sql USING fan.shell, newface, oface;

  RETURN newface;

END
$_$;
 w   DROP FUNCTION topology._st_addfacesplit(atopology character varying, anedge integer, oface integer, mbr_only boolean);
       topology       postgres    false    9    2                       1255    43514 6   _st_adjacentedges(character varying, integer, integer)    FUNCTION       CREATE FUNCTION _st_adjacentedges(atopology character varying, anode integer, anedge integer) RETURNS integer[]
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
  ret integer[];
BEGIN
  WITH edgestar AS (
    SELECT *, count(*) over () AS cnt
    FROM topology.GetNodeEdges(atopology, anode)
  )
  SELECT ARRAY[ (
      SELECT p.edge AS prev FROM edgestar p
      WHERE p.sequence = CASE WHEN m.sequence-1 < 1 THEN cnt
                         ELSE m.sequence-1 END
    ), (
      SELECT p.edge AS prev FROM edgestar p WHERE p.sequence = ((m.sequence)%cnt)+1
    ) ]
  FROM edgestar m
  WHERE edge = anedge
  INTO ret;

  RETURN ret;
END
$$;
 f   DROP FUNCTION topology._st_adjacentedges(atopology character varying, anode integer, anedge integer);
       topology       postgres    false    9    2                       1255    43515 !   _st_mintolerance(public.geometry)    FUNCTION     I  CREATE FUNCTION _st_mintolerance(ageom public.geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
    SELECT 3.6 * power(10,  - ( 15 - log(coalesce(
      nullif(
        greatest(abs(ST_xmin($1)), abs(ST_ymin($1)),
                 abs(ST_xmax($1)), abs(ST_ymax($1))),
        0),
      1)) ));
$_$;
 @   DROP FUNCTION topology._st_mintolerance(ageom public.geometry);
       topology       postgres    false    9    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7                       1255    43516 4   _st_mintolerance(character varying, public.geometry)    FUNCTION     �  CREATE FUNCTION _st_mintolerance(atopology character varying, ageom public.geometry) RETURNS double precision
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
DECLARE
  ret FLOAT8;
BEGIN
  SELECT COALESCE(
    NULLIF(precision, 0),
    topology._st_mintolerance($2))
  FROM topology.topology
  WHERE name = $1 INTO ret;
  IF NOT FOUND THEN
    RAISE EXCEPTION
      'No topology with name "%" in topology.topology', atopology;
  END IF;
  return ret;
END;
$_$;
 ]   DROP FUNCTION topology._st_mintolerance(atopology character varying, ageom public.geometry);
       topology       postgres    false    9    2    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7                       1255    43517 +   addedge(character varying, public.geometry)    FUNCTION     �  CREATE FUNCTION addedge(atopology character varying, aline public.geometry) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
	edgeid int;
	rec RECORD;
  ix geometry; 
BEGIN
	--
	-- Atopology and apoint are required
	-- 
	IF atopology IS NULL OR aline IS NULL THEN
		RAISE EXCEPTION 'Invalid null argument';
	END IF;

	--
	-- Aline must be a linestring
	--
	IF substring(geometrytype(aline), 1, 4) != 'LINE'
	THEN
		RAISE EXCEPTION 'Edge geometry must be a linestring';
	END IF;

	--
	-- Check there's no face registered in the topology
	--
	FOR rec IN EXECUTE 'SELECT count(face_id) FROM '
		|| quote_ident(atopology) || '.face '
		|| ' WHERE face_id != 0 LIMIT 1'
	LOOP
		IF rec.count > 0 THEN
			RAISE EXCEPTION 'AddEdge can only be used against topologies with no faces defined';
		END IF;
	END LOOP;

	--
	-- Check if the edge crosses an existing node
	--
	FOR rec IN EXECUTE 'SELECT node_id FROM '
		|| quote_ident(atopology) || '.node '
		|| 'WHERE ST_Crosses($1, geom)'
    USING aline
	LOOP
		RAISE EXCEPTION 'Edge crosses node %', rec.node_id;
	END LOOP;

	--
	-- Check if the edge intersects an existing edge
	-- on anything but endpoints
	--
	-- Following DE-9 Intersection Matrix represent
	-- the only relation we accept. 
	--
	--    F F 1
	--    F * *
	--    1 * 2
	--
	-- Example1: linestrings touching at one endpoint
	--    FF1 F00 102
	--    FF1 F** 1*2 <-- our match
	--
	-- Example2: linestrings touching at both endpoints
	--    FF1 F0F 1F2
	--    FF1 F** 1*2 <-- our match
	--
	FOR rec IN EXECUTE 'SELECT edge_id, geom, ST_Relate($1, geom, 2) as im FROM '
		|| quote_ident(atopology) || '.edge WHERE $1 && geom'
    USING aline
	LOOP

	  IF ST_RelateMatch(rec.im, 'FF1F**1*2') THEN
	    CONTINUE; -- no interior intersection
	  END IF;

	  -- Reuse an EQUAL edge (be it closed or not)
	  IF ST_RelateMatch(rec.im, '1FFF*FFF2') THEN
	      RETURN rec.edge_id;
	  END IF;

	  -- WARNING: the constructive operation might throw an exception
	  BEGIN
	    ix = ST_Intersection(rec.geom, aline);
	  EXCEPTION
	  WHEN OTHERS THEN
	    RAISE NOTICE 'Could not compute intersection between input edge (%) and edge % (%)', aline::text, rec.edge_id, rec.geom::text;
	  END;

	  RAISE EXCEPTION 'Edge intersects (not on endpoints) with existing edge % at or near point %', rec.edge_id, ST_AsText(ST_PointOnSurface(ix));

	END LOOP;

	--
	-- Get new edge id from sequence
	--
	FOR rec IN EXECUTE 'SELECT nextval(' ||
		quote_literal(
			quote_ident(atopology) || '.edge_data_edge_id_seq'
		) || ')'
	LOOP
		edgeid = rec.nextval;
	END LOOP;

	--
	-- Insert the new row
	--
	EXECUTE 'INSERT INTO '
		|| quote_ident(atopology)
		|| '.edge(edge_id, start_node, end_node, '
		|| 'next_left_edge, next_right_edge, '
		|| 'left_face, right_face, '
		|| 'geom) '
		|| ' VALUES('

		-- edge_id
		|| edgeid ||','

		-- start_node
		|| 'topology.addNode('
		|| quote_literal(atopology)
		|| ', ST_StartPoint($1)), '

		-- end_node
		|| 'topology.addNode('
		|| quote_literal(atopology)
		|| ', ST_EndPoint($1)), '

		-- next_left_edge
		|| -edgeid ||','

		-- next_right_edge
		|| edgeid ||','

		-- left_face
		|| '0,'

		-- right_face
		|| '0,'

		-- geom
		|| '$1)'
    USING aline;

	RETURN edgeid;
	
END
$_$;
 T   DROP FUNCTION topology.addedge(atopology character varying, aline public.geometry);
       topology       postgres    false    9    2    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            	           1255    43518 4   addface(character varying, public.geometry, boolean)    FUNCTION     �  CREATE FUNCTION addface(atopology character varying, apoly public.geometry, force_new boolean DEFAULT false) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
  bounds geometry;
  symdif geometry;
  faceid int;
  rec RECORD;
  rrec RECORD;
  relate text;
  right_edges int[];
  left_edges int[];
  all_edges geometry;
  old_faceid int;
  old_edgeid int;
  sql text;
  right_side bool;
  edgeseg geometry;
  p1 geometry;
  p2 geometry;
  p3 geometry;
  loc float8;
  segnum int;
  numsegs int;
BEGIN
  --
  -- Atopology and apoly are required
  -- 
  IF atopology IS NULL OR apoly IS NULL THEN
    RAISE EXCEPTION 'Invalid null argument';
  END IF;

  --
  -- Aline must be a polygon
  --
  IF substring(geometrytype(apoly), 1, 4) != 'POLY'
  THEN
    RAISE EXCEPTION 'Face geometry must be a polygon';
  END IF;

  for rrec IN SELECT (ST_DumpRings(ST_ForceRHR(apoly))).geom
  LOOP -- {
    --
    -- Find all bounds edges, forcing right-hand-rule
    -- to know what's left and what's right...
    --
    bounds = ST_Boundary(rrec.geom);

    sql := 'SELECT e.geom, e.edge_id, e.left_face, e.right_face FROM '
      || quote_ident(atopology)
      || '.edge e, (SELECT $1 as geom) r WHERE r.geom && e.geom'
    ;
    -- RAISE DEBUG 'SQL: %', sql;
    FOR rec IN EXECUTE sql USING bounds
    LOOP -- {
      --RAISE DEBUG 'Edge % has bounding box intersection', rec.edge_id;

      -- Find first non-empty segment of the edge
      numsegs = ST_NumPoints(rec.geom);
      segnum = 1;
      WHILE segnum < numsegs LOOP
        p1 = ST_PointN(rec.geom, segnum);
        p2 = ST_PointN(rec.geom, segnum+1);
        IF ST_Distance(p1, p2) > 0 THEN
          EXIT;
        END IF;
        segnum = segnum + 1;
      END LOOP;

      IF segnum = numsegs THEN
        RAISE WARNING 'Edge % is collapsed', rec.edge_id;
        CONTINUE; -- we don't want to spend time on it
      END IF;

      edgeseg = ST_MakeLine(p1, p2);

      -- Skip non-covered edges
      IF NOT ST_Equals(p2, ST_EndPoint(rec.geom)) THEN
        IF NOT ( _ST_Intersects(bounds, p1) AND _ST_Intersects(bounds, p2) )
        THEN
          --RAISE DEBUG 'Edge % has points % and % not intersecting with ring bounds', rec.edge_id, st_astext(p1), st_astext(p2);
          CONTINUE;
        END IF;
      ELSE
        -- must be a 2-points only edge, let's use Covers (more expensive)
        IF NOT _ST_Covers(bounds, edgeseg) THEN
          --RAISE DEBUG 'Edge % is not covered by ring', rec.edge_id;
          CONTINUE;
        END IF;
      END IF;

      p3 = ST_StartPoint(bounds);
      IF ST_DWithin(edgeseg, p3, 0) THEN
        -- Edge segment covers ring endpoint, See bug #874
        loc = ST_LineLocatePoint(edgeseg, p3);
        -- WARNING: this is as robust as length of edgeseg allows...
        IF loc > 0.9 THEN
          -- shift last point down 
          p2 = ST_LineInterpolatePoint(edgeseg, loc - 0.1);
        ELSIF loc < 0.1 THEN
          -- shift first point up
          p1 = ST_LineInterpolatePoint(edgeseg, loc + 0.1); 
        ELSE
          -- when ring start point is in between, we swap the points
          p3 = p1; p1 = p2; p2 = p3;
        END IF;
      END IF;

      right_side = ST_LineLocatePoint(bounds, p1) < 
                   ST_LineLocatePoint(bounds, p2);
  

      IF right_side THEN
        right_edges := array_append(right_edges, rec.edge_id);
        old_faceid = rec.right_face;
      ELSE
        left_edges := array_append(left_edges, rec.edge_id);
        old_faceid = rec.left_face;
      END IF;

      IF faceid IS NULL OR faceid = 0 THEN
        faceid = old_faceid;
        old_edgeid = rec.edge_id;
      ELSIF faceid != old_faceid THEN
        RAISE EXCEPTION 'Edge % has face % registered on the side of this face, while edge % has face % on the same side', rec.edge_id, old_faceid, old_edgeid, faceid;
      END IF;

      -- Collect all edges for final full coverage check
      all_edges = ST_Collect(all_edges, rec.geom);

    END LOOP; -- }
  END LOOP; -- }

  IF all_edges IS NULL THEN
    RAISE EXCEPTION 'Found no edges on the polygon boundary';
  END IF;


  --
  -- Check that all edges found, taken togheter,
  -- fully match the ring boundary and nothing more
  --
  -- If the test fail either we need to add more edges
  -- from the polygon ring or we need to split
  -- some of the existing ones.
  -- 
  bounds = ST_Boundary(apoly);
  IF NOT ST_isEmpty(ST_SymDifference(bounds, all_edges)) THEN
    IF NOT ST_isEmpty(ST_Difference(bounds, all_edges)) THEN
      RAISE EXCEPTION 'Polygon boundary is not fully defined by existing edges at or near point %', ST_AsText(ST_PointOnSurface(ST_Difference(bounds, all_edges)));
    ELSE
      RAISE EXCEPTION 'Existing edges cover polygon boundary and more at or near point % (invalid topology?)', ST_AsText(ST_PointOnSurface(ST_Difference(all_edges, bounds)));
    END IF;
  END IF;

  IF faceid IS NOT NULL AND faceid != 0 THEN
    IF NOT force_new THEN
      RETURN faceid;
    ELSE
    END IF;
  END IF;

  --
  -- Get new face id from sequence
  --
  FOR rec IN EXECUTE 'SELECT nextval(' ||
    quote_literal(
      quote_ident(atopology) || '.face_face_id_seq'
    ) || ')'
  LOOP
    faceid = rec.nextval;
  END LOOP;

  --
  -- Insert new face 
  --
  EXECUTE 'INSERT INTO '
    || quote_ident(atopology)
    || '.face(face_id, mbr) VALUES('
    -- face_id
    || faceid || ','
    -- minimum bounding rectangle
    || '$1)'
    USING ST_Envelope(apoly);

  --
  -- Update all edges having this face on the left
  --
  IF left_edges IS NOT NULL THEN
    EXECUTE 'UPDATE '
    || quote_ident(atopology)
    || '.edge_data SET left_face = '
    || quote_literal(faceid)
    || ' WHERE edge_id = ANY('
    || quote_literal(left_edges)
    || ') ';
  END IF;

  --
  -- Update all edges having this face on the right
  --
  IF right_edges IS NOT NULL THEN
    EXECUTE 'UPDATE '
    || quote_ident(atopology)
    || '.edge_data SET right_face = '
    || quote_literal(faceid)
    || ' WHERE edge_id = ANY('
    || quote_literal(right_edges)
    || ') ';
  END IF;


  --
  -- Set left_face/right_face of any contained edge 
  --
  EXECUTE 'UPDATE '
    || quote_ident(atopology)
    || '.edge_data SET right_face = '
    || quote_literal(faceid)
    || ', left_face = '
    || quote_literal(faceid)
    || ' WHERE ST_Contains($1, geom)'
    USING apoly;

  -- 
  -- Set containing_face of any contained node 
  -- 
  EXECUTE 'UPDATE '
    || quote_ident(atopology)
    || '.node SET containing_face = '
    || quote_literal(faceid)
    || ' WHERE containing_face IS NOT NULL AND ST_Contains($1, geom)'
    USING apoly;

  RETURN faceid;
	
END
$_$;
 g   DROP FUNCTION topology.addface(atopology character varying, apoly public.geometry, force_new boolean);
       topology       postgres    false    9    2    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            
           1255    43520 +   addnode(character varying, public.geometry)    FUNCTION     �   CREATE FUNCTION addnode(atopology character varying, apoint public.geometry) RETURNS integer
    LANGUAGE sql
    AS $_$
  SELECT topology.AddNode($1, $2, false, false);
$_$;
 U   DROP FUNCTION topology.addnode(atopology character varying, apoint public.geometry);
       topology       postgres    false    9    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7                       1255    43521 =   addnode(character varying, public.geometry, boolean, boolean)    FUNCTION     �  CREATE FUNCTION addnode(atopology character varying, apoint public.geometry, allowedgesplitting boolean, setcontainingface boolean DEFAULT false) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
DECLARE
	nodeid int;
	rec RECORD;
  containing_face int;
BEGIN
	--
	-- Atopology and apoint are required
	-- 
	IF atopology IS NULL OR apoint IS NULL THEN
		RAISE EXCEPTION 'Invalid null argument';
	END IF;

	--
	-- Apoint must be a point
	--
	IF substring(geometrytype(apoint), 1, 5) != 'POINT'
	THEN
		RAISE EXCEPTION 'Node geometry must be a point';
	END IF;

	--
	-- Check if a coincident node already exists
	-- 
	-- We use index AND x/y equality
	--
	FOR rec IN EXECUTE 'SELECT node_id FROM '
		|| quote_ident(atopology) || '.node ' ||
		'WHERE geom && $1 AND ST_X(geom) = ST_X($1) AND ST_Y(geom) = ST_Y($1)'
    USING apoint
	LOOP
		RETURN  rec.node_id;
	END LOOP;

	--
	-- Check if any edge crosses this node
	-- (endpoints are fine)
	--
	FOR rec IN EXECUTE 'SELECT edge_id FROM '
		|| quote_ident(atopology) || '.edge ' 
		|| 'WHERE ST_DWithin($1, geom, 0) AND '
    || 'NOT ST_Equals($1, ST_StartPoint(geom)) AND '
    || 'NOT ST_Equals($1, ST_EndPoint(geom))'
    USING apoint
	LOOP
    IF allowEdgeSplitting THEN
      RETURN topology.ST_ModEdgeSplit(atopology, rec.edge_id, apoint);
    ELSE
		  RAISE EXCEPTION 'An edge crosses the given node.';
    END IF;
	END LOOP;

  IF setContainingFace THEN
    containing_face := topology.GetFaceByPoint(atopology, apoint, 0);
  ELSE
    containing_face := NULL;
  END IF;

	--
	-- Get new node id from sequence
	--
	FOR rec IN EXECUTE 'SELECT nextval(' ||
		quote_literal(
			quote_ident(atopology) || '.node_node_id_seq'
		) || ')'
	LOOP
		nodeid = rec.nextval;
	END LOOP;

	--
	-- Insert the new row
	--
	EXECUTE 'INSERT INTO ' || quote_ident(atopology)
		|| '.node(node_id, containing_face, geom) 
		VALUES(' || nodeid || ',' || coalesce(containing_face::text, 'NULL')
    || ',$1)' USING apoint;

	RETURN nodeid;
	
END
$_$;
 �   DROP FUNCTION topology.addnode(atopology character varying, apoint public.geometry, allowedgesplitting boolean, setcontainingface boolean);
       topology       postgres    false    9    2    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7                       1255    43522 t   addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying)    FUNCTION     �   CREATE FUNCTION addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying) RETURNS integer
    LANGUAGE sql
    AS $_$
  SELECT topology.AddTopoGeometryColumn($1, $2, $3, $4, $5, NULL);
$_$;
 �   DROP FUNCTION topology.addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying);
       topology       postgres    false    9                       1255    43523 }   addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION addtopogeometrycolumn(toponame character varying, schema character varying, tbl character varying, col character varying, ltype character varying, child integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  intltype integer;
  newlevel integer;
  topoid integer;
  rec RECORD;
  newlayer_id integer;
  query text;
BEGIN

  -- Get topology id
  SELECT id INTO topoid
    FROM topology.topology WHERE name = toponame;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Topology % does not exist', quote_literal(toponame);
  END IF;

  IF ltype ILIKE '%POINT%' OR ltype ILIKE 'PUNTAL' THEN
    intltype = 1;
  ELSIF ltype ILIKE '%LINE%' OR ltype ILIKE 'LINEAL' THEN
    intltype = 2;
  ELSIF ltype ILIKE '%POLYGON%' OR ltype ILIKE 'AREAL' THEN
    intltype = 3;
  ELSIF ltype ILIKE '%COLLECTION%' OR ltype ILIKE 'GEOMETRY' THEN
    intltype = 4;
  ELSE
    RAISE EXCEPTION 'Layer type must be one of POINT,LINE,POLYGON,COLLECTION';
  END IF;

  --
  -- Add new TopoGeometry column in schema.table
  --
  EXECUTE 'ALTER TABLE ' || quote_ident(schema)
    || '.' || quote_ident(tbl) 
    || ' ADD COLUMN ' || quote_ident(col)
    || ' topology.TopoGeometry;';


  --
  -- See if child id exists and extract its level
  --
  IF child IS NOT NULL THEN
    SELECT level + 1 FROM topology.layer
      WHERE layer_id = child
        AND topology_id = topoid
      INTO newlevel;
    IF newlevel IS NULL THEN
      RAISE EXCEPTION 'Child layer % does not exist in topology "%"', child, toponame;
    END IF;
  END IF;

  --
  -- Get new layer id from sequence
  --
  EXECUTE 'SELECT nextval(' ||
    quote_literal(
      quote_ident(toponame) || '.layer_id_seq'
    ) || ')' INTO STRICT newlayer_id;

  EXECUTE 'INSERT INTO ' 
       'topology.layer(topology_id, '
       'layer_id, level, child_id, schema_name, '
       'table_name, feature_column, feature_type) '
       'VALUES ('
    || topoid || ','
    || newlayer_id || ',' || COALESCE(newlevel, 0) || ','
    || COALESCE(child::text, 'NULL') || ','
    || quote_literal(schema) || ','
    || quote_literal(tbl) || ','
    || quote_literal(col) || ','
    || intltype || ');';


  --
  -- Create a sequence for TopoGeometries in this new layer
  --
  EXECUTE 'CREATE SEQUENCE ' || quote_ident(toponame)
    || '.topogeo_s_' || newlayer_id;

  --
  -- Add constraints on TopoGeom column
  --
  EXECUTE 'ALTER TABLE ' || quote_ident(schema)
    || '.' || quote_ident(tbl) 
    || ' ADD CONSTRAINT "check_topogeom_' || col || '" CHECK ('
       'topology_id(' || quote_ident(col) || ') = ' || topoid
    || ' AND '
       'layer_id(' || quote_ident(col) || ') = ' || newlayer_id
    || ' AND '
       'type(' || quote_ident(col) || ') = ' || intltype
    || ');';

  --
  -- Add dependency of the feature column on the topology schema
  --
  query = 'INSERT INTO pg_catalog.pg_depend SELECT '
       'fcat.oid, fobj.oid, fsub.attnum, tcat.oid, '
       'tobj.oid, 0, ''n'' '
       'FROM pg_class fcat, pg_namespace fnsp, '
       ' pg_class fobj, pg_attribute fsub, '
       ' pg_class tcat, pg_namespace tobj '
       ' WHERE fcat.relname = ''pg_class'' '
       ' AND fnsp.nspname = ' || quote_literal(schema)
    || ' AND fobj.relnamespace = fnsp.oid '
       ' AND fobj.relname = ' || quote_literal(tbl)
    || ' AND fsub.attrelid = fobj.oid '
       ' AND fsub.attname = ' || quote_literal(col)
    || ' AND tcat.relname = ''pg_namespace'' '
       ' AND tobj.nspname = ' || quote_literal(toponame);

--
-- The only reason to add this dependency is to avoid
-- simple drop of a feature column. Still, drop cascade
-- will remove both the feature column and the sequence
-- corrupting the topology anyway ...
--

  RETURN newlayer_id;
END;
$$;
 �   DROP FUNCTION topology.addtopogeometrycolumn(toponame character varying, schema character varying, tbl character varying, col character varying, ltype character varying, child integer);
       topology       postgres    false    9    2                       1255    43524 "   addtosearchpath(character varying)    FUNCTION     L  CREATE FUNCTION addtosearchpath(a_schema_name character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
	var_result text;
	var_cur_search_path text;
BEGIN
	SELECT reset_val INTO var_cur_search_path FROM pg_settings WHERE name = 'search_path';
	IF var_cur_search_path LIKE '%' || quote_ident(a_schema_name) || '%' THEN
		var_result := a_schema_name || ' already in database search_path';
	ELSE
		var_cur_search_path := var_cur_search_path || ', '
                        || quote_ident(a_schema_name); 
		EXECUTE 'ALTER DATABASE ' || quote_ident(current_database())
                              || ' SET search_path = ' || var_cur_search_path;
		var_result := a_schema_name || ' has been added to end of database search_path ';
	END IF;

	EXECUTE 'SET search_path = ' || var_cur_search_path;
  
  RETURN var_result;
END
$$;
 I   DROP FUNCTION topology.addtosearchpath(a_schema_name character varying);
       topology       postgres    false    9    2                       1255    43525    asgml(topogeometry)    FUNCTION        CREATE FUNCTION asgml(tg topogeometry) RETURNS text
    LANGUAGE sql STABLE
    AS $_$
 SELECT topology.AsGML($1, 'gml');
$_$;
 /   DROP FUNCTION topology.asgml(tg topogeometry);
       topology       postgres    false    9    2039                       1255    43526    asgml(topogeometry, regclass)    FUNCTION     �   CREATE FUNCTION asgml(tg topogeometry, visitedtable regclass) RETURNS text
    LANGUAGE sql
    AS $_$
 SELECT topology.AsGML($1, 'gml', 15, 1, $2);
$_$;
 F   DROP FUNCTION topology.asgml(tg topogeometry, visitedtable regclass);
       topology       postgres    false    9    2039                       1255    43527    asgml(topogeometry, text)    FUNCTION     �   CREATE FUNCTION asgml(tg topogeometry, nsprefix text) RETURNS text
    LANGUAGE sql STABLE
    AS $_$
 SELECT topology.AsGML($1, $2, 15, 1, NULL);
$_$;
 >   DROP FUNCTION topology.asgml(tg topogeometry, nsprefix text);
       topology       postgres    false    9    2039                       1255    43528 #   asgml(topogeometry, regclass, text)    FUNCTION     �   CREATE FUNCTION asgml(tg topogeometry, visitedtable regclass, nsprefix text) RETURNS text
    LANGUAGE sql
    AS $_$
 SELECT topology.AsGML($1, $3, 15, 1, $2);
$_$;
 U   DROP FUNCTION topology.asgml(tg topogeometry, visitedtable regclass, nsprefix text);
       topology       postgres    false    9    2039            �           1255    43529 +   asgml(topogeometry, text, integer, integer)    FUNCTION     �   CREATE FUNCTION asgml(tg topogeometry, nsprefix text, prec integer, opts integer) RETURNS text
    LANGUAGE sql STABLE
    AS $_$
 SELECT topology.AsGML($1, $2, $3, $4, NULL);
$_$;
 Z   DROP FUNCTION topology.asgml(tg topogeometry, nsprefix text, prec integer, opts integer);
       topology       postgres    false    9    2039            �           1255    43530 5   asgml(topogeometry, text, integer, integer, regclass)    FUNCTION     �   CREATE FUNCTION asgml(tg topogeometry, nsprefix text, prec integer, options integer, vis regclass) RETURNS text
    LANGUAGE sql
    AS $_$
 SELECT topology.AsGML($1, $2, $3, $4, $5, '');
$_$;
 k   DROP FUNCTION topology.asgml(tg topogeometry, nsprefix text, prec integer, options integer, vis regclass);
       topology       postgres    false    9    2039                       1255    43531 ;   asgml(topogeometry, text, integer, integer, regclass, text)    FUNCTION     �   CREATE FUNCTION asgml(tg topogeometry, nsprefix text, prec integer, options integer, visitedtable regclass, idprefix text) RETURNS text
    LANGUAGE sql
    AS $_$
 SELECT topology.AsGML($1, $2, $3, $4, $5, $6, 3);
$_$;
 �   DROP FUNCTION topology.asgml(tg topogeometry, nsprefix text, prec integer, options integer, visitedtable regclass, idprefix text);
       topology       postgres    false    9    2039                       1255    43532 D   asgml(topogeometry, text, integer, integer, regclass, text, integer)    FUNCTION     �  CREATE FUNCTION asgml(tg topogeometry, nsprefix_in text, precision_in integer, options_in integer, visitedtable regclass, idprefix text, gmlver integer) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE
  nsprefix text;
  precision int;
  options int;
  visited bool;
  toponame text;
  gml text;
  sql text;
  rec RECORD;
  rec2 RECORD;
BEGIN

  nsprefix := 'gml:';
  IF nsprefix_in IS NOT NULL THEN
    IF nsprefix_in = '' THEN
      nsprefix = nsprefix_in;
    ELSE
      nsprefix = nsprefix_in || ':';
    END IF;
  END IF;

  precision := 15;
  IF precision_in IS NOT NULL THEN
    precision = precision_in;
  END IF;

  options := 1;
  IF options_in IS NOT NULL THEN
    options = options_in;
  END IF;

  -- Get topology name (for subsequent queries)
  SELECT name FROM topology.topology into toponame
              WHERE id = tg.topology_id;

  -- Puntual TopoGeometry
  IF tg.type = 1 THEN
    gml = '<' || nsprefix || 'TopoPoint>';
    -- For each defining node, print a directedNode
    FOR rec IN  EXECUTE 'SELECT r.element_id, n.geom from '
      || quote_ident(toponame) || '.relation r LEFT JOIN '
      || quote_ident(toponame) || '.node n ON (r.element_id = n.node_id)'
      || ' WHERE r.layer_id = ' || tg.layer_id
      || ' AND r.topogeo_id = ' || tg.id
    LOOP
      gml = gml || '<' || nsprefix || 'directedNode';
      -- Do visited bookkeeping if visitedTable was given
      IF visitedTable IS NOT NULL THEN
        EXECUTE 'SELECT true FROM '
                || visitedTable::text
                || ' WHERE element_type = 1 AND element_id = '
                || rec.element_id LIMIT 1 INTO visited;
        IF visited IS NOT NULL THEN
          gml = gml || ' xlink:href="#' || idprefix || 'N' || rec.element_id || '" />';
          CONTINUE;
        ELSE
          -- Mark as visited 
          EXECUTE 'INSERT INTO ' || visitedTable::text
            || '(element_type, element_id) VALUES (1, '
            || rec.element_id || ')';
        END IF;
      END IF;
      gml = gml || '>';
      gml = gml || topology._AsGMLNode(rec.element_id, rec.geom, nsprefix_in, precision, options, idprefix, gmlver);
      gml = gml || '</' || nsprefix || 'directedNode>';
    END LOOP;
    gml = gml || '</' || nsprefix || 'TopoPoint>';
    RETURN gml;

  ELSIF tg.type = 2 THEN -- lineal
    gml = '<' || nsprefix || 'TopoCurve>';

    FOR rec IN SELECT (ST_Dump(topology.Geometry(tg))).geom
    LOOP
      FOR rec2 IN EXECUTE
        'SELECT e.*, ST_LineLocatePoint($1'
        || ', ST_LineInterpolatePoint(e.geom, 0.2)) as pos'
        || ', ST_LineLocatePoint($1'
        || ', ST_LineInterpolatePoint(e.geom, 0.8)) as pos2 FROM '
        || quote_ident(toponame)
        || '.edge e WHERE ST_Covers($1'
        || ', e.geom) ORDER BY pos'
        -- TODO: add relation to the conditional, to reduce load ?
        USING rec.geom
      LOOP

        gml = gml || '<' || nsprefix || 'directedEdge';

        -- if this edge goes in opposite direction to the
        --       line, make it with negative orientation
        IF rec2.pos2 < rec2.pos THEN -- edge goes in opposite direction
          gml = gml || ' orientation="-"';
        END IF;

        -- Do visited bookkeeping if visitedTable was given
        IF visitedTable IS NOT NULL THEN

          EXECUTE 'SELECT true FROM '
            || visitedTable::text
            || ' WHERE element_type = 2 AND element_id = '
            || rec2.edge_id LIMIT 1 INTO visited;
          IF visited THEN
            -- Use xlink:href if visited
            gml = gml || ' xlink:href="#' || idprefix || 'E' || rec2.edge_id || '" />';
            CONTINUE;
          ELSE
            -- Mark as visited otherwise
            EXECUTE 'INSERT INTO ' || visitedTable::text
              || '(element_type, element_id) VALUES (2, '
              || rec2.edge_id || ')';
          END IF;

        END IF;


        gml = gml || '>';

        gml = gml || topology._AsGMLEdge(rec2.edge_id,
                                        rec2.start_node,
                                        rec2.end_node, rec2.geom,
                                        visitedTable,
                                        nsprefix_in, precision,
                                        options, idprefix, gmlver);


        gml = gml || '</' || nsprefix || 'directedEdge>';
      END LOOP;
    END LOOP;

    gml = gml || '</' || nsprefix || 'TopoCurve>';
    return gml;

  ELSIF tg.type = 3 THEN -- areal
    gml = '<' || nsprefix || 'TopoSurface>';

    -- For each defining face, print a directedFace
    FOR rec IN  EXECUTE 'SELECT f.face_id from '
      || quote_ident(toponame) || '.relation r LEFT JOIN '
      || quote_ident(toponame) || '.face f ON (r.element_id = f.face_id)'
      || ' WHERE r.layer_id = ' || tg.layer_id
      || ' AND r.topogeo_id = ' || tg.id
    LOOP
      gml = gml || '<' || nsprefix || 'directedFace';
      -- Do visited bookkeeping if visitedTable was given
      IF visitedTable IS NOT NULL THEN
        EXECUTE 'SELECT true FROM '
                || visitedTable::text
                || ' WHERE element_type = 3 AND element_id = '
                || rec.face_id LIMIT 1 INTO visited;
        IF visited IS NOT NULL THEN
          gml = gml || ' xlink:href="#' || idprefix || 'F' || rec.face_id || '" />';
          CONTINUE;
        ELSE
          -- Mark as visited 
          EXECUTE 'INSERT INTO ' || visitedTable::text
            || '(element_type, element_id) VALUES (3, '
            || rec.face_id || ')';
        END IF;
      END IF;
      gml = gml || '>';
      gml = gml || topology._AsGMLFace(toponame, rec.face_id, visitedTable,
                                       nsprefix_in, precision,
                                       options, idprefix, gmlver);
      gml = gml || '</' || nsprefix || 'directedFace>';
    END LOOP;
    gml = gml || '</' || nsprefix || 'TopoSurface>';
    RETURN gml;

  ELSIF tg.type = 4 THEN -- collection
    RAISE EXCEPTION 'Collection TopoGeometries are not supported by AsGML';

  END IF;
	

  RETURN gml;
	
END
$_$;
 �   DROP FUNCTION topology.asgml(tg topogeometry, nsprefix_in text, precision_in integer, options_in integer, visitedtable regclass, idprefix text, gmlver integer);
       topology       postgres    false    9    2039    2                       1255    43534 "   astopojson(topogeometry, regclass)    FUNCTION     �  CREATE FUNCTION astopojson(tg topogeometry, edgemaptable regclass) RETURNS text
    LANGUAGE plpgsql
    AS $_$
DECLARE
  toponame text;
  json text;
  sql text;
  bounds GEOMETRY;
  rec RECORD;
  rec2 RECORD;
  side int;
  arcid int;
  arcs int[];
  ringtxt TEXT[];
  comptxt TEXT[];
  edges_found BOOLEAN;
  old_search_path TEXT;
  all_faces int[];
  faces int[];
  visited_face int;
  shell_faces int[];
  visited_edges int[];
  looking_for_holes BOOLEAN;
BEGIN

  IF tg IS NULL THEN
    RETURN NULL;
  END IF;

  -- Get topology name (for subsequent queries)
  SELECT name FROM topology.topology into toponame
              WHERE id = tg.topology_id;

  -- Puntual TopoGeometry
  IF tg.type = 1 THEN
    -- TODO: implement scale ?
    --json := ST_AsGeoJSON(topology.Geometry(tg));
    --return json;
    RAISE EXCEPTION 'TopoJSON export does not support puntual objects';
  ELSIF tg.type = 2 THEN -- lineal

    FOR rec IN SELECT (ST_Dump(topology.Geometry(tg))).geom
    LOOP -- {

      sql := 'SELECT e.*, ST_LineLocatePoint($1'
            || ', ST_LineInterpolatePoint(e.geom, 0.2)) as pos'
            || ', ST_LineLocatePoint($1'
            || ', ST_LineInterpolatePoint(e.geom, 0.8)) as pos2 FROM '
            || quote_ident(toponame)
            || '.edge e WHERE ST_Covers($1'
            || ', e.geom) ORDER BY pos';
            -- TODO: add relation to the conditional, to reduce load ?
      FOR rec2 IN EXECUTE sql USING rec.geom
      LOOP -- {

        IF edgeMapTable IS NOT NULL THEN
          sql := 'SELECT arc_id-1 FROM ' || edgeMapTable::text || ' WHERE edge_id = $1';
          EXECUTE sql INTO arcid USING rec2.edge_id;
          IF arcid IS NULL THEN
            EXECUTE 'INSERT INTO ' || edgeMapTable::text
              || '(edge_id) VALUES ($1) RETURNING arc_id-1'
            INTO arcid USING rec2.edge_id;
          END IF;
        ELSE
          arcid := rec2.edge_id;
        END IF;

        -- edge goes in opposite direction
        IF rec2.pos2 < rec2.pos THEN
          arcid := -(arcid+1);
        END IF;

        arcs := arcs || arcid;

      END LOOP; -- }

      comptxt := comptxt || ( '[' || array_to_string(arcs, ',') || ']' );
      arcs := NULL;

    END LOOP; -- }

    json := '{ "type": "MultiLineString", "arcs": [' || array_to_string(comptxt,',') || ']}';

    return json;

  ELSIF tg.type = 3 THEN -- areal

    json := '{ "type": "MultiPolygon", "arcs": [';

    EXECUTE 'SHOW search_path' INTO old_search_path;
    EXECUTE 'SET search_path TO ' || quote_ident(toponame) || ',' || old_search_path;

    SELECT array_agg(id) as f
    FROM ( SELECT (topology.GetTopoGeomElements(tg))[1] as id ) as f
    INTO all_faces;


    visited_edges := ARRAY[]::int[];
    faces := all_faces;
    looking_for_holes := false;
    shell_faces := ARRAY[]::int[];

    LOOP -- {

      arcs := NULL;
      edges_found := false;


      FOR rec in -- {
WITH RECURSIVE
_edges AS (
  SELECT e.*, 
         e.left_face = ANY ( faces ) as lf,
         e.right_face = ANY ( faces ) as rf
  FROM edge e
  WHERE ( e.left_face = ANY ( faces ) OR
          e.right_face = ANY ( faces ) )
),
_leftmost_non_dangling_edge AS (
  SELECT * FROM _edges e
    WHERE ( e.lf or e.rf ) AND ( e.lf != e.rf )
          AND NOT e.edge_id = ANY ( visited_edges )
      -- TODO: and not in visited ?
  ORDER BY geom LIMIT 1
),
_edgepath AS (
  SELECT
    CASE
      WHEN e.lf THEN lme.edge_id
      ELSE -lme.edge_id
    END as signed_edge_id,
    false as back,

    e.lf = e.rf as dangling,
    e.left_face, e.right_face,
    e.lf, e.rf,
    e.next_right_edge, e.next_left_edge

  FROM _edges e, _leftmost_non_dangling_edge lme
  WHERE e.edge_id = abs(lme.edge_id)
    UNION
  SELECT
    CASE
      WHEN p.dangling AND NOT p.back THEN -p.signed_edge_id
      WHEN p.signed_edge_id < 0 THEN p.next_right_edge
      ELSE p.next_left_edge
    END, -- signed_edge_id
    CASE
      WHEN p.dangling AND NOT p.back THEN true
      ELSE false
    END, -- back

    e.lf = e.rf, -- dangling
    e.left_face, e.right_face,
    e.lf, e.rf,
    e.next_right_edge, e.next_left_edge

  FROM _edges e, _edgepath p
  WHERE
    e.edge_id = CASE
      WHEN p.dangling AND NOT p.back THEN abs(p.signed_edge_id)
      WHEN p.signed_edge_id < 0 THEN abs(p.next_right_edge)
      ELSE abs(p.next_left_edge)
    END
)
SELECT abs(signed_edge_id) as edge_id, signed_edge_id, dangling,
        lf, rf, left_face, right_face
FROM _edgepath
      LOOP  -- }{



        IF rec.left_face = ANY (all_faces) AND NOT rec.left_face = ANY (shell_faces) THEN
          shell_faces := shell_faces || rec.left_face;
        END IF;

        IF rec.right_face = ANY (all_faces) AND NOT rec.right_face = ANY (shell_faces) THEN
          shell_faces := shell_faces || rec.right_face;
        END IF;

        visited_edges := visited_edges || rec.edge_id;

        edges_found := true;

        -- TODO: drop ?
        IF rec.dangling THEN
          CONTINUE;
        END IF;

        IF rec.left_face = ANY (all_faces) AND rec.right_face = ANY (all_faces) THEN
          CONTINUE;
        END IF;

        IF edgeMapTable IS NOT NULL THEN
          sql := 'SELECT arc_id-1 FROM ' || edgeMapTable::text || ' WHERE edge_id = $1';
          EXECUTE sql INTO arcid USING rec.edge_id;
          IF arcid IS NULL THEN
            EXECUTE 'INSERT INTO ' || edgeMapTable::text
              || '(edge_id) VALUES ($1) RETURNING arc_id-1'
            INTO arcid USING rec.edge_id;
          END IF;
        ELSE
          arcid := rec.edge_id-1;
        END IF;

        -- Swap sign, use two's complement for negative edges
        IF rec.signed_edge_id >= 0 THEN
          arcid := - ( arcid + 1 );
        END IF;


        arcs := arcid || arcs;

      END LOOP; -- }


      IF NOT edges_found THEN
        IF looking_for_holes THEN
          looking_for_holes := false;
          comptxt := comptxt || ( '[' || array_to_string(ringtxt, ',') || ']' );
          ringtxt := NULL;
          faces := all_faces;
          shell_faces := ARRAY[]::int[];
        ELSE
          EXIT; -- end of loop
        END IF;
      ELSE
        faces := shell_faces;
        IF arcs IS NOT NULL THEN
          ringtxt := ringtxt || ( '[' || array_to_string(arcs,',') || ']' );
        END IF;
        looking_for_holes := true;
      END IF;

    END LOOP; -- }

    json := json || array_to_string(comptxt, ',') || ']}';

    EXECUTE 'SET search_path TO ' || old_search_path;


  ELSIF tg.type = 4 THEN -- collection
    RAISE EXCEPTION 'Collection TopoGeometries are not supported by AsTopoJSON';

  END IF;
	
  RETURN json;
	
END
$_$;
 K   DROP FUNCTION topology.astopojson(tg topogeometry, edgemaptable regclass);
       topology       postgres    false    2039    9    2                       1255    43536    cleartopogeom(topogeometry)    FUNCTION     �  CREATE FUNCTION cleartopogeom(tg topogeometry) RETURNS topogeometry
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  topology_info RECORD;
  sql TEXT;
BEGIN

  -- Get topology information
  SELECT id, name FROM topology.topology
    INTO topology_info
    WHERE id = topology_id(tg);
  IF NOT FOUND THEN
      RAISE EXCEPTION 'No topology with id "%" in topology.topology', topology_id(tg);
  END IF;

  -- Clear the TopoGeometry contents
  sql := 'DELETE FROM ' || quote_ident(topology_info.name)
        || '.relation WHERE layer_id = '
        || layer_id(tg)
        || ' AND topogeo_id = '
        || id(tg);
  EXECUTE sql;


  RETURN tg;

END
$$;
 7   DROP FUNCTION topology.cleartopogeom(tg topogeometry);
       topology       postgres    false    2039    9    2    2039                       1255    43537 2   copytopology(character varying, character varying)    FUNCTION     J
  CREATE FUNCTION copytopology(atopology character varying, newtopo character varying) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  rec RECORD;
  rec2 RECORD;
  oldtopo_id integer;
  newtopo_id integer;
  n int4;
  ret text;
BEGIN

  SELECT * FROM topology.topology where name = atopology
  INTO strict rec;
  oldtopo_id = rec.id;
  -- TODO: more gracefully handle unexistent topology

  SELECT topology.CreateTopology(newtopo, rec.SRID, rec.precision, rec.hasZ)
  INTO strict newtopo_id;

  -- Copy faces
  EXECUTE 'INSERT INTO ' || quote_ident(newtopo)
    || '.face SELECT * FROM ' || quote_ident(atopology)
    || '.face WHERE face_id != 0';
  -- Update faces sequence
  EXECUTE 'SELECT setval(' || quote_literal(
      quote_ident(newtopo) || '.face_face_id_seq'
    ) || ', (SELECT last_value FROM ' 
    || quote_ident(atopology) || '.face_face_id_seq))';

  -- Copy nodes
  EXECUTE 'INSERT INTO ' || quote_ident(newtopo)
    || '.node SELECT * FROM ' || quote_ident(atopology)
    || '.node';
  -- Update node sequence
  EXECUTE 'SELECT setval(' || quote_literal(
      quote_ident(newtopo) || '.node_node_id_seq'
    ) || ', (SELECT last_value FROM ' 
    || quote_ident(atopology) || '.node_node_id_seq))';

  -- Copy edges
  EXECUTE 'INSERT INTO ' || quote_ident(newtopo)
    || '.edge_data SELECT * FROM ' || quote_ident(atopology)
    || '.edge_data';
  -- Update edge sequence
  EXECUTE 'SELECT setval(' || quote_literal(
      quote_ident(newtopo) || '.edge_data_edge_id_seq'
    ) || ', (SELECT last_value FROM ' 
    || quote_ident(atopology) || '.edge_data_edge_id_seq))';

  -- Copy layers and their TopoGeometry sequences 
  FOR rec IN SELECT * FROM topology.layer WHERE topology_id = oldtopo_id
  LOOP
    INSERT INTO topology.layer (topology_id, layer_id, feature_type,
      level, child_id, schema_name, table_name, feature_column) 
      VALUES (newtopo_id, rec.layer_id, rec.feature_type,
              rec.level, rec.child_id, newtopo,
              'LAYER' ||  rec.layer_id, '');
    -- Create layer's TopoGeometry sequences
    EXECUTE 'SELECT last_value FROM ' 
      || quote_ident(atopology) || '.topogeo_s_' || rec.layer_id 
      INTO STRICT n;
    EXECUTE 'CREATE SEQUENCE ' || quote_ident(newtopo)
      || '.topogeo_s_' || rec.layer_id;
    EXECUTE 'SELECT setval(' || quote_literal(
      quote_ident(newtopo) || '.topogeo_s_' || rec.layer_id
      ) || ', ' || n || ')';
  END LOOP;

  -- Copy TopoGeometry definitions
  EXECUTE 'INSERT INTO ' || quote_ident(newtopo)
    || '.relation SELECT * FROM ' || quote_ident(atopology)
    || '.relation';

  RETURN newtopo_id;
END
$$;
 ]   DROP FUNCTION topology.copytopology(atopology character varying, newtopo character varying);
       topology       postgres    false    9    2                       1255    43538 3   createtopogeom(character varying, integer, integer)    FUNCTION     �   CREATE FUNCTION createtopogeom(toponame character varying, tg_type integer, layer_id integer) RETURNS topogeometry
    LANGUAGE sql STRICT
    AS $_$
  SELECT topology.CreateTopoGeom($1,$2,$3,'{{0,0}}');
$_$;
 f   DROP FUNCTION topology.createtopogeom(toponame character varying, tg_type integer, layer_id integer);
       topology       postgres    false    9    2039                       1255    43539 E   createtopogeom(character varying, integer, integer, topoelementarray)    FUNCTION     �  CREATE FUNCTION createtopogeom(toponame character varying, tg_type integer, layer_id integer, tg_objs topoelementarray) RETURNS topogeometry
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  i integer;
  dims varchar;
  outerdims varchar;
  innerdims varchar;
  obj_type integer;
  obj_id integer;
  ret topology.TopoGeometry;
  rec RECORD;
  layertype integer;
  layerlevel integer;
  layerchild integer;
BEGIN

  IF tg_type < 1 OR tg_type > 4 THEN
    RAISE EXCEPTION 'Invalid TopoGeometry type % (must be in the range 1..4)', tg_type;
  END IF;

  -- Get topology id into return TopoGeometry
  SELECT id INTO ret.topology_id
    FROM topology.topology WHERE name = toponame;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Topology % does not exist', quote_literal(toponame);
  END IF;

  --
  -- Get layer info
  --
  layertype := NULL;
  FOR rec IN EXECUTE 'SELECT * FROM topology.layer'
       ' WHERE topology_id = ' || ret.topology_id
    || ' AND layer_id = ' || layer_id
  LOOP
    layertype = rec.feature_type;
    layerlevel = rec.level;
    layerchild = rec.child_id;
  END LOOP;

  -- Check for existence of given layer id
  IF layertype IS NULL THEN
    RAISE EXCEPTION 'No layer with id % is registered with topology %', layer_id, toponame;
  END IF;

  -- Verify compatibility between layer geometry type and
  -- TopoGeom requested geometry type
  IF layertype != 4 and layertype != tg_type THEN
    RAISE EXCEPTION 'A Layer of type % cannot contain a TopoGeometry of type %', layertype, tg_type;
  END IF;

  -- Set layer id and type in return object
  ret.layer_id = layer_id;
  ret.type = tg_type;

  --
  -- Get new TopoGeo id from sequence
  --
  FOR rec IN EXECUTE 'SELECT nextval(' ||
    quote_literal(
      quote_ident(toponame) || '.topogeo_s_' || layer_id
    ) || ')'
  LOOP
    ret.id = rec.nextval;
  END LOOP;

  -- Loop over outer dimension
  i = array_lower(tg_objs, 1);
  LOOP
    obj_id = tg_objs[i][1];
    obj_type = tg_objs[i][2];

    -- Elements of type 0 represent emptiness, just skip them
    IF obj_type = 0 THEN
      IF obj_id != 0 THEN
        RAISE EXCEPTION 'Malformed empty topo element {0,%} -- id must be 0 as well', obj_id;
      END IF;
    ELSE
      IF layerlevel = 0 THEN -- array specifies lower-level objects
        IF tg_type != 4 and tg_type != obj_type THEN
          RAISE EXCEPTION 'A TopoGeometry of type % cannot contain topology elements of type %', tg_type, obj_type;
        END IF;
      ELSE -- array specifies lower-level topogeometries
        IF obj_type != layerchild THEN
          RAISE EXCEPTION 'TopoGeom element layer do not match TopoGeom child layer';
        END IF;
        -- TODO: verify that the referred TopoGeometry really
        -- exists in the relation table ?
      END IF;

      --RAISE NOTICE 'obj:% type:% id:%', i, obj_type, obj_id;

      --
      -- Insert record into the Relation table
      --
      EXECUTE 'INSERT INTO '||quote_ident(toponame)
        || '.relation(topogeo_id, layer_id, '
           'element_id,element_type) '
           ' VALUES ('||ret.id
        ||','||ret.layer_id
        || ',' || obj_id || ',' || obj_type || ');';
    END IF;

    i = i+1;
    IF i > array_upper(tg_objs, 1) THEN
      EXIT;
    END IF;
  END LOOP;

  RETURN ret;

END
$$;
 �   DROP FUNCTION topology.createtopogeom(toponame character varying, tg_type integer, layer_id integer, tg_objs topoelementarray);
       topology       postgres    false    2037    9    2    2039                       1255    43540 !   createtopology(character varying)    FUNCTION     �   CREATE FUNCTION createtopology(character varying) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT topology.CreateTopology($1, ST_SRID('POINT EMPTY'::geometry), 0); $_$;
 :   DROP FUNCTION topology.createtopology(character varying);
       topology       postgres    false    9                       1255    43541 *   createtopology(character varying, integer)    FUNCTION     �   CREATE FUNCTION createtopology(character varying, integer) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT topology.CreateTopology($1, $2, 0); $_$;
 C   DROP FUNCTION topology.createtopology(character varying, integer);
       topology       postgres    false    9                       1255    43542 <   createtopology(character varying, integer, double precision)    FUNCTION     �   CREATE FUNCTION createtopology(toponame character varying, srid integer, prec double precision) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$ SELECT topology.CreateTopology($1, $2, $3, false);$_$;
 h   DROP FUNCTION topology.createtopology(toponame character varying, srid integer, prec double precision);
       topology       postgres    false    9                       1255    43543 E   createtopology(character varying, integer, double precision, boolean)    FUNCTION     �!  CREATE FUNCTION createtopology(atopology character varying, srid integer, prec double precision, hasz boolean) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  rec RECORD;
  topology_id integer;
  ndims integer;
BEGIN

--  FOR rec IN SELECT * FROM pg_namespace WHERE text(nspname) = atopology
--  LOOP
--    RAISE EXCEPTION 'SQL/MM Spatial exception - schema already exists';
--  END LOOP;

  ndims = 2;
  IF hasZ THEN ndims = 3; END IF;

  ------ Fetch next id for the new topology
  FOR rec IN SELECT nextval('topology.topology_id_seq')
  LOOP
    topology_id = rec.nextval;
  END LOOP;


  EXECUTE 'CREATE SCHEMA ' || quote_ident(atopology);

  -------------{ face CREATION
  EXECUTE 
  'CREATE TABLE ' || quote_ident(atopology) || '.face ('
     'face_id SERIAL,'
     ' CONSTRAINT face_primary_key PRIMARY KEY(face_id)'
     ');';

  -- Add mbr column to the face table 
  EXECUTE
  'SELECT AddGeometryColumn('||quote_literal(atopology)
  ||',''face'',''mbr'','||quote_literal(srid)
  ||',''POLYGON'',2)'; -- 2d only mbr is good enough

  -------------} END OF face CREATION


  --------------{ node CREATION

  EXECUTE 
  'CREATE TABLE ' || quote_ident(atopology) || '.node ('
     'node_id SERIAL,'
  --|| 'geom GEOMETRY,'
     'containing_face INTEGER,'

     'CONSTRAINT node_primary_key PRIMARY KEY(node_id),'

  --|| 'CONSTRAINT node_geometry_type CHECK '
  --|| '( GeometryType(geom) = ''POINT'' ),'

     'CONSTRAINT face_exists FOREIGN KEY(containing_face) '
     'REFERENCES ' || quote_ident(atopology) || '.face(face_id)'

     ');';

  -- Add geometry column to the node table 
  EXECUTE
  'SELECT AddGeometryColumn('||quote_literal(atopology)
  ||',''node'',''geom'','||quote_literal(srid)
  ||',''POINT'',' || ndims || ')';

  --------------} END OF node CREATION

  --------------{ edge CREATION

  -- edge_data table
  EXECUTE 
  'CREATE TABLE ' || quote_ident(atopology) || '.edge_data ('
     'edge_id SERIAL NOT NULL PRIMARY KEY,'
     'start_node INTEGER NOT NULL,'
     'end_node INTEGER NOT NULL,'
     'next_left_edge INTEGER NOT NULL,'
     'abs_next_left_edge INTEGER NOT NULL,'
     'next_right_edge INTEGER NOT NULL,'
     'abs_next_right_edge INTEGER NOT NULL,'
     'left_face INTEGER NOT NULL,'
     'right_face INTEGER NOT NULL,'
  --   'geom GEOMETRY NOT NULL,'

  --   'CONSTRAINT edge_geometry_type CHECK '
  --   '( GeometryType(geom) = ''LINESTRING'' ),'

     'CONSTRAINT start_node_exists FOREIGN KEY(start_node)'
     ' REFERENCES ' || quote_ident(atopology) || '.node(node_id),'

     'CONSTRAINT end_node_exists FOREIGN KEY(end_node) '
     ' REFERENCES ' || quote_ident(atopology) || '.node(node_id),'

     'CONSTRAINT left_face_exists FOREIGN KEY(left_face) '
     'REFERENCES ' || quote_ident(atopology) || '.face(face_id),'

     'CONSTRAINT right_face_exists FOREIGN KEY(right_face) '
     'REFERENCES ' || quote_ident(atopology) || '.face(face_id),'

     'CONSTRAINT next_left_edge_exists FOREIGN KEY(abs_next_left_edge)'
     ' REFERENCES ' || quote_ident(atopology)
  || '.edge_data(edge_id)'
     ' DEFERRABLE INITIALLY DEFERRED,'

     'CONSTRAINT next_right_edge_exists '
     'FOREIGN KEY(abs_next_right_edge)'
     ' REFERENCES ' || quote_ident(atopology)
  || '.edge_data(edge_id) '
     ' DEFERRABLE INITIALLY DEFERRED'
     ');';

  -- Add geometry column to the edge_data table 
  EXECUTE
  'SELECT AddGeometryColumn('||quote_literal(atopology)
  ||',''edge_data'',''geom'','||quote_literal(srid)
  ||',''LINESTRING'',' || ndims || ')';


  -- edge standard view (select rule)
  EXECUTE 'CREATE VIEW ' || quote_ident(atopology)
    || '.edge AS SELECT '
       ' edge_id, start_node, end_node, next_left_edge, '
       ' next_right_edge, '
       ' left_face, right_face, geom FROM '
    || quote_ident(atopology) || '.edge_data';

  -- edge standard view description
  EXECUTE 'COMMENT ON VIEW ' || quote_ident(atopology)
    || '.edge IS '
       '''Contains edge topology primitives''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
    || '.edge.edge_id IS '
       '''Unique identifier of the edge''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
    || '.edge.start_node IS '
       '''Unique identifier of the node at the start of the edge''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
    || '.edge.end_node IS '
       '''Unique identifier of the node at the end of the edge''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
    || '.edge.next_left_edge IS '
       '''Unique identifier of the next edge of the face on the left (when looking in the direction from START_NODE to END_NODE), moving counterclockwise around the face boundary''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
    || '.edge.next_right_edge IS '
       '''Unique identifier of the next edge of the face on the right (when looking in the direction from START_NODE to END_NODE), moving counterclockwise around the face boundary''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
    || '.edge.left_face IS '
       '''Unique identifier of the face on the left side of the edge when looking in the direction from START_NODE to END_NODE''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
    || '.edge.right_face IS '
       '''Unique identifier of the face on the right side of the edge when looking in the direction from START_NODE to END_NODE''';
  EXECUTE 'COMMENT ON COLUMN ' || quote_ident(atopology)
    || '.edge.geom IS '
       '''The geometry of the edge''';

  -- edge standard view (insert rule)
  EXECUTE 'CREATE RULE edge_insert_rule AS ON INSERT '
             'TO ' || quote_ident(atopology)
    || '.edge DO INSTEAD '
                   ' INSERT into ' || quote_ident(atopology)
    || '.edge_data '
                   ' VALUES (NEW.edge_id, NEW.start_node, NEW.end_node, '
       ' NEW.next_left_edge, abs(NEW.next_left_edge), '
       ' NEW.next_right_edge, abs(NEW.next_right_edge), '
       ' NEW.left_face, NEW.right_face, NEW.geom);';

  --------------} END OF edge CREATION

  --------------{ layer sequence 
  EXECUTE 'CREATE SEQUENCE '
    || quote_ident(atopology) || '.layer_id_seq;';
  --------------} layer sequence

  --------------{ relation CREATION
  --
  EXECUTE 
  'CREATE TABLE ' || quote_ident(atopology) || '.relation ('
     ' topogeo_id integer NOT NULL, '
     ' layer_id integer NOT NULL, '
     ' element_id integer NOT NULL, '
     ' element_type integer NOT NULL, '
     ' UNIQUE(layer_id,topogeo_id,element_id,element_type));';

  EXECUTE 
  'CREATE TRIGGER relation_integrity_checks '
     'BEFORE UPDATE OR INSERT ON '
  || quote_ident(atopology) || '.relation FOR EACH ROW '
     ' EXECUTE PROCEDURE topology.RelationTrigger('
  ||topology_id||','||quote_literal(atopology)||')';
  --------------} END OF relation CREATION

  
  ------- Default (world) face
  EXECUTE 'INSERT INTO ' || quote_ident(atopology) || '.face(face_id) VALUES(0);';

  ------- GiST index on face
  EXECUTE 'CREATE INDEX face_gist ON '
    || quote_ident(atopology)
    || '.face using gist (mbr);';

  ------- GiST index on node
  EXECUTE 'CREATE INDEX node_gist ON '
    || quote_ident(atopology)
    || '.node using gist (geom);';

  ------- GiST index on edge
  EXECUTE 'CREATE INDEX edge_gist ON '
    || quote_ident(atopology)
    || '.edge_data using gist (geom);';

  ------- Indexes on left_face and right_face of edge_data
  ------- NOTE: these indexes speed up GetFaceGeometry (and thus
  -------       TopoGeometry::Geometry) by a factor of 10 !
  -------       See http://trac.osgeo.org/postgis/ticket/806
  EXECUTE 'CREATE INDEX edge_left_face_idx ON '
    || quote_ident(atopology)
    || '.edge_data (left_face);';
  EXECUTE 'CREATE INDEX edge_right_face_idx ON '
    || quote_ident(atopology)
    || '.edge_data (right_face);';

  ------- Indexes on start_node and end_node of edge_data
  ------- NOTE: this indexes speed up node deletion
  -------       by a factor of 1000 !
  -------       See http://trac.osgeo.org/postgis/ticket/2082
  EXECUTE 'CREATE INDEX edge_start_node_idx ON '
    || quote_ident(atopology)
    || '.edge_data (start_node);';
  EXECUTE 'CREATE INDEX edge_end_node_idx ON '
    || quote_ident(atopology)
    || '.edge_data (end_node);';

  -- TODO: consider also adding an index on node.containing_face 

  ------- Add record to the "topology" metadata table
  EXECUTE 'INSERT INTO topology.topology '
    || '(id, name, srid, precision, hasZ) VALUES ('
    || quote_literal(topology_id) || ','
    || quote_literal(atopology) || ','
    || quote_literal(srid) || ',' || quote_literal(prec)
    || ',' || hasZ
    || ')';

  RETURN topology_id;
END
$$;
 w   DROP FUNCTION topology.createtopology(atopology character varying, srid integer, prec double precision, hasz boolean);
       topology       postgres    false    9    2                       1255    43545 O   droptopogeometrycolumn(character varying, character varying, character varying)    FUNCTION     	  CREATE FUNCTION droptopogeometrycolumn(schema character varying, tbl character varying, col character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  rec RECORD;
  lyrinfo RECORD;
  ok BOOL;
  result text;
BEGIN

        -- Get layer and topology info
  ok = false;
  FOR rec IN EXECUTE 'SELECT t.name as toponame, l.* FROM '
       'topology.topology t, topology.layer l '
       ' WHERE l.topology_id = t.id'
       ' AND l.schema_name = ' || quote_literal(schema)
    || ' AND l.table_name = ' || quote_literal(tbl)
    || ' AND l.feature_column = ' || quote_literal(col)
  LOOP
    ok = true;
    lyrinfo = rec;
  END LOOP;

  -- Layer not found
  IF NOT ok THEN
    RAISE EXCEPTION 'No layer registered on %.%.%',
      schema,tbl,col;
  END IF;
    
  -- Clean up the topology schema
  BEGIN
    -- Cleanup the relation table
    EXECUTE 'DELETE FROM ' || quote_ident(lyrinfo.toponame)
      || '.relation '
         ' WHERE '
         'layer_id = ' || lyrinfo.layer_id;

    -- Drop the sequence for topogeoms in this layer
    EXECUTE 'DROP SEQUENCE ' || quote_ident(lyrinfo.toponame)
      || '.topogeo_s_' || lyrinfo.layer_id;
  EXCEPTION
    WHEN UNDEFINED_TABLE THEN
      RAISE NOTICE '%', SQLERRM;
    WHEN OTHERS THEN
      RAISE EXCEPTION 'Got % (%)', SQLERRM, SQLSTATE;
  END;

  ok = false;
  FOR rec IN SELECT * FROM pg_namespace n, pg_class c, pg_attribute a
    WHERE text(n.nspname) = schema
    AND c.relnamespace = n.oid
    AND text(c.relname) = tbl
    AND a.attrelid = c.oid
    AND text(a.attname) = col
  LOOP
    ok = true;
    EXIT;
  END LOOP;


  IF ok THEN
    -- Set feature column to NULL to bypass referential integrity
    -- checks
    EXECUTE 'UPDATE ' || quote_ident(schema) || '.'
      || quote_ident(tbl)
      || ' SET ' || quote_ident(col)
      || ' = NULL';
  END IF;

  -- Delete the layer record
  EXECUTE 'DELETE FROM topology.layer '
       ' WHERE topology_id = ' || lyrinfo.topology_id
    || ' AND layer_id = ' || lyrinfo.layer_id;

  IF ok THEN
    -- Drop the layer column
    EXECUTE 'ALTER TABLE ' || quote_ident(schema) || '.'
      || quote_ident(tbl)
      || ' DROP ' || quote_ident(col)
      || ' cascade';
  END IF;

  result = 'Layer ' || lyrinfo.layer_id || ' ('
    || schema || '.' || tbl || '.' || col
    || ') dropped';

  RETURN result;
END;
$$;
 w   DROP FUNCTION topology.droptopogeometrycolumn(schema character varying, tbl character varying, col character varying);
       topology       postgres    false    9    2                       1255    43546    droptopology(character varying)    FUNCTION     �  CREATE FUNCTION droptopology(atopology character varying) RETURNS text
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  topoid integer;
  rec RECORD;
BEGIN
  -- Get topology id
  SELECT id INTO topoid
    FROM topology.topology WHERE name = atopology;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Topology % does not exist', quote_literal(atopology);
  END IF;

  RAISE NOTICE 'Dropping all layers from topology % (%)',
    quote_literal(atopology), topoid;

  -- Drop all layers in the topology
  FOR rec IN EXECUTE 'SELECT * FROM topology.layer WHERE '
    || ' topology_id = ' || topoid
  LOOP

    EXECUTE 'SELECT topology.DropTopoGeometryColumn('
      || quote_literal(rec.schema_name)
      || ','
      || quote_literal(rec.table_name)
      || ','
      || quote_literal(rec.feature_column)
      || ')';
  END LOOP;

  -- Delete record from topology.topology
  EXECUTE 'DELETE FROM topology.topology WHERE id = '
    || topoid;

  -- Drop the schema (if it exists)
  FOR rec IN SELECT * FROM pg_namespace WHERE text(nspname) = atopology
  LOOP
    EXECUTE 'DROP SCHEMA '||quote_ident(atopology)||' CASCADE';
  END LOOP;

  RETURN 'Topology ' || quote_literal(atopology) || ' dropped';
END
$$;
 B   DROP FUNCTION topology.droptopology(atopology character varying);
       topology       postgres    false    9    2                       1255    43547 "   equals(topogeometry, topogeometry)    FUNCTION       CREATE FUNCTION equals(tg1 topogeometry, tg2 topogeometry) RETURNS boolean
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
  rec RECORD;
  toponame varchar;
  query text;
BEGIN

  IF tg1.topology_id != tg2.topology_id THEN
    -- TODO: revert to ::geometry instead ?
    RAISE EXCEPTION 'Cannot compare TopoGeometries from different topologies';
  END IF;

  -- Not the same type, not equal
  IF tg1.type != tg2.type THEN
    RETURN FALSE;
  END IF;

  -- Geometry collection are not currently supported
  IF tg2.type = 4 THEN
    RAISE EXCEPTION 'GeometryCollection are not supported by equals()';
  END IF;

        -- Get topology name
        SELECT name FROM topology.topology into toponame
                WHERE id = tg1.topology_id;

  -- Two geometries are equal if they are composed by 
  -- the same TopoElements
  FOR rec IN EXECUTE 'SELECT * FROM '
    || ' topology.GetTopoGeomElements('
    || quote_literal(toponame) || ', '
    || tg1.layer_id || ',' || tg1.id || ') '
    || ' EXCEPT SELECT * FROM '
    || ' topology.GetTopogeomElements('
    || quote_literal(toponame) || ', '
    || tg2.layer_id || ',' || tg2.id || ');'
  LOOP
    RETURN FALSE;
  END LOOP;

  FOR rec IN EXECUTE 'SELECT * FROM '
    || ' topology.GetTopoGeomElements('
    || quote_literal(toponame) || ', '
    || tg2.layer_id || ',' || tg2.id || ')'
    || ' EXCEPT SELECT * FROM '
    || ' topology.GetTopogeomElements('
    || quote_literal(toponame) || ', '
    || tg1.layer_id || ',' || tg1.id || '); '
  LOOP
    RETURN FALSE;
  END LOOP;
  RETURN TRUE;
END
$$;
 C   DROP FUNCTION topology.equals(tg1 topogeometry, tg2 topogeometry);
       topology       postgres    false    2039    9    2    2039                       1255    43548    geometry(topogeometry)    FUNCTION     g  CREATE FUNCTION geometry(topogeom topogeometry) RETURNS public.geometry
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  toponame varchar;
  geom geometry;
  rec RECORD;
  plyr RECORD;
  clyr RECORD;
  sql TEXT;
BEGIN

  -- Get topology name
  SELECT name FROM topology.topology
  WHERE id = topogeom.topology_id
  INTO toponame;
  IF toponame IS NULL THEN
    RAISE EXCEPTION 'Invalid TopoGeometry (unexistent topology id %)', topogeom.topology_id;
  END IF;

  -- Get layer info
  SELECT * FROM topology.layer
    WHERE topology_id = topogeom.topology_id
    AND layer_id = topogeom.layer_id
    INTO plyr;
  IF plyr IS NULL THEN
    RAISE EXCEPTION 'Could not find TopoGeometry layer % in topology %', topogeom.layer_id, topogeom.topology_id;
  END IF;

  --
  -- If this feature layer is on any level > 0 we will
  -- compute the topological union of all child features
  -- in fact recursing.
  --
  IF plyr.level > 0 THEN -- {

    -- Get child layer info
    SELECT * FROM topology.layer WHERE layer_id = plyr.child_id
      AND topology_id = topogeom.topology_id
      INTO clyr;
    IF clyr IS NULL THEN
      RAISE EXCEPTION 'Invalid layer % in topology % (unexistent child layer %)', topogeom.layer_id, topogeom.topology_id, plyr.child_id;
    END IF;

    sql := 'SELECT st_multi(st_union(topology.Geometry('
      || quote_ident(clyr.feature_column)
      || '))) as geom FROM '
      || quote_ident(clyr.schema_name) || '.'
      || quote_ident(clyr.table_name)
      || ', ' || quote_ident(toponame) || '.relation pr'
         ' WHERE '
         ' pr.topogeo_id = ' || topogeom.id
      || ' AND '
         ' pr.layer_id = ' || topogeom.layer_id
      || ' AND '
         ' id('||quote_ident(clyr.feature_column)
      || ') = pr.element_id '
         ' AND '
         'layer_id('||quote_ident(clyr.feature_column)
      || ') = pr.element_type ';
    --RAISE DEBUG '%', query;
    EXECUTE sql INTO geom;
      
  ELSIF topogeom.type = 3 THEN -- [multi]polygon -- }{

    sql := 'SELECT st_multi(st_union('
         'topology.ST_GetFaceGeometry('
      || quote_literal(toponame) || ','
      || 'element_id))) as g FROM ' 
      || quote_ident(toponame)
      || '.relation WHERE topogeo_id = '
      || topogeom.id || ' AND layer_id = '
      || topogeom.layer_id || ' AND element_type = 3 ';
    EXECUTE sql INTO geom;

  ELSIF topogeom.type = 2 THEN -- [multi]line -- }{

    sql := 
      'SELECT st_multi(ST_LineMerge(ST_Collect(e.geom))) as g FROM '
      || quote_ident(toponame) || '.edge e, '
      || quote_ident(toponame) || '.relation r '
         ' WHERE r.topogeo_id = ' || topogeom.id
      || ' AND r.layer_id = ' || topogeom.layer_id
      || ' AND r.element_type = 2 '
         ' AND abs(r.element_id) = e.edge_id';
    EXECUTE sql INTO geom;
  
  ELSIF topogeom.type = 1 THEN -- [multi]point -- }{

    sql :=
      'SELECT st_multi(st_union(n.geom)) as g FROM '
      || quote_ident(toponame) || '.node n, '
      || quote_ident(toponame) || '.relation r '
         ' WHERE r.topogeo_id = ' || topogeom.id
      || ' AND r.layer_id = ' || topogeom.layer_id
      || ' AND r.element_type = 1 '
         ' AND r.element_id = n.node_id';
    EXECUTE sql INTO geom;

  ELSIF topogeom.type = 4 THEN -- mixed collection -- }{

    sql := 'WITH areas AS ( SELECT ST_Union('
         'topology.ST_GetFaceGeometry('
      || quote_literal(toponame) || ','
      || 'element_id)) as g FROM ' 
      || quote_ident(toponame)
      || '.relation WHERE topogeo_id = '
      || topogeom.id || ' AND layer_id = '
      || topogeom.layer_id || ' AND element_type = 3), '
         'lines AS ( SELECT ST_LineMerge(ST_Collect(e.geom)) as g FROM '
      || quote_ident(toponame) || '.edge e, '
      || quote_ident(toponame) || '.relation r '
         ' WHERE r.topogeo_id = ' || topogeom.id
      || ' AND r.layer_id = ' || topogeom.layer_id
      || ' AND r.element_type = 2 '
         ' AND abs(r.element_id) = e.edge_id ), '
         ' points as ( SELECT st_union(n.geom) as g FROM '
      || quote_ident(toponame) || '.node n, '
      || quote_ident(toponame) || '.relation r '
         ' WHERE r.topogeo_id = ' || topogeom.id
      || ' AND r.layer_id = ' || topogeom.layer_id
      || ' AND r.element_type = 1 '
         ' AND r.element_id = n.node_id ), '
         ' un as ( SELECT g FROM areas UNION ALL SELECT g FROM lines '
         '          UNION ALL SELECT g FROM points ) '
         'SELECT ST_Multi(ST_Collect(g)) FROM un';
    EXECUTE sql INTO geom;

  ELSE -- }{

    RAISE EXCEPTION 'Invalid TopoGeometries (unknown type %)', topogeom.type;

  END IF; -- }

  IF geom IS NULL THEN
    IF topogeom.type = 3 THEN -- [multi]polygon
      geom := 'MULTIPOLYGON EMPTY';
    ELSIF topogeom.type = 2 THEN -- [multi]line
      geom := 'MULTILINESTRING EMPTY';
    ELSIF topogeom.type = 1 THEN -- [multi]point
      geom := 'MULTIPOINT EMPTY';
    ELSE
      geom := 'GEOMETRYCOLLECTION EMPTY';
    END IF;
  END IF;

  RETURN geom;
END
$$;
 8   DROP FUNCTION topology.geometry(topogeom topogeometry);
       topology       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    9    2    2039                       1255    43549    geometrytype(topogeometry)    FUNCTION     9  CREATE FUNCTION geometrytype(tg topogeometry) RETURNS text
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT CASE
		WHEN type($1) = 1 THEN 'MULTIPOINT'
		WHEN type($1) = 2 THEN 'MULTILINESTRING'
		WHEN type($1) = 3 THEN 'MULTIPOLYGON'
		WHEN type($1) = 4 THEN 'GEOMETRYCOLLECTION'
		ELSE 'UNEXPECTED'
		END;
$_$;
 6   DROP FUNCTION topology.geometrytype(tg topogeometry);
       topology       postgres    false    2039    9                        1255    43553 (   getnodeedges(character varying, integer)    FUNCTION     �  CREATE FUNCTION getnodeedges(atopology character varying, anode integer) RETURNS SETOF getfaceedges_returntype
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
  curedge int;
  nextedge int;
  rec RECORD;
  retrec topology.GetFaceEdges_ReturnType;
  n int;
  sql text;
BEGIN

  n := 0;
  sql :=
    'WITH incident_edges AS ( SELECT edge_id, start_node, end_node, ST_RemoveRepeatedPoints(geom) as geom FROM '
    || quote_ident(atopology)
    || '.edge_data WHERE start_node = ' || anode
    || ' or end_node = ' || anode
    || ') SELECT edge_id, ST_Azimuth(ST_StartPoint(geom), ST_PointN(geom, 2)) as az FROM  incident_edges WHERE start_node = ' || anode
    || ' UNION ALL SELECT -edge_id, ST_Azimuth(ST_EndPoint(geom), ST_PointN(geom, ST_NumPoints(geom)-1)) FROM incident_edges WHERE end_node = ' || anode
    || ' ORDER BY az';

  FOR rec IN EXECUTE sql
  LOOP -- incident edges {

    n := n + 1;
    retrec.sequence := n;
    retrec.edge := rec.edge_id;
    RETURN NEXT retrec;
  END LOOP; -- incident edges }

END
$$;
 Q   DROP FUNCTION topology.getnodeedges(atopology character varying, anode integer);
       topology       postgres    false    9    2    2030            !           1255    43554 1   getringedges(character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION getringedges(atopology character varying, anedge integer, maxedges integer DEFAULT NULL::integer) RETURNS SETOF getfaceedges_returntype
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
  rec RECORD;
  retrec topology.GetFaceEdges_ReturnType;
  n int;
  sql text;
BEGIN
  sql := 'WITH RECURSIVE edgering AS ( SELECT '
    || anedge
    || ' as signed_edge_id, edge_id, next_left_edge, next_right_edge FROM '
    || quote_ident(atopology)
    || '.edge_data WHERE edge_id = '
    || abs(anedge)
    || ' UNION '
    || ' SELECT CASE WHEN p.signed_edge_id < 0 THEN p.next_right_edge '
    || ' ELSE p.next_left_edge END, e.edge_id, e.next_left_edge, e.next_right_edge '
    || ' FROM ' || quote_ident(atopology)
    || '.edge_data e, edgering p WHERE e.edge_id = CASE WHEN p.signed_edge_id < 0 '
    || 'THEN abs(p.next_right_edge) ELSE abs(p.next_left_edge) END ) SELECT * FROM edgering';

  n := 1;
  FOR rec IN EXECUTE sql
  LOOP
    retrec.sequence := n;
    retrec.edge := rec.signed_edge_id;
    RETURN NEXT retrec;

    n := n + 1;

    IF n > maxedges THEN
      RAISE EXCEPTION 'Max traversing limit hit: %', maxedges;
    END IF;
  END LOOP;

END
$$;
 d   DROP FUNCTION topology.getringedges(atopology character varying, anedge integer, maxedges integer);
       topology       postgres    false    2030    9    2            "           1255    43555 %   gettopogeomelementarray(topogeometry)    FUNCTION     *  CREATE FUNCTION gettopogeomelementarray(tg topogeometry) RETURNS topoelementarray
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
  toponame varchar;
BEGIN
  toponame = topology.GetTopologyName(tg.topology_id);
  RETURN topology.GetTopoGeomElementArray(toponame, tg.layer_id, tg.id);
END;
$$;
 A   DROP FUNCTION topology.gettopogeomelementarray(tg topogeometry);
       topology       postgres    false    2037    9    2    2039            #           1255    43556 <   gettopogeomelementarray(character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION gettopogeomelementarray(toponame character varying, layer_id integer, tgid integer) RETURNS topoelementarray
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
  rec RECORD;
  tg_objs varchar := '{';
  i integer;
  query text;
BEGIN

  query = 'SELECT * FROM topology.GetTopoGeomElements('
    || quote_literal(toponame) || ','
    || quote_literal(layer_id) || ','
    || quote_literal(tgid)
    || ') as obj ORDER BY obj';


  -- TODO: why not using array_agg here ?

  i = 1;
  FOR rec IN EXECUTE query
  LOOP
    IF i > 1 THEN
      tg_objs = tg_objs || ',';
    END IF;
    tg_objs = tg_objs || '{'
      || rec.obj[1] || ',' || rec.obj[2]
      || '}';
    i = i+1;
  END LOOP;

  tg_objs = tg_objs || '}';

  RETURN tg_objs;
END;
$$;
 l   DROP FUNCTION topology.gettopogeomelementarray(toponame character varying, layer_id integer, tgid integer);
       topology       postgres    false    2    9    2037            $           1255    43557 !   gettopogeomelements(topogeometry)    FUNCTION     �  CREATE FUNCTION gettopogeomelements(tg topogeometry) RETURNS SETOF topoelement
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
  toponame varchar;
  rec RECORD;
BEGIN
  toponame = topology.GetTopologyName(tg.topology_id);
  FOR rec IN SELECT * FROM topology.GetTopoGeomElements(toponame,
    tg.layer_id,tg.id) as ret
  LOOP
    RETURN NEXT rec.ret;
  END LOOP;
  RETURN;
END;
$$;
 =   DROP FUNCTION topology.gettopogeomelements(tg topogeometry);
       topology       postgres    false    2033    9    2    2039            %           1255    43558 8   gettopogeomelements(character varying, integer, integer)    FUNCTION     d  CREATE FUNCTION gettopogeomelements(toponame character varying, layerid integer, tgid integer) RETURNS SETOF topoelement
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
DECLARE
  ret topology.TopoElement;
  rec RECORD;
  rec2 RECORD;
  query text;
  query2 text;
  lyr RECORD;
  ok bool;
  topoid INTEGER;
BEGIN

  -- Get topology id
  SELECT id INTO topoid
    FROM topology.topology WHERE name = toponame;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Topology % does not exist', quote_literal(toponame);
  END IF;

  -- Get layer info
  ok = false;
  FOR rec IN EXECUTE 'SELECT * FROM topology.layer '
       ' WHERE layer_id = $1 AND topology_id = $2'
       USING layerid, topoid
  LOOP
    lyr = rec;
    ok = true;
  END LOOP;

  IF NOT ok THEN
    RAISE EXCEPTION 'Layer % does not exist', layerid;
  END IF;


  query = 'SELECT abs(element_id) as element_id, element_type FROM '
    || quote_ident(toponame) || '.relation WHERE '
       ' layer_id = ' || layerid
    || ' AND topogeo_id = ' || quote_literal(tgid)
    || ' ORDER BY element_type, element_id';

  --RAISE NOTICE 'Query: %', query;

  FOR rec IN EXECUTE query
  LOOP
    IF lyr.level > 0 THEN
      query2 = 'SELECT * from topology.GetTopoGeomElements('
        || quote_literal(toponame) || ','
        || rec.element_type
        || ','
        || rec.element_id
        || ') as ret;';
      --RAISE NOTICE 'Query2: %', query2;
      FOR rec2 IN EXECUTE query2
      LOOP
        RETURN NEXT rec2.ret;
      END LOOP;
    ELSE
      ret = '{' || rec.element_id || ',' || rec.element_type || '}';
      RETURN NEXT ret;
    END IF;
  
  END LOOP;

  RETURN;
END;
$_$;
 g   DROP FUNCTION topology.gettopogeomelements(toponame character varying, layerid integer, tgid integer);
       topology       postgres    false    2    9    2033            &           1255    43559     gettopologyid(character varying)    FUNCTION     [  CREATE FUNCTION gettopologyid(toponame character varying) RETURNS integer
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
  ret integer;
BEGIN
  SELECT id INTO ret
    FROM topology.topology WHERE name = toponame;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Topology % does not exist', quote_literal(toponame);
  END IF;

  RETURN ret;
END
$$;
 B   DROP FUNCTION topology.gettopologyid(toponame character varying);
       topology       postgres    false    9    2            '           1255    43560    gettopologyname(integer)    FUNCTION       CREATE FUNCTION gettopologyname(topoid integer) RETURNS character varying
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
  ret varchar;
BEGIN
        SELECT name FROM topology.topology into ret
                WHERE id = topoid;
  RETURN ret;
END
$$;
 8   DROP FUNCTION topology.gettopologyname(topoid integer);
       topology       postgres    false    2    9            (           1255    43561 "   gettopologysrid(character varying)    FUNCTION     �   CREATE FUNCTION gettopologysrid(toponame character varying) RETURNS integer
    LANGUAGE sql STABLE STRICT
    AS $_$
  SELECT SRID FROM topology.topology WHERE name = $1;
$_$;
 D   DROP FUNCTION topology.gettopologysrid(toponame character varying);
       topology       postgres    false    9            )           1255    43562 &   intersects(topogeometry, topogeometry)    FUNCTION     2  CREATE FUNCTION intersects(tg1 topogeometry, tg2 topogeometry) RETURNS boolean
    LANGUAGE plpgsql STABLE STRICT
    AS $$
DECLARE
  tgbuf topology.TopoGeometry;
  rec RECORD;
  toponame varchar;
  query text;
BEGIN
  IF tg1.topology_id != tg2.topology_id THEN
    -- TODO: revert to ::geometry instead ?
    RAISE EXCEPTION 'Cannot compute intersection between TopoGeometries from different topologies';
  END IF;

  -- Order TopoGeometries so that tg1 has less-or-same
  -- dimensionality of tg1 (point,line,polygon,collection)
  IF tg1.type > tg2.type THEN
    tgbuf := tg2;
    tg2 := tg1;
    tg1 := tgbuf;
  END IF;

  --RAISE NOTICE 'tg1.id:% tg2.id:%', tg1.id, tg2.id;
  -- Geometry collection are not currently supported
  IF tg2.type = 4 THEN
    RAISE EXCEPTION 'GeometryCollection are not supported by intersects()';
  END IF;

        -- Get topology name
        SELECT name FROM topology.topology into toponame
                WHERE id = tg1.topology_id;

  -- Hierarchical TopoGeometries are not currently supported
  query = 'SELECT level FROM topology.layer'
    || ' WHERE '
    || ' topology_id = ' || tg1.topology_id
    || ' AND '
    || '( layer_id = ' || tg1.layer_id
    || ' OR layer_id = ' || tg2.layer_id
    || ' ) '
    || ' AND level > 0 ';

  --RAISE NOTICE '%', query;

  FOR rec IN EXECUTE query
  LOOP
    -- TODO: revert to ::geometry instead ?
    RAISE EXCEPTION 'Hierarchical TopoGeometries are not currently supported by intersects()';
  END LOOP;

  IF tg1.type = 1 THEN -- [multi]point


    IF tg2.type = 1 THEN -- point/point
  ---------------------------------------------------------
  -- 
  --  Two [multi]point features intersect if they share
  --  any Node 
  --
  --
  --
      query =
        'SELECT a.topogeo_id FROM '
        || quote_ident(toponame) ||
        '.relation a, '
        || quote_ident(toponame) ||
        '.relation b '
        || 'WHERE a.layer_id = ' || tg1.layer_id
        || ' AND b.layer_id = ' || tg2.layer_id
        || ' AND a.topogeo_id = ' || tg1.id
        || ' AND b.topogeo_id = ' || tg2.id
        || ' AND a.element_id = b.element_id '
        || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- they share an element
      END LOOP;
      RETURN FALSE; -- no elements shared
  --
  ---------------------------------------------------------
      

    ELSIF tg2.type = 2 THEN -- point/line
  ---------------------------------------------------------
  -- 
  --  A [multi]point intersects a [multi]line if they share
  --  any Node. 
  --
  --
  --
      query =
        'SELECT a.topogeo_id FROM '
        || quote_ident(toponame) ||
        '.relation a, '
        || quote_ident(toponame) ||
        '.relation b, '
        || quote_ident(toponame) ||
        '.edge_data e '
        || 'WHERE a.layer_id = ' || tg1.layer_id
        || ' AND b.layer_id = ' || tg2.layer_id
        || ' AND a.topogeo_id = ' || tg1.id
        || ' AND b.topogeo_id = ' || tg2.id
        || ' AND abs(b.element_id) = e.edge_id '
        || ' AND ( '
          || ' e.start_node = a.element_id '
          || ' OR '
          || ' e.end_node = a.element_id '
        || ' )'
        || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- they share an element
      END LOOP;
      RETURN FALSE; -- no elements shared
  --
  ---------------------------------------------------------

    ELSIF tg2.type = 3 THEN -- point/polygon
  ---------------------------------------------------------
  -- 
  --  A [multi]point intersects a [multi]polygon if any
  --  Node of the point is contained in any face of the
  --  polygon OR ( is end_node or start_node of any edge
  --  of any polygon face ).
  --
  --  We assume the Node-in-Face check is faster becasue
  --  there will be less Faces then Edges in any polygon.
  --
  --
  --
  --
      -- Check if any node is contained in a face
      query =
        'SELECT n.node_id as id FROM '
        || quote_ident(toponame) ||
        '.relation r1, '
        || quote_ident(toponame) ||
        '.relation r2, '
        || quote_ident(toponame) ||
        '.node n '
        || 'WHERE r1.layer_id = ' || tg1.layer_id
        || ' AND r2.layer_id = ' || tg2.layer_id
        || ' AND r1.topogeo_id = ' || tg1.id
        || ' AND r2.topogeo_id = ' || tg2.id
        || ' AND n.node_id = r1.element_id '
        || ' AND r2.element_id = n.containing_face '
        || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        --RAISE NOTICE 'Node % in polygon face', rec.id;
        RETURN TRUE; -- one (or more) nodes are
                     -- contained in a polygon face
      END LOOP;

      -- Check if any node is start or end of any polygon
      -- face edge
      query =
        'SELECT n.node_id as nid, e.edge_id as eid '
        || ' FROM '
        || quote_ident(toponame) ||
        '.relation r1, '
        || quote_ident(toponame) ||
        '.relation r2, '
        || quote_ident(toponame) ||
        '.edge_data e, '
        || quote_ident(toponame) ||
        '.node n '
        || 'WHERE r1.layer_id = ' || tg1.layer_id
        || ' AND r2.layer_id = ' || tg2.layer_id
        || ' AND r1.topogeo_id = ' || tg1.id
        || ' AND r2.topogeo_id = ' || tg2.id
        || ' AND n.node_id = r1.element_id '
        || ' AND ( '
        || ' e.left_face = r2.element_id '
        || ' OR '
        || ' e.right_face = r2.element_id '
        || ' ) '
        || ' AND ( '
        || ' e.start_node = r1.element_id '
        || ' OR '
        || ' e.end_node = r1.element_id '
        || ' ) '
        || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        --RAISE NOTICE 'Node % on edge % bound', rec.nid, rec.eid;
        RETURN TRUE; -- one node is start or end
                     -- of a face edge
      END LOOP;

      RETURN FALSE; -- no intersection
  --
  ---------------------------------------------------------

    ELSIF tg2.type = 4 THEN -- point/collection
      RAISE EXCEPTION 'Intersection point/collection not implemented yet';

    ELSE
      RAISE EXCEPTION 'Invalid TopoGeometry type %', tg2.type;
    END IF;

  ELSIF tg1.type = 2 THEN -- [multi]line
    IF tg2.type = 2 THEN -- line/line
  ---------------------------------------------------------
  -- 
  --  A [multi]line intersects a [multi]line if they share
  --  any Node. 
  --
  --
  --
      query =
        'SELECT e1.start_node FROM '
        || quote_ident(toponame) ||
        '.relation r1, '
        || quote_ident(toponame) ||
        '.relation r2, '
        || quote_ident(toponame) ||
        '.edge_data e1, '
        || quote_ident(toponame) ||
        '.edge_data e2 '
        || 'WHERE r1.layer_id = ' || tg1.layer_id
        || ' AND r2.layer_id = ' || tg2.layer_id
        || ' AND r1.topogeo_id = ' || tg1.id
        || ' AND r2.topogeo_id = ' || tg2.id
        || ' AND abs(r1.element_id) = e1.edge_id '
        || ' AND abs(r2.element_id) = e2.edge_id '
        || ' AND ( '
        || ' e1.start_node = e2.start_node '
        || ' OR '
        || ' e1.start_node = e2.end_node '
        || ' OR '
        || ' e1.end_node = e2.start_node '
        || ' OR '
        || ' e1.end_node = e2.end_node '
        || ' )'
        || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- they share an element
      END LOOP;
      RETURN FALSE; -- no elements shared
  --
  ---------------------------------------------------------

    ELSIF tg2.type = 3 THEN -- line/polygon
  ---------------------------------------------------------
  -- 
  -- A [multi]line intersects a [multi]polygon if they share
  -- any Node (touch-only case), or if any line edge has any
  -- polygon face on the left or right (full-containment case
  -- + edge crossing case).
  --
  --
      -- E1 are line edges, E2 are polygon edges
      -- R1 are line relations.
      -- R2 are polygon relations.
      -- R2.element_id are FACE ids
      query =
        'SELECT e1.edge_id'
        || ' FROM '
        || quote_ident(toponame) ||
        '.relation r1, '
        || quote_ident(toponame) ||
        '.relation r2, '
        || quote_ident(toponame) ||
        '.edge_data e1, '
        || quote_ident(toponame) ||
        '.edge_data e2 '
        || 'WHERE r1.layer_id = ' || tg1.layer_id
        || ' AND r2.layer_id = ' || tg2.layer_id
        || ' AND r1.topogeo_id = ' || tg1.id
        || ' AND r2.topogeo_id = ' || tg2.id

        -- E1 are line edges
        || ' AND e1.edge_id = abs(r1.element_id) '

        -- E2 are face edges
        || ' AND ( e2.left_face = r2.element_id '
        || '   OR e2.right_face = r2.element_id ) '

        || ' AND ( '

        -- Check if E1 have left-or-right face 
        -- being part of R2.element_id
        || ' e1.left_face = r2.element_id '
        || ' OR '
        || ' e1.right_face = r2.element_id '

        -- Check if E1 share start-or-end node
        -- with any E2.
        || ' OR '
        || ' e1.start_node = e2.start_node '
        || ' OR '
        || ' e1.start_node = e2.end_node '
        || ' OR '
        || ' e1.end_node = e2.start_node '
        || ' OR '
        || ' e1.end_node = e2.end_node '

        || ' ) '

        || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- either common node
                     -- or edge-in-face
      END LOOP;

      RETURN FALSE; -- no intersection
  --
  ---------------------------------------------------------

    ELSIF tg2.type = 4 THEN -- line/collection
      RAISE EXCEPTION 'Intersection line/collection not implemented yet';

    ELSE
      RAISE EXCEPTION 'Invalid TopoGeometry type %', tg2.type;
    END IF;


  ELSIF tg1.type = 3 THEN -- [multi]polygon

    IF tg2.type = 3 THEN -- polygon/polygon
  ---------------------------------------------------------
  -- 
  -- A [multi]polygon intersects a [multi]polygon if they share
  -- any Node (touch-only case), or if any face edge has any of the
  -- other polygon face on the left or right (full-containment case
  -- + edge crossing case).
  --
  --
      -- E1 are poly1 edges.
      -- E2 are poly2 edges
      -- R1 are poly1 relations.
      -- R2 are poly2 relations.
      -- R1.element_id are poly1 FACE ids
      -- R2.element_id are poly2 FACE ids
      query =
        'SELECT e1.edge_id'
        || ' FROM '
        || quote_ident(toponame) ||
        '.relation r1, '
        || quote_ident(toponame) ||
        '.relation r2, '
        || quote_ident(toponame) ||
        '.edge_data e1, '
        || quote_ident(toponame) ||
        '.edge_data e2 '
        || 'WHERE r1.layer_id = ' || tg1.layer_id
        || ' AND r2.layer_id = ' || tg2.layer_id
        || ' AND r1.topogeo_id = ' || tg1.id
        || ' AND r2.topogeo_id = ' || tg2.id

        -- E1 are poly1 edges
        || ' AND ( e1.left_face = r1.element_id '
        || '   OR e1.right_face = r1.element_id ) '

        -- E2 are poly2 edges
        || ' AND ( e2.left_face = r2.element_id '
        || '   OR e2.right_face = r2.element_id ) '

        || ' AND ( '

        -- Check if any edge from a polygon face
        -- has any of the other polygon face
        -- on the left or right 
        || ' e1.left_face = r2.element_id '
        || ' OR '
        || ' e1.right_face = r2.element_id '
        || ' OR '
        || ' e2.left_face = r1.element_id '
        || ' OR '
        || ' e2.right_face = r1.element_id '

        -- Check if E1 share start-or-end node
        -- with any E2.
        || ' OR '
        || ' e1.start_node = e2.start_node '
        || ' OR '
        || ' e1.start_node = e2.end_node '
        || ' OR '
        || ' e1.end_node = e2.start_node '
        || ' OR '
        || ' e1.end_node = e2.end_node '

        || ' ) '

        || ' LIMIT 1';
      --RAISE NOTICE '%', query;
      FOR rec IN EXECUTE query
      LOOP
        RETURN TRUE; -- either common node
                     -- or edge-in-face
      END LOOP;

      RETURN FALSE; -- no intersection
  --
  ---------------------------------------------------------

    ELSIF tg2.type = 4 THEN -- polygon/collection
      RAISE EXCEPTION 'Intersection poly/collection not implemented yet';

    ELSE
      RAISE EXCEPTION 'Invalid TopoGeometry type %', tg2.type;
    END IF;

  ELSIF tg1.type = 4 THEN -- collection
    IF tg2.type = 4 THEN -- collection/collection
      RAISE EXCEPTION 'Intersection collection/collection not implemented yet';
    ELSE
      RAISE EXCEPTION 'Invalid TopoGeometry type %', tg2.type;
    END IF;

  ELSE
    RAISE EXCEPTION 'Invalid TopoGeometry type %', tg1.type;
  END IF;
END
$$;
 G   DROP FUNCTION topology.intersects(tg1 topogeometry, tg2 topogeometry);
       topology       postgres    false    2039    9    2    2039            *           1255    43564    layertrigger()    FUNCTION     v  CREATE FUNCTION layertrigger() RETURNS trigger
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  rec RECORD;
  ok BOOL;
  toponame varchar;
  query TEXT;
BEGIN

  --RAISE NOTICE 'LayerTrigger called % % at % level', TG_WHEN, TG_OP, TG_LEVEL;


  IF TG_OP = 'INSERT' THEN
    RAISE EXCEPTION 'LayerTrigger not meant to be called on INSERT';
  ELSIF TG_OP = 'UPDATE' THEN
    RAISE EXCEPTION 'The topology.layer table cannot be updated';
  END IF;


  -- Check for existance of any feature column referencing
  -- this layer
  FOR rec IN SELECT * FROM pg_namespace n, pg_class c, pg_attribute a
    WHERE text(n.nspname) = OLD.schema_name
    AND c.relnamespace = n.oid
    AND text(c.relname) = OLD.table_name
    AND a.attrelid = c.oid
    AND text(a.attname) = OLD.feature_column
  LOOP
    query = 'SELECT * '
         ' FROM ' || quote_ident(OLD.schema_name)
      || '.' || quote_ident(OLD.table_name)
      || ' WHERE layer_id('
      || quote_ident(OLD.feature_column)||') '
         '=' || OLD.layer_id
      || ' LIMIT 1';
    --RAISE NOTICE '%', query;
    FOR rec IN EXECUTE query
    LOOP
      RAISE NOTICE 'A feature referencing layer % of topology % still exists in %.%.%', OLD.layer_id, OLD.topology_id, OLD.schema_name, OLD.table_name, OLD.feature_column;
      RETURN NULL;
    END LOOP;
  END LOOP;


  -- Get topology name
  SELECT name FROM topology.topology INTO toponame
    WHERE id = OLD.topology_id;

  IF toponame IS NULL THEN
    RAISE NOTICE 'Could not find name of topology with id %',
      OLD.layer_id;
  END IF;

  -- Check if any record in the relation table references this layer
  FOR rec IN SELECT c.oid FROM pg_namespace n, pg_class c
    WHERE text(n.nspname) = toponame AND c.relnamespace = n.oid
          AND c.relname = 'relation'
  LOOP
    query = 'SELECT * '
         ' FROM ' || quote_ident(toponame)
      || '.relation '
         ' WHERE layer_id = '|| OLD.layer_id
      || ' LIMIT 1';
    --RAISE NOTICE '%', query;
    FOR rec IN EXECUTE query
    LOOP
      RAISE NOTICE 'A record in %.relation still references layer %', toponame, OLD.layer_id;
      RETURN NULL;
    END LOOP;
  END LOOP;

  RETURN OLD;
END;
$$;
 '   DROP FUNCTION topology.layertrigger();
       topology       postgres    false    9    2            +           1255    43565    polygonize(character varying)    FUNCTION     =  CREATE FUNCTION polygonize(toponame character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  sql text;
  rec RECORD;
  faces int;
BEGIN

  sql := 'SELECT (st_dump(st_polygonize(geom))).geom from '
         || quote_ident(toponame) || '.edge_data';

  faces = 0;
  FOR rec in EXECUTE sql LOOP
    BEGIN
      PERFORM topology.AddFace(toponame, rec.geom);
      faces = faces + 1;
    EXCEPTION
      WHEN OTHERS THEN
        RAISE WARNING 'Error registering face % (%)', rec.geom, SQLERRM;
    END;
  END LOOP;
  RETURN faces || ' faces registered';
END
$$;
 ?   DROP FUNCTION topology.polygonize(toponame character varying);
       topology       postgres    false    2    9            ,           1255    43566 $   postgis_topology_scripts_installed()    FUNCTION     �   CREATE FUNCTION postgis_topology_scripts_installed() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$ SELECT '2.2.2'::text || ' r' || 14797::text AS version $$;
 =   DROP FUNCTION topology.postgis_topology_scripts_installed();
       topology       postgres    false    9            -           1255    43567    relationtrigger()    FUNCTION     �  CREATE FUNCTION relationtrigger() RETURNS trigger
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  toponame varchar;
  topoid integer;
  plyr RECORD; -- parent layer
  rec RECORD;
  ok BOOL;

BEGIN
  IF TG_NARGS != 2 THEN
    RAISE EXCEPTION 'RelationTrigger called with wrong number of arguments';
  END IF;

  topoid = TG_ARGV[0];
  toponame = TG_ARGV[1];

  --RAISE NOTICE 'RelationTrigger called % % on %.relation for a %', TG_WHEN, TG_OP, toponame, TG_LEVEL;


  IF TG_OP = 'DELETE' THEN
    RAISE EXCEPTION 'RelationTrigger not meant to be called on DELETE';
  END IF;

  -- Get layer info (and verify it exists)
  ok = false;
  FOR plyr IN EXECUTE 'SELECT * FROM topology.layer '
       'WHERE '
       ' topology_id = ' || topoid
    || ' AND'
       ' layer_id = ' || NEW.layer_id
  LOOP
    ok = true;
    EXIT;
  END LOOP;
  IF NOT ok THEN
    RAISE EXCEPTION 'Layer % does not exist in topology %',
      NEW.layer_id, topoid;
    RETURN NULL;
  END IF;

  IF plyr.level > 0 THEN -- this is hierarchical layer

    -- ElementType must be the layer child id
    IF NEW.element_type != plyr.child_id THEN
      RAISE EXCEPTION 'Type of elements in layer % must be set to its child layer id %', plyr.layer_id, plyr.child_id;
      RETURN NULL;
    END IF;

    -- ElementId must be an existent TopoGeometry in child layer
    ok = false;
    FOR rec IN EXECUTE 'SELECT topogeo_id FROM '
      || quote_ident(toponame) || '.relation '
         ' WHERE layer_id = ' || plyr.child_id
      || ' AND topogeo_id = ' || NEW.element_id
    LOOP
      ok = true;
      EXIT;
    END LOOP;
    IF NOT ok THEN
      RAISE EXCEPTION 'TopoGeometry % does not exist in the child layer %', NEW.element_id, plyr.child_id;
      RETURN NULL;
    END IF;

  ELSE -- this is a basic layer

    -- ElementType must be compatible with layer type
    IF plyr.feature_type != 4
      AND plyr.feature_type != NEW.element_type
    THEN
      RAISE EXCEPTION 'Element of type % is not compatible with layer of type %', NEW.element_type, plyr.feature_type;
      RETURN NULL;
    END IF;

    --
    -- Now lets see if the element is consistent, which
    -- is it exists in the topology tables.
    --

    --
    -- Element is a Node
    --
    IF NEW.element_type = 1 
    THEN
      ok = false;
      FOR rec IN EXECUTE 'SELECT node_id FROM '
        || quote_ident(toponame) || '.node '
           ' WHERE node_id = ' || NEW.element_id
      LOOP
        ok = true;
        EXIT;
      END LOOP;
      IF NOT ok THEN
        RAISE EXCEPTION 'Node % does not exist in topology %', NEW.element_id, toponame;
        RETURN NULL;
      END IF;

    --
    -- Element is an Edge
    --
    ELSIF NEW.element_type = 2 
    THEN
      ok = false;
      FOR rec IN EXECUTE 'SELECT edge_id FROM '
        || quote_ident(toponame) || '.edge_data '
           ' WHERE edge_id = ' || abs(NEW.element_id)
      LOOP
        ok = true;
        EXIT;
      END LOOP;
      IF NOT ok THEN
        RAISE EXCEPTION 'Edge % does not exist in topology %', NEW.element_id, toponame;
        RETURN NULL;
      END IF;

    --
    -- Element is a Face
    --
    ELSIF NEW.element_type = 3 
    THEN
      IF NEW.element_id = 0 THEN
        RAISE EXCEPTION 'Face % cannot be associated with any feature', NEW.element_id;
        RETURN NULL;
      END IF;
      ok = false;
      FOR rec IN EXECUTE 'SELECT face_id FROM '
        || quote_ident(toponame) || '.face '
           ' WHERE face_id = ' || NEW.element_id
      LOOP
        ok = true;
        EXIT;
      END LOOP;
      IF NOT ok THEN
        RAISE EXCEPTION 'Face % does not exist in topology %', NEW.element_id, toponame;
        RETURN NULL;
      END IF;
    END IF;

  END IF;
  
  RETURN NEW;
END;
$$;
 *   DROP FUNCTION topology.relationtrigger();
       topology       postgres    false    9    2            .           1255    43573 4   st_createtopogeo(character varying, public.geometry)    FUNCTION     }  CREATE FUNCTION st_createtopogeo(atopology character varying, acollection public.geometry) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  typ char(4);
  rec RECORD;
  ret int;
  nodededges GEOMETRY;
  points GEOMETRY;
  snode_id int;
  enode_id int;
  tolerance FLOAT8;
  topoinfo RECORD;
BEGIN

  IF atopology IS NULL OR acollection IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  -- Get topology information
  BEGIN
    SELECT * FROM topology.topology
      INTO STRICT topoinfo WHERE name = atopology;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
  END;

  -- Check SRID compatibility
  IF ST_SRID(acollection) != topoinfo.SRID THEN
    RAISE EXCEPTION 'Geometry SRID (%) does not match topology SRID (%)',
      ST_SRID(acollection), topoinfo.SRID;
  END IF;

  -- Verify pre-conditions (valid, empty topology schema exists)
  BEGIN -- {

    -- Verify the topology views in the topology schema to be empty
    FOR rec in EXECUTE
      'SELECT count(*) FROM '
      || quote_ident(atopology) || '.edge_data '
      || ' UNION ' ||
      'SELECT count(*) FROM '
      || quote_ident(atopology) || '.node '
    LOOP
      IF rec.count > 0 THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - non-empty view';
      END IF;
    END LOOP;

    -- face check is separated as it will contain a single (world)
    -- face record
    FOR rec in EXECUTE
      'SELECT count(*) FROM '
      || quote_ident(atopology) || '.face '
    LOOP
      IF rec.count != 1 THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - non-empty face view';
      END IF;
    END LOOP;

  EXCEPTION
    WHEN INVALID_SCHEMA_NAME THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - invalid topology name';
    WHEN UNDEFINED_TABLE THEN
      RAISE EXCEPTION 'SQL/MM Spatial exception - non-existent view';

  END; -- }


  --
  -- Node input linework with itself
  --
  WITH components AS ( SELECT geom FROM ST_Dump(acollection) )
  SELECT ST_UnaryUnion(ST_Collect(geom)) FROM (
    SELECT geom FROM components
      WHERE ST_Dimension(geom) = 1
    UNION ALL
    SELECT ST_Boundary(geom) FROM components
      WHERE ST_Dimension(geom) = 2
  ) as linework INTO STRICT nodededges;


  --
  -- Linemerge the resulting edges, to reduce the working set
  -- NOTE: this is more of a workaround for GEOS splitting overlapping
  --       lines to each of the segments.
  --
  SELECT ST_LineMerge(nodededges) INTO STRICT nodededges;



  --
  -- Collect input points and input lines endpoints
  --
  WITH components AS ( SELECT geom FROM ST_Dump(acollection) )
  SELECT ST_Union(geom) FROM (
    SELECT geom FROM components
      WHERE ST_Dimension(geom) = 0
    UNION ALL
    SELECT ST_Boundary(geom) FROM components
      WHERE ST_Dimension(geom) = 1
  ) as nodes INTO STRICT points;


  --
  -- Further split edges by points
  -- TODO: optimize this adding ST_Split support for multiline/multipoint
  --
  FOR rec IN SELECT geom FROM ST_Dump(points)
  LOOP
    -- Use the node to split edges
    SELECT ST_Collect(geom) 
    FROM ST_Dump(ST_Split(nodededges, rec.geom))
    INTO STRICT nodededges;
  END LOOP;
  SELECT ST_UnaryUnion(nodededges) INTO STRICT nodededges;


  --
  -- Collect all nodes (from points and noded linework endpoints)
  --

  WITH edges AS ( SELECT geom FROM ST_Dump(nodededges) )
  SELECT ST_Union( -- TODO: ST_UnaryUnion ?
          COALESCE(ST_UnaryUnion(ST_Collect(geom)), 
            ST_SetSRID('POINT EMPTY'::geometry, topoinfo.SRID)),
          COALESCE(points,
            ST_SetSRID('POINT EMPTY'::geometry, topoinfo.SRID))
         )
  FROM (
    SELECT ST_StartPoint(geom) as geom FROM edges
      UNION ALL
    SELECT ST_EndPoint(geom) FROM edges
  ) as endpoints INTO points;


  --
  -- Add all nodes as isolated so that 
  -- later calls to AddEdgeModFace will tweak their being
  -- isolated or not...
  --
  FOR rec IN SELECT geom FROM ST_Dump(points)
  LOOP
    PERFORM topology.ST_AddIsoNode(atopology, 0, rec.geom);
  END LOOP;
  

  FOR rec IN SELECT geom FROM ST_Dump(nodededges)
  LOOP
    SELECT topology.GetNodeByPoint(atopology, st_startpoint(rec.geom), 0)
      INTO STRICT snode_id;
    SELECT topology.GetNodeByPoint(atopology, st_endpoint(rec.geom), 0)
      INTO STRICT enode_id;
    PERFORM topology.ST_AddEdgeModFace(atopology, snode_id, enode_id, rec.geom);
  END LOOP;

  RETURN 'Topology ' || atopology || ' populated';

END
$$;
 c   DROP FUNCTION topology.st_createtopogeo(atopology character varying, acollection public.geometry);
       topology       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    9    2            /           1255    43574    st_geometrytype(topogeometry)    FUNCTION     K  CREATE FUNCTION st_geometrytype(tg topogeometry) RETURNS text
    LANGUAGE sql STABLE STRICT
    AS $_$
	SELECT CASE
		WHEN type($1) = 1 THEN 'ST_MultiPoint'
		WHEN type($1) = 2 THEN 'ST_MultiLinestring'
		WHEN type($1) = 3 THEN 'ST_MultiPolygon'
		WHEN type($1) = 4 THEN 'ST_GeometryCollection'
		ELSE 'ST_Unexpected'
		END;
$_$;
 9   DROP FUNCTION topology.st_geometrytype(tg topogeometry);
       topology       postgres    false    9    2039            0           1255    43577 !   st_inittopogeo(character varying)    FUNCTION     �  CREATE FUNCTION st_inittopogeo(atopology character varying) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
  rec RECORD;
  topology_id numeric;
BEGIN
  IF atopology IS NULL THEN
    RAISE EXCEPTION 'SQL/MM Spatial exception - null argument';
  END IF;

  FOR rec IN SELECT * FROM pg_namespace WHERE text(nspname) = atopology
  LOOP
    RAISE EXCEPTION 'SQL/MM Spatial exception - schema already exists';
  END LOOP;

  FOR rec IN EXECUTE 'SELECT topology.CreateTopology('
    ||quote_literal(atopology)|| ') as id'
  LOOP
    topology_id := rec.id;
  END LOOP;

  RETURN 'Topology-Geometry ' || quote_literal(atopology)
    || ' (id:' || topology_id || ') created.';
END
$$;
 D   DROP FUNCTION topology.st_inittopogeo(atopology character varying);
       topology       postgres    false    2    9            1           1255    43588 +   st_simplify(topogeometry, double precision)    FUNCTION     @  CREATE FUNCTION st_simplify(tg topogeometry, tolerance double precision) RETURNS public.geometry
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  topology_info RECORD;
  layer_info RECORD;
  child_layer_info RECORD;
  geom geometry;
  sql TEXT;
BEGIN

  -- Get topology information
  SELECT id, name FROM topology.topology
    INTO topology_info
    WHERE id = tg.topology_id;
  IF NOT FOUND THEN
      RAISE EXCEPTION 'No topology with id "%" in topology.topology', tg.topology_id;
  END IF;

  -- Get layer info
  SELECT * FROM topology.layer
    WHERE topology_id = tg.topology_id
    AND layer_id = tg.layer_id
    INTO layer_info;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Could not find TopoGeometry layer % in topology %', tg.layer_id, tg.topology_id;
  END IF;

  --
  -- If this feature layer is on any level > 0 we will
  -- compute the topological union of all simplified child
  -- features in fact recursing.
  --
  IF layer_info.level > 0 THEN -- {

    -- Get child layer info
    SELECT * FROM topology.layer WHERE layer_id = layer_info.child_id
      AND topology_id = tg.topology_id
      INTO child_layer_info;
    IF NOT FOUND THEN
      RAISE EXCEPTION 'Invalid layer % in topology % (unexistent child layer %)', tg.layer_id, tg.topology_id, layer_info.child_id;
    END IF;

    sql := 'SELECT st_multi(st_union(topology.ST_Simplify('
      || quote_ident(child_layer_info.feature_column)
      || ',' || tolerance || '))) as geom FROM '
      || quote_ident(child_layer_info.schema_name) || '.'
      || quote_ident(child_layer_info.table_name)
      || ', ' || quote_ident(topology_info.name) || '.relation pr'
      || ' WHERE '
      || ' pr.topogeo_id = ' || tg.id
      || ' AND '
      || ' pr.layer_id = ' || tg.layer_id
      || ' AND '
      || ' id('||quote_ident(child_layer_info.feature_column)
      || ') = pr.element_id '
      || ' AND '
      || 'layer_id('||quote_ident(child_layer_info.feature_column)
      || ') = pr.element_type ';
    RAISE DEBUG '%', sql;
    EXECUTE sql INTO geom;

  ELSIF tg.type = 3 THEN -- [multi]polygon -- }{

    -- TODO: use ST_GetFaceEdges
    -- TODO: is st_unaryunion needed?
    sql := 'SELECT st_multi(st_unaryunion(ST_BuildArea(ST_Node(ST_Collect(ST_Simplify(geom, '
      || tolerance || ')))))) as geom FROM '
      || quote_ident(topology_info.name)
      || '.edge_data e, '
      || quote_ident(topology_info.name)
      || '.relation r WHERE ( e.left_face = r.element_id'
      || ' OR e.right_face = r.element_id )'
      || ' AND r.topogeo_id = ' || tg.id
      || ' AND r.layer_id = ' || tg.layer_id
      || ' AND element_type = 3 ';
    RAISE DEBUG '%', sql;
    EXECUTE sql INTO geom;


  ELSIF tg.type = 2 THEN -- [multi]line -- }{

    sql := 
      'SELECT st_multi(ST_LineMerge(ST_Node(ST_Collect(ST_Simplify(e.geom,'
      || tolerance || '))))) as g FROM '
      || quote_ident(topology_info.name) || '.edge e, '
      || quote_ident(topology_info.name) || '.relation r '
      || ' WHERE r.topogeo_id = ' || tg.id
      || ' AND r.layer_id = ' || tg.layer_id
      || ' AND r.element_type = 2 '
      || ' AND abs(r.element_id) = e.edge_id';
    EXECUTE sql INTO geom;
  
  ELSIF tg.type = 1 THEN -- [multi]point -- }{

    -- Can't simplify points... 
    geom := topology.Geometry(tg);

  ELSIF tg.type = 4 THEN -- mixed collection -- }{

   sql := 'WITH areas AS ( '
      || 'SELECT st_multi(st_union(ST_BuildArea(ST_Node(ST_Collect(ST_Simplify(geom, '
      || tolerance || ')))) as geom FROM '
      || quote_ident(topology_info.name)
      || '.edge_data e, '
      || quote_ident(topology_info.name)
      || '.relation r WHERE ( e.left_face = r.element_id'
      || ' OR e.right_face = r.element_id )'
      || ' AND r.topogeo_id = ' || tg.id
      || ' AND r.layer_id = ' || tg.layer_id
      || ' AND element_type = 3 ), '
      || 'lines AS ( '
      || 'SELECT st_multi(ST_LineMerge(ST_Collect(ST_Simplify(e.geom,'
      || tolerance || ')))) as g FROM '
      || quote_ident(topology_info.name) || '.edge e, '
      || quote_ident(topology_info.name) || '.relation r '
      || ' WHERE r.topogeo_id = ' || tg.id
      || ' AND r.layer_id = ' || tg.layer_id
      || ' AND r.element_type = 2 '
      || ' AND abs(r.element_id) = e.edge_id ), '
      || ' points as ( SELECT st_union(n.geom) as g FROM '
      || quote_ident(topology_info.name) || '.node n, '
      || quote_ident(topology_info.name) || '.relation r '
      || ' WHERE r.topogeo_id = ' || tg.id
      || ' AND r.layer_id = ' || tg.layer_id
      || ' AND r.element_type = 1 '
      || ' AND r.element_id = n.node_id ), '
      || ' un as ( SELECT g FROM areas UNION ALL SELECT g FROM lines '
      || '          UNION ALL SELECT g FROM points ) '
      || 'SELECT ST_Multi(ST_Collect(g)) FROM un';
    EXECUTE sql INTO geom;

  ELSE -- }{

    RAISE EXCEPTION 'Invalid TopoGeometries (unknown type %)', tg.type;

  END IF; -- }

  RETURN geom;

END
$$;
 Q   DROP FUNCTION topology.st_simplify(tg topogeometry, tolerance double precision);
       topology       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    9    2    2039            2           1255    43589 6   topoelementarray_append(topoelementarray, topoelement)    FUNCTION     '  CREATE FUNCTION topoelementarray_append(topoelementarray, topoelement) RETURNS topoelementarray
    LANGUAGE sql IMMUTABLE
    AS $_$
	SELECT CASE
		WHEN $1 IS NULL THEN
			topology.TopoElementArray('{' || $2::text || '}')
		ELSE
			topology.TopoElementArray($1::int[][]||$2::int[])
		END;
$_$;
 O   DROP FUNCTION topology.topoelementarray_append(topoelementarray, topoelement);
       topology       postgres    false    2037    9    2037    2033            3           1255    43590 I   topogeo_addgeometry(character varying, public.geometry, double precision)    FUNCTION     �   CREATE FUNCTION topogeo_addgeometry(atopology character varying, ageom public.geometry, tolerance double precision DEFAULT 0) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
	RAISE EXCEPTION 'TopoGeo_AddGeometry not implemented yet';
END
$$;
 |   DROP FUNCTION topology.topogeo_addgeometry(atopology character varying, ageom public.geometry, tolerance double precision);
       topology       postgres    false    2    9    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            4           1255    43594 "   topologysummary(character varying)    FUNCTION     �  CREATE FUNCTION topologysummary(atopology character varying) RETURNS text
    LANGUAGE plpgsql STABLE STRICT
    AS $_$
DECLARE
  rec RECORD;
  rec2 RECORD;
  var_topology_id integer;
  n int4;
  missing int4;
  sql text;
  ret text;
  tgcount int4;
BEGIN

  ret := 'Topology ' || quote_ident(atopology) ;

  BEGIN
    SELECT * FROM topology.topology WHERE name = atopology INTO STRICT rec;
    -- TODO: catch <no_rows> to give a nice error message
    var_topology_id := rec.id;

    ret := ret || ' (id ' || rec.id || ', '
               || 'SRID ' || rec.srid || ', '
               || 'precision ' || rec.precision;
    IF rec.hasz THEN ret := ret || ', has Z'; END IF;
    ret := ret || E')\n';
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      ret := ret || E' (unregistered)\n';
  END;

  BEGIN
    EXECUTE 'SELECT count(*) FROM ' || quote_ident(atopology)
      || '.node ' INTO STRICT n;
    ret = ret || n || ' nodes, ';
  EXCEPTION
    WHEN UNDEFINED_TABLE OR INVALID_SCHEMA_NAME THEN
      IF NOT EXISTS (
          SELECT * FROM pg_catalog.pg_namespace WHERE nspname = atopology
         )
      THEN
        ret = ret || 'missing schema';
        RETURN ret; 
      ELSE
        ret = ret || 'missing nodes, ';
      END IF;
  END;

  BEGIN
    EXECUTE 'SELECT count(*) FROM ' || quote_ident(atopology)
      || '.edge' INTO STRICT n;
    ret = ret || n || ' edges, ';
  EXCEPTION
    WHEN UNDEFINED_TABLE OR INVALID_SCHEMA_NAME THEN
      ret = ret || 'missing edges, ';
  END;

  BEGIN
    EXECUTE 'SELECT count(*) FROM ' || quote_ident(atopology)
      || '.face' INTO STRICT n;
    ret = ret || greatest(n-1,0) || ' faces, '; -- -1 is face=0
  EXCEPTION
    WHEN UNDEFINED_TABLE OR INVALID_SCHEMA_NAME THEN
      ret = ret || 'missing faces, ';
  END;

  BEGIN
    EXECUTE 'SELECT count(distinct layer_id) AS ln, '
      || 'count(distinct (layer_id,topogeo_id)) AS tn FROM '
      || quote_ident(atopology) || '.relation' INTO STRICT rec;
    tgcount := rec.tn;
    ret = ret || rec.tn || ' topogeoms in ' || rec.ln || E' layers\n';
  EXCEPTION
    WHEN UNDEFINED_TABLE THEN
      ret = ret || E'missing relations\n';
    WHEN UNDEFINED_COLUMN THEN
      ret = ret || E'corrupted relations\n';
  END;

  -- print information about registered layers
  FOR rec IN SELECT * FROM topology.layer l
    WHERE l.topology_id = var_topology_id
    ORDER by layer_id
  LOOP -- {
    ret = ret || 'Layer ' || rec.layer_id || ', type ';
    CASE
      WHEN rec.feature_type = 1 THEN
        ret = ret || 'Puntal';
      WHEN rec.feature_type = 2 THEN
        ret = ret || 'Lineal';
      WHEN rec.feature_type = 3 THEN
        ret = ret || 'Polygonal';
      WHEN rec.feature_type = 4 THEN
        ret = ret || 'Mixed';
      ELSE 
        ret = ret || '???';
    END CASE;

    ret = ret || ' (' || rec.feature_type || '), ';

    BEGIN

      EXECUTE 'SELECT count(*) FROM ( SELECT DISTINCT topogeo_id FROM '
        || quote_ident(atopology)
        || '.relation r WHERE r.layer_id = ' || rec.layer_id
        || ' ) foo ' INTO STRICT n;

      ret = ret || n || ' topogeoms' || E'\n';

    EXCEPTION WHEN UNDEFINED_TABLE OR UNDEFINED_COLUMN THEN
      n := NULL;
      ret = ret || 'X topogeoms' || E'\n';
    END;

      IF rec.level > 0 THEN
        ret = ret || ' Hierarchy level ' || rec.level 
                  || ', child layer ' || rec.child_id || E'\n';
      END IF;

      ret = ret || ' Deploy: ';
      IF rec.feature_column != '' THEN
        ret = ret || quote_ident(rec.schema_name) || '.'
                  || quote_ident(rec.table_name) || '.'
                  || quote_ident(rec.feature_column);

        IF n > 0 THEN
          sql := 'SELECT count(*) FROM ( SELECT topogeo_id FROM '
            || quote_ident(atopology)
            || '.relation r WHERE r.layer_id = ' || rec.layer_id
            || ' EXCEPT SELECT DISTINCT id('
            || quote_ident(rec.feature_column) || ') FROM '
            || quote_ident(rec.schema_name) || '.'
            || quote_ident(rec.table_name) || ') as foo';
          BEGIN
            EXECUTE sql INTO STRICT missing;
            IF missing > 0 THEN
              ret = ret || ' (' || missing || ' missing topogeoms)';
            END IF;
          EXCEPTION
            WHEN UNDEFINED_TABLE THEN
              ret = ret || ' ( unexistent table )';
            WHEN UNDEFINED_COLUMN THEN
              ret = ret || ' ( unexistent column )';
          END;
        END IF;
        ret = ret || E'\n';

      ELSE
        ret = ret || E'NONE (detached)\n';
      END IF;

  END LOOP; -- }

  -- print information about unregistered layers containing topogeoms
  IF tgcount > 0 THEN -- {

    sql := 'SELECT layer_id FROM '
        || quote_ident(atopology) || '.relation EXCEPT SELECT layer_id'
        || ' FROM topology.layer WHERE topology_id = $1 ORDER BY layer_id';
    --RAISE DEBUG '%', sql;
    FOR rec IN  EXECUTE sql USING var_topology_id
    LOOP -- {
      ret = ret || 'Layer ' || rec.layer_id::text || ', UNREGISTERED, ';

      EXECUTE 'SELECT count(*) FROM ( SELECT DISTINCT topogeo_id FROM '
        || quote_ident(atopology)
        || '.relation r WHERE r.layer_id = ' || rec.layer_id
        || ' ) foo ' INTO STRICT n;

      ret = ret || n || ' topogeoms' || E'\n';

    END LOOP; -- }

  END IF; -- }

  RETURN ret;
END
$_$;
 E   DROP FUNCTION topology.topologysummary(atopology character varying);
       topology       postgres    false    9    2            5           1255    43595 ;   totopogeom(public.geometry, topogeometry, double precision)    FUNCTION     p  CREATE FUNCTION totopogeom(ageom public.geometry, tg topogeometry, atolerance double precision DEFAULT 0) RETURNS topogeometry
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  layer_info RECORD;
  topology_info RECORD;
  rec RECORD;
  rec2 RECORD;
  elem TEXT;
  elems TEXT[];
  sql TEXT;
  typ TEXT;
  tolerance FLOAT8;
  alayer INT;
  atopology TEXT;
BEGIN


  -- Get topology information
  SELECT id, name FROM topology.topology
    INTO topology_info
    WHERE id = topology_id(tg);
  IF NOT FOUND THEN
    RAISE EXCEPTION 'No topology with id "%" in topology.topology',
                    topology_id(tg);
  END IF;

  alayer := layer_id(tg);
  atopology := topology_info.name;


  -- Get tolerance, if 0 was given
  tolerance := COALESCE( NULLIF(atolerance, 0), topology._st_mintolerance(topology_info.name, ageom) );

  -- Get layer information
  BEGIN
    SELECT *, CASE
      WHEN feature_type = 1 THEN 'puntal'
      WHEN feature_type = 2 THEN 'lineal'
      WHEN feature_type = 3 THEN 'areal'
      WHEN feature_type = 4 THEN 'mixed'
      ELSE 'unexpected_'||feature_type
      END as typename
    FROM topology.layer l
      INTO STRICT layer_info
      WHERE l.layer_id = layer_id(tg)
      AND l.topology_id = topology_info.id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'No layer with id "%" in topology "%"',
        alayer, atopology;
  END;

  -- Can't convert to a hierarchical topogeometry
  IF layer_info.level > 0 THEN
      RAISE EXCEPTION 'Layer "%" of topology "%" is hierarchical, cannot convert a simple geometry to it.',
        alayer, atopology;
  END IF;


  -- 
  -- Check type compatibility and set TopoGeometry type
  -- 1:puntal, 2:lineal, 3:areal, 4:collection
  --
  typ = geometrytype(ageom);
  IF typ = 'GEOMETRYCOLLECTION' THEN
    --  A collection can only go to collection layer
    IF layer_info.feature_type != 4 THEN
      RAISE EXCEPTION
        'Layer "%" of topology "%" is %, cannot hold a collection feature.',
        layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg.type := 4;
  ELSIF typ = 'POINT' OR typ = 'MULTIPOINT' THEN -- puntal
    --  A point can go in puntal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 1 THEN
      RAISE EXCEPTION
        'Layer "%" of topology "%" is %, cannot hold a puntal feature.',
        layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg.type := 1;
  ELSIF typ = 'LINESTRING' or typ = 'MULTILINESTRING' THEN -- lineal
    --  A line can go in lineal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 2 THEN
      RAISE EXCEPTION
        'Layer "%" of topology "%" is %, cannot hold a lineal feature.',
        layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg.type := 2;
  ELSIF typ = 'POLYGON' OR typ = 'MULTIPOLYGON' THEN -- areal
    --  An area can go in areal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 3 THEN
      RAISE EXCEPTION
        'Layer "%" of topology "%" is %, cannot hold an areal feature.',
        layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg.type := 3;
  ELSE
      -- Should never happen
      RAISE EXCEPTION
        'Unexpected feature dimension %', ST_Dimension(ageom);
  END IF;

  -- Now that we have an empty topogeometry, we loop over distinct components 
  -- and add them to the definition of it. We add them as soon
  -- as possible so that each element can further edit the
  -- definition by splitting
  FOR rec IN SELECT id(tg), alayer as lyr,
    geom, ST_Dimension(geom) as dims
    FROM (SELECT (ST_Dump(ageom)).geom) as f
    WHERE NOT ST_IsEmpty(geom)
  LOOP
    FOR rec2 IN SELECT CASE
       WHEN rec.dims = 0 THEN
         topology.topogeo_addPoint(atopology, rec.geom, tolerance)
       WHEN rec.dims = 1 THEN
         topology.topogeo_addLineString(atopology, rec.geom, tolerance)
       WHEN rec.dims = 2 THEN
         topology.topogeo_addPolygon(atopology, rec.geom, tolerance)
       END as primitive
    LOOP
      elem := ARRAY[rec.dims+1, rec2.primitive]::text;
      IF elems @> ARRAY[elem] THEN
      ELSE
        elems := elems || elem;
        -- TODO: consider use a single INSERT statement for the whole thing
        sql := 'INSERT INTO ' || quote_ident(atopology)
            || '.relation(topogeo_id, layer_id, element_type, element_id) VALUES ('
            || rec.id || ',' || rec.lyr || ',' || rec.dims+1
            || ',' || rec2.primitive || ')'
            -- NOTE: we're avoiding duplicated rows here
            || ' EXCEPT SELECT ' || rec.id || ', ' || rec.lyr
            || ', element_type, element_id FROM '
            || quote_ident(topology_info.name)
            || '.relation WHERE layer_id = ' || rec.lyr
            || ' AND topogeo_id = ' || rec.id;
        EXECUTE sql;
      END IF;
    END LOOP;
  END LOOP;

  RETURN tg;

END
$$;
 h   DROP FUNCTION topology.totopogeom(ageom public.geometry, tg topogeometry, atolerance double precision);
       topology       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    9    2    2039    2039            6           1255    43597 I   totopogeom(public.geometry, character varying, integer, double precision)    FUNCTION     �  CREATE FUNCTION totopogeom(ageom public.geometry, atopology character varying, alayer integer, atolerance double precision DEFAULT 0) RETURNS topogeometry
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  layer_info RECORD;
  topology_info RECORD;
  tg topology.TopoGeometry;
  typ TEXT;
BEGIN

  -- Get topology information
  BEGIN
    SELECT *
    FROM topology.topology
      INTO STRICT topology_info WHERE name = atopology;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'No topology with name "%" in topology.topology',
        atopology;
  END;

  -- Get layer information
  BEGIN
    SELECT *, CASE
      WHEN feature_type = 1 THEN 'puntal'
      WHEN feature_type = 2 THEN 'lineal'
      WHEN feature_type = 3 THEN 'areal'
      WHEN feature_type = 4 THEN 'mixed'
      ELSE 'unexpected_'||feature_type
      END as typename
    FROM topology.layer l
      INTO STRICT layer_info
      WHERE l.layer_id = alayer
      AND l.topology_id = topology_info.id;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE EXCEPTION 'No layer with id "%" in topology "%"',
        alayer, atopology;
  END;

  -- Can't convert to a hierarchical topogeometry
  IF layer_info.level > 0 THEN
      RAISE EXCEPTION 'Layer "%" of topology "%" is hierarchical, cannot convert to it.',
        alayer, atopology;
  END IF;


  -- 
  -- Check type compatibility and create empty TopoGeometry
  -- 1:puntal, 2:lineal, 3:areal, 4:collection
  --
  typ = geometrytype(ageom);
  IF typ = 'GEOMETRYCOLLECTION' THEN
    --  A collection can only go collection layer
    IF layer_info.feature_type != 4 THEN
      RAISE EXCEPTION
        'Layer "%" of topology "%" is %, cannot hold a collection feature.',
        layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg := topology.CreateTopoGeom(atopology, 4, alayer);
  ELSIF typ = 'POINT' OR typ = 'MULTIPOINT' THEN -- puntal
    --  A point can go in puntal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 1 THEN
      RAISE EXCEPTION
        'Layer "%" of topology "%" is %, cannot hold a puntal feature.',
        layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg := topology.CreateTopoGeom(atopology, 1, alayer);
  ELSIF typ = 'LINESTRING' or typ = 'MULTILINESTRING' THEN -- lineal
    --  A line can go in lineal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 2 THEN
      RAISE EXCEPTION
        'Layer "%" of topology "%" is %, cannot hold a lineal feature.',
        layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg := topology.CreateTopoGeom(atopology, 2, alayer);
  ELSIF typ = 'POLYGON' OR typ = 'MULTIPOLYGON' THEN -- areal
    --  An area can go in areal or collection layer
    IF layer_info.feature_type != 4 and layer_info.feature_type != 3 THEN
      RAISE EXCEPTION
        'Layer "%" of topology "%" is %, cannot hold an areal feature.',
        layer_info.layer_id, topology_info.name, layer_info.typename;
    END IF;
    tg := topology.CreateTopoGeom(atopology, 3, alayer);
  ELSE
      -- Should never happen
      RAISE EXCEPTION
        'Unsupported feature type %', typ;
  END IF;

  tg := topology.toTopoGeom(ageom, tg, atolerance);

  RETURN tg;

END
$$;
 �   DROP FUNCTION topology.totopogeom(ageom public.geometry, atopology character varying, alayer integer, atolerance double precision);
       topology       postgres    false    2039    9    2    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            7           1255    43598 #   validatetopology(character varying)    FUNCTION     =   CREATE FUNCTION validatetopology(toponame character varying) RETURNS SETOF validatetopology_returntype
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  retrec topology.ValidateTopology_ReturnType;
  rec RECORD;
  rec2 RECORD;
  i integer;
  invalid_edges integer[];
  invalid_faces integer[];
  sql text;
BEGIN

  -- Check for coincident nodes
  FOR rec IN EXECUTE 'SELECT a.node_id as id1, b.node_id as id2 FROM '
    || quote_ident(toponame) || '.node a, '
    || quote_ident(toponame) || '.node b '
       'WHERE a.node_id < b.node_id '
       ' AND ST_DWithin(a.geom, b.geom, 0)' -- NOTE: see #1625 and #1789
  LOOP
    retrec.error = 'coincident nodes';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Check for edge crossed nodes
  -- TODO: do this in the single edge loop
  FOR rec IN EXECUTE 'SELECT n.node_id as nid, e.edge_id as eid FROM '
    || quote_ident(toponame) || '.node n, '
    || quote_ident(toponame) || '.edge e '
       'WHERE e.start_node != n.node_id '
       'AND e.end_node != n.node_id '
       'AND ST_Within(n.geom, e.geom)'
  LOOP
    retrec.error = 'edge crosses node';
    retrec.id1 = rec.eid; -- edge_id
    retrec.id2 = rec.nid; -- node_id
    RETURN NEXT retrec;
  END LOOP;

  -- Scan all edges 
  FOR rec IN EXECUTE 'SELECT e.geom, e.edge_id as id1, e.left_face, e.right_face FROM '
    || quote_ident(toponame) || '.edge e ORDER BY edge_id'
  LOOP

    -- Any invalid edge becomes a cancer for higher level complexes
    IF NOT ST_IsValid(rec.geom) THEN

      retrec.error = 'invalid edge';
      retrec.id1 = rec.id1;
      retrec.id2 = NULL;
      RETURN NEXT retrec;
      invalid_edges := array_append(invalid_edges, rec.id1);

      IF invalid_faces IS NULL OR NOT rec.left_face = ANY ( invalid_faces )
      THEN
        invalid_faces := array_append(invalid_faces, rec.left_face);
      END IF;

      IF rec.right_face != rec.left_face AND ( invalid_faces IS NULL OR
            NOT rec.right_face = ANY ( invalid_faces ) )
      THEN
        invalid_faces := array_append(invalid_faces, rec.right_face);
      END IF;

      CONTINUE;

    END IF;

    IF NOT ST_IsSimple(rec.geom) THEN
      retrec.error = 'edge not simple';
      retrec.id1 = rec.id1;
      retrec.id2 = NULL;
      RETURN NEXT retrec;
    END IF;

  END LOOP;

  -- Check for edge crossing
  sql := 'SELECT e1.edge_id as id1, e2.edge_id as id2, '
       ' e1.geom as g1, e2.geom as g2, '
       'ST_Relate(e1.geom, e2.geom) as im FROM '
    || quote_ident(toponame) || '.edge e1, '
    || quote_ident(toponame) || '.edge e2 '
       'WHERE e1.edge_id < e2.edge_id '
       ' AND e1.geom && e2.geom ';
  IF invalid_edges IS NOT NULL THEN
    sql := sql || ' AND NOT e1.edge_id = ANY ('
               || quote_literal(invalid_edges) || ')'
               || ' AND NOT e2.edge_id = ANY ('
               || quote_literal(invalid_edges) || ')';
  END IF;

  FOR rec IN EXECUTE sql
  LOOP

    IF ST_RelateMatch(rec.im, 'FF1F**1*2') THEN
      CONTINUE; -- no interior intersection

    --
    -- Closed lines have no boundary, so endpoint
    -- intersection would be considered interior
    -- See http://trac.osgeo.org/postgis/ticket/770
    -- See also full explanation in topology.AddEdge
    --

    ELSIF ST_RelateMatch(rec.im, 'FF10F01F2') THEN
      -- first line (g1) is open, second (g2) is closed
      -- first boundary has puntual intersection with second interior
      --
      -- compute intersection, check it equals second endpoint
      IF ST_Equals(ST_Intersection(rec.g2, rec.g1),
                   ST_StartPoint(rec.g2))
      THEN
        CONTINUE;
      END IF;

    ELSIF ST_RelateMatch(rec.im, 'F01FFF102') THEN
      -- second line (g2) is open, first (g1) is closed
      -- second boundary has puntual intersection with first interior
      -- 
      -- compute intersection, check it equals first endpoint
      IF ST_Equals(ST_Intersection(rec.g2, rec.g1),
                   ST_StartPoint(rec.g1))
      THEN
        CONTINUE;
      END IF;

    ELSIF ST_RelateMatch(rec.im, '0F1FFF1F2') THEN
      -- both lines are closed (boundary intersects nothing)
      -- they have puntual intersection between interiors
      -- 
      -- compute intersection, check it's a single point
      -- and equals first StartPoint _and_ second StartPoint
      IF ST_Equals(ST_Intersection(rec.g1, rec.g2),
                   ST_StartPoint(rec.g1)) AND
         ST_Equals(ST_StartPoint(rec.g1), ST_StartPoint(rec.g2))
      THEN
        CONTINUE;
      END IF;

    END IF;

    retrec.error = 'edge crosses edge';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Check for edge start_node geometry mis-match
  -- TODO: move this in the first edge table scan 
  FOR rec IN EXECUTE 'SELECT e.edge_id as id1, n.node_id as id2 FROM '
    || quote_ident(toponame) || '.edge e, '
    || quote_ident(toponame) || '.node n '
       'WHERE e.start_node = n.node_id '
       'AND NOT ST_Equals(ST_StartPoint(e.geom), n.geom)'
  LOOP
    retrec.error = 'edge start node geometry mis-match';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Check for edge end_node geometry mis-match
  -- TODO: move this in the first edge table scan 
  FOR rec IN EXECUTE 'SELECT e.edge_id as id1, n.node_id as id2 FROM '
    || quote_ident(toponame) || '.edge e, '
    || quote_ident(toponame) || '.node n '
       'WHERE e.end_node = n.node_id '
       'AND NOT ST_Equals(ST_EndPoint(e.geom), n.geom)'
  LOOP
    retrec.error = 'edge end node geometry mis-match';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
  END LOOP;

  -- Check for faces w/out edges
  FOR rec IN EXECUTE 'SELECT face_id as id1 FROM '
    || quote_ident(toponame) || '.face '
    || 'WHERE face_id > 0 EXCEPT ( SELECT left_face FROM '
    || quote_ident(toponame) || '.edge '
    || ' UNION SELECT right_face FROM '
    || quote_ident(toponame) || '.edge '
    || ')'
  LOOP
    retrec.error = 'face without edges';
    retrec.id1 = rec.id1;
    retrec.id2 = NULL;
    RETURN NEXT retrec;
  END LOOP;

  -- Now create a temporary table to construct all face geometries
  -- for checking their consistency

  sql := 'CREATE TEMP TABLE face_check ON COMMIT DROP AS '
       'SELECT face_id, topology.ST_GetFaceGeometry('
    || quote_literal(toponame) || ', face_id) as geom, mbr FROM '
    || quote_ident(toponame) || '.face WHERE face_id > 0';
  IF invalid_faces IS NOT NULL THEN
    sql := sql || ' AND NOT face_id = ANY ('
               || quote_literal(invalid_faces) || ')';
  END IF;
  EXECUTE sql;

  -- Build a gist index on geom
  EXECUTE 'CREATE INDEX "face_check_gist" ON '
       'face_check USING gist (geom);';

  -- Build a btree index on id
  EXECUTE 'CREATE INDEX "face_check_bt" ON ' 
       'face_check (face_id);';

  -- Scan the table looking for NULL geometries
  FOR rec IN EXECUTE
    'SELECT f1.face_id FROM '
       'face_check f1 WHERE f1.geom IS NULL OR ST_IsEmpty(f1.geom)'
  LOOP
    -- Face missing !
    retrec.error := 'face has no rings';
    retrec.id1 := rec.face_id;
    retrec.id2 := NULL;
    RETURN NEXT retrec;
  END LOOP;


  -- Scan the table looking for overlap or containment
  -- TODO: also check for MBR consistency
  FOR rec IN EXECUTE
    'SELECT f1.geom, f1.face_id as id1, f2.face_id as id2, '
       ' ST_Relate(f1.geom, f2.geom) as im'
       ' FROM '
       'face_check f1, '
       'face_check f2 '
       'WHERE f1.face_id < f2.face_id'
       ' AND f1.geom && f2.geom'
  LOOP

    -- Face overlap
    IF ST_RelateMatch(rec.im, 'T*T***T**') THEN
    retrec.error = 'face overlaps face';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
    END IF;

    -- Face 1 is within face 2 
    IF ST_RelateMatch(rec.im, 'T*F**F***') THEN
    retrec.error = 'face within face';
    retrec.id1 = rec.id1;
    retrec.id2 = rec.id2;
    RETURN NEXT retrec;
    END IF;

    -- Face 1 contains face 2
    IF ST_RelateMatch(rec.im, 'T*****FF*') THEN
    retrec.error = 'face within face';
    retrec.id1 = rec.id2;
    retrec.id2 = rec.id1;
    RETURN NEXT retrec;
    END IF;

  END LOOP;


  DROP TABLE face_check;

  RETURN;
END
$$;
 E   DROP FUNCTION topology.validatetopology(toponame character varying);
       topology       postgres    false    2    9    2042            4           1255    43600    accum(geometry) 	   AGGREGATE     �   CREATE AGGREGATE accum(geometry) (
    SFUNC = public.pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);
 '   DROP AGGREGATE public.accum(geometry);
       public       postgres    false    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    7            5           1255    43601    extent(geometry) 	   AGGREGATE     {   CREATE AGGREGATE extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d,
    FINALFUNC = public.box2d
);
 (   DROP AGGREGATE public.extent(geometry);
       public       postgres    false    4    4    4    7    4    7    7    7    4    4    7    4    7    7    7    4    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    4    7    4    7    7    4    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            6           1255    43602    makeline(geometry) 	   AGGREGATE     �   CREATE AGGREGATE makeline(geometry) (
    SFUNC = public.pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);
 *   DROP AGGREGATE public.makeline(geometry);
       public       postgres    false    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7    4    7            7           1255    43603    memcollect(geometry) 	   AGGREGATE     _   CREATE AGGREGATE memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);
 ,   DROP AGGREGATE public.memcollect(geometry);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7            8           1255    43604    st_extent3d(geometry) 	   AGGREGATE     b   CREATE AGGREGATE st_extent3d(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);
 -   DROP AGGREGATE public.st_extent3d(geometry);
       public       postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7    4    4    7    4    7    7    4    4    4    7    4    7    7    4    4    7    4    7    7    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            9           1255    43605 !   topoelementarray_agg(topoelement) 	   AGGREGATE     z   CREATE AGGREGATE topoelementarray_agg(topoelement) (
    SFUNC = topoelementarray_append,
    STYPE = topoelementarray
);
 ;   DROP AGGREGATE topology.topoelementarray_agg(topoelement);
       topology       postgres    false    2033    9    2037    1586            i           2605    43606 /   CAST (topology.topogeometry AS public.geometry)    CAST     {   CREATE CAST (topology.topogeometry AS public.geometry) WITH FUNCTION topology.geometry(topology.topogeometry) AS IMPLICIT;
 6   DROP CAST (topology.topogeometry AS public.geometry);
    
   pg_catalog            false    2039    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    1566            �            1259    43607 	   tb_places    TABLE     �  CREATE TABLE tb_places (
    id integer NOT NULL,
    id_street integer NOT NULL,
    geom geometry(Point,4326),
    number integer NOT NULL,
    original_number character varying,
    name character varying,
    first_day integer,
    first_month integer,
    first_year integer,
    last_day integer,
    last_month integer,
    last_year integer,
    source character varying,
    id_user integer,
    date date
);
    DROP TABLE public.tb_places;
       public         postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �            1259    43613    tb_places_id_seq    SEQUENCE     r   CREATE SEQUENCE tb_places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.tb_places_id_seq;
       public       postgres    false    7            �            1259    43615    tb_places_id_seq1    SEQUENCE     s   CREATE SEQUENCE tb_places_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tb_places_id_seq1;
       public       postgres    false    208    7                       0    0    tb_places_id_seq1    SEQUENCE OWNED BY     8   ALTER SEQUENCE tb_places_id_seq1 OWNED BY tb_places.id;
            public       postgres    false    210            �            1259    43617 	   tb_street    TABLE     �   CREATE TABLE tb_street (
    id integer NOT NULL,
    name character varying NOT NULL,
    geom geometry(MultiLineString,4326),
    id_type integer
);
    DROP TABLE public.tb_street;
       public         postgres    false    4    4    7    7    4    7    4    7    4    7    4    7    4    7    4    7    7            �            1259    43623    tb_street_id_seq    SEQUENCE     r   CREATE SEQUENCE tb_street_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.tb_street_id_seq;
       public       postgres    false    7            �            1259    43625    tb_street_id_seq1    SEQUENCE     s   CREATE SEQUENCE tb_street_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tb_street_id_seq1;
       public       postgres    false    7    211                       0    0    tb_street_id_seq1    SEQUENCE OWNED BY     8   ALTER SEQUENCE tb_street_id_seq1 OWNED BY tb_street.id;
            public       postgres    false    213            �            1259    43627    tb_type_logradouro    TABLE     b   CREATE TABLE tb_type_logradouro (
    id integer NOT NULL,
    type character varying NOT NULL
);
 &   DROP TABLE public.tb_type_logradouro;
       public         postgres    false    7            �            1259    43633    tb_type_logradouro_id_seq    SEQUENCE     {   CREATE SEQUENCE tb_type_logradouro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tb_type_logradouro_id_seq;
       public       postgres    false    214    7                        0    0    tb_type_logradouro_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE tb_type_logradouro_id_seq OWNED BY tb_type_logradouro.id;
            public       postgres    false    215            �            1259    43635    tb_users    TABLE     5  CREATE TABLE tb_users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    institution character varying(50) NOT NULL,
    password character varying NOT NULL,
    level integer NOT NULL,
    datestart date NOT NULL,
    status integer NOT NULL
);
    DROP TABLE public.tb_users;
       public         postgres    false    7            �            1259    43641    tb_users_id_seq    SEQUENCE     q   CREATE SEQUENCE tb_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.tb_users_id_seq;
       public       postgres    false    216    7            !           0    0    tb_users_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE tb_users_id_seq OWNED BY tb_users.id;
            public       postgres    false    217            �            1259    43643    layer    TABLE     =  CREATE TABLE layer (
    topology_id integer NOT NULL,
    layer_id integer NOT NULL,
    schema_name character varying NOT NULL,
    table_name character varying NOT NULL,
    feature_column character varying NOT NULL,
    feature_type integer NOT NULL,
    level integer DEFAULT 0 NOT NULL,
    child_id integer
);
    DROP TABLE topology.layer;
       topology         postgres    false    9            �            1259    43650    topology    TABLE     �   CREATE TABLE topology (
    id integer NOT NULL,
    name character varying NOT NULL,
    srid integer NOT NULL,
    "precision" double precision NOT NULL,
    hasz boolean DEFAULT false NOT NULL
);
    DROP TABLE topology.topology;
       topology         postgres    false    9            �            1259    43657    topology_id_seq    SEQUENCE     q   CREATE SEQUENCE topology_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE topology.topology_id_seq;
       topology       postgres    false    9    219            "           0    0    topology_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE topology_id_seq OWNED BY topology.id;
            topology       postgres    false    220            l           2604    43659    tb_places id    DEFAULT     _   ALTER TABLE ONLY tb_places ALTER COLUMN id SET DEFAULT nextval('tb_places_id_seq1'::regclass);
 ;   ALTER TABLE public.tb_places ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    208            m           2604    43660    tb_street id    DEFAULT     _   ALTER TABLE ONLY tb_street ALTER COLUMN id SET DEFAULT nextval('tb_street_id_seq1'::regclass);
 ;   ALTER TABLE public.tb_street ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    211            n           2604    43661    tb_type_logradouro id    DEFAULT     p   ALTER TABLE ONLY tb_type_logradouro ALTER COLUMN id SET DEFAULT nextval('tb_type_logradouro_id_seq'::regclass);
 D   ALTER TABLE public.tb_type_logradouro ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            o           2604    43662    tb_users id    DEFAULT     \   ALTER TABLE ONLY tb_users ALTER COLUMN id SET DEFAULT nextval('tb_users_id_seq'::regclass);
 :   ALTER TABLE public.tb_users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            r           2604    43663    topology id    DEFAULT     \   ALTER TABLE ONLY topology ALTER COLUMN id SET DEFAULT nextval('topology_id_seq'::regclass);
 <   ALTER TABLE topology.topology ALTER COLUMN id DROP DEFAULT;
       topology       postgres    false    220    219            j          0    42042    spatial_ref_sys 
   TABLE DATA               Q   COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       postgres    false    191   E>                0    43607 	   tb_places 
   TABLE DATA               �   COPY tb_places (id, id_street, geom, number, original_number, name, first_day, first_month, first_year, last_day, last_month, last_year, source, id_user, date) FROM stdin;
    public       postgres    false    208   b>      #           0    0    tb_places_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('tb_places_id_seq', 1, false);
            public       postgres    false    209            $           0    0    tb_places_id_seq1    SEQUENCE SET     9   SELECT pg_catalog.setval('tb_places_id_seq1', 74, true);
            public       postgres    false    210            	          0    43617 	   tb_street 
   TABLE DATA               5   COPY tb_street (id, name, geom, id_type) FROM stdin;
    public       postgres    false    211   >      %           0    0    tb_street_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('tb_street_id_seq', 1, false);
            public       postgres    false    212            &           0    0    tb_street_id_seq1    SEQUENCE SET     ;   SELECT pg_catalog.setval('tb_street_id_seq1', 1025, true);
            public       postgres    false    213                      0    43627    tb_type_logradouro 
   TABLE DATA               /   COPY tb_type_logradouro (id, type) FROM stdin;
    public       postgres    false    214   >�      '           0    0    tb_type_logradouro_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('tb_type_logradouro_id_seq', 3, true);
            public       postgres    false    215                      0    43635    tb_users 
   TABLE DATA               ]   COPY tb_users (id, name, email, institution, password, level, datestart, status) FROM stdin;
    public       postgres    false    216   k�      (           0    0    tb_users_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('tb_users_id_seq', 6, true);
            public       postgres    false    217                      0    43643    layer 
   TABLE DATA               w   COPY layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
    topology       postgres    false    218   ��                0    43650    topology 
   TABLE DATA               >   COPY topology (id, name, srid, "precision", hasz) FROM stdin;
    topology       postgres    false    219   ��      )           0    0    topology_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('topology_id_seq', 1, false);
            topology       postgres    false    220            t           2606    43665    tb_places pk_id_places 
   CONSTRAINT     M   ALTER TABLE ONLY tb_places
    ADD CONSTRAINT pk_id_places PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.tb_places DROP CONSTRAINT pk_id_places;
       public         postgres    false    208    208            v           2606    43667    tb_street pk_id_street 
   CONSTRAINT     M   ALTER TABLE ONLY tb_street
    ADD CONSTRAINT pk_id_street PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.tb_street DROP CONSTRAINT pk_id_street;
       public         postgres    false    211    211            x           2606    43669    tb_type_logradouro pk_id_type 
   CONSTRAINT     T   ALTER TABLE ONLY tb_type_logradouro
    ADD CONSTRAINT pk_id_type PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.tb_type_logradouro DROP CONSTRAINT pk_id_type;
       public         postgres    false    214    214            z           2606    43671    tb_users tb_users_email_key 
   CONSTRAINT     P   ALTER TABLE ONLY tb_users
    ADD CONSTRAINT tb_users_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.tb_users DROP CONSTRAINT tb_users_email_key;
       public         postgres    false    216    216            |           2606    43673    tb_users tb_users_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY tb_users
    ADD CONSTRAINT tb_users_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.tb_users DROP CONSTRAINT tb_users_pkey;
       public         postgres    false    216    216            ~           2606    43675    layer layer_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY layer
    ADD CONSTRAINT layer_pkey PRIMARY KEY (topology_id, layer_id);
 <   ALTER TABLE ONLY topology.layer DROP CONSTRAINT layer_pkey;
       topology         postgres    false    218    218    218            �           2606    43677 5   layer layer_schema_name_table_name_feature_column_key 
   CONSTRAINT     �   ALTER TABLE ONLY layer
    ADD CONSTRAINT layer_schema_name_table_name_feature_column_key UNIQUE (schema_name, table_name, feature_column);
 a   ALTER TABLE ONLY topology.layer DROP CONSTRAINT layer_schema_name_table_name_feature_column_key;
       topology         postgres    false    218    218    218    218            �           2606    43679    topology topology_name_key 
   CONSTRAINT     N   ALTER TABLE ONLY topology
    ADD CONSTRAINT topology_name_key UNIQUE (name);
 F   ALTER TABLE ONLY topology.topology DROP CONSTRAINT topology_name_key;
       topology         postgres    false    219    219            �           2606    43681    topology topology_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY topology
    ADD CONSTRAINT topology_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY topology.topology DROP CONSTRAINT topology_pkey;
       topology         postgres    false    219    219            �           2620    43682    layer layer_integrity_checks    TRIGGER     v   CREATE TRIGGER layer_integrity_checks BEFORE DELETE OR UPDATE ON layer FOR EACH ROW EXECUTE PROCEDURE layertrigger();
 7   DROP TRIGGER layer_integrity_checks ON topology.layer;
       topology       postgres    false    218    1578            �           2606    43683    tb_places fk_id_street    FK CONSTRAINT        ALTER TABLE ONLY tb_places
    ADD CONSTRAINT fk_id_street FOREIGN KEY (id_street) REFERENCES tb_street(id) ON UPDATE CASCADE;
 @   ALTER TABLE ONLY public.tb_places DROP CONSTRAINT fk_id_street;
       public       postgres    false    208    3702    211            �           2606    43688    tb_street fk_id_type    FK CONSTRAINT     �   ALTER TABLE ONLY tb_street
    ADD CONSTRAINT fk_id_type FOREIGN KEY (id_type) REFERENCES tb_type_logradouro(id) ON UPDATE CASCADE ON DELETE SET NULL;
 >   ALTER TABLE ONLY public.tb_street DROP CONSTRAINT fk_id_type;
       public       postgres    false    3704    214    211            �           2606    43693    tb_places fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY tb_places
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES tb_users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 >   ALTER TABLE ONLY public.tb_places DROP CONSTRAINT fk_id_user;
       public       postgres    false    3708    216    208            �           2606    43698    layer layer_topology_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY layer
    ADD CONSTRAINT layer_topology_id_fkey FOREIGN KEY (topology_id) REFERENCES topology(id);
 H   ALTER TABLE ONLY topology.layer DROP CONSTRAINT layer_topology_id_fkey;
       topology       postgres    false    3716    218    219            j      x������ � �            x������ � �      	      x��}I�����8k�� �l�;�Q-�*�_f �?y��z��G8�^�$��h������_������������?�w���v���G�g�+����kiae�d���_э�����jrq� �xXn��R)�x���֋���X���r��x9n�3�/�x
�$�{��ݙ��=�ŵ��|����+cy�����}������W��O?�/�[{�c��}�6|��~<��+^��{����m�7�����玖w��冏��~��ݨ������?�h��xWcЯO=����xɡ��a��W��:c��"1�!�v/���l�����ϫ��p�JO!�z�ˑSH�����rĦ�Rtz�T���fw}>a��W���o�������A�|��)��N�z�a7%${�Y}9�f{=>>��G��M5�$!�la��#�l��7�#>�/y�5�[�љ�Qj
*�y/��^!��5c�j�A�_N��=�{������=����Nî<G3���3NkcԹ׽��5����׋�ޭ,N5W�Ǎ�a}���-���4�����^?��ׯ�i=�I)�p�uW�3���_A�Ez�Yo�h�r�cr��9��nϐ��ʱ��nh᤻w\�����-���jMz�j������k��5�!B����/R��ͭ�#e$�\{�8eB�˻��g��g��WM�k��gᇆ�{�T�Ρ���溅���}+A�JK�Kн�x�r������������?u�i��%�����n��#��7� �����/��F���a�4���5��ϧ�������^X)LOw'�`i�(:=�s+Sw'�������Q��N]���?p^�
���d�Y]g��c�Z��̫���u�=��{�
���M�	o��\�E�jmB�d���wL�dUm0\3�ӷ~>��\��9\����pC�e�v���a������q�֌z8�-r�|�k�P����$�'Cm�^[r��Ý*�m����p���T� H/m9}�����[5{Ǽa��ٷ�z�q�p��k�{����3�g�*�ݝe��%;CXj��jgk�����ٝ;#k����NP�N�{B���9�����p�2@��_��ل"�~SE��В�ev�����g�ǽ� 4��ԣ�6�m�a��� �����#g�]��t���+�c-u��{����/.�`�υ��} iaN[�4V[�kz�Q�o��7?"�5��+2 ��./�?�������O���nXͷl�/���j����$3"8xg�f���Ȏ:��);���_��%&������ن	l
D#j�K=�'f�cYm����W��Ԥ�'�4�j�����Z��o�ֶ���Q�o���8�b�+���L�S�K4���8���\i�@+&�$̽^�;����Kn�U��,�z􁦡8���za�5f��P����P(m@b�[z:�(p���4���hҗA�c�FWaTZ����ZB��������$GS��f�mpkn�3�}�O��O({�{<�	��ˌ�������#6��V��V���&	����.�f� Jz����x(�.�'Nn4�7P0 g5�ڶK��x���Ir��=@�m8��,P�^�@o��'NW� v*&���K��-{�^�4o��kP���Ku�'�:x�����Q�?��`d���PEi�>!ks���}�Q�o���$z[��{��/}���T�1�F�S�����x��b��V�	x��nؗ��F�J��֖��T�҇S�F�Kl�L �C��Հ��M���5'0��魱
`y(�P]�oo��"^Ť{IY�ۤ[��3V7�X��Ga�۟�^| �a��Dk��1_����)0�:6ʨ�;ȧ�4��`K\��n���25�; �3K��ϟXc`�`�ٻZr�z)����?�-��7��(��x�U .X\@=�|w�vj7�m��>�����d���x&
��?D5)n���f�7a�|Ф��ƙ��x�<��;���)�ޫ����L����7N�	Iw1__ß�E���!���3��] C�=�d0���@�j��X$�4�3�*���~�V頀I؉�b}ƾ�az`xZ~��*�8����7��1F�WH5��e�����C *����A����|�_�W����V����/���@�@6[}}X�1�kwV��l�=�`&(���âbCC2wR�:I�g`��������{<�$�N�̑}p�{1��%��{�@�����E�IKȖ���r���d{�
��qZWo^������Pm؜=����H<t���'o0��[0 ���A���C�v���0ݮ�������y�����h؄����BT�A�Z���[ ,l��@�-2_}�pp���|*}���#�U_Ü���
=����� }����ha��,6}��N���B�q�qƒ������;Ix��U��@Ta�_�1}`=�k�Zв5.�n5�D]�z�d��ְ�Cz;4���_,���:���6�H]>,� %�vz�:k�+��}���tB��^�
��ZJ%�
k��8�c�V��s�^�����?[>��S�K�?�2�t�x��@w�J�s���_������ik6�HQ����n���}��{Z���q5�v���.L`��T��8��.�	�b~SZ@����S�Nw��x�ӀL���d��H�����;����Nmm�ס���\0�R���&8ʘ�@�����N�3�;P�{J�L��{m�wVX6&�a(��~^�4�k��S�S}= �6O,��r�jL�$u8U�h|�zl�@^dW�g���.��{�����Ty ;`Ea �󹶵w�z�p��y�$����-/ޟ�L��2-_�*G,%@�p�qW��x��� �����n�S��H�^o���>H� 'h[i4.t����ߞ��ëo�{S�>�K�冎{�r�w�� ��>���@�K�x퀙�yyk�֥��8��@��тI�[�*U�-4\>��.8!1��`��]b	�, R��0@�X���n)��+).�'�������E,��nf��}]���@�#�tF���P7o��]�B�`��Όm�ϊkh�ݺY,/���E�\ DSUW���JYN�� �S�?��H�\@�mK��,�7`}�����+%��L��6��90�����健3E0����G�z���[��d���l���y�����W�P����>�v���&����:0jGQ�j)�;j������q����P���=��=���P]x��R6��V�
O��E�|�^mq��1tw �iE셒���㇘]�]��]������O�Y�9����<[��e�[:��
@M�N��%VZ��]��A�{��'#1o�#͙)���|%�?)z�����{+������%���Io* ��	��c�<�b��mًL��-%/�Pm�~"��d}M'�U�c��c�%������ڞ�R�'@�T�6�LC�d�8� �*}�'Vlg�^)��h�JtK����#����j�&hsE��(Eڜ�y,u����H�^x%='�X���R�$߰��m7�ԥ75�9f��8�Ru��y�TT�	1�I�B�
�@V7&�����:�p����H�rX|��B���Æ+X�Q�_��$�O�9��2��v�'@H��P?`�����ϝZ�~;T�T��6@��៫��@=����0B���>��)�� ����-��x'�t�c�����86�f~P��!��Z������*%� ��)R���H�Sw꼚��� �@��>ƌ4/^�f���ux?�:���� �WN ����7{[�͟�R2h������
��Q
�П�����W����B���E����/@�rv_�k{��d��;j9��%9��E}���`�X
����H�]�0l����p�N�s�_��q��b�\�bu .-��S�>��,xI��H��)��f��fs��z��q��7/��h@�-�D�PJ.���h�e�{[\di(@Y�,��Z/Q_��b�e0��
��Y>�.�,�O��dW�<    �]�+�k�f��\)�՗)^�����~�o�����4���1���kTkĊ�)�w�>XT�X~�x�d�@b�u�7.7����@�ؓ��D-P��'f� �o��`i�1gL.��\��d�}]�*Q����ʣ�g��瓋~���ԣ��h�a��� �t�>v#��(���n�����i쳢����s�(K�S8������s�$S=8����Ļ�s�/�B3���|���}I����',"�Ay/�Tc����>�c����؃<�P�P^���F�%�^R�����<��aU�8�,�$�j�al�c����n>fK�%Gs�������w�JA�e��uxռYo`�ʺϮEsV=��&}�a ���-�Y&�Α�'�Uƶ�tyQ"Fy�
�2Q>~E�p�N�)��77��LX�c�m�` ��5@�@�a���i�0 ˮ��8@�\t���#,���(:�b��x ��fz��b�!r��5�1�ˎ�3��}v�+�i�q�������K����T��h�{��tF��G�����;����l��خ{�d�a 7e���'x���`:f�ϧ��Ӈ��-���݌���~2�=����{����o���P'���a�廯�`�摼�5?,t�~ݘ�t2�%�,k�����~�z��WjG��>	V�J/�Ĺ�%��S��{��_���ލ�tOݎ�¨ggw��!�
�h�ᕣ�a�k���v� �,�p�I�f��q�D`l7^�����R!��	�+d�ɾ�yF���=8���bά.�����uwJ�^m��7��'ԯ�>(E,��ް�,~A��tYMϖkS9l�|y�޺��V_"�Lǩ+���!��|IՂ�@U3�PoU��
݁��8�����+P�ݢN���%��v#!:x[}�=-����a�T� ����#�x@�U�d�1�^��+�D���_HPM6N��!రs�'��#����UH^�2��r`�Γ�����e�~������2ۊ4{�a�
��P4���w�*f���H7��ik���?[bVZw
<�$��k�'z���:�6#y�EO��A�|�û_����}o;����8q�t�%BJ;�Z�[��Lc�F2N<%��z�T��t��Y8��&Q�q��c���,6��0�Q�!��{V�7Og���%P�^#�TD֬f�0�c�MvGg2\��7(%"�����0"�'08�K�� �@��v�G)y�cl��01e��ח�J>��t����ϰ���t5*��K�g�]]����Ԁg&�9r�����5�?{=h��t3w#С0����� cup Kj�����_�6�Rˀ�b��~�o#����
8�>�
~�-n���,P0_$e���9̘%KMp��`_���(l�����i�Hy��.v��x�r�6���kB��$CF!��xk�0:�����N�����z�� r�^[=؉�m�f\��0�v�@�2�^���ś'0'Z�ca��0��S��)��XM{|N,�=�R@sz��-5����e�1?��B����ĸe��g���įف�V�8���v��h�Ke�%d#	��+ֶ1H�n��	�6�@O��b�C�+3�8f�0Ó��G������A�x�j��C�8o�mt�h�G	9/i��ȩt�����.0x��K��B��t?�$�
���]E �-%�>7��C@`vA���UֆZ��t�(3&�y�`�q6���%~P����t@$P�������g?�j��j�}	a���%�13��m�N���uS��/��]^�������f�dP�A{�Mo�]�C�$C R�ȫ1�?ЍP���ߦ���F���a�d�mw�l�l��=+$`#�<��e$y8�{���~��ږȓk��{�UX��0��S��m7�;CO�	}}�����z��0�����%'�ws&����z�1�ퟘr�i ��-� ЇӦOK�rt6��p��ly�y�U�&��E�di��:��h�X)H�a��x(�E�KX����
v/ƻ�'�Мg�}>����&v��|��z�����1{3��|X�0�h�T��$ˀ6�0*=>�y!����c�
�d��a ̗<Z���8I��eI8���&�+�����vb�5�}�6hzs�ƱҎ<���
g�j�y�A���_����~��������o���|�mX`[�G�)�p ��ų��n&��3���X,nr/Ϩ��Nfxb��Lsw�g�롄��N:��i�m��ޛ�W�I��x q��AbA��ʁ���1\�D��|��D&\xp�n�(��p��sC�9[vz��cq�n®K>�0C�BI_2���3�RY��,���m����4g� �fJ�Ƨ�%ıu�0�Cd:׾M/�
����	��;N�~�������h6��u���a��X��>]�잳��a���V��}���a��K��c� ��������&����}B�Ň~���n�ăe�0�=��t�u�\?�*�^�P�8�8�y}�3b)���!eJ(�.���3�'����l�<�Q�c;f����^��0�mOX������3`1�u�ӿGc�m�p�� ��i�3c?��%}�D��]�kN����̶H�2��n�k@E�bA׎�����]��dD�R����	c�=���L�֦���ph�m7�N[�u&$nE!�r�;U~ |4��/��^�����{*��s�qX(k���������F;x6t��TN���yf���e�<Ɓ�������w�x��
-��Y����ʾ�3��Gt��gtKFlT\�U n_�^�,�.���y��K�,象��V ���Qǁ�����`��s��miA��(�b�DsO�ʋ���5~3���p�i�$����(L�����g�*���VP�`����L�5��5�<`�����ƌ��T2&aUg��5�wh�BQ�)X�Ҁ4����{_a�yC� �=������0z���E�/"@Bj.��p��8��'����F�6x�f8��S���<���	����s���ٻas�l-��C7_�����ӆ�D�H��JD��+[��ed.��j�dЛ��o�H�Y!�#���l�+w͚N��z�$���W�a��O���qH��с�W��C
��6.��#�q�Z�������%o� *3�����X��Z���e���%0�"�_�k���Uh�pߐN��hw�8�;��-��1�3M�V�6�3EK���FJѮ!��UWR!{}`7��1��+�K� �d���ֹxV?Λ���K���� s�������< ��oa[d�	�Ś��"�y櫺I܆)	�ؾ��.A��O �6������1$,`J{}��Z���ealV-v�w?ytH���"ͦ'ѱ����_���j7�˃�gzg�q�+.����q�4@�<k�O!%X�c��h5���b�X��)�h��H�.�y���c:��1@^�8�;+`�M�����^6�Aw`��p(!R��=�G�>/�|���X�^�������O�hO-,�]�|p&��D�> �U9%�0������石��������μ�3��%th?��ԛ�ƃC�`�P+�f� ��^�_�|z<��WFI[�r&��c<L��S��?�Pz�w-�8�	0l1������d���A��,N�ݡ��� �ef��`�)/0D��`u� Pb��3,D^��ƍ��e,g>/t~�y;q2�����('Y�'ޅ�� �ژ�V�ŏa�&�9
@�x���������8�Uj����0�}���A`������Eq��3��p�rLu��TZ���� �r>NI!&����U������Yx#w�E����;ib6����˳jNc��K�}�l����{��P����Om3���~���s�v�Dk�Eд*�\f`�8���ݔ w�����W`v�    A��`��a:�����Db��w��e�+	�E�̡\�S��O���R۱����H_��jTw��!&T��!�8�ݒK��)9�h;J 'T��M9�\��8B4A�Oķ����4�V�V�~��Ȳ(�+KP-F�OBX���Z���W�y3ݳ�i�����
�s�������!*@>X�j{��-
J�R��F��I��9���k���r@�h9��4�6`�+5]����'t�{�/ f���+U�}`Uz�Vh���߯+T�8>�P�8ʾ��������DF����8x�Ȝ���������Va0�?��C��!Zli�k��
(�AFU?�X�h�~���栋�^�n�Ȱ.f]p�(,v�#������7*-�af� /h��y�������0 �G��j�J�W>p�m���ǡZ��z��Z�>m?�9�'[��e���,�Ȃ�L� O��:���-UcE }�_5�t���/�P-&�)kb�F��&�����0�F�um�n�|�.4Fk�v�+Q��[a�z,nݐGc9SmÃ�]���I�1R�����&���4 ��4�>���B��W��&X�c�����*`���|. 9�w���+��	�x�-`xSZ���ky���>
�#T�����Z+���P���}��'��-ly������;y��0jY6Xn���.�[1u]�Y>y�-_``{M`:�ؼ	����K'��j���I�k���<�#�R��V���o L�����F��s>7IX����3bϬ��a��*��B�p DC��3���@��S�D�5�m�p��Ψ���h|�b	�ݾ�o7̛\<�����B��2�D5!kŽ��{��H�nf��+����&M�����r1� UR�}�����,۳n��.O�f���3D^ȼ^��T�9: /(�T_�f���8��	[�q���K�e�(7���Ϸr|\�[q)�bJ$\��]�,�#]�y096>�H���D��8;�n	��c�	j6�"}n9|�x+�@�����p�fXG��wի��m:���,>���}���W��j�׉�RV3�B��³m|t�x���e�UYs6�+��I)%�m����Y&t����D��۷���}�󄭇g���-S� ��	k��g�Ty�e0�0'}l��쁆�)R��}���Yf`���|-�w���ԡ!��=�o�Tu�� g�$ǟO@<g�����T��<S�6�e������ϣ���S��������X�Y�<���B��[�6Wxd�Y��6ݞ�N ��CS�`2�C���1y���}��_�G��x5�x��+I�ԕ:h#�f���e^.b��Ҟ�8�('�6x���D`Y@+���Y��ə�p�B,uk�L:������v���Q�)l� c���A` ��qU�ST��rݶ|�}�����ss�/9�'�ؙBu�$f����"ԫX}v��x���d�<`��c�7�,Be��F��9��Q��>`	,#ˣ�H��^���2��=ʎ׊��G֪��t��]cEM7��e��0N6�r��x�`�qü��d��û-Mj�rԚ���S����4�%ɀ8Z S���0Z-�f���}b��t����*,1�����`�C�͗�J�����U�^���T�j��c�	���2�`�&�j�l�
¾>����~�e���:��{<E��M�������g��n0&���~�:B�	��7��0��W{=�{
2~,���	�jP��&0%�j}k'�Ι��a���kN�-W��妳��q�*o� ںyge�sV٭8�n=��qRd��}v�a=��0�x%�e�_k�v4u�)� G�l���wTy2���D�"8"�	��&vvX��"e�3�8WO���ZDK�e�'LJ_�%�b�D��?-j�S���ϟҥ-���,�)�^UwJ�-� lMsG���ܟ困�N��:�p��(�,2:u��	��ț6��v�b�����@d�XPᆝ�.��n���zÆ� ���- ���d]��Ēj�� ��%�Q\�����eGj �?�nE�^MCT:A0F_�Z[��>��7V_�k��3@�r)�}�zt�0$:��*q5���58k,ŷn�������4�m3m���$_1��YZ��罼Sf�L=����{]�UT��mţ�wb8��y)�Zĺ�vCU�`U.2�SpVs��ٝ"��������\�l�@?6;�ݓŞ����sT�R��'/'�lzݳ��]rs�d���ߑ���������:���i=�.NCca��Z�-[1��my��x2`�n��A^,�i��/p��R����v�J�5F�B/�@)h�����N�k�*\�ةT�<��bZ�����|�@[��K��U�E�����t�$���B��fV�-^v�*�篫��F����9�^�Ϗ�4�4�j�a�e/�����|k���Lsj�]谪0����:vl�a�%�F���k��xO{���[Ʋ�f4�3d��Y0m־��W�,s��+�����e��wx5Bg���-X�;@�I���`x!T�`��%w5ΰ����6L�� }[���LF�g���hZh�@Q���Y��>*&P�о�����p46��_X���8��ꬉ��s�.f���� ��������*W ߱�a�Uh�HRw2�TB�K���f.��tnyb����g}����Mv��	�g��d���V:���M���╭����&�ޏQ-� !�]N�9�����vk��e��W�}4�ߥ��Q�����>t�w�[l���hP�n�)����;�:%K�5�����w��9�O��x�~��˫}}b=���>�適w5�C��^��v�qh�mŞ����#�X��O��W���H�\��Z/VK�vP����@��2z�L|���3��{_��i�#l���:�PT��e%W���`��^�>?��[<�!�Y&˅7�̀��[�y(;��ڻ�ߘ�E����1��[bLp������'@z����z~�ͩ�:c.��٤�j`��L��Cy=�R<��Y?��h]�n`b1=�� j�L|��+�6L||��?}�K���,䊴>Q��­X�R�b�KCd��}��yI��l�HNo�]��s+�]����{��㽂�rXJ'�"L�ٖ�������r	��%2�Z??����ӌ �s�5�!{&N��_9��KoN�h�<��3T7��D1p� *��;p%>Y�'+����kI\P���zê���c��O^}����k�K�ٯy���k�y��KUU�b�E�t���0#P� 7[Jd�j	[�<�	��d?���!׺�fZ�h����ʐ��Wt��� Y^�o�����+�lH�j�ƀ'x�3���^��]�:h�0��Ɲ�t���-�
F�,��e��q
���v�M���Eq5���OZ�H�ц�ګ��0�Z��P_��@�{.��,-�b+�zՌ3�� �c!|f�Z��ⰼ�U�����nT�[��GE��d��^��֒� �w�53g���e�@�����>>�ò����q
^G��X*&q��(����G�{f<�n�$-t�~<��|�t{�aΎ���g�0�H��:�T؁�h$A
�׏C�KoL+��K�	4<�H��� '�n�V ��$��8�Z9_Xs��	vUU[]@�8o]��N̿3hӢi�#�����<�"t�/�@Yz87+1�Eꪑ�@�',���4����������a�Z��ѭ_O�$��Y�#��e����8ϯ����Rw/�������6̊�x�2 Ҟ:{��o�@kv��Ŀ[h)f��sPgx
\���c�6��5��K�8F].J�7P��b�.E;�L��ˏf�:��|��au�Xi~���JW�{�1{���M՗ޛ���?�7�9ճծ<.)�0 Z� 2���Ǉ}�@�W��1�'3L|Xg���^����[S̝�    ]Y]A]:���j���,l.����Fo��������y��P��bcC;�� (K�e.��/qb�cR'h>�@'�Ւ�%�����j��Tc6��������Q��#��"K9�p���6�����ݓ]���ԟ�#A��~=诌�����l��rq7fͅmM��d��^O���/�4�ɶ��xS������]Px�<�ht�<t�ch�.>�	ԯ]uP������[Z��Lv�!�c����uO+�	�5Q��o�DY��펞�p�STop<8��x�L�H�_6��6!�Ё������U4��{s�#o�,�j�ݞ^��ޥ�ea��Be�J��N��8l�2�;0n�|=���W>t�^�M0tv��3\���c���PP4Y
�O7g��t 4��N�oF������;�Nf������3���#���ǽ�6{�x	kN��F�!Ɋ8�mf�G=�g-77�A�qX@�i�g:��W��'$Wjjv`�&p~�)#VƳk��X'�a_��������\��=��1̙�O8���{���]��37��R���'��`��������8�'��|�V������ � G�zǻa�<��cӣ�r�a��V���gV;�ֿ��yvO�A�E-�] `68��3P�EE�X��6![�[����u����[~��t��,>��7�������cE�'��Ko1k�N�}4H9�4�ȳ+n��{��i΂�(��-�k=y�k�n3`jkV�d)2�� -��ٞ*�$��=��ps����K�Y�u{�J�/��T�99�>�����~�"0[z��2_D	[i�桊��՛p�l@��;�|�fU/k��F6AޮXF#�ˇ�^�/��$��
 �&#_�o�n𹼎��i��B�,=e�5px�ȣ��`s�.i�xd��m�-��p1�||��9�'a�{_j<�K1�8Bw������� S��k�t^�n(���s�J����@q�+�W�0�3�(��C�����&��Xf��<;�@�ݐ�"��BU� S.�����,�s�=JP��<��);{�2O��3\��L��y��R��K�4��#2^f��.���5��+ӊ��)��X-�񗄈F��^�����Siݒ�$�0�F��� ��:n�	���a�n�<��cT�ï�/A��"����;��^�q_z�Y�f(`�s�A���,f��x��p���YB)�Pq*/�:]�?X��K՛h�%��P������p�M������Y
Р�{��E�Q��@=�&S_�z��ϫx<6�:��� mg����5��<�Xݣ|��V�P�w�U���߬#��I���>��6�׃� �:At�Y��1-����	�|M]���:д2��.�㉕M����Z�������cҿ.�����~?A��1OV�އ��}ϯ���>���|@5�y�*�_O��g�W*��K���=1����"�ga/*gݪ+�}4��֙��q�o8��7�� �3�Ԙ��b����R��V	U��X:#y�,�@�fy��]�ީ�ZH4���p,zpK�HP�GQ?ߥH���&,��a���@M�;m/JP�U���[aI�#\����9 T�۳:��*�u=� �e�+����[�-|MX��[���R®��	��
���L���N8*Ä'�R�,��q��j<�U7#c�B��aqf�cW�q#��m�
s�^G�xTdS���nKN��g4�M�6~M�j3g�@�-�}�p�k*;���4i�y=�Fe�'�����#�����W���aFw�q:�.�6�O�V�K��U�
S<�z1&f����ocaӳ�c:��ͮ1�D:��P��C�k�B.)�Ǘ�^z���Ն�;rT�+��K����6���#�ӛTuam#T�����dv{?P�.�E�K��S��n�t����=f�] �-|d�\c��7JAeWY�[��vV#S-����Ӧv���H+�['Lr�mU��x�����,�Y*��Y��Tp����Tc�P�n�h��`#-���q{ѩ𳑼�b�~�ﻯ%�+Nj7�0#����,G&[�fsC��7���6�6}��a�[1G|�-J��VV��T������V�(� ֝���#%�fX"k���<�hW��m�$7Jy���J#���SL��� �y�zrY��]�b�(��˥�O�+�߱v;0���<;�
�%Z�07�K���݇�Po��f�m��A*�B˱�Q@<�U��+�a�L�3����� q-��3,�D���pL�2`������Y��Y'v�g��e�w��͸�4m������75@�:F�]�f� �V���?�%GuKȋ�@��%�ဦ8�_����/Wח�X���*�Ey�v�^c���T^B�����t����7,�+�����҃�,E��&X/g���+*�K�'��5�ڥ.�ϲ��y�N�?0�A*�Yuϡ�(@���&�2`f~kƿ��nW2U�Q��	}y��;����ݐ6�]B��5�9�K��W!�Uլ����LU���d��Q=P����&�I(-[ ���Ce����+����J�L?��f�KhzGP����j��Π��B�ј�6�N��&S���@�R6V�jg�q���, 
�`�����^��K�'�il��;�f����n�O����՛Q�I��a0L5B��8�b��� �t,"`����60K��bb9u�ob ��Ԭ�h��l������<-��1�]!GAɰ,_�?�t�*&/��=q����.JPy#�����p2f/8�:�&����`pql���h���`w,��xSz�{���{?JdY$sO��p~j����|�Fe7�],�����#Kxc�,�6��;���LS{�V��m&��2�띜�L&���뻞ה{�3���!ˁ�� ��3�q>V	hA��q��'`��|s_�]�e}?���eppp�s���BW���'����߽'�bAO��z�쨄f�����/]�o�1�������,���^�<O�"�{����ۢ��m����[����ͭ__�Ē�Vg�������u{=@�,i6��d���w�I�o��8<>��=.��`+Lu��{*kNo1�F�*����6�
�x��{�G�U����!��Y5���.� է�G�j�&�ϴ�	W򉱪X���"H ��{����� v9Æ[���)��N�1E��D[^Le9�Ч�m@tWV�yY�8ȒZ�U��x3�^@�ֱ��3�2)p��s).(��Ķ��
����a�ۥ��8˱����2�@>���kty$SG�F��Eq)���� R��a�7݌D�Ouz0�ae�rvkX�ꅥ�c���䧍���룻�V
W	xͻ�-��ݗ,G������t3��grb�4@)Cݻ8k�j�3(��pJǙ�z]a��0n=��2'��'�)WY���J��g��t�1
RX2�I�f6avϬQ����[Uq�*�^����߬Re��;0e�_�^6�U�_���X��^o�@o���,*%��m,H;0F0͚�d/��^��_������񏁒,�t%�2qgN�^j,����g��Nk��*^6���[F�o������Y�>zb�ߺ^��~'��1A�)^��`�tK``<���5z���P/a�nK�q�(�����X613v��fi����wx+윰��./��
Ls�Q��%�^	j�d�D��]�j���%�0W'�ΰ�ڱ Tyƻ��&��S��l�*~6�)xV�虺�~3�+�o�j/Ic��[�+ �J0�(zXVW?��G��M�CO���L���v%,�VFw���������
t5�����C��3�=���7�jc�vb�{լ�
o�̳Apv>Ι�+�^��X���Pe���pr��>h�����U�B�@����*ݙvx���~��><qe���>_cc�iaZ�����ov/�1�3Պ�;��#�/�\�.���Y�[��`�X�����@QQT���]d_��w$M8%-��JE�mkl(�4�?    ��q� ͊i� 1�~�� 	�Ѫ����1�H�Vr^��U��K��v�,�����L��ۘ��C��
q�m�(`3������p>�����$v|r��+���(��_m_Jb��=>��;kE[��}��S̻��@q��Ad>f�y?T <�<T���"����X����Z�i'�4-��D��$���4[��û0�rY]8���g���pl���	����/���ȯ1����h~�y���^�/�yC�-maX���zP&)8{<�B� S�x�!�iX�_�]a��=�E�l���X̮��{�����B�9g.����;��5^�b�|Kրa��~?���YgV��@��h��M��P�V����)M���M�
`*,��qCO��}OufB�� V�w�4���-\`��0g�W���r	
;;�2b]ß��&e�y����Nx[
�ts����5�z��S�ƒ��:g��=�' Gd���S�K�>贰�]���t0����R��`y���&��hjaF��g`H_~������j$��n��<Ze��C)���"-G:d+�R^��~���R��[�f�B��z�Ń�N��MCtL_E�m�3��j��tl������@��`8]-�T��a��z�n~��^L(T�B��b��=^drU�y�W7�g���$/+��Æ^	���a�YW�Z�o�A��B���,-_��	�w�>8��/�%yWg���c.Pf���z�����SX`^�6�+�����k�*Ï��JDw13����}�e���x|�~@����j>.��+��e�/�0�~V3�q���ޞ�X��\(��寣�m1-��ȫi�*}l(-ƟܟO�ݧ��,�p?q�/���=߯�X_�Q��=WZs��+�*�	�Ţ��a��D��1}���љ a���275/"�p��+U0�a0��ty�UZ�E\t���F��dN0H2��L_�4+�&]��a:�~=s5�WU��� �_Ţ�[�z���>�PbC�n��ɾ�%��_3C-z�-��_ڌz���ܶ�VSy�b�����)��f��;�V�v�b{��09���K-�HS׵�����3���5^H_�_5a��-ojq<`rŗcY[m�Z��K3��}�~��i�0\��[�ky��Y-���Y]���G��t]��1�H�v�%V���M09������pK|h��P��z�e0�	/d�����eS���`AF����#W�����%�[wb'�]���z0"�j�;1�yJ*�,��6��zv`� �#��'i&�!�Uä=��*�q��k,T6�v����ь0�'���=0�$��Oz6!+����z�"�/_y�2o�U�� ����������"uދ6ֳ�d]���K:}�vs�x����|����� t�G��rCX��Ϧ���70"0|�'���Y��Sa���L��1�mX�b4���+^��1_���ү5齶�'�+����n��D^#���Lw�	��V-��cO��ڀ���n���~]���l �Z�!�N��g#0~��z�'�A�����(���`jWS�L$X���Px��q�~��;9��y��8�m>YO�ؾ&��Yp��xh��3/e�z�FV���x��!(�����`IYZ�J^Ϻ{=�Z1�^cX+��M�%0o�/�'N���aS���HF��&�e1/�޽���X�����i*}����1�����.Lk�Ĳ�Y��C������9�.g^e�f���e{VԿ?ς�g�����*�@�u��
��mv��q��Ƭ�Q�U�_��{R�W�9�-���O�-�E�j�E���z��ߤ.��l�d�ߥz ��>�}6���$���Z�y�V�<z0�V�T�vJ`��q��c]}�������c)����C�x��ؔ�'3M����}h&��,�=��\��٬z�Ne��h��X�n��i`�jH�y(���9y}=Po�h�f����u���,�X��>�{#چJO#{��m�Q��7)Xg�UGoU{ﶳd�<�`؝���y�+eUO��N�3Ś8�=�N�'�͆qβ���Էb�/�(�n���|^�~(s"3 S��X{K?����'[UTF��k�m ��'X��
����Fٙ���O��2S�]�n����f�YW���R���M�Ri�h`�a? L7�u��G���Y�{8s��d�U|O��'�v3��'���t�a�_p���2�����{ژ|���ӵo��V����zª����N�<�	��\�<��l�q�hVɐ��c�nLy�\?wU���u�Q�������~�H��L<�G���o�y�qޡ�T<H8X����K��x6���k�����a�V�hV��
�A�o�$�P秵���=���X�|Ͱ�v������m�v���=���xs��sx��P���=�]��~�%Vr	��iA��+�4�zd|S���o�@4�Q�gQ����z��uLս�#�lj����	��j�u_3A�}�>��)(h�Q�z��0�X�w+�W=Y����p�(ۇ6����d�����T`���ѻ�r�^��{�����2����$�]k�a%��KN��ڣ�E���=���a�Zm#�Zx�M�^��gf+�ȌE�	�Mڴ�K�):a�\��Υ;�y�%��J=O[uh1P������ŉ��V�01�Ҋ]�D�UM�VQt��b�8vOT������&ȕuFUz���1�S�SH�v���:�X�:�`)���p�m�f�(���C�/Hq!�c�JqWӁ�'�1�ĺ�0>� JK�I���81q���;2�.�6]��]�9���߃ռ�*��,a���u$;����n�Uݹ;��<}��)D�m*�(Фдw�u78pg�i��	��ل�<p���fگ���W&�g��{�x�V;,�!��� ��I���\�<2�l㷫����G��X�#(>�ܶmw`�#���8� ͥ��*В����a�]k��������UB�b�����Tp��ɹ���a�A����<�͗]��^���݄4�a�8U�ㇵ|h6�t���j'?�V<�����+^������-��x�g!���z6��l�'�[D��b�*rj-���W%(�דz��ζZ�,��LN��l,��+C��C[��`X�Y�q^�Y%7{yVk�]���g<���)c��"eV�?F��ڜ
v� �NC������c�+���T6�c�U���i�ȣ�⏄]4P��F�]��ϟ+�'��.�F}d����y�b�MP��m��ΏqB0�+�MP� ��Mљ_X�`��/���'˰WO?�I��YY�*<��M�5��$򣚾C���-�&=Z�ʡ�'��� �dW�� ������E�s�a�r5��9;����C�Jґ���Ϳ�=��7i�{o�}e?�%,v�*gq�� �y��*x���x	yc*|�)���aEbx���#ی��;�b#!�uv�t��HhxF��=>������6�5zMT��Vr�/����ָEI8������y���;���0��m{}��~���ќ�*3����WX�6���j�-4A�j:�� ���뺫��(a |?i�r��/��Q?��o�9��O��5�uo��`t�Mo���������mx��]�}�f�(g��r��^�`��y�4��=ν��Q�z����l���Wc]�_g�/�M�"b��*]s�]�ݗ^Q2��	��d7�6ada�g��T���z�~vL���!�M�{�<٥��%b��嬯��E<��-�V���P�K�ɮ��\���d�v4��&H���Luv���Z��E�^nr	 @S�Ι�ЃױjA���������i
�T�9����5��:y��z��_� _�]k��2��K����Y�$���]7@$ ���U��tM,툺���s��̗�3>SYl��<����~�ހ������t])�d��jֿ)������TS<���T��3��R�S�u����͂NE_�W��dfz	Z���1@�Y1OU_�2w����n3S�g�߯��p��    ���Ǯ�!��1��������k�hf0�F��U��q�sx�G����p�����;AgC��N��� ��Nʤ�:^y9Jy��/մ펔������.���.�7��ܻ�XC��d� Sj����&,�߶�n�ڊ�;��$�4���/���
[�O*��	TmV��z5�R��u��`�39�'vխ��m��^X0<q�t�wXQAa*ݝB��d��
��BD��]�0���z��/ո�nN�x��
o��b9�;��z7�ÒFm1��v�:p��տ&��x��T�v�,�8���8A_�s�qw��6xE��L���f,ec��V����^?F_��47'�W9��b�?�|~������55���	=J>�N0��0=�q��8�.hhf�b��9n�q�E��T#7�n��5�[Bi+=���֙0�v� <�Yx�j)�������cãѝ��s�!NM���X�����p5��A%���`�X����\`xt?���ڹ�A����2������5�;��2��T=	[�Q��&�	XqH�-��@AP�v�Jj������x:�b��j��9��C)BM�d��GޘD��g��3ӌ���ͯ�q��8���T��V���vz7��ϳ�T}� �k�?�Z�=��|Tf9��˾tc��v{��7V4By�('[>�6Vf[�[zZp�0^��K5v}��eض}�^�{�C�"K�v��o�qyX�Aw��6���a?'`З��RM�Z�t�e n3B����.1JW����`$v�r
��R�y��_`{Us�؆7�����5*V���U���'��5��9���n�@W���BW�ٵ��k�3-��I��|��IV''���V��J�l�x� ������
W�-R�%�zu�I_�RƘ|��;QL�J ���rYb��d{��F<�9P���}Or�'��	�a� ��:F���f�n��gf38]0H<�Ǌu��V�I@nJYǣ(��f����}�"�W7�Ė�w�9������P���-\������5ت�;�$�A���<����e)�Ge�C��Yu�#���FB}I����J?:�}�֏�2��Κ@u]�Z�?ڽ�� [��<�ǂt��y�͊�7]����tz��2Y|���TsT8�`
�#|�N�(�l�ź��J\��Y���`�({s�%��{�t�1���������Y�L���1Ցa:�u�K,n��JGa��ڊ������D��L������Q�`V�}�XX����Ļ�;��G>�^?H
>>�������z���ve�Վ�g%6�(
T;u�9���F����#$����i��漂r�y%��V�t2��C����a������v�?���/�����t���xp��'&o�S$֣by]�
�#�^ 6��}��x2<l|�lby�;.�K���g��$�΋��M��+���8��U�)�w���W8Xh6w�+�'�ǰ����^��\�����CG���(Q��9`7���x9i1�7Mk�-nȃ5����@��,��X��Y�K?s"�v�B�A�̗Yێ1�@��Wo�j��-��BwnC���ǉx���	8-g���j�z�*�uE�=��r��	I��1(f���g�3�%���5��EX��f�lu�8%[��Y�I9��q��E���)Ex��zA��d���z��cg�W_ud�t�x:v����+hd�Vq�Zx.8;XAJ{?�"h�%�	��-�������\Ξ���q���$�x��*N��V���g<1p��Y5��+�%��W�8��T$�/�,խ�U��U��� �:ִ4��@b,�]:�w�%�4-̺r`D#4���] 0-Z�%�@�ɶq�i1#Y���G>��3�%v��q���ޯ��l��r{���A�ib_��o�PfѢ�l�ڰ�ήHW�("��]9&���^�5Pk���肻6
�D�t�q�<E���FU����2&~h� W�b����ZYM�ɓϊ���OF��Z�� �y	B6��h�u>л��lu��aր�ڢ�B	 ��8`L���z��(}�^}��n��jO�U�a�4���´��Uf�1,qi:� ��o�Ͳ%�q$��ZL�L~r\E�OD�ײ�2���;�]��@ "�d/���v^���B��+mW�Ȥ��aW�C�>��,�}"���8��g�/)՗�º�J��ìv�&y��ã��ޤ��mvp�����X]��͇������怩����ga9E���gk�)��q�'"�<wY^��g�r�B��OT ���}����IwZ-ά��"�K�C�^�hq"z���f�%PE�ޏ&zͅ�����s����!3[v���\�uw?T�.�>�����,�@ȝI�=�,kj�w�c�7;`�\��$���c���Q�|}��7jj��Ų����������6m*9@g1�S�+��S���c��^�}�p�� �n��g�d>x�-^�ˇ�i��]G����z�d^t,;ڛ��@ebU�+b�.bUfqƮr��n����Ȩ�V~�/k�V��au��t>�Y�K�C�~���ܐ%�z��g��� 
f������y����n��o�G��a�r}�L&�����T2�Z��"=?��t�{ؙ6:؃<Y��a͛|a�H:-���+�����ךD���=mOr#�T�g�߳�lJ���S�;(�Z<���I�d�9��Ef�s�����P1׹S�������9!t^�u�Ǔ�s�-�m�������O������������s�#��G���1�e���s6	���|B��ژM6C��{ӥ�|0�a���v�ү�&�$m��)k��x��l?%y�0����Nw"������Kó��A���X	�l�/�T:����s�>mŃ�����6��b�`�z͍��m]���=���݂3V6�ꬵ�5��׏	� �S��-'w���U�a�HLc�i��7�5��
����@54d���w��[q�Kճ�ֶ	z}�J��P=�E� �f�W^��*l#Iܿ*]�v�m��O�'t�vL�2��/��a��茯3������,�
��#���	����uGt֚�K��pA�"�K�]ǖJīz���5|A�ᜫ�d� )B�F��m�d*����e���:ʲ\I�
)��b|Y�~�����<�����hO^�'U��;_���=1�k{D���JSG+����<��EP���A
�Z�{V�1��Uz��^��Hq�<���a{&�De�H����+��rgJEU���)�L�mcv���'�x�-��ɬ�U���@j�8�:1�E��w�;�^��c�V�
�6[��*��#vNU�:z%�v8_��o������N.����4���`�f&O����""	��#�$�@��S�r����xI[��]6˲?[�9�f��K�6ղ&;,��^?���T����^�+�3����{ؖ2}P���:���?w���&RK�n����E�a.�:9�RL����������D����w��Y�jE�.!�L\6W��z<�#��O_�K]*8~Z6!�����isŻ��̧�	��@Qg�~��a}��\�j���Am����|Z���]��5����\wm��z����L�6��Cඝ[#��&>ۀ%���p���,0��X=<幄�Xo��#�O�J���ܴ��ʦq��W���b܀>?�/,�D�K�}�g��@�10W����*��#̋�� O�c���V"��p�\��an������?�������n�F9Ͼ��/�p�ÎQ�`f��>�3<�&l��>�_�=UlY�􂩕�[bb�]}�X�x�s�sl��t�I���Y��nO�5���x8X��c(`"i�����MC�A��GF�,Ix\�ۇLB��N��s�e��&�4��������p��Nβ�NҎ�sl��ק��rw����GFk��9�F!P�!qq~���N������	�i�#ȝ!������et��C\8@,i0\�^U��Xu�!�����n�/2�����d2�5S    'F��/���Q,#�ۻ'������j��5�PCv���pc|�!�W�{ˑ!��Z[yl���#F�L�_9���f�m��>����D2<�"կA ⎯��Z0H��߄xoڟ���W*q���N�\��G�
��c8�͍���3���dk�O�雿^��)�|xv&"��Y��&�r3�L8���ܭgR{�c�{�]�6�u :�C��e��6ߋ���?/�~��}#�G��xx���S$����S�������)�d����L�
����θ������!���,u�^�(O=��e�����L��
�.'7��.8b�>:��r��EyCp���}p��[`���0������&b�(N`���>u���I0X�?��o��x�x�ƒ&C�Ɲ�"U�vFg�������U���K��������:��}o��ǠҞ���a��i9Is�E�邫�of�}���,O& ��׫i�`m��U�PM����)0dה�qCXEj{���(	��~�W�J]5�0{��w��lj��!}�{�����S���Jf�j�W���:����^ϓ,�Ş$�����}��{R �U�rZpk��Z�+6���^���[�5���/���l�
��l���-���,A\����*G<� A�U�Q�oqM�X01m�Xbs��Pi&�s<<�lKk��wU����5�=��aq���	1I��xd�1���K�U������+��W���u�~�|�]����:�_|��s�f�~ ��w##�ܳ$�]�o ���~C��L'	�N��Lh#�b���x��%��H���F�G9WL]re�w@�ڢY.`�Y�<*'62O~!�7������������3;ic���ԡ�6�־L��&�����f�=Ks�q�����(����,Ί� �FR2-lx���]#�z��䙟+��=i��c0�B���t}��gxw�j:����;pd'��EF�s���j���,�:W��_-��V#��9���u�������vd�v
n�R;밃�?�#H�[��Q�n���L߮�$���=���0�����:�2���:'L��N8��N%�%f���͖G�39v��m��M_���l^�Bd���,Α(�U%?*���9���);�w��i��ɢ��l��@#Crp�unۼs X���	�E�+��*�����Y!�T�^1��S�|�)�eѪ'Mc�,���zac|g[+h�~Qn��{�����F o������p�P�|�$��Ņ0�]'cµ�u���]������{�j��b��}��L4�>�V �#Q�0+�Xx�[���	��BE�&��f�%R��/�iܝ�^���8�*�h8pG��a�#V)|[M�70��8_�!�����lV[<��aX鑞`�!cV� ˷���ǵ���K&˒�ڦ�dQ]�LC�&��N�(��g�jx{C�Y��@��x"�8��-��|Z�bm�o�1�ר��T��h��)U]��*��oܕ(��JQmjtm,���Mu����4(��q<7w"�w���xX���z�s)�{n�X�iJw�oT��S'2�T��y�@$��}��z�Q��ǀ�Sv�󽢆p7�.vT'Pd�s�:u6P|mT&��wC�-ށ}TӕB�g{"�o�����m�^�z�}�� ړW3�����3D��A�_�*�NJc3P�L�{���Y�\���B����c����%l�R���6z�q�N�Y�0���z�X������z�ڏʚ�����  �<������]b����s�e.]��o��/w�����K�:B��;�M ����]Vz*��3�(�;��l?C�й&�3����*�z}��~O��:��}�>�F�O�+)G��6����h���H)�����3ǭH����z�XEܙ�MR��'��8dlY��O%[�N@��R�pI6���sI]vo֭ �ۈ��>jvxD1����7���Y�tI�%h����OO�d�~�}v��Ni o�QK����<�}g�QQ��3��=�6����`g��ꄣ�/㤞*�\�H�Y��*�|��C"}~�H�b����[��F��+v���k;z���&���ɩ�S<�)�n���$m;rͥ�f��l��"��xj(e�e�N��/H�=n`D�
�^4zr������,p%����x�G�ڟT}C�lX!�5�n�s�u(��'��Ȩ`''uCP�Z��,,��aa蘭�y�R��A�?a�H%�����6���x{wU����g���-�(�y������D��e�!�؟�y}C۬�'�`��������QńDF��W�](${��O�?,�lwEBi7��	��5Vzw��gu�gt�� �$O�,t�^���L1��6{��|�M�%�\j#'�O�R��ㄽ4���lr�XXH��SG�i��`��fkO-�J��I�v}�z�R����cfQ�&�b��U�1I¨�!�V�.�XI��Nʼc�΅��?����\#aϤ%I�"[�C���`k���Şc����9~[{��o�<�Y0Q�m�_G��m��I*>��v�Ɗ���8sLnNG�9]� Vom����iu�Ń��I��k��ïx���*[�ﯿ�6�f�<�}��7��]Ȏ�cn{��q���~3h����y�S��F�e����>�&���;��L��_[H��=��ϕ~C�P�6��	�����X���츰"zk_k���N�T�Ƙim�#.r����ahf8N��sU)�����X|M������ �RdQ�(0yk9�N!�l��IJ�F�f�4컸vb�{yw���#�&�WK �T�x�e��!(!�0� ✚@��_`2�����0�o��:)�DJ�>nه.��]W����]:҇-��;iE���/U�/e۫��\�����(�3N�{��
��7����F�b
(���/]���P
��[�>"(�e����MB\U�v��:dR7 �K����L3U��(��>o ���(�z�o���^���ENSG/��=˗1T}9��y��"ؚ;N]�M��h0;��԰?�w�µ%e<&��&��G�Q0u���m6HL�?��M~�` [���x��mj���U���Sg�|Į㟙E�z�\�fߦ���1��H��Y�$OÔL����ͪ	C%�E0>���PƗ����������>�m%K ���L��>�͂�c �E��z/9��:�}A�7��Og����X�Ԧ^6��k�\P�[p,����k��BY~#����7��ݱez��dj+vv�����
K$��N^�\��#}F��U)��1=7u�'"�g��LYL;@8��ST���K��U��Ε:�����2���[FB/�w�K��@��J���)a����s�5�"�����?0��xW�(��g�*�ӱ|A��n��Ej	�y|�(��?�����Pt�MZ=%�j� �eĞW�抓x�)Y�E�|?�h�O�MD�ʿ�I7�V��~,�P�g��	�]�i7�"��s昰�>+t�m���>���m�f�A�����pY�p�c9����vC��N�:����,/l�%׀oo��&����l����BO�1���(V��p��ٳ�k��aM�j����H��*6�72��J/�:Ҝ}D��!��V�	�Z����:>�0&ѩ����cj}��y?���2���Atg��1"��gu7l<�$�>]�o�O�EK��<��Aa�Rw�����"*�d�o��J����]����.	�������_�������x`m�0�Pȧ0t��s�r��r�
��$z����v[�ԅ�ьO���I ���tW�ʌ�WE�7}LxB@[,a�}�!í�k:Hu���#���k�7ξH���|GA0߆T��}�L�z+� a=|���tc�ap���Y`�#���,�1\���MwFֳ/�c�1Y�����ET%@�O/���h�>���{xb�\��^����ힶ����6��XA��t"d�ᏽ�d˃�g�"Fv�^�C�T2c��c���͌��    %�Y~X8������W`g��afD�!e)�]`K����X��W��jE��5ڌ�*��@�V��<K������|,,�a�ǘW|�9E"g����I�b���&TU}���["m. ��>�o.0�{L�Ȱ;T�	O���E.�*�0�<=l�^1#�9�@{=O����~/X�s)�?@&�`r���ϖG)D��l��J��YD�LY}�D2<��~�J��L���_TI����ʤ@�ڽ��[aE�����̾N�k0t�*���$����7��`"X�
��h! �B<S�k�ް��19?�̣�)	>��ZH���$C<m�]H��:�$:k���xu=Ŧ � �I��P����U��A�h�
�T.�2� �S��s�D��iu\��}��<�A*m���>!�b����TD�k-�0I�}r�+��5��9'j��A���p9�x�Y� ������z*�a�g��^���U�O�g�u(w�8�AKD`c��=L���qA���A�S�å��R��	S��3!�q��ò�y��U����4���>+���~lo��wu��k;��᰽�&��L7b�n�`ȠD�e]')}�Xsb߇��BZC��`-%mM����l@p�29�f�̵m�� �)�]Wp���E�gaG���T�3���v*g3m��&}��6<��-v5�z,4&֓��A!�|�̓p(�g�����sFU{bX�ʪ<#u9ٺ��p��X>���`r�=�N�g|�#�\���(����@G7S�vc�i������V�jB�C���]�(j��|\�),#���ã�>ٝ��^o��.3I�|�2�oTt��g�n.va,�{�j7(X*]wֿy��n�N��ބ�;w���뽈��ָ��#I&��^H�������E�� b�4�ut�ٓd�+�_��g�c��a�GԌ�m��k�i���<�gx��+�!���z�"�YK&�S��C]���/V:Ϩ�3����Yͳ�e�OW���:��X���Мx�0~�r� �"Ү�}�2=��U�}O���8���6��n��Z�E�O�9���gf6#p��-'.�h�\����Үy"�:�>DDv��K���`�n咾voT���E������s��~��H��}?�B:�lu7{����c�م�b�
�L�w�]�Ņ	a�]�,���}7�9�A���ׂZ�Y�6z�����<��o6zEʞ}h��ń�W�{�M��=��8���b�D	JW��	�fb�w9�q���.�D�VW��Wl��
�7�:d�B���ȋ��-N�q��'plpQ���#D_��J-d�{[��pPqj���  l���5�Y�Hd�_/�#hy�=`��ܔ��b�1Ʒ�N�`O�y�=||�m`H�Q�B�4�X�CTb���������A	%x�@iy��FB�{sq}D�x��p�]��.<۔n5��b��g��"yO��,v�BX9��i ��I�>"f��<�����".w��l���odZb���C�M*,RnJ����<�'�&+�ZRhp$���>xX
�#x������uJ� �mIr8'-�*��Q[{
]�q�1ۡ�ј�[�h
`Ic���n8&�H���x'�Ŕ��M,�a�;�P���(Dv�e��^�]g}<�C�V�dM��{*�R?ڮ��8}<��)��{?Lz��7������#��upL}Kzy�p�-%T\<�VO>���/��0t��$�`��,�m�5����n����ӥoT%�M�����i��p,�غ���-Sa�]�[��!��mJ��%������au�
�!��ƹ������d�Rf��'7�NS��XF� |�x�C���f��3��{��_1Sh������*��j��r��f�n�����>/�0�]� p�������b�X`j��nZ�''v]mn1�A�G˚��I�p���d�V[��I�3���$���@ڹn	6f�{ݏT8B�v0Aj�\{a͏`$����߻��l9Y�2y,�NEێ�0"�޿ bff:��l�������O�K8�������8Z�]�{�.�c�Z���?�R����Ou����6�ɱ,��E��5xT]���&u���f����p��k���	�?_���X�Ь۫�<F+R��
Gp�dl��ۦ�F��g�g�a�$�HX���v �s�v�4Y��F��x��&fe	����"�7Zb���+Q0�=�G��փ���w�xRaZۦ��M����s0���՟��Z
*���|�
�$�ue�k�@ ���ϋ�5@�Ǔf�����G����w�T\?y�<'���&���}d��+�]5��3�>+�MqJ�R��0+�&-��_D!�-�0Y�E�iR�7��`i,��}�r��#6`��9�q���L��
�+�վ�%�ʡO�7�7�M.�͙�y��Ye��:����c@Od��rv�EYa���SL${��uì�.�Xt�%�Hi��ӟ�#���Eݟ�n��/�<ډ�n�9���[�%���b/�ݠ�(|������:E���n�9�����rKi@6�Vx��1�l������9�-�����T(M�5r���Å��q�҈ac�U����Lϸ�NX:��X�-R��8�z��: ��}�ř	���ؽ�H���#�����b%��c�ى�h���	,E�ط21�����m�	:o,5W�-�k�\2���1�Z�B݊fF��Y>%�~�������<�	���/W�{�Or��gw9>xz�� �cBr��Bԍ�����1�mS�5�bt����l��l}������<p��^TFiG�	�'��{�	����Kg���a�5�.���?>���bƎw\�
�/Np4�\j�N@tXS�9ZDe�/��k�ꏽ��_X`"��ɣ$��~��dΝ4�l0`!�����e�~�1,��&�$	��o��l������^X�Whn�ހ��<��\�H]��2(R����]߈�ة��J�b��Ii݀�-k�3y�%T����r��-}t9����1W'#��K�͆�H%qu}f��{с��p�����τ����]:��2sR:��W�7Y�Z�&a(�b |�>P�^����34)e�P��5��t`�x��8Bs���RE�zQ�B�fc��_��Ui��:�S�����en^$O��#��P�p��99�3�Z�w���J�����7"q����u��ln-`�v��8?�fjz}�v��'�N%��RD�u�A�d�O$s��d�&�k�(��j�����5^�Br��?�����0�ƽf��k�ݦj��g���3gxr:���5l'*q��Ljd�M(����s�'
���<�+��F\�2owG]�3��#8ǧ�mP�E�������� �i�������%&5��d�Dr�f�ٖT�c�)$�!S\Q��c�A�U;q�����qHI��j`YO�k�?�7|K�$:���p�{�� (m���^E��|(�Γ�Bk-�uX��ʭ�y���4 ����������y#��l�&)�2}��8����!szV$�Ѥ�T`�%��ǠBYw�|X����y��1�D�}��F\�2o��,�2{΍?�OI>L�H3w���2��>�C�	Z���N�h�X�������%��d3��㧓�?��v�3%L���Y��n4�6����=<�i��h'{���xksn�j���A�Q�ν����-O/X��A�J�[e���Xa����~,�q�(�f�[�^/�Q�4
�X��A�1����f�]�yPY[��<��e��SJ������?>�O0Ǔ���= ֲG���"i!��-:���%��I��/�]�xz���:!���V+0����]�V��s*�j��7ϋ#�����oO[��vg~�Sǫ)����~>9Ra�(E�x��l���]T+��7���~OzMҍ���	����R���E�G��^��m�;��H�avرR�\vܼ;���;-!lA�*���Zw��X:RBly��N-���t���4����K6R+P    �K���{v�|��c��>qm�h׃ɻ�iS��DٸK�i~�zi��A�3&�mt�������~|�R�n7R��E��A{��7?��W���[����=�e�����uXe���X��x��G�*�-����w���,DN��%�ɜ�J�����BT�3� �f�!�Y^(���ވuvX�������g�&ڗ��zVZd֭+e��Dt���N�:������JI-
/�[��^on�Q����c��ٔ\�<>���6��R:<���X-Cmӡ#F�c��u����^ZW���H�jӳ1�æ�b�D��z�-_?(��*_Tqo䎴Y���&��$DTRl�9����|���2��^������Ks,�ٗ.�L�����Zr*��"���N�?��$G]b{�Skv��u]��ɔݢ�Q1�J��Kt7�`�E�*�%�+�ķ��T��.VJ�8�Bt$����52�\k��hLL�}�?F��@���:�;���m�_��?-�ys�<L!��e�7�a`T!2zX�1o��o�5U՞{��7�-J���q3���� ��Z��ˮ�������UB0b�xTB0㤖|T	kxY�&0�^0�����#�D�Ƣ��O~s��E�9��5�=����\�/#zO�tkMV䨹Yi�|9u6���Ź�)��>!Z=f�)��o�S���_��3��SD�iC��H���������c�xr�5����;2�|�Я�\a����>��$�����st�B�e�p���IU@٬�F�eg�/m�˩*������ܦZy�*7��F�!J�-��  ��	���&5��[9�F)�<�J֡b1���,���D�C~8�n��d�b�%iP��U�S�U0�F$���X�l�_?-�����d�>�'?ˇ�����[*�������N6�M;�y����2����X�ͱ���#�X@����t& �[IGxo2�|���E��m�٫�WE�v>5\O��B�9�&�y���R��3S��R�Q+�Sۓ3�d��OE�W.`��ܯ��?j5)��'O�/�M��̩m���� t_(7��{��\��]_����jc� p/�]�ӝ�wK�q��u��T=kHTP5er%^9�X�GV� �}� 2ې�������S��P>J��Υ?�x0+��$	M-0 �:�"�܉���9�2v�0_�Y<���XA@�z3��,��3�3��X1��ŮY'��l2�t��>U��o�������}��L���Z�
�e)��q��1fX����iv#=K��s�x�ɋ��z�s�s��T���p�Q �O5�*��	C�� �m�L}�q���m:y�|zlB"� b�n̘����ҩ?@�/��aŋpѸM=+�bQA�]�S�K������+������}�0�_��"�g�56("o��a����ڶ���u��ҍ �]�JW�膆H�Q�:�:�3��ǭ¤��t�K ��]��xG�i��V����+�㰵���oU^cr`�J�c%�5Ev� 	ɤݹ&B�1�*�-p'�"m�����-���a�S��X*%R��e��h�q	�P�o] �����52#�sj�t�~�#�[��E[�bVc�W6z�;�:Wv��	 �-f:~�{e�V
U�������bZX�36Ӑ~��cZe�g� �	��@�pE-<W���R,����`}#��`A�a��h��Ѫ�~3�{j�>�eE�C�z�{�jV� ,�~zt:L����d���^��R���z������F�ET�][v}�&���}X����l�/�%�Y�����F��|����T�8��9@���?���$3����-=ʁ����f���嬮�Pd�n��&w!��Y��v���[� ���
6})_k�/���������v&щ�hf��|�둭�|8�NKJ?��#I��t �kQ�����{�I��!��E��l�?$C�'LOf��S�ȖYU#:��#e4�Yg5W��dQt�<�GxZ���������̭�7P'b���=�p	����	A���_xu��X�Oj���9�+J���N-7�D97^��mD?��aaf�9G\vα#Jb�%�9H����)��ǿosa�Y�e^��Z��v>m�2�+�
S�W��H��3�m�[���˖���X�ekc,D�U�J_���W�nc�M����g݊���C�7w�+�o�����6��&�_�%�2��P�o�X���iV�[��RH�|O^��>�R�f]%�7E����֢jS�|!��v�v��k)~�T��R���;Б�#��0y�Ƨu���&qi���B�b��L�a3H�25E��U+|�[��k�Y���i6�Ӥ�˽�p������'UN�S-7vf��,�\,9���N�K�<f���z�}�YK�ĕ��Ky$6�$�����{xߌŪL�Yp(M<;'�J?�wr�O*�I{�`�-�A�#��x9�z[^� �!Y�MoA<�;3@�C����i?>y����69>7���Y��Y�?���p�l;���l�)�a�-��Ϲ;��l�E����\��8��?��j�����hK����Ae�C�S��Q�oM�y'����ŧ^�R��a�'��fUI��4�0!�A��Sm��o�H��)�!����w�0��Xk_੩߬�4��ܟ��.�}�,V<�˗��ꖧ�$��Dp�a��d����m��`��o`�Ss��sN�o����o�SK����`�9��b���>B�q����� ����:����wD�^��mo��,�6y���J�ˀ��w�������5U��s��(a� �J9�<�s�xR� I��Y����Tn;��ٹ�� ����zm�J�<����wp��S�k���aj�򫋶2�FT
�~*�yH�/�&�_�ы�+��}�C.x	�n�:�5�ͮ�!�qHT �.F��ܟ�8�NG%�����}�/��S�׳dF�f��gl���[5*�D��#�/{�s��z��yX�a��	X�Pۄ�gc)�g�6��tD��`K��\ǟv6cdn���gQ
�s��7�yyp*����]�!bM�%� ��CM��͆�5k�:v.�b-��!�ţo~ȴ�Ұ���$۔b8������X���E�[�
O���A�'���^bu��Ǹx�f�/����.-7��\!'٨F�3����>3���)��(����v��S`�;w�b����g�c�5� s�u����*z�>!��T�I>�;�;p�Q�`�N��X�s=�y�Ɯ�����k�\g�H�ue���i����;a|�+f�b!#bd{���x�i��Y�N����cŴ�Z �f R?�w�;ޘ/������1N�e7�|t� �������=����E�{���� tApi����<-�FX�Φ�9��u$�#�����t���tps�^w����ם�����C��T�s�=���KXػ��5:W@34Hk��(��Ȏ���-�� ��]��ʂEd��z:���)�B����M��N��i���͉=��N�o �9��X�cʓ�*�]���*� ��ҫ��&�,��*��V~q���a�8æ�� ����(e��Q� ��4�fݹ~��ˎ{���锢��BN�}S!̤R*��]�M�<�?�R���h��`�1:i��}3z�����ި>L�U��IPc��2O��`ر�")҅ߊ���S�0c�=���<7�����C8��M�Qzm�C�v�G��qm�ݐ�pa��솒�0yY��ʃ2��Z�E�9��Nf>7��|�_��>�4W�xl����4�e��?�,�$T�iZ%__��&Da�n����\�,j��6����P�pu�������S��Y�O��DZV[\�|ٚ�	�Ö�C�8+��^Y���٘>�}��o�w��9x�u��v L��4q8O_���{／[z`A�r��>I㌫[r��ѯ��d,��EN��N�� ؾ��xOn3�l���g� ��<7Oݚ��@Es���xn
����{��t���k<��T��Kir���Q�    ��a�%���3fx	\;^a4�wa/��=�ٜ�W؉�Er���A�2[ ~G�>[�+R��'�}���,OY;����&�%�����2��x�ZǴ���� �;�>����YB\l�4$��
O��&�wj���_��������b���+�XG��g���wg�b��[T��0f��+�oa$2��(sl����������ׯ�^��,L~)�XL9��#�öfMszT��߶�w���.���f/Fn��$� [:K%�^�=�j*��\��a7�F�a�#p��q�
�?��)� �hA)sJ�A�ƋJ2�g�����5��a���K�j �0f����s���2Ev�LM�İ�$����v�"���1��;�s�_S�l }	q�-.�"r�Q��-�Rŝ�_��FU\.d�Oe���>?:�u�>7o�Fu���/�ɷQF��N�z�^�F�GD�^پ~g�vD5"�Ľ`�b�P[2m����%��I����q�\�n%\I&����4r�7ʈ�J �p�A�?Vi�q��	K�)���k;��?K"S�D@m	�]yv���gk�@�&n\�XG�;�(���/��t31�g�hG
���i���P;k7��r�O��V*`:��VikDR��0�:(~t+g�E��j���D�l�sWA�6�T�����I�w�x{��e-�$��(�Q��|�J����!�2B�����K/����fZ����F�Q�m�����'���ׁ���H�zt^�W��t(�V}��/�v�s�$۩0~���.ɂV&l.�?��zwY��$:9��uD�Eӓa����/*#pL��+�=C�o�!-��0A����(�#4�� w��>+��u�z�<�H&m�Ҁ�N񕭾BT��>/a�*V[~�}�l�چ��Q�pˢ!r����,��*Y|��Yj`��D��"�K��0������7�E�����y5&bC����3Qr���a7���珰�6�ϩy{�l�z����u��҆ט"��4L�l?{=�O��l��ߜ-���ϫ�qrW�G���IbT�R��?�y��2�W_��^����\�H�pe���RɃ�A�-�8�A� �R�d�a�X~�#��A��s��FYS��؝�{�Mlt��U�=X~��*�����!����T.'�>Wa����V�w�R��
��%�d��~$�Vz�hW�R�`�6,y��]�x�_����AY+��;���XK�a���5}��)�q=��q�<'/�J�����ކz�?�s�ae���_(s>�����l��\��=�=�ڗy�c�\<�xJ�7��V�Gڂ�#����!��(7���M�7���F�5�@��*�Ł��L�a��#�,I4��!�
��]Z\p� �>�}��hU�		"��H2,Q�x��B�� �zco`���S�L���$����n����X��xM��ovߧu�^o��!�y
�"��Sx�|������`���W�W��+��'��\[�5!XD���PSK��0��������q�ϲ�"��/`�Ɋk���9�z=��7�����[��u�W�H�s`3�q9�W���N�z��"6���7�ǭ���-U������l�?b���O[��� 7����QnT��t
�=��0iX����F/�s��b��ǿQ.��Pb�&`�ی��Z�79X��+%5�<�&��S.Z�9����^�}�h��w��4��p��t�"���
��-R�`&Y��SX{�:(����>P3^�L+��+{�֕~�7�y*�<v�>��l-rq<�>���"��>�=��J�)ko��Dz۩���Fd
,T�_*v�> �=١���W�~0�e0)T�! ������s��xf7|����aY��d��듍�ē�9������?0�E��(��1H�p���H@��t� ���{�u�P���g��̆�s����{���>����[v���ry���3���'X�	G%���8�wZ�O�c�J_�hGeX��|�/0�q�g� 7��W���zW�����!~�۞�8�]~�����l��#K���N���Βl+N��wk���V;�Oi�[�4鍲� �/���h��������
�C?�;�`�ՙ.�� Z�_������J����贕�O��q)(1�}�03�3����^�(�|E�񽕚��ʤyRrmI�����)9Y��HR�������y��-�fx���z@��w����<�K�_���֞î>��l�d v�V��_��n����E�׼�P�b_���=��O�����2ko�����9�Uv�>V��\d���^���2`��^����(C-��`uc����]�,g�7˰��ׄ�QBtɯ ڇӹ�4�V`S�!�Mb[������ ��o��6�)$����Z���;��'���/��}��$�r"��@*����,�&"���6��
�9 :Ү�`U��͞�Ǯ�t�,�0�Y�B�o���K�$��)c�u�c�����z��?�����=�`U�Xk��.�4ӄ��/���.���,�)R^�ˡ˃r�����}��W�	I� �b��k����Nm!V�[V/�l�ca�5����p��9{}8�B�cM��&�}��xl��
',|�ٞ���[��Za��u��B�:M��}$t���3Ś��*�ON������_�㽽>U�Z���J�)�a�D���ez���)� �:�/���Ѽ��|F� ��h�]��S��gt~�����$���Z,��R7�M�,�����y��an~�vM%���̗G�"��5+��Y�̵�i �p��\V����u��qn�쩤�$g�Zj (x4���$����X�@����٠��*{>�{�J"�1!|@�w�8IK|1�����?�dN��D�߈����V�E�r�<6��b�0nl(�+cY��"�vVv�.��%MYD�'jP[U8���m	�l1,㧬�7
n�$OE:; ��� K�K���.���cO��ߖ�wQ�o\^�~��ؘ��% 0�p��e���<��{o������ט|��$C�����%�R��>㿨�����|��5�5Z'�������{��H�0�@�6o3�ۊ����s�l6��(�g`á��{/����8�:�|n"_+k�A� �_�iӖ-/Vɳ%����N ���b��Q��^�pB<{K@�#J�8�QU<���^˧��/֝��3��Fx��.��؝�T�_�;9����_�'I��GaV��G0���B�ף�.V��/3c�C��D�}Oi���n^�i`�cI��u2���N��>bq�m�3�Ht�A,��Ɠv7��������1<ΰ+)�#By��/��J�h��<m�m���f���9y���_�kxyrS�� ۵ƞ����	��_�zX��{�ҟ�LՉd_��������67���`��;2OmEY	����O$����1X�]�)� �A��T��QjVyP�~?��N� �f*7��yzx��%&�v6��(��c�+<�	�������]�g����\��Y��ė6r'l�?�49��WM��l�]��k�@������Ý{�W��^������eZ�O�i-�����.�)~z�!�E5��,����s�Vlx�U��<l������W*s�?���PC�~��t׏qz��$ێ��"M���v�Z�+���v�jw9�W��L8���Z���'��I�O�NF�����Ի���7_���|�I�0���(G�8��h�!H����n��}�J��~'�^(A�#,Fޗ[��r�y��;ߌIR6,����+tx��� �u�YOq6�1���%�J#�*3$ �^��"���_x�5�Ăƾ!@���x��C_˰�Y��~v��1�X��Zn�5�_�=�J�wu�}��X��\���y��H��}>��6�7Γ��C9R{�5CQ�-[�T�ҹ�L�m,�n��˖vn����c$C+�ٴA���N�?����������-;xͼ��}ֆ��Y��#��Ѥ����f;��j�b���nèd    �,(+�۟���t��y���V t��Sz$�\UAE��9�q����ͯ�V.{U����x�e~ iܢ��{RV_>�3�ǯ�@��+X��=K�3_�L�OLp��p涁(��*�>1Ϫ��
�`>�ɬ�Hލ��F���2Ű	y�x��������J��mfMz|�!;��N�y�K~)����x$�i�
y�[X�D*+���%xD�`H�*��s �������h��o���~,;�t�E��>�yOHQ��ovs��%��mv�i�Nc��T*�Gᎌ@\K�����8�L��^z|{����ֆ�I�0�^�l���#�O�蓲�8���� ���-ۚ��b4%��*6B��1PB�,3=�+�d6W~����A`%vН2��]?y���厕���:;�O�z�u��b~Ȋ���e�F��>���$E"?�{)][ɇ�4q^�Ş�"��?�}?�q\�U�>���B�'���R���Z��$X�P���E]���������n������"�m����:��ş=�ߦ��~���U�����ޟ#�>���Kt�@�5��׻��rKZ�uRܱ���#�~��	�E,V�\_����Y�p���I�������\�KN�#�B)�����������ȼn�G�u�_�ESwq�li���O�[��#Rt�̉=�,zV������w�M^�ʱ�1mty�N��c�w,��`bf;?���T&�(Eh���56�X�[}c�,і�Z�f��1��l��H��g���\���W3̇�Ï���[��!�th�Ó�0bh�f܊�I����\�ộN��&�M������	_5�_��cd�^,����}�Z��+S
3�
i��Z����[&����x��ǭO������P���#��c���o��f�]/�6� R���Ϧ����\��(�������.���&E>\w��Q5!?I,f#����I�Ǳ��N�K�c���>߳wv�[���4}��ŀ���Ť�RsTA�:��_��?���.斝��༣R��P]#M��������棳���i�)��ج���0������̎a�>�9Xi��Y+_%���.��o�/�����&c���B�T��("iG����x��#���'l7q����,~��W�9�l ��O�t1X�9�ֿi�7��0U�2O���%Ǡ�?�QaN���Z�ek�E�U׾w��z����\$��W�Uk���J��*�p7�ͧlc�Nι8걻�^����zh,*��T�9a�/O����>/$ `��H��y��v�̦��#�6��8�
u��E��:_i�K��{���I6{�_�e+�,���Tx��h�X��ϯ�{��I,�/n��%�X-O�>�Z��(.kA ���'�����Xe�3ґ+��6���Vp�Z�;�*�P1F�;b?e���M_�t�*�%P���(�Oi�1��[����:ĖxE�<�g���?M�0�����yC�/���lJ2�����UӰ�$y�>m�x6U#�y
�`Z)M�������(!�K�`�ũ3;d�@�?�����N]�]2��_az&ԇ�k��������k��(������P%5����.!�OO���h����c�g�d9�����u��C��o<%<#�gXc�������;�U/�����O:�m?�]:�|UH��3��
��h
w����!�E��%�0 ^���q��a%)o��_*"�Ȣ��z� �l�+J%#Č�}������"ä:�X�&��V&���=����(0[�al7
!F���uo��}#�t������bptqdP���)`�#^t��i���<M!��#	��I�هi	�����>QTK1-��=�6��q�J�i{>����k��P�چ���]�Y�>���6��_�4��Ik��n�⢥>{w��`1�����N�6�x�̆�8�s}񀧑��wE]�s�RQ�Ƣ�]}!���M�l�w�������R��0�+;���5y<��Pt&Wx\����b�W:��_�v{��^��q����/MJ�'q�nh-�V��K�@u0�L��@�7`�1�LG��f����l�����9	�s/Uē95lo�=�DJܷ��xj8�~���{ϥ8�]�� �A�3��.̮�*)�ĪWp�w{��`퍼I���c�P*�{�����5Z�N�$�-{k�O_�$�}��.�i���O�TŇ���C�1j�;�Z�����޶ʃ�+N�A�qߔE!O'JRl?�r��\Ǌ�k���L5��,/v�f��M�{��=xb��~8�'��# K,����f����F|]�ݵ�~
�u��k��כ�Æ��#���U `��Y��������l0�	���Ú�u��.��ː�Z��+n]gc ����F��`C�X�_ٔ���ވN�̧��Gl)�=�u`�����z�|�����3�/p�-����XcF�<'EF�8�}%��b�v��t�ًp.�;���I���ajq �dڹ�b�G�Qo����)'��j~a��3	S���3k�ӱ���]�s����C0%�&�l:����5od�S�Ev�c�%��p��r4{<��:�^��~d�r�!Q$��g�cW8G,\�72���G�����oZ.c�mR�8ƻ��3{T�J�{�q���3�S a�,�E���n�V�IR�E�6�u��:ڮ:�n>Ⓞ�#�����m
�h~*'m6,��?R!Qt�k����_����f��![�����}^u��
���u���p��92���(c���f���|�o��F��?VF�X�M�S�RF�e{��a��%����Pe!^A4��-�Hu�����s0��\��s{�P2�u`�Dj�}^/�QP��D�c�E�~�O���s�F�B�?�I D �ZN\�[����z���_#�'5(�'����D<�`�T7r�R�����a�W^ m ��j�M #m}r�m�y~)5ro�1�PD�H����/���dSH>Ȳ�͗������X��À{߂�O��k�u��@���S3�W��H/c<�BԪ��
�Ƣ��Ȧ��~}��4�`9_%�昴.P��� 2Z# r!�d�Y������=<p���b�C})��lQcɵ�pY��?��/�+��4]���Ij
N����
b{��V��}_��~_�n��(FvXD�0m�g�{$��Hڏ�3?���0d<x���z�@�����5���
���~Ol�L-�K��{ԃ	��$�~�Ȟu}����,���F��	>/�tʓ�1�\���W$��(�D��v�����z�C�6a��k�,;}�<�T׏y��t��}��d+e��|�F����w@'��l1b�������H�v���9��CeL�VD;<�FfT���)f���@�}l��~*�-u}�Hmy��i{��z���x�������Nd�0�~����ëmP�Έ�ۭ�>���߷{�En�p	�c��qh��{j`�~��!�����g|E��)5'��ǻZ��7��z>p��p3������2)c��Mj\�ݿ���W��C*�$��v��P�.�ƶϓs��R�O��y��JAۼBb���ߙT�t$"�2�:᝺�H�:eL~�����B�Ęt����ߞȒ�}���dp<o����I�"��t����T��"\RZ�)Թ�U��O�V�>׽���x�>�ۑ��)��:���������6V�ux�H	t	=����.�W�_������H�������MY��P:���4N����;�(5�#��q*�_��`�X̅=E~4� i��B)�h��\=/W%��1�����}4i�Gy�
�؁���}XN��9�:�-���D��� hEW��n��HAdK�I�(�&s�]��0摩Z+����;���kDC�"���N���f�0��n|���[��~{�7L��Ja�P߹�q)���m}�� (b����R���ϻ�E`�37E���F �:Kd���,��� 1�:M� x  ��{�ߟv��Y'e`6�e�@��3c�xēc������ۮĒe�i�����Wq�oĪ�DĶ? �\s����,�����������f���{��X}B#�h�35v4R8����տ=�{DD�ᯜ��F@�Gy�8�/��(�L���7�~Ck�υ���|? 'vş=�$�EDgd�<pn�+�J���YE/BM2H/
���~_v��1�
������H��CW0�Qaq�l� ���y~��&��� 㒤�\>h�0���gv?�[]$V�F�Z�o�`��P[�k�XÃť}�O��υ��c��%�L'm t#�C�	�Cz��{�Rڦ�#�i��s$��J�F�M���R�b��W-���j�y&�r �f��&Di�0��į���<�\n��#�7����o�1b��c���2�h�Dd�~�ڏ�Q�adU�S �������K���T ��|7������ '0��N�!�
8���.e譢�_�S�"Eه]|�Nt�sa�Ri!���k�`qe���27l�����B[��d ���^����� i��J��Z�)��q^: �ǇGІ?Ȧ�s�"�O������������?���            x�3�t,K��LI�2�*M����� ?3         	  x�5�;nB1����4��x�)�DY@�y��J����?%��N���^�\��㦏�����_�}^|,z��r�[z{�xM.��iH�ʡ����q��8`�rVj�<3Mj�FɕJLuA*Ü8��ɴ����Յ����bt�(e@���j:�ݖq�߻^��i=���E���+�!ҡJ�nu�7�!m���X&q���y�٘���m�k�{���g���0��<W��̄�����kXU�ܷ��)����&�<�v���j�            x������ � �            x������ � �     