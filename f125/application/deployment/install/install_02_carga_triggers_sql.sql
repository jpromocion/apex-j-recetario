prompt --application/deployment/install/install_02_carga_triggers_sql
begin
--   Manifest
--     INSTALL: INSTALL-02_carga_triggers.sql
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(12941445733600822)
,p_install_id=>wwv_flow_imp.id(12653854535473681)
,p_name=>'02_carga_triggers.sql'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROMPT Triggers',
'create or replace trigger MEASURE_BIU',
'    before insert or update',
'    on MEASURE',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end MEASURE_BIU;',
'/',
'',
'',
'create or replace trigger RECIPE_BIU',
'    before insert or update',
'    on RECIPE',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end RECIPE_BIU;',
'/',
'',
'',
'create or replace trigger RECIPE_PHOTO_BIU',
'    before insert or update',
'    on RECIPE_PHOTO',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end RECIPE_PHOTO_BIU;',
'/',
'',
'',
'',
'',
'create or replace trigger RECIPE_INGREDIENT_BIU',
'    before insert or update',
'    on RECIPE_INGREDIENT',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end RECIPE_INGREDIENT_BIU;',
'/',
'',
'',
'create or replace trigger RECIPE_STEP_BIU',
'    before insert or update',
'    on RECIPE_STEP',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end RECIPE_STEP_BIU;',
'/',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
