# Recetario

![Buscador tarjetas](/screenshots/app-icon-192.png)

Gestiona tus recetas de cocina de forma centralizada. Marca los ingredientes, rellena los pasos con amplia posibilidad de edición enriquecida, guarda las fotos asociadas al plato que te gusten, aplica tags de localización, guarda tu valoración.

Comparte el acceso con el resto de tu familia para que vean/editen las recetas, desplegando en Cloud Free de Oracle por ejemplo.

Busqueda inteligente para dar rapidamente con la receta deseada.

¿No sabes que hacer de comer y estás cansado de recurrir a la libreta de papel y no parar de pasar páginas?
¿La libreta de papel de toda la vida se ensucia mientras cocina y tienes que estar re-escribiendo las recetas?
-> No te lo pienses más, cambiate a "Recetario".

NOTA: Si requieres imprimir la receta, no se adopta ninguna herramienta de informe, básicamente porque desde el detalle de una receta concreta, con la opción imprimir y guardar como pdf del navegador... se puede imprimir con toda la información perfectamente.

## Requisitos

Es una aplicación en Oracle APEX 22.2.4.

Se requiere al menos una Oracle 12c. Preparado para utilizarse con el Cloud Free de Oracle.

Incluye PWA: optimizado para ver en movil, incluye la posibilidad de instalarlo en tu sistema como una aplicación.

## Instalación

Es una exportación de la aplicación APEX tal cual en carpeta "src/main/application":
 * Version descromida de la exportacion por zip ("Split into Multiple Files").
 * Incluye los Supported Objects para crearla desde inicio con los objetos de Base de datos necesarios.

Instalar en una nueva instancia simplemente:
 * Comprimir en zip "src/main/application".
 * Importar aplicación en APEX con el zip generado, asignandole el id que queremos.
 * Si no se tienen instalados los objetos de BBDD de inicio, marcar la opcion de instalar los "Supported Objects".
 * Su esquema de login por defecto en la aplicación, son las cuentas de APEX. Asigna al menos una cuenta con el rol "Administrator" para tener todas las opciones posibles.

El "src/main/database2 es simplemente para facilitar la manipulación del código, pero la aplicación incluye la instalación de los supported objects.

En "historico":
 * Esta mi backup de recetas.


## Capturas

### Buscador en modo tarjetas

![Buscador tarjetas](/screenshots/imagen1.png)

Permite varios filtros:
 * texto general
 * número personas
 * Valoración mínima
 * Ingredientes (que tenga cualquiera de ellos, o que tenga todos)
 * Etiquetas/tags (que tenga cualquiera de ellas, o que tenga todas)

Muestra reesultados en forma de tarjeta visual.

### Buscador en modo informe

![Buscador informe](/screenshots/imagen2.png)

Busqueda con los filtros anteriores, pero también es un informe interactivo que permite funcionalidad avanzada: filtros particulares, agrupaciones, exportación del resultado....

### Detalle de una receta

Ve y maneja en detalle una receta. Sus datos base, sus ingredientes, sus pasos o sus fotos asociadas.
Cambia facilmente a otra receta para modificar.
NOTA: paneles modales para editar cada dato.

![Panel maestro de la receta](/screenshots/imagen3.png)

![Modificación receta](/screenshots/imagen4.png)

![Modificación ingrediente](/screenshots/imagen5.png)

![Modificación paso](/screenshots/imagen6.png)

![Incorpora fotos](/screenshots/imagen7.png)


### Gestiona en tu movil

![Buscador movil](/screenshots/imagen8.png)

![Detalle receta movil](/screenshots/imagen9.png)