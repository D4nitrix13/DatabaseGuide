<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***`MongoDB` es una base de datos NoSQL orientada a documentos, diseñada para almacenar y consultar grandes volúmenes de datos no estructurados o semi-estructurados. A diferencia de las bases de datos relacionales, que almacenan datos en tablas, MongoDB almacena datos en **documentos JSON (o BSON)**, lo que facilita la representación de estructuras complejas y flexibles.***

---

## ***JSON***

- **JSON** *(JavaScript Object Notation) es un formato de texto ligero utilizado para la transmisión de datos entre un servidor y una aplicación web. Es fácil de leer y escribir para los humanos, y fácil de interpretar y generar para las máquinas.*

- **Significado de las siglas:** **JavaScript Object Notation.**
  
- *JSON se basa en una estructura de pares **clave-valor** y es independiente del lenguaje de programación, aunque se deriva de la sintaxis de objetos de JavaScript. Ejemplo de un objeto JSON:*

```json
{
  "name": "Daniel",
  "age": 30,
  "email": "daniel@example.com"
}
```

---

### ***BSON***

**BSON** *(Binary JSON) es un formato de serialización binaria usado principalmente en MongoDB. Es una representación binaria de JSON, que añade tipos de datos adicionales como enteros de varios tamaños, fechas y arrays ordenados. Esto lo hace más eficiente en almacenamiento y transmisión para ciertas aplicaciones, como bases de datos que requieren velocidad en la consulta y escritura de datos.*

- **Significado de las siglas:** **Binary JSON.**

**BSON incluye características adicionales que no están en JSON, como:**

- *Soporte para tipos de datos binarios.*
- *Índices de documentos y estructuras de datos más complejas.*
  
- *BSON es más eficiente que JSON en términos de espacio y procesamiento cuando se utiliza en bases de datos como MongoDB.*

---

## ***¿Para qué sirve MongoDB?***

**MongoDB es ideal para aplicaciones que requieren:**

- **Alto rendimiento** *en la escritura y lectura de datos.*
- **Escalabilidad horizontal** *mediante la distribución de datos en varios servidores.*
- **Flexibilidad en el esquema,** *ya que no requiere una estructura rígida como las bases de datos relacionales. Esto lo hace adecuado para manejar datos con formas variadas o que evolucionan con el tiempo.*
  
**Se utiliza comúnmente en:**

- *Aplicaciones web y móviles.*
- *Sistemas de análisis en tiempo real.*
- *Internet de las Cosas (IoT).*
- *Aplicaciones distribuidas en la nube.*

---

### ***¿Qué es NoSQL y quién lo inventó?***

**NoSQL** *no es una tecnología específica, sino una **categoría** de bases de datos que no siguen el modelo relacional tradicional. El término fue acuñado en 1998 por **Carlo Strozzi** para describir una base de datos ligera que no usaba SQL como lenguaje de consulta. Sin embargo, el concepto moderno de bases de datos NoSQL ganó popularidad a partir de la década de 2000, impulsado por la necesidad de manejar grandes volúmenes de datos y los desafíos de escalabilidad que presentaban las bases de datos relacionales tradicionales.*

- **Las bases de datos NoSQL permiten almacenar datos de maneras más flexibles, utilizando modelos como:**

- **Documentos** **(como MongoDB).**
- **Claves-valor.**
- **Columnas.**
- **Grafos.**

---

### ***Primera base de datos NoSQL***

- *La **primera base de datos NoSQL** como la conocemos hoy fue **Google Bigtable**, desarrollada por Google en 2004 para manejar grandes volúmenes de datos distribuidos en la infraestructura de Google. Bigtable inspiró el desarrollo de otros sistemas NoSQL, como Cassandra y HBase.*

---

### ***¿Qué problema resuelve NoSQL?***

- *El principal problema que resuelven las bases de datos NoSQL es la necesidad de **escalar horizontalmente** para manejar **grandes cantidades de datos**, y el hecho de que las bases de datos relacionales no son adecuadas para ciertas aplicaciones con datos no estructurados o semiestructurados. Los problemas específicos que resuelve incluyen:*

- **Escalabilidad:** *Al distribuir los datos en múltiples servidores.*
- **Alto rendimiento:** *Especialmente en operaciones de escritura y lectura masiva.*
- **Flexibilidad del esquema:** *Permitiendo almacenar datos sin una estructura rígida, lo que facilita la evolución de las aplicaciones.*

- *MongoDB es uno de los sistemas NoSQL más populares debido a su flexibilidad, escalabilidad y facilidad de uso en aplicaciones modernas distribuidas.*

---

### ***MongoDB Installation***

- *Para trabajar de manera más eficiente con MongoDB en Visual Studio Code (VS Code), se recomienda instalar la siguiente extensión:*

---

#### ***Extensión recomendada para VS Code***

