prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Pruebas'
,p_alias=>'PRUEBA'
,p_step_title=>'Prueba'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(function() {',
'	''use strict'';',
'',
'	var slider = $(''#slider''),',
'	sliderList = $(''<ul></ul>''),',
'	bulletList = $(''<ul></ul''),',
'	sliderJSON =  sliderJSON =  JSON.parse($v( "P16_STORE_SLIDER_JSON" )) ;',
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
'		intervalID = setInterval(function() { buttonNext.click(); }, 10000);',
'		return intervalID;',
'	};',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'img{',
'	width: 100%;',
'}',
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
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(12596571602418379)
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20230616110346'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10574719506126928)
,p_plug_name=>'Carrusel'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(12461234257418262)
,p_plug_display_sequence=>30
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="slider" id="slider">',
'  <button type="button" class="button button-prev">',
'    <i class="fa fa-chevron-left" aria-hidden="true"></i>',
'  </button>',
'  <button type="button" class="button button-next">',
'    <i class="fa fa-chevron-right" aria-hidden="true"></i>',
'  </button>',
'</div>'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10574878066126929)
,p_name=>'P16_STORE_SLIDER_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10574719506126928)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(10574947702126930)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TRAER_CARRUSEL_IMAGENES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  URL_SERVER_NAME VARCHAR2(500):= ''https://gdbbf7e48b23eea-apexcurso.adb.eu-madrid-1.oraclecloudapps.com/ords/recetas/receta/foto/'';',
'  --Use your Image Restful Service URL into URL_SERVER_NAME Variable',
'   CURSOR REPORT ',
'         IS  ',
'         SELECT ID',
'		 FROM RECIPE_PHOTO ',
'         WHERE IDRECIPE=21;',
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
'                   OPEN REPORT; ',
'				   FETCH REPORT BULK COLLECT INTO L_REPORT; ',
'                    CLOSE REPORT;',
'                   ',
'                   APEX_JSON.INITIALIZE_CLOB_OUTPUT;',
'                   APEX_JSON.OPEN_ARRAY; -- {',
'                   FOR L_CNT IN L_REPORT.FIRST .. L_REPORT.LAST ',
'				   LOOP',
'                       APEX_JSON.OPEN_OBJECT; -- {',
'                       APEX_JSON.WRITE(''imagePath'',URL_SERVER_NAME||L_REPORT(L_CNT).ID);',
'                       APEX_JSON.WRITE(''order'',  L_REPORT(L_CNT).ID);',
'                       APEX_JSON.WRITE(''url'',  ''#'');',
'                       APEX_JSON.CLOSE_OBJECT; -- } ',
'                   END LOOP; ',
'                   ',
'                    APEX_JSON.CLOSE_ARRAY; -- } ',
'                    :P16_STORE_SLIDER_JSON:=APEX_JSON.GET_CLOB_OUTPUT;',
'                    apex_util.set_session_state(''P16_STORE_SLIDER_JSON'', APEX_JSON.GET_CLOB_OUTPUT);',
'                    DBMS_OUTPUT.PUT_LINE(APEX_JSON.GET_CLOB_OUTPUT);',
'                    APEX_JSON.FREE_OUTPUT;',
'  ',
' ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>10574947702126930
);
wwv_flow_imp.component_end;
end;
/
