prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
--   Manifest
--     AUTHENTICATION: Oracle APEX Accounts
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
 p_id=>wwv_flow_imp.id(12391952236418208)
,p_name=>'Oracle APEX Accounts'
,p_static_id=>'oracle-apex-accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'1'
,p_created_on=>wwv_flow_imp.dz('20230911121510Z')
,p_updated_on=>wwv_flow_imp.dz('20230911121510Z')
,p_created_by=>'JORTRI'
,p_updated_by=>'JORTRI'
);
wwv_flow_imp.component_end;
end;
/
