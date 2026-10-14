prompt --application/deployment/install/install_02_carga_triggers_sql
begin
--   Manifest
--     INSTALL: INSTALL-02_carga_triggers.sql
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'PROMPT Triggers'||wwv_flow.LF||
'create or replace trigger MEASURE_BIU'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on MEASURE'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2) := ' for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by :';
wwv_flow_imp.g_varchar2_table(3) := '= coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(4) := '  :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'end MEASURE_BIU;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'cre';
wwv_flow_imp.g_varchar2_table(5) := 'ate or replace trigger RECIPE_BIU'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on RECIPE'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(6) := '   if inserting then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_contex';
wwv_flow_imp.g_varchar2_table(7) := 't(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := ';
wwv_flow_imp.g_varchar2_table(8) := 'coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'end RECIPE_BIU;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'create or replace trigger';
wwv_flow_imp.g_varchar2_table(9) := ' RECIPE_PHOTO_BIU'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on RECIPE_PHOTO'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    if inse';
wwv_flow_imp.g_varchar2_table(10) := 'rting then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SE';
wwv_flow_imp.g_varchar2_table(11) := 'SSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(s';
wwv_flow_imp.g_varchar2_table(12) := 'ys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'end RECIPE_PHOTO_BIU;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'create or replace trigger R';
wwv_flow_imp.g_varchar2_table(13) := 'ECIPE_INGREDIENT_BIU'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on RECIPE_INGREDIENT'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(14) := ' if inserting then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(';
wwv_flow_imp.g_varchar2_table(15) := '''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := co';
wwv_flow_imp.g_varchar2_table(16) := 'alesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'end RECIPE_INGREDIENT_BIU;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'create or replac';
wwv_flow_imp.g_varchar2_table(17) := 'e trigger RECIPE_STEP_BIU'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on RECIPE_STEP'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(18) := 'if inserting then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''';
wwv_flow_imp.g_varchar2_table(19) := 'APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coa';
wwv_flow_imp.g_varchar2_table(20) := 'lesce(sys_context(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'end RECIPE_STEP_BIU;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
'create or replace trigge';
wwv_flow_imp.g_varchar2_table(21) := 'r CONVERTER_BIU'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on CONVERTER'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    if inserting';
wwv_flow_imp.g_varchar2_table(22) := ' then'||wwv_flow.LF||
'        :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SESSION';
wwv_flow_imp.g_varchar2_table(23) := ''',''APP_USER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(sys_co';
wwv_flow_imp.g_varchar2_table(24) := 'ntext(''APEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'end CONVERTER_BIU;'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
'create or replace trigger RECIPE_MEDIA';
wwv_flow_imp.g_varchar2_table(25) := '_BIU'||wwv_flow.LF||
'    before insert or update'||wwv_flow.LF||
'    on RECIPE_MEDIA'||wwv_flow.LF||
'    for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'    if inserting then'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(26) := '      :new.created := sysdate;'||wwv_flow.LF||
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_U';
wwv_flow_imp.g_varchar2_table(27) := 'SER''),user);'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    :new.updated := sysdate;'||wwv_flow.LF||
'    :new.updated_by := coalesce(sys_context(''A';
wwv_flow_imp.g_varchar2_table(28) := 'PEX$SESSION'',''APP_USER''),user);'||wwv_flow.LF||
'end RECIPE_MEDIA_BIU;'||wwv_flow.LF||
'/';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(12941445733600822)
,p_install_id=>wwv_flow_imp.id(12653854535473681)
,p_name=>'02_carga_triggers.sql'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
