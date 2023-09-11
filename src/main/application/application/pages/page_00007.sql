prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
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
,p_step_template=>wwv_flow_imp.id(12393018067418215)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20230616113248'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12696137123903188)
,p_plug_name=>'Receta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12428902632418246)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'RECIPE'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12262340775434645)
,p_plug_name=>'Auditoria'
,p_parent_plug_id=>wwv_flow_imp.id(12696137123903188)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(12487110258418274)
,p_plug_display_sequence=>100
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P7_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12702849064903194)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12478892201418270)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12703211001903194)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12702849064903194)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(12567825914418331)
,p_button_image_alt=>'Cancelar'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12704604265903196)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12702849064903194)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(12567825914418331)
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
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(12567825914418331)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Guardar'
,p_button_position=>'NEXT'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
,p_button_comment=>'Guardar'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12705481274903197)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12702849064903194)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(12567825914418331)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>500
,p_field_template=>wwv_flow_imp.id(12566612029418329)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'decimal'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_DE.DANIELH.CLOCKPICKER'
,p_cSize=>5
,p_cMaxlength=>5
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(12565293941418328)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'bottom'
,p_attribute_02=>'left'
,p_attribute_03=>'true'
,p_attribute_04=>'Done'
,p_attribute_05=>'false'
,p_attribute_06=>'0'
,p_attribute_07=>'1'
,p_attribute_08=>'false'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(12566612029418329)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(12566612029418329)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(12566612029418329)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(12566612029418329)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_STAR_RATING'
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'10'
,p_attribute_02=>'N'
,p_attribute_03=>'fa-star'
,p_attribute_04=>'#ffa500'
,p_attribute_05=>'#808080'
,p_attribute_06=>'Valor seleccionado: #VALUE#'
,p_attribute_07=>'Y'
,p_attribute_08=>'N'
,p_attribute_09=>'STARS_AND_VALUE'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'TAGS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(trim(val)) as d, lower(trim(val)) as r',
'from',
'  (',
'  select',
'    id,',
'    regexp_substr(tags, ''[^:]+'', 1, rn) val',
'  from',
'    RECIPE',
'    cross join lateral',
'      (',
'      select level rn from dual',
'      connect by level <=',
'        length ( tags ) - length ( replace ( tags, '':'' ) ) + 1',
'      )',
'  where tags is not null',
'  )  ',
'group by lower(trim(val));'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_attribute_11=>':'
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
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DIFICULTAD'
,p_lov=>'.'||wwv_flow_imp.id(8332482041298339)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(12565313901418328)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(12912852448261347)
,p_computation_sequence=>10
,p_computation_item=>'P7_TAGS'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'LOWER(:P7_TAGS)'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12703350683903194)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12703211001903194)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12704118007903195)
,p_event_id=>wwv_flow_imp.id(12703350683903194)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13748930197755201)
,p_name=>'Navegar dejar campo'
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
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(12705049922903196)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P7_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12912268638261341)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12696137123903188)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe - Guardar'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al guardar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12705049922903196)
,p_process_success_message=>'Receta guardada correctamente EOEOE'
,p_internal_uid=>12912268638261341
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12912381152261342)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12696137123903188)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe - Crear'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al insertar: #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12705481274903197)
,p_process_success_message=>'Nueva receta insertada'
,p_internal_uid=>12912381152261342
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13752487494755236)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_EXECUTION_CHAIN'
,p_process_name=>'Eliminacion'
,p_attribute_01=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12704604265903196)
,p_internal_uid=>13752487494755236
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13752912640755241)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'New'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12705049922903196)
,p_internal_uid=>13752912640755241
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12705890269903197)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(12696137123903188)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Recipe'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12705890269903197
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13752315860755235)
,p_process_sequence=>50
,p_parent_process_id=>wwv_flow_imp.id(13752487494755236)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Eliminar Hijos Receta'
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
 p_id=>wwv_flow_imp.id(12912417574261343)
,p_process_sequence=>60
,p_region_id=>wwv_flow_imp.id(12696137123903188)
,p_parent_process_id=>wwv_flow_imp.id(13752487494755236)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Recipe - Eliminar'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error al eliminar: #SQLERRM_TEXT#'
,p_process_when_button_id=>wwv_flow_imp.id(12704604265903196)
,p_process_success_message=>'Receta eliminada'
,p_internal_uid=>12912417574261343
);
wwv_flow_imp.component_end;
end;
/
