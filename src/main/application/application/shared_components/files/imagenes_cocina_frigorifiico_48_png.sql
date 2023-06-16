prompt --application/shared_components/files/imagenes_cocina_frigorifiico_48_png
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
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C1800000113494441546881ED99BD0DC2400C853D05B04A160096E06702205BD0100A4648C31A9082824128801DB0C1';
wwv_flow_imp.g_varchar2_table(2) := '414222424AF2B01CF949AFCC77F7E5D021C544119FE97353EEBAA5A6CAFC4BC6DC3BF7C0CD5AD87CA6AC1B7784DEFC40179A00D85365434F6245AFB785CA91BB00F29FC7BD03F285BD01F269ABF5CA0F016B7E0858F3DF0B2454FDC794B4C087A533025E';
wwv_flow_imp.g_varchar2_table(3) := 'F9FE05F6DC0BF704EA45D70881AAB8FF097546C0FD35EA5EC02B3F04ACF92160CD0F016B7E0858F343C09A1F02D6FC10B0E6878035DFFF80033D622A083C6292019C0CE26600F69C7BE5F600EC8FC82854246420271FA172AA3F62CD9551E8E687E8CD97';
wwv_flow_imp.g_varchar2_table(4) := '91935872CFDABA02E5F3C282BFF96F697A6BC06F9D5F49A8D977A0A6CF47CCF30000F7BDA77DF4BCAC0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(13849922399060611)
,p_file_name=>'imagenes_cocina/frigorifiico_48.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
