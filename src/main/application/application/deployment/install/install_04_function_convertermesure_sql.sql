prompt --application/deployment/install/install_04_function_convertermesure_sql
begin
--   Manifest
--     INSTALL: INSTALL-04_function_convertermesure.sql
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
 p_id=>wwv_flow_imp.id(10502832096832548)
,p_install_id=>wwv_flow_imp.id(12653854535473681)
,p_name=>'04_function_convertermesure.sql'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE FUNCTION converterMesure(',
'      measure1 CONVERTER.MEASURE_BASE%TYPE,',
'      measure2 CONVERTER.MEASURE_BASE%TYPE,',
'      value NUMBER)',
'RETURN NUMBER IS',
'  res NUMBER := NULL;',
'  rConverter_ CONVERTER%ROWTYPE;',
'  rConverter2_ CONVERTER%ROWTYPE;',
'  encontrado BOOLEAN := FALSE;',
'',
'BEGIN',
'',
'  <<directa>>',
'  BEGIN',
'    SELECT *',
'    INTO rConverter_',
'    FROM CONVERTER',
'    WHERE',
'      (',
'        (measure_base = measure1 and measure_destination = measure2)',
'        or',
'        (measure_base = measure2 and measure_destination = measure1)',
'      );',
'    encontrado := TRUE;',
'    IF rConverter_.measure_base = measure1 THEN',
'      res := value * rConverter_.ratio_to_1;',
'    ELSE',
'      res := value / rConverter_.ratio_to_1;',
'    END IF;',
'  EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'      encontrado := FALSE;',
'  END directa;',
'',
'  IF NOT encontrado THEN',
'',
'    <<diferida>>',
'    BEGIN',
'      SELECT *',
'      INTO rConverter_',
'      FROM CONVERTER',
'      WHERE measure_destination = measure1;',
'',
'      SELECT *',
'      INTO rConverter2_',
'      FROM CONVERTER',
'      WHERE measure_destination = measure2',
'        AND measure_base = rConverter_.measure_base;',
'',
'      encontrado := TRUE;',
'      res := value / rConverter_.ratio_to_1;',
'      res := res * rConverter2_.ratio_to_1;',
'',
'    EXCEPTION',
'      WHEN NO_DATA_FOUND THEN',
'        encontrado := FALSE;',
'    END diferida;',
'',
'  END IF;',
'',
'  RETURN res;',
'END;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
