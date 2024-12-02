<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Vistas en SQL***

- **Las vistas son una forma de representar una consulta guardada como si fuera una tabla virtual en la base de datos. Son útiles para simplificar el acceso a datos complejos y mejorar la legibilidad, ya que permiten definir consultas complejas una vez y luego reutilizarlas como si fueran tablas regulares.**

---

## ***¿Qué son y para qué sirven las vistas?***

- **Una **vista** es una tabla virtual basada en el resultado de una consulta SQL. A diferencia de las tablas tradicionales, una vista no almacena datos; simplemente almacena una consulta y genera los datos en el momento de ser consultada. Las vistas se utilizan para:**

- *Simplificar consultas complejas, encapsulándolas en una "tabla virtual".*
- *Limitar el acceso a ciertas columnas o filas de una tabla para mejorar la seguridad.*
- *Facilitar el acceso a datos a través de una interfaz consistente, independientemente de los cambios en las tablas subyacentes.*
  
- **Funcionamiento a bajo nivel:** *Cuando se consulta una vista, la base de datos ejecuta la consulta almacenada en la vista y devuelve el resultado como si fuera una tabla. Esto significa que el rendimiento depende de la optimización de la consulta subyacente y no de la vista en sí.*

---

### ***Ventajas y desventajas de las vistas***

**Ventajas:**

- **Simplicidad:** *Facilitan el acceso a datos al encapsular consultas complejas.*
- **Seguridad:** *Pueden limitar el acceso a ciertos datos al ocultar columnas o filas específicas.*
- **Consistencia:** *Permiten crear una interfaz estable sobre datos que pueden cambiar en estructura sin impactar las consultas que utilizan la vista.*
- **Reutilización:** *Se pueden reutilizar en múltiples consultas sin escribir la lógica nuevamente.*

**Desventajas:**

- **Rendimiento:** *Las vistas no almacenan datos, por lo que, en consultas de gran tamaño o complejidad, pueden afectar el rendimiento.*
- **Limitaciones de actualización:** *No todas las vistas son actualizables, especialmente aquellas que contienen funciones agregadas, `JOINs` complejos o `GROUP BY`.*
- **Mantenimiento:** *Si la estructura de las tablas subyacentes cambia, es posible que las vistas requieran modificaciones o actualizaciones.*

---

### ***Cómo crear una vista***

- **Para crear una vista en SQL, se utiliza el comando `CREATE VIEW`. El siguiente ejemplo crea una vista llamada `ProductosSimplificados` que muestra productos con `ProductID` mayor que 20, ordenados en orden descendente, y limita los resultados a 100 filas.**

```sql
CREATE VIEW ProductosSimplificados AS
SELECT *
FROM "Products"
WHERE "ProductID" > 20
ORDER BY "ProductID" DESC NULLS LAST
LIMIT 100;
```

```sql
sqlite> CREATE VIEW ProductosSimplificados AS
SELECT *
FROM "Products"
WHERE "ProductID" > 20
ORDER BY "ProductID" DESC NULLS LAST
LIMIT 100;
```

- **Luego, puedes consultar esta vista como si fuera una tabla:**

```sql
SELECT * FROM ProductosSimplificados LIMIT 10;
```

```sql
sqlite> SELECT * FROM ProductosSimplificados LIMIT 10;
```

> [!NOTE]
> *Si se crea una vista con el mismo nombre que una tabla existente (por ejemplo, nombrándola `Products` en lugar de `ProductosSimplificados`), se produce un conflicto. En la mayoría de los motores de bases de datos, las consultas priorizan la vista, por lo que accederías a la vista en lugar de a la tabla con el mismo nombre.*

---

### ***Listar vistas en SQLite***

- **Para listar las vistas en una base de datos de SQLite, utiliza la consulta:**

```sql
SELECT name FROM sqlite_master WHERE type='view';
```

```sql
sqlite> SELECT name FROM sqlite_master WHERE type='view';
ProductosSimplificados
```

- *Este comando devuelve una lista de las vistas creadas en la base de datos actual.*

---

### ***Cómo editar una vista***

- **SQLite no permite modificar una vista directamente con un comando `ALTER VIEW`. Para editar una vista, se debe:**

1. *Eliminar la vista existente con el comando `DROP VIEW`.*
2. *Volver a crear la vista con la definición actualizada usando `CREATE VIEW`.*

---

### ***Borrar una vista***

- **Para eliminar una vista, se utiliza el comando `DROP VIEW`, que borra la vista de la base de datos. Es importante saber qué hace cada palabra en el comando:**

```sql
DROP VIEW IF EXISTS "ProductosSimplificados";
```

```sql
sqlite> DROP VIEW IF EXISTS "ProductosSimplificados";
```

- **DROP VIEW:** *Inicia el comando para borrar la vista.*
- **IF EXISTS:** *Opcional; evita errores si la vista no existe. La base de datos solo ejecutará el `DROP` si la vista está presente.*
- **"ProductosSimplificados":** *Nombre de la vista que deseas eliminar.*
