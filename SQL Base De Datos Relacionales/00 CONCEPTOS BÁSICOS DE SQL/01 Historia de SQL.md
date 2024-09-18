<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Historia de SQL***

**Orígenes y Desarrollo Temprano:**

1. **Década de 1970:**
   - **Modelo Relacional:** *En 1970, Edgar F. Codd, un científico de IBM, publicó un influyente artículo titulado "A Relational Model of Data for Large Shared Data Banks". Este artículo introdujo el concepto de bases de datos relacionales, basadas en álgebra relacional y teoría de conjuntos. El modelo relacional ofrecía una forma estructurada y eficiente de almacenar y manipular datos.*

2. **IBM y System R:**
   - *- En los años 70, IBM comenzó a desarrollar un sistema de base de datos relacional llamado System R, que implementaba el modelo relacional propuesto por Codd. Durante el desarrollo de System R, se creó un lenguaje de consulta para interactuar con la base de datos, que más tarde se conoció como SQL (Structured Query Language).*

**Evolución y Estándares:**

1. **1986:**
   - *La American National Standards Institute (ANSI) adoptó SQL como un estándar oficial para bases de datos relacionales. Este primer estándar se conoció como SQL-86 o SQL1.*

2. **1992:**
   - *Se lanzó la versión SQL-92, que incorporó nuevas características y mejoras sobre el estándar anterior. SQL-92 introdujo nuevas funcionalidades como la capacidad de manejar transacciones y más flexibilidad en la definición de datos.*

3. **1999:**
   - *Se publicó el estándar SQL:1999 (también conocido como SQL3), que introdujo características avanzadas como el soporte para programación orientada a objetos, procedimientos almacenados, y disparadores (triggers). Esta versión también amplió el lenguaje para incluir soporte para tipos de datos más complejos y consultas más sofisticadas.*

4. **2003, 2006 y Más Allá:**
   - *SQL ha continuado evolucionando con nuevas versiones, incluyendo SQL:2003, SQL:2006, y versiones más recientes que han agregado soporte para XML, funciones analíticas avanzadas, y mejoras en la gestión de datos. Cada versión ha buscado mejorar la funcionalidad, interoperabilidad, y desempeño del lenguaje.*

**Impacto y Adopción:**

1. **Años 2000 y 2010:**
   - *SQL se consolidó como el lenguaje estándar para la gestión de bases de datos relacionales. Su adopción se extendió a una variedad de aplicaciones, desde sistemas empresariales hasta aplicaciones web y móviles.*

2. **Era Contemporánea:**
   - *Hoy en día, SQL sigue siendo una herramienta fundamental en la administración de bases de datos, tanto en sistemas tradicionales como en nuevas tecnologías como bases de datos en la nube y sistemas distribuidos. La capacidad de SQL para adaptarse y evolucionar con las necesidades cambiantes del almacenamiento de datos demuestra su duradera relevancia en el mundo de la tecnología.*

- *SQL ha tenido un impacto significativo en la forma en que las organizaciones gestionan y consultan datos, y su desarrollo ha sido crucial para el avance en la tecnología de bases de datos.*

## ***La primera base de datos en desarrollarse fue el "Sistema de Gestión de Bases de Datos de IBM" `(IBM Information Management System, IMS)`.***

**Contexto Histórico:**

1. **IMS:**
   - **Lanzamiento:** *IMS fue desarrollado por IBM y se lanzó en 1968.*
   - **Propósito:** *Fue creado para gestionar datos en el contexto de las aplicaciones de procesamiento de transacciones de gran volumen, como los sistemas de control de inventario y los sistemas de facturación.*
   - **Modelo de Datos:** *IMS utiliza un modelo de datos jerárquico, donde los datos se organizan en una estructura de árbol, con una jerarquía clara de registros. Aunque este modelo es diferente al modelo relacional que se popularizó más tarde, IMS fue fundamental en el desarrollo de la tecnología de bases de datos.*

2. **Modelo Relacional:**
   - **Desarrollo Posterior:** *Aunque IMS fue pionero en la gestión de bases de datos, el modelo relacional propuesto por Edgar Codd en 1970 revolucionó la forma en que los datos eran organizados y consultados. El modelo relacional introdujo un enfoque basado en tablas y relaciones entre ellas, lo que facilitó consultas más flexibles y eficientes.*

3. **Sistemas Relacionales:**
   - **System R:** *En los años 70, IBM desarrolló System R, el primer sistema de base de datos relacional, que implementó el modelo propuesto por Codd y llevó al desarrollo del lenguaje SQL.*

