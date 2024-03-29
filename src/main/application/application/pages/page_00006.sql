prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>'Receta (Maestro)'
,p_alias=>'RECETA-MAESTRO'
,p_step_title=>'Receta'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//Los mensajes de aviso que se muestran al volver de cada diaologo modal ',
'//de insercion/edicion -> hacer que desaparezcan transcurridos un rato',
'apex.jQuery(function() {',
'  apex.theme42.util.configAPEXMsgs({',
'    autoDismiss: true,',
'    duration: 5000  // duration is optional (Default is 3000 milliseconds)',
'  });',
'});',
'',
'',
'',
'//Para el carrosul de imagenes',
'$(function() {',
'	''use strict'';',
'',
'	var slider = $(''#slider''),',
'	sliderList = $(''<ul></ul>''),',
'	bulletList = $(''<ul></ul''),',
'	sliderJSON =  sliderJSON =  JSON.parse($v( "P6_STORE_SLIDER_JSON" )) ;',
'	sliderJSON.sort(function(a, b) {',
'		return a.order - b.order;',
'	});',
'',
'	$.each(sliderJSON, function(index, element) {',
'		sliderList.append("<li><a href=''"+ element.url +"''><img src=''" + element.imagePath + "'' alt=''''></a>");',
'         //+ "<div class=''content''>"+ element.slideText +"</div></li>");',
'		bulletList.append("<li id=''bullet_"+ (index + 1) +"''></li>");',
'	});',
'',
'	',
'	sliderList.addClass(''sliderList'');',
'	bulletList.addClass(''bulletList'');',
'	slider.append(sliderList);',
'	slider.append(bulletList);',
'',
'	bulletList.find("li:first-child").addClass(''bulletActive'');',
'',
'	var firstSlide = sliderList.find("li:first-child"),',
'	lastSlide = sliderList.find("li:last-child"),',
'	buttonPrev = $(".button-prev"),',
'	buttonNext = $(".button-next"),',
'	sliderCount = sliderList.children().length,',
'	sliderWidth = 100.0 / sliderCount,',
'	slideIndex = 0,',
'	intervalID;',
'',
'	lastSlide.clone().prependTo(sliderList);',
'	firstSlide.clone().appendTo(sliderList);',
'',
'	sliderList.css({"width": (100 * sliderCount) + "%"});',
'	sliderList.css({"margin-left": "-100%"});',
'',
'	sliderList.find("li").each(function(index) {',
'		var leftPercent = (sliderWidth * index) + "%";',
'		$(this).css({"left": leftPercent});',
'		$(this).css({"width": sliderWidth + "%"});',
'	});',
'',
'	buttonPrev.on(''click'', function() {',
'		slide(slideIndex - 1);',
'	});',
'	buttonNext.on(''click'', function() {',
'		slide(slideIndex + 1);',
'	});',
'	$(''.bulletList li'').on(''click'', function() {',
'		var id = ($(this).attr(''id'').split(''_'')[1]) - 1;',
'		slide(id);',
'	});',
'',
'	startTimer();',
'	slider.on(''mouseenter mouseleave'', function(e){ ',
'    	var onMouEnt = (e.type === ''mouseenter'') ?  ',
'        clearInterval(intervalID) : startTimer();               ',
'	});',
'',
'',
'	function slide(newSlideIndex) {',
'',
'		var marginLeft = (newSlideIndex * (-100) - 100) + "%";',
'		sliderList.animate({"margin-left": marginLeft}, 400, function() {',
'			if ( newSlideIndex < 0 ) {',
'				$(".bulletActive").removeClass(''bulletActive'');',
'				bulletList.find("li:last-child").addClass("bulletActive");',
'				sliderList.css({"margin-left": ((sliderCount) * (-100)) + "%"});',
'        		newSlideIndex = sliderCount - 1;',
'        		slideIndex = newSlideIndex;',
'        		return;',
'			} else if ( newSlideIndex >= sliderCount ) {',
'				$(".bulletActive").removeClass(''bulletActive'');',
'				bulletList.find("li:first-child").addClass("bulletActive");',
'				sliderList.css({"margin-left": "-100%"});',
'				newSlideIndex = 0;',
'				slideIndex = newSlideIndex;',
'				return;',
'			}',
'			$(".bulletActive").removeClass(''bulletActive'');',
'			bulletList.find(''li:nth-child(''+ (newSlideIndex + 1) +'')'').addClass(''bulletActive'');',
'			slideIndex = newSlideIndex;',
'		});',
'	};',
'',
'	function startTimer() {',
'		intervalID = setInterval(function() { buttonNext.click(); }, 5000);',
'		return intervalID;',
'	};',
'});'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//prefijo items de esta pantalla',
'var pagePrefix = ''P'' + $(''#pFlowStepId'').val();',
'',
'//cuerpo de la pagina',
'var $body = $(''.t-PageBody'');',
'',
'//Sacamos el valor que tiene el campo oculto de pantalla para saber si tenemos que mostrar o no el panel izquierdo',
'//cuando entremos a la pantalla',
'var mostrarPanelIzqID = pagePrefix + ''_MOSTRAR_PANEL_IZQUIERDA'';',
'var $mostrarPanelIzq = $(''#'' + mostrarPanelIzqID);',
'var mostrarPanelIzq = $v(mostrarPanelIzqID);',
'',
'//Mostrar toda la barra izquierda con filtro de busqueda y toda la lista recetas',
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
'//Ocultar toda la barra izquierda con filtro de busqueda y toda la lista recetas',
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
'',
'if (mostrarPanelIzq === ''S'') {',
'    showLeftColumn();',
'} else {',
'    hideLeftColumn();',
'}',
'',
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Scroll Results Only in Side Column */',
'.t-Body-side {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'}',
'.search-results {',
'    flex: 1;',
'    overflow: auto;',
'}',
'/* Format Search Region */',
'.search-region {',
'    border-bottom: 1px solid rgba(0,0,0,.1);',
'    flex-shrink: 0;',
'}',
'',
unistr('/* La columna IMAGE de la tabla de imagenes, le vamos a fijar el tama\00F1o*/'),
'td[headers~="IMAGE"] img {',
'  width: 100%;',
'} ',
'',
'',
'/*',
' * Todos los siguientes son para la apariencia del carrusel',
'*/',
'/*',
'img{',
'	width: 100%;',
'}',
'*/',
'.t-Form-fieldContainer--floatingLabel .t-Form-inputContainer .apex-item-display-only{',
'	border-style:none;',
'	background-color: rgba(0,0,0,0);',
'	border-color: rgba(0,0,0,0);',
'	padding-top: 0px;',
'	min-height: 0px;',
'}',
'',
'/*',
unistr(' * Para pantalla de movil el slider especificamos un tama\00F1o menor'),
' */',
'@media (max-width: 400px){',
'',
'    .slider {',
'    width: 100% !important;',
'    overflow: hidden !important;',
'    height: 370px !important;',
'    position: relative !important;',
'    }',
'',
'}',
'',
'/*',
unistr(' * Para el resto el slider especificamos un tama\00F1o mayor'),
' */',
'.slider {',
'  width: 100%;',
'  overflow: hidden;',
'  height: 1000px;',
'  position: relative;',
'}',
'',
'',
'.sliderList {',
'  position: absolute;',
'  top: 0;',
'  width: 300%;',
'  height: 100%;',
'  list-style: none;',
'}',
'',
'.sliderList li {',
'  position: absolute;',
'  top: 0;',
'  bottom: 0;',
'  overflow: hidden;',
'  width: 33.333333%;',
'  height: 100%;',
'  padding: 0;',
'  margin: 0;',
'}',
'',
'.sliderList li img {',
'  width: 100%;',
'  border: none;',
'}',
'',
'.bulletList {',
'  position: absolute;',
'  bottom: 15px;',
'  width: 100%;',
'  margin: 0px 38% 0px 38%;',
'  list-style: none;',
'}',
'',
'.bulletList li {',
'  display: inline-block;',
'  width: 12px;',
'  height: 12px;',
'  margin: 0 5px;',
'  -webkit-border-radius: 50%;',
'  -moz-border-radius: 50%;',
'  -ms-border-radius: 50%;',
'  border-radius: 50%;',
'  background-color: #4040407d;',
'  cursor: pointer;',
'}',
'',
'.bulletList .bulletActive { background-color: #0b0d18; }',
'',
'',
'',
'.button {',
'  position: absolute;',
'  bottom: 15px;',
'  z-index: 2;',
'  display: block;',
'  width: 40px;',
'  height: 40px;',
'  box-sizing: border-box;',
'  margin: 0;',
'  padding: 0;',
'  border: none;',
'  -webkit-border-radius: 5px;',
'  -moz-border-radius: 5px;',
'  -ms-border-radius: 5px;',
'  border-radius: 5px;',
'  background-color: rgb(5 0 36 / 21%);',
'  color: #fff;',
'}',
'',
'.button-prev { left: 15px; }',
'',
'.button-next { right: 15px; }',
'',
'',
'',
''))
,p_step_template=>wwv_flow_imp.id(12395935425418225)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20230627081711'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10575082140126931)
,p_plug_name=>'Carrusel fotos'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(12461234257418262)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="slider" id="slider">',
'  <button type="button" class="button button-prev">',
'    <i class="fa fa-chevron-left" aria-hidden="true"></i>',
'  </button>',
'  <button type="button" class="button button-next">',
'    <i class="fa fa-chevron-right" aria-hidden="true"></i>',
'  </button>',
'</div>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''X'' ',
'FROM RECIPE_PHOTO ',
'WHERE :P6_ID IS NOT NULL',
'    AND IDRECIPE = :P6_ID'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11031457734272903)
,p_name=>'Media'
,p_template=>wwv_flow_imp.id(12461234257418262)
,p_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'t-Report--stretch:#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       ID,',
'       IDRECIPE,',
'       TYPE,',
'       DESCRIPTION,',
'       CASE',
'        WHEN TYPE = ''U'' THEN ''<a href="''||URL||''" target="_blank"><span aria-hidden="true" class="fa fa-eye fa-2x fa-anim-spin fam-arrow-right fam-is-info fa-lg"></span></a>''',
'        WHEN TYPE = ''V'' AND URL LIKE ''<iframe%'' THEN URL',
'        ELSE',
'        ''<iframe src="'' || URL || ''" width="100%" height="330px" scrolling="no" style="border:0;" allowfullscreen></iframe>'' ',
'       END as URL,       ',
'       CREATED,',
'       CREATED_BY,',
'       UPDATED,',
'       UPDATED_BY',
'  from RECIPE_MEDIA',
' where "IDRECIPE" = :P6_ID',
' order by ID'))
,p_display_when_condition=>'P6_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(12530491553418302)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No tiene media'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11031544888272904)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>10
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,:P12_ID:#ID#'
,p_column_linktext=>'<span aria-label="Edit"><img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></span></span>'
,p_heading_alignment=>'LEFT'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11031600412272905)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11031700839272906)
,p_query_column_id=>3
,p_column_alias=>'IDRECIPE'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11032650620272915)
,p_query_column_id=>4
,p_column_alias=>'TYPE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11031913799272908)
,p_query_column_id=>5
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Descripci\00F3n')
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11032788886272916)
,p_query_column_id=>6
,p_column_alias=>'URL'
,p_column_display_sequence=>40
,p_column_heading=>'Media'
,p_column_format=>'PCT_GRAPH:::'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11032238516272911)
,p_query_column_id=>7
,p_column_alias=>'CREATED'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11032396864272912)
,p_query_column_id=>8
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11032475038272913)
,p_query_column_id=>9
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11032578157272914)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12708698865903201)
,p_plug_name=>'Receta'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12496653443418281)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_region_image=>'#APP_FILES#icons/app-icon-192.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12709884304903203)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(12428902632418246)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12710666336903204)
,p_name=>'Recetas(resultados)'
,p_region_name=>'receta_resultados'
,p_template=>wwv_flow_imp.id(12487110258418274)
,p_display_sequence=>20
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'t-MediaList--showDesc:t-MediaList--stack'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ID",',
'    null LINK_CLASS,',
'    apex_page.get_url(p_items => ''P6_ID'', p_values => "ID") LINK,',
'    null ICON_CLASS,',
'    null LINK_ATTR,',
'    null ICON_COLOR_CLASS,',
'    case when coalesce(:P6_ID,''0'') = "ID"',
'      then ''is-active'' ',
'      else '' ''',
'    end LIST_CLASS,',
'    (substr("NAME", 1, 50)||( case when length("NAME") > 50 then ''...'' else '''' end )) LIST_TITLE,',
'    (substr("OBSERVATION", 1, 50)||( case when length("OBSERVATION") > 50 then ''...'' else '''' end )) LIST_TEXT,',
'    null LIST_BADGE',
'from "RECIPE" x',
'where (:P6_SEARCH is null',
'        or upper(x."NAME") like ''%''||upper(:P6_SEARCH)||''%''',
'        or upper(x."OBSERVATION") like ''%''||upper(:P6_SEARCH)||''%''',
'    )',
'order by "NAME"'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P6_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(12536648466418308)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'<div class="u-tC">Sin recetas.</div>'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12711350290903207)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12711718244903208)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12712132553903208)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12712502009903208)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'ICON_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12712977658903209)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'LINK_ATTR'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12713674158903209)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'ICON_COLOR_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12714021263903209)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'LIST_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12714430261903210)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'LIST_TITLE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12714842204903210)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'LIST_TEXT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12715291435903210)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'LIST_BADGE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12715649654903900)
,p_name=>'Receta'
,p_template=>wwv_flow_imp.id(12461234257418262)
,p_display_sequence=>10
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       NAME,',
'       PERSONAS,',
'       TIME,',
'       DIFFICULTY,',
'       OBSERVATION,',
'       CREATED,',
'       CREATED_BY,',
'       UPDATED,',
'       UPDATED_BY,',
'       STARRATING,',
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
'        ) as ESTRELLAS,',
'        REPLACE(tags,'':'','', '') as etiquetas_desglosadas',
'from RECIPE',
'where "ID" = :P6_ID'))
,p_display_when_condition=>'P6_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(12524435314418299)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Selecciona una receta'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Receta'
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
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12716280474903901)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'Id'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "ID" is not null',
'and "ID" = :P6_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12716610425903901)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Nombre:'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<span style="color:#337ac0;font-size:16pt;font-weight:bold;">#NAME#</span>'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "NAME" is not null',
'and "ID" = :P6_ID'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12717073575903902)
,p_query_column_id=>3
,p_column_alias=>'PERSONAS'
,p_column_display_sequence=>3
,p_column_heading=>unistr('N\00BA personas:')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "PERSONAS" is not null',
'and "ID" = :P6_ID'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12717426455903902)
,p_query_column_id=>4
,p_column_alias=>'TIME'
,p_column_display_sequence=>4
,p_column_heading=>'Tiempo:'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "TIME" is not null',
'and "ID" = :P6_ID'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13752057227755232)
,p_query_column_id=>5
,p_column_alias=>'DIFFICULTY'
,p_column_display_sequence=>14
,p_column_heading=>'Dificultad:'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "DIFFICULTY" is not null',
'and "ID" = :P6_ID'))
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(8332482041298339)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12717813655903902)
,p_query_column_id=>6
,p_column_alias=>'OBSERVATION'
,p_column_display_sequence=>44
,p_column_heading=>'Observaciones:'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "OBSERVATION" is not null',
'and "ID" = :P6_ID'))
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'MARKDOWN'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12718206581903902)
,p_query_column_id=>7
,p_column_alias=>'CREATED'
,p_column_display_sequence=>64
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "CREATED" is not null',
'and "ID" = :P6_ID'))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12718634374903903)
,p_query_column_id=>8
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>74
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "CREATED_BY" is not null',
'and "ID" = :P6_ID'))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12719098257903903)
,p_query_column_id=>9
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>84
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "UPDATED" is not null',
'and "ID" = :P6_ID'))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12719457533903903)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>94
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "RECIPE"',
'where "UPDATED_BY" is not null',
'and "ID" = :P6_ID'))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12909364701261312)
,p_query_column_id=>11
,p_column_alias=>'STARRATING'
,p_column_display_sequence=>24
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12909426864261313)
,p_query_column_id=>12
,p_column_alias=>'ESTRELLAS'
,p_column_display_sequence=>34
,p_column_heading=>'Estrellas:'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12912916943261348)
,p_query_column_id=>13
,p_column_alias=>'ETIQUETAS_DESGLOSADAS'
,p_column_display_sequence=>54
,p_column_heading=>'Etiquetas:'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12725962874903910)
,p_plug_name=>'Region Display Selector'
,p_region_css_classes=>'js-detail-rds'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(12428902632418246)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P6_ID'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'NO'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12726375827903910)
,p_name=>'Ingredientes'
,p_template=>wwv_flow_imp.id(12461234257418262)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'t-Report--stretch:#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'RECIPE_INGREDIENT'
,p_query_where=>'"IDRECIPE" = :P6_ID'
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'ID'
,p_include_rowid_column=>true
,p_display_when_condition=>'P6_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(12530491553418302)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No tiene ingredientes'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12727074997904254)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:RP:P8_ROWID:#ROWID#'
,p_column_linktext=>'<span aria-label="Edit"><img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></span></span>'
,p_heading_alignment=>'LEFT'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12727425040904255)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12727873477904255)
,p_query_column_id=>3
,p_column_alias=>'IDRECIPE'
,p_column_display_sequence=>3
,p_column_heading=>'Idrecipe'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12728241189904255)
,p_query_column_id=>4
,p_column_alias=>'NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Ingrediente'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12728621282904255)
,p_query_column_id=>5
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>24
,p_column_heading=>'Cantidad'
,p_use_as_row_header=>'N'
,p_column_format=>'FM999G999G999G999G990D90'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12729039221904255)
,p_query_column_id=>6
,p_column_alias=>'IDMEASURE'
,p_column_display_sequence=>34
,p_column_heading=>'T. Medida'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'TEXT_FROM_LOV_ESC'
,p_named_lov=>wwv_flow_imp.id(12882112713307511)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12729424832904256)
,p_query_column_id=>7
,p_column_alias=>'CREATED'
,p_column_display_sequence=>44
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12729832093904256)
,p_query_column_id=>8
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>54
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12730255688904256)
,p_query_column_id=>9
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>64
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12730654092904256)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>74
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp.component_end;
end;
/
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12912151576261340)
,p_query_column_id=>11
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>14
,p_column_heading=>unistr('Descripci\00F3n adicional')
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12748736538904286)
,p_name=>'Pasos'
,p_template=>wwv_flow_imp.id(12461234257418262)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'t-Report--stretch:#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'RECIPE_STEP'
,p_query_where=>'"IDRECIPE" = :P6_ID'
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'STEP'
,p_include_rowid_column=>true
,p_display_when_condition=>'P6_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(12530491553418302)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No tiene pasos'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12749449164904629)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:RP:P9_ROWID:#ROWID#'
,p_column_linktext=>'<span aria-label="Edit"><img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></span></span>'
,p_heading_alignment=>'LEFT'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12749803252904630)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12750268852904630)
,p_query_column_id=>3
,p_column_alias=>'IDRECIPE'
,p_column_display_sequence=>3
,p_column_heading=>'Idrecipe'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12750657867904630)
,p_query_column_id=>4
,p_column_alias=>'STEP'
,p_column_display_sequence=>4
,p_column_heading=>'Orden'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12751066052904630)
,p_query_column_id=>5
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>5
,p_column_heading=>unistr('Descripci\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_as=>'RICH_TEXT'
,p_attribute_01=>'HTML'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12751422005904630)
,p_query_column_id=>6
,p_column_alias=>'CREATED'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12751894693904631)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12752272017904631)
,p_query_column_id=>8
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12752690819904631)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>9
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12769799876904645)
,p_name=>'Fotos'
,p_template=>wwv_flow_imp.id(12461234257418262)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       ID,',
'       IDRECIPE,',
'       PHOTO,',
'       CREATED,',
'       CREATED_BY,',
'       UPDATED,',
'       UPDATED_BY,',
'       NAMEFILE,',
'       MIMETYPE,',
'       DBMS_LOB.GETLENGTH(PHOTO) IMAGE',
'  from RECIPE_PHOTO',
' where "IDRECIPE" = :P6_ID',
'order by id '))
,p_display_when_condition=>'P6_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(12530491553418302)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No tiene fotos'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12770406135904989)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:RP:P10_ROWID:#ROWID#'
,p_column_linktext=>'<span aria-label="Edit"><img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></span></span>'
,p_heading_alignment=>'LEFT'
,p_report_column_width=>32
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12770804637904989)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12771230659904990)
,p_query_column_id=>3
,p_column_alias=>'IDRECIPE'
,p_column_display_sequence=>3
,p_column_heading=>'Idrecipe'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12771629236904990)
,p_query_column_id=>4
,p_column_alias=>'PHOTO'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12772059041904990)
,p_query_column_id=>5
,p_column_alias=>'CREATED'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12772462798904990)
,p_query_column_id=>6
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>6
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12772852636904991)
,p_query_column_id=>7
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>7
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12773217263904991)
,p_query_column_id=>8
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>8
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12908976589261308)
,p_query_column_id=>9
,p_column_alias=>'NAMEFILE'
,p_column_display_sequence=>18
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12909070827261309)
,p_query_column_id=>10
,p_column_alias=>'MIMETYPE'
,p_column_display_sequence=>28
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12909196296261310)
,p_query_column_id=>11
,p_column_alias=>'IMAGE'
,p_column_display_sequence=>38
,p_column_heading=>'Imagen'
,p_use_as_row_header=>'N'
,p_column_format=>'IMAGE:RECIPE_PHOTO:PHOTO:ID::MIMETYPE:NAMEFILE:::::'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12789327917905003)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12428902632418246)
,p_plug_display_sequence=>100
,p_plug_source=>'Selecciona una receta'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P6_ID'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11032991024272918)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11031457734272903)
,p_button_name=>'POP_RECIPE_MEDIA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(12567199310418330)
,p_button_image_alt=>unistr('A\00F1adir un media')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_IDRECIPE:&P6_ID.'
,p_icon_css_classes=>'fa-plus'
,p_button_comment=>unistr('A\00F1adir un recurso media')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12734783145904260)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12726375827903910)
,p_button_name=>'POP_RECIPE_INGREDIENT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(12567199310418330)
,p_button_image_alt=>unistr('A\00F1adir un ingrediente')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:RP,8:P8_IDRECIPE:&P6_ID.'
,p_icon_css_classes=>'fa-plus'
,p_button_comment=>unistr('A\00F1adir un ingrediente')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12756457713904634)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12748736538904286)
,p_button_name=>'POP_RECIPE_STEP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(12567199310418330)
,p_button_image_alt=>unistr('A\00F1adir paso')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&APP_SESSION.::&DEBUG.:RP,9:P9_IDRECIPE:&P6_ID.'
,p_icon_css_classes=>'fa-plus'
,p_button_comment=>unistr('A\00F1adir un paso')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12776733084904994)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12769799876904645)
,p_button_name=>'POP_RECIPE_PHOTO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(12567199310418330)
,p_button_image_alt=>unistr('A\00F1adir foto')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:RP,10:P10_IDRECIPE:&P6_ID.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12789833035905004)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12715649654903900)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(12567955626418331)
,p_button_image_alt=>'Editar'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:RP,7:P7_ID:&P6_ID.'
,p_icon_css_classes=>'fa-pencil-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12262134092434643)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12708698865903201)
,p_button_name=>'VOLVER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(12567955626418331)
,p_button_image_alt=>'Volver'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.:RESET:&DEBUG.:RP,6::'
,p_icon_css_classes=>'fa-backward'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12709170462903202)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(12708698865903201)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(12567955626418331)
,p_button_image_alt=>'Limpiar'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&APP_SESSION.:RESET:&DEBUG.:RP,6::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12709586084903202)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12708698865903201)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(12567955626418331)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&APP_SESSION.::&DEBUG.:RP,7::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10623771593199736)
,p_name=>'P6_STORE_SLIDER_JSON'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10575082140126931)
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12710220746903203)
,p_name=>'P6_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12709884304903203)
,p_prompt=>'Buscar'
,p_placeholder=>'Buscar'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(12565064256418327)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--postTextBlock'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12725506650903909)
,p_name=>'P6_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12715649654903900)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13751822056755230)
,p_name=>'P6_MOSTRAR_PANEL_IZQUIERDA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12708698865903201)
,p_item_default=>'S'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-Por defecto con "S" -> muestra el panel izquierdo con la bsuqueda y el listado de todas las recetas.',
unistr('-Pero si la pantalla es invocada con valor "N" (acceder al detalle de una receta concreta), vamos a evitar salga este panel, dado que por ejemplo en la aplicaci\00F3n movil es molesto')))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12790155019905004)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(12715649654903900)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12790773878905004)
,p_event_id=>wwv_flow_imp.id(12790155019905004)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12715649654903900)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13753008032755242)
,p_event_id=>wwv_flow_imp.id(12790155019905004)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.showPageSuccess(''Receta actualizada.'');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12726409863903910)
,p_name=>'Dialog Closed'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(12726375827903910)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12735408051904261)
,p_event_id=>wwv_flow_imp.id(12726409863903910)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12726375827903910)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18475933210716438)
,p_event_id=>wwv_flow_imp.id(12726409863903910)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.showPageSuccess(''Ingrediente actualizado.'');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11033092965272919)
,p_name=>'Dialog Closed Media'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11031457734272903)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11033180220272920)
,p_event_id=>wwv_flow_imp.id(11033092965272919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11031457734272903)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11033211544272921)
,p_event_id=>wwv_flow_imp.id(11033092965272919)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.showPageSuccess(''Recurso media actualizado.'');',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12748884667904286)
,p_name=>'Dialog Closed'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(12748736538904286)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12757149551904634)
,p_event_id=>wwv_flow_imp.id(12748884667904286)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12748736538904286)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12757627554904635)
,p_event_id=>wwv_flow_imp.id(12748884667904286)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Paso actualizado.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12769853112904645)
,p_name=>'Dialog Closed'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(12769799876904645)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12777436409904994)
,p_event_id=>wwv_flow_imp.id(12769853112904645)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12769799876904645)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12777959663904994)
,p_event_id=>wwv_flow_imp.id(12769853112904645)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Foto actualizada.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12790235951905004)
,p_name=>'Perform Search'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12792096464905005)
,p_event_id=>wwv_flow_imp.id(12790235951905004)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(12710666336903204)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12792521147905005)
,p_event_id=>wwv_flow_imp.id(12790235951905004)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10575108656126932)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TRAER_CARRUSEL_IMAGENES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  --URL_SERVER_NAME VARCHAR2(500):= ''https://gdbbf7e48b23eea-apexcurso.adb.eu-madrid-1.oraclecloudapps.com/ords/recetas/receta/foto/'';',
'  URL_SERVER_NAME VARCHAR2(500):= OWA_UTIL.get_cgi_env (''REQUEST_PROTOCOL'') || ''://'' || OWA_UTIL.get_cgi_env (''HTTP_HOST'') || ''/ords/'' || ''recetas/receta/foto/'';',
'',
'  --Use your Image Restful Service URL into URL_SERVER_NAME Variable',
'   CURSOR REPORT ',
'         IS  ',
'         SELECT ID',
'		 FROM RECIPE_PHOTO ',
'         WHERE IDRECIPE=:P6_ID;',
'			',
'		TYPE L_REPORT_TYPE IS RECORD ',
'	    ( ',
'        ID RECIPE_PHOTO.ID%TYPE',
'		); ',
'            ',
'		TYPE L_REPORT_TAB IS TABLE OF L_REPORT_TYPE; ',
'	    L_REPORT		L_REPORT_TAB; ',
'	 ',
'BEGIN',
'   OPEN REPORT; ',
'   FETCH REPORT BULK COLLECT INTO L_REPORT; ',
'    CLOSE REPORT;',
'   ',
'   APEX_JSON.INITIALIZE_CLOB_OUTPUT;',
'   APEX_JSON.OPEN_ARRAY; -- {',
'   IF L_REPORT.count > 0 THEN',
'   FOR L_CNT IN L_REPORT.FIRST .. L_REPORT.LAST ',
'   LOOP',
'       APEX_JSON.OPEN_OBJECT; -- {',
'       APEX_JSON.WRITE(''imagePath'',URL_SERVER_NAME||L_REPORT(L_CNT).ID);',
'       APEX_JSON.WRITE(''order'',  L_REPORT(L_CNT).ID);',
'       APEX_JSON.WRITE(''url'',  ''#'');',
'       APEX_JSON.CLOSE_OBJECT; -- } ',
'   END LOOP; ',
'   END IF;',
'   ',
'    APEX_JSON.CLOSE_ARRAY; -- } ',
'    :P6_STORE_SLIDER_JSON:=APEX_JSON.GET_CLOB_OUTPUT;',
'    apex_util.set_session_state(''P6_STORE_SLIDER_JSON'', APEX_JSON.GET_CLOB_OUTPUT);',
'    DBMS_OUTPUT.PUT_LINE(APEX_JSON.GET_CLOB_OUTPUT);',
'    APEX_JSON.FREE_OUTPUT;',
'  ',
' ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>10575108656126932
);
wwv_flow_imp.component_end;
end;
/
