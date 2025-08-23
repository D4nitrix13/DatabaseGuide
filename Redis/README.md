<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***[Info](https://www.ibm.com/mx-es/topics/redis "https://www.ibm.com/mx-es/topics/redis")***

---

## ***Introducción a Redis con Docker***

---

### ***Creación de un directorio para el contenedor***

- **Primero, crea un directorio donde almacenarás los datos de Redis:**

```bash
mkdir ~/Escritorio/ServerRedis
cd !$
```

---

### ***Ejecución del contenedor con diferentes permisos***

---

#### ***1. Contenedor con permisos de root***

- *Este contenedor se ejecuta con permisos de root, lo que puede ser útil para fines de aprendizaje, pero no es recomendado para entornos de producción.*

```bash
docker run --interactive --tty \
  --attach STDIN --attach STDERR --attach STDOUT \
  --stop-signal SIGTERM --stop-timeout 10 \
  --publish 6379:6379 --expose 6379 \
  --user root --privileged \
  --workdir /App \
  --mount type=bind,source="$(pwd)",destination=/App \
  --env REDIS_PASSWORD=root \
  --name server-redis-practicas \
  redis redis-server --bind 127.0.0.1 --port 6379 --requirepass root
```

---

#### ***2. Contenedor con usuario limitado (redis)***

- *Ejecutar el contenedor con el usuario `redis` proporciona un nivel de seguridad más alto, ya que limita los permisos del contenedor.*

```bash
docker run -it -p 6379:6379 \
  -a STDIN -a STDERR -a STDOUT \
  --stop-signal SIGTERM --stop-timeout 10 \
  -e REDIS_PASSWORD=root \
  --user redis --expose 6379 \
  --name server-redis-practicas \
  redis redis-server --bind 127.0.0.1 --port 6379 --requirepass root
```

---

### ***Salida del contenedor***

- **Al iniciar el contenedor, podrías ver una salida similar a la siguiente, indicando que Redis está funcionando correctamente:**

```bash
docker run -itp6379:6379 -aSTDIN -aSTDERR -aSTDOUT --stop-signal SIGTERM --stop-timeout 10 -eREDIS_PASSWORD=root --user redis --expose 6379 --name server-redis-practicas redis redis-server --bind 127.0.0.1 --port 6379 --requirepass root
1:C 22 Sep 2024 18:23:16.369 # WARNING Memory overcommit must be enabled! Without it, a background save or replication may fail under low memory condition. Being disabled, it can also cause failures without low memory condition, see https://github.com/jemalloc/jemalloc/issues/1328. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
1:C 22 Sep 2024 18:23:16.370 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 22 Sep 2024 18:23:16.370 * Redis version=7.4.0, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 22 Sep 2024 18:23:16.370 * Configuration loaded
1:M 22 Sep 2024 18:23:16.370 * monotonic clock: POSIX clock_gettime
                _._
           _.-``__ ''-._
      _.-``    `.  `_.  ''-._           Redis Community Edition
  .-`` .-```.  ```\/    _.,_ ''-._     7.4.0 (00000000/0) 64 bit
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 1
  `-._    `-._  `-./  _.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |           https://redis.io
  `-._    `-._`-.__.-'_.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |
  `-._    `-._`-.__.-'_.-'    _.-'
      `-._    `-.__.-'    _.-'
          `-._        _.-'
              `-.__.-'

1:M 22 Sep 2024 18:23:16.373 * Server initialized
1:M 22 Sep 2024 18:23:16.373 * Ready to accept connections tcp
```

---

### ***Conexión al cliente Redis***

- **Para acceder al cliente Redis desde el contenedor, utiliza el siguiente comando:**

```bash
docker exec -it --privileged --user redis server-redis-practicas redis-cli -h 127.0.0.1 -p 6379 -a root
```

---

### ***Salida del cliente***

**Al ejecutar el cliente, verás una advertencia sobre el uso de contraseñas en la línea de comandos, seguida de un prompt para ingresar comandos de Redis:**

```bash
docker exec --interactive --tty --privileged --user redis server-redis-practicas redis-cli -h 127.0.0.1 -p 6379 -a root
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379>
```

---

### ***Comando para Escuchar en Todas las Interfaces de Red***

> [!TIP]
> *Para ejecutar un contenedor Redis que escuche en todas las interfaces de red, utiliza el siguiente comando:*

```bash
docker run --interactive --tty \
  --attach STDIN --attach STDERR --attach STDOUT \
  --stop-signal SIGTERM --stop-timeout 10 \
  --publish 6379:6379 --expose 6379 \
  --user root --privileged \
  --workdir /App \
  --mount type=bind,source="$(pwd)",destination=/App \
  --env REDIS_PASSWORD=root \
  --name server-redis-practicas \
  redis redis-server --bind 0.0.0.0 --port 6379 --requirepass root
```

---

### ***Conexión como Cliente a través de CLI***

---

#### ***1. Conexión usando `redis-cli` (usuario vacío)***

```bash
docker exec -it --privileged --user redis server-redis-practicas redis-cli -h 127.0.0.1 -p 6379 -a root
```

**Salida esperada:**

```bash
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379>
```

---

#### ***2. Conexión utilizando `0.0.0.0`***

**Puedes intentar conectarte utilizando `0.0.0.0` como host:**

```bash
docker exec -it --privileged --user redis server-redis-practicas redis-cli -h 0.0.0.0 -p 6379 -a root
```

**Salida esperada:**

```bash
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
0.0.0.0:6379>
```

#### ***3. Usar la dirección IP del contenedor***

- **Para obtener la dirección IPv4 del contenedor, puedes usar el siguiente comando:**

```bash
docker exec -it --privileged --user redis server-redis-practicas redis-cli -h $(docker inspect --format "{{.NetworkSettings.IPAddress}}" server-redis-practicas) -p 6379 -a root
```

**Salida esperada:**

```bash
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
172.17.0.2:6379>
```

---

#### ***4. Conectar utilizando la IP de tu máquina host***

- *Si quieres conectarte utilizando la dirección IP de tu máquina host, puedes obtenerla de la siguiente manera:*

```bash
docker exec -it --privileged --user redis server-redis-practicas redis-cli -h $(hostname -I | awk '{print $1}') -p 6379 -a root
```

**Salida esperada:**

```bash
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
192.168.1.17:6379>
```

---

### ***Advertencia sobre el Uso de Contraseñas***

> [!WARNING]
> *Ten en cuenta que usar contraseñas con las opciones `-a` o `-u` en la línea de comandos puede no ser seguro, ya que puede exponer tus credenciales en el historial de comandos.*

---

### ***Imágenes de Clientes Gráficos de Redis***

*![Cliente Gráfico Redis Incompleto](/Images/ClientGraficoRedisIncomplete.png "/Images/ClientGraficoRedisIncomplete.png")*
*![Cliente Gráfico Redis Completo](/Images/ClientGraficoRedisComplete.png "/Images/ClientGraficoRedisIncomplete.png")*

---

#### ***Redis no es sensible a mayúsculas y minúsculas en sus comandos, lo que significa que puedes escribir los comandos en cualquier combinación de letras mayúsculas y minúsculas sin que esto afecte su funcionamiento.***

- **Por ejemplo, los siguientes comandos son equivalentes y producirán el mismo resultado:**

```bash
SET mykey "value"
set mykey "value"
SeT mykey "value"
```

- *Esta característica permite a los usuarios escribir comandos de manera más flexible y cómoda, adaptándose a sus preferencias personales o estilo de programación. Sin embargo, es una buena práctica mantener un estilo consistente en el uso de mayúsculas y minúsculas para mejorar la legibilidad del código y facilitar la colaboración con otros desarrolladores.*

---

### ***Ejemplo***

- **Para ilustrar, aquí hay un ejemplo de cómo puedes usar diferentes combinaciones de mayúsculas y minúsculas:**

```bash
# Todas estas líneas son equivalentes y se ejecutarán sin problemas.
GET mykey
get mykey
GeT mykey
```

- *Independientemente de cómo escribas el comando, Redis lo interpretará de la misma manera, lo que simplifica la experiencia del usuario y reduce la posibilidad de errores tipográficos relacionados con la capitalización.*

- *Si bien Redis no es sensible a mayúsculas y minúsculas en sus comandos, es importante recordar que las claves almacenadas pueden ser sensibles a la capitalización, lo que significa que "MyKey" y "mykey" se considerarían diferentes claves. Por lo tanto, debes ser consistente y cuidadoso al manejar las claves para evitar confusiones.*

### ***Lista de los comandos más importantes que un ingeniero de software debería aprender al trabajar con Redis:***

---

### ***1. Comandos básicos para claves***

---

#### ***`SET key value`***

**Establece el valor de una clave.**

**Ejemplo:**

```bash
SET user "Daniel"
```

**Resultado: La clave `user` se ha establecido con el valor `"Daniel"`.**

---

#### ***`MSET key1 value1 key2 value2 ...`***

**Establece múltiples claves y valores en una sola operación.**

**Ejemplo:**

```bash
MSET user1 "Daniel" user2 "Benjamin" user3 "Danna"
```

- *Resultado: Las claves `user1`, `user2` y `user3` se establecen con los valores `"Daniel"`, `"Benjamin"`, y `"Danna"`, respectivamente.*

#### ***`MGET key1 key2 ...`***

- **Obtiene los valores de múltiples claves.**

**Ejemplo:**

```bash
MGET user1 user2 user3
```

**Resultado:**

```bash
1) "Daniel"
2) "Benjamin"
3) "Danna"
```

---

#### ***`GET key`***

**Obtiene el valor de una clave específica.**

**Ejemplo:**

```bash
GET user1
```

**Resultado: `"Daniel"`**

#### **`DEL key`**

**Elimina una clave.**

**Ejemplo:**

```bash
DEL user1
```

**Resultado: La clave `user1` ha sido eliminada.**

#### ***`EXPIRE key seconds`***

**Establece un tiempo de expiración para una clave.**

**Ejemplo:**

```bash
EXPIRE user3 60
```

- **Resultado: La clave `user3` expirará después de 60 segundos.**

#### **`TTL key`**

- *Consulta el tiempo de vida restante de una clave.*

**Ejemplo:**

```bash
TTL user3
```

- **Resultado: El tiempo en segundos antes de que la clave expire (por ejemplo, `45`).**

---

#### ***`EXISTS key`***

**Verifica si una clave existe.**

**Ejemplo:**

```bash
EXISTS user2
```

- *Resultado: `1` (si existe) o `0` (si no existe).*

---

#### ***`KEYS pattern`***

**Lista todas las claves que coinciden con un patrón.**

**Ejemplo:**

```bash
KEYS user*
```

*Resultado:*

```bash
1) "user2"
2) "user3"
```

- **Para listar todas las claves de la base de datos actual, utiliza el siguiente comando en redis-cli**

```bash
KEYS *
```

---

#### ***`CLEAR` y `CLS`***

**Comandos del sistema para limpiar la terminal.**

- *`clear`: Para sistemas Unix (Linux, macOS).*
- *`cls`: Para Windows.*

---

### **2. Comandos para manipulación de estructuras de datos simples**

---

#### **Cadenas**

---

##### ***`APPEND key value`***

**Añade un valor al final del valor actual de una clave.**

**Ejemplo:**

```bash
SET user "Daniel"
APPEND user " Perez"
GET user
```

**Resultado: `"Daniel Perez"`**

---

#### **Comandos numéricos**

---

##### **`INCR key`**

- *Incrementa el valor de una clave numérica en 1.*

**Ejemplo:**

```bash
SET count 10
INCR count
GET count
```

- **Resultado: `11`**

---

##### ***`DECR key`***

- *Decrementa el valor de una clave numérica en 1.*

**Ejemplo:**

```bash
SET count 11
DECR count
GET count
```

- *Resultado: `10`*

---

##### ***`INCRBY key increment`***

- **Incrementa el valor de una clave numérica en un número específico.**

**Ejemplo:**

```bash
SET count 10
INCRBY count 5
GET count
```

- **Resultado: `15`**

---

##### **`DECRBY key decrement`**

- **Decrementa el valor de una clave numérica en un número específico.**

**Ejemplo:**

```bash
SET count 10
DECRBY count 3
GET count
```

- **Resultado: `7`**

---

### ***Comandos avanzados para cadenas***

---

#### ***`GETRANGE key start end`***

- **Obtiene una subcadena del valor almacenado en una clave, desde la posición `start` hasta la `end`.**

**Ejemplo:**

```bash
SET message "Hello, Redis!"
GETRANGE message 0 4
```

- **Resultado: `"Hello"` (subcadena desde la posición 0 hasta la 4).**

---

#### **`SETRANGE key offset value`**

- *Modifica la cadena almacenada en una clave reemplazando los caracteres a partir del índice `offset`.*

**Ejemplo:**

```bash
SET message "Hello, Redis!"
SETRANGE message 7 "World"
GET message
```

**Resultado: `"Hello, World!"`**

---

<!-- Todo Continua -->

- **Listas:**
  - *`LPUSH key value`: Inserta un valor al inicio de una lista.*
  - *`RPUSH key value`: Inserta un valor al final de una lista.*
  - *`LPOP key`: Elimina y retorna el primer elemento de una lista.*
  - *`RPOP key`: Elimina y retorna el último elemento de una lista.*
  - *`LRANGE key start stop`: Obtiene un rango de elementos de una lista.*

- **Conjuntos:**
  - *`SADD key member`: Añade un miembro a un conjunto.*
  - *`SREM key member`: Elimina un miembro de un conjunto.*
  - *`SMEMBERS key`: Retorna todos los miembros de un conjunto.*
  - *`SINTER key1 key2 ...`: Retorna la intersección de múltiples conjuntos.*

- **Hashes:**
  - *`HSET key field value`: Establece el valor de un campo en un hash.*
  - *`HGET key field`: Obtiene el valor de un campo en un hash.*
  - *`HDEL key field`: Elimina uno o más campos de un hash.*
  - *`HGETALL key`: Obtiene todos los campos y valores de un hash.*

- **Conjuntos Ordenados:**
  - *`ZADD key score member`: Añade un miembro a un conjunto ordenado con una puntuación.*
  - *`ZRANGE key start stop [WITHSCORES]`: Retorna los elementos de un conjunto ordenado dentro de un rango.*
  - *`ZREM key member`: Elimina un miembro de un conjunto ordenado.*

### ***3. Comandos de transacciones***

- *`MULTI`: Inicia una transacción.*
- *`EXEC`: Ejecuta todas las instrucciones de una transacción.*
- *`DISCARD`: Cancela una transacción.*
- *`WATCH key`: Observa una clave para ver si cambia antes de ejecutar una transacción.*

### ***4. Comandos de publicación/suscripción (Pub/Sub)***

- *`PUBLISH channel message`: Publica un mensaje en un canal.*
- *`SUBSCRIBE channel`: Suscribe a un canal para recibir mensajes.*
- *`UNSUBSCRIBE channel`: Cancela la suscripción a un canal.*

---

### ***5. Comandos para el manejo de scripts***

- *`EVAL script numkeys key [arg ...]`: Ejecuta un script Lua en el servidor.*
- *`EVALSHA sha1 numkeys key [arg ...]`: Ejecuta un script usando su identificador SHA1.*

---

### ***6. Comandos de administración***

- *`INFO`: Obtiene información sobre el servidor Redis.*
- *`MONITOR`: Muestra todas las actividades que ocurren en el servidor.*
- *`FLUSHDB`: Elimina todas las claves en la base de datos actual.*
- *`FLUSHALL`: Elimina todas las claves en todas las bases de datos.*
- *`SAVE`: Guarda el estado actual en disco de manera sincrónica.*
- *`BGSAVE`: Guarda el estado actual en disco de manera asincrónica.*

---

### ***7. Comandos para persistencia***

- *`SAVE`: Fuerza una operación de guardado en disco sincrónica.*
- *`BGSAVE`: Realiza una operación de guardado en segundo plano.*
- *`LASTSAVE`: Muestra el timestamp del último guardado exitoso.*

---

### ***8. Comandos de clustering y replicación***

- *`SLAVEOF host port`: Establece un servidor como esclavo de otro.*
- *`CLUSTER INFO`: Muestra información sobre el estado del clúster.*

---

### ***9. Comandos de migración y dumping***

- *`MIGRATE host port key destination-db timeout`: Migra claves a otro servidor Redis.*
- *`DUMP key`: Hace un volcado en formato serializado de una clave.*

---

### ***10. Comandos para eliminar claves***

- *`UNLINK key`: Elimina una clave de manera no bloqueante.*
- *`EXPIRE key seconds`: Establece un tiempo de expiración para una clave.*

- *Con estos comandos, tendrás un buen manejo sobre las operaciones comunes en Redis, desde la manipulación de datos hasta la administración del servidor.*