- *IMS, siendo uno de los primeros sistemas de bases de datos, estableció las bases para la evolución de la gestión de datos, mientras que el modelo relacional y SQL marcaron un cambio significativo en la forma en que se gestionaban las bases de datos a medida que la tecnología avanzaba.*

### ***SQL fue desarrollado por IBM. El desarrollo del lenguaje SQL (Structured Query Language) fue parte del proyecto de IBM conocido como **System R**. Este proyecto comenzó en los años 70 con el objetivo de crear un sistema de base de datos relacional basado en el modelo propuesto por Edgar F. Codd.***

**Detalles Clave:**

- **Equipo de Desarrollo:** *El equipo de IBM que trabajó en System R, incluyendo a Donald D. Chamberlin y Raymond F. Boyce, fue responsable de desarrollar SQL. Chamberlin y Boyce diseñaron el lenguaje SQL para que facilitara la consulta y manipulación de datos en bases de datos relacionales.*
- **Propósito de SQL:** *SQL se diseñó para permitir a los usuarios interactuar con las bases de datos relacionales mediante un lenguaje de consulta estructurado y estandarizado. Esto facilitó la gestión de datos y permitió realizar consultas más complejas de manera más eficiente que los enfoques anteriores basados en archivos.*
- **Primera Implementación:** *La primera implementación de SQL se realizó en el contexto del sistema System R, y el lenguaje fue adoptado como estándar por ANSI en 1986.*

- *El desarrollo de SQL por IBM y la implementación en System R jugaron un papel crucial en la evolución de las bases de datos relacionales y en la estandarización de las prácticas de gestión de datos.*

---

> [!NOTE]
> *`System R` es un `sistema de gestión de bases de datos relacional (DBMS)`. Desarrollado por IBM en los años 70, System R fue uno de los primeros sistemas en implementar el modelo relacional de bases de datos propuesto por Edgar F. Codd y en utilizar el lenguaje SQL para consultar y manipular datos. System R fue crucial para el desarrollo del SQL y la popularización de las bases de datos relacionales.*

---

> [!NOTE]
> *`IMS (Information Management System)` es un `sistema de gestión de bases de datos jerárquico (DBMS)`. Desarrollado también por IBM y lanzado en 1968, IMS utiliza un modelo de datos jerárquico para organizar y gestionar datos. En este modelo, los datos se estructuran en una jerarquía de registros, similar a un árbol, donde cada registro puede tener uno o más registros secundarios. Aunque IMS es un DBMS como System R, su modelo de datos es fundamentalmente diferente y se centra en la estructura jerárquica, mientras que System R se basa en el modelo relacional.*

**Resumen:**

- **System R:** *DBMS relacional, implementa el modelo relacional y utiliza SQL.*
- **IMS:** *DBMS jerárquico, utiliza un modelo de datos jerárquico para organizar la información.*

### ***IMS (Information Management System) es un sistema de gestión de bases de datos jerárquico (DBMS) desarrollado por IBM. A diferencia de los sistemas de bases de datos relacionales, IMS utiliza un modelo de datos jerárquico para organizar y gestionar datos.***

**SQL y IMS:**

> [!NOTE]
> **IMS, siendo un sistema jerárquico, no utilizaba SQL originalmente. SQL fue desarrollado para bases de datos relacionales y no se aplica directamente a sistemas jerárquicos como IMS. En lugar de SQL, IMS utilizaba su propio conjunto de herramientas y lenguajes para interactuar con la base de datos:**

1. **`DL/I` (Data Language/I):**
   - **Descripción:** *`DL/I` es el lenguaje de consulta y manipulación de datos utilizado en IMS. Fue diseñado específicamente para trabajar con el modelo jerárquico de IMS.*
   - **Funcionalidades:** *`DL/I` permite realizar operaciones de inserción, actualización, eliminación y consulta de datos en una base de datos IMS. Se enfoca en manejar la estructura jerárquica y acceder a los datos de manera eficiente en este modelo.*

   > [!TIP]
   > *En el nombre DL/I, la /I no tiene un significado específico en sí misma; más bien, el nombre Data Language/I es una convención de nomenclatura que incluye el carácter /I como parte del nombre del lenguaje. La /I se emplea simplemente para diferenciar este lenguaje de otros lenguajes similares y para identificar su relación con el sistema IMS.*

**Resumen:**

- **IMS:** *Un DBMS jerárquico desarrollado por IBM.*
- **SQL de IMS:** *IMS no utilizaba SQL. En su lugar, utilizaba **`DL/I`** como el lenguaje de consulta y manipulación de datos.*

- *SQL se convirtió en el estándar para las bases de datos relacionales, mientras que `DL/I` sigue siendo relevante para sistemas que utilizan el modelo jerárquico de IMS.*
