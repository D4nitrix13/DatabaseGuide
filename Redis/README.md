<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***[Info](https://www.ibm.com/mx-es/topics/redis "https://www.ibm.com/mx-es/topics/redis")***

---

## ***Introducción a Redis con Docker***

---

### ***Creación de un directorio para el contenedor***

- **Primero, crea un directorio donde almacenarás los datos de Redis:**

```bash
mkdir ~/Escritorio/ServerRedis
cd ~/Escritorio/ServerRedis
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
