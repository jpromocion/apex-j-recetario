prompt --application/shared_components/user_interface/lovs/tipos_mostrar_resultados
begin
--   Manifest
--     TIPOS_MOSTRAR_RESULTADOS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.0'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(12991602203163316)
,p_lov_name=>'TIPOS_MOSTRAR_RESULTADOS'
,p_lov_query=>'.'||wwv_flow_imp.id(12991602203163316)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(12991973017163317)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Tarjetas'
,p_lov_return_value=>'CARDS'
,p_lov_template=>'<span class="t-Icon fa fa-cards" title="#DISPLAY_VALUE#"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(12992388071163317)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Informe'
,p_lov_return_value=>'REPORT'
,p_lov_template=>'<span class="t-Icon fa fa-table" title="#DISPLAY_VALUE#"></span><span class="u-VisuallyHidden">#DISPLAY_VALUE#</span>'
);
wwv_flow_imp.component_end;
end;
/
