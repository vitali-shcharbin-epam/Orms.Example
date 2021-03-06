﻿CREATE TABLE FormattingOverrides
  (
    Id RAW (16) DEFAULT SYS_GUID() CONSTRAINT NNC_LOCALE_OVERRIDESv1_ID NOT NULL ,
    LocalizationSettingsId RAW (16) ,
    KEY   VARCHAR2 (200) CONSTRAINT NNC_LOCALE_OVERRIDESv1_KEY NOT NULL ,
    Value VARCHAR2 (500) CONSTRAINT NNC_LOCALE_OVERRIDESv1_VALUE NOT NULL
  ) ;
ALTER TABLE FormattingOverrides ADD CONSTRAINT LOCALE_OVERRIDESv1_PK PRIMARY KEY ( Id ) ;

CREATE TABLE LocaleOverrides
  (
    Id RAW (16) DEFAULT SYS_GUID() CONSTRAINT NNC_LOCALE_OVERRIDES_ID NOT NULL ,
    LocalizationSettingsId RAW (16) ,
    KEY   VARCHAR2 (200) CONSTRAINT NNC_LOCALE_OVERRIDES_KEY NOT NULL ,
    Value VARCHAR2 (500) CONSTRAINT NNC_LOCALE_OVERRIDES_VALUE NOT NULL
  ) ;
ALTER TABLE LocaleOverrides ADD CONSTRAINT LOCALE_OVERRIDES_PK PRIMARY KEY ( Id ) ;

CREATE TABLE "LOCALIZATION_SETTINGS" 
 (	"ID" RAW(16) DEFAULT SYS_GUID(), 
"ENTITY_ID" RAW(16), 
"PARENT_ID" RAW(16), 
"LANGUAGE" VARCHAR2(255 BYTE), 
"FORMATTING" VARCHAR2(255 BYTE)
 );

CREATE UNIQUE INDEX "VITALI_SHCHARBIN"."LOCALIZATION_SETTINGS_PK" ON "VITALI_SHCHARBIN"."LOCALIZATION_SETTINGS" ("ID");

ALTER TABLE "LOCALIZATION_SETTINGS" ADD CONSTRAINT "LOCALIZATION_SETTINGS_PK" PRIMARY KEY ("ID");

ALTER TABLE "LOCALIZATION_SETTINGS" MODIFY ("FORMATTING" NOT NULL ENABLE);
ALTER TABLE "LOCALIZATION_SETTINGS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
ALTER TABLE "LOCALIZATION_SETTINGS" MODIFY ("ENTITY_ID" NOT NULL ENABLE);
ALTER TABLE "LOCALIZATION_SETTINGS" MODIFY ("ID" CONSTRAINT "NNC_LOCALIZATION_SETTINGS_ID" NOT NULL ENABLE);

ALTER TABLE FormattingOverrides ADD CONSTRAINT LOC_OVERR_LOC_SETTINGS_FK FOREIGN KEY ( LocalizationSettingsId ) REFERENCES LocalizationSettings ( Id ) ;

ALTER TABLE LocaleOverrides ADD CONSTRAINT LOC_OVER_LOC_SETTINGS_FK FOREIGN KEY ( LocalizationSettingsId ) REFERENCES LocalizationSettings ( Id ) ;

ALTER TABLE LocalizationSettings ADD CONSTRAINT LOC_SETTINGS_LOC_SETTINGS_FK FOREIGN KEY ( ParentId ) REFERENCES LocalizationSettings ( Id ) ;