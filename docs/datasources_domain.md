# Explicación del Código

El archivo define una **clase abstracta** en Dart llamada `MovieDatasource`. Las clases abstractas sirven como plantillas o contratos para otras clases. No pueden ser instanciadas directamente, sino que deben ser extendidas o implementadas por otras clases que proporcionen implementaciones concretas de sus métodos.

## Detalles clave:

1. **Propósito de la clase**:  
   La clase `MovieDatasource` forma parte de la capa de datos del proyecto. Su objetivo es definir un contrato para obtener datos relacionados con películas, específicamente aquellas que están en cartelera ("now playing"). Este enfoque permite separar la definición de la lógica de obtención de datos de su implementación concreta, promoviendo flexibilidad y facilidad de prueba.

2. **Método `getNowPlaying`**:  
   - El método declarado, `getNowPlaying`, es asíncrono, como lo indica su tipo de retorno `Future<List<Movie>>`. Esto significa que devolverá un `Future` que eventualmente contendrá una lista de objetos `Movie`.  
   - La naturaleza asíncrona sugiere que el proceso de obtención de datos podría involucrar operaciones como llamadas a una API o consultas a una base de datos, las cuales son inherentemente asíncronas.

3. **Parámetro opcional**:  
   El método incluye un parámetro opcional llamado `page`, con un valor predeterminado de `1`. Este parámetro probablemente se utiliza para la paginación, permitiendo al usuario especificar qué página de resultados desea obtener. Si no se proporciona un valor para `page`, se usará el valor predeterminado de `1`, asegurando que se obtenga la primera página de resultados.

4. **Naturaleza abstracta**:  
   Al ser una clase abstracta, el método `getNowPlaying` no tiene cuerpo. Esto obliga a cualquier clase que extienda o implemente `MovieDatasource` a proporcionar una implementación concreta de este método. Este diseño garantiza una interfaz consistente para obtener películas en cartelera, independientemente de la fuente de datos subyacente (por ejemplo, una API REST, una base de datos local o datos simulados para pruebas).

## Caso de uso:
Este tipo de abstracción es común en proyectos que siguen patrones como el **Repository Pattern** o la **Arquitectura Limpia (Clean Architecture)**. Por ejemplo:
- Podrías tener múltiples implementaciones de `MovieDatasource`, como `ApiMovieDatasource` para obtener datos de una API remota y `LocalMovieDatasource` para recuperar datos almacenados en caché.
- Al depender de la abstracción `MovieDatasource` en lugar de una implementación específica, puedes cambiar fácilmente la fuente de datos sin afectar otras partes de la aplicación.

## Resumen:
Este código define un contrato flexible y reutilizable para obtener películas en cartelera, asegurando que cualquier implementación cumpla con la misma interfaz, mientras permite que la lógica de obtención de datos varíe según sea necesario.