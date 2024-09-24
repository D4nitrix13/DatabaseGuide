# curso <https://www.youtube.com/watch?v=s2co4JzuVB0&list=PLhfxuQVMs-nw6wu3HaD4YcO6wlF0AXMkp&index=1>

## Info <https://www.ibm.com/mx-es/topics/redis>

--user redis

contenedor con permiso root para aprender sirve para produccion no

```bash
docker run --interactive --tty --attach STDIN --attach STDERR --attach STDOUT --stop-signal SIGTERM --stop-timeout 10 --publish 6379:6379 --expose 6379 --user root --privileged --workdir /App --mount type=bind,source="$(pwd)",destination=/App --env REDIS_PASSWORD=root --name server-redis-practicas redis redis-server --bind 127.0.0.1 --port 6379 --requirepass root
```

Simple contenedor tendras problemas de permiso

```bash
docker run -itp6379:6379 -aSTDIN -aSTDERR -aSTDOUT --stop-signal SIGTERM --stop-timeout 10 -eREDIS_PASSWORD=root --user redis --expose 6379 --name server-redis-practicas redis redis-server --bind 127.0.0.1 --port 6379 --requirepass root
```

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

```bash
docker exec -it --privileged --user redis server-redis-practicas redis-cli -h 127.0.0.1 -p 6379 -a root
```

```bash
docker exec --interactive --tty --privileged --user redis server-redis-practicas redis-cli -h 127.0.0.1 -p 6379 -a root
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379>
```

---

## **Guía completa de Redis Shell para Ingenieros de Software**

---

### **1. Conexión al servidor Redis**

Antes de ejecutar comandos, necesitas conectarte a un servidor Redis.

#### **Conectar sin contraseña**

Si tu servidor Redis no está protegido por contraseña, puedes conectarte usando:

```bash
redis-cli
```

#### **Conectar con contraseña**

Si Redis está protegido con contraseña, debes autenticarte al conectarte. Usa la opción `-a` para proporcionar la contraseña:

```bash
redis-cli -a your_password
```

Si Redis está en un servidor remoto, puedes especificar la IP y el puerto:

```bash
redis-cli -h <host_ip> -p <port> -a <password>
```

---

### **2. Comandos básicos de Redis**

#### **2.1. Almacenamiento de claves y valores**

Redis almacena datos en formato de clave-valor. A continuación, se muestran algunos comandos básicos para trabajar con claves y valores.

- **Establecer una clave y un valor (`SET`)**:

```bash
SET key value
```

- **Obtener el valor de una clave (`GET`)**:

```bash
GET key
```

- **Eliminar una clave (`DEL`)**:

```bash
DEL key
```

#### **2.2. Ver todas las claves existentes**

Para listar todas las claves existentes en la base de datos Redis:

```bash
KEYS *
```

Esto puede no ser recomendable en grandes bases de datos, ya que puede afectar el rendimiento.

---

### **3. Tipos de datos en Redis**

Redis es una base de datos NoSQL que soporta múltiples tipos de datos, como cadenas (strings), listas, conjuntos, hashes y más.

#### **3.1. Cadenas (Strings)**

- **Establecer y obtener un valor**:

```bash
SET mykey "Hello"
GET mykey
```

- **Incrementar el valor de una clave numérica (`INCR`)**:

```bash
SET counter 100
INCR counter
```

- **Obtener el tamaño de una cadena (`STRLEN`)**:

```bash
STRLEN mykey
```

#### **3.2. Listas**

- **Agregar valores a una lista (`LPUSH`, `RPUSH`)**:

```bash
LPUSH mylist "A"
RPUSH mylist "B"
```

- **Obtener todos los elementos de una lista (`LRANGE`)**:

```bash
LRANGE mylist 0 -1
```

- **Eliminar y obtener el primer o último valor de una lista (`LPOP`, `RPOP`)**:

```bash
LPOP mylist
RPOP mylist
```

#### **3.3. Conjuntos (Sets)**

- **Agregar elementos a un conjunto (`SADD`)**:

```bash
SADD myset "apple"
SADD myset "banana"
```

- **Obtener todos los elementos de un conjunto (`SMEMBERS`)**:

```bash
SMEMBERS myset
```

- **Eliminar un elemento de un conjunto (`SREM`)**:

```bash
SREM myset "apple"
```

#### **3.4. Hashes**

- **Establecer campos y valores en un hash (`HSET`)**:

```bash
HSET myhash field1 "value1"
HSET myhash field2 "value2"
```

- **Obtener el valor de un campo específico (`HGET`)**:

```bash
HGET myhash field1
```

- **Obtener todos los campos y valores de un hash (`HGETALL`)**:

```bash
HGETALL myhash
```

#### **3.5. Conjuntos ordenados (Sorted Sets)**

