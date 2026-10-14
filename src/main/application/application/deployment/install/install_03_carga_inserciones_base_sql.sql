prompt --application/deployment/install/install_03_carga_inserciones_base_sql
begin
--   Manifest
--     INSTALL: INSTALL-03_carga_inserciones_base.sql
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'PROMPT Insercion inicial en MEASURE'||wwv_flow.LF||
'insert into MEASURE (name)'||wwv_flow.LF||
'values('||wwv_flow.LF||
'  ''kg'''||wwv_flow.LF||
');'||wwv_flow.LF||
''||wwv_flow.LF||
'insert into MEASUR';
wwv_flow_imp.g_varchar2_table(2) := 'E (name)'||wwv_flow.LF||
'values('||wwv_flow.LF||
'  ''gramos'''||wwv_flow.LF||
');'||wwv_flow.LF||
''||wwv_flow.LF||
'insert into MEASURE (name)'||wwv_flow.LF||
'values('||wwv_flow.LF||
'  ''litros'''||wwv_flow.LF||
');'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'insert into MEASU';
wwv_flow_imp.g_varchar2_table(3) := 'RE (name)'||wwv_flow.LF||
'values('||wwv_flow.LF||
'  ''ml'''||wwv_flow.LF||
');'||wwv_flow.LF||
''||wwv_flow.LF||
'insert into MEASURE (name)'||wwv_flow.LF||
'values('||wwv_flow.LF||
'  ''unidades'''||wwv_flow.LF||
');'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'PROMPT Insercion i';
wwv_flow_imp.g_varchar2_table(4) := 'nicial en CONVERTER'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values';
wwv_flow_imp.g_varchar2_table(5) := '(''mililitros (ml)'', ''litros (l)'', 0.001, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destinat';
wwv_flow_imp.g_varchar2_table(6) := unistr('ion,ratio_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)'', ''centimetro c\00FAbico (cc)'', 1, ''L'');'||wwv_flow.LF||
'insert into CONVER');
wwv_flow_imp.g_varchar2_table(7) := unistr('TER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)'', ''metro c\00FAbico (cc)');
wwv_flow_imp.g_varchar2_table(8) := ''', 0.000001, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(';
wwv_flow_imp.g_varchar2_table(9) := '''mililitros (ml)'', ''onza liquida estadounidense (floz)'', 0.033814, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (meas';
wwv_flow_imp.g_varchar2_table(10) := unistr('ure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)'', ''gal\00F3n(gal)'', 0.000264, ''L''');
wwv_flow_imp.g_varchar2_table(11) := ');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)';
wwv_flow_imp.g_varchar2_table(12) := ''', ''cuarto'', 0.00106, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type';
wwv_flow_imp.g_varchar2_table(13) := ')'||wwv_flow.LF||
'values(''mililitros (ml)'', ''pinta'', 0.00211, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_des';
wwv_flow_imp.g_varchar2_table(14) := 'tination,ratio_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)'', ''cucharada (cs)'', 0.0666666667, ''L'');'||wwv_flow.LF||
'insert int';
wwv_flow_imp.g_varchar2_table(15) := 'o CONVERTER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)'', ''cucharari';
wwv_flow_imp.g_varchar2_table(16) := 'lla de postre'', 0.1, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)';
wwv_flow_imp.g_varchar2_table(17) := unistr(''||wwv_flow.LF||
'values(''mililitros (ml)'', ''cuchararilla de caf\00E9'', 0.2, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, m');
wwv_flow_imp.g_varchar2_table(18) := 'easure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)'', ''taza (cup)'', 0.004, ''L'');'||wwv_flow.LF||
'insert into';
wwv_flow_imp.g_varchar2_table(19) := unistr(' CONVERTER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)'', ''taza caf\00E9''');
wwv_flow_imp.g_varchar2_table(20) := ', 0.01, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''mili';
wwv_flow_imp.g_varchar2_table(21) := 'litros (ml)'', ''vaso agua'', 0.005, ''L'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destination,rat';
wwv_flow_imp.g_varchar2_table(22) := 'io_to_1,type)'||wwv_flow.LF||
'values(''mililitros (ml)'', ''vaso vino'', 0.01, ''L'');'||wwv_flow.LF||
''||wwv_flow.LF||
'insert into CONVERTER (measure_bas';
wwv_flow_imp.g_varchar2_table(23) := 'e, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''gramos (gr)'', ''kilogramo (kg)'', 0.001, ''P'');'||wwv_flow.LF||
'insert ';
wwv_flow_imp.g_varchar2_table(24) := 'into CONVERTER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(''gramos (gr)'', ''miligramo ';
wwv_flow_imp.g_varchar2_table(25) := '(mg)'', 1000, ''P'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)'||wwv_flow.LF||
'values(';
wwv_flow_imp.g_varchar2_table(26) := '''gramos (gr)'', ''libra (lb)'', 0.00220462, ''P'');'||wwv_flow.LF||
'insert into CONVERTER (measure_base, measure_destinat';
wwv_flow_imp.g_varchar2_table(27) := 'ion,ratio_to_1,type)'||wwv_flow.LF||
'values(''gramos (gr)'', ''onza (oz)'', 0.035274, ''P'');';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(12941530444604220)
,p_install_id=>wwv_flow_imp.id(12653854535473681)
,p_name=>'03_carga_inserciones_base.sql'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
