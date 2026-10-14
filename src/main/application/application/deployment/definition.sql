prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 125
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
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(12653854535473681)
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_last_updated_on=>wwv_flow_imp.dz('20230911121512Z')
);
wwv_flow_imp.component_end;
end;
/
