prompt --application/shared_components/user_interface/lovs/medidas_calcular_liquida
begin
--   Manifest
--     MEDIDAS_CALCULAR_LIQUIDA
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
 p_id=>wwv_flow_imp.id(10563311896950897)
,p_lov_name=>'MEDIDAS_CALCULAR_LIQUIDA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measure_base as name, 1 as grupo',
'from converter',
'where type = ''L''',
'union',
'select measure_destination as name, 2 as grupo',
'from converter',
'where type = ''L''',
'order by 1;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'NAME'
,p_display_column_name=>'NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
