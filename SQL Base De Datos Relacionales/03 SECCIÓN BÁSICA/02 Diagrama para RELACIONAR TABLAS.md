<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Diagrama para Relacionar Tablas***

- *Un **diagrama de relación de tablas** (también conocido como Diagrama de Entidad-Relación o ERD) es una representación visual que muestra cómo están relacionadas las diferentes tablas de una base de datos. Estos diagramas son esenciales para comprender la estructura de una base de datos y cómo las entidades (tablas) interactúan entre sí mediante claves primarias y foráneas.*

---

# ***Componentes Claves del Diagrama:***

1. **Entidades (Tablas):**
   - *Representan las tablas de la base de datos, que suelen estar descritas en recuadros.*
   - *Cada entidad contiene un conjunto de atributos (columnas) que representan la información almacenada.*

2. **Relaciones:**
   - *Las líneas que conectan las tablas indican cómo están relacionadas. Estas líneas pueden representar relaciones de uno a uno, uno a muchos, o muchos a muchos.*

3. **Claves Primarias (PK):**
   - *Las claves primarias son resaltadas en las tablas como el identificador único de cada entidad.*

4. **Claves Foráneas (FK):**
   - *Las claves foráneas son los campos que crean las relaciones entre tablas al referenciar claves primarias de otras tablas.*

---

## ***Ejemplo de un Diagrama de Relación de Tablas:***

![Image DiagramRelationTables](/Images/DiagramRelationTables.png "/Images/DiagramRelationTables.png")

**En este ejemplo, puedes observar:**

- **Usuarios:** *La tabla `usuarios` contiene la clave primaria `id`.*
- **Turnos Médicos:** *La tabla `turnos_medicos` contiene la clave foránea `usuario_id`, que se relaciona con la clave primaria `id` de la tabla `usuarios`.*

*Este diagrama muestra una relación de "uno a muchos", donde un usuario puede tener múltiples turnos médicos, pero cada turno está asociado con un único usuario.*
