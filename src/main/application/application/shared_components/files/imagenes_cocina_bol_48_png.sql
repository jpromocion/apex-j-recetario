prompt --application/shared_components/files/imagenes_cocina_bol_48_png
begin
--   Manifest
--     APP STATIC FILES: 125
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C180000021D494441546881ED98BB2F04511487AF47828E7857161D8282AD884AA3112A8944E27FD05029885AA21122';
wwv_flow_imp.g_varchar2_table(2) := '7A3A6C640B21B1EB1182620B22F12844141E9B8890789C636612397B67E6CEE3CE55DC2FF992CDEE9E737EB33B7777E632A6D168341A3E85603B58A63A881FCAC17DF01B7C063BD5C6F106863F654678CB25A5893CC00B8F4EA80C258A5DF82458AC3097';
wwv_flow_imp.g_varchar2_table(3) := '10B8508F183F7C89C25C42E8F0AAD0E155A1C3BBF128D1574E7834EBA1872BBC01FF497D00AA75254B0A62CC587C2AAC27595E440EE0821435891449A28564391729DA244543B2D209304CB224448A6648D1BCAC74022C922CD322457DA4087F7B8B2405';
wwv_flow_imp.g_varchar2_table(4) := '7402673E912CBD2285F88F48FF70FAE56474649064C01F17E10F729914A7C1BCD023DA83B3AC9B7ACB052F0DE2A4181D0937A323A39CF91D5E9B2448833BB022BC8CB65482F764F69A9F46ADE007699462722F79B1779ACC7C079BFD369C62B95FE50A58';
wwv_flow_imp.g_varchar2_table(5) := '10342907DC895BE5CC9B0CDA749BD37407AC0ED29880A766923367CBCC10881AF092D3FC06EC0ADA1CE8016F39FDF192A62A84FEBFC4C06BCE106B81B5F9E8891BB71B363DAFC0BA809973A8058F6D067E3263F18D3363F1E773EAF1393C50DC26DC03BF';
wwv_flow_imp.g_varchar2_table(6) := '6C7A1D32E35B97026EF1CD390CB77C0333E08169C67CCEA9067BCEB288B611F1BC3D7309E4C513B03B8AE07FC15302AF57523E43E327BE0B0E30FE2917298DE0183316E503B30F8DAFAD9BEF6D50925410BC1DC43BB9B8293E2E559A48A3D168A4F00376';
wwv_flow_imp.g_varchar2_table(7) := '8FB5707B05A0130000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(13703718960454315)
,p_file_name=>'imagenes_cocina/bol_48.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
