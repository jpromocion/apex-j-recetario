prompt --application/shared_components/user_interface/lovs/tipo_medidas_calcular
begin
--   Manifest
--     TIPO_MEDIDAS_CALCULAR
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
 p_id=>wwv_flow_imp.id(10586948606331823)
,p_lov_name=>'TIPO_MEDIDAS_CALCULAR'
,p_lov_query=>'.'||wwv_flow_imp.id(10586948606331823)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(10587243560331824)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('L\00EDquidas')
,p_lov_return_value=>'L'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(10587685826331825)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Peso'
,p_lov_return_value=>'P'
);
wwv_flow_imp.component_end;
end;
/
