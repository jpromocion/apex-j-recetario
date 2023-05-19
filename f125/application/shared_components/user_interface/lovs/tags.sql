prompt --application/shared_components/user_interface/lovs/tags
begin
--   Manifest
--     TAGS
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
 p_id=>wwv_flow_imp.id(13103267308600583)
,p_lov_name=>'TAGS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(val) as d, lower(val) as r',
'from',
'  (',
'  select',
'    id,',
'    regexp_substr(tags, ''[^:]+'', 1, rn) val',
'  from',
'    RECIPE',
'    cross join lateral',
'      (',
'      select level rn from dual',
'      connect by level <=',
'        length ( tags ) - length ( replace ( tags, '':'' ) ) + 1',
'      )',
'  where tags is not null',
'  )  ',
'group by lower(val);'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
