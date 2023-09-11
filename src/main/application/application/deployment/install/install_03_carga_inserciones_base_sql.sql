prompt --application/deployment/install/install_03_carga_inserciones_base_sql
begin
--   Manifest
--     INSTALL: INSTALL-03_carga_inserciones_base.sql
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(12941530444604220)
,p_install_id=>wwv_flow_imp.id(12653854535473681)
,p_name=>'03_carga_inserciones_base.sql'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROMPT Insercion inicial en MEASURE',
'insert into MEASURE (name)',
'values(',
'  ''kg''',
');',
'',
'insert into MEASURE (name)',
'values(',
'  ''gramos''',
');',
'',
'insert into MEASURE (name)',
'values(',
'  ''litros''',
');',
'',
'',
'insert into MEASURE (name)',
'values(',
'  ''ml''',
');',
'',
'insert into MEASURE (name)',
'values(',
'  ''unidades''',
');',
'',
'',
'PROMPT Insercion inicial en CONVERTER',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''litros (l)'', 0.001, ''L'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
unistr('values(''mililitros (ml)'', ''centimetro c\00FAbico (cc)'', 1, ''L'');'),
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
unistr('values(''mililitros (ml)'', ''metro c\00FAbico (cc)'', 0.000001, ''L'');'),
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''onza liquida estadounidense (floz)'', 0.033814, ''L'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
unistr('values(''mililitros (ml)'', ''gal\00F3n(gal)'', 0.000264, ''L'');'),
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''cuarto'', 0.00106, ''L'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''pinta'', 0.00211, ''L'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''cucharada (cs)'', 0.0666666667, ''L'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''cuchararilla de postre'', 0.1, ''L'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
unistr('values(''mililitros (ml)'', ''cuchararilla de caf\00E9'', 0.2, ''L'');'),
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''taza (cup)'', 0.004, ''L'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
unistr('values(''mililitros (ml)'', ''taza caf\00E9'', 0.01, ''L'');'),
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''vaso agua'', 0.005, ''L'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''mililitros (ml)'', ''vaso vino'', 0.01, ''L'');',
'',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''gramos (gr)'', ''kilogramo (kg)'', 0.001, ''P'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''gramos (gr)'', ''miligramo (mg)'', 1000, ''P'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''gramos (gr)'', ''libra (lb)'', 0.00220462, ''P'');',
'insert into CONVERTER (measure_base, measure_destination,ratio_to_1,type)',
'values(''gramos (gr)'', ''onza (oz)'', 0.035274, ''P'');'))
);
wwv_flow_imp.component_end;
end;
/
