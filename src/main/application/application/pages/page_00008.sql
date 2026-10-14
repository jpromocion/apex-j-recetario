prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_page.create_page(
 p_id=>8
,p_name=>'Ingredientes'
,p_alias=>'RECIPE-INGREDIENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Ingredientes'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20230911121512Z')
,p_last_updated_on=>wwv_flow_imp.dz('20261014184025Z')
,p_last_updated_by=>'JORTRI'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25163038568558106)
,p_plug_name=>'Auditoria'
,p_static_id=>'auditoria'
,p_parent_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_escape_on_http_output=>'N'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>90
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P8_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12744039705904282)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12736681433904277)
,p_plug_name=>'Ingrediente'
,p_static_id=>'ingrediente'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'RECIPE_INGREDIENT'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12744433766904282)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12744039705904282)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_updated_on=>wwv_flow_imp.dz('20261014184025Z')
,p_updated_by=>'JORTRI'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(12745314833904283)
,p_button_id=>wwv_flow_imp.id(12744433766904282)
,p_action_sequence=>10
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_static_id=>'native-dialog-cancel'
,p_stop_execution_on_error=>true
,p_created_on=>wwv_flow_imp.dz('20261014184025Z')
,p_updated_on=>wwv_flow_imp.dz('20261014184025Z')
,p_created_by=>'JORTRI'
,p_updated_by=>'JORTRI'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12746652461904284)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12744039705904282)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P8_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12745878062904283)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12744039705904282)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P8_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12746250003904284)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(12744039705904282)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_button_condition=>'P8_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12738604646904279)
,p_name=>'P8_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_prompt=>'Cantidad'
,p_format_mask=>'FM999G999G999G999G990D90'
,p_source=>'AMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>3
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_updated_on=>wwv_flow_imp.dz('20261014184022Z')
,p_updated_by=>'JORTRI'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12739416408904279)
,p_name=>'P8_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25163038568558106)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_prompt=>unistr('F. creaci\00F3n')
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_source=>'CREATED'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12739861198904279)
,p_name=>'P8_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25163038568558106)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_prompt=>'Creado por'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12912077338261339)
,p_name=>'P8_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_prompt=>unistr('Descripci\00F3n adicional')
,p_source=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>1000
,p_cHeight=>5
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12737476826904278)
,p_name=>'P8_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12739021197904279)
,p_name=>'P8_IDMEASURE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_prompt=>'Medida'
,p_source=>'IDMEASURE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MEDIDAS'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12737834705904278)
,p_name=>'P8_IDRECIPE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_source=>'IDRECIPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12738250485904278)
,p_name=>'P8_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_prompt=>'Nombre'
,p_source=>'NAME'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_named_lov=>'INGREDIENTES'
,p_cSize=>60
,p_cMaxlength=>100
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '7',
  'min_chars', '1',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12737020447904277)
,p_name=>'P8_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12740282382904280)
,p_name=>'P8_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25163038568558106)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_prompt=>unistr('F. \00DAltima modificaci\00F3n')
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_source=>'UPDATED'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12740679538904280)
,p_name=>'P8_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25163038568558106)
,p_item_source_plug_id=>wwv_flow_imp.id(12736681433904277)
,p_prompt=>'Modificado por'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(12908217928261301)
,p_computation_sequence=>10
,p_computation_item=>'P8_NAME'
,p_static_id=>'p8-name'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'INITCAP(:P8_NAME)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13749235931755204)
,p_name=>'Pasar siguiente elemento'
,p_static_id=>'pasar-siguiente-elemento'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_IDMEASURE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13749342152755205)
,p_event_id=>wwv_flow_imp.id(13749235931755204)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Crear - Pasar boton crear'
,p_static_id=>'crear-pasar-boton-crear'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(12746652461904284)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P8_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13749426227755206)
,p_event_id=>wwv_flow_imp.id(13749235931755204)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Editar- Pasar boton guardar'
,p_static_id=>'editar-pasar-boton-guardar'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(12746250003904284)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P8_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12747879723904285)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P8_ROWID,REQUEST',
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>12747879723904285
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12747013447904284)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(12736681433904277)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Recipe Ingredient'
,p_static_id=>'initialize-form-recipe-ingredient'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12747013447904284
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13751690440755228)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12736681433904277)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe Ingredient - Crear'
,p_static_id=>'process-form-recipe-ingredient-crear'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al insertar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12746652461904284)
,p_process_success_message=>'Ingrediente insertado'
,p_internal_uid=>13751690440755228
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13751773645755229)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12736681433904277)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe Ingredient - Eliminar'
,p_static_id=>'process-form-recipe-ingredient-eliminar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al eliminar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12745878062904283)
,p_process_success_message=>'Ingrediente eliminado'
,p_internal_uid=>13751773645755229
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12747493612904284)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12736681433904277)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe Ingredient - Guardar'
,p_static_id=>'process-form-recipe-ingredient-guardar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al guardar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12746250003904284)
,p_process_success_message=>'Ingrediente actualizado'
,p_internal_uid=>12747493612904284
);
wwv_flow_imp.component_end;
end;
/
