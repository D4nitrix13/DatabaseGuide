<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Primera Consulta `SELECT`***

---

## ***¿Qué es un Query?***

- *Un `query` (o consulta) es una solicitud que se hace a la base de datos para obtener información específica. Las consultas se expresan mediante sentencias SQL (Structured Query Language) y son fundamentales para interactuar con las bases de datos.*

---

### ***Tipos de Consultas***

- **Consulta de selección (`SELECT`):** *Recupera datos de una o más tablas.*
- **Consulta de modificación:** *Como `INSERT`, `UPDATE` y `DELETE`, que permiten agregar, modificar o eliminar datos.*

---

## ***Sentencia `SELECT`***

- *La sentencia `SELECT` es una de las más comunes en SQL. Se utiliza para extraer datos de una o más tablas de la base de datos.*

---

### ***Ejemplo de Consulta***

```sql
SELECT * FROM usuarios;
```

```sql
sqlite> SELECT * FROM usuarios;
```

---

### ***Desglose del Ejemplo***

- **`SELECT`:** *Indica que deseas seleccionar datos de la base de datos.*
- **`*`:** *Un comodín que significa "todas las columnas". Indica que se deben recuperar todas las columnas de la tabla.*
- **`FROM usuarios`:** *Especifica de qué tabla se deben obtener los datos, en este caso, la tabla `usuarios`.*

---

### ***¿Qué significa?***

- *Esta consulta recupera y muestra todos los registros (filas) de la tabla `usuarios`, incluyendo todas las columnas definidas en la tabla. Es útil para obtener una visión completa de los datos almacenados.*
