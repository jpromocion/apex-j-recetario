prompt --application/shared_components/files/imagenes_cocina_mortero_48_png
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
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F987000000097048597300000B1300000B1301009A9C18000001D9494441546881ED983B48034110402748C4601591203662043F8DBD225A5A489AD8D9D8A86027E2A7B008';
wwv_flow_imp.g_varchar2_table(2) := '58492A2D6DC4C6CECECE9409165AF8E96DC54EF1D7441367BC8D59731BB9BDDCEC22EE8357DC41366F92CD9D2780C3E170FC47DAD0125A953CB65AA4C902FC8C270B568B34E844EFC03FC0B2CD281D72E08FFF407B6D460525853E817F80A2CD281DF6C1';
wwv_flow_imp.g_varchar2_table(3) := '1F4FAED88C0ACA305A067F7C05EDB3D8159813507FFAE736A3823205EA7872D362572062E805341F60C85E5A30D2D03CFED26297161974A9C145B4DF464C024D3299E08E9F04F5A5302ACBE23DD8D8638CAFB9CB39C0B58101AEB8E2E972C8B97DE46D14';
wwv_flow_imp.g_varchar2_table(4) := 'E318A0CB407CCD24C700BF5DCFA336CD3140CAE000DD1C03D073EC2B432CEDF967E9F845BC170B670C03CCA3A3D271892B9EC8451C7F8FB6A373D2B92DCE0146C07B00896A8035B16E511CD3DA839C03108588E26FD10E745A3A77CA1D4F8C43EBDFC23B';
wwv_flow_imp.g_varchar2_table(5) := '3A01DEF6B981FAA73F666200E2B0C50156C53A3BD2B90353F1440FFA18229C3C126B64C1FB7F109D7B00EF3E63948C14A023FD86E861E60DEADB69C670FB371B8A405DD78D574BC421FC56AA8AD7C68D574BCC2AA274CD1AAF9688E29E60E4DAAF6200C2';
wwv_flow_imp.g_varchar2_table(6) := 'FD881B3572F755910F11DBCCBCE1F62FB6219ABF8B2A622D87C3E1F8837C027D5E338996E6A4310000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(13851366565197979)
,p_file_name=>'imagenes_cocina/mortero_48.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
