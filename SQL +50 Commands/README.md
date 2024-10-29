<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Indice***

- [***Indice***](#indice)
  - [***`SQL` significa `Structured Query Language` y es un estándar de lenguaje de consulta para bases de datos relacionales. Fue estandarizado por la `ISO` (Organización Internacional de Normalización) debido a su amplia adopción y necesidad de interoperabilidad entre diferentes sistemas de gestión de bases de datos***](#sql-significa-structured-query-language-y-es-un-estándar-de-lenguaje-de-consulta-para-bases-de-datos-relacionales-fue-estandarizado-por-la-iso-organización-internacional-de-normalización-debido-a-su-amplia-adopción-y-necesidad-de-interoperabilidad-entre-diferentes-sistemas-de-gestión-de-bases-de-datos)
  - [***1. ¿Qué es una Base de Datos?***](#1-qué-es-una-base-de-datos)
    - [***2. Sistemas de Gestión de Bases de Datos (DBMS)***](#2-sistemas-de-gestión-de-bases-de-datos-dbms)
    - [***3. Fundamentos de SQL (Structured Query Language)***](#3-fundamentos-de-sql-structured-query-language)
    - [***DDL (Data Definition Language) - Lenguaje de Definición de Datos***](#ddl-data-definition-language---lenguaje-de-definición-de-datos)
      - [***Comandos básicos de DDL***](#comandos-básicos-de-ddl)
      - [***Proceso a Bajo Nivel***](#proceso-a-bajo-nivel)
    - [***DML (Data Manipulation Language) - Lenguaje de Manipulación de Datos***](#dml-data-manipulation-language---lenguaje-de-manipulación-de-datos)
      - [***Principales comandos DML***](#principales-comandos-dml)
    - [***Diferencias entre DDL y DML***](#diferencias-entre-ddl-y-dml)
      - [***DDL (Data Definition Language)***](#ddl-data-definition-language)
      - [***DML (Data Manipulation Language)***](#dml-data-manipulation-language)
    - [***Resumen a bajo nivel***](#resumen-a-bajo-nivel)
      - [***Las bases de datos `relacionales` y `no relacionales` tienen diferentes enfoques y casos de uso***](#las-bases-de-datos-relacionales-y-no-relacionales-tienen-diferentes-enfoques-y-casos-de-uso)
    - [***Bases de datos relacionales (SQL):***](#bases-de-datos-relacionales-sql)
    - [***Bases de datos no relacionales (NoSQL):***](#bases-de-datos-no-relacionales-nosql)

## ***`SQL` significa `Structured Query Language` y es un estándar de lenguaje de consulta para bases de datos relacionales. Fue estandarizado por la `ISO` (Organización Internacional de Normalización) debido a su amplia adopción y necesidad de interoperabilidad entre diferentes sistemas de gestión de bases de datos***

- **`ISO`** *significa* **International Organization for Standardization,** *una organización independiente que desarrolla estándares internacionales para asegurar calidad, seguridad y eficiencia en productos y servicios. SQL se estandarizó por primera vez en* **1986.**

- *Más detalles del estándar ISO aquí: [ISO 76583](https://www.iso.org/standard/76583.html "https://www.iso.org/standard/76583.html").*

## ***1. ¿Qué es una Base de Datos?***

- *Una base de datos es una colección organizada de datos que se pueden acceder, gestionar y actualizar fácilmente. Las bases de datos permiten almacenar grandes cantidades de información estructurada para su uso eficiente.*

### ***2. Sistemas de Gestión de Bases de Datos (DBMS)***

- *Un **DBMS** (Sistema de Gestión de Bases de Datos) es un software que permite interactuar con una base de datos. Algunos ejemplos de DBMS son:*

- **MySQL**
- **PostgreSQL**
- **SQLite**
- **MariaDB**
- **SQL Server**
- **Oracle Database**

**Los DBMS permiten realizar operaciones como:**

- *Creación de bases de datos.*
- *Inserción, actualización y eliminación de datos.*
- *Consultas para obtener información.*
- *Gestión de usuarios y permisos.*
- *Manejo de copias de seguridad y recuperación de datos.*

### ***3. Fundamentos de SQL (Structured Query Language)***

**SQL** *es el lenguaje utilizado para interactuar con bases de datos relacionales. SQL permite realizar diversas operaciones, desde consultas simples hasta transacciones complejas. Las principales categorías de comandos SQL son:*

---

### ***DDL (Data Definition Language) - Lenguaje de Definición de Datos***

> [!NOTE]
> **DDL** *es un subconjunto del lenguaje SQL (Structured Query Language) que se utiliza para definir y modificar la estructura de las bases de datos. Los comandos de DDL permiten crear, modificar y eliminar objetos dentro de la base de datos, como tablas, índices, vistas y esquemas.*

- *En términos técnicos, las operaciones realizadas con DDL afectan directamente a la estructura y definición de la base de datos, alterando la forma en que se almacena y organiza la información. A diferencia de DML (Data Manipulation Language), que interactúa con los datos, DDL opera a un nivel más bajo, definiendo cómo se construye el almacenamiento de los datos y cómo se gestionan las relaciones entre estos.*

---

#### ***Comandos básicos de DDL***

1. **CREATE:** *Crea un nuevo objeto en la base de datos (una tabla, vista, índice, etc.).*
   - **Sintaxis:**

     ```sql
     CREATE TABLE namTable (
       column1 TypeData [restricciones],
       column2 TypeData [restricciones],
       ...
     );
     ```

     **Ejemplo:**

     ```sql
     CREATE TABLE empleados (
       id INT PRIMARY KEY,
       nombre VARCHAR(50),
       salario DECIMAL(10, 2)
     );
     ```

   - *Bajo el capó, esto implica asignar espacio en el disco, definir la estructura de los ficheros de almacenamiento y preparar los mecanismos de acceso y búsqueda.*

2. **ALTER:** *Modifica la estructura de un objeto existente.*
   - **Sintaxis:**

     ```sql
     ALTER TABLE namTable
     ADD columna TypeData;
     ```

     **Ejemplo:**

     ```sql
     ALTER TABLE empleados
     ADD fecha_contratacion DATE;
     ```

   - *A bajo nivel, esto puede implicar la reorganización del espacio asignado a la tabla, la actualización de índices o la creación de nuevos bloques de datos.*

3. **DROP:** *Elimina un objeto de la base de datos.*
   - **Sintaxis:**

     ```sql
     DROP TABLE namTable;
     ```

     **Ejemplo:**

     ```sql
     DROP TABLE empleados;
     ```

   - *Cuando se ejecuta un `DROP`, se eliminan tanto la estructura como los datos asociados. En términos técnicos, el espacio en disco es liberado y las referencias a la tabla en los índices y relaciones son eliminadas.*

4. **TRUNCATE:** *Borra todos los datos de una tabla, pero mantiene la estructura de la misma.*
   - **Sintaxis:**

     ```sql
     TRUNCATE TABLE namTable;
     ```

   - *A bajo nivel, a diferencia de `DELETE`, `TRUNCATE` no realiza una operación de borrado fila por fila, sino que simplemente resetea las estructuras de almacenamiento, lo que lo hace mucho más rápido.*

---

#### ***Proceso a Bajo Nivel***

- **Cuando ejecutas una instrucción DDL, el sistema de gestión de bases de datos (DBMS, por sus siglas en inglés) sigue los siguientes pasos:**

1. **Análisis:** *El DBMS analiza la sintaxis y semántica de la instrucción DDL. Si hay algún error de sintaxis o restricciones de integridad que no se cumplen, se arroja una excepción y la operación es abortada.*

2. **Modificación del Catálogo:** *El catálogo de la base de datos (también llamado diccionario de datos), que guarda la descripción de los objetos (tablas, índices, vistas, etc.), se actualiza para reflejar los cambios que se quieren hacer en la estructura de la base de datos.*

3. **Asignación de Espacio:** *Dependiendo del comando, el sistema asigna o libera espacio en disco. Por ejemplo, al crear una tabla, el DBMS asigna bloques de almacenamiento y crea las estructuras necesarias para acceder a los datos.*

4. **Optimización y Reorganización:** *En comandos como `ALTER`, el DBMS puede necesitar reorganizar las estructuras existentes. Esto puede implicar la actualización de índices, regeneración de vistas o incluso el traslado de datos a nuevas estructuras.*

---

### ***DML (Data Manipulation Language) - Lenguaje de Manipulación de Datos***

> [!NOTE]
> **DML** *es un subconjunto del lenguaje SQL utilizado para manipular y gestionar los datos almacenados en una base de datos. Mientras que **DDL** define y estructura la base de datos, **DML** se enfoca en realizar operaciones sobre los datos existentes, como insertar, actualizar, eliminar y recuperar información.*

---

#### ***Principales comandos DML***

1. **INSERT:** *Inserta nuevos datos en una tabla.*
   - **Sintaxis:**

     ```sql
     INSERT INTO nameTable (columna1, columna2, ...)
     VALUES (valor1, valor2, ...);
     ```

     **Ejemplo:**

     ```sql
     INSERT INTO empleados (id, nombre, salario)
     VALUES (1, 'Daniel Pérez', 3500.00);
     ```

2. **UPDATE:** *Actualiza datos existentes en una tabla.*
   - **Sintaxis:**

     ```sql
     UPDATE nameTable
     SET columna1 = valor1, columna2 = valor2, ...
     WHERE condición;
     ```

     **Ejemplo:**

     ```sql
     UPDATE empleados
     SET salario = 4000.00
     WHERE id = 1;
     ```

3. **DELETE:** *Elimina datos de una tabla.*
   - **Sintaxis:**

     ```sql
     DELETE FROM nameTable
     WHERE condición;
     ```

     **Ejemplo:**

     ```sql
     DELETE FROM empleados
     WHERE id = 1;
     ```

4. **SELECT:** *Recupera datos de una tabla.*
   - **Sintaxis:**

     ```sql
     SELECT columna1, columna2, ...
     FROM nameTable
     WHERE condición;
     ```

     **Ejemplo:**

     ```sql
     SELECT nombre, salario
     FROM empleados
     WHERE salario > 3000;
     ```

---

### ***Diferencias entre DDL y DML***

---

#### ***DDL (Data Definition Language)***

- **Concepto:** *Se utiliza para definir y modificar la estructura de la base de datos, como tablas, índices y vistas.*
- **Comandos principales:** *`CREATE`, `ALTER`, `DROP`, `TRUNCATE`.*
- **Impacto:** *Cambia la estructura de la base de datos, afectando la manera en que se almacenan y gestionan los datos.*
- **Ejemplo:**

   ```sql
   CREATE TABLE empleados (
     id INT PRIMARY KEY,
     nombre VARCHAR(50),
     salario DECIMAL(10, 2)
   );
   ```

---

#### ***DML (Data Manipulation Language)***

- **Concepto:** *Se utiliza para manipular y gestionar los datos dentro de la estructura definida por el DDL.*
- **Comandos principales:** *`INSERT`, `UPDATE`, `DELETE`, `SELECT`.*
- **Impacto:** *Cambia el contenido de la base de datos, pero no su estructura.*
- **Ejemplo:**

   ```sql
   INSERT INTO empleados (id, nombre, salario)
   VALUES (1, 'Daniel Pérez', 3500.00);
   ```

---

### ***Resumen a bajo nivel***

- **DDL** *se enfoca en la **definición** de los objetos de la base de datos, como tablas o índices, y afecta directamente al almacenamiento físico y la estructura lógica de la base de datos.*
- **DML** *trabaja sobre los **datos** existentes, permitiendo la inserción, modificación, eliminación y consulta de los mismos.*

*Mientras que DDL altera la estructura de almacenamiento (como la creación o eliminación de tablas), DML se utiliza para gestionar la información almacenada en esas estructuras.*

---

#### ***Las bases de datos `relacionales` y `no relacionales` tienen diferentes enfoques y casos de uso***

### ***Bases de datos relacionales (SQL):***

- **Estructura:** *Datos organizados en tablas con filas y columnas.*
- **Uso:** *Ideal cuando se necesita mantener relaciones estrictas entre datos (ej. aplicaciones financieras).*
- **Ejemplos:** *MySQL, PostgreSQL.*

### ***Bases de datos no relacionales (NoSQL):***

- **Estructura:** *Datos almacenados en documentos, clave-valor, grafos o columnas anchas.*
- **Uso:** *Adecuado para grandes volúmenes de datos sin esquema fijo o cuando la flexibilidad y escalabilidad son clave (ej. redes sociales, análisis en tiempo real).*
- **Ejemplos:** *MongoDB, Redis.*

*Ambas opciones se usan según el tipo de datos, la relación entre ellos y los requisitos de escalabilidad.*
