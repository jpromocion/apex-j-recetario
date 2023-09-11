prompt --workspace/credentials/google_sso
begin
--   Manifest
--     CREDENTIAL: Google SSO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(13974104817206788)
,p_name=>'Google SSO'
,p_static_id=>'google_sso'
,p_authentication_type=>'OAUTH2_CLIENT_CREDENTIALS'
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
