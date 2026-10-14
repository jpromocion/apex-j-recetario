prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Fotos'
,p_alias=>'RECIPE-PHOTO'
,p_page_mode=>'MODAL'
,p_step_title=>'Fotos'
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
 p_id=>wwv_flow_imp.id(12908512295261304)
,p_plug_name=>'Auditoria'
,p_static_id=>'auditoria'
,p_parent_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_escape_on_http_output=>'N'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P10_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12784671598905000)
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
 p_id=>wwv_flow_imp.id(12778677342904996)
,p_plug_name=>'Foto'
,p_static_id=>'foto'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'RECIPE_PHOTO'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12785075531905000)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12784671598905000)
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
 p_id=>wwv_flow_imp.id(12785999453905001)
,p_button_id=>wwv_flow_imp.id(12785075531905000)
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
 p_id=>wwv_flow_imp.id(12787203527905002)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12784671598905000)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P10_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12786419424905001)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12784671598905000)
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
,p_button_condition=>'P10_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12786824722905001)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(12784671598905000)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_button_condition=>'P10_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12780614359904997)
,p_name=>'P10_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12908512295261304)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
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
 p_id=>wwv_flow_imp.id(12781060366904998)
,p_name=>'P10_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12908512295261304)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
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
 p_id=>wwv_flow_imp.id(12779423931904997)
,p_name=>'P10_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12779880228904997)
,p_name=>'P10_IDRECIPE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_source=>'IDRECIPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12908852943261307)
,p_name=>'P10_MIMETYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_source=>'MIMETYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12908759071261306)
,p_name=>'P10_NAMEFILE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_source=>'NAMEFILE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12780260450904997)
,p_name=>'P10_PHOTO'
,p_source_data_type=>'BLOB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_prompt=>'Foto'
,p_source=>'PHOTO'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'filename_column', 'NAMEFILE',
  'mime_type_column', 'MIMETYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12779075567904996)
,p_name=>'P10_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12781433114904998)
,p_name=>'P10_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12908512295261304)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
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
 p_id=>wwv_flow_imp.id(12781865030904998)
,p_name=>'P10_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12908512295261304)
,p_item_source_plug_id=>wwv_flow_imp.id(12778677342904996)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12788421872905002)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P10_ROWID,REQUEST',
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>12788421872905002
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12787657691905002)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(12778677342904996)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Recipe Photo'
,p_static_id=>'initialize-form-recipe-photo'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12787657691905002
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13751242500755224)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12778677342904996)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe Photo - Crear'
,p_static_id=>'process-form-recipe-photo-crear'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al insertar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12787203527905002)
,p_process_success_message=>'Nueva foto insertada'
,p_internal_uid=>13751242500755224
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13751314147755225)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12778677342904996)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe Photo - Eliminar'
,p_static_id=>'process-form-recipe-photo-eliminar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al eliminar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12786419424905001)
,p_process_success_message=>'Foto eliminada'
,p_internal_uid=>13751314147755225
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12788007242905002)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12778677342904996)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe Photo - Guardar'
,p_static_id=>'process-form-recipe-photo-guardar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al guardar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12786824722905001)
,p_process_success_message=>'Foto guardada correctamente'
,p_internal_uid=>12788007242905002
);
wwv_flow_imp.component_end;
end;
/
