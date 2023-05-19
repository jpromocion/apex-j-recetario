prompt --application/shared_components/user_interface/lovs/medidas
begin
--   Manifest
--     MEDIDAS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(12882112713307511)
,p_lov_name=>'MEDIDAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NAME D, ID R',
'FROM MEASURE',
'ORDER BY NAME'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
);
wwv_flow_imp.component_end;
end;
/
