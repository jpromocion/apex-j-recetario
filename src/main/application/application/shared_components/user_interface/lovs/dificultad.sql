prompt --application/shared_components/user_interface/lovs/dificultad
begin
--   Manifest
--     DIFICULTAD
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
 p_id=>wwv_flow_imp.id(8332482041298339)
,p_lov_name=>'DIFICULTAD'
,p_lov_query=>'.'||wwv_flow_imp.id(8332482041298339)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8332734455298341)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Muy f\00E1cil')
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8333132543298342)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('F\00E1cil')
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8333525393298342)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Medio'
,p_lov_return_value=>'3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8333923584298342)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('Dif\00EDcil')
,p_lov_return_value=>'4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8334351923298342)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>unistr('Muy dif\00EDcil')
,p_lov_return_value=>'5'
);
wwv_flow_imp.component_end;
end;
/
