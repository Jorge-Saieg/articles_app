# Posts App

Esta es una aplicación Flutter que muestra una lista de artículos y permite a los usuarios ver los detalles de cada artículo. La aplicación implementa las mejores prácticas de arquitectura limpia y utiliza el patrón BLoC para la gestión del estado.

## Características

- Muestra una lista de artículos desde una API remota
- Permite ver los detalles de cada artículo
- Implementa almacenamiento local para acceso sin conexión usando Hive
- Soporta cambio entre modo claro y oscuro
- Implementa internacionalización (soporte para inglés y español)
- Utiliza inyección de dependencias con GetIt
- Maneja errores con diálogos de alerta

## Estructura del Proyecto

El proyecto sigue una arquitectura limpia y está organizado en las siguientes capas:

- `core`: Contiene funcionalidades centrales como el cliente API.
- `data`: Implementa la capa de datos, incluyendo fuentes de datos remotas y locales.
- `domain`: Define las entidades de dominio, casos de uso y interfaces de repositorio.
- `presentation`: Contiene la interfaz de usuario, incluyendo páginas, widgets y BLoCs.

## Cómo funciona

1. Al iniciar la aplicación, se configura la inyección de dependencias con GetIt.
2. La página principal (`ArticleListPage`) muestra una lista de artículos.
3. Al cargar la página, se dispara un evento para obtener los artículos.
4. El `ArticleListBloc` maneja este evento y obtiene los artículos del repositorio.
5. Si hay una conexión a internet, los artículos se obtienen de la API remota y se almacenan localmente.
6. Si no hay conexión, se muestran los artículos almacenados localmente.
7. Los usuarios pueden hacer clic en un artículo para ver sus detalles.
8. Los usuarios pueden cambiar entre modo claro y oscuro usando el botón en la barra de aplicaciones.

## Manejo de Errores

La aplicación utiliza un `BlocConsumer` en la `ArticleListPage` para manejar errores. Cuando ocurre un error al cargar los artículos, se muestra al usuario el mensaje de error.

## Almacenamiento Local

La aplicación utiliza Hive para el almacenamiento local de artículos. Esto permite que la aplicación funcione sin conexión una vez que los artículos se han cargado inicialmente.

## Temas

La aplicación soporta temas claro y oscuro. El `ThemeBloc` maneja el cambio entre estos temas, que se puede activar mediante un botón en la barra de aplicaciones.

## Internacionalización

La aplicación está configurada para soportar múltiples idiomas, actualmente inglés y español. Los archivos de traducción se encuentran en la carpeta `l10n`.

## Cómo ejecutar

1. Asegúrate de tener Flutter instalado en tu sistema.
2. Clona este repositorio.
3. Ejecuta `flutter pub get` para obtener las dependencias.
4. Ejecuta `flutter pub run build_runner build` para generar el código necesario para Hive.
5. Ejecuta `flutter run` para iniciar la aplicación.

## Dependencias principales

- `flutter_bloc`: Para la gestión del estado.
- `get_it`: Para la inyección de dependencias.
- `hive`: Para el almacenamiento local.
- `dio`: Para las llamadas a la API.
- `go_router`: Para la navegación.