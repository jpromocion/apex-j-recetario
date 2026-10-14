prompt --application/deployment/install/install_04_function_convertermesure_sql
begin
--   Manifest
--     INSTALL: INSTALL-04_function_convertermesure.sql
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
wwv_flow_imp.g_varchar2_table(1) := 'CREATE OR REPLACE FUNCTION converterMesure('||wwv_flow.LF||
'      measure1 CONVERTER.MEASURE_BASE%TYPE,'||wwv_flow.LF||
'      measur';
wwv_flow_imp.g_varchar2_table(2) := 'e2 CONVERTER.MEASURE_BASE%TYPE,'||wwv_flow.LF||
'      value NUMBER)'||wwv_flow.LF||
'RETURN NUMBER IS'||wwv_flow.LF||
'  res NUMBER := NULL;'||wwv_flow.LF||
'  rConver';
wwv_flow_imp.g_varchar2_table(3) := 'ter_ CONVERTER%ROWTYPE;'||wwv_flow.LF||
'  rConverter2_ CONVERTER%ROWTYPE;'||wwv_flow.LF||
'  encontrado BOOLEAN := FALSE;'||wwv_flow.LF||
''||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
''||wwv_flow.LF||
'  <';
wwv_flow_imp.g_varchar2_table(4) := '<directa>>'||wwv_flow.LF||
'  BEGIN'||wwv_flow.LF||
'    SELECT *'||wwv_flow.LF||
'    INTO rConverter_'||wwv_flow.LF||
'    FROM CONVERTER'||wwv_flow.LF||
'    WHERE'||wwv_flow.LF||
'      ('||wwv_flow.LF||
'        (m';
wwv_flow_imp.g_varchar2_table(5) := 'easure_base = measure1 and measure_destination = measure2)'||wwv_flow.LF||
'        or'||wwv_flow.LF||
'        (measure_base = measur';
wwv_flow_imp.g_varchar2_table(6) := 'e2 and measure_destination = measure1)'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    encontrado := TRUE;'||wwv_flow.LF||
'    IF rConverter_.measure_b';
wwv_flow_imp.g_varchar2_table(7) := 'ase = measure1 THEN'||wwv_flow.LF||
'      res := value * rConverter_.ratio_to_1;'||wwv_flow.LF||
'    ELSE'||wwv_flow.LF||
'      res := value / rConv';
wwv_flow_imp.g_varchar2_table(8) := 'erter_.ratio_to_1;'||wwv_flow.LF||
'    END IF;'||wwv_flow.LF||
'  EXCEPTION'||wwv_flow.LF||
'    WHEN NO_DATA_FOUND THEN'||wwv_flow.LF||
'      encontrado := FALSE;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(9) := 'END directa;'||wwv_flow.LF||
''||wwv_flow.LF||
'  IF NOT encontrado THEN'||wwv_flow.LF||
''||wwv_flow.LF||
'    <<diferida>>'||wwv_flow.LF||
'    BEGIN'||wwv_flow.LF||
'      SELECT *'||wwv_flow.LF||
'      INTO rConver';
wwv_flow_imp.g_varchar2_table(10) := 'ter_'||wwv_flow.LF||
'      FROM CONVERTER'||wwv_flow.LF||
'      WHERE measure_destination = measure1;'||wwv_flow.LF||
''||wwv_flow.LF||
'      SELECT *'||wwv_flow.LF||
'      INTO rCo';
wwv_flow_imp.g_varchar2_table(11) := 'nverter2_'||wwv_flow.LF||
'      FROM CONVERTER'||wwv_flow.LF||
'      WHERE measure_destination = measure2'||wwv_flow.LF||
'        AND measure_base =';
wwv_flow_imp.g_varchar2_table(12) := ' rConverter_.measure_base;'||wwv_flow.LF||
''||wwv_flow.LF||
'      encontrado := TRUE;'||wwv_flow.LF||
'      res := value / rConverter_.ratio_to_1;'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(13) := '     res := res * rConverter2_.ratio_to_1;'||wwv_flow.LF||
''||wwv_flow.LF||
'    EXCEPTION'||wwv_flow.LF||
'      WHEN NO_DATA_FOUND THEN'||wwv_flow.LF||
'        enco';
wwv_flow_imp.g_varchar2_table(14) := 'ntrado := FALSE;'||wwv_flow.LF||
'    END diferida;'||wwv_flow.LF||
''||wwv_flow.LF||
'  END IF;'||wwv_flow.LF||
''||wwv_flow.LF||
'  RETURN res;'||wwv_flow.LF||
'END;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(10502832096832548)
,p_install_id=>wwv_flow_imp.id(12653854535473681)
,p_name=>'04_function_convertermesure.sql'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
