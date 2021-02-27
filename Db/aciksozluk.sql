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

 Date: 27/02/2021 20:50:32
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
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS "public"."dictionary";
CREATE TABLE "public"."dictionary" (
  "id" int4 NOT NULL,
  "word" text COLLATE "pg_catalog"."default" NOT NULL,
  "history" text COLLATE "pg_catalog"."default",
  "origin" text COLLATE "pg_catalog"."default",
  "annotation" text COLLATE "pg_catalog"."default",
  "similars" text COLLATE "pg_catalog"."default",
  "pronunciation" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."dictionary" OWNER TO "aciksozluk";

-- ----------------------------
-- Records of dictionary
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."users" OWNER TO "aciksozluk";

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 2, false);

-- ----------------------------
-- Indexes structure for table dictionary
-- ----------------------------
CREATE UNIQUE INDEX "word" ON "public"."dictionary" USING btree (
  "word" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table dictionary
-- ----------------------------
ALTER TABLE "public"."dictionary" ADD CONSTRAINT "dictionary_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE UNIQUE INDEX "email" ON "public"."users" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "username" ON "public"."users" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
