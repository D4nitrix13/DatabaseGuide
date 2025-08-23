<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Hashes***

## ***Estructura***

- *Un hash es una estructura de datos que organiza información en pares clave-valor. A continuación se muestra un ejemplo de cómo podría lucir un hash:*

```bash
{
    title: 'Name of the Wind',
    rating: '9',
    author: 'Daniel Perez'
}
```

### ***Ejemplos de comandos Redis para manejar hashes***

#### ***Insertar campos en un hash***

```bash
127.0.0.1:6379> HSET books:1 title "Name of the Wind"
(integer) 1
```

*Se crea el campo `title` con el valor "Name of the Wind" en el hash `books:1`.*

```bash
127.0.0.1:6379> HSET books:1 author "Batman"
(integer) 1
```

*Se agrega el campo `author` con el valor "Batman" al mismo hash.*

```bash
127.0.0.1:6379> HSET books:1 rating 9
(integer) 1
```

*El campo `rating` se agrega con el valor `9`.*

```bash
127.0.0.1:6379> HSET books:1 rating 10
(integer) 0
```

*Actualizar un valor existente en un campo no aumenta el número de campos, por lo que el resultado es `0`.*

#### ***Crear un hash con varios campos de una vez***

```bash
127.0.0.1:6379> HSET books:2 title "A wise man's fear" author "Robin" rating 8
(integer) 3
```

*Se crean los campos `title`, `author` y `rating` con sus respectivos valores en el hash `books:2`.*

#### ***Obtener el valor de un campo***

```bash
127.0.0.1:6379> HGET books:1 title
"Name of the Wind"
```

*Obtiene el valor del campo `title` del hash `books:1`.*

#### ***Obtener todos los campos y valores***

```bash
127.0.0.1:6379> HGETALL books:2
1) "title"
2) "A wise man's fear"
3) "author"
4) "Robin"
5) "rating"
6) "8"
```

*Devuelve una lista con las claves y valores del hash.*

#### ***Verificar si un campo existe***

```bash
127.0.0.1:6379> HEXISTS books:1 title
(integer) 1
```

*Confirma que el campo `title` existe en `books:1`.*

```bash
127.0.0.1:6379> HEXISTS books:1 Song
(integer) 0
```

*Indica que el campo `Song` no existe en `books:1`.*

#### ***Obtener solo las claves del hash***

```bash
127.0.0.1:6379> HKEYS books:2
1) "title"
2) "author"
3) "rating"
```

*Devuelve todas las claves del hash `books:2`.*

#### ***Eliminar un campo específico***

```bash
127.0.0.1:6379> HDEL books:1 author
(integer) 1
```

*Elimina el campo `author` del hash `books:1`.*

#### ***Eliminar todo el hash***

```bash
127.0.0.1:6379> DEL books:1
(integer) 1
```

*Elimina completamente el hash `books:1`.*

```bash
127.0.0.1:6379> HGETALL books:1
(empty array)
```

*Confirma que el hash ya no existe.*

#### ***Obtener solo los valores***

```bash
127.0.0.1:6379> HVALS books:2
1) "A wise man's fear"
2) "Robin"
3) "8"
```

*Devuelve solo los valores del hash `books:2`.*

---

### ***Documentación oficial***

- *[Para más información sobre comandos relacionados con hashes en Redis, consulta la documentación oficial:](https://redis.io/docs/latest/commands/?group=hash "https://redis.io/docs/latest/commands/?group=hash")*
