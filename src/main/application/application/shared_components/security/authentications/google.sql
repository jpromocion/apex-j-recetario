prompt --application/shared_components/security/authentications/google
begin
--   Manifest
--     AUTHENTICATION: Google
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(14014030413016216)
,p_name=>'Google'
,p_static_id=>'google'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'authentication_provider', 'GOOGLE',
  'credential_store', 13974104817206788,
  'scope', 'profile,email',
  'uppercase_username', 'Y',
  'username', '#email#',
  'verify_attributes', 'Y')).to_clob
,p_logout_url=>'https://www.google.com/accounts/Logout'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'1'
,p_created_on=>wwv_flow_imp.dz('20230911121656Z')
,p_updated_on=>wwv_flow_imp.dz('20230911121708Z')
,p_created_by=>'JORTRI'
,p_updated_by=>'JORTRI'
);
wwv_flow_imp.component_end;
end;
/
