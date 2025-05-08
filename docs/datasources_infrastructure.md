# Explicación del Código

El archivo define una implementación concreta de la clase abstracta `MovieDatasource`, llamada `MoviedbDatasources`. Esta clase forma parte de un proyecto en Dart y está diseñada para interactuar con una fuente de datos, como la API de The Movie Database (TMDb), para obtener información relacionada con películas.

## Componentes clave:

1. **Definición de la clase**:  
   La clase `MoviedbDatasources` extiende la clase abstracta `MovieDatasource`. Esto significa que hereda el contrato definido por `MovieDatasource` y debe proporcionar implementaciones concretas para todos sus métodos abstractos. En este caso, se implementa el método `getNowPlaying`.

2. **Implementación del método `getNowPlaying`**:  
   - El método `getNowPlaying` se sobrescribe utilizando la anotación `@override`, lo que asegura que el método coincida con la firma definida en la clase abstracta.
   - El método es asíncrono (`async`) y devuelve un `Future` que resuelve a una `List<Movie>`. Esto está alineado con el contrato definido en la clase `MovieDatasource`.
   - Actualmente, el método devuelve una lista vacía (`[]`). Esto es una implementación temporal, como lo indica el comentario `TODO`. La implementación real aún no se ha escrito y probablemente implicará realizar una llamada a una API para obtener las películas "en cartelera".

3. **UnimplementedError**:  
   La línea comentada `throw UnimplementedError();` es un marcador común en Dart para indicar que un método aún no ha sido implementado. Sin embargo, en este caso, el método devuelve una lista vacía, lo que evita errores en tiempo de ejecución, pero no proporciona la funcionalidad deseada.

## Propósito de la clase:
La clase `MoviedbDatasources` probablemente está diseñada para actuar como un puente entre la aplicación y una fuente de datos externa, como la API de TMDb. Al implementar la interfaz `MovieDatasource`, asegura que la aplicación pueda obtener las películas "en cartelera" de manera consistente, independientemente de la fuente de datos subyacente.

## Próximos pasos:
Para completar la implementación, se deben realizar las siguientes acciones:
1. Reemplazar el valor de retorno temporal (`[]`) con la lógica necesaria para obtener datos de la fuente deseada, como realizar una solicitud HTTP a una API.
2. Analizar la respuesta y convertirla en una lista de objetos `Movie`, asegurándose de que los datos coincidan con la estructura definida en la entidad `Movie`.

## Resumen:
Este enfoque sigue los principios de la **Arquitectura Limpia (Clean Architecture)** al separar la lógica de obtención de datos (capa de infraestructura) de la capa de dominio, lo que hace que la base de código sea más modular y fácil de probar.