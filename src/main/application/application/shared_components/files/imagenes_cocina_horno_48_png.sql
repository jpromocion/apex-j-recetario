prompt --application/shared_components/files/imagenes_cocina_horno_48_png
begin
--   Manifest
--     APP STATIC FILES: 125
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.0'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C18000000AC494441546881ED9AD10AC2400C04F379963EAAFD7FACE867680A15FA684D6592BB1D583848B9DB813CD6';
wwv_flow_imp.g_varchar2_table(2) := 'CC6CF23C3DAF62593A5FAC68F94F1E96A044347881C305B2D3AFC0E8B97B66CF00CCC302F3E69B1B3097C0B03EB25C7E02E661812CB42F502D7881C305B2D38F00BD1ADFF66A5F8046027B1FDABB1212D00AFD1909D0488046023412A091008D04682440';
wwv_flow_imp.g_varchar2_table(3) := '23019AB04096F4279095F605AA052F101628FFB3C7753DD0657E297F7E03E96E399BBF59D8670000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(13704950238469895)
,p_file_name=>'imagenes_cocina/horno_48.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
