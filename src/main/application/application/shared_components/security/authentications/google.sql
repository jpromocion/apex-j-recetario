prompt --application/shared_components/security/authentications/google
begin
--   Manifest
--     AUTHENTICATION: Google
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(13974363924215363)
,p_name=>'Google'
,p_scheme_type=>'NATIVE_SOCIAL'
,p_attribute_01=>wwv_flow_imp.id(13974104817206788)
,p_attribute_02=>'GOOGLE'
,p_attribute_07=>'profile,email'
,p_attribute_09=>'#email#'
,p_attribute_11=>'Y'
,p_attribute_13=>'Y'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'https://www.google.com/accounts/Logout'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_imp.component_end;
end;
/
