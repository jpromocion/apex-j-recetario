prompt --application/shared_components/files/imagenes_cocina_sarten_tapada_48_png
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
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C180000015D494441546881ED96BF2B456118C71F3FCA2631180C7E4458E42FB0585899941583E54E92C1626753528A';
wwv_flow_imp.g_varchar2_table(2) := 'E10E1665938C9412A38985B228DD7B59487CDFDEFBD6E138C7B9C779DEE3D6F7539FE1DC4EF77C9EB7F7DEF38A10420821841052CFB4C155B803A7726EA9996678093F022EE45A5423A3F235DE789A6B51021AE1089C85BB121EE0112EC149D899536388';
wwv_flow_imp.g_varchar2_table(3) := '06380EB7E18384A3A37C87E770057679AF16BBDA33F03A41EC6FBEC1221CF0153F0CCF3208FFEE2B5C832D9AF166D55F14E2835EC11E8DF809E5F0A0371A03983D7A022F3CB8A131405DB3088FFFB9B16FFA23F1B7FFD35A8C1B60DA43C01D7C0A5CDFC3';
wwv_flow_imp.g_varchar2_table(4) := '7ED897C05EB12FD5489AE0AD627C057688DDAAEEB3E5B8A03414320835C787AD1F9CAB3EE3A07ADF336CCF7A805658FAE3006331DF3F24F68C64EEDBCC3ADEB19E32DC5996E8FF7EB738668841AD01BAC51EBE347FCC875AF18E79B8AFE49E28AE3E2184';
wwv_flow_imp.g_varchar2_table(5) := '104208217EF8042AC57DDAF3B8A4F50000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(13706164124472891)
,p_file_name=>'imagenes_cocina/sarten_tapada_48.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
