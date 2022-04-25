--------------------------------------------------------
--  파일이 생성됨 - 금요일-4월-08-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "ADMIN"."BOARD" 
   (	"NO" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP", 
	"NAME" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"CONTENT" CLOB COLLATE "USING_NLS_COMP", 
	"REGDATE" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP" DEFAULT to_char(SYSDATE, 'yyyy-mm-dd hh:mm:ss'), 
	"READCOUNT" NUMBER DEFAULT 0, 
	"PASSWORD" VARCHAR2(128 BYTE) COLLATE "USING_NLS_COMP", 
	"FILENAME" VARCHAR2(100 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" 
 LOB ("CONTENT") STORE AS SECUREFILE (
  TABLESPACE "DATA" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table T_AUTOCOMPLETE
--------------------------------------------------------

  CREATE TABLE "ADMIN"."T_AUTOCOMPLETE" 
   (	"NO" NUMBER, 
	"ID" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP", 
	"LABEL" VARCHAR2(300 BYTE) COLLATE "USING_NLS_COMP", 
	"VALUE" VARCHAR2(600 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table TBL_SAMPLE1
--------------------------------------------------------

  CREATE TABLE "ADMIN"."TBL_SAMPLE1" 
   (	"COL1" VARCHAR2(500 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Table TBL_SAMPLE2
--------------------------------------------------------

  CREATE TABLE "ADMIN"."TBL_SAMPLE2" 
   (	"COL2" VARCHAR2(50 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SYS_C0022138
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SYS_C0022138" ON "ADMIN"."BOARD" ("NO") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SYS_C0022129
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SYS_C0022129" ON "ADMIN"."T_AUTOCOMPLETE" ("NO") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index SYS_C0022130
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."SYS_C0022130" ON "ADMIN"."T_AUTOCOMPLETE" ("ID") 
  PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "ADMIN"."BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."BOARD" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."BOARD" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."BOARD" ADD PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "ADMIN"."BOARD" MODIFY ("REGDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table T_AUTOCOMPLETE
--------------------------------------------------------

  ALTER TABLE "ADMIN"."T_AUTOCOMPLETE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."T_AUTOCOMPLETE" MODIFY ("LABEL" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."T_AUTOCOMPLETE" MODIFY ("VALUE" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."T_AUTOCOMPLETE" ADD PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;
  ALTER TABLE "ADMIN"."T_AUTOCOMPLETE" ADD UNIQUE ("ID")
  USING INDEX PCTFREE 10 INITRANS 20 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;