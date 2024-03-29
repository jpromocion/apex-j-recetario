prompt --application/shared_components/plugins/item_type/de_danielh_clockpicker
begin
--   Manifest
--     PLUGIN: DE.DANIELH.CLOCKPICKER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(11173664159118911226)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'DE.DANIELH.CLOCKPICKER'
,p_display_name=>'ClockPicker'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','DE.DANIELH.CLOCKPICKER'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * ClockPicker Functions',
' * Version: 1.7.0 (22.12.2016)',
' * Author:  Daniel Hochleitner',
' *-------------------------------------',
'*/',
'FUNCTION render_clockpicker(p_item                IN apex_plugin.t_page_item,',
'                            p_plugin              IN apex_plugin.t_plugin,',
'                            p_value               IN VARCHAR2,',
'                            p_is_readonly         IN BOOLEAN,',
'                            p_is_printer_friendly IN BOOLEAN)',
'  RETURN apex_plugin.t_page_item_render_result IS',
'  -- plugin attributes',
'  l_result                  apex_plugin.t_page_item_render_result;',
'  l_placement               VARCHAR2(50) := p_item.attribute_01;',
'  l_align                   VARCHAR2(50) := p_item.attribute_02;',
'  l_autoclose               VARCHAR2(50) := p_item.attribute_03;',
'  l_done_btn_text           VARCHAR2(100) := p_item.attribute_04;',
'  l_12h_mode                VARCHAR2(50) := p_item.attribute_05;',
'  l_suppress_soft_keyboards NUMBER := p_item.attribute_06;',
'  l_show_clock_button       NUMBER := p_item.attribute_07;',
'  l_logging                 VARCHAR2(50) := p_item.attribute_08;',
'  -- other vars',
'  l_name            VARCHAR2(30);',
'  l_escaped_value   VARCHAR2(1000);',
'  l_onload_string   VARCHAR2(2000);',
'  l_html_string     VARCHAR2(2000);',
'  l_element_item_id VARCHAR2(200);',
'  --',
'BEGIN',
'  --',
'  -- Printer Friendly Display',
'  IF p_is_printer_friendly THEN',
'    apex_plugin_util.print_display_only(p_item_name        => p_item.name,',
'                                        p_display_value    => p_value,',
'                                        p_show_line_breaks => FALSE,',
'                                        p_escape           => TRUE,',
'                                        p_attributes       => p_item.element_attributes);',
'    -- Read Only Display',
'  ELSIF p_is_readonly THEN',
'    apex_plugin_util.print_hidden_if_readonly(p_item_name           => p_item.name,',
'                                              p_value               => p_value,',
'                                              p_is_readonly         => p_is_readonly,',
'                                              p_is_printer_friendly => p_is_printer_friendly);',
'    -- Normal Display',
'  ELSE',
'    --',
'    l_element_item_id := p_item.name;',
'    l_name            := apex_plugin.get_input_name_for_page_item(FALSE);',
'    l_escaped_value   := apex_escape.html(p_value);',
'    --',
'    l_html_string := ''<input '';',
'    l_html_string := l_html_string || ''type="text" '';',
'    l_html_string := l_html_string || ''name="'' || l_name || ''" '';',
'    l_html_string := l_html_string || ''id="'' || l_element_item_id || ''" '';',
'    l_html_string := l_html_string || ''value="'' || l_escaped_value || ''" '';',
'    l_html_string := l_html_string || ''size="'' || p_item.element_width || ''" '';',
'    -- suppress soft keyboard',
'    IF l_suppress_soft_keyboards = 1 THEN',
'      l_html_string := l_html_string || ''onfocus="blur();" '';',
'    END IF;',
'    --',
'    l_html_string := l_html_string || ''maxlength="'' ||',
'                     p_item.element_max_length || ''" '';',
'    l_html_string := l_html_string || '' '' || p_item.element_attributes ||',
'                     '' />'';',
'    -- show clock button',
'    IF l_show_clock_button = 1 THEN',
'      l_html_string := l_html_string ||',
'                       ''<span class="t-Form-itemText t-Form-itemText--post"><a id="'' ||',
'                       l_element_item_id ||',
'                       ''_button" class="a-Button a-Button--popupLOV clockpicker-btn" href="javascript:void(0);"><span class="fa fa-clock-o"></span></a></span>'';',
'      -- button style',
'      apex_css.add(p_css => ''.clockpicker-btn { box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.125) inset !important; }'',',
'                   p_key => ''clockpicker_style'');',
'    END IF;',
'    -- write item html',
'    htp.p(l_html_string);',
'    --',
'    -- Include the Bootstrap CSS',
'    apex_css.add_file(p_name      => ''bootstrap.min'',',
'                      p_directory => p_plugin.file_prefix || ''css/'');',
'    -- Include the ClockPicker CSS',
'    apex_css.add_file(p_name      => ''bootstrap-clockpicker.min'',',
'                      p_directory => p_plugin.file_prefix || ''css/'');',
'  ',
'    -- Include ClockPicker JS',
'    apex_javascript.add_library(p_name           => ''bootstrap-clockpicker.min'',',
'                                p_directory      => p_plugin.file_prefix ||',
'                                                    ''js/'',',
'                                p_version        => NULL,',
'                                p_skip_extension => FALSE);',
'    --',
'    apex_javascript.add_library(p_name           => ''apexclockpicker.min'',',
'                                p_directory      => p_plugin.file_prefix ||',
'                                                    ''js/'',',
'                                p_version        => NULL,',
'                                p_skip_extension => FALSE);',
'    --',
'    -- JS Onload Code',
'    l_onload_string := ''apexClockPicker.initClockPicker('' ||',
'                       apex_javascript.add_value(l_element_item_id) || ''{'' ||',
'                       apex_javascript.add_attribute(p_name      => ''placement'',',
'                                                     p_value     => l_placement,',
'                                                     p_add_comma => TRUE) ||',
'                       apex_javascript.add_attribute(p_name      => ''align'',',
'                                                     p_value     => l_align,',
'                                                     p_add_comma => TRUE) ||',
'                       apex_javascript.add_attribute(p_name      => ''autoclose'',',
'                                                     p_value     => l_autoclose,',
'                                                     p_add_comma => TRUE) ||',
'                       apex_javascript.add_attribute(p_name      => ''donetext'',',
'                                                     p_value     => l_done_btn_text,',
'                                                     p_add_comma => TRUE) ||',
'                       apex_javascript.add_attribute(p_name      => ''twelvehour'',',
'                                                     p_value     => l_12h_mode,',
'                                                     p_add_comma => TRUE) ||',
'                       apex_javascript.add_attribute(p_name      => ''showbutton'',',
'                                                     p_value     => l_show_clock_button,',
'                                                     p_add_comma => TRUE) ||',
'                       apex_javascript.add_attribute(p_name      => ''default'',',
'                                                     p_value     => ''now'',',
'                                                     p_add_comma => FALSE) || ''},'' ||',
'                       apex_javascript.add_value(l_logging,',
'                                                 FALSE) || '');'';',
'    --',
'    apex_javascript.add_inline_code(p_code => l_onload_string);',
'    --',
'  END IF;',
'  --',
'  l_result.is_navigable := TRUE;',
'  --',
'  RETURN(l_result);',
'  --',
'END render_clockpicker;'))
,p_api_version=>1
,p_render_function=>'render_clockpicker'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:ESCAPE_OUTPUT:SOURCE:ELEMENT:WIDTH:ELEMENT_OPTION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Clockpicker item plugin for APEX',
'In 24h and 12h format.',
'Original from: http://weareoutman.github.io/clockpicker/'))
,p_version_identifier=>'1.7.0'
,p_about_url=>'https://github.com/Dani3lSun/apex-plugin-clockpicker'
,p_files_version=>29
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11173664335692911231)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Placement'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'bottom'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Placement:</strong><br>',
'- bottom (default)<br>',
'- top <br>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11173682367762046501)
,p_plugin_attribute_id=>wwv_flow_imp.id(11173664335692911231)
,p_display_sequence=>10
,p_display_value=>'Bottom'
,p_return_value=>'bottom'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11173682787463046965)
,p_plugin_attribute_id=>wwv_flow_imp.id(11173664335692911231)
,p_display_sequence=>20
,p_display_value=>'Top'
,p_return_value=>'top'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11173720346688601582)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Align'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'left'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Placement:</strong><br>',
'- Left (default)<br>',
'- Right <br>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11173721012847602124)
,p_plugin_attribute_id=>wwv_flow_imp.id(11173720346688601582)
,p_display_sequence=>10
,p_display_value=>'Left'
,p_return_value=>'left'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11173721351248602846)
,p_plugin_attribute_id=>wwv_flow_imp.id(11173720346688601582)
,p_display_sequence=>20
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11173665208218911234)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Autoclose'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'true'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Autoclose:</strong><br>',
'- True (default)<br>',
'- False <br>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11173685369776065136)
,p_plugin_attribute_id=>wwv_flow_imp.id(11173665208218911234)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11173685736753065831)
,p_plugin_attribute_id=>wwv_flow_imp.id(11173665208218911234)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11173880698939635375)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Done Button Text'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Done'
,p_is_translatable=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Done Button Text:</strong><br>',
'When set to "autoclose false" a done button to close is displayed. Enter the displayed text.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11308936447208380480)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>35
,p_prompt=>'12h mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'false'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Choose if 12h mode (am/pm) is on or off.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11308938276692381294)
,p_plugin_attribute_id=>wwv_flow_imp.id(11308936447208380480)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(11308939145733382043)
,p_plugin_attribute_id=>wwv_flow_imp.id(11308936447208380480)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(15407500923150416583)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Suppress Mobile Keyboards'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'0'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Suppress the default behavior on mobile devices to fade out the soft keyboard.<br>',
'If set to Yes no keyboard is shown on mobile devices, but the possibility to enter free text is also suppressed.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15407506335930421062)
,p_plugin_attribute_id=>wwv_flow_imp.id(15407500923150416583)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'1'
,p_help_text=>'Suppress soft keyboards and free text input'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15407572362593424171)
,p_plugin_attribute_id=>wwv_flow_imp.id(15407500923150416583)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'0'
,p_help_text=>unistr('Default: Don\00B4t suppress soft keyboards and free text inputs')
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(61330578583802552)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>45
,p_prompt=>'Show clock button'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'0'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Choose if a small button with clock icon is shown on right side of item'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(61332397368803187)
,p_plugin_attribute_id=>wwv_flow_imp.id(61330578583802552)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'1'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(61332827236803635)
,p_plugin_attribute_id=>wwv_flow_imp.id(61330578583802552)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(76971828260830069)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Logging'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'false'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Whether to log events in the console.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(76973920443830974)
,p_plugin_attribute_id=>wwv_flow_imp.id(76971828260830069)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(76974333556831766)
,p_plugin_attribute_id=>wwv_flow_imp.id(76971828260830069)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
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
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2F204150455820436C6F636B7069636B65722066756E6374696F6E730A2F2F20417574686F723A2044616E69656C20486F63686C6569746E65720A2F2F2056657273696F6E3A20312E372E300A0A2F2F20676C6F62616C206E616D6573706163650A76';
wwv_flow_imp.g_varchar2_table(2) := '61722061706578436C6F636B5069636B6572203D207B0A202020202F2F20706172736520737472696E6720746F20626F6F6C65616E0A202020207061727365426F6F6C65616E3A2066756E6374696F6E2870537472696E6729207B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(3) := '7661722070426F6F6C65616E3B0A20202020202020206966202870537472696E672E746F4C6F776572436173652829203D3D2027747275652729207B0A20202020202020202020202070426F6F6C65616E203D20747275653B0A20202020202020207D0A';
wwv_flow_imp.g_varchar2_table(4) := '20202020202020206966202870537472696E672E746F4C6F776572436173652829203D3D202766616C73652729207B0A20202020202020202020202070426F6F6C65616E203D2066616C73653B0A20202020202020207D0A202020202020202069662028';
wwv_flow_imp.g_varchar2_table(5) := '212870537472696E672E746F4C6F776572436173652829203D3D202774727565272920262620212870537472696E672E746F4C6F776572436173652829203D3D202766616C7365272929207B0A20202020202020202020202070426F6F6C65616E203D20';
wwv_flow_imp.g_varchar2_table(6) := '756E646566696E65643B0A20202020202020207D0A202020202020202072657475726E2070426F6F6C65616E3B0A202020207D2C0A202020202F2F2066756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C7567696E0A2020';
wwv_flow_imp.g_varchar2_table(7) := '2020696E6974436C6F636B5069636B65723A2066756E6374696F6E28704974656D49642C20704F7074696F6E732C20704C6F6767696E6729207B0A202020202020202076617220764F7074696F6E73203D20704F7074696F6E733B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(8) := '7661722076506C6163656D656E74203D20764F7074696F6E732E706C6163656D656E743B0A20202020202020207661722076416C69676E203D20764F7074696F6E732E616C69676E3B0A202020202020202076617220764175746F436C6F7365203D2061';
wwv_flow_imp.g_varchar2_table(9) := '706578436C6F636B5069636B65722E7061727365426F6F6C65616E28764F7074696F6E732E6175746F636C6F7365293B0A20202020202020207661722076446F6E6554657874203D20764F7074696F6E732E646F6E65746578743B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(10) := '76617220765477656C7665486F7572203D2061706578436C6F636B5069636B65722E7061727365426F6F6C65616E28764F7074696F6E732E7477656C7665686F7572293B0A2020202020202020766172207653686F77427574746F6E496E74203D20764F';
wwv_flow_imp.g_varchar2_table(11) := '7074696F6E732E73686F77627574746F6E3B0A202020202020202076617220764C6F6767696E67203D2061706578436C6F636B5069636B65722E7061727365426F6F6C65616E28704C6F6767696E67293B0A2020202020202020766172207653686F7742';
wwv_flow_imp.g_varchar2_table(12) := '7574746F6E3B0A0A2020202020202020696620287653686F77427574746F6E496E74203D3D2031207C7C207653686F77427574746F6E496E74203D3D2027312729207B0A2020202020202020202020207653686F77427574746F6E203D20747275653B0A';
wwv_flow_imp.g_varchar2_table(13) := '20202020202020207D20656C7365207B0A2020202020202020202020207653686F77427574746F6E203D2066616C73653B0A20202020202020207D0A20202020202020202F2F204C6F6767696E670A202020202020202069662028764C6F6767696E6729';
wwv_flow_imp.g_varchar2_table(14) := '207B0A202020202020202020202020636F6E736F6C652E6C6F67282761706578436C6F636B5069636B65723A20704974656D49643A272C20704974656D4964293B0A202020202020202020202020636F6E736F6C652E6C6F67282761706578436C6F636B';
wwv_flow_imp.g_varchar2_table(15) := '5069636B65723A20764F7074696F6E732E706C6163656D656E743A272C20764F7074696F6E732E706C6163656D656E74293B0A202020202020202020202020636F6E736F6C652E6C6F67282761706578436C6F636B5069636B65723A20764F7074696F6E';
wwv_flow_imp.g_varchar2_table(16) := '732E616C69676E3A272C20764F7074696F6E732E616C69676E293B0A202020202020202020202020636F6E736F6C652E6C6F67282761706578436C6F636B5069636B65723A20764F7074696F6E732E764175746F436C6F73653A272C20764F7074696F6E';
wwv_flow_imp.g_varchar2_table(17) := '732E6175746F636C6F7365293B0A202020202020202020202020636F6E736F6C652E6C6F67282761706578436C6F636B5069636B65723A20764F7074696F6E732E76446F6E65546578743A272C20764F7074696F6E732E646F6E6574657874293B0A2020';
wwv_flow_imp.g_varchar2_table(18) := '20202020202020202020636F6E736F6C652E6C6F67282761706578436C6F636B5069636B65723A20764F7074696F6E732E765477656C7665486F75723A272C20764F7074696F6E732E7477656C7665686F7572293B0A202020202020202020202020636F';
wwv_flow_imp.g_varchar2_table(19) := '6E736F6C652E6C6F67282761706578436C6F636B5069636B65723A20764F7074696F6E732E7653686F77427574746F6E3A272C20764F7074696F6E732E73686F77627574746F6E293B0A20202020202020207D0A20202020202020202F2F20436C6F636B';
wwv_flow_imp.g_varchar2_table(20) := '7069636B65720A202020202020202076617220636C6F636B5069636B65724974656D203D202428272327202B20704974656D4964292E636C6F636B7069636B6572287B0A20202020202020202020202022706C6163656D656E74223A2076506C6163656D';
wwv_flow_imp.g_varchar2_table(21) := '656E742C0A20202020202020202020202022616C69676E223A2076416C69676E2C0A202020202020202020202020226175746F636C6F7365223A20764175746F436C6F73652C0A20202020202020202020202022646F6E6574657874223A2076446F6E65';
wwv_flow_imp.g_varchar2_table(22) := '546578742C0A202020202020202020202020227477656C7665686F7572223A20765477656C7665486F75722C0A2020202020202020202020202264656661756C74223A20226E6F77220A20202020202020207D293B0A20202020202020202F2F20436C6F';
wwv_flow_imp.g_varchar2_table(23) := '636B20427574746F6E0A2020202020202020696620287653686F77427574746F6E29207B0A2020202020202020202020202428272327202B20704974656D4964202B20275F627574746F6E27292E636C69636B2866756E6374696F6E286529207B0A2020';
wwv_flow_imp.g_varchar2_table(24) := '2020202020202020202020202020652E73746F7050726F7061676174696F6E28293B0A20202020202020202020202020202020636C6F636B5069636B65724974656D2E636C6F636B7069636B6572282773686F7727293B0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(25) := '7D293B0A20202020202020207D0A20202020202020202F2F2041504558206974656D0A2020202020202020617065782E7769646765742E696E6974506167654974656D28704974656D49642C207B0A20202020202020202020202064697361626C653A20';
wwv_flow_imp.g_varchar2_table(26) := '66756E6374696F6E2829207B0A20202020202020202020202020202020617065782E6A517565727928222322202B20746869732E6964292E616464436C6173732822617065785F64697361626C656422292E70726F70282264697361626C6564222C2021';
wwv_flow_imp.g_varchar2_table(27) := '30293B0A20202020202020202020202020202020617065782E6A517565727928222322202B20746869732E6964202B20225F627574746F6E22292E616464436C6173732822617065785F64697361626C656422292E70726F70282264697361626C656422';
wwv_flow_imp.g_varchar2_table(28) := '2C202130293B0A2020202020202020202020207D2C0A202020202020202020202020656E61626C653A2066756E6374696F6E2829207B0A20202020202020202020202020202020617065782E6A517565727928222322202B20746869732E6964292E7265';
wwv_flow_imp.g_varchar2_table(29) := '6D6F7665436C6173732822617065785F64697361626C656422292E70726F70282264697361626C6564222C2030293B0A20202020202020202020202020202020617065782E6A517565727928222322202B20746869732E6964202B20225F627574746F6E';
wwv_flow_imp.g_varchar2_table(30) := '22292E72656D6F7665436C6173732822617065785F64697361626C656422292E70726F70282264697361626C6564222C2030293B0A2020202020202020202020207D0A20202020202020207D293B0A202020207D0A7D3B0A';
null;
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
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(76976836923833559)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_file_name=>'js/apexclockpicker.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
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
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '7661722061706578436C6F636B5069636B65723D7B7061727365426F6F6C65616E3A66756E6374696F6E2862297B76617220613B2274727565223D3D622E746F4C6F776572436173652829262628613D2130293B2266616C7365223D3D622E746F4C6F77';
wwv_flow_imp.g_varchar2_table(2) := '6572436173652829262628613D2131293B227472756522213D622E746F4C6F77657243617365282926262266616C736522213D622E746F4C6F776572436173652829262628613D766F69642030293B72657475726E20617D2C696E6974436C6F636B5069';
wwv_flow_imp.g_varchar2_table(3) := '636B65723A66756E6374696F6E28622C612C64297B76617220653D612E706C6163656D656E742C663D612E616C69676E2C673D61706578436C6F636B5069636B65722E7061727365426F6F6C65616E28612E6175746F636C6F7365292C683D612E646F6E';
wwv_flow_imp.g_varchar2_table(4) := '65746578742C6B3D61706578436C6F636B5069636B65722E7061727365426F6F6C65616E28612E7477656C7665686F7572292C633D612E73686F77627574746F6E3B643D61706578436C6F636B5069636B65722E7061727365426F6F6C65616E2864293B';
wwv_flow_imp.g_varchar2_table(5) := '633D313D3D637C7C2231223D3D633F21303A21313B64262628636F6E736F6C652E6C6F67282261706578436C6F636B5069636B65723A20704974656D49643A222C62292C636F6E736F6C652E6C6F67282261706578436C6F636B5069636B65723A20764F';
wwv_flow_imp.g_varchar2_table(6) := '7074696F6E732E706C6163656D656E743A222C0A612E706C6163656D656E74292C636F6E736F6C652E6C6F67282261706578436C6F636B5069636B65723A20764F7074696F6E732E616C69676E3A222C612E616C69676E292C636F6E736F6C652E6C6F67';
wwv_flow_imp.g_varchar2_table(7) := '282261706578436C6F636B5069636B65723A20764F7074696F6E732E764175746F436C6F73653A222C612E6175746F636C6F7365292C636F6E736F6C652E6C6F67282261706578436C6F636B5069636B65723A20764F7074696F6E732E76446F6E655465';
wwv_flow_imp.g_varchar2_table(8) := '78743A222C612E646F6E6574657874292C636F6E736F6C652E6C6F67282261706578436C6F636B5069636B65723A20764F7074696F6E732E765477656C7665486F75723A222C612E7477656C7665686F7572292C636F6E736F6C652E6C6F672822617065';
wwv_flow_imp.g_varchar2_table(9) := '78436C6F636B5069636B65723A20764F7074696F6E732E7653686F77427574746F6E3A222C612E73686F77627574746F6E29293B766172206C3D24282223222B62292E636C6F636B7069636B6572287B706C6163656D656E743A652C616C69676E3A662C';
wwv_flow_imp.g_varchar2_table(10) := '6175746F636C6F73653A672C646F6E65746578743A682C7477656C7665686F75723A6B2C2264656661756C74223A226E6F77227D293B63262624282223222B622B225F627574746F6E22292E636C69636B2866756E6374696F6E2861297B612E73746F70';
wwv_flow_imp.g_varchar2_table(11) := '50726F7061676174696F6E28293B6C2E636C6F636B7069636B6572282273686F7722297D293B0A617065782E7769646765742E696E6974506167654974656D28622C7B64697361626C653A66756E6374696F6E28297B617065782E6A5175657279282223';
wwv_flow_imp.g_varchar2_table(12) := '222B746869732E6964292E616464436C6173732822617065785F64697361626C656422292E70726F70282264697361626C6564222C2130293B617065782E6A5175657279282223222B746869732E69642B225F627574746F6E22292E616464436C617373';
wwv_flow_imp.g_varchar2_table(13) := '2822617065785F64697361626C656422292E70726F70282264697361626C6564222C2130297D2C656E61626C653A66756E6374696F6E28297B617065782E6A5175657279282223222B746869732E6964292E72656D6F7665436C6173732822617065785F';
wwv_flow_imp.g_varchar2_table(14) := '64697361626C656422292E70726F70282264697361626C6564222C30293B617065782E6A5175657279282223222B746869732E69642B225F627574746F6E22292E72656D6F7665436C6173732822617065785F64697361626C656422292E70726F702822';
wwv_flow_imp.g_varchar2_table(15) := '64697361626C6564222C30297D7D297D7D3B0A';
null;
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
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(76977269498834172)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_file_name=>'js/apexclockpicker.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
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
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A210A202A20436C6F636B5069636B65722076302E302E3720666F7220426F6F7473747261702028687474703A2F2F77656172656F75746D616E2E6769746875622E696F2F636C6F636B7069636B65722F290A202A20436F7079726967687420323031';
wwv_flow_imp.g_varchar2_table(2) := '342057616E67205368656E7765692E0A202A204C6963656E73656420756E646572204D4954202868747470733A2F2F6769746875622E636F6D2F77656172656F75746D616E2F636C6F636B7069636B65722F626C6F622F67682D70616765732F4C494345';
wwv_flow_imp.g_varchar2_table(3) := '4E5345290A202A2F2E636C6F636B7069636B6572202E696E7075742D67726F75702D6164646F6E7B637572736F723A706F696E7465727D2E636C6F636B7069636B65722D6D6F76696E677B637572736F723A6D6F76657D2E636C6F636B7069636B65722D';
wwv_flow_imp.g_varchar2_table(4) := '616C69676E2D6C6566742E706F706F7665723E2E6172726F777B6C6566743A323570787D2E636C6F636B7069636B65722D616C69676E2D746F702E706F706F7665723E2E6172726F777B746F703A313770787D2E636C6F636B7069636B65722D616C6967';
wwv_flow_imp.g_varchar2_table(5) := '6E2D72696768742E706F706F7665723E2E6172726F777B6C6566743A6175746F3B72696768743A323570787D2E636C6F636B7069636B65722D616C69676E2D626F74746F6D2E706F706F7665723E2E6172726F777B746F703A6175746F3B626F74746F6D';
wwv_flow_imp.g_varchar2_table(6) := '3A3670787D2E636C6F636B7069636B65722D706F706F766572202E706F706F7665722D7469746C657B6261636B67726F756E642D636F6C6F723A236666663B636F6C6F723A233939393B666F6E742D73697A653A323470783B666F6E742D776569676874';
wwv_flow_imp.g_varchar2_table(7) := '3A3730303B6C696E652D6865696768743A333070783B746578742D616C69676E3A63656E7465727D2E636C6F636B7069636B65722D706F706F766572202E706F706F7665722D7469746C65207370616E7B637572736F723A706F696E7465727D2E636C6F';
wwv_flow_imp.g_varchar2_table(8) := '636B7069636B65722D706F706F766572202E706F706F7665722D636F6E74656E747B6261636B67726F756E642D636F6C6F723A236638663866383B70616464696E673A313270787D2E706F706F7665722D636F6E74656E743A6C6173742D6368696C647B';
wwv_flow_imp.g_varchar2_table(9) := '626F726465722D626F74746F6D2D6C6566742D7261646975733A3570783B626F726465722D626F74746F6D2D72696768742D7261646975733A3570787D2E636C6F636B7069636B65722D706C6174657B6261636B67726F756E642D636F6C6F723A236666';
wwv_flow_imp.g_varchar2_table(10) := '663B626F726465723A31707820736F6C696420236363633B626F726465722D7261646975733A3530253B77696474683A32303070783B6865696768743A32303070783B6F766572666C6F773A76697369626C653B706F736974696F6E3A72656C61746976';
wwv_flow_imp.g_varchar2_table(11) := '653B2D7765626B69742D746F7563682D63616C6C6F75743A6E6F6E653B2D7765626B69742D757365722D73656C6563743A6E6F6E653B2D6B68746D6C2D757365722D73656C6563743A6E6F6E653B2D6D6F7A2D757365722D73656C6563743A6E6F6E653B';
wwv_flow_imp.g_varchar2_table(12) := '2D6D732D757365722D73656C6563743A6E6F6E653B757365722D73656C6563743A6E6F6E657D2E636C6F636B7069636B65722D63616E7661732C2E636C6F636B7069636B65722D6469616C7B77696474683A32303070783B6865696768743A3230307078';
wwv_flow_imp.g_varchar2_table(13) := '3B706F736974696F6E3A6162736F6C7574653B6C6566743A2D3170783B746F703A2D3170787D2E636C6F636B7069636B65722D6D696E757465737B7669736962696C6974793A68696464656E7D2E636C6F636B7069636B65722D7469636B7B626F726465';
wwv_flow_imp.g_varchar2_table(14) := '722D7261646975733A3530253B636F6C6F723A233636363B6C696E652D6865696768743A323670783B746578742D616C69676E3A63656E7465723B77696474683A323670783B6865696768743A323670783B706F736974696F6E3A6162736F6C7574653B';
wwv_flow_imp.g_varchar2_table(15) := '637572736F723A706F696E7465727D2E636C6F636B7069636B65722D7469636B2E6163746976652C2E636C6F636B7069636B65722D7469636B3A686F7665727B6261636B67726F756E642D636F6C6F723A236330653566373B6261636B67726F756E642D';
wwv_flow_imp.g_varchar2_table(16) := '636F6C6F723A7267626128302C3134392C3232312C2E3235297D2E636C6F636B7069636B65722D627574746F6E7B6261636B67726F756E642D696D6167653A6E6F6E653B6261636B67726F756E642D636F6C6F723A236666663B626F726465722D776964';
wwv_flow_imp.g_varchar2_table(17) := '74683A317078203020303B626F726465722D746F702D6C6566742D7261646975733A303B626F726465722D746F702D72696768742D7261646975733A303B6D617267696E3A303B70616464696E673A3130707820307D2E636C6F636B7069636B65722D62';
wwv_flow_imp.g_varchar2_table(18) := '7574746F6E3A686F7665727B6261636B67726F756E642D696D6167653A6E6F6E653B6261636B67726F756E642D636F6C6F723A236562656265627D2E636C6F636B7069636B65722D627574746F6E3A666F6375737B6F75746C696E653A3021696D706F72';
wwv_flow_imp.g_varchar2_table(19) := '74616E747D2E636C6F636B7069636B65722D6469616C7B2D7765626B69742D7472616E736974696F6E3A2D7765626B69742D7472616E73666F726D203335306D732C6F706163697479203335306D733B2D6D6F7A2D7472616E736974696F6E3A2D6D6F7A';
wwv_flow_imp.g_varchar2_table(20) := '2D7472616E73666F726D203335306D732C6F706163697479203335306D733B2D6D732D7472616E736974696F6E3A2D6D732D7472616E73666F726D203335306D732C6F706163697479203335306D733B2D6F2D7472616E736974696F6E3A2D6F2D747261';
wwv_flow_imp.g_varchar2_table(21) := '6E73666F726D203335306D732C6F706163697479203335306D733B7472616E736974696F6E3A7472616E73666F726D203335306D732C6F706163697479203335306D737D2E636C6F636B7069636B65722D6469616C2D6F75747B6F7061636974793A307D';
wwv_flow_imp.g_varchar2_table(22) := '2E636C6F636B7069636B65722D686F7572732E636C6F636B7069636B65722D6469616C2D6F75747B2D7765626B69742D7472616E73666F726D3A7363616C6528312E322C312E32293B2D6D6F7A2D7472616E73666F726D3A7363616C6528312E322C312E';
wwv_flow_imp.g_varchar2_table(23) := '32293B2D6D732D7472616E73666F726D3A7363616C6528312E322C312E32293B2D6F2D7472616E73666F726D3A7363616C6528312E322C312E32293B7472616E73666F726D3A7363616C6528312E322C312E32297D2E636C6F636B7069636B65722D6D69';
wwv_flow_imp.g_varchar2_table(24) := '6E757465732E636C6F636B7069636B65722D6469616C2D6F75747B2D7765626B69742D7472616E73666F726D3A7363616C65282E382C2E38293B2D6D6F7A2D7472616E73666F726D3A7363616C65282E382C2E38293B2D6D732D7472616E73666F726D3A';
wwv_flow_imp.g_varchar2_table(25) := '7363616C65282E382C2E38293B2D6F2D7472616E73666F726D3A7363616C65282E382C2E38293B7472616E73666F726D3A7363616C65282E382C2E38297D2E636C6F636B7069636B65722D63616E7661737B2D7765626B69742D7472616E736974696F6E';
wwv_flow_imp.g_varchar2_table(26) := '3A6F706163697479203137356D733B2D6D6F7A2D7472616E736974696F6E3A6F706163697479203137356D733B2D6D732D7472616E736974696F6E3A6F706163697479203137356D733B2D6F2D7472616E736974696F6E3A6F706163697479203137356D';
wwv_flow_imp.g_varchar2_table(27) := '733B7472616E736974696F6E3A6F706163697479203137356D737D2E636C6F636B7069636B65722D63616E7661732D6F75747B6F7061636974793A2E32357D2E636C6F636B7069636B65722D63616E7661732D62656172696E672C2E636C6F636B706963';
wwv_flow_imp.g_varchar2_table(28) := '6B65722D63616E7661732D66677B7374726F6B653A6E6F6E653B66696C6C3A233030393564647D2E636C6F636B7069636B65722D63616E7661732D62677B7374726F6B653A6E6F6E653B66696C6C3A236330653566377D2E636C6F636B7069636B65722D';
wwv_flow_imp.g_varchar2_table(29) := '63616E7661732D62672D7472616E737B66696C6C3A7267626128302C3134392C3232312C2E3235297D2E636C6F636B7069636B65722D63616E766173206C696E657B7374726F6B653A233030393564643B7374726F6B652D77696474683A313B7374726F';
wwv_flow_imp.g_varchar2_table(30) := '6B652D6C696E656361703A726F756E647D2E636C6F636B7069636B65722D627574746F6E2E616D2D627574746F6E7B6D617267696E3A3170783B70616464696E673A3570783B626F726465723A31707820736F6C6964207267626128302C302C302C2E32';
wwv_flow_imp.g_varchar2_table(31) := '293B626F726465722D7261646975733A3470787D2E636C6F636B7069636B65722D627574746F6E2E706D2D627574746F6E7B6D617267696E3A31707820317078203170782031333670783B70616464696E673A3570783B626F726465723A31707820736F';
wwv_flow_imp.g_varchar2_table(32) := '6C6964207267626128302C302C302C2E32293B626F726465722D7261646975733A3470787D';
null;
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
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(11287180136234837072)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_file_name=>'css/bootstrap-clockpicker.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
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
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A210A202A20436C6F636B5069636B65722076302E302E372028687474703A2F2F77656172656F75746D616E2E6769746875622E696F2F636C6F636B7069636B65722F290A202A20436F7079726967687420323031342057616E67205368656E776569';
wwv_flow_imp.g_varchar2_table(2) := '2E0A202A204C6963656E73656420756E646572204D4954202868747470733A2F2F6769746875622E636F6D2F77656172656F75746D616E2F636C6F636B7069636B65722F626C6F622F67682D70616765732F4C4943454E5345290A202A2F0A2166756E63';
wwv_flow_imp.g_varchar2_table(3) := '74696F6E28297B66756E6374696F6E20742874297B72657475726E20646F63756D656E742E637265617465456C656D656E744E5328702C74297D66756E6374696F6E20692874297B72657475726E2831303E743F2230223A2222292B747D66756E637469';
wwv_flow_imp.g_varchar2_table(4) := '6F6E20652874297B76617220693D2B2B6D2B22223B72657475726E20743F742B693A697D66756E6374696F6E207328732C72297B66756E6374696F6E207028742C69297B76617220653D752E6F666673657428292C733D2F5E746F7563682F2E74657374';
wwv_flow_imp.g_varchar2_table(5) := '28742E74797065292C6F3D652E6C6566742B622C6E3D652E746F702B622C703D28733F742E6F726967696E616C4576656E742E746F75636865735B305D3A74292E70616765582D6F2C683D28733F742E6F726967696E616C4576656E742E746F75636865';
wwv_flow_imp.g_varchar2_table(6) := '735B305D3A74292E70616765592D6E2C6B3D4D6174682E7371727428702A702B682A68292C763D21313B69662821697C7C2128672D793E6B7C7C6B3E672B7929297B742E70726576656E7444656661756C7428293B766172206D3D73657454696D656F75';
wwv_flow_imp.g_varchar2_table(7) := '742866756E6374696F6E28297B632E616464436C6173732822636C6F636B7069636B65722D6D6F76696E6722297D2C323030293B6C2626752E617070656E6428782E63616E766173292C782E73657448616E6428702C682C21692C2130292C612E6F6666';
wwv_flow_imp.g_varchar2_table(8) := '2864292E6F6E28642C66756E6374696F6E2874297B742E70726576656E7444656661756C7428293B76617220693D2F5E746F7563682F2E7465737428742E74797065292C653D28693F742E6F726967696E616C4576656E742E746F75636865735B305D3A';
wwv_flow_imp.g_varchar2_table(9) := '74292E70616765582D6F2C733D28693F742E6F726967696E616C4576656E742E746F75636865735B305D3A74292E70616765592D6E3B28767C7C65213D3D707C7C73213D3D6829262628763D21302C782E73657448616E6428652C732C21312C21302929';
wwv_flow_imp.g_varchar2_table(10) := '7D292C612E6F66662866292E6F6E28662C66756E6374696F6E2874297B612E6F66662866292C742E70726576656E7444656661756C7428293B76617220653D2F5E746F7563682F2E7465737428742E74797065292C733D28653F742E6F726967696E616C';
wwv_flow_imp.g_varchar2_table(11) := '4576656E742E6368616E676564546F75636865735B305D3A74292E70616765582D6F2C6C3D28653F742E6F726967696E616C4576656E742E6368616E676564546F75636865735B305D3A74292E70616765592D6E3B28697C7C76292626733D3D3D702626';
wwv_flow_imp.g_varchar2_table(12) := '6C3D3D3D682626782E73657448616E6428732C6C292C22686F757273223D3D3D782E63757272656E74566965773F782E746F67676C655669657728226D696E75746573222C412F32293A722E6175746F636C6F7365262628782E6D696E75746573566965';
wwv_flow_imp.g_varchar2_table(13) := '772E616464436C6173732822636C6F636B7069636B65722D6469616C2D6F757422292C73657454696D656F75742866756E6374696F6E28297B782E646F6E6528297D2C412F3229292C752E70726570656E64286A292C636C65617254696D656F7574286D';
wwv_flow_imp.g_varchar2_table(14) := '292C632E72656D6F7665436C6173732822636C6F636B7069636B65722D6D6F76696E6722292C612E6F66662864297D297D7D76617220683D6E2856292C753D682E66696E6428222E636C6F636B7069636B65722D706C61746522292C763D682E66696E64';
wwv_flow_imp.g_varchar2_table(15) := '28222E636C6F636B7069636B65722D686F75727322292C6D3D682E66696E6428222E636C6F636B7069636B65722D6D696E7574657322292C543D682E66696E6428222E636C6F636B7069636B65722D616D2D706D2D626C6F636B22292C433D22494E5055';
wwv_flow_imp.g_varchar2_table(16) := '54223D3D3D732E70726F7028227461674E616D6522292C483D433F733A732E66696E642822696E70757422292C503D732E66696E6428222E696E7075742D67726F75702D6164646F6E22292C783D746869733B696628746869732E69643D652822637022';
wwv_flow_imp.g_varchar2_table(17) := '292C746869732E656C656D656E743D732C746869732E6F7074696F6E733D722C746869732E6973417070656E6465643D21312C746869732E697353686F776E3D21312C746869732E63757272656E74566965773D22686F757273222C746869732E697349';
wwv_flow_imp.g_varchar2_table(18) := '6E7075743D432C746869732E696E7075743D482C746869732E6164646F6E3D502C746869732E706F706F7665723D682C746869732E706C6174653D752C746869732E686F757273566965773D762C746869732E6D696E75746573566965773D6D2C746869';
wwv_flow_imp.g_varchar2_table(19) := '732E616D506D426C6F636B3D542C746869732E7370616E486F7572733D682E66696E6428222E636C6F636B7069636B65722D7370616E2D686F75727322292C746869732E7370616E4D696E757465733D682E66696E6428222E636C6F636B7069636B6572';
wwv_flow_imp.g_varchar2_table(20) := '2D7370616E2D6D696E7574657322292C746869732E7370616E416D506D3D682E66696E6428222E636C6F636B7069636B65722D7370616E2D616D2D706D22292C746869732E616D4F72506D3D22504D222C722E7477656C7665686F7572297B7B76617220';
wwv_flow_imp.g_varchar2_table(21) := '533D5B273C64697620636C6173733D22636C6F636B7069636B65722D616D2D706D2D626C6F636B223E272C273C627574746F6E20747970653D22627574746F6E2220636C6173733D2262746E2062746E2D736D2062746E2D64656661756C7420636C6F63';
wwv_flow_imp.g_varchar2_table(22) := '6B7069636B65722D627574746F6E20636C6F636B7069636B65722D616D2D627574746F6E223E272C22414D3C2F627574746F6E3E222C273C627574746F6E20747970653D22627574746F6E2220636C6173733D2262746E2062746E2D736D2062746E2D64';
wwv_flow_imp.g_varchar2_table(23) := '656661756C7420636C6F636B7069636B65722D627574746F6E20636C6F636B7069636B65722D706D2D627574746F6E223E272C22504D3C2F627574746F6E3E222C223C2F6469763E225D2E6A6F696E282222293B6E2853297D6E28273C627574746F6E20';
wwv_flow_imp.g_varchar2_table(24) := '747970653D22627574746F6E2220636C6173733D2262746E2062746E2D736D2062746E2D64656661756C7420636C6F636B7069636B65722D627574746F6E20616D2D627574746F6E223E414D3C2F627574746F6E3E27292E6F6E2822636C69636B222C66';
wwv_flow_imp.g_varchar2_table(25) := '756E6374696F6E28297B782E616D4F72506D3D22414D222C6E28222E636C6F636B7069636B65722D7370616E2D616D2D706D22292E656D70747928292E617070656E642822414D22297D292E617070656E64546F28746869732E616D506D426C6F636B29';
wwv_flow_imp.g_varchar2_table(26) := '2C6E28273C627574746F6E20747970653D22627574746F6E2220636C6173733D2262746E2062746E2D736D2062746E2D64656661756C7420636C6F636B7069636B65722D627574746F6E20706D2D627574746F6E223E504D3C2F627574746F6E3E27292E';
wwv_flow_imp.g_varchar2_table(27) := '6F6E2822636C69636B222C66756E6374696F6E28297B782E616D4F72506D3D22504D222C6E28222E636C6F636B7069636B65722D7370616E2D616D2D706D22292E656D70747928292E617070656E642822504D22297D292E617070656E64546F28746869';
wwv_flow_imp.g_varchar2_table(28) := '732E616D506D426C6F636B297D722E6175746F636C6F73657C7C6E28273C627574746F6E20747970653D22627574746F6E2220636C6173733D2262746E2062746E2D736D2062746E2D64656661756C742062746E2D626C6F636B20636C6F636B7069636B';
wwv_flow_imp.g_varchar2_table(29) := '65722D627574746F6E223E272B722E646F6E65746578742B223C2F627574746F6E3E22292E636C69636B286E2E70726F787928746869732E646F6E652C7468697329292E617070656E64546F2868292C22746F7022213D3D722E706C6163656D656E7426';
wwv_flow_imp.g_varchar2_table(30) := '2622626F74746F6D22213D3D722E706C6163656D656E747C7C22746F7022213D3D722E616C69676E262622626F74746F6D22213D3D722E616C69676E7C7C28722E616C69676E3D226C65667422292C226C65667422213D3D722E706C6163656D656E7426';
wwv_flow_imp.g_varchar2_table(31) := '2622726967687422213D3D722E706C6163656D656E747C7C226C65667422213D3D722E616C69676E262622726967687422213D3D722E616C69676E7C7C28722E616C69676E3D22746F7022292C682E616464436C61737328722E706C6163656D656E7429';
wwv_flow_imp.g_varchar2_table(32) := '2C682E616464436C6173732822636C6F636B7069636B65722D616C69676E2D222B722E616C69676E292C746869732E7370616E486F7572732E636C69636B286E2E70726F787928746869732E746F67676C65566965772C746869732C22686F7572732229';
wwv_flow_imp.g_varchar2_table(33) := '292C746869732E7370616E4D696E757465732E636C69636B286E2E70726F787928746869732E746F67676C65566965772C746869732C226D696E757465732229292C482E6F6E2822666F6375732E636C6F636B7069636B657220636C69636B2E636C6F63';
wwv_flow_imp.g_varchar2_table(34) := '6B7069636B6572222C6E2E70726F787928746869732E73686F772C7468697329292C502E6F6E2822636C69636B2E636C6F636B7069636B6572222C6E2E70726F787928746869732E746F67676C652C7468697329293B76617220452C442C492C422C7A3D';
wwv_flow_imp.g_varchar2_table(35) := '6E28273C64697620636C6173733D22636C6F636B7069636B65722D7469636B223E3C2F6469763E27293B696628722E7477656C7665686F757229666F7228453D313B31333E453B452B3D3129443D7A2E636C6F6E6528292C493D452F362A4D6174682E50';
wwv_flow_imp.g_varchar2_table(36) := '492C423D672C442E6373732822666F6E742D73697A65222C223132302522292C442E637373287B6C6566743A622B4D6174682E73696E2849292A422D792C746F703A622D4D6174682E636F732849292A422D797D292C442E68746D6C28303D3D3D453F22';
wwv_flow_imp.g_varchar2_table(37) := '3030223A45292C762E617070656E642844292C442E6F6E286B2C70293B656C736520666F7228453D303B32343E453B452B3D31297B443D7A2E636C6F6E6528292C493D452F362A4D6174682E50493B766172204F3D453E30262631333E453B423D4F3F77';
wwv_flow_imp.g_varchar2_table(38) := '3A672C442E637373287B6C6566743A622B4D6174682E73696E2849292A422D792C746F703A622D4D6174682E636F732849292A422D797D292C4F2626442E6373732822666F6E742D73697A65222C223132302522292C442E68746D6C28303D3D3D453F22';
wwv_flow_imp.g_varchar2_table(39) := '3030223A45292C762E617070656E642844292C442E6F6E286B2C70297D666F7228453D303B36303E453B452B3D3529443D7A2E636C6F6E6528292C493D452F33302A4D6174682E50492C442E637373287B6C6566743A622B4D6174682E73696E2849292A';
wwv_flow_imp.g_varchar2_table(40) := '672D792C746F703A622D4D6174682E636F732849292A672D797D292C442E6373732822666F6E742D73697A65222C223132302522292C442E68746D6C2869284529292C6D2E617070656E642844292C442E6F6E286B2C70293B696628752E6F6E286B2C66';
wwv_flow_imp.g_varchar2_table(41) := '756E6374696F6E2874297B303D3D3D6E28742E746172676574292E636C6F7365737428222E636C6F636B7069636B65722D7469636B22292E6C656E67746826267028742C2130297D292C6C297B766172206A3D682E66696E6428222E636C6F636B706963';
wwv_flow_imp.g_varchar2_table(42) := '6B65722D63616E76617322292C4C3D74282273766722293B4C2E7365744174747269627574652822636C617373222C22636C6F636B7069636B65722D73766722292C4C2E73657441747472696275746528227769647468222C4D292C4C2E736574417474';
wwv_flow_imp.g_varchar2_table(43) := '7269627574652822686569676874222C4D293B76617220553D7428226722293B552E73657441747472696275746528227472616E73666F726D222C227472616E736C61746528222B622B222C222B622B222922293B76617220573D742822636972636C65';
wwv_flow_imp.g_varchar2_table(44) := '22293B572E7365744174747269627574652822636C617373222C22636C6F636B7069636B65722D63616E7661732D62656172696E6722292C572E73657441747472696275746528226378222C30292C572E73657441747472696275746528226379222C30';
wwv_flow_imp.g_varchar2_table(45) := '292C572E736574417474726962757465282272222C32293B766172204E3D7428226C696E6522293B4E2E73657441747472696275746528227831222C30292C4E2E73657441747472696275746528227931222C30293B76617220583D742822636972636C';
wwv_flow_imp.g_varchar2_table(46) := '6522293B582E7365744174747269627574652822636C617373222C22636C6F636B7069636B65722D63616E7661732D626722292C582E736574417474726962757465282272222C79293B76617220593D742822636972636C6522293B592E736574417474';
wwv_flow_imp.g_varchar2_table(47) := '7269627574652822636C617373222C22636C6F636B7069636B65722D63616E7661732D666722292C592E736574417474726962757465282272222C332E35292C552E617070656E644368696C64284E292C552E617070656E644368696C642858292C552E';
wwv_flow_imp.g_varchar2_table(48) := '617070656E644368696C642859292C552E617070656E644368696C642857292C4C2E617070656E644368696C642855292C6A2E617070656E64284C292C746869732E68616E643D4E2C746869732E62673D582C746869732E66673D592C746869732E6265';
wwv_flow_imp.g_varchar2_table(49) := '6172696E673D572C746869732E673D552C746869732E63616E7661733D6A7D6F28746869732E6F7074696F6E732E696E6974297D66756E6374696F6E206F2874297B7426262266756E6374696F6E223D3D747970656F66207426267428297D7661722063';
wwv_flow_imp.g_varchar2_table(50) := '2C6E3D77696E646F772E6A51756572792C723D6E2877696E646F77292C613D6E28646F63756D656E74292C703D22687474703A2F2F7777772E77332E6F72672F323030302F737667222C6C3D22535647416E676C6522696E2077696E646F77262666756E';
wwv_flow_imp.g_varchar2_table(51) := '6374696F6E28297B76617220742C693D646F63756D656E742E637265617465456C656D656E74282264697622293B72657475726E20692E696E6E657248544D4C3D223C7376672F3E222C743D28692E66697273744368696C642626692E66697273744368';
wwv_flow_imp.g_varchar2_table(52) := '696C642E6E616D657370616365555249293D3D702C692E696E6E657248544D4C3D22222C747D28292C683D66756E6374696F6E28297B76617220743D646F63756D656E742E637265617465456C656D656E74282264697622292E7374796C653B72657475';
wwv_flow_imp.g_varchar2_table(53) := '726E227472616E736974696F6E22696E20747C7C225765626B69745472616E736974696F6E22696E20747C7C224D6F7A5472616E736974696F6E22696E20747C7C226D735472616E736974696F6E22696E20747C7C224F5472616E736974696F6E22696E';
wwv_flow_imp.g_varchar2_table(54) := '20747D28292C753D226F6E746F756368737461727422696E2077696E646F772C6B3D226D6F757365646F776E222B28753F2220746F7563687374617274223A2222292C643D226D6F7573656D6F76652E636C6F636B7069636B6572222B28753F2220746F';
wwv_flow_imp.g_varchar2_table(55) := '7563686D6F76652E636C6F636B7069636B6572223A2222292C663D226D6F75736575702E636C6F636B7069636B6572222B28753F2220746F756368656E642E636C6F636B7069636B6572223A2222292C763D6E6176696761746F722E766962726174653F';
wwv_flow_imp.g_varchar2_table(56) := '2276696272617465223A6E6176696761746F722E7765626B6974566962726174653F227765626B697456696272617465223A6E756C6C2C6D3D302C623D3130302C673D38302C773D35342C793D31332C4D3D322A622C413D683F3335303A312C563D5B27';
wwv_flow_imp.g_varchar2_table(57) := '3C64697620636C6173733D22706F706F76657220636C6F636B7069636B65722D706F706F766572223E272C273C64697620636C6173733D226172726F77223E3C2F6469763E272C273C64697620636C6173733D22706F706F7665722D7469746C65223E27';
wwv_flow_imp.g_varchar2_table(58) := '2C273C7370616E20636C6173733D22636C6F636B7069636B65722D7370616E2D686F75727320746578742D7072696D617279223E3C2F7370616E3E272C22203A20222C273C7370616E20636C6173733D22636C6F636B7069636B65722D7370616E2D6D69';
wwv_flow_imp.g_varchar2_table(59) := '6E75746573223E3C2F7370616E3E272C273C7370616E20636C6173733D22636C6F636B7069636B65722D7370616E2D616D2D706D223E3C2F7370616E3E272C223C2F6469763E222C273C64697620636C6173733D22706F706F7665722D636F6E74656E74';
wwv_flow_imp.g_varchar2_table(60) := '223E272C273C64697620636C6173733D22636C6F636B7069636B65722D706C617465223E272C273C64697620636C6173733D22636C6F636B7069636B65722D63616E766173223E3C2F6469763E272C273C64697620636C6173733D22636C6F636B706963';
wwv_flow_imp.g_varchar2_table(61) := '6B65722D6469616C20636C6F636B7069636B65722D686F757273223E3C2F6469763E272C273C64697620636C6173733D22636C6F636B7069636B65722D6469616C20636C6F636B7069636B65722D6D696E7574657320636C6F636B7069636B65722D6469';
wwv_flow_imp.g_varchar2_table(62) := '616C2D6F7574223E3C2F6469763E272C223C2F6469763E222C273C7370616E20636C6173733D22636C6F636B7069636B65722D616D2D706D2D626C6F636B223E272C223C2F7370616E3E222C223C2F6469763E222C223C2F6469763E225D2E6A6F696E28';
wwv_flow_imp.g_varchar2_table(63) := '2222293B732E44454641554C54533D7B2264656661756C74223A22222C66726F6D6E6F773A302C706C6163656D656E743A22626F74746F6D222C616C69676E3A226C656674222C646F6E65746578743A22E5AE8CE68890222C6175746F636C6F73653A21';
wwv_flow_imp.g_varchar2_table(64) := '312C7477656C7665686F75723A21312C766962726174653A21307D2C732E70726F746F747970652E746F67676C653D66756E6374696F6E28297B746869735B746869732E697353686F776E3F2268696465223A2273686F77225D28297D2C732E70726F74';
wwv_flow_imp.g_varchar2_table(65) := '6F747970652E6C6F636174653D66756E6374696F6E28297B76617220743D746869732E656C656D656E742C693D746869732E706F706F7665722C653D742E6F666673657428292C733D742E6F75746572576964746828292C6F3D742E6F75746572486569';
wwv_flow_imp.g_varchar2_table(66) := '67687428292C633D746869732E6F7074696F6E732E706C6163656D656E742C6E3D746869732E6F7074696F6E732E616C69676E2C723D7B7D3B73776974636828692E73686F7728292C63297B6361736522626F74746F6D223A722E746F703D652E746F70';
wwv_flow_imp.g_varchar2_table(67) := '2B6F3B627265616B3B63617365227269676874223A722E6C6566743D652E6C6566742B733B627265616B3B6361736522746F70223A722E746F703D652E746F702D692E6F7574657248656967687428293B627265616B3B63617365226C656674223A722E';
wwv_flow_imp.g_varchar2_table(68) := '6C6566743D652E6C6566742D692E6F75746572576964746828297D737769746368286E297B63617365226C656674223A722E6C6566743D652E6C6566743B627265616B3B63617365227269676874223A722E6C6566743D652E6C6566742B732D692E6F75';
wwv_flow_imp.g_varchar2_table(69) := '746572576964746828293B627265616B3B6361736522746F70223A722E746F703D652E746F703B627265616B3B6361736522626F74746F6D223A722E746F703D652E746F702B6F2D692E6F7574657248656967687428297D692E6373732872297D2C732E';
wwv_flow_imp.g_varchar2_table(70) := '70726F746F747970652E73686F773D66756E6374696F6E28297B69662821746869732E697353686F776E297B6F28746869732E6F7074696F6E732E6265666F726553686F77293B76617220743D746869733B746869732E6973417070656E6465647C7C28';
wwv_flow_imp.g_varchar2_table(71) := '633D6E28646F63756D656E742E626F6479292E617070656E6428746869732E706F706F766572292C722E6F6E2822726573697A652E636C6F636B7069636B6572222B746869732E69642C66756E6374696F6E28297B742E697353686F776E2626742E6C6F';
wwv_flow_imp.g_varchar2_table(72) := '6361746528297D292C746869732E6973417070656E6465643D2130293B76617220653D2828746869732E696E7075742E70726F70282276616C756522297C7C746869732E6F7074696F6E735B2264656661756C74225D7C7C2222292B2222292E73706C69';
wwv_flow_imp.g_varchar2_table(73) := '7428223A22293B696628226E6F77223D3D3D655B305D297B76617220733D6E65772044617465282B6E657720446174652B746869732E6F7074696F6E732E66726F6D6E6F77293B653D5B732E676574486F75727328292C732E6765744D696E7574657328';
wwv_flow_imp.g_varchar2_table(74) := '295D7D746869732E686F7572733D2B655B305D7C7C302C746869732E6D696E757465733D2B655B315D7C7C302C746869732E7370616E486F7572732E68746D6C286928746869732E686F75727329292C746869732E7370616E4D696E757465732E68746D';
wwv_flow_imp.g_varchar2_table(75) := '6C286928746869732E6D696E7574657329292C746869732E746F67676C65566965772822686F75727322292C746869732E6C6F6361746528292C746869732E697353686F776E3D21302C612E6F6E2822636C69636B2E636C6F636B7069636B65722E222B';
wwv_flow_imp.g_varchar2_table(76) := '746869732E69642B2220666F637573696E2E636C6F636B7069636B65722E222B746869732E69642C66756E6374696F6E2869297B76617220653D6E28692E746172676574293B303D3D3D652E636C6F7365737428742E706F706F766572292E6C656E6774';
wwv_flow_imp.g_varchar2_table(77) := '682626303D3D3D652E636C6F7365737428742E6164646F6E292E6C656E6774682626303D3D3D652E636C6F7365737428742E696E707574292E6C656E6774682626742E6869646528297D292C612E6F6E28226B657975702E636C6F636B7069636B65722E';
wwv_flow_imp.g_varchar2_table(78) := '222B746869732E69642C66756E6374696F6E2869297B32373D3D3D692E6B6579436F64652626742E6869646528297D292C6F28746869732E6F7074696F6E732E616674657253686F77297D7D2C732E70726F746F747970652E686964653D66756E637469';
wwv_flow_imp.g_varchar2_table(79) := '6F6E28297B6F28746869732E6F7074696F6E732E6265666F726548696465292C746869732E697353686F776E3D21312C612E6F66662822636C69636B2E636C6F636B7069636B65722E222B746869732E69642B2220666F637573696E2E636C6F636B7069';
wwv_flow_imp.g_varchar2_table(80) := '636B65722E222B746869732E6964292C612E6F666628226B657975702E636C6F636B7069636B65722E222B746869732E6964292C746869732E706F706F7665722E6869646528292C6F28746869732E6F7074696F6E732E616674657248696465297D2C73';
wwv_flow_imp.g_varchar2_table(81) := '2E70726F746F747970652E746F67676C65566965773D66756E6374696F6E28742C69297B76617220653D21313B226D696E75746573223D3D3D7426262276697369626C65223D3D3D6E28746869732E686F75727356696577292E63737328227669736962';
wwv_flow_imp.g_varchar2_table(82) := '696C69747922292626286F28746869732E6F7074696F6E732E6265666F7265486F757253656C656374292C653D2130293B76617220733D22686F757273223D3D3D742C633D733F746869732E686F757273566965773A746869732E6D696E757465735669';
wwv_flow_imp.g_varchar2_table(83) := '65772C723D733F746869732E6D696E75746573566965773A746869732E686F757273566965773B746869732E63757272656E74566965773D742C746869732E7370616E486F7572732E746F67676C65436C6173732822746578742D7072696D617279222C';
wwv_flow_imp.g_varchar2_table(84) := '73292C746869732E7370616E4D696E757465732E746F67676C65436C6173732822746578742D7072696D617279222C2173292C722E616464436C6173732822636C6F636B7069636B65722D6469616C2D6F757422292C632E63737328227669736962696C';
wwv_flow_imp.g_varchar2_table(85) := '697479222C2276697369626C6522292E72656D6F7665436C6173732822636C6F636B7069636B65722D6469616C2D6F757422292C746869732E7265736574436C6F636B2869292C636C65617254696D656F757428746869732E746F67676C655669657754';
wwv_flow_imp.g_varchar2_table(86) := '696D6572292C746869732E746F67676C655669657754696D65723D73657454696D656F75742866756E6374696F6E28297B722E63737328227669736962696C697479222C2268696464656E22297D2C41292C6526266F28746869732E6F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(87) := '6166746572486F757253656C656374297D2C732E70726F746F747970652E7265736574436C6F636B3D66756E6374696F6E2874297B76617220693D746869732E63757272656E74566965772C653D746869735B695D2C733D22686F757273223D3D3D692C';
wwv_flow_imp.g_varchar2_table(88) := '6F3D4D6174682E50492F28733F363A3330292C633D652A6F2C6E3D732626653E30262631333E653F773A672C723D4D6174682E73696E2863292A6E2C613D2D4D6174682E636F732863292A6E2C703D746869733B6C2626743F28702E63616E7661732E61';
wwv_flow_imp.g_varchar2_table(89) := '6464436C6173732822636C6F636B7069636B65722D63616E7661732D6F757422292C73657454696D656F75742866756E6374696F6E28297B702E63616E7661732E72656D6F7665436C6173732822636C6F636B7069636B65722D63616E7661732D6F7574';
wwv_flow_imp.g_varchar2_table(90) := '22292C702E73657448616E6428722C61297D2C7429293A746869732E73657448616E6428722C61297D2C732E70726F746F747970652E73657448616E643D66756E6374696F6E28742C652C732C6F297B76617220632C723D4D6174682E6174616E322874';
wwv_flow_imp.g_varchar2_table(91) := '2C2D65292C613D22686F757273223D3D3D746869732E63757272656E74566965772C703D4D6174682E50492F28617C7C733F363A3330292C683D4D6174682E7371727428742A742B652A65292C753D746869732E6F7074696F6E732C6B3D61262628672B';
wwv_flow_imp.g_varchar2_table(92) := '77292F323E682C643D6B3F773A673B696628752E7477656C7665686F7572262628643D67292C303E72262628723D322A4D6174682E50492B72292C633D4D6174682E726F756E6428722F70292C723D632A702C752E7477656C7665686F75723F613F303D';
wwv_flow_imp.g_varchar2_table(93) := '3D3D63262628633D3132293A2873262628632A3D35292C36303D3D3D63262628633D3029293A613F2831323D3D3D63262628633D30292C633D6B3F303D3D3D633F31323A633A303D3D3D633F303A632B3132293A2873262628632A3D35292C36303D3D3D';
wwv_flow_imp.g_varchar2_table(94) := '63262628633D3029292C746869735B746869732E63757272656E74566965775D213D3D632626762626746869732E6F7074696F6E732E76696272617465262628746869732E7669627261746554696D65727C7C286E6176696761746F725B765D28313029';
wwv_flow_imp.g_varchar2_table(95) := '2C746869732E7669627261746554696D65723D73657454696D656F7574286E2E70726F78792866756E6374696F6E28297B746869732E7669627261746554696D65723D6E756C6C7D2C74686973292C3130302929292C746869735B746869732E63757272';
wwv_flow_imp.g_varchar2_table(96) := '656E74566965775D3D632C746869735B613F227370616E486F757273223A227370616E4D696E75746573225D2E68746D6C2869286329292C216C2972657475726E20766F696420746869735B613F22686F75727356696577223A226D696E757465735669';
wwv_flow_imp.g_varchar2_table(97) := '6577225D2E66696E6428222E636C6F636B7069636B65722D7469636B22292E656163682866756E6374696F6E28297B76617220743D6E2874686973293B742E746F67676C65436C6173732822616374697665222C633D3D3D2B742E68746D6C2829297D29';
wwv_flow_imp.g_varchar2_table(98) := '3B6F7C7C216126266325353F28746869732E672E696E736572744265666F726528746869732E68616E642C746869732E62656172696E67292C746869732E672E696E736572744265666F726528746869732E62672C746869732E6667292C746869732E62';
wwv_flow_imp.g_varchar2_table(99) := '672E7365744174747269627574652822636C617373222C22636C6F636B7069636B65722D63616E7661732D626720636C6F636B7069636B65722D63616E7661732D62672D7472616E732229293A28746869732E672E696E736572744265666F7265287468';
wwv_flow_imp.g_varchar2_table(100) := '69732E68616E642C746869732E6267292C746869732E672E696E736572744265666F726528746869732E66672C746869732E6267292C746869732E62672E7365744174747269627574652822636C617373222C22636C6F636B7069636B65722D63616E76';
wwv_flow_imp.g_varchar2_table(101) := '61732D62672229293B76617220663D4D6174682E73696E2872292A642C6D3D2D4D6174682E636F732872292A643B746869732E68616E642E73657441747472696275746528227832222C66292C746869732E68616E642E73657441747472696275746528';
wwv_flow_imp.g_varchar2_table(102) := '227932222C6D292C746869732E62672E73657441747472696275746528226378222C66292C746869732E62672E73657441747472696275746528226379222C6D292C746869732E66672E73657441747472696275746528226378222C66292C746869732E';
wwv_flow_imp.g_varchar2_table(103) := '66672E73657441747472696275746528226379222C6D297D2C732E70726F746F747970652E646F6E653D66756E6374696F6E28297B6F28746869732E6F7074696F6E732E6265666F7265446F6E65292C746869732E6869646528293B76617220743D7468';
wwv_flow_imp.g_varchar2_table(104) := '69732E696E7075742E70726F70282276616C756522292C653D6928746869732E686F757273292B223A222B6928746869732E6D696E75746573293B746869732E6F7074696F6E732E7477656C7665686F7572262628652B3D746869732E616D4F72506D29';
wwv_flow_imp.g_varchar2_table(105) := '2C746869732E696E7075742E70726F70282276616C7565222C65292C65213D3D74262628746869732E696E7075742E7472696767657248616E646C657228226368616E676522292C746869732E6973496E7075747C7C746869732E656C656D656E742E74';
wwv_flow_imp.g_varchar2_table(106) := '72696767657228226368616E67652229292C746869732E6F7074696F6E732E6175746F636C6F73652626746869732E696E7075742E747269676765722822626C757222292C6F28746869732E6F7074696F6E732E6166746572446F6E65297D2C732E7072';
wwv_flow_imp.g_varchar2_table(107) := '6F746F747970652E72656D6F76653D66756E6374696F6E28297B746869732E656C656D656E742E72656D6F7665446174612822636C6F636B7069636B657222292C746869732E696E7075742E6F66662822666F6375732E636C6F636B7069636B65722063';
wwv_flow_imp.g_varchar2_table(108) := '6C69636B2E636C6F636B7069636B657222292C746869732E6164646F6E2E6F66662822636C69636B2E636C6F636B7069636B657222292C746869732E697353686F776E2626746869732E6869646528292C746869732E6973417070656E64656426262872';
wwv_flow_imp.g_varchar2_table(109) := '2E6F66662822726573697A652E636C6F636B7069636B6572222B746869732E6964292C746869732E706F706F7665722E72656D6F76652829297D2C6E2E666E2E636C6F636B7069636B65723D66756E6374696F6E2874297B76617220693D41727261792E';
wwv_flow_imp.g_varchar2_table(110) := '70726F746F747970652E736C6963652E63616C6C28617267756D656E74732C31293B72657475726E20746869732E656163682866756E6374696F6E28297B76617220653D6E2874686973292C6F3D652E646174612822636C6F636B7069636B657222293B';
wwv_flow_imp.g_varchar2_table(111) := '6966286F292266756E6374696F6E223D3D747970656F66206F5B745D26266F5B745D2E6170706C79286F2C69293B656C73657B76617220633D6E2E657874656E64287B7D2C732E44454641554C54532C652E6461746128292C226F626A656374223D3D74';
wwv_flow_imp.g_varchar2_table(112) := '7970656F662074262674293B652E646174612822636C6F636B7069636B6572222C6E6577207328652C6329297D7D297D7D28293B';
null;
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
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(11287180919585837083)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_file_name=>'js/bootstrap-clockpicker.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
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
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A210A202A20426F6F7473747261702076332E332E362028687474703A2F2F676574626F6F7473747261702E636F6D290A202A20436F7079726967687420323031312D3230313520547769747465722C20496E632E0A202A204C6963656E7365642075';
wwv_flow_imp.g_varchar2_table(2) := '6E646572204D4954202868747470733A2F2F6769746875622E636F6D2F747762732F626F6F7473747261702F626C6F622F6D61737465722F4C4943454E5345290A202A2F2F2A2120536F757263653A2068747470733A2F2F6769746875622E636F6D2F68';
wwv_flow_imp.g_varchar2_table(3) := '3562702F68746D6C352D626F696C6572706C6174652F626C6F622F6D61737465722F7372632F6373732F6D61696E2E637373202A2F406D65646961207072696E747B2A2C2A3A6265666F72652C2A3A61667465727B6261636B67726F756E643A7472616E';
wwv_flow_imp.g_varchar2_table(4) := '73706172656E742021696D706F7274616E743B636F6C6F723A233030302021696D706F7274616E743B626F782D736861646F773A6E6F6E652021696D706F7274616E743B746578742D736861646F773A6E6F6E652021696D706F7274616E747D612C613A';
wwv_flow_imp.g_varchar2_table(5) := '766973697465647B746578742D6465636F726174696F6E3A756E6465726C696E657D615B687265665D3A61667465727B636F6E74656E743A222028222061747472286872656629202229227D616262725B7469746C655D3A61667465727B636F6E74656E';
wwv_flow_imp.g_varchar2_table(6) := '743A222028222061747472287469746C6529202229227D615B687265665E3D2223225D3A61667465722C615B687265665E3D226A6176617363726970743A225D3A61667465727B636F6E74656E743A22227D7072652C626C6F636B71756F74657B626F72';
wwv_flow_imp.g_varchar2_table(7) := '6465723A31707820736F6C696420233939393B706167652D627265616B2D696E736964653A61766F69647D74686561647B646973706C61793A7461626C652D6865616465722D67726F75707D74722C696D677B706167652D627265616B2D696E73696465';
wwv_flow_imp.g_varchar2_table(8) := '3A61766F69647D696D677B6D61782D77696474683A313030252021696D706F7274616E747D702C68322C68337B6F727068616E733A333B7769646F77733A337D68322C68337B706167652D627265616B2D61667465723A61766F69647D2E6E6176626172';
wwv_flow_imp.g_varchar2_table(9) := '7B646973706C61793A6E6F6E657D2E62746E3E2E63617265742C2E64726F7075703E2E62746E3E2E63617265747B626F726465722D746F702D636F6C6F723A233030302021696D706F7274616E747D2E6C6162656C7B626F726465723A31707820736F6C';
wwv_flow_imp.g_varchar2_table(10) := '696420233030307D2E7461626C657B626F726465722D636F6C6C617073653A636F6C6C617073652021696D706F7274616E747D2E7461626C652074642C2E7461626C652074687B6261636B67726F756E642D636F6C6F723A236666662021696D706F7274';
wwv_flow_imp.g_varchar2_table(11) := '616E747D2E7461626C652D626F7264657265642074682C2E7461626C652D626F7264657265642074647B626F726465723A31707820736F6C696420236464642021696D706F7274616E747D7D40666F6E742D666163657B666F6E742D66616D696C793A27';
wwv_flow_imp.g_varchar2_table(12) := '476C79706869636F6E732048616C666C696E6773273B7372633A75726C28272E2E2F666F6E74732F676C79706869636F6E732D68616C666C696E67732D726567756C61722E656F7427293B7372633A75726C28272E2E2F666F6E74732F676C7970686963';
wwv_flow_imp.g_varchar2_table(13) := '6F6E732D68616C666C696E67732D726567756C61722E656F743F236965666978272920666F726D61742827656D6265646465642D6F70656E7479706527292C75726C28272E2E2F666F6E74732F676C79706869636F6E732D68616C666C696E67732D7265';
wwv_flow_imp.g_varchar2_table(14) := '67756C61722E776F666632272920666F726D61742827776F66663227292C75726C28272E2E2F666F6E74732F676C79706869636F6E732D68616C666C696E67732D726567756C61722E776F6666272920666F726D61742827776F666627292C75726C2827';
wwv_flow_imp.g_varchar2_table(15) := '2E2E2F666F6E74732F676C79706869636F6E732D68616C666C696E67732D726567756C61722E747466272920666F726D61742827747275657479706527292C75726C28272E2E2F666F6E74732F676C79706869636F6E732D68616C666C696E67732D7265';
wwv_flow_imp.g_varchar2_table(16) := '67756C61722E73766723676C79706869636F6E735F68616C666C696E6773726567756C6172272920666F726D6174282773766727297D2E676C79706869636F6E7B706F736974696F6E3A72656C61746976653B746F703A3170783B646973706C61793A69';
wwv_flow_imp.g_varchar2_table(17) := '6E6C696E652D626C6F636B3B666F6E742D66616D696C793A27476C79706869636F6E732048616C666C696E6773273B666F6E742D7374796C653A6E6F726D616C3B666F6E742D7765696768743A6E6F726D616C3B6C696E652D6865696768743A313B2D77';
wwv_flow_imp.g_varchar2_table(18) := '65626B69742D666F6E742D736D6F6F7468696E673A616E7469616C69617365643B2D6D6F7A2D6F73782D666F6E742D736D6F6F7468696E673A677261797363616C657D2E676C79706869636F6E2D617374657269736B3A6265666F72657B636F6E74656E';
wwv_flow_imp.g_varchar2_table(19) := '743A225C30303261227D2E676C79706869636F6E2D706C75733A6265666F72657B636F6E74656E743A225C30303262227D2E676C79706869636F6E2D6575726F3A6265666F72652C2E676C79706869636F6E2D6575723A6265666F72657B636F6E74656E';
wwv_flow_imp.g_varchar2_table(20) := '743A225C32306163227D2E676C79706869636F6E2D6D696E75733A6265666F72657B636F6E74656E743A225C32323132227D2E676C79706869636F6E2D636C6F75643A6265666F72657B636F6E74656E743A225C32363031227D2E676C79706869636F6E';
wwv_flow_imp.g_varchar2_table(21) := '2D656E76656C6F70653A6265666F72657B636F6E74656E743A225C32373039227D2E676C79706869636F6E2D70656E63696C3A6265666F72657B636F6E74656E743A225C32373066227D2E676C79706869636F6E2D676C6173733A6265666F72657B636F';
wwv_flow_imp.g_varchar2_table(22) := '6E74656E743A225C65303031227D2E676C79706869636F6E2D6D757369633A6265666F72657B636F6E74656E743A225C65303032227D2E676C79706869636F6E2D7365617263683A6265666F72657B636F6E74656E743A225C65303033227D2E676C7970';
wwv_flow_imp.g_varchar2_table(23) := '6869636F6E2D68656172743A6265666F72657B636F6E74656E743A225C65303035227D2E676C79706869636F6E2D737461723A6265666F72657B636F6E74656E743A225C65303036227D2E676C79706869636F6E2D737461722D656D7074793A6265666F';
wwv_flow_imp.g_varchar2_table(24) := '72657B636F6E74656E743A225C65303037227D2E676C79706869636F6E2D757365723A6265666F72657B636F6E74656E743A225C65303038227D2E676C79706869636F6E2D66696C6D3A6265666F72657B636F6E74656E743A225C65303039227D2E676C';
wwv_flow_imp.g_varchar2_table(25) := '79706869636F6E2D74682D6C617267653A6265666F72657B636F6E74656E743A225C65303130227D2E676C79706869636F6E2D74683A6265666F72657B636F6E74656E743A225C65303131227D2E676C79706869636F6E2D74682D6C6973743A6265666F';
wwv_flow_imp.g_varchar2_table(26) := '72657B636F6E74656E743A225C65303132227D2E676C79706869636F6E2D6F6B3A6265666F72657B636F6E74656E743A225C65303133227D2E676C79706869636F6E2D72656D6F76653A6265666F72657B636F6E74656E743A225C65303134227D2E676C';
wwv_flow_imp.g_varchar2_table(27) := '79706869636F6E2D7A6F6F6D2D696E3A6265666F72657B636F6E74656E743A225C65303135227D2E676C79706869636F6E2D7A6F6F6D2D6F75743A6265666F72657B636F6E74656E743A225C65303136227D2E676C79706869636F6E2D6F66663A626566';
wwv_flow_imp.g_varchar2_table(28) := '6F72657B636F6E74656E743A225C65303137227D2E676C79706869636F6E2D7369676E616C3A6265666F72657B636F6E74656E743A225C65303138227D2E676C79706869636F6E2D636F673A6265666F72657B636F6E74656E743A225C65303139227D2E';
wwv_flow_imp.g_varchar2_table(29) := '676C79706869636F6E2D74726173683A6265666F72657B636F6E74656E743A225C65303230227D2E676C79706869636F6E2D686F6D653A6265666F72657B636F6E74656E743A225C65303231227D2E676C79706869636F6E2D66696C653A6265666F7265';
wwv_flow_imp.g_varchar2_table(30) := '7B636F6E74656E743A225C65303232227D2E676C79706869636F6E2D74696D653A6265666F72657B636F6E74656E743A225C65303233227D2E676C79706869636F6E2D726F61643A6265666F72657B636F6E74656E743A225C65303234227D2E676C7970';
wwv_flow_imp.g_varchar2_table(31) := '6869636F6E2D646F776E6C6F61642D616C743A6265666F72657B636F6E74656E743A225C65303235227D2E676C79706869636F6E2D646F776E6C6F61643A6265666F72657B636F6E74656E743A225C65303236227D2E676C79706869636F6E2D75706C6F';
wwv_flow_imp.g_varchar2_table(32) := '61643A6265666F72657B636F6E74656E743A225C65303237227D2E676C79706869636F6E2D696E626F783A6265666F72657B636F6E74656E743A225C65303238227D2E676C79706869636F6E2D706C61792D636972636C653A6265666F72657B636F6E74';
wwv_flow_imp.g_varchar2_table(33) := '656E743A225C65303239227D2E676C79706869636F6E2D7265706561743A6265666F72657B636F6E74656E743A225C65303330227D2E676C79706869636F6E2D726566726573683A6265666F72657B636F6E74656E743A225C65303331227D2E676C7970';
wwv_flow_imp.g_varchar2_table(34) := '6869636F6E2D6C6973742D616C743A6265666F72657B636F6E74656E743A225C65303332227D2E676C79706869636F6E2D6C6F636B3A6265666F72657B636F6E74656E743A225C65303333227D2E676C79706869636F6E2D666C61673A6265666F72657B';
wwv_flow_imp.g_varchar2_table(35) := '636F6E74656E743A225C65303334227D2E676C79706869636F6E2D6865616470686F6E65733A6265666F72657B636F6E74656E743A225C65303335227D2E676C79706869636F6E2D766F6C756D652D6F66663A6265666F72657B636F6E74656E743A225C';
wwv_flow_imp.g_varchar2_table(36) := '65303336227D2E676C79706869636F6E2D766F6C756D652D646F776E3A6265666F72657B636F6E74656E743A225C65303337227D2E676C79706869636F6E2D766F6C756D652D75703A6265666F72657B636F6E74656E743A225C65303338227D2E676C79';
wwv_flow_imp.g_varchar2_table(37) := '706869636F6E2D7172636F64653A6265666F72657B636F6E74656E743A225C65303339227D2E676C79706869636F6E2D626172636F64653A6265666F72657B636F6E74656E743A225C65303430227D2E676C79706869636F6E2D7461673A6265666F7265';
wwv_flow_imp.g_varchar2_table(38) := '7B636F6E74656E743A225C65303431227D2E676C79706869636F6E2D746167733A6265666F72657B636F6E74656E743A225C65303432227D2E676C79706869636F6E2D626F6F6B3A6265666F72657B636F6E74656E743A225C65303433227D2E676C7970';
wwv_flow_imp.g_varchar2_table(39) := '6869636F6E2D626F6F6B6D61726B3A6265666F72657B636F6E74656E743A225C65303434227D2E676C79706869636F6E2D7072696E743A6265666F72657B636F6E74656E743A225C65303435227D2E676C79706869636F6E2D63616D6572613A6265666F';
wwv_flow_imp.g_varchar2_table(40) := '72657B636F6E74656E743A225C65303436227D2E676C79706869636F6E2D666F6E743A6265666F72657B636F6E74656E743A225C65303437227D2E676C79706869636F6E2D626F6C643A6265666F72657B636F6E74656E743A225C65303438227D2E676C';
wwv_flow_imp.g_varchar2_table(41) := '79706869636F6E2D6974616C69633A6265666F72657B636F6E74656E743A225C65303439227D2E676C79706869636F6E2D746578742D6865696768743A6265666F72657B636F6E74656E743A225C65303530227D2E676C79706869636F6E2D746578742D';
wwv_flow_imp.g_varchar2_table(42) := '77696474683A6265666F72657B636F6E74656E743A225C65303531227D2E676C79706869636F6E2D616C69676E2D6C6566743A6265666F72657B636F6E74656E743A225C65303532227D2E676C79706869636F6E2D616C69676E2D63656E7465723A6265';
wwv_flow_imp.g_varchar2_table(43) := '666F72657B636F6E74656E743A225C65303533227D2E676C79706869636F6E2D616C69676E2D72696768743A6265666F72657B636F6E74656E743A225C65303534227D2E676C79706869636F6E2D616C69676E2D6A7573746966793A6265666F72657B63';
wwv_flow_imp.g_varchar2_table(44) := '6F6E74656E743A225C65303535227D2E676C79706869636F6E2D6C6973743A6265666F72657B636F6E74656E743A225C65303536227D2E676C79706869636F6E2D696E64656E742D6C6566743A6265666F72657B636F6E74656E743A225C65303537227D';
wwv_flow_imp.g_varchar2_table(45) := '2E676C79706869636F6E2D696E64656E742D72696768743A6265666F72657B636F6E74656E743A225C65303538227D2E676C79706869636F6E2D6661636574696D652D766964656F3A6265666F72657B636F6E74656E743A225C65303539227D2E676C79';
wwv_flow_imp.g_varchar2_table(46) := '706869636F6E2D706963747572653A6265666F72657B636F6E74656E743A225C65303630227D2E676C79706869636F6E2D6D61702D6D61726B65723A6265666F72657B636F6E74656E743A225C65303632227D2E676C79706869636F6E2D61646A757374';
wwv_flow_imp.g_varchar2_table(47) := '3A6265666F72657B636F6E74656E743A225C65303633227D2E676C79706869636F6E2D74696E743A6265666F72657B636F6E74656E743A225C65303634227D2E676C79706869636F6E2D656469743A6265666F72657B636F6E74656E743A225C65303635';
wwv_flow_imp.g_varchar2_table(48) := '227D2E676C79706869636F6E2D73686172653A6265666F72657B636F6E74656E743A225C65303636227D2E676C79706869636F6E2D636865636B3A6265666F72657B636F6E74656E743A225C65303637227D2E676C79706869636F6E2D6D6F76653A6265';
wwv_flow_imp.g_varchar2_table(49) := '666F72657B636F6E74656E743A225C65303638227D2E676C79706869636F6E2D737465702D6261636B776172643A6265666F72657B636F6E74656E743A225C65303639227D2E676C79706869636F6E2D666173742D6261636B776172643A6265666F7265';
wwv_flow_imp.g_varchar2_table(50) := '7B636F6E74656E743A225C65303730227D2E676C79706869636F6E2D6261636B776172643A6265666F72657B636F6E74656E743A225C65303731227D2E676C79706869636F6E2D706C61793A6265666F72657B636F6E74656E743A225C65303732227D2E';
wwv_flow_imp.g_varchar2_table(51) := '676C79706869636F6E2D70617573653A6265666F72657B636F6E74656E743A225C65303733227D2E676C79706869636F6E2D73746F703A6265666F72657B636F6E74656E743A225C65303734227D2E676C79706869636F6E2D666F72776172643A626566';
wwv_flow_imp.g_varchar2_table(52) := '6F72657B636F6E74656E743A225C65303735227D2E676C79706869636F6E2D666173742D666F72776172643A6265666F72657B636F6E74656E743A225C65303736227D2E676C79706869636F6E2D737465702D666F72776172643A6265666F72657B636F';
wwv_flow_imp.g_varchar2_table(53) := '6E74656E743A225C65303737227D2E676C79706869636F6E2D656A6563743A6265666F72657B636F6E74656E743A225C65303738227D2E676C79706869636F6E2D63686576726F6E2D6C6566743A6265666F72657B636F6E74656E743A225C6530373922';
wwv_flow_imp.g_varchar2_table(54) := '7D2E676C79706869636F6E2D63686576726F6E2D72696768743A6265666F72657B636F6E74656E743A225C65303830227D2E676C79706869636F6E2D706C75732D7369676E3A6265666F72657B636F6E74656E743A225C65303831227D2E676C79706869';
wwv_flow_imp.g_varchar2_table(55) := '636F6E2D6D696E75732D7369676E3A6265666F72657B636F6E74656E743A225C65303832227D2E676C79706869636F6E2D72656D6F76652D7369676E3A6265666F72657B636F6E74656E743A225C65303833227D2E676C79706869636F6E2D6F6B2D7369';
wwv_flow_imp.g_varchar2_table(56) := '676E3A6265666F72657B636F6E74656E743A225C65303834227D2E676C79706869636F6E2D7175657374696F6E2D7369676E3A6265666F72657B636F6E74656E743A225C65303835227D2E676C79706869636F6E2D696E666F2D7369676E3A6265666F72';
wwv_flow_imp.g_varchar2_table(57) := '657B636F6E74656E743A225C65303836227D2E676C79706869636F6E2D73637265656E73686F743A6265666F72657B636F6E74656E743A225C65303837227D2E676C79706869636F6E2D72656D6F76652D636972636C653A6265666F72657B636F6E7465';
wwv_flow_imp.g_varchar2_table(58) := '6E743A225C65303838227D2E676C79706869636F6E2D6F6B2D636972636C653A6265666F72657B636F6E74656E743A225C65303839227D2E676C79706869636F6E2D62616E2D636972636C653A6265666F72657B636F6E74656E743A225C65303930227D';
wwv_flow_imp.g_varchar2_table(59) := '2E676C79706869636F6E2D6172726F772D6C6566743A6265666F72657B636F6E74656E743A225C65303931227D2E676C79706869636F6E2D6172726F772D72696768743A6265666F72657B636F6E74656E743A225C65303932227D2E676C79706869636F';
wwv_flow_imp.g_varchar2_table(60) := '6E2D6172726F772D75703A6265666F72657B636F6E74656E743A225C65303933227D2E676C79706869636F6E2D6172726F772D646F776E3A6265666F72657B636F6E74656E743A225C65303934227D2E676C79706869636F6E2D73686172652D616C743A';
wwv_flow_imp.g_varchar2_table(61) := '6265666F72657B636F6E74656E743A225C65303935227D2E676C79706869636F6E2D726573697A652D66756C6C3A6265666F72657B636F6E74656E743A225C65303936227D2E676C79706869636F6E2D726573697A652D736D616C6C3A6265666F72657B';
wwv_flow_imp.g_varchar2_table(62) := '636F6E74656E743A225C65303937227D2E676C79706869636F6E2D6578636C616D6174696F6E2D7369676E3A6265666F72657B636F6E74656E743A225C65313031227D2E676C79706869636F6E2D676966743A6265666F72657B636F6E74656E743A225C';
wwv_flow_imp.g_varchar2_table(63) := '65313032227D2E676C79706869636F6E2D6C6561663A6265666F72657B636F6E74656E743A225C65313033227D2E676C79706869636F6E2D666972653A6265666F72657B636F6E74656E743A225C65313034227D2E676C79706869636F6E2D6579652D6F';
wwv_flow_imp.g_varchar2_table(64) := '70656E3A6265666F72657B636F6E74656E743A225C65313035227D2E676C79706869636F6E2D6579652D636C6F73653A6265666F72657B636F6E74656E743A225C65313036227D2E676C79706869636F6E2D7761726E696E672D7369676E3A6265666F72';
wwv_flow_imp.g_varchar2_table(65) := '657B636F6E74656E743A225C65313037227D2E676C79706869636F6E2D706C616E653A6265666F72657B636F6E74656E743A225C65313038227D2E676C79706869636F6E2D63616C656E6461723A6265666F72657B636F6E74656E743A225C6531303922';
wwv_flow_imp.g_varchar2_table(66) := '7D2E676C79706869636F6E2D72616E646F6D3A6265666F72657B636F6E74656E743A225C65313130227D2E676C79706869636F6E2D636F6D6D656E743A6265666F72657B636F6E74656E743A225C65313131227D2E676C79706869636F6E2D6D61676E65';
wwv_flow_imp.g_varchar2_table(67) := '743A6265666F72657B636F6E74656E743A225C65313132227D2E676C79706869636F6E2D63686576726F6E2D75703A6265666F72657B636F6E74656E743A225C65313133227D2E676C79706869636F6E2D63686576726F6E2D646F776E3A6265666F7265';
wwv_flow_imp.g_varchar2_table(68) := '7B636F6E74656E743A225C65313134227D2E676C79706869636F6E2D726574776565743A6265666F72657B636F6E74656E743A225C65313135227D2E676C79706869636F6E2D73686F7070696E672D636172743A6265666F72657B636F6E74656E743A22';
wwv_flow_imp.g_varchar2_table(69) := '5C65313136227D2E676C79706869636F6E2D666F6C6465722D636C6F73653A6265666F72657B636F6E74656E743A225C65313137227D2E676C79706869636F6E2D666F6C6465722D6F70656E3A6265666F72657B636F6E74656E743A225C65313138227D';
wwv_flow_imp.g_varchar2_table(70) := '2E676C79706869636F6E2D726573697A652D766572746963616C3A6265666F72657B636F6E74656E743A225C65313139227D2E676C79706869636F6E2D726573697A652D686F72697A6F6E74616C3A6265666F72657B636F6E74656E743A225C65313230';
wwv_flow_imp.g_varchar2_table(71) := '227D2E676C79706869636F6E2D6864643A6265666F72657B636F6E74656E743A225C65313231227D2E676C79706869636F6E2D62756C6C686F726E3A6265666F72657B636F6E74656E743A225C65313232227D2E676C79706869636F6E2D62656C6C3A62';
wwv_flow_imp.g_varchar2_table(72) := '65666F72657B636F6E74656E743A225C65313233227D2E676C79706869636F6E2D63657274696669636174653A6265666F72657B636F6E74656E743A225C65313234227D2E676C79706869636F6E2D7468756D62732D75703A6265666F72657B636F6E74';
wwv_flow_imp.g_varchar2_table(73) := '656E743A225C65313235227D2E676C79706869636F6E2D7468756D62732D646F776E3A6265666F72657B636F6E74656E743A225C65313236227D2E676C79706869636F6E2D68616E642D72696768743A6265666F72657B636F6E74656E743A225C653132';
wwv_flow_imp.g_varchar2_table(74) := '37227D2E676C79706869636F6E2D68616E642D6C6566743A6265666F72657B636F6E74656E743A225C65313238227D2E676C79706869636F6E2D68616E642D75703A6265666F72657B636F6E74656E743A225C65313239227D2E676C79706869636F6E2D';
wwv_flow_imp.g_varchar2_table(75) := '68616E642D646F776E3A6265666F72657B636F6E74656E743A225C65313330227D2E676C79706869636F6E2D636972636C652D6172726F772D72696768743A6265666F72657B636F6E74656E743A225C65313331227D2E676C79706869636F6E2D636972';
wwv_flow_imp.g_varchar2_table(76) := '636C652D6172726F772D6C6566743A6265666F72657B636F6E74656E743A225C65313332227D2E676C79706869636F6E2D636972636C652D6172726F772D75703A6265666F72657B636F6E74656E743A225C65313333227D2E676C79706869636F6E2D63';
wwv_flow_imp.g_varchar2_table(77) := '6972636C652D6172726F772D646F776E3A6265666F72657B636F6E74656E743A225C65313334227D2E676C79706869636F6E2D676C6F62653A6265666F72657B636F6E74656E743A225C65313335227D2E676C79706869636F6E2D7772656E63683A6265';
wwv_flow_imp.g_varchar2_table(78) := '666F72657B636F6E74656E743A225C65313336227D2E676C79706869636F6E2D7461736B733A6265666F72657B636F6E74656E743A225C65313337227D2E676C79706869636F6E2D66696C7465723A6265666F72657B636F6E74656E743A225C65313338';
wwv_flow_imp.g_varchar2_table(79) := '227D2E676C79706869636F6E2D6272696566636173653A6265666F72657B636F6E74656E743A225C65313339227D2E676C79706869636F6E2D66756C6C73637265656E3A6265666F72657B636F6E74656E743A225C65313430227D2E676C79706869636F';
wwv_flow_imp.g_varchar2_table(80) := '6E2D64617368626F6172643A6265666F72657B636F6E74656E743A225C65313431227D2E676C79706869636F6E2D7061706572636C69703A6265666F72657B636F6E74656E743A225C65313432227D2E676C79706869636F6E2D68656172742D656D7074';
wwv_flow_imp.g_varchar2_table(81) := '793A6265666F72657B636F6E74656E743A225C65313433227D2E676C79706869636F6E2D6C696E6B3A6265666F72657B636F6E74656E743A225C65313434227D2E676C79706869636F6E2D70686F6E653A6265666F72657B636F6E74656E743A225C6531';
wwv_flow_imp.g_varchar2_table(82) := '3435227D2E676C79706869636F6E2D7075736870696E3A6265666F72657B636F6E74656E743A225C65313436227D2E676C79706869636F6E2D7573643A6265666F72657B636F6E74656E743A225C65313438227D2E676C79706869636F6E2D6762703A62';
wwv_flow_imp.g_varchar2_table(83) := '65666F72657B636F6E74656E743A225C65313439227D2E676C79706869636F6E2D736F72743A6265666F72657B636F6E74656E743A225C65313530227D2E676C79706869636F6E2D736F72742D62792D616C7068616265743A6265666F72657B636F6E74';
wwv_flow_imp.g_varchar2_table(84) := '656E743A225C65313531227D2E676C79706869636F6E2D736F72742D62792D616C7068616265742D616C743A6265666F72657B636F6E74656E743A225C65313532227D2E676C79706869636F6E2D736F72742D62792D6F726465723A6265666F72657B63';
wwv_flow_imp.g_varchar2_table(85) := '6F6E74656E743A225C65313533227D2E676C79706869636F6E2D736F72742D62792D6F726465722D616C743A6265666F72657B636F6E74656E743A225C65313534227D2E676C79706869636F6E2D736F72742D62792D617474726962757465733A626566';
wwv_flow_imp.g_varchar2_table(86) := '6F72657B636F6E74656E743A225C65313535227D2E676C79706869636F6E2D736F72742D62792D617474726962757465732D616C743A6265666F72657B636F6E74656E743A225C65313536227D2E676C79706869636F6E2D756E636865636B65643A6265';
wwv_flow_imp.g_varchar2_table(87) := '666F72657B636F6E74656E743A225C65313537227D2E676C79706869636F6E2D657870616E643A6265666F72657B636F6E74656E743A225C65313538227D2E676C79706869636F6E2D636F6C6C617073652D646F776E3A6265666F72657B636F6E74656E';
wwv_flow_imp.g_varchar2_table(88) := '743A225C65313539227D2E676C79706869636F6E2D636F6C6C617073652D75703A6265666F72657B636F6E74656E743A225C65313630227D2E676C79706869636F6E2D6C6F672D696E3A6265666F72657B636F6E74656E743A225C65313631227D2E676C';
wwv_flow_imp.g_varchar2_table(89) := '79706869636F6E2D666C6173683A6265666F72657B636F6E74656E743A225C65313632227D2E676C79706869636F6E2D6C6F672D6F75743A6265666F72657B636F6E74656E743A225C65313633227D2E676C79706869636F6E2D6E65772D77696E646F77';
wwv_flow_imp.g_varchar2_table(90) := '3A6265666F72657B636F6E74656E743A225C65313634227D2E676C79706869636F6E2D7265636F72643A6265666F72657B636F6E74656E743A225C65313635227D2E676C79706869636F6E2D736176653A6265666F72657B636F6E74656E743A225C6531';
wwv_flow_imp.g_varchar2_table(91) := '3636227D2E676C79706869636F6E2D6F70656E3A6265666F72657B636F6E74656E743A225C65313637227D2E676C79706869636F6E2D73617665643A6265666F72657B636F6E74656E743A225C65313638227D2E676C79706869636F6E2D696D706F7274';
wwv_flow_imp.g_varchar2_table(92) := '3A6265666F72657B636F6E74656E743A225C65313639227D2E676C79706869636F6E2D6578706F72743A6265666F72657B636F6E74656E743A225C65313730227D2E676C79706869636F6E2D73656E643A6265666F72657B636F6E74656E743A225C6531';
wwv_flow_imp.g_varchar2_table(93) := '3731227D2E676C79706869636F6E2D666C6F7070792D6469736B3A6265666F72657B636F6E74656E743A225C65313732227D2E676C79706869636F6E2D666C6F7070792D73617665643A6265666F72657B636F6E74656E743A225C65313733227D2E676C';
wwv_flow_imp.g_varchar2_table(94) := '79706869636F6E2D666C6F7070792D72656D6F76653A6265666F72657B636F6E74656E743A225C65313734227D2E676C79706869636F6E2D666C6F7070792D736176653A6265666F72657B636F6E74656E743A225C65313735227D2E676C79706869636F';
wwv_flow_imp.g_varchar2_table(95) := '6E2D666C6F7070792D6F70656E3A6265666F72657B636F6E74656E743A225C65313736227D2E676C79706869636F6E2D6372656469742D636172643A6265666F72657B636F6E74656E743A225C65313737227D2E676C79706869636F6E2D7472616E7366';
wwv_flow_imp.g_varchar2_table(96) := '65723A6265666F72657B636F6E74656E743A225C65313738227D2E676C79706869636F6E2D6375746C6572793A6265666F72657B636F6E74656E743A225C65313739227D2E676C79706869636F6E2D6865616465723A6265666F72657B636F6E74656E74';
wwv_flow_imp.g_varchar2_table(97) := '3A225C65313830227D2E676C79706869636F6E2D636F6D707265737365643A6265666F72657B636F6E74656E743A225C65313831227D2E676C79706869636F6E2D65617270686F6E653A6265666F72657B636F6E74656E743A225C65313832227D2E676C';
wwv_flow_imp.g_varchar2_table(98) := '79706869636F6E2D70686F6E652D616C743A6265666F72657B636F6E74656E743A225C65313833227D2E676C79706869636F6E2D746F7765723A6265666F72657B636F6E74656E743A225C65313834227D2E676C79706869636F6E2D73746174733A6265';
wwv_flow_imp.g_varchar2_table(99) := '666F72657B636F6E74656E743A225C65313835227D2E676C79706869636F6E2D73642D766964656F3A6265666F72657B636F6E74656E743A225C65313836227D2E676C79706869636F6E2D68642D766964656F3A6265666F72657B636F6E74656E743A22';
wwv_flow_imp.g_varchar2_table(100) := '5C65313837227D2E676C79706869636F6E2D7375627469746C65733A6265666F72657B636F6E74656E743A225C65313838227D2E676C79706869636F6E2D736F756E642D73746572656F3A6265666F72657B636F6E74656E743A225C65313839227D2E67';
wwv_flow_imp.g_varchar2_table(101) := '6C79706869636F6E2D736F756E642D646F6C62793A6265666F72657B636F6E74656E743A225C65313930227D2E676C79706869636F6E2D736F756E642D352D313A6265666F72657B636F6E74656E743A225C65313931227D2E676C79706869636F6E2D73';
wwv_flow_imp.g_varchar2_table(102) := '6F756E642D362D313A6265666F72657B636F6E74656E743A225C65313932227D2E676C79706869636F6E2D736F756E642D372D313A6265666F72657B636F6E74656E743A225C65313933227D2E676C79706869636F6E2D636F707972696768742D6D6172';
wwv_flow_imp.g_varchar2_table(103) := '6B3A6265666F72657B636F6E74656E743A225C65313934227D2E676C79706869636F6E2D726567697374726174696F6E2D6D61726B3A6265666F72657B636F6E74656E743A225C65313935227D2E676C79706869636F6E2D636C6F75642D646F776E6C6F';
wwv_flow_imp.g_varchar2_table(104) := '61643A6265666F72657B636F6E74656E743A225C65313937227D2E676C79706869636F6E2D636C6F75642D75706C6F61643A6265666F72657B636F6E74656E743A225C65313938227D2E676C79706869636F6E2D747265652D636F6E696665723A626566';
wwv_flow_imp.g_varchar2_table(105) := '6F72657B636F6E74656E743A225C65313939227D2E676C79706869636F6E2D747265652D6465636964756F75733A6265666F72657B636F6E74656E743A225C65323030227D2E676C79706869636F6E2D63643A6265666F72657B636F6E74656E743A225C';
wwv_flow_imp.g_varchar2_table(106) := '65323031227D2E676C79706869636F6E2D736176652D66696C653A6265666F72657B636F6E74656E743A225C65323032227D2E676C79706869636F6E2D6F70656E2D66696C653A6265666F72657B636F6E74656E743A225C65323033227D2E676C797068';
wwv_flow_imp.g_varchar2_table(107) := '69636F6E2D6C6576656C2D75703A6265666F72657B636F6E74656E743A225C65323034227D2E676C79706869636F6E2D636F70793A6265666F72657B636F6E74656E743A225C65323035227D2E676C79706869636F6E2D70617374653A6265666F72657B';
wwv_flow_imp.g_varchar2_table(108) := '636F6E74656E743A225C65323036227D2E676C79706869636F6E2D616C6572743A6265666F72657B636F6E74656E743A225C65323039227D2E676C79706869636F6E2D657175616C697A65723A6265666F72657B636F6E74656E743A225C65323130227D';
wwv_flow_imp.g_varchar2_table(109) := '2E676C79706869636F6E2D6B696E673A6265666F72657B636F6E74656E743A225C65323131227D2E676C79706869636F6E2D717565656E3A6265666F72657B636F6E74656E743A225C65323132227D2E676C79706869636F6E2D7061776E3A6265666F72';
wwv_flow_imp.g_varchar2_table(110) := '657B636F6E74656E743A225C65323133227D2E676C79706869636F6E2D626973686F703A6265666F72657B636F6E74656E743A225C65323134227D2E676C79706869636F6E2D6B6E696768743A6265666F72657B636F6E74656E743A225C65323135227D';
wwv_flow_imp.g_varchar2_table(111) := '2E676C79706869636F6E2D626162792D666F726D756C613A6265666F72657B636F6E74656E743A225C65323136227D2E676C79706869636F6E2D74656E743A6265666F72657B636F6E74656E743A225C32366661227D2E676C79706869636F6E2D626C61';
wwv_flow_imp.g_varchar2_table(112) := '636B626F6172643A6265666F72657B636F6E74656E743A225C65323138227D2E676C79706869636F6E2D6265643A6265666F72657B636F6E74656E743A225C65323139227D2E676C79706869636F6E2D6170706C653A6265666F72657B636F6E74656E74';
wwv_flow_imp.g_varchar2_table(113) := '3A225C66386666227D2E676C79706869636F6E2D65726173653A6265666F72657B636F6E74656E743A225C65323231227D2E676C79706869636F6E2D686F7572676C6173733A6265666F72657B636F6E74656E743A225C32333162227D2E676C79706869';
wwv_flow_imp.g_varchar2_table(114) := '636F6E2D6C616D703A6265666F72657B636F6E74656E743A225C65323233227D2E676C79706869636F6E2D6475706C69636174653A6265666F72657B636F6E74656E743A225C65323234227D2E676C79706869636F6E2D70696767792D62616E6B3A6265';
wwv_flow_imp.g_varchar2_table(115) := '666F72657B636F6E74656E743A225C65323235227D2E676C79706869636F6E2D73636973736F72733A6265666F72657B636F6E74656E743A225C65323236227D2E676C79706869636F6E2D626974636F696E3A6265666F72657B636F6E74656E743A225C';
wwv_flow_imp.g_varchar2_table(116) := '65323237227D2E676C79706869636F6E2D6274633A6265666F72657B636F6E74656E743A225C65323237227D2E676C79706869636F6E2D7862743A6265666F72657B636F6E74656E743A225C65323237227D2E676C79706869636F6E2D79656E3A626566';
wwv_flow_imp.g_varchar2_table(117) := '6F72657B636F6E74656E743A225C30306135227D2E676C79706869636F6E2D6A70793A6265666F72657B636F6E74656E743A225C30306135227D2E676C79706869636F6E2D7275626C653A6265666F72657B636F6E74656E743A225C32306264227D2E67';
wwv_flow_imp.g_varchar2_table(118) := '6C79706869636F6E2D7275623A6265666F72657B636F6E74656E743A225C32306264227D2E676C79706869636F6E2D7363616C653A6265666F72657B636F6E74656E743A225C65323330227D2E676C79706869636F6E2D6963652D6C6F6C6C793A626566';
wwv_flow_imp.g_varchar2_table(119) := '6F72657B636F6E74656E743A225C65323331227D2E676C79706869636F6E2D6963652D6C6F6C6C792D7461737465643A6265666F72657B636F6E74656E743A225C65323332227D2E676C79706869636F6E2D656475636174696F6E3A6265666F72657B63';
wwv_flow_imp.g_varchar2_table(120) := '6F6E74656E743A225C65323333227D2E676C79706869636F6E2D6F7074696F6E2D686F72697A6F6E74616C3A6265666F72657B636F6E74656E743A225C65323334227D2E676C79706869636F6E2D6F7074696F6E2D766572746963616C3A6265666F7265';
wwv_flow_imp.g_varchar2_table(121) := '7B636F6E74656E743A225C65323335227D2E676C79706869636F6E2D6D656E752D68616D6275726765723A6265666F72657B636F6E74656E743A225C65323336227D2E676C79706869636F6E2D6D6F64616C2D77696E646F773A6265666F72657B636F6E';
wwv_flow_imp.g_varchar2_table(122) := '74656E743A225C65323337227D2E676C79706869636F6E2D6F696C3A6265666F72657B636F6E74656E743A225C65323338227D2E676C79706869636F6E2D677261696E3A6265666F72657B636F6E74656E743A225C65323339227D2E676C79706869636F';
wwv_flow_imp.g_varchar2_table(123) := '6E2D73756E676C61737365733A6265666F72657B636F6E74656E743A225C65323430227D2E676C79706869636F6E2D746578742D73697A653A6265666F72657B636F6E74656E743A225C65323431227D2E676C79706869636F6E2D746578742D636F6C6F';
wwv_flow_imp.g_varchar2_table(124) := '723A6265666F72657B636F6E74656E743A225C65323432227D2E676C79706869636F6E2D746578742D6261636B67726F756E643A6265666F72657B636F6E74656E743A225C65323433227D2E676C79706869636F6E2D6F626A6563742D616C69676E2D74';
wwv_flow_imp.g_varchar2_table(125) := '6F703A6265666F72657B636F6E74656E743A225C65323434227D2E676C79706869636F6E2D6F626A6563742D616C69676E2D626F74746F6D3A6265666F72657B636F6E74656E743A225C65323435227D2E676C79706869636F6E2D6F626A6563742D616C';
wwv_flow_imp.g_varchar2_table(126) := '69676E2D686F72697A6F6E74616C3A6265666F72657B636F6E74656E743A225C65323436227D2E676C79706869636F6E2D6F626A6563742D616C69676E2D6C6566743A6265666F72657B636F6E74656E743A225C65323437227D2E676C79706869636F6E';
wwv_flow_imp.g_varchar2_table(127) := '2D6F626A6563742D616C69676E2D766572746963616C3A6265666F72657B636F6E74656E743A225C65323438227D2E676C79706869636F6E2D6F626A6563742D616C69676E2D72696768743A6265666F72657B636F6E74656E743A225C65323439227D2E';
wwv_flow_imp.g_varchar2_table(128) := '676C79706869636F6E2D747269616E676C652D72696768743A6265666F72657B636F6E74656E743A225C65323530227D2E676C79706869636F6E2D747269616E676C652D6C6566743A6265666F72657B636F6E74656E743A225C65323531227D2E676C79';
wwv_flow_imp.g_varchar2_table(129) := '706869636F6E2D747269616E676C652D626F74746F6D3A6265666F72657B636F6E74656E743A225C65323532227D2E676C79706869636F6E2D747269616E676C652D746F703A6265666F72657B636F6E74656E743A225C65323533227D2E676C79706869';
wwv_flow_imp.g_varchar2_table(130) := '636F6E2D636F6E736F6C653A6265666F72657B636F6E74656E743A225C65323534227D2E676C79706869636F6E2D73757065727363726970743A6265666F72657B636F6E74656E743A225C65323535227D2E676C79706869636F6E2D7375627363726970';
wwv_flow_imp.g_varchar2_table(131) := '743A6265666F72657B636F6E74656E743A225C65323536227D2E676C79706869636F6E2D6D656E752D6C6566743A6265666F72657B636F6E74656E743A225C65323537227D2E676C79706869636F6E2D6D656E752D72696768743A6265666F72657B636F';
wwv_flow_imp.g_varchar2_table(132) := '6E74656E743A225C65323538227D2E676C79706869636F6E2D6D656E752D646F776E3A6265666F72657B636F6E74656E743A225C65323539227D2E676C79706869636F6E2D6D656E752D75703A6265666F72657B636F6E74656E743A225C65323630227D';
wwv_flow_imp.g_varchar2_table(133) := '2E62746E7B646973706C61793A696E6C696E652D626C6F636B3B6D617267696E2D626F74746F6D3A303B666F6E742D7765696768743A6E6F726D616C3B746578742D616C69676E3A63656E7465723B766572746963616C2D616C69676E3A6D6964646C65';
wwv_flow_imp.g_varchar2_table(134) := '3B746F7563682D616374696F6E3A6D616E6970756C6174696F6E3B637572736F723A706F696E7465723B6261636B67726F756E642D696D6167653A6E6F6E653B626F726465723A31707820736F6C6964207472616E73706172656E743B77686974652D73';
wwv_flow_imp.g_varchar2_table(135) := '706163653A6E6F777261703B70616464696E673A36707820313270783B666F6E742D73697A653A313470783B6C696E652D6865696768743A312E34323835373134333B626F726465722D7261646975733A3470783B2D7765626B69742D757365722D7365';
wwv_flow_imp.g_varchar2_table(136) := '6C6563743A6E6F6E653B2D6D6F7A2D757365722D73656C6563743A6E6F6E653B2D6D732D757365722D73656C6563743A6E6F6E653B757365722D73656C6563743A6E6F6E657D2E62746E3A666F6375732C2E62746E3A6163746976653A666F6375732C2E';
wwv_flow_imp.g_varchar2_table(137) := '62746E2E6163746976653A666F6375732C2E62746E2E666F6375732C2E62746E3A6163746976652E666F6375732C2E62746E2E6163746976652E666F6375737B6F75746C696E653A7468696E20646F747465643B6F75746C696E653A357078206175746F';
wwv_flow_imp.g_varchar2_table(138) := '202D7765626B69742D666F6375732D72696E672D636F6C6F723B6F75746C696E652D6F66667365743A2D3270787D2E62746E3A686F7665722C2E62746E3A666F6375732C2E62746E2E666F6375737B636F6C6F723A233333333B746578742D6465636F72';
wwv_flow_imp.g_varchar2_table(139) := '6174696F6E3A6E6F6E657D2E62746E3A6163746976652C2E62746E2E6163746976657B6F75746C696E653A303B6261636B67726F756E642D696D6167653A6E6F6E653B2D7765626B69742D626F782D736861646F773A696E736574203020337078203570';
wwv_flow_imp.g_varchar2_table(140) := '78207267626128302C302C302C302E313235293B626F782D736861646F773A696E73657420302033707820357078207267626128302C302C302C302E313235297D2E62746E2E64697361626C65642C2E62746E5B64697361626C65645D2C6669656C6473';
wwv_flow_imp.g_varchar2_table(141) := '65745B64697361626C65645D202E62746E7B637572736F723A6E6F742D616C6C6F7765643B6F7061636974793A2E36353B66696C7465723A616C706861286F7061636974793D3635293B2D7765626B69742D626F782D736861646F773A6E6F6E653B626F';
wwv_flow_imp.g_varchar2_table(142) := '782D736861646F773A6E6F6E657D612E62746E2E64697361626C65642C6669656C647365745B64697361626C65645D20612E62746E7B706F696E7465722D6576656E74733A6E6F6E657D2E62746E2D64656661756C747B636F6C6F723A233333333B6261';
wwv_flow_imp.g_varchar2_table(143) := '636B67726F756E642D636F6C6F723A236666663B626F726465722D636F6C6F723A236363637D2E62746E2D64656661756C743A666F6375732C2E62746E2D64656661756C742E666F6375737B636F6C6F723A233333333B6261636B67726F756E642D636F';
wwv_flow_imp.g_varchar2_table(144) := '6C6F723A236536653665363B626F726465722D636F6C6F723A233863386338637D2E62746E2D64656661756C743A686F7665727B636F6C6F723A233333333B6261636B67726F756E642D636F6C6F723A236536653665363B626F726465722D636F6C6F72';
wwv_flow_imp.g_varchar2_table(145) := '3A236164616461647D2E62746E2D64656661756C743A6163746976652C2E62746E2D64656661756C742E6163746976652C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D64656661756C747B636F6C6F723A233333333B6261636B67';
wwv_flow_imp.g_varchar2_table(146) := '726F756E642D636F6C6F723A236536653665363B626F726465722D636F6C6F723A236164616461647D2E62746E2D64656661756C743A6163746976653A686F7665722C2E62746E2D64656661756C742E6163746976653A686F7665722C2E6F70656E3E2E';
wwv_flow_imp.g_varchar2_table(147) := '64726F70646F776E2D746F67676C652E62746E2D64656661756C743A686F7665722C2E62746E2D64656661756C743A6163746976653A666F6375732C2E62746E2D64656661756C742E6163746976653A666F6375732C2E6F70656E3E2E64726F70646F77';
wwv_flow_imp.g_varchar2_table(148) := '6E2D746F67676C652E62746E2D64656661756C743A666F6375732C2E62746E2D64656661756C743A6163746976652E666F6375732C2E62746E2D64656661756C742E6163746976652E666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C';
wwv_flow_imp.g_varchar2_table(149) := '652E62746E2D64656661756C742E666F6375737B636F6C6F723A233333333B6261636B67726F756E642D636F6C6F723A236434643464343B626F726465722D636F6C6F723A233863386338637D2E62746E2D64656661756C743A6163746976652C2E6274';
wwv_flow_imp.g_varchar2_table(150) := '6E2D64656661756C742E6163746976652C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D64656661756C747B6261636B67726F756E642D696D6167653A6E6F6E657D2E62746E2D64656661756C742E64697361626C65643A686F7665';
wwv_flow_imp.g_varchar2_table(151) := '722C2E62746E2D64656661756C745B64697361626C65645D3A686F7665722C6669656C647365745B64697361626C65645D202E62746E2D64656661756C743A686F7665722C2E62746E2D64656661756C742E64697361626C65643A666F6375732C2E6274';
wwv_flow_imp.g_varchar2_table(152) := '6E2D64656661756C745B64697361626C65645D3A666F6375732C6669656C647365745B64697361626C65645D202E62746E2D64656661756C743A666F6375732C2E62746E2D64656661756C742E64697361626C65642E666F6375732C2E62746E2D646566';
wwv_flow_imp.g_varchar2_table(153) := '61756C745B64697361626C65645D2E666F6375732C6669656C647365745B64697361626C65645D202E62746E2D64656661756C742E666F6375737B6261636B67726F756E642D636F6C6F723A236666663B626F726465722D636F6C6F723A236363637D2E';
wwv_flow_imp.g_varchar2_table(154) := '62746E2D64656661756C74202E62616467657B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233333337D2E62746E2D7072696D6172797B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A23333337616237';
wwv_flow_imp.g_varchar2_table(155) := '3B626F726465722D636F6C6F723A233265366461347D2E62746E2D7072696D6172793A666F6375732C2E62746E2D7072696D6172792E666F6375737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233238363039303B626F7264';
wwv_flow_imp.g_varchar2_table(156) := '65722D636F6C6F723A233132326234307D2E62746E2D7072696D6172793A686F7665727B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233238363039303B626F726465722D636F6C6F723A233230346437347D2E62746E2D7072';
wwv_flow_imp.g_varchar2_table(157) := '696D6172793A6163746976652C2E62746E2D7072696D6172792E6163746976652C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D7072696D6172797B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A23323836';
wwv_flow_imp.g_varchar2_table(158) := '3039303B626F726465722D636F6C6F723A233230346437347D2E62746E2D7072696D6172793A6163746976653A686F7665722C2E62746E2D7072696D6172792E6163746976653A686F7665722C2E6F70656E3E2E64726F70646F776E2D746F67676C652E';
wwv_flow_imp.g_varchar2_table(159) := '62746E2D7072696D6172793A686F7665722C2E62746E2D7072696D6172793A6163746976653A666F6375732C2E62746E2D7072696D6172792E6163746976653A666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D707269';
wwv_flow_imp.g_varchar2_table(160) := '6D6172793A666F6375732C2E62746E2D7072696D6172793A6163746976652E666F6375732C2E62746E2D7072696D6172792E6163746976652E666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D7072696D6172792E666F';
wwv_flow_imp.g_varchar2_table(161) := '6375737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233230346437343B626F726465722D636F6C6F723A233132326234307D2E62746E2D7072696D6172793A6163746976652C2E62746E2D7072696D6172792E616374697665';
wwv_flow_imp.g_varchar2_table(162) := '2C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D7072696D6172797B6261636B67726F756E642D696D6167653A6E6F6E657D2E62746E2D7072696D6172792E64697361626C65643A686F7665722C2E62746E2D7072696D6172795B64';
wwv_flow_imp.g_varchar2_table(163) := '697361626C65645D3A686F7665722C6669656C647365745B64697361626C65645D202E62746E2D7072696D6172793A686F7665722C2E62746E2D7072696D6172792E64697361626C65643A666F6375732C2E62746E2D7072696D6172795B64697361626C';
wwv_flow_imp.g_varchar2_table(164) := '65645D3A666F6375732C6669656C647365745B64697361626C65645D202E62746E2D7072696D6172793A666F6375732C2E62746E2D7072696D6172792E64697361626C65642E666F6375732C2E62746E2D7072696D6172795B64697361626C65645D2E66';
wwv_flow_imp.g_varchar2_table(165) := '6F6375732C6669656C647365745B64697361626C65645D202E62746E2D7072696D6172792E666F6375737B6261636B67726F756E642D636F6C6F723A233333376162373B626F726465722D636F6C6F723A233265366461347D2E62746E2D7072696D6172';
wwv_flow_imp.g_varchar2_table(166) := '79202E62616467657B636F6C6F723A233333376162373B6261636B67726F756E642D636F6C6F723A236666667D2E62746E2D737563636573737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233563623835633B626F72646572';
wwv_flow_imp.g_varchar2_table(167) := '2D636F6C6F723A233463616534637D2E62746E2D737563636573733A666F6375732C2E62746E2D737563636573732E666F6375737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233434396434343B626F726465722D636F6C6F';
wwv_flow_imp.g_varchar2_table(168) := '723A233235353632357D2E62746E2D737563636573733A686F7665727B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233434396434343B626F726465722D636F6C6F723A233339383433397D2E62746E2D737563636573733A61';
wwv_flow_imp.g_varchar2_table(169) := '63746976652C2E62746E2D737563636573732E6163746976652C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D737563636573737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233434396434343B626F72';
wwv_flow_imp.g_varchar2_table(170) := '6465722D636F6C6F723A233339383433397D2E62746E2D737563636573733A6163746976653A686F7665722C2E62746E2D737563636573732E6163746976653A686F7665722C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D737563';
wwv_flow_imp.g_varchar2_table(171) := '636573733A686F7665722C2E62746E2D737563636573733A6163746976653A666F6375732C2E62746E2D737563636573732E6163746976653A666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D737563636573733A666F';
wwv_flow_imp.g_varchar2_table(172) := '6375732C2E62746E2D737563636573733A6163746976652E666F6375732C2E62746E2D737563636573732E6163746976652E666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D737563636573732E666F6375737B636F6C';
wwv_flow_imp.g_varchar2_table(173) := '6F723A236666663B6261636B67726F756E642D636F6C6F723A233339383433393B626F726465722D636F6C6F723A233235353632357D2E62746E2D737563636573733A6163746976652C2E62746E2D737563636573732E6163746976652C2E6F70656E3E';
wwv_flow_imp.g_varchar2_table(174) := '2E64726F70646F776E2D746F67676C652E62746E2D737563636573737B6261636B67726F756E642D696D6167653A6E6F6E657D2E62746E2D737563636573732E64697361626C65643A686F7665722C2E62746E2D737563636573735B64697361626C6564';
wwv_flow_imp.g_varchar2_table(175) := '5D3A686F7665722C6669656C647365745B64697361626C65645D202E62746E2D737563636573733A686F7665722C2E62746E2D737563636573732E64697361626C65643A666F6375732C2E62746E2D737563636573735B64697361626C65645D3A666F63';
wwv_flow_imp.g_varchar2_table(176) := '75732C6669656C647365745B64697361626C65645D202E62746E2D737563636573733A666F6375732C2E62746E2D737563636573732E64697361626C65642E666F6375732C2E62746E2D737563636573735B64697361626C65645D2E666F6375732C6669';
wwv_flow_imp.g_varchar2_table(177) := '656C647365745B64697361626C65645D202E62746E2D737563636573732E666F6375737B6261636B67726F756E642D636F6C6F723A233563623835633B626F726465722D636F6C6F723A233463616534637D2E62746E2D73756363657373202E62616467';
wwv_flow_imp.g_varchar2_table(178) := '657B636F6C6F723A233563623835633B6261636B67726F756E642D636F6C6F723A236666667D2E62746E2D696E666F7B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233562633064653B626F726465722D636F6C6F723A233436';
wwv_flow_imp.g_varchar2_table(179) := '623864617D2E62746E2D696E666F3A666F6375732C2E62746E2D696E666F2E666F6375737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233331623064353B626F726465722D636F6C6F723A233162366438357D2E62746E2D69';
wwv_flow_imp.g_varchar2_table(180) := '6E666F3A686F7665727B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233331623064353B626F726465722D636F6C6F723A233236396162637D2E62746E2D696E666F3A6163746976652C2E62746E2D696E666F2E616374697665';
wwv_flow_imp.g_varchar2_table(181) := '2C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D696E666F7B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233331623064353B626F726465722D636F6C6F723A233236396162637D2E62746E2D696E666F3A';
wwv_flow_imp.g_varchar2_table(182) := '6163746976653A686F7665722C2E62746E2D696E666F2E6163746976653A686F7665722C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D696E666F3A686F7665722C2E62746E2D696E666F3A6163746976653A666F6375732C2E6274';
wwv_flow_imp.g_varchar2_table(183) := '6E2D696E666F2E6163746976653A666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D696E666F3A666F6375732C2E62746E2D696E666F3A6163746976652E666F6375732C2E62746E2D696E666F2E6163746976652E666F';
wwv_flow_imp.g_varchar2_table(184) := '6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D696E666F2E666F6375737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A233236396162633B626F726465722D636F6C6F723A233162366438357D2E';
wwv_flow_imp.g_varchar2_table(185) := '62746E2D696E666F3A6163746976652C2E62746E2D696E666F2E6163746976652C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D696E666F7B6261636B67726F756E642D696D6167653A6E6F6E657D2E62746E2D696E666F2E646973';
wwv_flow_imp.g_varchar2_table(186) := '61626C65643A686F7665722C2E62746E2D696E666F5B64697361626C65645D3A686F7665722C6669656C647365745B64697361626C65645D202E62746E2D696E666F3A686F7665722C2E62746E2D696E666F2E64697361626C65643A666F6375732C2E62';
wwv_flow_imp.g_varchar2_table(187) := '746E2D696E666F5B64697361626C65645D3A666F6375732C6669656C647365745B64697361626C65645D202E62746E2D696E666F3A666F6375732C2E62746E2D696E666F2E64697361626C65642E666F6375732C2E62746E2D696E666F5B64697361626C';
wwv_flow_imp.g_varchar2_table(188) := '65645D2E666F6375732C6669656C647365745B64697361626C65645D202E62746E2D696E666F2E666F6375737B6261636B67726F756E642D636F6C6F723A233562633064653B626F726465722D636F6C6F723A233436623864617D2E62746E2D696E666F';
wwv_flow_imp.g_varchar2_table(189) := '202E62616467657B636F6C6F723A233562633064653B6261636B67726F756E642D636F6C6F723A236666667D2E62746E2D7761726E696E677B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A236630616434653B626F726465722D';
wwv_flow_imp.g_varchar2_table(190) := '636F6C6F723A236565613233367D2E62746E2D7761726E696E673A666F6375732C2E62746E2D7761726E696E672E666F6375737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A236563393731663B626F726465722D636F6C6F72';
wwv_flow_imp.g_varchar2_table(191) := '3A233938356630647D2E62746E2D7761726E696E673A686F7665727B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A236563393731663B626F726465722D636F6C6F723A236435383531327D2E62746E2D7761726E696E673A6163';
wwv_flow_imp.g_varchar2_table(192) := '746976652C2E62746E2D7761726E696E672E6163746976652C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D7761726E696E677B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A236563393731663B626F7264';
wwv_flow_imp.g_varchar2_table(193) := '65722D636F6C6F723A236435383531327D2E62746E2D7761726E696E673A6163746976653A686F7665722C2E62746E2D7761726E696E672E6163746976653A686F7665722C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D7761726E';
wwv_flow_imp.g_varchar2_table(194) := '696E673A686F7665722C2E62746E2D7761726E696E673A6163746976653A666F6375732C2E62746E2D7761726E696E672E6163746976653A666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D7761726E696E673A666F63';
wwv_flow_imp.g_varchar2_table(195) := '75732C2E62746E2D7761726E696E673A6163746976652E666F6375732C2E62746E2D7761726E696E672E6163746976652E666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D7761726E696E672E666F6375737B636F6C6F';
wwv_flow_imp.g_varchar2_table(196) := '723A236666663B6261636B67726F756E642D636F6C6F723A236435383531323B626F726465722D636F6C6F723A233938356630647D2E62746E2D7761726E696E673A6163746976652C2E62746E2D7761726E696E672E6163746976652C2E6F70656E3E2E';
wwv_flow_imp.g_varchar2_table(197) := '64726F70646F776E2D746F67676C652E62746E2D7761726E696E677B6261636B67726F756E642D696D6167653A6E6F6E657D2E62746E2D7761726E696E672E64697361626C65643A686F7665722C2E62746E2D7761726E696E675B64697361626C65645D';
wwv_flow_imp.g_varchar2_table(198) := '3A686F7665722C6669656C647365745B64697361626C65645D202E62746E2D7761726E696E673A686F7665722C2E62746E2D7761726E696E672E64697361626C65643A666F6375732C2E62746E2D7761726E696E675B64697361626C65645D3A666F6375';
wwv_flow_imp.g_varchar2_table(199) := '732C6669656C647365745B64697361626C65645D202E62746E2D7761726E696E673A666F6375732C2E62746E2D7761726E696E672E64697361626C65642E666F6375732C2E62746E2D7761726E696E675B64697361626C65645D2E666F6375732C666965';
wwv_flow_imp.g_varchar2_table(200) := '6C647365745B64697361626C65645D202E62746E2D7761726E696E672E666F6375737B6261636B67726F756E642D636F6C6F723A236630616434653B626F726465722D636F6C6F723A236565613233367D2E62746E2D7761726E696E67202E6261646765';
wwv_flow_imp.g_varchar2_table(201) := '7B636F6C6F723A236630616434653B6261636B67726F756E642D636F6C6F723A236666667D2E62746E2D64616E6765727B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A236439353334663B626F726465722D636F6C6F723A2364';
wwv_flow_imp.g_varchar2_table(202) := '34336633617D2E62746E2D64616E6765723A666F6375732C2E62746E2D64616E6765722E666F6375737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A236339333032633B626F726465722D636F6C6F723A233736316331397D2E';
wwv_flow_imp.g_varchar2_table(203) := '62746E2D64616E6765723A686F7665727B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A236339333032633B626F726465722D636F6C6F723A236163323932357D2E62746E2D64616E6765723A6163746976652C2E62746E2D6461';
wwv_flow_imp.g_varchar2_table(204) := '6E6765722E6163746976652C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D64616E6765727B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F723A236339333032633B626F726465722D636F6C6F723A2361633239';
wwv_flow_imp.g_varchar2_table(205) := '32357D2E62746E2D64616E6765723A6163746976653A686F7665722C2E62746E2D64616E6765722E6163746976653A686F7665722C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D64616E6765723A686F7665722C2E62746E2D6461';
wwv_flow_imp.g_varchar2_table(206) := '6E6765723A6163746976653A666F6375732C2E62746E2D64616E6765722E6163746976653A666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D64616E6765723A666F6375732C2E62746E2D64616E6765723A6163746976';
wwv_flow_imp.g_varchar2_table(207) := '652E666F6375732C2E62746E2D64616E6765722E6163746976652E666F6375732C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D64616E6765722E666F6375737B636F6C6F723A236666663B6261636B67726F756E642D636F6C6F72';
wwv_flow_imp.g_varchar2_table(208) := '3A236163323932353B626F726465722D636F6C6F723A233736316331397D2E62746E2D64616E6765723A6163746976652C2E62746E2D64616E6765722E6163746976652C2E6F70656E3E2E64726F70646F776E2D746F67676C652E62746E2D64616E6765';
wwv_flow_imp.g_varchar2_table(209) := '727B6261636B67726F756E642D696D6167653A6E6F6E657D2E62746E2D64616E6765722E64697361626C65643A686F7665722C2E62746E2D64616E6765725B64697361626C65645D3A686F7665722C6669656C647365745B64697361626C65645D202E62';
wwv_flow_imp.g_varchar2_table(210) := '746E2D64616E6765723A686F7665722C2E62746E2D64616E6765722E64697361626C65643A666F6375732C2E62746E2D64616E6765725B64697361626C65645D3A666F6375732C6669656C647365745B64697361626C65645D202E62746E2D64616E6765';
wwv_flow_imp.g_varchar2_table(211) := '723A666F6375732C2E62746E2D64616E6765722E64697361626C65642E666F6375732C2E62746E2D64616E6765725B64697361626C65645D2E666F6375732C6669656C647365745B64697361626C65645D202E62746E2D64616E6765722E666F6375737B';
wwv_flow_imp.g_varchar2_table(212) := '6261636B67726F756E642D636F6C6F723A236439353334663B626F726465722D636F6C6F723A236434336633617D2E62746E2D64616E676572202E62616467657B636F6C6F723A236439353334663B6261636B67726F756E642D636F6C6F723A23666666';
wwv_flow_imp.g_varchar2_table(213) := '7D2E62746E2D6C696E6B7B636F6C6F723A233333376162373B666F6E742D7765696768743A6E6F726D616C3B626F726465722D7261646975733A307D2E62746E2D6C696E6B2C2E62746E2D6C696E6B3A6163746976652C2E62746E2D6C696E6B2E616374';
wwv_flow_imp.g_varchar2_table(214) := '6976652C2E62746E2D6C696E6B5B64697361626C65645D2C6669656C647365745B64697361626C65645D202E62746E2D6C696E6B7B6261636B67726F756E642D636F6C6F723A7472616E73706172656E743B2D7765626B69742D626F782D736861646F77';
wwv_flow_imp.g_varchar2_table(215) := '3A6E6F6E653B626F782D736861646F773A6E6F6E657D2E62746E2D6C696E6B2C2E62746E2D6C696E6B3A686F7665722C2E62746E2D6C696E6B3A666F6375732C2E62746E2D6C696E6B3A6163746976657B626F726465722D636F6C6F723A7472616E7370';
wwv_flow_imp.g_varchar2_table(216) := '6172656E747D2E62746E2D6C696E6B3A686F7665722C2E62746E2D6C696E6B3A666F6375737B636F6C6F723A233233353237633B746578742D6465636F726174696F6E3A756E6465726C696E653B6261636B67726F756E642D636F6C6F723A7472616E73';
wwv_flow_imp.g_varchar2_table(217) := '706172656E747D2E62746E2D6C696E6B5B64697361626C65645D3A686F7665722C6669656C647365745B64697361626C65645D202E62746E2D6C696E6B3A686F7665722C2E62746E2D6C696E6B5B64697361626C65645D3A666F6375732C6669656C6473';
wwv_flow_imp.g_varchar2_table(218) := '65745B64697361626C65645D202E62746E2D6C696E6B3A666F6375737B636F6C6F723A233737373B746578742D6465636F726174696F6E3A6E6F6E657D2E62746E2D6C677B70616464696E673A3130707820313670783B666F6E742D73697A653A313870';
wwv_flow_imp.g_varchar2_table(219) := '783B6C696E652D6865696768743A312E333333333333333B626F726465722D7261646975733A3670787D2E62746E2D736D7B70616464696E673A35707820313070783B666F6E742D73697A653A313270783B6C696E652D6865696768743A312E353B626F';
wwv_flow_imp.g_varchar2_table(220) := '726465722D7261646975733A3370787D2E62746E2D78737B70616464696E673A317078203570783B666F6E742D73697A653A313270783B6C696E652D6865696768743A312E353B626F726465722D7261646975733A3370787D2E62746E2D626C6F636B7B';
wwv_flow_imp.g_varchar2_table(221) := '646973706C61793A626C6F636B3B77696474683A313030257D2E62746E2D626C6F636B2B2E62746E2D626C6F636B7B6D617267696E2D746F703A3570787D696E7075745B747970653D227375626D6974225D2E62746E2D626C6F636B2C696E7075745B74';
wwv_flow_imp.g_varchar2_table(222) := '7970653D227265736574225D2E62746E2D626C6F636B2C696E7075745B747970653D22627574746F6E225D2E62746E2D626C6F636B7B77696474683A313030257D2E746F6F6C7469707B706F736974696F6E3A6162736F6C7574653B7A2D696E6465783A';
wwv_flow_imp.g_varchar2_table(223) := '313037303B646973706C61793A626C6F636B3B666F6E742D66616D696C793A2248656C766574696361204E657565222C48656C7665746963612C417269616C2C73616E732D73657269663B666F6E742D7374796C653A6E6F726D616C3B666F6E742D7765';
wwv_flow_imp.g_varchar2_table(224) := '696768743A6E6F726D616C3B6C65747465722D73706163696E673A6E6F726D616C3B6C696E652D627265616B3A6175746F3B6C696E652D6865696768743A312E34323835373134333B746578742D616C69676E3A6C6566743B746578742D616C69676E3A';
wwv_flow_imp.g_varchar2_table(225) := '73746172743B746578742D6465636F726174696F6E3A6E6F6E653B746578742D736861646F773A6E6F6E653B746578742D7472616E73666F726D3A6E6F6E653B77686974652D73706163653A6E6F726D616C3B776F72642D627265616B3A6E6F726D616C';
wwv_flow_imp.g_varchar2_table(226) := '3B776F72642D73706163696E673A6E6F726D616C3B776F72642D777261703A6E6F726D616C3B666F6E742D73697A653A313270783B6F7061636974793A303B66696C7465723A616C706861286F7061636974793D30297D2E746F6F6C7469702E696E7B6F';
wwv_flow_imp.g_varchar2_table(227) := '7061636974793A2E393B66696C7465723A616C706861286F7061636974793D3930297D2E746F6F6C7469702E746F707B6D617267696E2D746F703A2D3370783B70616464696E673A35707820307D2E746F6F6C7469702E72696768747B6D617267696E2D';
wwv_flow_imp.g_varchar2_table(228) := '6C6566743A3370783B70616464696E673A30203570787D2E746F6F6C7469702E626F74746F6D7B6D617267696E2D746F703A3370783B70616464696E673A35707820307D2E746F6F6C7469702E6C6566747B6D617267696E2D6C6566743A2D3370783B70';
wwv_flow_imp.g_varchar2_table(229) := '616464696E673A30203570787D2E746F6F6C7469702D696E6E65727B6D61782D77696474683A32303070783B70616464696E673A337078203870783B636F6C6F723A236666663B746578742D616C69676E3A63656E7465723B6261636B67726F756E642D';
wwv_flow_imp.g_varchar2_table(230) := '636F6C6F723A233030303B626F726465722D7261646975733A3470787D2E746F6F6C7469702D6172726F777B706F736974696F6E3A6162736F6C7574653B77696474683A303B6865696768743A303B626F726465722D636F6C6F723A7472616E73706172';
wwv_flow_imp.g_varchar2_table(231) := '656E743B626F726465722D7374796C653A736F6C69647D2E746F6F6C7469702E746F70202E746F6F6C7469702D6172726F777B626F74746F6D3A303B6C6566743A3530253B6D617267696E2D6C6566743A2D3570783B626F726465722D77696474683A35';
wwv_flow_imp.g_varchar2_table(232) := '70782035707820303B626F726465722D746F702D636F6C6F723A233030307D2E746F6F6C7469702E746F702D6C656674202E746F6F6C7469702D6172726F777B626F74746F6D3A303B72696768743A3570783B6D617267696E2D626F74746F6D3A2D3570';
wwv_flow_imp.g_varchar2_table(233) := '783B626F726465722D77696474683A3570782035707820303B626F726465722D746F702D636F6C6F723A233030307D2E746F6F6C7469702E746F702D7269676874202E746F6F6C7469702D6172726F777B626F74746F6D3A303B6C6566743A3570783B6D';
wwv_flow_imp.g_varchar2_table(234) := '617267696E2D626F74746F6D3A2D3570783B626F726465722D77696474683A3570782035707820303B626F726465722D746F702D636F6C6F723A233030307D2E746F6F6C7469702E7269676874202E746F6F6C7469702D6172726F777B746F703A353025';
wwv_flow_imp.g_varchar2_table(235) := '3B6C6566743A303B6D617267696E2D746F703A2D3570783B626F726465722D77696474683A357078203570782035707820303B626F726465722D72696768742D636F6C6F723A233030307D2E746F6F6C7469702E6C656674202E746F6F6C7469702D6172';
wwv_flow_imp.g_varchar2_table(236) := '726F777B746F703A3530253B72696768743A303B6D617267696E2D746F703A2D3570783B626F726465722D77696474683A357078203020357078203570783B626F726465722D6C6566742D636F6C6F723A233030307D2E746F6F6C7469702E626F74746F';
wwv_flow_imp.g_varchar2_table(237) := '6D202E746F6F6C7469702D6172726F777B746F703A303B6C6566743A3530253B6D617267696E2D6C6566743A2D3570783B626F726465722D77696474683A3020357078203570783B626F726465722D626F74746F6D2D636F6C6F723A233030307D2E746F';
wwv_flow_imp.g_varchar2_table(238) := '6F6C7469702E626F74746F6D2D6C656674202E746F6F6C7469702D6172726F777B746F703A303B72696768743A3570783B6D617267696E2D746F703A2D3570783B626F726465722D77696474683A3020357078203570783B626F726465722D626F74746F';
wwv_flow_imp.g_varchar2_table(239) := '6D2D636F6C6F723A233030307D2E746F6F6C7469702E626F74746F6D2D7269676874202E746F6F6C7469702D6172726F777B746F703A303B6C6566743A3570783B6D617267696E2D746F703A2D3570783B626F726465722D77696474683A302035707820';
wwv_flow_imp.g_varchar2_table(240) := '3570783B626F726465722D626F74746F6D2D636F6C6F723A233030307D2E706F706F7665727B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B7A2D696E6465783A313036303B646973706C61793A6E6F6E653B6D61782D77';
wwv_flow_imp.g_varchar2_table(241) := '696474683A32373670783B70616464696E673A3170783B666F6E742D66616D696C793A2248656C766574696361204E657565222C48656C7665746963612C417269616C2C73616E732D73657269663B666F6E742D7374796C653A6E6F726D616C3B666F6E';
wwv_flow_imp.g_varchar2_table(242) := '742D7765696768743A6E6F726D616C3B6C65747465722D73706163696E673A6E6F726D616C3B6C696E652D627265616B3A6175746F3B6C696E652D6865696768743A312E34323835373134333B746578742D616C69676E3A6C6566743B746578742D616C';
wwv_flow_imp.g_varchar2_table(243) := '69676E3A73746172743B746578742D6465636F726174696F6E3A6E6F6E653B746578742D736861646F773A6E6F6E653B746578742D7472616E73666F726D3A6E6F6E653B77686974652D73706163653A6E6F726D616C3B776F72642D627265616B3A6E6F';
wwv_flow_imp.g_varchar2_table(244) := '726D616C3B776F72642D73706163696E673A6E6F726D616C3B776F72642D777261703A6E6F726D616C3B666F6E742D73697A653A313470783B6261636B67726F756E642D636F6C6F723A236666663B6261636B67726F756E642D636C69703A7061646469';
wwv_flow_imp.g_varchar2_table(245) := '6E672D626F783B626F726465723A31707820736F6C696420236363633B626F726465723A31707820736F6C6964207267626128302C302C302C302E32293B626F726465722D7261646975733A3670783B2D7765626B69742D626F782D736861646F773A30';
wwv_flow_imp.g_varchar2_table(246) := '203570782031307078207267626128302C302C302C302E32293B626F782D736861646F773A30203570782031307078207267626128302C302C302C302E32297D2E706F706F7665722E746F707B6D617267696E2D746F703A2D313070787D2E706F706F76';
wwv_flow_imp.g_varchar2_table(247) := '65722E72696768747B6D617267696E2D6C6566743A313070787D2E706F706F7665722E626F74746F6D7B6D617267696E2D746F703A313070787D2E706F706F7665722E6C6566747B6D617267696E2D6C6566743A2D313070787D2E706F706F7665722D74';
wwv_flow_imp.g_varchar2_table(248) := '69746C657B6D617267696E3A303B70616464696E673A38707820313470783B666F6E742D73697A653A313470783B6261636B67726F756E642D636F6C6F723A236637663766373B626F726465722D626F74746F6D3A31707820736F6C6964202365626562';
wwv_flow_imp.g_varchar2_table(249) := '65623B626F726465722D7261646975733A35707820357078203020307D2E706F706F7665722D636F6E74656E747B70616464696E673A39707820313470787D2E706F706F7665723E2E6172726F772C2E706F706F7665723E2E6172726F773A6166746572';
wwv_flow_imp.g_varchar2_table(250) := '7B706F736974696F6E3A6162736F6C7574653B646973706C61793A626C6F636B3B77696474683A303B6865696768743A303B626F726465722D636F6C6F723A7472616E73706172656E743B626F726465722D7374796C653A736F6C69647D2E706F706F76';
wwv_flow_imp.g_varchar2_table(251) := '65723E2E6172726F777B626F726465722D77696474683A313170787D2E706F706F7665723E2E6172726F773A61667465727B626F726465722D77696474683A313070783B636F6E74656E743A22227D2E706F706F7665722E746F703E2E6172726F777B6C';
wwv_flow_imp.g_varchar2_table(252) := '6566743A3530253B6D617267696E2D6C6566743A2D313170783B626F726465722D626F74746F6D2D77696474683A303B626F726465722D746F702D636F6C6F723A233939393B626F726465722D746F702D636F6C6F723A7267626128302C302C302C302E';
wwv_flow_imp.g_varchar2_table(253) := '3235293B626F74746F6D3A2D313170787D2E706F706F7665722E746F703E2E6172726F773A61667465727B636F6E74656E743A2220223B626F74746F6D3A3170783B6D617267696E2D6C6566743A2D313070783B626F726465722D626F74746F6D2D7769';
wwv_flow_imp.g_varchar2_table(254) := '6474683A303B626F726465722D746F702D636F6C6F723A236666667D2E706F706F7665722E72696768743E2E6172726F777B746F703A3530253B6C6566743A2D313170783B6D617267696E2D746F703A2D313170783B626F726465722D6C6566742D7769';
wwv_flow_imp.g_varchar2_table(255) := '6474683A303B626F726465722D72696768742D636F6C6F723A233939393B626F726465722D72696768742D636F6C6F723A7267626128302C302C302C302E3235297D2E706F706F7665722E72696768743E2E6172726F773A61667465727B636F6E74656E';
wwv_flow_imp.g_varchar2_table(256) := '743A2220223B6C6566743A3170783B626F74746F6D3A2D313070783B626F726465722D6C6566742D77696474683A303B626F726465722D72696768742D636F6C6F723A236666667D2E706F706F7665722E626F74746F6D3E2E6172726F777B6C6566743A';
wwv_flow_imp.g_varchar2_table(257) := '3530253B6D617267696E2D6C6566743A2D313170783B626F726465722D746F702D77696474683A303B626F726465722D626F74746F6D2D636F6C6F723A233939393B626F726465722D626F74746F6D2D636F6C6F723A7267626128302C302C302C302E32';
wwv_flow_imp.g_varchar2_table(258) := '35293B746F703A2D313170787D2E706F706F7665722E626F74746F6D3E2E6172726F773A61667465727B636F6E74656E743A2220223B746F703A3170783B6D617267696E2D6C6566743A2D313070783B626F726465722D746F702D77696474683A303B62';
wwv_flow_imp.g_varchar2_table(259) := '6F726465722D626F74746F6D2D636F6C6F723A236666667D2E706F706F7665722E6C6566743E2E6172726F777B746F703A3530253B72696768743A2D313170783B6D617267696E2D746F703A2D313170783B626F726465722D72696768742D7769647468';
wwv_flow_imp.g_varchar2_table(260) := '3A303B626F726465722D6C6566742D636F6C6F723A233939393B626F726465722D6C6566742D636F6C6F723A7267626128302C302C302C302E3235297D2E706F706F7665722E6C6566743E2E6172726F773A61667465727B636F6E74656E743A2220223B';
wwv_flow_imp.g_varchar2_table(261) := '72696768743A3170783B626F726465722D72696768742D77696474683A303B626F726465722D6C6566742D636F6C6F723A236666663B626F74746F6D3A2D313070787D';
null;
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
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(11568325136932146888)
,p_plugin_id=>wwv_flow_imp.id(11173664159118911226)
,p_file_name=>'css/bootstrap.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
