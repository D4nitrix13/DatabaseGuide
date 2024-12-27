<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Lists en Redis***

- **Descripción:** *Las listas en Redis son un tipo de dato que permiten almacenar secuencias de elementos en un orden específico. Pueden contener elementos duplicados, lo que significa que puedes tener el mismo valor varias veces. Por ejemplo, una lista llamada `Name` podría contener `{'Yoshi', 'Mario', 'Peach', 'Mario'}`, donde `Mario` aparece dos veces.*

## ***Comandos para trabajar con listas***

1. **`FLUSHALL`**
   - *Este comando elimina todas las claves de todas las bases de datos en Redis. Es útil para limpiar el servidor Redis por completo.*

   ```bash
   FLUSHALL
   ```

   ```bash
   127.0.0.1:6379> FLUSHALL
   OK
   ```

2. **`LPUSH`**
   - *Este comando se utiliza para añadir uno o más elementos al inicio de una lista. Al hacerlo, los nuevos elementos se convierten en el nuevo "cabeza" de la lista.*
   - **Ejemplo:**

   ```bash
   LPUSH Orders Ryu
   ```

   ```bash
   127.0.0.1:6379> LPUSH Orders Ryu
   (integer) 1
   ```

   - **Desglose:**
     - **`Orders`:** *La clave de la lista a la que se está añadiendo el elemento.*
     - **`Ryu`:** *El valor que se está añadiendo a la lista. En este caso, `Ryu` se convierte en el primer elemento de la lista.*
     - **Resultado `(integer) 1`:** *Indica que ahora hay 1 elemento en la lista `Orders`.*

3. **`LPUSH` (múltiples elementos)**
   - *Puedes añadir varios elementos a la vez usando este comando.*
   - **Ejemplo:**

   ```bash
   LPUSH Orders Chun-Li
   ```

   ```bash
   127.0.0.1:6379> LPUSH Orders Chun-Li
   (integer) 2
   ```

   - **Resultado `(integer) 2`:** *Ahora hay 2 elementos en la lista, `Chun-Li` es el nuevo primer elemento.*

4. **`RPUSH`**
   - *Este comando añade uno o más elementos al final de la lista.*
   - **Ejemplo:**

   ```bash
   RPUSH Orders Blanka Ken
   ```

   ```bash
   127.0.0.1:6379> RPUSH Orders Blanka Ken
   (integer) 4
   ```

   - **Desglose:**
     - **`Orders`:** *La clave de la lista.*
     - **`Blanka` y `Ken`:** *Los valores que se están añadiendo al final de la lista.*
     - **Resultado `(integer) 4`:** *Indica que ahora hay 4 elementos en la lista.*

5. **`LPOP`**
   - *Este comando elimina y devuelve el primer elemento de la lista.*
   - **Ejemplo:**

   ```bash
   LPOP Orders
   ```

   ```bash
   127.0.0.1:6379> LPOP Orders
   1) "Balrog"
   ```

   - **Resultado:** *`"Balrog"` es el primer elemento que se eliminó y devolvió de la lista.*

6. **`RPOP`**
   - *Este comando elimina y devuelve el último elemento de la lista.*
   - **Ejemplo:**

   ```bash
   RPOP Orders 2
   ```

   ```bash
   127.0.0.1:6379> RPOP Orders 2
   1) "Ken"
   2) "Blanka"
   ```

   - **Desglose:**
     - **`Orders`:** *La clave de la lista de la que se están eliminando los elementos.*
     - **Resultado:** *El comando devuelve y elimina los dos últimos elementos, `Ken` y `Blanka`.*

7. **`LLEN`**
   - *Este comando devuelve la longitud de la lista, es decir, cuántos elementos contiene.*
   - **Ejemplo:**

   ```bash
   LLEN Orders
   ```

   ```bash
   127.0.0.1:6379> LLEN Orders
   (integer) 3
   ```

   - **Resultado:** *Indica que hay 3 elementos en la lista `Orders`.*

