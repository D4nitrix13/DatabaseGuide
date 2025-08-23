<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Creación de Tablas***

> [!WARNING]
> *La creación de tablas en SQLite3 es una parte fundamental para estructurar la base de datos. SQLite3 es un sistema de gestión de bases de datos dinámico, lo que significa que los tipos de datos y valores que insertes se adaptarán automáticamente según lo que introduzcas.*

- **Sin embargo, es importante seguir buenas prácticas al definir las tablas. A continuación, un ejemplo de cómo crear una tabla de usuarios:**

```sql
CREATE TABLE "usuarios" (
    "name" TEXT DEFAULT "Batman",  -- Nombre del usuario, con valor por defecto "Batman"
    "apellido" TEXT,                -- Apellido del usuario, campo opcional
    "age" INTEGER                   -- Edad del usuario, almacenada como número entero
);
```

---

## ***Consideraciones***

- **Valores por defecto:** *Establecer un valor por defecto (como "Batman" para el campo `name`) puede ser útil, pero asegúrate de que este valor tenga sentido para tu aplicación.*
- **Tipos de datos:** *Utiliza el tipo de dato adecuado para cada campo (por ejemplo, `TEXT` para cadenas de texto y `INTEGER` para números).*
- **Flexibilidad:** *Aunque SQLite3 permite insertar datos de diferentes tipos sin un esquema rígido, es recomendable definir claramente los tipos de datos para mantener la integridad y facilitar el manejo de la información.*
