# Explicación del Código

El código proporcionado define una clase de utilidad llamada `MovieMapper`, cuya responsabilidad es convertir datos de un modelo a otro. Específicamente, mapea un objeto `MovieMovieDB` (que probablemente representa una película obtenida de una API externa, como TMDb) a una entidad `Movie` (utilizada en la capa de dominio de la aplicación). Este mapeo asegura que la aplicación trabaje con una estructura de datos consistente y limpia en su lógica central, independientemente del formato de los datos recibidos de fuentes externas.

## Componentes clave:

1. **Importaciones**:  
   - Se importa el archivo `movie.dart` desde el directorio `domain/entities`, que define la entidad `Movie`. Esta entidad representa la estructura principal de una película en la capa de dominio, siguiendo los principios de la Arquitectura Limpia.
   - Se importa el archivo `movie_moviedb.dart` desde el directorio `infrastructure/models/moviedb`, que define el modelo `MovieMovieDB`. Este modelo probablemente representa la estructura de datos crudos devueltos por la API de The Movie Database (TMDb).

2. **Método estático**:  
   La clase `MovieMapper` contiene un único método estático, `movieDBToEntity`, que realiza el mapeo. Al ser un método estático, puede ser llamado sin necesidad de crear una instancia de la clase `MovieMapper`, destacando su naturaleza de utilidad.

3. **Lógica de mapeo**:  
   El método `movieDBToEntity` toma un objeto `MovieMovieDB` como entrada y devuelve un objeto `Movie`. El mapeo incluye:
   - Copiar directamente la mayoría de los campos de `MovieMovieDB` a `Movie`, como `adult`, `id`, `title`, `overview`, etc.
   - Transformar el campo `genreIds`: Dado que `MovieMovieDB` almacena `genreIds` como una lista de enteros, el método convierte cada entero a una cadena utilizando `.map((e) => e.toString())` y luego lo convierte nuevamente a una lista con `.toList()`. Esto asegura que el campo `genreIds` en la entidad `Movie` sea una lista de cadenas, como lo requiere la capa de dominio.

4. **Propósito del Mapper**:  
   La clase `MovieMapper` actúa como un puente entre la capa de infraestructura (donde existen modelos de datos crudos como `MovieMovieDB`) y la capa de dominio (que utiliza entidades limpias y específicas de la aplicación como `Movie`). Esta separación asegura que la capa de dominio permanezca desacoplada de las fuentes de datos externas y sus formatos específicos.

## Beneficios de este enfoque:

- **Encapsulación**: La lógica de mapeo está encapsulada dentro de la clase `MovieMapper`, manteniendo el proceso de conversión centralizado y reutilizable.
- **Arquitectura Limpia**: Al convertir modelos de datos crudos a entidades de dominio, la aplicación sigue los principios de la Arquitectura Limpia, asegurando que la capa de dominio sea independiente de las APIs externas o fuentes de datos.
- **Flexibilidad**: Si la estructura de `MovieMovieDB` cambia en el futuro (por ejemplo, si la API introduce nuevos campos o modifica los existentes), solo será necesario actualizar el `MovieMapper`, dejando el resto de la aplicación intacto.

## Resumen:
La clase `MovieMapper` es una utilidad que asegura que la capa de dominio de la aplicación trabaje con datos limpios y consistentes al transformar modelos de API crudos en entidades específicas del dominio. Este diseño promueve modularidad, facilidad de prueba y mantenibilidad.