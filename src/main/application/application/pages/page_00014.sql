prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_name=>'Convertidor'
,p_alias=>'CONVERTIDOR'
,p_page_mode=>'MODAL'
,p_step_title=>'Convertidor'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(12596571602418379)
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20230911121512Z')
,p_last_updated_on=>wwv_flow_imp.dz('20261014184025Z')
,p_last_updated_by=>'JORTRI'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22815294518302424)
,p_plug_name=>'Auditoria'
,p_static_id=>'auditoria'
,p_parent_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_escape_on_http_output=>'N'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P14_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10539612371773081)
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
 p_id=>wwv_flow_imp.id(10533738758773063)
,p_plug_name=>'Convertidor'
,p_static_id=>'convertidor'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'CONVERTER'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10540044187773081)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10539612371773081)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA_ACTION'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Volver'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_updated_on=>wwv_flow_imp.dz('20261014184025Z')
,p_updated_by=>'JORTRI'
);
wwv_flow_imp_page.create_component_da_action(
 p_id=>wwv_flow_imp.id(10540961293773086)
,p_button_id=>wwv_flow_imp.id(10540044187773081)
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
 p_id=>wwv_flow_imp.id(10542214027773087)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(10539612371773081)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10541452005773086)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(10539612371773081)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Borrar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10541887587773087)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(10539612371773081)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10535691954773077)
,p_name=>'P14_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22815294518302424)
,p_item_source_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_prompt=>unistr('F. creaci\00F3n')
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_source=>'CREATED'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10536016455773078)
,p_name=>'P14_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22815294518302424)
,p_item_source_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_prompt=>'Creado por'
,p_source=>'CREATED_BY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10534099035773065)
,p_name=>'P14_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_item_source_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10534423847773074)
,p_name=>'P14_MEASURE_BASE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_item_source_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_prompt=>'Medida base'
,p_source=>'MEASURE_BASE'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10534863723773076)
,p_name=>'P14_MEASURE_DESTINATION'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_item_source_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_prompt=>'Medida destino'
,p_source=>'MEASURE_DESTINATION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>500
,p_cHeight=>4
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10535202552773076)
,p_name=>'P14_RATIO_TO_1'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_item_source_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_prompt=>unistr('Relaci\00F3n a 1')
,p_format_mask=>'FM9G999G999G990D9999999990'
,p_source=>'RATIO_TO_1'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>24
,p_cMaxlength=>24
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10536416472773078)
,p_name=>'P14_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22815294518302424)
,p_item_source_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_prompt=>unistr('F. \00DAltima modificaci\00F3n')
,p_format_mask=>'DD/MM/YYYY HH24:MI:SS'
,p_source=>'UPDATED'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10536875249773078)
,p_name=>'P14_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22815294518302424)
,p_item_source_plug_id=>wwv_flow_imp.id(10533738758773063)
,p_prompt=>'Modificado por'
,p_source=>'UPDATED_BY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10543426094773088)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>10543426094773088
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10542626537773088)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(10533738758773063)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Convertidor'
,p_static_id=>'initialize-form-convertidor'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>10542626537773088
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10543077442773088)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(10533738758773063)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Convertidor'
,p_static_id=>'process-form-convertidor'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>10543077442773088
);
wwv_flow_imp.component_end;
end;
/
