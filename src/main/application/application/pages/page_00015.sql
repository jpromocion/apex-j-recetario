prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.0'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_page.create_page(
 p_id=>15
,p_name=>'Calculadora'
,p_alias=>'CALCULADORA'
,p_step_title=>'Calculadora'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20230614125441'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10572734453126908)
,p_plug_name=>'Conversor peso'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(12461234257418262)
,p_plug_display_sequence=>20
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13753163854755243)
,p_plug_name=>unistr('Conversor l\00EDquido')
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(12461234257418262)
,p_plug_display_sequence=>10
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(55407557862712262)
,p_plug_name=>'Calculadora'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12496653443418281)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_region_image=>'#APP_FILES#icons/app-icon-192.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10572845451126909)
,p_name=>'P15_MEDIDA1_P'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10572734453126908)
,p_prompt=>'Medida 1'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MEDIDAS_CALCULAR_PESO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measure_base as name, 1 as grupo',
'from converter',
'where type = ''P''',
'union',
'select measure_destination as name, 2 as grupo',
'from converter',
'where type = ''P''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10572900760126910)
,p_name=>'P15_MEDIDA2_P'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10572734453126908)
,p_prompt=>'Medida 2'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MEDIDAS_CALCULAR_PESO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measure_base as name, 1 as grupo',
'from converter',
'where type = ''P''',
'union',
'select measure_destination as name, 2 as grupo',
'from converter',
'where type = ''P''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10573070664126911)
,p_name=>'P15_VALOR1_P'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10572734453126908)
,p_prompt=>'Valor 1'
,p_format_mask=>'FM9999990D0999999'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10573138028126912)
,p_name=>'P15_VALOR2_P'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10572734453126908)
,p_prompt=>'Valor 2'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--boldDisplay'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13753325054755245)
,p_name=>'P15_MEDIDA1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13753163854755243)
,p_prompt=>'Medida 1'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MEDIDAS_CALCULAR_LIQUIDA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measure_base as name, 1 as grupo',
'from converter',
'where type = ''L''',
'union',
'select measure_destination as name, 2 as grupo',
'from converter',
'where type = ''L''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13753479383755246)
,p_name=>'P15_MEDIDA2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13753163854755243)
,p_prompt=>'Medida 2'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MEDIDAS_CALCULAR_LIQUIDA'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measure_base as name, 1 as grupo',
'from converter',
'where type = ''L''',
'union',
'select measure_destination as name, 2 as grupo',
'from converter',
'where type = ''L''',
'order by 1;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13753556193755247)
,p_name=>'P15_VALOR1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13753163854755243)
,p_prompt=>'Valor 1'
,p_format_mask=>'FM9999990D0999999'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13753665906755248)
,p_name=>'P15_VALOR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13753163854755243)
,p_prompt=>'Valor 2'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--boldDisplay'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13753731669755249)
,p_name=>'Tras cambio valores liquidos'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P15_VALOR1,P15_MEDIDA1,P15_MEDIDA2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13753815739755250)
,p_event_id=>wwv_flow_imp.id(13753731669755249)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Fijar valor 2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'res NUMBER;',
'begin',
'  res := converterMesure(:P15_MEDIDA1,:P15_MEDIDA2,:P15_VALOR1);',
'    ',
'    apex_util.set_session_state(''P15_VALOR2'', TO_CHAR(res,''FM9999990D0999999''));',
'    exception',
'    when others then',
'      apex_util.set_session_state(''P15_VALOR2'', null);',
'end;'))
,p_attribute_02=>'P15_MEDIDA1,P15_MEDIDA2,P15_VALOR1'
,p_attribute_03=>'P15_VALOR2'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10573275167126913)
,p_name=>'Tras cambio valores peso'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P15_MEDIDA1_P,P15_MEDIDA2_P,P15_VALOR1_P'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10573314051126914)
,p_event_id=>wwv_flow_imp.id(10573275167126913)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Fijar valor 2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'res NUMBER;',
'begin',
'  res := converterMesure(:P15_MEDIDA1_P,:P15_MEDIDA2_P,:P15_VALOR1_P);',
'    ',
'    apex_util.set_session_state(''P15_VALOR2_P'', TO_CHAR(res,''FM9999990D0999999''));',
'    exception',
'    when others then',
'      apex_util.set_session_state(''P15_VALOR2_P'', null);',
'end;'))
,p_attribute_02=>'P15_MEDIDA1_P,P15_MEDIDA2_P,P15_VALOR1_P'
,p_attribute_03=>'P15_VALOR2_P'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
