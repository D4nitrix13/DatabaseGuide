<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Sets en Redis***

- *Los `sets` son un tipo de dato en Redis que almacenan colecciones desordenadas de elementos únicos. En un `set`, no se permiten valores duplicados, es decir, cada miembro del conjunto debe ser único.*

---

## ***Comandos relacionados con el vaciado de bases de datos en Redis***

1. **`FLUSHALL`**  
   - *Este comando elimina **todas las claves de todas las bases de datos** en Redis, lo que incluye cualquier tipo de dato, como *sets*, *listas*, *hashes*, y más. Es útil cuando deseas limpiar completamente tu servidor Redis y eliminar todos los datos almacenados.*

   ```bash
   FLUSHALL
   ```

   ```bash
   127.0.0.1:6379> FLUSHALL
   OK
   ```

2. **`FLUSHALL ASYNC`**  
   - *Este comando funciona de manera similar a `FLUSHALL`, pero realiza la operación de manera **asíncrona**. Esto significa que Redis no se bloqueará mientras se eliminan las claves en segundo plano. Al igual que `FLUSHALL`, elimina todas las claves de todas las bases de datos y, por ende, todos los tipos de datos almacenados.*

   ```bash
   FLUSHALL ASYNC
   ```

3. **`FLUSHDB`**  
   - *Este comando elimina todas las claves de **la base de datos actual** en la que estás trabajando. Al igual que los comandos anteriores, `FLUSHDB` también elimina cualquier tipo de dato que exista en la base de datos seleccionada, incluyendo *sets*, *listas*, *hashes*, y otros tipos de datos, sin afectar a las otras bases de datos de Redis.*

   ```bash
   FLUSHDB
   ```

---

### ***Ejemplo de uso de FLUSHDB***

```bash
127.0.0.1:6379> FLUSHDB
OK
```

---

### ***Precauciones***

- **Destructivos:** *Todos estos comandos son destructivos y no se pueden deshacer, así que asegúrate de que realmente deseas eliminar todos los datos antes de ejecutarlos.*
- **Impacto:** *Ten en cuenta que una vez ejecutados, no podrás recuperar los datos eliminados, por lo que se recomienda hacer copias de seguridad si es necesario.*

---

### ***Ejemplos de uso de *sets* en Redis***

- **A continuación, se muestran ejemplos de cómo interactuar con *sets* en Redis:**

1. **Añadir miembros a un set**

   ```bash
   SADD Names Mario
   ```

   ```bash
   127.0.0.1:6379> SADD Names Mario
   (integer) 1
   ```

   - *Aquí hemos añadido el miembro `"Mario"` al conjunto `Names`.*

2. **Añadir múltiples miembros a un set**

   ```bash
   SADD Names Yoshi Peach
   ```

   ```bash
   127.0.0.1:6379> SADD Names Yoshi Peach
   (integer) 2
   ```

   - *Este comando añade los miembros `"Yoshi"` y `"Peach"` al conjunto `Names`. El resultado `(integer) 2` indica que ambos elementos se añadieron correctamente.*

3. **Eliminar un miembro de un set**

   ```bash
   SREM Names Yoshi
   ```

   ```bash
   127.0.0.1:6379> SREM Names Yoshi
   (integer) 1
   ```

   - *Aquí se elimina `"Yoshi"` del set `Names`. El resultado `(integer) 1` indica que un miembro fue eliminado.*

4. **Crear otro set y realizar operaciones entre sets**

   ```bash
   SADD MoreNames Link Zelda
   ```

   ```bash
   127.0.0.1:6379> SADD MoreNames Link Zelda
   (integer) 2
   ```

   - *Ahora hemos creado un nuevo conjunto llamado `MoreNames` con los miembros `"Link"` y `"Zelda"`.*

5. **Unión de conjuntos (SUNION)**

   ```bash
   SUNION Names MoreNames
   ```

   ```bash
   127.0.0.1:6379> SUNION Names MoreNames
   1) "Mario"
   2) "Peach"
   3) "Link"
   4) "Zelda"
   ```

   - *El comando `SUNION` permite combinar los miembros de los conjuntos `Names` y `MoreNames`, devolviendo todos los elementos de ambos conjuntos.*

6. **Comprobar si un miembro pertenece a un set (SISMEMBER)**

   ```bash
   SISMEMBER Names Link
   ```

   ```bash
   127.0.0.1:6379> SISMEMBER Names Link
   (integer) 0
   ```

   - *El comando `SISMEMBER` verifica si `"Link"` pertenece al set `Names`. Como el resultado es `(integer) 0`, significa que `"Link"` no es miembro de `Names`.*

   ```bash
   SISMEMBER MoreNames Link
   ```

   ```bash
   127.0.0.1:6379> SISMEMBER MoreNames Link
   (integer) 1
   ```

   - *Aquí comprobamos que `"Link"` sí pertenece al set `MoreNames`, ya que el resultado es `(integer) 1`.*

7. **Obtener el número de miembros en un set (SCARD)**

   ```bash
   SCARD Names
   ```

   ```bash
   127.0.0.1:6379> SCARD Names
   (integer) 2
   ```

   - *El comando `SCARD` devuelve la cantidad de miembros en el conjunto `Names`, que en este caso es 2.*

8. **Listar todos los miembros de un set (SMEMBERS)**

   ```bash
   SMEMBERS Names
   ```

   ```bash
   127.0.0.1:6379> SMEMBERS Names
   1) "Mario"
   2) "Peach"
   ```

   - *El comando `SMEMBERS` devuelve todos los miembros del conjunto `Names`. En este caso, los miembros son `"Mario"` y `"Peach"`.*

9. **Intentar añadir un miembro existente al set**

   ```bash
   SADD Names Mario
   ```

   ```bash
   127.0.0.1:6379> SADD Names Mario
   (integer) 0
   ```

   - *Aquí intentamos añadir `"Mario"` nuevamente al conjunto `Names`, pero como los *sets* no permiten duplicados, el resultado `(integer) 0` indica que no se añadió nada.*

   - *Al listar nuevamente los miembros del conjunto `Names`, veremos que no ha cambiado:*

   ```bash
   SMEMBERS Names
   ```

   ```bash
   127.0.0.1:6379> SMEMBERS Names
   1) "Mario"
   2) "Peach"
   ```

*![Set en Redis](/Images/SetRedis.png "/Images/SetRedis.png")*

- *[Documentación de comandos de Redis](https://redis.io/docs/latest/commands/?group=set "https://redis.io/docs/latest/commands/?group=set")*
