prompt --application/create_application
begin
--   Manifest
--     FLOW: 125
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'RECETAS')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Recetario')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'RECETARIO')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'7C4F853BED7EA3488B537932C2705D36D79D4B657000338E8A1E59293E7636DE'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'21.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'es'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DD/MM/YYYY'
,p_date_time_format=>'DD/MM/YYYY HH24:MI:SS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(13974363924215363)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Recetario'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'v1.5'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>unistr('La aplicaci\00F3n no est\00E1 disponible en este momento')
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'T'
,p_pass_ecid=>'N'
,p_security_scheme=>wwv_flow_imp.id(12596630678418379)
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Recetario'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20230911115834'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>31
,p_print_server_type=>'NATIVE'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'Y'
,p_pwa_manifest_display=>'standalone'
,p_pwa_manifest_orientation=>'any'
,p_pwa_apple_status_bar_style=>'black-translucent'
);
wwv_flow_imp.component_end;
end;
/
