prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 125
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(12570831983418340)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(12418865527418238)
,p_default_dialog_template=>wwv_flow_imp.id(12413651154418235)
,p_error_template=>wwv_flow_imp.id(12403673113418230)
,p_printer_friendly_template=>wwv_flow_imp.id(12418865527418238)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(12403673113418230)
,p_default_button_template=>wwv_flow_imp.id(12567825914418331)
,p_default_region_template=>wwv_flow_imp.id(12461234257418262)
,p_default_chart_template=>wwv_flow_imp.id(12461234257418262)
,p_default_form_template=>wwv_flow_imp.id(12461234257418262)
,p_default_reportr_template=>wwv_flow_imp.id(12461234257418262)
,p_default_tabform_template=>wwv_flow_imp.id(12461234257418262)
,p_default_wizard_template=>wwv_flow_imp.id(12461234257418262)
,p_default_menur_template=>wwv_flow_imp.id(12473689497418268)
,p_default_listr_template=>wwv_flow_imp.id(12461234257418262)
,p_default_irr_template=>wwv_flow_imp.id(12453974867418259)
,p_default_report_template=>wwv_flow_imp.id(12530491553418302)
,p_default_label_template=>wwv_flow_imp.id(12565313901418328)
,p_default_menu_template=>wwv_flow_imp.id(12569419779418332)
,p_default_calendar_template=>wwv_flow_imp.id(12569544260418333)
,p_default_list_template=>wwv_flow_imp.id(12555203477418320)
,p_default_nav_list_template=>wwv_flow_imp.id(12564069317418326)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(12564069317418326)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(12562223844418325)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(12478892201418270)
,p_default_dialogr_template=>wwv_flow_imp.id(12428902632418246)
,p_default_option_label=>wwv_flow_imp.id(12565313901418328)
,p_default_required_label=>wwv_flow_imp.id(12566612029418329)
,p_default_navbar_list_template=>wwv_flow_imp.id(12561858633418324)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/22.2/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
