# ***Cláusula SELECT***

---

## ***Uso de la Cláusula `SELECT`***

- **La cláusula `SELECT` se utiliza para recuperar datos de una o más tablas en una base de datos. Puedes especificar las columnas que deseas obtener, así como aplicar filtros y condiciones.**

---

### ***Ejemplo de Selección de una Columna***

- **Para seleccionar solo la columna `name` de la tabla `usuarios`, utiliza el siguiente comando:**

```sql
SELECT name FROM usuarios;
```

```sql
sqlite> SELECT name FROM usuarios;
```

**Ejemplo de resultado:**

```bash
Danna
Daniel
Luna
Coby
```

---

#### ***Ejemplo de Selección de Múltiples Columnas***

**Si deseas obtener varias columnas, como `name` y `age`, puedes hacer lo siguiente:**

```sql
SELECT name, age FROM usuarios;
```

```sql
sqlite> SELECT name, age FROM usuarios;
```

**Ejemplo de resultado:**

```bash
Danna|21
Daniel|18
Luna|16
Coby|17
```

---

### ***Consideraciones Adicionales***

- **Seleccionar Todas las Columnas:** *Si quieres recuperar todos los registros de la tabla, usa el asterisco `*`:*

```sql
SELECT * FROM usuarios;
```

```sql
sqlite> SELECT * FROM usuarios;
```
