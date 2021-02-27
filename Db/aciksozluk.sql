/*
 Navicat Premium Data Transfer

 Source Server         : aciksozluk
 Source Server Type    : PostgreSQL
 Source Server Version : 130002
 Source Host           : 0.0.0.0:5432
 Source Catalog        : aciksozluk
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130002
 File Encoding         : 65001

 Date: 27/02/2021 23:48:48
*/


-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."users_id_seq" OWNER TO "aciksozluk";

-- ----------------------------
-- Table structure for Dictionary
-- ----------------------------
DROP TABLE IF EXISTS "public"."Dictionary";
CREATE TABLE "public"."Dictionary" (
  "id" int4 NOT NULL,
  "word" text COLLATE "pg_catalog"."default" NOT NULL,
  "history" text COLLATE "pg_catalog"."default",
  "origin" text COLLATE "pg_catalog"."default",
  "annotation" text COLLATE "pg_catalog"."default",
  "similars" text COLLATE "pg_catalog"."default",
  "pronunciation" text COLLATE "pg_catalog"."default",
  "aproved" bool NOT NULL,
  "creationAt" date NOT NULL,
  "updateAt" date NOT NULL,
  "approvedAt" date,
  "approvedUser" int4 NOT NULL
)
;
ALTER TABLE "public"."Dictionary" OWNER TO "aciksozluk";

-- ----------------------------
-- Records of Dictionary
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."Roles";
CREATE TABLE "public"."Roles" (
  "id" int4 NOT NULL,
  "role_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "createdAt" date NOT NULL,
  "updatedAt" date NOT NULL
)
;
ALTER TABLE "public"."Roles" OWNER TO "aciksozluk";

-- ----------------------------
-- Records of Roles
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS "public"."Users";
CREATE TABLE "public"."Users" (
  "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "role" bool NOT NULL,
  "createdAt" date NOT NULL,
  "updatedAt" date NOT NULL
)
;
ALTER TABLE "public"."Users" OWNER TO "aciksozluk";

-- ----------------------------
-- Records of Users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."Users"."id";
SELECT setval('"public"."users_id_seq"', 2, false);

-- ----------------------------
-- Indexes structure for table Dictionary
-- ----------------------------
CREATE UNIQUE INDEX "word" ON "public"."Dictionary" USING btree (
  "word" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table Dictionary
-- ----------------------------
ALTER TABLE "public"."Dictionary" ADD CONSTRAINT "dictionary_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table Roles
-- ----------------------------
CREATE UNIQUE INDEX "role_name" ON "public"."Roles" USING btree (
  "role_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table Roles
-- ----------------------------
ALTER TABLE "public"."Roles" ADD CONSTRAINT "Roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table Users
-- ----------------------------
CREATE UNIQUE INDEX "email" ON "public"."Users" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "username" ON "public"."Users" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE "public"."Users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
