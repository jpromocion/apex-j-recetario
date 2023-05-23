prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>125
,p_default_id_offset=>0
,p_default_owner=>'RECETAS'
);
wwv_flow_imp_page.create_page(
 p_id=>11
,p_name=>'Ayuda imagenes'
,p_alias=>'AYUDA-IMAGENES'
,p_step_title=>'Ayuda imagenes'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20230523105412'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13109159796766003)
,p_plug_name=>unistr('Im\00E1genes aplicaci\00F3n')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(12461234257418262)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('La aplicaci\00F3n tiene una serie de im\00E1genes de utilidad com\00FAn para incluir al explicar los pasos de una receta. Las mismas est\00E1n dentro de <code>&P11_URLBASE.#APP_FILES#imagenes_cocina/</code>. <br/>'),
unistr('La ruta base es dada por la de aplicaci\00F3n m\00E1s el string de sustituci\00F3n "APP_FILES".  <br/>'),
'<br/>',
unistr('Al utilizar en el Rich text de descripci\00F3n del paso de una receta, imagenes como tal no deja meter, pero si insertar un HTML. '),
unistr('A partir de aqu\00ED se puede utilizar el tag "img" de html para incluir una imagen, pero aqu\00ED es necesario incluir una URL completa de la imagen (no con el string de sustituci\00F3n).'),
unistr('Si se van a utilizar las imagenes incorporadas con el despliegue de la aplicaci\00F3n, est\00E1 depender\00E1n de la URL final donde tu aplicaci\00F3n se haya desplegado. <br/>'),
'<br/>',
unistr('Para ello, a continuaci\00F3n se muestran una serie de ejemplos de iconos utiles incluidos en la aplicaci\00F3n, '),
unistr('junto con el c\00F3digo que debe utilizarse en cada caso con la url que se ha extraido de su aplicaci\00F3n actual, que deber\00EDa inclurse dentro'),
'de un fragmento HTML. ',
'<br/>',
'',
unistr('<h3>Ejemplos iconos \00FAtiles incluidos</h3>'),
'',
'<table>',
'  <tr>',
'    <td>',
'        <figure>',
'        <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/amasar_rodillo_48.png" alt="Amasar rodillo" title="Amasar rodillo">',
'        <figcaption>Amasar rodillo</figcaption>',
'        </figure>',
'    </td>',
'    <td>',
'        <p style="font-family: monospace;">',
'        &lt;figure&gt;',
'        <br/>',
'        &nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/amasar_rodillo_48.png" alt="Amasar rodillo" title="Amasar rodillo"&gt;',
'        <br/>',
'        &nbsp;&lt;figcaption&gt;Amasar rodillo&lt;/figcaption&gt;',
'        <br/>',
'        &lt;/figure&gt;',
'        <br/>',
'        &nbsp;',
'        </p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#/imagenes_cocina/batidora_48.png" alt="Batidora" title="Batidora">',
'  <figcaption>Batidora</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/batidora_48.png" alt="Batidora" title="Batidora"&gt;',
'<br>',
'&nbsp;&lt;figcaption&gt;Batidora&lt;/figcaption&gt;',
'<br>',
'&lt;/figure&gt;',
'<br>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/batidora_trituradora_48.png" alt="Batidora trituradora" title="Batidora trituradora">',
'  <figcaption>Batidora trituradora</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/batidora_trituradora_48.png" alt="Batidora trituradora" title="Batidora trituradora"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Batidora trituradora&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/batidora_varillas_48.png" alt="Batidora varillas" title="Batidora varillas">',
'  <figcaption>Batidora varillas</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/batidora_varillas_48.png" alt="Batidora varillas" title="Batidora varillas"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Batidora varillas&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/bol_48.png" alt="Bol" title="Bol">',
'  <figcaption>Bol</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/bol_48.png" alt="Bol" title="Bol"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Bol&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/cazo_48.png" alt="Cazo" title="Cazo">',
'  <figcaption>Cazo</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/cazo_48.png" alt="Cazo" title="Cazo"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Cazo&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/cazuela_48.png" alt="Cacerola" title="Cacerola">',
'  <figcaption>Cacerola</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/cazuela_48.png" alt="Cacerola" title="Cacerola"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Cacerola&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/cazuela_tapada_48.png" alt="Cacerola tapada" title="Cacerola tapada">',
'  <figcaption>Cacerola tapada</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/cazuela_tapada_48.png" alt="Cacerola tapada" title="Cacerola tapada"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Cacerola tapada&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/horno_48.png" alt="Horno" title="Horno">',
'  <figcaption>Horno</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/horno_48.png" alt="Horno" title="Horno"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Horno&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/microhondas_48.png" alt="Microhondas" title="Microhondas">',
'  <figcaption>Microhondas</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/microhondas_48.png" alt="Microhondas" title="Microhondas"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Microhondas&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/olla_express_48.png" alt="Olla express" title="Olla express">',
'  <figcaption>Olla express</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/olla_express_48.png" alt="Olla express" title="Olla express"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Olla express&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
unistr('  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/sarten_48.png" alt="Sart\00E9n" title="Sart\00E9n">'),
unistr('  <figcaption>Sart\00E9n</figcaption>'),
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
unistr('&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/sarten_48.png" alt="Sart\00E9n" title="Sart\00E9n"&gt;'),
'<br/>',
unistr('&nbsp;&lt;figcaption&gt;Sart\00E9n&lt;/figcaption&gt;'),
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
unistr('  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/sarten_tapada_48.png" alt="Sart\00E9n tapada" title="Sart\00E9n tapada">'),
unistr('  <figcaption>Sart\00E9n tapada</figcaption>'),
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
unistr('&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/sarten_tapada_48.png" alt="Sart\00E9n tapada" title="Sart\00E9n tapada"&gt;'),
'<br/>',
unistr('&nbsp;&lt;figcaption&gt;Sart\00E9n tapada&lt;/figcaption&gt;'),
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'  <tr>',
'    <td>',
'<figure>',
'  <img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/varillas_mano_48.png" alt="Varillas mano" title="Varillas mano">',
'  <figcaption>Varillas mano</figcaption>',
'</figure>',
'    </td>',
'    <td>',
'<p style="font-family: monospace;">',
'&lt;figure&gt;',
'<br/>',
'&nbsp;&lt;img src="&P11_URLBASE.#APP_FILES#imagenes_cocina/varillas_mano_48.png" alt="Varillas mano" title="Varillas mano"&gt;',
'<br/>',
'&nbsp;&lt;figcaption&gt;Varillas mano&lt;/figcaption&gt;',
'<br/>',
'&lt;/figure&gt;',
'<br/>',
'&nbsp;',
'</p>',
'    </td>',
'  </tr>',
'</table>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25965867656020381)
,p_plug_name=>unistr('Recetario (Ayuda im\00E1genes)')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(12496653443418281)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_region_image=>'#APP_FILES#icons/app-icon-192.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13109449238766006)
,p_name=>'P11_URLBASE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13109159796766003)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13109516606766007)
,p_computation_sequence=>10
,p_computation_item=>'P11_URLBASE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN OWA_UTIL.get_cgi_env (''REQUEST_PROTOCOL'') || ''://''',
'|| OWA_UTIL.get_cgi_env (''HTTP_HOST'') || ''/ords/'';',
'--|| OWA_UTIL.get_cgi_env (''SERVER_PORT'');-- || ''/''',
'--|| OWA_UTIL.get_cgi_env (''SCRIPT_NAME'') ;',
'--|| OWA_UTIL.get_cgi_env (''path_info'') --|| ''?''',
'--|| OWA_UTIL.get_cgi_env (''QUERY_STRING'') ;'))
);
wwv_flow_imp.component_end;
end;
/