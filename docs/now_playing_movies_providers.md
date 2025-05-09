# Explicación del Código

El código define un sistema de gestión de estado utilizando **Riverpod** para manejar las películas "en cartelera" en una aplicación Flutter. Se utiliza una combinación de `StateNotifier` y `StateNotifierProvider` para gestionar y exponer el estado de una lista de entidades `Movie`, además de proporcionar funcionalidad para cargar más páginas de películas desde el repositorio.

## Componentes clave:

1. **`nowPlayingMoviesProvider`**:  
   - Este es un `StateNotifierProvider` que crea y gestiona una instancia de la clase `MoviesNotifier`.  
   - El provider depende de `movieRepositoryProvider` para acceder al método `getNowPlaying` de la clase `MovieRepositoryImpl`. Este método se utiliza para obtener las películas "en cartelera" desde la fuente de datos.
   - Al usar `ref.watch(movieRepositoryProvider)`, el provider asegura que puede reaccionar a cambios en el repositorio si es necesario.

2. **`MoviesNotifier`**:  
   - La clase `MoviesNotifier` extiende `StateNotifier<List<Movie>>`, lo que significa que gestiona un estado que es una lista de objetos `Movie`. El estado inicial es una lista vacía (`super([])`).
   - Incluye una variable `currentPage` para rastrear la página actual de películas que se está cargando.
   - El campo `fetchMoreMovies` es un callback del tipo `MovieCallback`, que es un typedef para una función que devuelve un `Future<List<Movie>>` con un parámetro opcional `page`. Este callback se inyecta en el constructor del notifier, lo que lo hace flexible y fácil de probar.

3. **Método `loadNextPage`**:  
   - Este método se encarga de cargar la siguiente página de películas "en cartelera".
   - Incrementa el contador `currentPage` y llama al callback `fetchMoreMovies` con el número de página actualizado.
   - Las películas obtenidas se agregan al estado actual utilizando el operador spread (`...`), asegurando que el estado contenga tanto las películas previamente cargadas como las nuevas.

4. **Inyección de Dependencias**:  
   - `MoviesNotifier` depende del callback `fetchMoreMovies`, que es proporcionado por `movieRepositoryProvider`. Este diseño sigue el principio de **Inyección de Dependencias**, desacoplando el notifier de la implementación específica del repositorio o la fuente de datos.

## Propósito del Código:
Este sistema está diseñado para gestionar el estado de las películas "en cartelera" en la aplicación. Proporciona:
- Una forma centralizada de obtener y almacenar la lista de películas.
- Soporte para paginación a través del método `loadNextPage`, permitiendo que la aplicación cargue más páginas de películas según sea necesario.
- Una separación clara de responsabilidades, donde el notifier maneja la gestión del estado y el repositorio se encarga de la obtención de datos.

## Beneficios:
- **Reactividad**: Al usar Riverpod, el estado del `nowPlayingMoviesProvider` es reactivo. Cualquier widget que escuche este provider se reconstruirá automáticamente cuando el estado cambie.
- **Escalabilidad**: El uso de `StateNotifier` facilita la adición de más funcionalidades, como manejo de errores o indicadores de carga, sin afectar el resto de la aplicación.
- **Facilidad de Pruebas**: `MoviesNotifier` puede ser probado fácilmente proporcionando un callback simulado para `fetchMoreMovies`.

## Resumen:
Este código implementa un sistema robusto y modular para gestionar las películas "en cartelera" en la aplicación, aprovechando las capacidades de gestión de estado de Riverpod y siguiendo los principios de arquitectura limpia. Esto asegura que la aplicación sea escalable, fácil de mantener y probada de manera eficiente.