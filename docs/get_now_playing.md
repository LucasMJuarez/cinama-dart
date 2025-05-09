# Explicación del Código

El código define la clase `MoviedbDatasources`, que es una implementación concreta de la clase abstracta `MovieDatasource`. Esta clase se encarga de obtener las películas "en cartelera" desde la API de TMDb (The Movie Database) y convertir la respuesta cruda de la API en una lista de entidades `Movie` que pueden ser utilizadas dentro de la capa de dominio de la aplicación.

## Componentes clave:

1. **Instancia de Dio**:  
   La clase inicializa una instancia de `Dio` con `BaseOptions` para configurar el cliente HTTP. Las opciones incluyen:
   - `baseUrl`: Se establece como la URL base de la API de TMDb (`https://api.themoviedb.org/3`).
   - `queryParameters`: Incluye parámetros predeterminados como:
     - `api_key`: Recuperado de `Environment.theMovieDbKey`, que probablemente almacena la clave de la API de forma segura.
     - `language`: Establecido en `'es-ES'`, lo que indica que las respuestas de la API deben estar en español.

   Esta configuración asegura que todas las solicitudes HTTP realizadas con esta instancia de `Dio` incluyan automáticamente estas opciones base.

2. **Método `getNowPlaying`**:  
   El método `getNowPlaying` es una función asíncrona que obtiene la lista de películas "en cartelera" desde la API de TMDb. Su funcionamiento es el siguiente:
   - **Solicitud a la API**: Realiza una solicitud `GET` al endpoint `/movie/now_playing`, pasando el parámetro `page` para soportar la paginación.
   - **Parseo de la Respuesta**: La respuesta cruda en formato JSON de la API se convierte en un objeto `MovieDbResponse` utilizando el constructor `fromJson`. Esto asume que `MovieDbResponse` es una clase modelo diseñada para representar la estructura de la respuesta de la API. 
   - **Mapeo a Entidades de Dominio**: El campo `results` de `MovieDbResponse` (que contiene una lista de datos crudos de películas) se mapea a una lista de entidades `Movie` utilizando el método `MovieMapper.movieDBToEntity`. Esto asegura que los datos cumplan con la estructura de la capa de dominio de la aplicación.

3. **Valor de Retorno**:  
   El método devuelve un `Future` que resuelve en una lista de entidades `Movie`. Esto permite que el resto de la aplicación trabaje con datos limpios y específicos del dominio en lugar de respuestas crudas de la API.

## Propósito de la Clase:
La clase `MoviedbDatasources` actúa como la fuente de datos para obtener las películas "en cartelera". Sirve como un puente entre la API externa de TMDb y la capa de dominio de la aplicación al:
- Manejar la lógica de interacción con la API.
- Parsear los datos crudos de la respuesta.
- Mapear los modelos a entidades de dominio.

## Beneficios:
- **Separación de Responsabilidades**: La clase aísla la lógica de interacción con la API, manteniéndola separada de las capas de dominio y presentación.
- **Reutilización**: La instancia de `Dio` y el método `getNowPlaying` pueden reutilizarse para otras llamadas a la API si es necesario.
- **Arquitectura Limpia**: Al convertir los datos crudos de la API en entidades de dominio, la clase asegura que la capa de dominio permanezca desacoplada de la estructura de la API externa.

## Resumen:
`MoviedbDatasources` es una implementación bien estructurada de la interfaz `MovieDatasource`, diseñada para obtener y procesar las películas "en cartelera" desde la API de TMDb, mientras sigue principios de diseño limpio y modularidad.