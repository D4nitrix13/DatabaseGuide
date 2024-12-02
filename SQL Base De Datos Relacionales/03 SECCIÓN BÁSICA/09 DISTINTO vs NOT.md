<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***DISTINTO vs NOT***

---

## ***¿Qué es?***

- *`NOT` es un operador lógico que se utiliza para invertir el valor booleano de una expresión. Por otro lado, `!=` es un operador de comparación que evalúa si dos valores son diferentes. Los operadores de comparación devuelven valores booleanos (true o false), mientras que los operadores lógicos operan directamente con estos valores booleanos para formar expresiones más complejas.*

- *El uso de `WHERE` en SQL es similar a un bucle que recorre cada registro, comparando el valor de un campo específico con un valor de comparación. Si la comparación resulta en `true`, el registro se muestra en el resultado.*

---

## ***Ejemplos***

### ***Ejemplo 1: Filtrar Clientes que No Son de USA con `NOT`***

```sql
SELECT * FROM "Customers" 
WHERE NOT "Country" = "USA" 
LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE NOT "Country" = "USA" LIMIT 3;
1|Alfreds Futterkiste|Maria Anders|Obere Str. 57|Berlin|12209|Germany
2|Ana Trujillo Emparedados y helados|Ana Trujillo|Avda. de la Constitución 2222|México D.F.|5021|Mexico
3|Antonio Moreno Taquería|Antonio Moreno|Mataderos 2312|México D.F.|5023|Mexico
```

### ***Ejemplo 2: Filtrar Clientes que No Son de USA con `!=`***

```sql
SELECT * FROM "Customers" 
WHERE "Country" != "USA" 
LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE "Country" != "USA" LIMIT 3;
1|Alfreds Futterkiste|Maria Anders|Obere Str. 57|Berlin|12209|Germany
2|Ana Trujillo Emparedados y helados|Ana Trujillo|Avda. de la Constitución 2222|México D.F.|5021|Mexico
3|Antonio Moreno Taquería|Antonio Moreno|Mataderos 2312|México D.F.|5023|Mexico
```

### ***Ejemplo 3: Filtrar Clientes con Condiciones Booleanas***

```sql
SELECT * FROM "Customers" 
WHERE TRUE 
LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE TRUE LIMIT 3;
1|Alfreds Futterkiste|Maria Anders|Obere Str. 57|Berlin|12209|Germany
2|Ana Trujillo Emparedados y helados|Ana Trujillo|Avda. de la Constitución 2222|México D.F.|5021|Mexico
3|Antonio Moreno Taquería|Antonio Moreno|Mataderos 2312|México D.F.|5023|Mexico
```

### ***Ejemplo 4: Filtrar Clientes con FALSE***

```sql
SELECT * FROM "Customers" 
WHERE FALSE 
LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE FALSE LIMIT 3;
```

---

### ***Otros Ejemplos de Uso de `NOT` y `TRUE/FALSE`***

```sql
SELECT * FROM "Customers" WHERE NOT TRUE LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE NOT TRUE LIMIT 3;
```

```sql
SELECT * FROM "Customers" WHERE NOT FALSE LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE NOT FALSE LIMIT 3;
1|Alfreds Futterkiste|Maria Anders|Obere Str. 57|Berlin|12209|Germany
2|Ana Trujillo Emparedados y helados|Ana Trujillo|Avda. de la Constitución 2222|México D.F.|5021|Mexico
3|Antonio Moreno Taquería|Antonio Moreno|Mataderos 2312|México D.F.|5023|Mexico
```

```sql
SELECT * FROM "Customers" WHERE FALSE AND FALSE LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE FALSE AND FALSE LIMIT 3;
```

```sql
SELECT * FROM "Customers" WHERE FALSE AND TRUE LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE FALSE AND TRUE LIMIT 3;
```

```sql
SELECT * FROM "Customers" WHERE TRUE AND TRUE LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE TRUE AND TRUE LIMIT 3;
1|Alfreds Futterkiste|Maria Anders|Obere Str. 57|Berlin|12209|Germany
2|Ana Trujillo Emparedados y helados|Ana Trujillo|Avda. de la Constitución 2222|México D.F.|5021|Mexico
3|Antonio Moreno Taquería|Antonio Moreno|Mataderos 2312|México D.F.|5023|Mexico
```

---

### ***Ejemplo de `OR`***

```sql
SELECT * FROM "Customers" WHERE TRUE OR TRUE LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE TRUE OR TRUE LIMIT 3;
1|Alfreds Futterkiste|Maria Anders|Obere Str. 57|Berlin|12209|Germany
2|Ana Trujillo Emparedados y helados|Ana Trujillo|Avda. de la Constitución 2222|México D.F.|5021|Mexico
3|Antonio Moreno Taquería|Antonio Moreno|Mataderos 2312|México D.F.|5023|Mexico
```

---

### ***Conclusión***

- *`!=` y `NOT` son diferentes, aunque pueden producir resultados similares en ciertas condiciones. Es como decir que 2 + 2 y 2 * 2 son lo mismo, ya que ambos dan 4, pero la suma y la multiplicación funcionan de manera diferente internamente.*

*![Imagen de WHERE](Images/WhereImage.png "Images/WhereImage.png")*
*![Imagen de Distinto y NOT](Images/NotDistinto.png "Images/NotDistinto.png")*