8. **`LRANGE`**
   - *Este comando se usa para obtener un rango específico de elementos de la lista.*
   - **Ejemplo:**

   ```bash
   LRANGE Orders 0 1
   ```

   ```bash
   127.0.0.1:6379> LRANGE Orders 0 1
   1) "Sagat"
   2) "Chun-Li"
   ```

   - **Desglose:**
     - **`Orders`:** *La clave de la lista.*
     - **`0`:** *Índice inicial, que indica el primer elemento.*
     - **`1`:** *Índice final, que indica que queremos los elementos en las posiciones 0 y 1.*
     - **Resultado:** *Devuelve los elementos desde el índice 0 hasta el 1, es decir, `Sagat` y `Chun-Li`.*

9. **`LRANGE` (con más elementos)**
   - **Ejemplo:**

   ```bash
   LRANGE Orders 0 2
   ```

   ```bash
   127.0.0.1:6379> LRANGE Orders 0 2
   1) "Sagat"
   2) "Chun-Li"
   3) "Ryu"
   ```

   - **Resultado:** *Devuelve los elementos desde el índice 0 hasta el 2, mostrando todos los elementos actuales en la lista.*

10. **`LRANGE` (índices negativos)**

    - **Ejemplo:**

    ```bash
    LRANGE Orders -2 -1
    ```

    ```bash
    127.0.0.1:6379> LRANGE Orders -2 -1
    1) "Chun-Li"
    2) "Ryu"
    ```

    - **Desglose:**
      - **`-2`:** *Indica el segundo elemento desde el final de la lista.*
      - **`-1`:** *Indica el último elemento de la lista.*
      - **Resultado:** *Devuelve los últimos dos elementos de la lista.*

11. **`LINDEX`**
    - *Este comando se utiliza para obtener un elemento en un índice específico.*
    - **Ejemplo:**

    ```bash
    LINDEX Orders 1
    ```

    ```bash
    127.0.0.1:6379> LINDEX Orders 1
    "Chun-Li"
    ```

    - **Desglose:**
      - **`Orders`:** *La clave de la lista.*
      - **`1`:** *El índice del elemento que se desea obtener.*
      - **Resultado:** *Devuelve el elemento en la posición 1, que es `"Chun-Li"`.*

12. **`LPOS`**
    - *Este comando devuelve la primera posición de un elemento específico en la lista.*
    - **Ejemplo:**

    ```bash
    LPOS Orders Ryu
    ```

    ```bash
    127.0.0.1:6379> LPOS Orders Ryu
    (integer) 2
    ```

    - **Desglose:**
      - **`Orders`:** *La clave de la lista.*
      - **`Ryu`:** *El valor que se busca en la lista.*
      - **Resultado `(integer) 2`:** *Indica que `Ryu` se encuentra en el índice 2 de la lista.*

13. **`LREM`**
    - *Este comando se utiliza para eliminar elementos de la lista.*
    - **Ejemplo:**

    ```bash
    LREM Orders 1 "Chun-Li"
    ```

    ```bash
    127.0.0.1:6379> LREM Orders 1 "Chun-Li"
    (integer) 1
    ```

    - **Desglose:**
      - **`Orders`:** *La clave de la lista de la cual se eliminarán elementos.*
      - **`1`:** *El número de ocurrencias del elemento a eliminar. Si fuera `2`, eliminaría hasta dos ocurrencias de `Chun-Li`.*
      - **`"Chun-Li"`:** *El valor específico que se desea eliminar.*
      - **Resultado `(integer) 1`:** *Indica que se eliminó 1 ocurrencia de `Chun-Li`.*

14. **Comprobar el resultado de la lista tras la eliminación**

   ```bash
   LRANGE Orders 0 -1
   ```

   ```bash
   127.0.0.1:6379> LRANGE Orders 0 -1
   1) "Sagat"
   2) "Ryu"
   ```

- **Resultado:** *Muestra la lista actualizada, confirmando que `Chun-Li` ha sido eliminado.*

---

### ***Conclusión***

- *Con estos comandos y su explicación detallada, puedes gestionar listas en Redis de manera efectiva, entendiendo cómo añadir, eliminar y acceder a los elementos almacenados en ellas.*
