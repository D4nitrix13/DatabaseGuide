<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Command Options***

---

## ***1. Comando `SET`***

**Uso:** `SET <key> <value> [EX <seconds>] [PX <milliseconds>] [NX|XX]`

- **Descripción:** *Este comando se utiliza para establecer el valor de una clave en Redis. También puede incluir opciones para controlar el tiempo de expiración y condiciones para la operación.*

- **Opciones:**
  - **`EX <seconds>`:** *Establece un tiempo de expiración para la clave en segundos. Por ejemplo, `EX 10` significa que la clave expirará después de 10 segundos.*
  - **`PX <milliseconds>`:** *Similar a `EX`, pero el tiempo de expiración se establece en milisegundos.*
  - **`NX`:** *Establece la clave solo si no existe. Si la clave ya existe, no se establece y devuelve `(nil)`.*
  - **`XX`:** *Establece la clave solo si ya existe. Si la clave no existe, no se establece y devuelve `(nil)`.*

**Ejemplo:**

```bash
SET Name Yoshi EX 10
```

```bash
127.0.0.1:6379> SET Name Yoshi EX 10
OK
```

- *Establece la clave `"Name"` con el valor `"Yoshi"` y le da un tiempo de expiración de 10 segundos.*

---

### ***2. Comando `TTL`***

**Uso:** `TTL <key>`

- **Descripción:** *Este comando devuelve el tiempo restante (en segundos) para la clave especificada antes de que expire.*

- **Respuesta:**
  - **Número positivo:** *Cantidad de segundos restantes.*
  - **`-1`:** *Indica que la clave existe pero no tiene un tiempo de expiración.*
  - **`-2`:** *Indica que la clave no existe.*

**Ejemplo:**

```bash
TTL Name
```

```bash
127.0.0.1:6379> TTL Name
(integer) 1
```

```bash
127.0.0.1:6379> TTL Name
(integer) -2
```

- *Si devuelve `(integer) 1`, significa que quedan 1 segundo antes de que `"Name"` expire.*

---

### ***3. Comando `GET`***

**Uso:** `GET <key>`

- **Descripción:** *Este comando se utiliza para recuperar el valor de una clave. Si la clave no existe, devuelve `(nil)`.*

**Ejemplo:**

```bash
GET Name
```

```bash
127.0.0.1:6379> GET Name
(nil)
```

- *Si `"Name"` ha expirado o ha sido eliminada, devolverá `(nil)`.*

---

### ***4. Comando `DEL`***

**Uso:** *`DEL <key>`*

- **Descripción:** *Este comando se utiliza para eliminar una o más claves. Devuelve el número de claves eliminadas.*

**Ejemplo:**

```bash
DEL Name
```

```bash
127.0.0.1:6379> DEL Name
(integer) 1
```

- *Si `"Name"` se elimina correctamente, devuelve `(integer) 1`.*

---

### ***5. Ejemplo de Comandos Adicionales***

- **`SET Name Yoshi NX`**

    ```bash
    SET Name Yoshi NX
    ```

    ```bash
    127.0.0.1:6379> SET Name Yoshi NX
    OK
    ```

  - *Establece `"Name"` a `"Yoshi"` solo si no existe. Si `"Name"` ya existe, devuelve `(nil)` y si no existe devuelve `OK`.*

- **`SET Name Yoshi NX`**

    ```bash
    SET Name Yoshi NX
    ```

    ```bash
    127.0.0.1:6379> SET Name Yoshi NX
    (nil)
    ```

  - *Es un intento adicional de establecer `"Name"` a `"Yoshi"` bajo la misma condición. También devolverá `(nil)` si la clave ya existe.*

- **`SET Name Yoshi XX`**

    ```bash
    SET Name Yoshi XX
    ```

    ```bash
    127.0.0.1:6379> SET Name Yoshi XX
    OK
    ```

  - *Intenta establecer `"Name"` a `"Yoshi"` solo si ya existe. Si no existe, devuelve `(nil)` y si existe devuelve `OK`.*

- **`SET Name Peach GET`**

  ```bash
  SET Name Peach GET
  (nil)
  ```
  
  ```bash
  127.0.0.1:6379> SET Name Peach GET
  (nil)
  ```

  - *Este comando intenta establecer la clave "Name" con el valor "Peach", pero incluye la opción GET, lo que indica que Redis debe retornar el valor actual de la clave "Name" antes de sobreescribirlo.*
  - *Resultado: Si la clave "Name" ya tiene un valor (por ejemplo, "Yoshi"), el comando devolverá ese valor anterior ("Yoshi"), y luego actualizará "Name" a "Peach". Si la clave no existe, simplemente la establece a "Peach" y devuelve (nil).*

- **`SET Name Toad GET`**

  ```bash
  SET Name Toad GET
  "Peach"
  ```
  
  ```bash
  127.0.0.1:6379> SET Name Toad GET
  "Peach"
  ```

  - *Aquí, `"GET"` está especificando que se debe recuperar el valor actual de `"Name"` antes de establecerlo a `"Toad"`. En este caso, devolverá `"Peach"` si `"Peach"` es el valor previamente establecido.*

---

### ***Resumen de Comandos Usados***

- **`SET`:** *Establece el valor de una clave.*
- **`TTL`:** *Devuelve el tiempo restante antes de que una clave expire.*
- **`GET`:** *Recupera el valor de una clave.*
- **`DEL`:** *Elimina una clave.*

---

### ***Conclusión***

- *Cada uno de estos comandos permite una manipulación precisa de los datos almacenados en Redis. Comprender cómo utilizar estas opciones es fundamental para gestionar eficazmente la información en una base de datos en memoria como Redis.*
