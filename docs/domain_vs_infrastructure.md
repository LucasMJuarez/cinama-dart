# Explicación de la Capa de Dominio y la Capa de Infraestructura

En una arquitectura limpia, como la que se utiliza en este proyecto, las capas de dominio e infraestructura tienen roles bien definidos que ayudan a mantener el código modular, escalable y fácil de mantener. A continuación, se explica cada una de estas capas:

## Capa de Dominio

La **capa de dominio** es el núcleo de la aplicación y contiene la lógica de negocio y las reglas fundamentales del sistema. Es completamente independiente de cualquier detalle de implementación, como frameworks, bases de datos o APIs externas. Esto asegura que los cambios en las tecnologías subyacentes no afecten la lógica central de la aplicación.

### Componentes principales de la capa de dominio:
1. **Entidades**:  
   Representan los objetos principales del dominio con sus atributos y comportamientos. Por ejemplo, en este caso, la entidad `Movie` define la estructura y las propiedades de una película en el contexto de la aplicación.

2. **Interfaces (Contratos) Repository**:  
   La capa de dominio define interfaces como `MoviesRepository`, que actúan como contratos para las operaciones que deben ser implementadas por otras capas. Estas interfaces aseguran que la lógica de dominio no dependa de implementaciones específicas.

3. **Casos de Uso (Opcional)**:  
   Los casos de uso encapsulan la lógica de negocio específica de la aplicación. Por ejemplo, un caso de uso podría ser "Obtener las películas en cartelera", que utiliza el repositorio para acceder a los datos necesarios.

### Propósito:
- Mantener la lógica de negocio independiente de los detalles técnicos.
- Facilitar la reutilización y la prueba de la lógica central de la aplicación.

---

## Capa de Infraestructura

La **capa de infraestructura** se encarga de implementar los detalles técnicos necesarios para que la aplicación funcione. Esta capa interactúa con APIs externas, bases de datos, frameworks y cualquier otra tecnología específica.

### Componentes principales de la capa de infraestructura:
1. **Fuentes de Datos (Datasources)**:  
   Implementan las interfaces definidas en la capa de dominio para interactuar con fuentes de datos externas. Por ejemplo, `MoviedbDatasources` es una implementación que utiliza la API de TMDb para obtener datos de películas.

2. **Repositorios**:  
   Los repositorios, como `MovieRepositoryImpl`, actúan como intermediarios entre la capa de dominio y las fuentes de datos. Implementan las interfaces definidas en la capa de dominio (`MoviesRepository`) y delegan las tareas de obtención de datos a las fuentes de datos.

3. **Mappers**:  
   Los mappers convierten los datos crudos obtenidos de las fuentes de datos (por ejemplo, respuestas JSON de una API) en entidades que puedan ser utilizadas por la capa de dominio. Esto asegura que la lógica de dominio trabaje con datos limpios y consistentes.

### Propósito:
- Implementar los detalles técnicos necesarios para cumplir con los contratos definidos en la capa de dominio.
- Asegurar que los cambios en las tecnologías subyacentes no afecten la lógica de negocio.

---

## Relación entre las Capas

- La **capa de dominio** define qué necesita la aplicación (interfaces y lógica de negocio).
- La **capa de infraestructura** implementa cómo se obtienen esos datos o cómo se ejecutan las operaciones necesarias.

Por ejemplo:
1. La capa de dominio define la interfaz `MoviesRepository` con el método `getNowPlaying`.
2. La capa de infraestructura implementa esta interfaz en `MovieRepositoryImpl`, que utiliza `MoviedbDatasources` para obtener los datos desde la API de TMDb.

---

## Beneficios de esta Separación

1. **Independencia Tecnológica**:  
   La lógica de negocio no depende de detalles técnicos como APIs o bases de datos.

2. **Modularidad**:  
   Cada capa tiene una responsabilidad clara, lo que facilita el mantenimiento y la escalabilidad.

3. **Facilidad de Pruebas**:  
   La capa de dominio puede ser probada de manera aislada utilizando implementaciones simuladas de los repositorios.

4. **Flexibilidad**:  
   Cambiar la fuente de datos (por ejemplo, de una API a una base de datos local) no afecta la lógica de negocio.

En resumen, la capa de dominio define el "qué" de la aplicación, mientras que la capa de infraestructura se encarga del "cómo". Esta separación asegura un diseño limpio, flexible y fácil de mantener.