- **Agregar un valor con una puntuación a un conjunto ordenado (`ZADD`)**:

```bash
ZADD myzset 1 "one"
ZADD myzset 2 "two"
```

- **Obtener todos los elementos de un conjunto ordenado según su rango (`ZRANGE`)**:

```bash
ZRANGE myzset 0 -1 WITHSCORES
```

- **Eliminar un elemento de un conjunto ordenado (`ZREM`)**:

```bash
ZREM myzset "one"
```

---

### **4. Administración de claves y bases de datos**

#### **4.1. Expiración de claves**

Puedes establecer un tiempo de vida (TTL) para una clave, lo que significa que la clave será eliminada automáticamente después de un cierto tiempo.

- **Establecer un TTL en segundos para una clave (`EXPIRE`)**:

```bash
EXPIRE key 10
```

- **Ver cuánto tiempo le queda a una clave antes de que expire (`TTL`)**:

```bash
TTL key
```

#### **4.2. Cambiar entre bases de datos Redis**

Redis tiene varias bases de datos numeradas de 0 a 15 (por defecto).

- **Cambiar a otra base de datos (`SELECT`)**:

```bash
SELECT 1
```

- **Ver en qué base de datos estás actualmente**:

```bash
INFO keyspace
```

---

### **5. Monitoreo y administración del servidor Redis**

#### **5.1. Monitorear todas las operaciones del servidor (`MONITOR`)**

El comando `MONITOR` muestra en tiempo real todos los comandos que están siendo ejecutados en el servidor Redis:

```bash
MONITOR
```

#### **5.2. Ver información del servidor Redis (`INFO`)**

El comando `INFO` proporciona estadísticas detalladas del servidor Redis:

```bash
INFO
```

#### **5.3. Ver el número de clientes conectados**

```bash
CLIENT LIST
```

#### **5.4. Ver las estadísticas del servidor**

```bash
INFO stats
```

---

### **6. Replicación y persistencia en Redis**

#### **6.1. Guardar los datos en el disco (Snapshot)**

Redis puede hacer persistencia mediante snapshots. Puedes forzar una operación de guardado manualmente con el comando `SAVE`:

```bash
SAVE
```

#### **6.2. Replicación en Redis**

Redis soporta replicación maestra-esclava (master-slave), lo que permite crear réplicas del servidor Redis. Para configurar la replicación, debes usar el archivo de configuración de Redis.

- **Configurar un esclavo para un maestro**:

```bash
SLAVEOF <master_ip> <master_port>
```

#### **6.3. Persistencia con AOF (Append Only File)**

Redis puede también usar el archivo de solo anexado (AOF) para hacer persistencia.

- **Habilitar AOF en el archivo de configuración**:

```bash
appendonly yes
```

---

### **7. Manejo de transacciones**

Redis admite transacciones, lo que permite ejecutar múltiples comandos secuencialmente.

- **Iniciar una transacción**:

```bash
MULTI
```

- **Agregar comandos a la transacción**:

```bash
SET key1 "value1"
SET key2 "value2"
```

- **Ejecutar la transacción**:

```bash
EXEC
```

- **Descartar una transacción**:

```bash
DISCARD
```

---

### **8. Comandos avanzados para optimización**

#### **8.1. Evitar claves huérfanas con `EXPIRE`**

Al crear claves temporales, siempre es recomendable establecer un TTL para evitar el uso innecesario de memoria.

#### **8.2. Uso de scripts Lua (`EVAL`)**

Redis permite ejecutar scripts Lua para manipular datos más complejos.

- **Ejecutar un script Lua**:

```bash
EVAL "return redis.call('set', KEYS[1], ARGV[1])" 1 mykey "Hello"
```

#### **8.3. Usar pipelining para mejorar el rendimiento**

El pipelining permite enviar múltiples comandos a Redis sin esperar una respuesta inmediata, lo que mejora el rendimiento.

---

### **9. Buenas prácticas y recomendaciones**

- **Usar contraseñas fuertes**: Asegúrate de proteger tu instancia de Redis con una contraseña.
- **Monitorear el uso de memoria**: Redis almacena todos los datos en memoria, por lo que es crucial monitorear el uso de memoria con el comando `INFO memory`.
- **Configurar persistencia correctamente**: Asegúrate de configurar correctamente el snapshotting y/o AOF según las necesidades de tu aplicación.

---

### **Conclusión**

Redis Shell (`redis-cli`) es una herramienta poderosa que te permite interactuar de manera eficiente con Redis. Como ingeniero de software, dominar estos comandos te ayudará a gestionar bases de datos Redis de manera óptima, manteniendo el rendimiento y la seguridad.

---

¿Te gustaría más detalles sobre alguno de estos temas?
