prompt --application/pages/page_00004
begin
--   Manifest
--     PAGE: 00004
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
 p_id=>4
,p_name=>'Recetario'
,p_alias=>'RECETARIO'
,p_step_title=>'Recetario'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// standard, cacheable elements',
'var timeout = 0; // used for debounce on search',
'var CONTAINER_SEL = ''.t-Form-fieldContainer'';',
'var pagePrefix = ''P'' + $(''#pFlowStepId'').val();',
'var displayAsId = pagePrefix + ''_DISPLAY_AS'';',
'var $displayAs = $(''#'' + displayAsId);',
'var $body = $(''.t-PageBody'');',
'var $search = $(''#'' + pagePrefix + ''_SEARCH'');',
'//var $sort = $(''#'' + pagePrefix + ''_SORT'');',
'var $reset = $(''#reset_button'');',
'var $cardsReg = $(''#cards_region'');',
'var $reportReg = $(''#report_region'');',
'//var $logoReg = $(''#logo_region'');',
'',
'// custom items (will vary by page)',
'var $personas = $(''#'' + pagePrefix + ''_PERSONAS'');',
'var $ingredientesalov = $(''#'' + pagePrefix + ''_INGREDIENTES_A_LOV'');',
'var $ingredientestlov = $(''#'' + pagePrefix + ''_INGREDIENTES_T_LOV'');',
'var $tagsalov = $(''#'' + pagePrefix + ''_TAGS_A_LOV'');',
'var $tagstlov = $(''#'' + pagePrefix + ''_TAGS_T_LOV'');',
'var $valoracion = $(''#'' + pagePrefix + ''_VALORACION'');',
'',
'function showLeftColumn() {',
'    $body',
'        .removeClass(''t-PageBody--hideLeft'')',
'        .addClass(''t-PageBody--showLeft'');',
'',
'    // Takes 200ms to hide column',
'    setTimeout(function() {',
'        // Ensure column headers align correctly',
'        $(window).trigger(''apexwindowresized'');',
'    }, 250);',
'}',
'',
'function hideLeftColumn() {',
'    $body',
'        .removeClass(''t-PageBody--showLeft'')',
'        .addClass(''t-PageBody--hideLeft'');',
'',
'    // Takes 200ms to hide column',
'    setTimeout(function() {',
'        // Ensure column headers align correctly',
'        $(window).trigger(''apexwindowresized'');',
'    }, 250);',
'}',
'',
'// applyFilters triggers the refresh event on the correct region',
'function applyFilters() {',
'    var display = $v(displayAsId);',
'',
'    if (display === ''CARDS'') {',
'        $cardsReg.trigger(''apexrefresh'');',
'    } else if (display === ''REPORT'') {',
'        $reportReg.trigger(''apexrefresh'');',
'    //} else if (display === ''LOGOS'') {',
'    //    $logoReg.trigger(''apexrefresh'');',
'    }',
'}',
'',
'// toggleRegionDisplay is similar to applyFilters except that it also',
'// takes into account what regions or items need to be displayed or hidden',
'function toggleRegionDisplay(refresh) {',
'    var display = $v(displayAsId);',
'',
'    refresh = (refresh === false) ? false : true;',
'',
'    if (display === ''CARDS'') {',
'        $reportReg.hide();',
'        //$logoReg.hide();',
'        //$logo_size.closest(CONTAINER_SEL).hide();',
'        showLeftColumn();',
'',
'        if (refresh) {',
'            $cardsReg.trigger(''apexrefresh'');',
'        }',
'',
'        $cardsReg.show();',
'    } else if (display === ''REPORT'') {',
'        $cardsReg.hide();',
'        //$logoReg.hide();',
'        //$logo_size.closest(CONTAINER_SEL).hide();',
'',
'        hideLeftColumn();',
'        ',
'        if (refresh) {',
'          $reportReg.trigger(''apexrefresh'');',
'        }',
'',
'        $reportReg.show();',
'    //} else if (display === ''LOGOS'') {',
'      //  $cardsReg.hide();',
'        //$reportReg.hide();',
'        //$logo_size.closest(CONTAINER_SEL).show();',
'        //showLeftColumn();',
'        //if (refresh) {',
'          //  $logoReg.trigger(''apexrefresh'');',
'        //}',
'        //$logoReg.show();',
'    }',
'}',
'',
'function debounceSearch(e) {',
'    /* ',
'     * Prevent search for following keys:',
'     * TAB:     9',
'     * SHIFT:   16',
'     * LEFT:    37',
'     * RIGHT:   39',
'     */',
'    if ( e.which === 9 || e.which === 16 || e.which === 37 || e.which === 39 ) {',
'        return false;',
'    }',
'',
'    clearTimeout(timeout);',
'    timeout = setTimeout(applyFilters, 250);',
'}',
'',
'function preventSubmitOnEnter(e) {',
'    if (e.which === 13) {',
'        return false;',
'    }',
'}',
'',
'function resetFilters() {',
'    $search.val(null);',
'',
'    //$sort.val(null);',
'    $personas.val(null);',
'    $ingredientesalov.val(null);',
'    $ingredientestlov.val(null);',
'    $tagsalov.val(null);',
'    $tagstlov.val(null);',
'    $valoracion.val(null);',
'',
'    applyFilters();',
'}',
'',
'// standard search event bindings',
'$search.keydown(preventSubmitOnEnter);',
'$search.keyup(debounceSearch);',
'',
'// dynamic event bindings (will vary by filter page)',
'//$sort.change(applyFilters);',
'$personas.change(applyFilters);',
'$ingredientesalov.change(applyFilters);',
'$ingredientestlov.change(applyFilters);',
'$tagsalov.change(applyFilters);',
'$tagstlov.change(applyFilters);',
'$valoracion.change(applyFilters);',
'',
'',
'// standard display, sort, reset event bindings',
'$displayAs.change(toggleRegionDisplay);',
'$reset.click(resetFilters);',
'',
'toggleRegionDisplay(false);'))
,p_step_template=>wwv_flow_imp.id(12395935425418225)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20230616112548'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12258510296434607)
,p_plug_name=>'Recetas (buscador)'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12496653443418281)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_region_image=>'#APP_FILES#icons/app-icon-192.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12909566637261314)
,p_plug_name=>'Tipos'
,p_parent_plug_id=>wwv_flow_imp.id(12258510296434607)
,p_region_css_classes=>'t-Form--search'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12428902632418246)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12683891342709728)
,p_name=>'Recetas'
,p_region_name=>'cards_region'
,p_template=>wwv_flow_imp.id(12428902632418246)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayInitials:t-Cards--3cols:t-Cards--desc-2ln:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'  r.id,',
'  r.name card_title,',
'  substr(r.observation,1,255) as card_text,',
'  ''Personas: '' || r.personas || '' - Ingredientes: '' ||',
'    (SELECT',
'      LISTAGG(RI.name, '', '') WITHIN GROUP (ORDER BY RI.ID)',
'    FROM RECIPE_INGREDIENT RI',
'    WHERE r.id = ri.idrecipe) card_subtext,',
'  --apex_util.prepare_url(''f?p=''||:APP_ID||'':6:''||:APP_SESSION||'':::6:P6_ID:''||r.id) card_link,',
'  apex_util.prepare_url(''f?p=''||:APP_ID||'':6:''||:APP_SESSION||'':::6:P6_ID,P6_MOSTRAR_PANEL_IZQUIERDA:''||r.id||'',N'') card_link,',
'  upper(',
'    decode(instr(r.name,'' ''),',
'            0,',
'            substr(r.name,1,2),',
'            substr(r.name,1,1)||substr(r.name,instr(r.name,'' '')+1,1)',
'      )) card_initials',
'from RECIPE r',
'where',
'    (',
'      :P4_SEARCH is null',
'      OR instr(upper(r.name),upper(:P4_SEARCH)) > 0 or',
'                instr(upper(r.observation),upper(:P4_SEARCH)) > 0 ',
'   )',
'  AND ',
'    (',
'      :P4_PERSONAS IS NULL ',
'      OR ',
'      R.personas = :P4_PERSONAS',
'    )     ',
'  AND ',
'    (',
'      :P4_VALORACION IS NULL ',
'      OR ',
'      NVL(R.starrating,0) >= NVL(:P4_VALORACION,0)',
'    )       ',
'  AND ',
'    (',
'      :P4_INGREDIENTES_A_LOV IS NULL ',
'      OR ',
'        EXISTS',
'          (select 1 ',
'          from RECIPE_INGREDIENT ri',
'          where r.id = ri.idrecipe',
'            and instr('':''||UPPER(:P4_INGREDIENTES_A_LOV)||'':'','':''||UPPER(RI.name)||'':'') > 0',
'          )      ',
'    )   ',
'  AND ',
'    (',
'      :P4_INGREDIENTES_T_LOV IS NULL ',
'      OR ',
'      (',
'        (',
'          SELECT COUNT(*)',
'          FROM',
'            (',
'            select regexp_substr (UPPER(:P4_INGREDIENTES_T_LOV), ''[^:]+'', 1, rownum) as producto',
'            from dual',
'            connect by level <= length (regexp_replace (UPPER(:P4_INGREDIENTES_T_LOV), ''[^:]+''))  + 1',
'            )',
'        ) =',
'        (',
'          select COUNT(*)',
'          from RECIPE_INGREDIENT ri',
'          where r.id = ri.idrecipe',
'            and instr('':''||UPPER(:P4_INGREDIENTES_T_LOV)||'':'','':''||UPPER(RI.name)||'':'') > 0',
'        )',
'      )',
'    )  ',
'  AND',
'    (',
'      :P4_TAGS_A_LOV IS NULL',
'      OR',
'        EXISTS',
'          (',
'            select tags_des',
'            from',
'              (',
'              select regexp_substr (UPPER(tags_des), ''[^:]+'', 1, rownum) as tags_des',
'              from  (select r.tags as tags_des from dual)',
'              connect by level <= length (regexp_replace (UPPER(tags_des), ''[^:]+''))  + 1',
'              )',
'            where instr('':''||UPPER(:P4_TAGS_A_LOV)||'':'','':''||UPPER(tags_des)||'':'') > 0',
'          )',
'    )    ',
'  AND',
'    (',
'      :P4_TAGS_T_LOV IS NULL',
'      OR',
'      (',
'        (',
'          SELECT COUNT(*)',
'          FROM',
'            (',
'            select regexp_substr (UPPER(:P4_TAGS_T_LOV), ''[^:]+'', 1, rownum) as producto',
'            from dual',
'            connect by level <= length (regexp_replace (UPPER(:P4_TAGS_T_LOV), ''[^:]+''))  + 1',
'            )',
'        ) =',
'         (',
'          select COUNT(*)',
'          from',
'            (',
'            select regexp_substr (UPPER(tags_des), ''[^:]+'', 1, rownum) as tags_des',
'            from  (select r.tags as tags_des from dual)',
'            connect by level <= length (regexp_replace (UPPER(tags_des), ''[^:]+''))  + 1',
'            )',
'          where instr('':''||UPPER(:P4_TAGS_T_LOV)||'':'','':''||UPPER(tags_des)||'':'') > 0',
'          )',
'      )',
'    )        ',
'order by name'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P4_DISPLAY_AS,P4_SEARCH,P4_PERSONAS,P4_INGREDIENTES_A_LOV,P4_INGREDIENTES_T_LOV,P4_TAGS_A_LOV,P4_TAGS_T_LOV,P4_VALORACION'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(12518836940418295)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No hay recetas!!!'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12262232288434644)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>60
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12259728382434619)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12259804117434620)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'Card Text'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12259984730434621)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtext'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12259611076434618)
,p_query_column_id=>5
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>10
,p_column_heading=>'Card Link'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12260001484434622)
,p_query_column_id=>6
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>50
,p_column_heading=>'Card Initials'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12684707128709731)
,p_plug_name=>'Filtros'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(12487110258418274)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12909729293261316)
,p_plug_name=>'Recetas tabla'
,p_region_name=>'report_region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_imp.id(12453974867418259)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    r.id,',
'    r.name,',
'    r.personas,',
'    r.time,',
'    r.DIFFICULTY,',
'    r.observation,',
'    r.starrating,',
'       (',
'        select ',
'          LISTAGG(span_estrella, '' '')',
'                WITHIN GROUP (ORDER BY fila) AS span_estrella',
'        from',
'          (',
'          SELECT rownum as fila,',
'            case',
'              when rownum <= STARRATING then ''<span class="fa fa-star" style="color:orange;"></span>''',
'              else ''<span class="fa fa-star" style="color:grey;"></span>''',
'            end as span_estrella',
'          FROM Dual',
'          CONNECT BY rownum <= 10',
'          )',
'        ) as ESTRELLAS ,',
'    (SELECT',
'      LISTAGG(RI.name, '', '') WITHIN GROUP (ORDER BY RI.ID)',
'    FROM RECIPE_INGREDIENT RI',
'    WHERE r.id = ri.idrecipe   ',
'    ) as ingredientes    ',
'from RECIPE r',
'where ',
'    (',
'      :P4_SEARCH is null',
'      OR instr(upper(r.name),upper(:P4_SEARCH)) > 0 or',
'                instr(upper(r.observation),upper(:P4_SEARCH)) > 0 ',
'   )',
'  AND ',
'    (',
'      :P4_PERSONAS IS NULL ',
'      OR ',
'      R.personas = :P4_PERSONAS',
'    )',
'  AND ',
'    (',
'      :P4_VALORACION IS NULL ',
'      OR ',
'      NVL(R.starrating,0) >= NVL(:P4_VALORACION,0)',
'    )     ',
'  AND ',
'    (',
'      :P4_INGREDIENTES_A_LOV IS NULL ',
'      OR ',
'        EXISTS',
'          (select 1 ',
'          from RECIPE_INGREDIENT ri',
'          where r.id = ri.idrecipe',
'            and instr('':''||UPPER(:P4_INGREDIENTES_A_LOV)||'':'','':''||UPPER(RI.name)||'':'') > 0',
'          )      ',
'    )             ',
'  AND ',
'    (',
'      :P4_INGREDIENTES_T_LOV IS NULL ',
'      OR ',
'      (',
'        (',
'          SELECT COUNT(*)',
'          FROM',
'            (',
'            select regexp_substr (UPPER(:P4_INGREDIENTES_T_LOV), ''[^:]+'', 1, rownum) as producto',
'            from dual',
'            connect by level <= length (regexp_replace (UPPER(:P4_INGREDIENTES_T_LOV), ''[^:]+''))  + 1',
'            )',
'        ) =',
'        (',
'          select COUNT(*)',
'          from RECIPE_INGREDIENT ri',
'          where r.id = ri.idrecipe',
'            and instr('':''||UPPER(:P4_INGREDIENTES_T_LOV)||'':'','':''||UPPER(RI.name)||'':'') > 0',
'        )',
'      )',
'    )     ',
'  AND',
'    (',
'      :P4_TAGS_A_LOV IS NULL',
'      OR',
'        EXISTS',
'          (',
'            select tags_des',
'            from',
'              (',
'              select regexp_substr (UPPER(tags_des), ''[^:]+'', 1, rownum) as tags_des',
'              from  (select r.tags as tags_des from dual)',
'              connect by level <= length (regexp_replace (UPPER(tags_des), ''[^:]+''))  + 1',
'              )',
'            where instr('':''||UPPER(:P4_TAGS_A_LOV)||'':'','':''||UPPER(tags_des)||'':'') > 0',
'          )',
'    )      ',
'order by name'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P4_DISPLAY_AS,P4_SEARCH,P4_PERSONAS,P4_INGREDIENTES_A_LOV,P4_INGREDIENTES_T_LOV,P4_TAGS_A_LOV,P4_TAGS_T_LOV,P4_VALORACION'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Recetas tabla'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12909840537261317)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No hay recetas!!!'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_ID,P6_MOSTRAR_PANEL_IZQUIERDA:#ID#,N'
,p_detail_link_text=>'<img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'JORTRI'
,p_internal_uid=>12909840537261317
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12909921973261318)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12910069789261319)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nombre'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12910186421261320)
,p_db_column_name=>'PERSONAS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Personas'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12910240621261321)
,p_db_column_name=>'TIME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tiempo'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12910428869261323)
,p_db_column_name=>'STARRATING'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>unistr('Valoraci\00F3n (n\00FAmerica)')
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12910535982261324)
,p_db_column_name=>'ESTRELLAS'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>unistr('Valoraci\00F3n')
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12910317558261322)
,p_db_column_name=>'OBSERVATION'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Observaciones'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12910602707261325)
,p_db_column_name=>'INGREDIENTES'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ingredientes'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13752152389755233)
,p_db_column_name=>'DIFFICULTY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Dificultad'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12989046432065463)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'129891'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:PERSONAS:TIME:ESTRELLAS:OBSERVATION:INGREDIENTES:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12258687378434608)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12258510296434607)
,p_button_name=>'GESTION_RECETA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(12567955626418331)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Gestionar'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6::'
,p_icon_css_classes=>'fa-archive'
,p_button_comment=>unistr('Acceda al formulario completo de gesti\00F3n para dar de alta nuevas recetas')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12685255784709732)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12684707128709731)
,p_button_name=>'RESET'
,p_button_static_id=>'reset_button'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(12567955626418331)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12260484275434626)
,p_name=>'P4_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12684707128709731)
,p_prompt=>'Buscar'
,p_placeholder=>'Buscar recetas'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(12565064256418327)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12260832916434630)
,p_name=>'P4_PERSONAS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12684707128709731)
,p_prompt=>'Personas'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_field_template=>wwv_flow_imp.id(12565293941418328)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_02=>'10'
,p_attribute_03=>'left'
,p_attribute_04=>'numeric'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12909601864261315)
,p_name=>'P4_DISPLAY_AS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12909566637261314)
,p_item_default=>'CARDS'
,p_prompt=>'Mostrar como'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'TIPOS_MOSTRAR_RESULTADOS'
,p_lov=>'.'||wwv_flow_imp.id(12991602203163316)||'.'
,p_field_template=>wwv_flow_imp.id(12565064256418327)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_escape_on_http_output=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12912556184261344)
,p_name=>'P4_INGREDIENTES_A_LOV'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12684707128709731)
,p_prompt=>'Ingredientes (cualquiera)'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'INGREDIENTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT Initcap(name) d, Initcap(name) r',
'FROM RECIPE_INGREDIENT',
'GROUP BY Initcap(name)',
'ORDER BY 1'))
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(12565293941418328)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Marca todos los ingredientes y mostrara recetas que tenga alguno de ellos'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_attribute_11=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12912641801261345)
,p_name=>'P4_INGREDIENTES_T_LOV'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12684707128709731)
,p_prompt=>'Ingredientes (todos)'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'INGREDIENTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT Initcap(name) d, Initcap(name) r',
'FROM RECIPE_INGREDIENT',
'GROUP BY Initcap(name)',
'ORDER BY 1'))
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(12565293941418328)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Marca todos los ingredientes y mostrara recetas que tenga todos los marcados'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_attribute_11=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12913000818261349)
,p_name=>'P4_TAGS_A_LOV'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12684707128709731)
,p_prompt=>'Etiquetas (cualquiera)'
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
,p_field_template=>wwv_flow_imp.id(12565293941418328)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Marca todas las etiquetas y mostrara recetas que tenga alguna de ellas'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_attribute_11=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12913194102261350)
,p_name=>'P4_TAGS_T_LOV'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12684707128709731)
,p_prompt=>'Etiquetas (todos)'
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
,p_field_template=>wwv_flow_imp.id(12565293941418328)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Marca todas las etiquetas y mostrara recetas que tenga todas las marcadas'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_attribute_11=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13108980963766001)
,p_name=>'P4_VALORACION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12684707128709731)
,p_prompt=>unistr('Valoraci\00F3n (>)')
,p_display_as=>'NATIVE_STAR_RATING'
,p_field_template=>wwv_flow_imp.id(12565293941418328)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Coge valoraciones mayores de la indicada'
,p_attribute_01=>'10'
,p_attribute_02=>'N'
,p_attribute_03=>'fa-star'
,p_attribute_04=>'#ffa500'
,p_attribute_05=>'#808080'
,p_attribute_06=>'Valor seleccionado #VALUE#'
,p_attribute_07=>'Y'
,p_attribute_08=>'N'
,p_attribute_09=>'STARS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12260564430434627)
,p_name=>'Busqueda Intro'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keydown'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12260658299434628)
,p_event_id=>wwv_flow_imp.id(12260564430434627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12683891342709728)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12260777167434629)
,p_event_id=>wwv_flow_imp.id(12260564430434627)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12260208265434624)
,p_name=>'Limpiar Filtros'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12685255784709732)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12260374767434625)
,p_event_id=>wwv_flow_imp.id(12260208265434624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4_SEARCH,P4_PERSONAS,P4_INGREDIENTES_A_LOV,P4_INGREDIENTES_T_LOV,P4_TAGS_A_LOV,P4_TAGS_T_LOV,P4_VALORACION'
);
wwv_flow_imp.component_end;
end;
/
