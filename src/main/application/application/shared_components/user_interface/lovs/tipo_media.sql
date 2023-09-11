prompt --application/shared_components/user_interface/lovs/tipo_media
begin
--   Manifest
--     TIPO_MEDIA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(11352090419599170)
,p_lov_name=>'TIPO_MEDIA'
,p_lov_query=>'.'||wwv_flow_imp.id(11352090419599170)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11352349539599172)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Url p\00E1gina')
,p_lov_return_value=>'U'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11352778193599173)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Url video'
,p_lov_return_value=>'V'
);
wwv_flow_imp.component_end;
end;
/
