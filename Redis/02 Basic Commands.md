<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Basic Commands in Redis***

---

## ***1. Documentación oficial y recursos útiles***

- *[Redis Commands Documentation](https://redis.io/docs/latest/commands/ "https://redis.io/docs/latest/commands/")*
- *[Cheat Sheet de Redis](https://redis.io/learn/howtos/quick-start/cheat-sheet "https://redis.io/learn/howtos/quick-start/cheat-sheet")*

---

### ***2. Almacenamiento de cadenas y números***

---

#### ***Ejemplo de variables:***

```bash
name -> 'Yoshi'
color -> 'indigo'
age -> '30'
```

---

### ***3. Establecer valores con `SET`***

> [!TIP]
> *Redis permite almacenar cadenas (strings) como valores. Puedes usar comillas simples (`'`) o dobles (`"`) si tu cadena tiene espacios. Si no tiene espacios, no necesitas comillas.*

**Ejemplos:**

```bash
SET Name 'Mario'
```

```bash
127.0.0.1:6379> SET Name 'Mario'
OK
```

```bash
SET Name2 "Chun Li"
```

```bash
127.0.0.1:6379> SET Name2 "Chun Li"
OK
```

```bash
SET Name3 Batman
```

```bash
127.0.0.1:6379> SET Name3 Batman
OK
```

**En los ejemplos anteriores:**

- *Se ha establecido `Name` con el valor `'Mario'`.*
- *`Name2` contiene `"Chun Li"`.*
- *`Name3` tiene el valor `Batman` (sin necesidad de comillas al no haber espacios).*

---

### ***4. Obtener valores con `GET`***

**El comando `GET` recupera el valor asociado a una clave.**

**Ejemplos:**

```bash
GET Name
```

```bash
127.0.0.1:6379> GET Name
"Mario"
```

```bash
GET Name2
```

```bash
127.0.0.1:6379> GET Name2
"Chun Li"
```

---

### ***5. Eliminar claves con `DEL`***

- **Elimina una clave y su valor asociado.**

**Ejemplo:**

```bash
DEL Name
```

```bash
127.0.0.1:6379> DEL Name
(integer) 1
```

- **Resultado: La clave `Name` ha sido eliminada, y el resultado `(integer) 1` indica que la operación fue exitosa.**

---

### ***6. Establecer múltiples valores con `MSET`***

- **El comando `MSET` permite establecer varias claves y valores en una sola operación.**

**Ejemplo:**

```bash
MSET Name2 Yoshi Color Green Rating 10
```

```bash
127.0.0.1:6379> MSET Name2 Yoshi Color Green Rating 10
OK
```

- **Esto establece las claves:**

- *`Name2` con el valor `Yoshi`.*
- *`Color` con el valor `Green`.*
- *`Rating` con el valor `10`.*

---

### ***7. Obtener múltiples valores con `MGET`***

- *Con `MGET`, puedes recuperar los valores de múltiples claves a la vez.*

**Ejemplo:**

```bash
MGET Name2 Name3 Rating
```

```bash
127.0.0.1:6379> MGET Name2 Name3 Rating
1) "Yoshi"
2) "Batman"
3) "10"
```

**En este caso, se recuperan los valores:**

- *`Name2`: `"Yoshi"`.*
- *`Name3`: `"Batman"`.*
- *`Rating`: `"10"`.*

---

## ***Manipulación de cadenas y números***

---

### ***8. Obtener subcadenas con `GETRANGE`***

*El comando `GETRANGE` te permite extraer una porción (subcadena) del valor almacenado en una clave, proporcionando el índice inicial y el índice final.*

**Ejemplos:**

- *Extraer los primeros 4 caracteres de `Name3` (índices de 0 a 3):*

```bash
GETRANGE Name3 0 3
```

```bash
127.0.0.1:6379> GETRANGE Name3 0 3
"Batm"
```

- *Extraer los últimos 3 caracteres de `Name3`:*

```bash
GETRANGE Name3 -3 -1
```

```bash
127.0.0.1:6379> GETRANGE Name3 -3 -1
"man"
```

---

### ***9. Reemplazar parte de una cadena con `SETRANGE`***

- *El comando `SETRANGE` permite modificar una cadena reemplazando los caracteres a partir de una posición específica (índice `offset`).*

**Ejemplo:**

```bash
SETRANGE Name2 2 Guason
```

```bash
127.0.0.1:6379> SETRANGE Name2 2 Guason
(integer) 8
```

- *Resultado: El valor de `Name2` ha cambiado a `"YoGuason"`, y la longitud total del nuevo valor es `8`.*

---

## ***Comandos numéricos: Incremento y Decremento***

*Redis permite realizar operaciones matemáticas directamente sobre los valores numéricos.*

---

### ***10. Incrementar valores con `INCR`***

*El comando `INCR` incrementa en 1 el valor numérico almacenado en una clave.*

**Ejemplo:**

```bash
INCR Rating
```

```bash
127.0.0.1:6379> INCR Rating
(integer) 11
```

*Resultado: El valor de `Rating` ha sido incrementado a `11`.*

---

### ***11. Decrementar valores con `DECR`***

*`DECR` decrementa en 1 el valor numérico de una clave.*

**Ejemplo:**

```bash
DECR Rating
```

```bash
127.0.0.1:6379> DECR Rating
(integer) 10
```

- *Resultado: El valor de `Rating` ha sido decrementado a `10`.*

---

### ***12. Incrementar por un valor específico con `INCRBY`***

- *`INCRBY` permite incrementar el valor numérico de una clave por un valor específico.*

**Ejemplo:**

```bash
INCRBY Rating 10
```

```bash
127.0.0.1:6379> INCRBY Rating 10
(integer) 20
```

- *Resultado: El valor de `Rating` ha sido incrementado en 10, por lo que ahora es `20`.*

---

### ***13. Decrementar por un valor específico con `DECRBY`***

- *`DECRBY` permite disminuir el valor numérico de una clave por un valor específico.*

**Ejemplo:**

```bash
DECRBY Rating 10
```

```bash
127.0.0.1:6379> DECRBY Rating 10
(integer) 10
```

- *Resultado: El valor de `Rating` ha sido decrementado en 10, y ahora es `10`.*

---

### ***Resumen de comandos numéricos:***

- *`INCR key`: Incrementa el valor en 1.*
- *`DECR key`: Decrementa el valor en 1.*
- *`INCRBY key increment`: Incrementa el valor en el número especificado.*
- *`DECRBY key decrement`: Decrementa el valor en el número especificado.*
