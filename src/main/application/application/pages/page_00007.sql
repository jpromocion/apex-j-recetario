prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Receta (cabecera)'
,p_alias=>'RECIPE'
,p_page_mode=>'MODAL'
,p_step_title=>'Receta (cabecera)'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1662662927374504442
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_created_on=>wwv_flow_imp.dz('20230911121511Z')
,p_last_updated_on=>wwv_flow_imp.dz('20261014184025Z')
,p_last_updated_by=>'JORTRI'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12262340775434645)
,p_plug_name=>'Auditoria'
,p_static_id=>'auditoria'
,p_parent_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_escape_on_http_output=>'N'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P7_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12702849064903194)
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
 p_id=>wwv_flow_imp.id(12696137123903188)
,p_plug_name=>'Receta'
,p_static_id=>'receta'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'RECIPE'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12703211001903194)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12702849064903194)
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
 p_id=>wwv_flow_imp.id(12704118007903195)
,p_button_id=>wwv_flow_imp.id(12703211001903194)
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
 p_id=>wwv_flow_imp.id(12705481274903197)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12702849064903194)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12704604265903196)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12702849064903194)
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
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12705049922903196)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(12702849064903194)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_button_comment=>'Guardar'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(12707060512903199)
,p_branch_name=>'Redirect to new'
,p_branch_action=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:RP:P6_ID:&P7_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(12705481274903197)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(12707493666903199)
,p_branch_name=>'Redirect to all'
,p_branch_action=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:RP,6::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(12704604265903196)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12698500724903191)
,p_name=>'P7_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12262340775434645)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
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
 p_id=>wwv_flow_imp.id(12698923283903191)
,p_name=>'P7_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12262340775434645)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
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
 p_id=>wwv_flow_imp.id(13751947288755231)
,p_name=>'P7_DIFFICULTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_prompt=>'Dificultad'
,p_source=>'DIFFICULTY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DIFICULTAD'
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
 p_id=>wwv_flow_imp.id(12696500602903188)
,p_name=>'P7_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
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
 p_id=>wwv_flow_imp.id(12696950365903190)
,p_name=>'P7_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_prompt=>'Nombre'
,p_source=>'NAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_field_template=>1610598484065263269
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12698160588903191)
,p_name=>'P7_OBSERVATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_prompt=>'Observaciones'
,p_source=>'OBSERVATION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
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
 p_id=>wwv_flow_imp.id(12697306964903190)
,p_name=>'P7_PERSONAS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_prompt=>unistr('N\00BA Personas')
,p_source=>'PERSONAS'
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
 p_id=>wwv_flow_imp.id(12909292727261311)
,p_name=>'P7_STARRATING'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_prompt=>unistr('Valoraci\00F3n')
,p_source=>'STARRATING'
,p_display_as=>'NATIVE_STAR_RATING'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'active_color', '#ffa500',
  'icon', 'fa-star',
  'inactive_color', '#808080',
  'number_of_stars', '10',
  'read_only_display', 'STARS_AND_VALUE',
  'show_clear_button', 'Y',
  'show_value', 'N',
  'tooltip', 'Valor seleccionado: #VALUE#',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12912793510261346)
,p_name=>'P7_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_prompt=>'Etiquetas'
,p_source=>'TAGS'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'TAGS'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12697743951903190)
,p_name=>'P7_TIME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_prompt=>'Tiempo'
,p_source=>'TIME'
,p_display_as=>'PLUGIN_DE.DANIELH.CLOCKPICKER'
,p_cSize=>5
,p_cMaxlength=>5
,p_colspan=>4
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'bottom',
  'attribute_02', 'left',
  'attribute_03', 'true',
  'attribute_04', 'Done',
  'attribute_05', 'false',
  'attribute_06', '0',
  'attribute_07', '1',
  'attribute_08', 'false')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12699306225903191)
,p_name=>'P7_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12262340775434645)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
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
 p_id=>wwv_flow_imp.id(12699742319903192)
,p_name=>'P7_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12262340775434645)
,p_item_source_plug_id=>wwv_flow_imp.id(12696137123903188)
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
 p_id=>wwv_flow_imp.id(12912852448261347)
,p_computation_sequence=>10
,p_computation_item=>'P7_TAGS'
,p_static_id=>'p7-tags'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'LOWER(:P7_TAGS)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13748930197755201)
,p_name=>'Navegar dejar campo'
,p_static_id=>'navegar-dejar-campo'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_TAGS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13749021272755202)
,p_event_id=>wwv_flow_imp.id(13748930197755201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Crear Foco Crear'
,p_static_id=>'crear-foco-crear'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(12705481274903197)
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P7_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13749121222755203)
,p_event_id=>wwv_flow_imp.id(13748930197755201)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'Editar Foco Guardar'
,p_static_id=>'editar-foco-guardar'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(12705049922903196)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P7_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13752487494755236)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_EXECUTION_CHAIN'
,p_process_name=>'Eliminacion'
,p_static_id=>'eliminacion'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'run_in_background', 'N',
  'submit_immediately', 'Y',
  'when_already_running', 'WAIT')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12704604265903196)
,p_internal_uid=>13752487494755236
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13752315860755235)
,p_process_sequence=>50
,p_parent_process_id=>wwv_flow_imp.id(13752487494755236)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Hijos Receta'
,p_static_id=>'eliminar-hijos-receta'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    DELETE FROM RECIPE_PHOTO WHERE IDRECIPE = :P7_ID;',
'',
'    DELETE FROM RECIPE_STEP WHERE IDRECIPE = :P7_ID;',
'',
'    DELETE FROM RECIPE_INGREDIENT WHERE IDRECIPE = :P7_ID;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_button_id=>wwv_flow_imp.id(12704604265903196)
,p_internal_uid=>13752315860755235
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12705890269903197)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(12696137123903188)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Recipe'
,p_static_id=>'initialize-form-recipe'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12705890269903197
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13752912640755241)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'New'
,p_static_id=>'new'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12705049922903196)
,p_internal_uid=>13752912640755241
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12912381152261342)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12696137123903188)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe - Crear'
,p_static_id=>'process-form-recipe-crear'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al insertar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12705481274903197)
,p_process_success_message=>'Nueva receta insertada'
,p_internal_uid=>12912381152261342
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12912417574261343)
,p_process_sequence=>60
,p_region_id=>wwv_flow_imp.id(12696137123903188)
,p_parent_process_id=>wwv_flow_imp.id(13752487494755236)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe - Eliminar'
,p_static_id=>'process-form-recipe-eliminar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al eliminar: #SQLERRM_TEXT#'
,p_process_when_button_id=>wwv_flow_imp.id(12704604265903196)
,p_process_success_message=>'Receta eliminada'
,p_internal_uid=>12912417574261343
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12912268638261341)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12696137123903188)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe - Guardar'
,p_static_id=>'process-form-recipe-guardar'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_process_error_message=>'Error al guardar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12705049922903196)
,p_process_success_message=>'Receta guardada correctamente EOEOE'
,p_internal_uid=>12912268638261341
);
wwv_flow_imp.component_end;
end;
/
