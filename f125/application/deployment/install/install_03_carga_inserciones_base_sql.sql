prompt --application/deployment/install/install_03_carga_inserciones_base_sql
begin
--   Manifest
--     INSTALL: INSTALL-03_carga_inserciones_base.sql
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
 p_id=>wwv_flow_imp.id(12941530444604220)
,p_install_id=>wwv_flow_imp.id(12653854535473681)
,p_name=>'03_carga_inserciones_base.sql'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROMPT Insercion inicial en MEASURE',
'insert into MEASURE (name)',
'values(',
'  ''kg''',
');',
'',
'insert into MEASURE (name)',
'values(',
'  ''gramos''',
');',
'',
'insert into MEASURE (name)',
'values(',
'  ''litros''',
');',
'',
'',
'insert into MEASURE (name)',
'values(',
'  ''ml''',
');',
'',
'insert into MEASURE (name)',
'values(',
'  ''unidades''',
');',
''))
);
wwv_flow_imp.component_end;
end;
/