- **Nombre:** *MongoDB for VS Code*
- **ID:** *`mongodb.mongodb-vscode`*
- **Descripción:** *Conéctate a MongoDB y Atlas directamente desde tu entorno de VS Code. La extensión permite navegar por tus bases de datos y colecciones, inspeccionar esquemas y utilizar "playgrounds" para prototipar consultas y agregaciones.*
- **Versión:** *1.8.1*
- **Editor:** *MongoDB*
- **Vínculo de VS Marketplace:** *[MongoDB for VS Code](https://marketplace.visualstudio.com/items?itemName=mongodb.mongodb-vscode "https://marketplace.visualstudio.com/items?itemName=mongodb.mongodb-vscode")*

- *[Además, puedes obtener más información sobre MongoDB en su sitio oficial:](https://www.mongodb.com/es "https://www.mongodb.com/es")*

---

### ***Uso de contenedores Docker para MongoDB***

- *[Para simplificar la instalación y ejecución de MongoDB en tu entorno, utilizaremos contenedores Docker. Puedes encontrar la imagen oficial de MongoDB en Docker Hub:](https://hub.docker.com/_/mongo/ "https://hub.docker.com/_/mongo/")*

---

### ***Significado de cada flag y valor en el comando de Docker***

**El siguiente comando crea y ejecuta un contenedor Docker con MongoDB, con varios parámetros y configuraciones especificadas:**

```bash
docker run --interactive --tty --publish 27017:27017 --attach STDIN --attach STDOUT --attach STDERR --expose 27017 --init --name mongodb-practicas --env MONGO_INITDB_ROOT_USERNAME=mongoadmin --env MONGO_INITDB_ROOT_PASSWORD=secret mongo:latest
```

```bash
docker run -itp27017:27017 -aSTDIN -aSTDOUT -aSTDERR --expose 27017 --init --name mongodb-practicas  -eMONGO_INITDB_ROOT_USERNAME=mongoadmin  -eMONGO_INITDB_ROOT_PASSWORD=secret  mongo:latest
```

---

#### ***Explicación de cada flag y valor***

- **`--interactive` (`-i`):** *Permite interactuar con el contenedor, manteniendo la entrada estándar (STDIN) abierta para que puedas enviar comandos al contenedor.*
- **`--tty` (`-t`):** *Asigna una pseudo-terminal (TTY), que es útil para trabajar en modo interactivo dentro del contenedor.*
- **`--publish 27017:27017` (`-p`):** *Mapea el puerto 27017 del contenedor al puerto 27017 del host, permitiendo que las aplicaciones externas (en tu máquina local) se conecten a MongoDB a través de ese puerto.*
- **`--attach STDIN`, `--attach STDOUT`, `--attach STDERR` (`-a`):** *Adjunta el contenedor a los flujos estándar de entrada (STDIN), salida (STDOUT) y error (STDERR), permitiendo ver y controlar lo que sucede en el contenedor en tiempo real desde la terminal.*
- **`--expose 27017`:** *Indica que el contenedor expone el puerto 27017 (internamente) para que otros contenedores Docker puedan conectarse a este puerto.*
- **`--init`:** *Ejecuta el contenedor con un proceso de init simple, que es útil para manejar correctamente procesos "zombie" dentro del contenedor.*
- **`--name mongodb-practicas`:** *Asigna el nombre `mongodb-practicas` al contenedor para identificarlo fácilmente.*
- **`--env MONGO_INITDB_ROOT_USERNAME=mongoadmin`:** *Establece una variable de entorno para crear el usuario administrador de MongoDB con el nombre `mongoadmin`.*
- **`--env MONGO_INITDB_ROOT_PASSWORD=secret`:** *Establece una variable de entorno para definir la contraseña del usuario administrador de MongoDB (`secret`).*
- **`mongo:latest`:** *Especifica la imagen de MongoDB que se usará, en este caso, la versión más reciente disponible (`latest`).*

- *Este comando levanta un contenedor de MongoDB que estará listo para usarse en modo interactivo, con los puertos configurados y credenciales de administrador preestablecidas.*

- **Salida**

```bash
docker run -itp27017:27017 --expose 27017 --init --name some-mongo  -e MONGO_INITDB_ROOT_USERNAME=mongoadmin  -e MONGO_INITDB_ROOT_PASSWORD=secret  mongo:latest
about to fork child process, waiting until server is ready for connections.
forked process: 29

{"t":{"$date":"2024-09-19T00:36:25.425+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"main","msg":"***** SERVER RESTARTED *****"}
{"t":{"$date":"2024-09-19T00:36:25.429+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
{"t":{"$date":"2024-09-19T00:36:25.434+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-09-19T00:36:25.436+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
{"t":{"$date":"2024-09-19T00:36:25.438+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationDonorService","namespace":"config.tenantMigrationDonors"}}
{"t":{"$date":"2024-09-19T00:36:25.438+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationRecipientService","namespace":"config.tenantMigrationRecipients"}}
{"t":{"$date":"2024-09-19T00:36:25.438+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
{"t":{"$date":"2024-09-19T00:36:25.439+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
{"t":{"$date":"2024-09-19T00:36:25.439+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":29,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"2983b9b726e6"}}
{"t":{"$date":"2024-09-19T00:36:25.439+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"7.0.14","gitVersion":"ce59cfc6a3c5e5c067dca0d30697edd68d4f5188","openSSLVersion":"OpenSSL 3.0.2 15 Mar 2022","modules":[],"allocator":"tcmalloc","environment":{"distmod":"ubuntu2204","distarch":"x86_64","target_arch":"x86_64"}}}}
{"t":{"$date":"2024-09-19T00:36:25.439+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"22.04"}}}
{"t":{"$date":"2024-09-19T00:36:25.439+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"127.0.0.1","port":27017,"tls":{"mode":"disabled"}},"processManagement":{"fork":true,"pidFilePath":"/tmp/docker-entrypoint-temp-mongod.pid"},"systemLog":{"destination":"file","logAppend":true,"path":"/proc/7/fd/1"}}}}
{"t":{"$date":"2024-09-19T00:36:25.441+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
{"t":{"$date":"2024-09-19T00:36:25.442+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],"}}
{"t":{"$date":"2024-09-19T00:36:26.456+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706186,"ts_usec":456204,"thread":"29:0x7a38c4e44c80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 0 milliseconds"}}}
{"t":{"$date":"2024-09-19T00:36:26.456+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706186,"ts_usec":456311,"thread":"29:0x7a38c4e44c80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
{"t":{"$date":"2024-09-19T00:36:26.456+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706186,"ts_usec":456348,"thread":"29:0x7a38c4e44c80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
{"t":{"$date":"2024-09-19T00:36:26.456+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706186,"ts_usec":456435,"thread":"29:0x7a38c4e44c80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 0ms, including 0ms for the log replay, 0ms for the rollback to stable, and 0ms for the checkpoint."}}}
{"t":{"$date":"2024-09-19T00:36:26.466+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1024}}
{"t":{"$date":"2024-09-19T00:36:26.466+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
{"t":{"$date":"2024-09-19T00:36:26.483+00:00"},"s":"W",  "c":"CONTROL",  "id":22120,   "ctx":"initandlisten","msg":"Access control is not enabled for the database. Read and write access to data and configuration is unrestricted","tags":["startupWarnings"]}
{"t":{"$date":"2024-09-19T00:36:26.484+00:00"},"s":"W",  "c":"CONTROL",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
{"t":{"$date":"2024-09-19T00:36:26.484+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"admin.system.version","uuidDisposition":"provided","uuid":{"uuid":{"$uuid":"3a13b7e4-4162-4a43-80c4-ba1dc3255962"}},"options":{"uuid":{"$uuid":"3a13b7e4-4162-4a43-80c4-ba1dc3255962"}}}}
{"t":{"$date":"2024-09-19T00:36:26.499+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"3a13b7e4-4162-4a43-80c4-ba1dc3255962"}},"namespace":"admin.system.version","index":"_id_","ident":"index-1-6848618310408394679","collectionIdent":"collection-0-6848618310408394679","commitTimestamp":null}}
{"t":{"$date":"2024-09-19T00:36:26.499+00:00"},"s":"I",  "c":"REPL",     "id":20459,   "ctx":"initandlisten","msg":"Setting featureCompatibilityVersion","attr":{"newVersion":"7.0"}}
{"t":{"$date":"2024-09-19T00:36:26.499+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"7.0","context":"setFCV"}}
{"t":{"$date":"2024-09-19T00:36:26.499+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-09-19T00:36:26.500+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-09-19T00:36:26.500+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"7.0","context":"startup"}}
{"t":{"$date":"2024-09-19T00:36:26.500+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
{"t":{"$date":"2024-09-19T00:36:26.500+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
{"t":{"$date":"2024-09-19T00:36:26.501+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
{"t":{"$date":"2024-09-19T00:36:26.501+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
{"t":{"$date":"2024-09-19T00:36:26.503+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"local.startup_log","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"29fcb035-220f-46a3-95f9-cb3d8b3c77a9"}},"options":{"capped":true,"size":10485760}}}
{"t":{"$date":"2024-09-19T00:36:26.515+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"29fcb035-220f-46a3-95f9-cb3d8b3c77a9"}},"namespace":"local.startup_log","index":"_id_","ident":"index-3-6848618310408394679","collectionIdent":"collection-2-6848618310408394679","commitTimestamp":null}}
{"t":{"$date":"2024-09-19T00:36:26.515+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
{"t":{"$date":"2024-09-19T00:36:26.515+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
{"t":{"$date":"2024-09-19T00:36:26.517+00:00"},"s":"I",  "c":"CONTROL",  "id":20712,   "ctx":"LogicalSessionCacheReap","msg":"Sessions collection is not set up; waiting until next sessions reap interval","attr":{"error":"NamespaceNotFound: config.system.sessions does not exist"}}
{"t":{"$date":"2024-09-19T00:36:26.517+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
{"t":{"$date":"2024-09-19T00:36:26.517+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"127.0.0.1"}}
{"t":{"$date":"2024-09-19T00:36:26.517+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
{"t":{"$date":"2024-09-19T00:36:26.517+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"LogicalSessionCacheRefresh","msg":"createCollection","attr":{"namespace":"config.system.sessions","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"e413fbec-12ca-45fd-bbf3-74d9d2b7b4ba"}},"options":{}}}
{"t":{"$date":"2024-09-19T00:36:26.518+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Create storage engine":"1038 ms","Write current PID to file":"0 ms","Write a new metadata for storage engine":"0 ms","Initialize FCV before rebuilding indexes":"1 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"0 ms","Initialize information needed to make a mongod instance shard aware":"0 ms","Start up the replication coordinator":"0 ms","Start transport layer":"0 ms","_initAndListen total elapsed time":"1078 ms"}}}}
child process started successfully, parent exiting
{"t":{"$date":"2024-09-19T00:36:26.532+00:00"},"s":"I",  "c":"REPL",     "id":7360102, "ctx":"LogicalSessionCacheRefresh","msg":"Added oplog entry for create to transaction","attr":{"namespace":"config.$cmd","uuid":{"uuid":{"$uuid":"e413fbec-12ca-45fd-bbf3-74d9d2b7b4ba"}},"object":{"create":"system.sessions","idIndex":{"v":2,"key":{"_id":1},"name":"_id_"}}}}
{"t":{"$date":"2024-09-19T00:36:26.533+00:00"},"s":"I",  "c":"REPL",     "id":7360100, "ctx":"LogicalSessionCacheRefresh","msg":"Added oplog entry for createIndexes to transaction","attr":{"namespace":"config.$cmd","uuid":{"uuid":{"$uuid":"e413fbec-12ca-45fd-bbf3-74d9d2b7b4ba"}},"object":{"createIndexes":"system.sessions","v":2,"key":{"lastUse":1},"name":"lsidTTLIndex","expireAfterSeconds":1800}}}
{"t":{"$date":"2024-09-19T00:36:26.539+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"e413fbec-12ca-45fd-bbf3-74d9d2b7b4ba"}},"namespace":"config.system.sessions","index":"_id_","ident":"index-5-6848618310408394679","collectionIdent":"collection-4-6848618310408394679","commitTimestamp":null}}
{"t":{"$date":"2024-09-19T00:36:26.539+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"e413fbec-12ca-45fd-bbf3-74d9d2b7b4ba"}},"namespace":"config.system.sessions","index":"lsidTTLIndex","ident":"index-6-6848618310408394679","collectionIdent":"collection-4-6848618310408394679","commitTimestamp":null}}
{"t":{"$date":"2024-09-19T00:36:27.205+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:58710","uuid":{"uuid":{"$uuid":"c771cfbf-5938-47a9-8a5a-2acc799fa571"}},"connectionId":1,"connectionCount":1}}
{"t":{"$date":"2024-09-19T00:36:27.213+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn1","msg":"client metadata","attr":{"remote":"127.0.0.1:58710","client":"conn1","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:36:27.334+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"127.0.0.1:58710","uuid":{"uuid":{"$uuid":"c771cfbf-5938-47a9-8a5a-2acc799fa571"}},"connectionId":1,"connectionCount":0}}
{"t":{"$date":"2024-09-19T00:36:28.221+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:58716","uuid":{"uuid":{"$uuid":"a7ad7613-87e0-4057-bbb2-f66d69636f38"}},"connectionId":2,"connectionCount":1}}
{"t":{"$date":"2024-09-19T00:36:28.230+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn2","msg":"client metadata","attr":{"remote":"127.0.0.1:58716","client":"conn2","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:36:28.320+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:58722","uuid":{"uuid":{"$uuid":"5a63e638-fafd-4967-b370-32f07f97227b"}},"connectionId":3,"connectionCount":2}}
{"t":{"$date":"2024-09-19T00:36:28.320+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:58736","uuid":{"uuid":{"$uuid":"2bc04bb6-53d2-4e8f-8d00-e06446841e3a"}},"connectionId":4,"connectionCount":3}}
{"t":{"$date":"2024-09-19T00:36:28.324+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"127.0.0.1:58722","client":"conn3","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:36:28.327+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"127.0.0.1:58736","client":"conn4","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:36:28.333+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn3","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":9}}
{"t":{"$date":"2024-09-19T00:36:28.334+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:58744","uuid":{"uuid":{"$uuid":"aefcb537-cdb4-4f78-8caf-9bf9d1a36736"}},"connectionId":5,"connectionCount":4}}
{"t":{"$date":"2024-09-19T00:36:28.342+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"127.0.0.1:58744","client":"conn5","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:36:28.349+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn5","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":6}}
admin> db.createUser({
... user: "mongoadmin",
... pwd: "secret",
... roles: [ { role: 'root', db: "admin" } ]
... })
{"t":{"$date":"2024-09-19T00:36:29.017+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"conn5","msg":"createCollection","attr":{"namespace":"admin.system.users","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"0a15f857-d2d0-446c-be13-2263dc856e00"}},"options":{}}}
{"t":{"$date":"2024-09-19T00:36:29.031+00:00"},"s":"I",  "c":"REPL",     "id":7360102, "ctx":"conn5","msg":"Added oplog entry for create to transaction","attr":{"namespace":"admin.$cmd","uuid":{"uuid":{"$uuid":"0a15f857-d2d0-446c-be13-2263dc856e00"}},"object":{"create":"system.users","idIndex":{"v":2,"key":{"_id":1},"name":"_id_"}}}}
{"t":{"$date":"2024-09-19T00:36:29.031+00:00"},"s":"I",  "c":"REPL",     "id":7360100, "ctx":"conn5","msg":"Added oplog entry for createIndexes to transaction","attr":{"namespace":"admin.$cmd","uuid":{"uuid":{"$uuid":"0a15f857-d2d0-446c-be13-2263dc856e00"}},"object":{"createIndexes":"system.users","name":"user_1_db_1","key":{"user":1,"db":1},"unique":true,"v":2}}}
{"t":{"$date":"2024-09-19T00:36:29.039+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn5","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"0a15f857-d2d0-446c-be13-2263dc856e00"}},"namespace":"admin.system.users","index":"_id_","ident":"index-8-6848618310408394679","collectionIdent":"collection-7-6848618310408394679","commitTimestamp":null}}
{"t":{"$date":"2024-09-19T00:36:29.039+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn5","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"0a15f857-d2d0-446c-be13-2263dc856e00"}},"namespace":"admin.system.users","index":"user_1_db_1","ident":"index-9-6848618310408394679","collectionIdent":"collection-7-6848618310408394679","commitTimestamp":null}}
{ ok: 1 }
admin> {"t":{"$date":"2024-09-19T00:36:29.059+00:00"},"s":"I",  "c":"-",        "id":20883,   "ctx":"conn2","msg":"Interrupted operation as its client disconnected","attr":{"opId":50}}
{"t":{"$date":"2024-09-19T00:36:29.060+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"127.0.0.1:58716","uuid":{"uuid":{"$uuid":"a7ad7613-87e0-4057-bbb2-f66d69636f38"}},"connectionId":2,"connectionCount":3}}
{"t":{"$date":"2024-09-19T00:36:29.060+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn5","msg":"Connection ended","attr":{"remote":"127.0.0.1:58744","uuid":{"uuid":{"$uuid":"aefcb537-cdb4-4f78-8caf-9bf9d1a36736"}},"connectionId":5,"connectionCount":2}}
{"t":{"$date":"2024-09-19T00:36:29.060+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn4","msg":"Connection ended","attr":{"remote":"127.0.0.1:58736","uuid":{"uuid":{"$uuid":"2bc04bb6-53d2-4e8f-8d00-e06446841e3a"}},"connectionId":4,"connectionCount":1}}
{"t":{"$date":"2024-09-19T00:36:29.061+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn3","msg":"Connection ended","attr":{"remote":"127.0.0.1:58722","uuid":{"uuid":{"$uuid":"5a63e638-fafd-4967-b370-32f07f97227b"}},"connectionId":3,"connectionCount":0}}

/usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*


{"t":{"$date":"2024-09-19T00:36:29.126+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"main","msg":"***** SERVER RESTARTED *****"}
{"t":{"$date":"2024-09-19T00:36:29.129+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-09-19T00:36:29.129+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
{"t":{"$date":"2024-09-19T00:36:29.130+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
{"t":{"$date":"2024-09-19T00:36:29.134+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationDonorService","namespace":"config.tenantMigrationDonors"}}
{"t":{"$date":"2024-09-19T00:36:29.134+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationRecipientService","namespace":"config.tenantMigrationRecipients"}}
Killing process with pid: 29
{"t":{"$date":"2024-09-19T00:36:29.135+00:00"},"s":"I",  "c":"CONTROL",  "id":23377,   "ctx":"SignalHandler","msg":"Received signal","attr":{"signal":15,"error":"Terminated"}}
{"t":{"$date":"2024-09-19T00:36:29.135+00:00"},"s":"I",  "c":"CONTROL",  "id":23378,   "ctx":"SignalHandler","msg":"Signal was sent by kill(2)","attr":{"pid":99,"uid":999}}
{"t":{"$date":"2024-09-19T00:36:29.135+00:00"},"s":"I",  "c":"CONTROL",  "id":23381,   "ctx":"SignalHandler","msg":"will terminate after current cmd ends"}
{"t":{"$date":"2024-09-19T00:36:29.135+00:00"},"s":"I",  "c":"REPL",     "id":4784900, "ctx":"SignalHandler","msg":"Stepping down the ReplicationCoordinator for shutdown","attr":{"waitTimeMillis":15000}}
{"t":{"$date":"2024-09-19T00:36:29.135+00:00"},"s":"I",  "c":"REPL",     "id":4794602, "ctx":"SignalHandler","msg":"Attempting to enter quiesce mode"}
{"t":{"$date":"2024-09-19T00:36:29.135+00:00"},"s":"I",  "c":"-",        "id":6371601, "ctx":"SignalHandler","msg":"Shutting down the FLE Crud thread pool"}
{"t":{"$date":"2024-09-19T00:36:29.136+00:00"},"s":"I",  "c":"COMMAND",  "id":4784901, "ctx":"SignalHandler","msg":"Shutting down the MirrorMaestro"}
{"t":{"$date":"2024-09-19T00:36:29.136+00:00"},"s":"I",  "c":"SHARDING", "id":4784902, "ctx":"SignalHandler","msg":"Shutting down the WaitForMajorityService"}
{"t":{"$date":"2024-09-19T00:36:29.136+00:00"},"s":"I",  "c":"CONTROL",  "id":4784903, "ctx":"SignalHandler","msg":"Shutting down the LogicalSessionCache"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"NETWORK",  "id":20562,   "ctx":"SignalHandler","msg":"Shutdown: going to close listening sockets"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"NETWORK",  "id":23017,   "ctx":"listener","msg":"removing socket file","attr":{"path":"/tmp/mongodb-27017.sock"}}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"NETWORK",  "id":4784905, "ctx":"SignalHandler","msg":"Shutting down the global connection pool"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"CONTROL",  "id":4784906, "ctx":"SignalHandler","msg":"Shutting down the FlowControlTicketholder"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"-",        "id":20520,   "ctx":"SignalHandler","msg":"Stopping further Flow Control ticket acquisitions."}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"CONTROL",  "id":4784908, "ctx":"SignalHandler","msg":"Shutting down the PeriodicThreadToAbortExpiredTransactions"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"REPL",     "id":4784909, "ctx":"SignalHandler","msg":"Shutting down the ReplicationCoordinator"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"SHARDING", "id":4784910, "ctx":"SignalHandler","msg":"Shutting down the ShardingInitializationMongoD"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"REPL",     "id":4784911, "ctx":"SignalHandler","msg":"Enqueuing the ReplicationStateTransitionLock for shutdown"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"-",        "id":4784912, "ctx":"SignalHandler","msg":"Killing all operations for shutdown"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"-",        "id":4695300, "ctx":"SignalHandler","msg":"Interrupted all currently running operations","attr":{"opsKilled":3}}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"TENANT_M", "id":5093807, "ctx":"SignalHandler","msg":"Shutting down all TenantMigrationAccessBlockers on global shutdown"}
{"t":{"$date":"2024-09-19T00:36:29.137+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"TenantMigrationBlockerNet","msg":"Killing all outstanding egress activity."}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"ASIO",     "id":6529201, "ctx":"SignalHandler","msg":"Network interface redundant shutdown","attr":{"state":"Stopped"}}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"SignalHandler","msg":"Killing all outstanding egress activity."}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"COMMAND",  "id":4784913, "ctx":"SignalHandler","msg":"Shutting down all open transactions"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"REPL",     "id":4784914, "ctx":"SignalHandler","msg":"Acquiring the ReplicationStateTransitionLock for shutdown"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"INDEX",    "id":4784915, "ctx":"SignalHandler","msg":"Shutting down the IndexBuildsCoordinator"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"NETWORK",  "id":4784918, "ctx":"SignalHandler","msg":"Shutting down the ReplicaSetMonitor"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"SHARDING", "id":4784921, "ctx":"SignalHandler","msg":"Shutting down the MigrationUtilExecutor"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"MigrationUtil-TaskExecutor","msg":"Killing all outstanding egress activity."}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"COMMAND",  "id":4784923, "ctx":"SignalHandler","msg":"Shutting down the ServiceEntryPoint"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"CONTROL",  "id":4784927, "ctx":"SignalHandler","msg":"Shutting down the HealthLog"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"CONTROL",  "id":4784928, "ctx":"SignalHandler","msg":"Shutting down the TTL monitor"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"INDEX",    "id":3684100, "ctx":"SignalHandler","msg":"Shutting down TTL collection monitor thread"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"INDEX",    "id":3684101, "ctx":"SignalHandler","msg":"Finished shutting down TTL collection monitor thread"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"CONTROL",  "id":6278511, "ctx":"SignalHandler","msg":"Shutting down the Change Stream Expired Pre-images Remover"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"CONTROL",  "id":4784929, "ctx":"SignalHandler","msg":"Acquiring the global lock for shutdown"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"CONTROL",  "id":4784930, "ctx":"SignalHandler","msg":"Shutting down the storage engine"}
{"t":{"$date":"2024-09-19T00:36:29.138+00:00"},"s":"I",  "c":"STORAGE",  "id":22320,   "ctx":"SignalHandler","msg":"Shutting down journal flusher thread"}
{"t":{"$date":"2024-09-19T00:36:29.139+00:00"},"s":"I",  "c":"STORAGE",  "id":22321,   "ctx":"SignalHandler","msg":"Finished shutting down journal flusher thread"}
{"t":{"$date":"2024-09-19T00:36:29.139+00:00"},"s":"I",  "c":"STORAGE",  "id":22322,   "ctx":"SignalHandler","msg":"Shutting down checkpoint thread"}
{"t":{"$date":"2024-09-19T00:36:29.139+00:00"},"s":"I",  "c":"STORAGE",  "id":22323,   "ctx":"SignalHandler","msg":"Finished shutting down checkpoint thread"}
{"t":{"$date":"2024-09-19T00:36:29.139+00:00"},"s":"I",  "c":"STORAGE",  "id":22261,   "ctx":"SignalHandler","msg":"Timestamp monitor shutting down"}
{"t":{"$date":"2024-09-19T00:36:29.139+00:00"},"s":"I",  "c":"STORAGE",  "id":20282,   "ctx":"SignalHandler","msg":"Deregistering all the collections"}
{"t":{"$date":"2024-09-19T00:36:29.139+00:00"},"s":"I",  "c":"STORAGE",  "id":22317,   "ctx":"SignalHandler","msg":"WiredTigerKVEngine shutting down"}
{"t":{"$date":"2024-09-19T00:36:29.139+00:00"},"s":"I",  "c":"STORAGE",  "id":22318,   "ctx":"SignalHandler","msg":"Shutting down session sweeper thread"}
{"t":{"$date":"2024-09-19T00:36:29.139+00:00"},"s":"I",  "c":"STORAGE",  "id":22319,   "ctx":"SignalHandler","msg":"Finished shutting down session sweeper thread"}
{"t":{"$date":"2024-09-19T00:36:29.140+00:00"},"s":"I",  "c":"STORAGE",  "id":4795902, "ctx":"SignalHandler","msg":"Closing WiredTiger","attr":{"closeConfig":"leak_memory=true,use_timestamp=false,"}}
{"t":{"$date":"2024-09-19T00:36:29.143+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706189,"ts_usec":143651,"thread":"29:0x7a38c4e00640","session_name":"close_ckpt","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 46, snapshot max: 46 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 1"}}}
{"t":{"$date":"2024-09-19T00:36:29.161+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706189,"ts_usec":161343,"thread":"29:0x7a38c4e00640","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown checkpoint has successfully finished and ran for 19 milliseconds"}}}
{"t":{"$date":"2024-09-19T00:36:29.161+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"SignalHandler","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706189,"ts_usec":161573,"thread":"29:0x7a38c4e00640","session_name":"WT_CONNECTION.close","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"shutdown was completed successfully and took 20ms, including 0ms for the rollback to stable, and 19ms for the checkpoint."}}}
{"t":{"$date":"2024-09-19T00:36:29.168+00:00"},"s":"I",  "c":"STORAGE",  "id":4795901, "ctx":"SignalHandler","msg":"WiredTiger closed","attr":{"durationMillis":28}}
{"t":{"$date":"2024-09-19T00:36:29.168+00:00"},"s":"I",  "c":"STORAGE",  "id":22279,   "ctx":"SignalHandler","msg":"shutdown: removing fs lock..."}
{"t":{"$date":"2024-09-19T00:36:29.168+00:00"},"s":"I",  "c":"-",        "id":4784931, "ctx":"SignalHandler","msg":"Dropping the scope cache for shutdown"}
{"t":{"$date":"2024-09-19T00:36:29.168+00:00"},"s":"I",  "c":"FTDC",     "id":20626,   "ctx":"SignalHandler","msg":"Shutting down full-time diagnostic data capture"}
{"t":{"$date":"2024-09-19T00:36:29.172+00:00"},"s":"I",  "c":"CONTROL",  "id":20565,   "ctx":"SignalHandler","msg":"Now exiting"}
{"t":{"$date":"2024-09-19T00:36:29.173+00:00"},"s":"I",  "c":"CONTROL",  "id":8423404, "ctx":"SignalHandler","msg":"mongod shutdown complete","attr":{"Summary of time elapsed":{"Statistics":{"Enter terminal shutdown":"0 ms","Step down the replication coordinator for shutdown":"0 ms","Time spent in quiesce mode":"0 ms","Shut down FLE Crud subsystem":"0 ms","Shut down MirrorMaestro":"1 ms","Shut down WaitForMajorityService":"0 ms","Shut down the logical session cache":"0 ms","Shut down the transport layer":"1 ms","Shut down the global connection pool":"0 ms","Shut down the flow control ticket holder":"0 ms","Kill all operations for shutdown":"0 ms","Shut down all tenant migration access blockers on global shutdown":"1 ms","Shut down all open transactions":"0 ms","Acquire the RSTL for shutdown":"0 ms","Shut down the IndexBuildsCoordinator and wait for index builds to finish":"0 ms","Shut down the replica set monitor":"0 ms","Shut down the migration util executor":"0 ms","Shut down the health log":"0 ms","Shut down the TTL monitor":"0 ms","Shut down expired pre-images and documents removers":"0 ms","Shut down the storage engine":"30 ms","Wait for the oplog cap maintainer thread to stop":"0 ms","Shut down full-time data capture":"0 ms","shutdownTask total elapsed time":"37 ms"}}}}
{"t":{"$date":"2024-09-19T00:36:29.173+00:00"},"s":"I",  "c":"CONTROL",  "id":23138,   "ctx":"SignalHandler","msg":"Shutting down","attr":{"exitCode":0}}

MongoDB init process complete; ready for start up.

{"t":{"$date":"2024-09-19T00:36:30.190+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-09-19T00:36:30.191+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
{"t":{"$date":"2024-09-19T00:36:30.194+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
{"t":{"$date":"2024-09-19T00:36:30.198+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationDonorService","namespace":"config.tenantMigrationDonors"}}
{"t":{"$date":"2024-09-19T00:36:30.198+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationRecipientService","namespace":"config.tenantMigrationRecipients"}}
{"t":{"$date":"2024-09-19T00:36:30.198+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
{"t":{"$date":"2024-09-19T00:36:30.198+00:00"},"s":"I",  "c":"TENANT_M", "id":7091600, "ctx":"main","msg":"Starting TenantMigrationAccessBlockerRegistry"}
{"t":{"$date":"2024-09-19T00:36:30.199+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":7,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"2983b9b726e6"}}
{"t":{"$date":"2024-09-19T00:36:30.199+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"7.0.14","gitVersion":"ce59cfc6a3c5e5c067dca0d30697edd68d4f5188","openSSLVersion":"OpenSSL 3.0.2 15 Mar 2022","modules":[],"allocator":"tcmalloc","environment":{"distmod":"ubuntu2204","distarch":"x86_64","target_arch":"x86_64"}}}}
{"t":{"$date":"2024-09-19T00:36:30.199+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"22.04"}}}
{"t":{"$date":"2024-09-19T00:36:30.199+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"},"security":{"authorization":"enabled"}}}}
{"t":{"$date":"2024-09-19T00:36:30.201+00:00"},"s":"I",  "c":"STORAGE",  "id":22270,   "ctx":"initandlisten","msg":"Storage engine to use detected by data files","attr":{"dbpath":"/data/db","storageEngine":"wiredTiger"}}
{"t":{"$date":"2024-09-19T00:36:30.201+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
{"t":{"$date":"2024-09-19T00:36:30.201+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=3413M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],"}}
{"t":{"$date":"2024-09-19T00:36:31.204+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":204681,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 1 through 2"}}}
{"t":{"$date":"2024-09-19T00:36:31.329+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":329243,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 2"}}}
{"t":{"$date":"2024-09-19T00:36:31.449+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":449221,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Main recovery loop: starting at 1/31872 to 2/256"}}}
{"t":{"$date":"2024-09-19T00:36:31.576+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":576750,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 1 through 2"}}}
{"t":{"$date":"2024-09-19T00:36:31.658+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":658739,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Recovering log 2 through 2"}}}
{"t":{"$date":"2024-09-19T00:36:31.720+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":720072,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery log replay has successfully finished and ran for 515 milliseconds"}}}
{"t":{"$date":"2024-09-19T00:36:31.720+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":720185,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global recovery timestamp: (0, 0)"}}}
{"t":{"$date":"2024-09-19T00:36:31.720+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":720244,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"Set global oldest timestamp: (0, 0)"}}}
{"t":{"$date":"2024-09-19T00:36:31.720+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":720868,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery rollback to stable has successfully finished and ran for 0 milliseconds"}}}
{"t":{"$date":"2024-09-19T00:36:31.727+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":727877,"thread":"7:0x71518ed6ec80","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 1, snapshot max: 1 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
{"t":{"$date":"2024-09-19T00:36:31.734+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":734718,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery checkpoint has successfully finished and ran for 13 milliseconds"}}}
{"t":{"$date":"2024-09-19T00:36:31.734+00:00"},"s":"I",  "c":"WTRECOV",  "id":22430,   "ctx":"initandlisten","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706191,"ts_usec":734819,"thread":"7:0x71518ed6ec80","session_name":"txn-recover","category":"WT_VERB_RECOVERY_PROGRESS","category_id":30,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"recovery was completed successfully and took 530ms, including 515ms for the log replay, 0ms for the rollback to stable, and 13ms for the checkpoint."}}}
{"t":{"$date":"2024-09-19T00:36:31.736+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1535}}
{"t":{"$date":"2024-09-19T00:36:31.736+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
{"t":{"$date":"2024-09-19T00:36:31.744+00:00"},"s":"W",  "c":"CONTROL",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":1048576,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
{"t":{"$date":"2024-09-19T00:36:31.749+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":21},"outgoing":{"minWireVersion":6,"maxWireVersion":21},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":21},"incomingInternalClient":{"minWireVersion":21,"maxWireVersion":21},"outgoing":{"minWireVersion":21,"maxWireVersion":21},"isInternalClient":true}}}
{"t":{"$date":"2024-09-19T00:36:31.749+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"7.0","context":"startup"}}
{"t":{"$date":"2024-09-19T00:36:31.749+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
{"t":{"$date":"2024-09-19T00:36:31.752+00:00"},"s":"I",  "c":"CONTROL",  "id":6608200, "ctx":"initandlisten","msg":"Initializing cluster server parameters from disk"}
{"t":{"$date":"2024-09-19T00:36:31.752+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
{"t":{"$date":"2024-09-19T00:36:31.752+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
{"t":{"$date":"2024-09-19T00:36:31.757+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
{"t":{"$date":"2024-09-19T00:36:31.758+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
{"t":{"$date":"2024-09-19T00:36:31.760+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
{"t":{"$date":"2024-09-19T00:36:31.760+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0"}}
{"t":{"$date":"2024-09-19T00:36:31.760+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
{"t":{"$date":"2024-09-19T00:36:31.760+00:00"},"s":"I",  "c":"CONTROL",  "id":8423403, "ctx":"initandlisten","msg":"mongod startup complete","attr":{"Summary of time elapsed":{"Startup from clean shutdown?":true,"Statistics":{"Transport layer setup":"0 ms","Run initial syncer crash recovery":"0 ms","Create storage engine lock file in the data directory":"0 ms","Get metadata describing storage engine":"0 ms","Validate options in metadata against current startup options":"0 ms","Create storage engine":"1536 ms","Write current PID to file":"0 ms","Initialize FCV before rebuilding indexes":"5 ms","Drop abandoned idents and get back indexes that need to be rebuilt or builds that need to be restarted":"0 ms","Rebuild indexes for collections":"0 ms","Load cluster parameters from disk for a standalone":"0 ms","Build user and roles graph":"0 ms","Verify indexes for admin.system.users collection":"0 ms","Set up the background thread pool responsible for waiting for opTimes to be majority committed":"0 ms","Initialize information needed to make a mongod instance shard aware":"0 ms","Start up the replication coordinator":"0 ms","Start transport layer":"0 ms","_initAndListen total elapsed time":"1561 ms"}}}}
{"t":{"$date":"2024-09-19T00:37:31.746+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706251,"ts_usec":745971,"thread":"7:0x715183800640","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 4, snapshot max: 4 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
{"t":{"$date":"2024-09-19T00:38:31.767+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706311,"ts_usec":767026,"thread":"7:0x715183800640","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 5, snapshot max: 5 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
{"t":{"$date":"2024-09-19T00:39:31.780+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706371,"ts_usec":780252,"thread":"7:0x715183800640","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 6, snapshot max: 6 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
{"t":{"$date":"2024-09-19T00:40:04.733+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.17.0.3:43488","uuid":{"uuid":{"$uuid":"be9807d0-5ffe-4778-936f-0c88866ab669"}},"connectionId":1,"connectionCount":1}}
{"t":{"$date":"2024-09-19T00:40:04.740+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn1","msg":"client metadata","attr":{"remote":"172.17.0.3:43488","client":"conn1","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:40:04.751+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.17.0.3:43502","uuid":{"uuid":{"$uuid":"bd8ceec4-5e38-48fb-8d29-a8a17cdcde8e"}},"connectionId":2,"connectionCount":2}}
{"t":{"$date":"2024-09-19T00:40:04.755+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn2","msg":"client metadata","attr":{"remote":"172.17.0.3:43502","client":"conn2","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:40:04.758+00:00"},"s":"I",  "c":"ACCESS",   "id":6788604, "ctx":"conn2","msg":"Auth metrics report","attr":{"metric":"acquireUser","micros":0}}
{"t":{"$date":"2024-09-19T00:40:04.780+00:00"},"s":"I",  "c":"ACCESS",   "id":5286306, "ctx":"conn2","msg":"Successfully authenticated","attr":{"client":"172.17.0.3:43502","isSpeculative":true,"isClusterMember":false,"mechanism":"SCRAM-SHA-256","user":"mongoadmin","db":"admin","result":0,"metrics":{"conversation_duration":{"micros":22731,"summary":{"0":{"step":1,"step_total":2,"duration_micros":120},"1":{"step":2,"step_total":2,"duration_micros":33}}}},"extraInfo":{}}}
{"t":{"$date":"2024-09-19T00:40:04.783+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn2","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":2}}
{"t":{"$date":"2024-09-19T00:40:04.805+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.17.0.3:43504","uuid":{"uuid":{"$uuid":"4e3e018b-b7de-48fa-bc97-0789181bcc32"}},"connectionId":3,"connectionCount":3}}
{"t":{"$date":"2024-09-19T00:40:04.806+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.17.0.3:43518","uuid":{"uuid":{"$uuid":"41a1538a-2b93-4fc0-bca7-c98eedfcfdef"}},"connectionId":4,"connectionCount":4}}
{"t":{"$date":"2024-09-19T00:40:04.809+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"172.17.0.3:43504","client":"conn3","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:40:04.809+00:00"},"s":"I",  "c":"ACCESS",   "id":6788604, "ctx":"conn3","msg":"Auth metrics report","attr":{"metric":"acquireUser","micros":0}}
{"t":{"$date":"2024-09-19T00:40:04.812+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"172.17.0.3:43518","client":"conn4","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:40:04.813+00:00"},"s":"I",  "c":"ACCESS",   "id":6788604, "ctx":"conn4","msg":"Auth metrics report","attr":{"metric":"acquireUser","micros":0}}
{"t":{"$date":"2024-09-19T00:40:04.815+00:00"},"s":"I",  "c":"ACCESS",   "id":5286306, "ctx":"conn3","msg":"Successfully authenticated","attr":{"client":"172.17.0.3:43504","isSpeculative":true,"isClusterMember":false,"mechanism":"SCRAM-SHA-256","user":"mongoadmin","db":"admin","result":0,"metrics":{"conversation_duration":{"micros":5913,"summary":{"0":{"step":1,"step_total":2,"duration_micros":100},"1":{"step":2,"step_total":2,"duration_micros":66}}}},"extraInfo":{}}}
{"t":{"$date":"2024-09-19T00:40:04.819+00:00"},"s":"I",  "c":"ACCESS",   "id":5286306, "ctx":"conn4","msg":"Successfully authenticated","attr":{"client":"172.17.0.3:43518","isSpeculative":true,"isClusterMember":false,"mechanism":"SCRAM-SHA-256","user":"mongoadmin","db":"admin","result":0,"metrics":{"conversation_duration":{"micros":5986,"summary":{"0":{"step":1,"step_total":2,"duration_micros":101},"1":{"step":2,"step_total":2,"duration_micros":35}}}},"extraInfo":{}}}
{"t":{"$date":"2024-09-19T00:40:04.821+00:00"},"s":"I",  "c":"NETWORK",  "id":6788700, "ctx":"conn4","msg":"Received first command on ingress connection since session start or auth handshake","attr":{"elapsedMillis":2}}
{"t":{"$date":"2024-09-19T00:40:15.255+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"172.17.0.3:33406","uuid":{"uuid":{"$uuid":"27306272-c870-4332-bbfb-486471b7c757"}},"connectionId":5,"connectionCount":5}}
{"t":{"$date":"2024-09-19T00:40:15.258+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"172.17.0.3:33406","client":"conn5","negotiatedCompressors":[],"doc":{"application":{"name":"mongosh 2.3.1"},"driver":{"name":"nodejs|mongosh","version":"6.8.0|2.3.1"},"platform":"Node.js v20.17.0, LE","os":{"name":"linux","architecture":"x64","version":"3.10.0-327.22.2.el7.x86_64","type":"Linux"},"env":{"container":{"runtime":"docker"}}}}}
{"t":{"$date":"2024-09-19T00:40:31.790+00:00"},"s":"I",  "c":"WTCHKPT",  "id":22430,   "ctx":"Checkpointer","msg":"WiredTiger message","attr":{"message":{"ts_sec":1726706431,"ts_usec":790101,"thread":"7:0x715183800640","session_name":"WT_SESSION.checkpoint","category":"WT_VERB_CHECKPOINT_PROGRESS","category_id":6,"verbose_level":"DEBUG_1","verbose_level_id":1,"msg":"saving checkpoint snapshot min: 7, snapshot max: 7 snapshot count: 0, oldest timestamp: (0, 0) , meta checkpoint timestamp: (0, 0) base write gen: 7"}}}
```

---

### ***Forma de obtener información del contenedor que ejecutamos***

**Podemos obtener detalles sobre el contenedor MongoDB en ejecución utilizando los siguientes comandos de Docker:**

1. **Buscar contenedores basados en la imagen `mongo`:**

    ```bash
    docker ps -a --filter ancestor=mongo
    ```

   - **Descripción:** *Este comando lista todos los contenedores que fueron creados a partir de la imagen `mongo`. Incluye información como el ID del contenedor, la imagen utilizada, el comando ejecutado, el tiempo de creación, el estado y los puertos asignados.*

   **Salida:**

    ```bash
    CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                           NAMES
    bb69e567504a   mongo:latest   "docker-entrypoint.s…"   25 minutes ago   Up 25 minutes   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   mongodb-practicas
    ```

2. **Buscar un contenedor por nombre (`mongodb-practicas`):**

    ```bash
    docker ps -a --filter name=mongodb-practicas
    ```

   - **Descripción:** *Este comando lista los detalles del contenedor cuyo nombre coincide con `mongodb-practicas`. Es útil para localizar un contenedor específico por su nombre.*

   **Salida:**

    ```bash
    CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                           NAMES
    bb69e567504a   mongo:latest   "docker-entrypoint.s…"   25 minutes ago   Up 25 minutes   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   mongodb-practicas
    ```

3. **Buscar un contenedor por puerto expuesto (`27017`):**

    ```bash
    docker ps -a --filter expose=27017
    ```

   - **Descripción:** *Este comando muestra los contenedores que tienen el puerto 27017 expuesto. Esto es útil cuando deseas encontrar todos los contenedores que están escuchando en un puerto específico.*

   **Salida:**

    ```bash
    CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                           NAMES
    bb69e567504a   mongo:latest   "docker-entrypoint.s…"   25 minutes ago   Up 25 minutes   0.0.0.0:27017->27017/tcp, :::27017->27017/tcp   mongodb-practicas
    ```

---

### ***Nos conectamos como cliente***

- **Para conectarnos a MongoDB como cliente desde otro contenedor, podemos utilizar el siguiente comando:**

```bash
docker run -it -p 27018:27018 -a STDIN -a STDOUT -a STDERR --expose 27018 --init --rm --name client-cli-mongodb mongo mongosh --host $(docker container inspect -f "{{.NetworkSettings.IPAddress}}" $(docker ps -q -a --filter expose=27017 --filter status=running)) --port 27017 -u mongoadmin -p secret --authenticationDatabase admin
```

```bash
docker run -itp27018:27018 -aSTDIN -aSTDOUT -aSTDERR --expose 27018 --init --rm --name client-cli-mongodb mongo mongosh --host $(docker container inspect -f"{{.NetworkSettings.IPAddress}}" $(docker ps -qafexpose=27017 -f status=running)) --port 27017 -u mongoadmin -p secret --authenticationDatabase admin
```

---

#### ***Explicación de cada parte del comando***

- **`docker run`:** *Ejecuta un nuevo contenedor basado en la imagen de MongoDB.*
- **`-it`:** *Ejecuta el contenedor en modo interactivo y asigna una terminal (TTY) para poder ingresar comandos.*
- **`-p 27018:27018`:** *Mapea el puerto 27018 del host al puerto 27018 del contenedor, lo que permite que el cliente MongoDB se conecte desde este puerto.*
- **`-a STDIN -a STDOUT -a STDERR`:** *Adjunta los flujos estándar de entrada, salida y error del contenedor al terminal actual para poder interactuar con el contenedor y ver su salida.*
- **`--expose 27018`:** *Expone el puerto 27018 dentro del contenedor para que otros contenedores puedan conectarse a él si es necesario.*
- **`--init`:** *Inicia el contenedor con un proceso `init` simple que gestiona correctamente los procesos "zombie".*
- **`--rm`:** *Elimina automáticamente el contenedor una vez que se detiene, para no dejar contenedores residuales.*
- **`--name client-cli-mongodb`:** *Le asigna el nombre `client-cli-mongodb` al contenedor, lo que facilita su identificación.*
- **`mongo`:** *La imagen de MongoDB que se va a utilizar.*
- **`mongosh`:** *El shell interactivo de MongoDB que se utiliza para conectarse y ejecutar comandos en la base de datos.*
- **`--host $(docker container inspect -f "{{.NetworkSettings.IPAddress}}" $(docker ps -q -a --filter expose=27017 --filter status=running))`:**
  - *Utiliza `docker container inspect` para obtener la dirección IP del contenedor que tiene el puerto 27017 expuesto y está en estado "running".*
  - *La dirección IP obtenida se pasa como el valor de `--host`, lo que permite que el cliente se conecte a la instancia de MongoDB que está ejecutándose en otro contenedor.*

- **`--port 27017`:** *Especifica que el cliente se debe conectar al puerto 27017, donde MongoDB está escuchando.*
- **`-u mongoadmin -p secret`:** *Especifica las credenciales de autenticación para conectarse a MongoDB, donde:*
  - **`-u`:** *El nombre de usuario (`mongoadmin`).*
  - **`-p`:** *La contraseña (`secret`).*

- **`--authenticationDatabase admin`:** *Indica que la autenticación debe hacerse en la base de datos `admin`, donde se creó el usuario administrador.*

*Este comando ejecuta un cliente MongoDB interactivo (`mongosh`) desde otro contenedor, que se conectará a una instancia de MongoDB ya en ejecución utilizando las credenciales proporcionadas y el puerto adecuado.*

```bash
docker run -it --init --rm --name client-cli-mongodb mongo mongosh --host $(docker container inspect -f"{{.NetworkSettings.IPAddress}}" $(docker ps -qafexpose=27017 -f status=running)) --port 27017 -u mongoadmin -p secret --authenticationDatabase admin
Current Mongosh Log ID: 66eb72e42413ba15c7964032
Connecting to:          mongodb://<credentials>@172.17.0.2:27017/?directConnection=true&authSource=admin&appName=mongosh+2.3.1
Using MongoDB:          7.0.14
Using Mongosh:          2.3.1

For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/


To help improve our products, anonymous usage data is collected and sent to MongoDB periodically (https://www.mongodb.com/legal/privacy-policy).
You can opt-out by running the disableTelemetry() command.

------
   The server generated these startup warnings when booting
   2024-09-19T00:36:30.201+00:00: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem
   2024-09-19T00:36:31.744+00:00: vm.max_map_count is too low
------

test>
```

**MongoDB** *y* **mongosh** *son componentes relacionados, pero cumplen funciones diferentes dentro del ecosistema de bases de datos de MongoDB.*

---

### ***MongoDB***

- **Definición:** *MongoDB es una base de datos NoSQL orientada a documentos. Almacena datos en formato BSON (Binary JSON), lo que permite flexibilidad en el esquema y la posibilidad de manejar datos no estructurados o semi-estructurados.*
- **Función:** *Es el sistema de gestión de bases de datos que permite almacenar, consultar y administrar los datos. Soporta características como replicación, sharding y consultas ad hoc, lo que la hace adecuada para aplicaciones modernas que requieren escalabilidad y alta disponibilidad.*

---

### ***mongosh***

- **Definición:** *`mongosh` (MongoDB Shell) es el shell interactivo de MongoDB. Es una herramienta de línea de comandos que permite interactuar con una instancia de MongoDB.*
- **Función:** *Proporciona una interfaz para ejecutar comandos, realizar consultas, y administrar bases de datos y colecciones en MongoDB. Permite a los usuarios ejecutar operaciones como inserciones, actualizaciones, eliminaciones y consultas de datos. También incluye características como autocompletado y resaltado de sintaxis para facilitar el uso.*

---

### ***Resumen de diferencias***

- **MongoDB:** *Es la base de datos en sí, donde se almacenan los datos.*
- **mongosh:** *Es la herramienta que permite a los usuarios interactuar con la base de datos MongoDB a través de comandos en la línea de comandos.*

*Ambos son esenciales para trabajar con datos en MongoDB, pero cumplen roles diferentes dentro del ecosistema.*
