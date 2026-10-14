prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Medias'
,p_alias=>'MEDIAS'
,p_page_mode=>'MODAL'
,p_step_title=>'Recurso Media'
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
 p_id=>wwv_flow_imp.id(11032803210272917)
,p_plug_name=>'Auditoria'
,p_static_id=>'auditoria'
,p_parent_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_escape_on_http_output=>'N'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P12_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22615911327174347)
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
 p_id=>wwv_flow_imp.id(22609308123174341)
,p_plug_name=>'Media'
,p_static_id=>'media'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'RECIPE_MEDIA'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11345863811557408)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22615911327174347)
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
 p_id=>wwv_flow_imp.id(11348426059557413)
,p_button_id=>wwv_flow_imp.id(11345863811557408)
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
 p_id=>wwv_flow_imp.id(11346983726557409)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(22615911327174347)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11346276338557408)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(22615911327174347)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Eliminar'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11346597175557409)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(22615911327174347)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_button_condition=>'P12_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22612244333174346)
,p_name=>'P12_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11032803210272917)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
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
 p_id=>wwv_flow_imp.id(22612591562174346)
,p_name=>'P12_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11032803210272917)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
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
 p_id=>wwv_flow_imp.id(22611388635174345)
,p_name=>'P12_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_prompt=>unistr('Descripci\00F3n')
,p_source=>'DESCRIPTION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>4
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
 p_id=>wwv_flow_imp.id(22610232068174344)
,p_name=>'P12_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
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
 p_id=>wwv_flow_imp.id(22610574181174345)
,p_name=>'P12_IDRECIPE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_source=>'IDRECIPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22611033855174345)
,p_name=>'P12_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_prompt=>'Tipo'
,p_source=>'TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIPO_MEDIA'
,p_cHeight=>1
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22613032843174347)
,p_name=>'P12_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11032803210272917)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
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
 p_id=>wwv_flow_imp.id(22613405192174347)
,p_name=>'P12_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11032803210272917)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22611798667174346)
,p_name=>'P12_URL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_item_source_plug_id=>wwv_flow_imp.id(22609308123174341)
,p_prompt=>'Url'
,p_source=>'URL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>2000
,p_cHeight=>4
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Si es una p\00E1gina, meter la URL, se mostrar\00E1 un enlace para abrir en una pesta\00F1a la p\00E1gina.'),
'<br/>',
unistr('Si es un video, se puede meter la URL para que se vea directamente en la aplicaci\00F3n. '),
'<br/>',
'NOTA: en el caso de ser un video de youtube, utilizar la URL embebida que se puede obtener al "Compartir". ',
unistr('Tambi\00E9n puedes colocar todo el c\00F3digo "iframe" que oferta, pero se renderizar\00E1 mejor solo con la url embebida.')))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11033315014272922)
,p_name=>'Pase a siguiente elemento'
,p_static_id=>'pase-a-siguiente-elemento'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_URL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11033437067272923)
,p_event_id=>wwv_flow_imp.id(11033315014272922)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Crear - Pasar boton crear'
,p_static_id=>'crear-pasar-boton-crear'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(11346983726557409)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P12_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11033512560272924)
,p_event_id=>wwv_flow_imp.id(11033315014272922)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Editar- Pasar boton guardar'
,p_static_id=>'editar-pasar-boton-guardar'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(11346597175557409)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P12_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11347558082557412)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>11347558082557412
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11344768363557407)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(22609308123174341)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form PruebaModal'
,p_static_id=>'initialize-form-pruebamodal'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11344768363557407
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11033730368272926)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(22609308123174341)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Media - Crear'
,p_static_id=>'process-form-media-crear'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al insertar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11346983726557409)
,p_process_success_message=>'Recurso media insertado'
,p_internal_uid=>11033730368272926
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11033653444272925)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(22609308123174341)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Media - Eliminar'
,p_static_id=>'process-form-media-eliminar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al eliminar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11346276338557408)
,p_process_success_message=>'Recurso media eliminado'
,p_internal_uid=>11033653444272925
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11345120071557408)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(22609308123174341)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Media - Guardar'
,p_static_id=>'process-form-media-guardar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al guardar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11346597175557409)
,p_process_success_message=>'Recurso media actualizado'
,p_internal_uid=>11345120071557408
);
wwv_flow_imp.component_end;
end;
/
