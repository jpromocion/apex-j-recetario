prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 125
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(12597584476418382)
,p_name=>'ACCESS_CONTROL_SCOPE'
,p_value=>'ACL_ONLY'
,p_is_required=>'N'
,p_valid_values=>'ACL_ONLY, ALL_USERS'
,p_on_upgrade_keep_value=>true
,p_required_patch=>wwv_flow_imp.id(12594867275418377)
,p_comments=>'The default access level given to authenticated users who are not in the access control list'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
