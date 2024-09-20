<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Entidades Relaciones y atributos***

- *El diagrama de Chen es un tipo de modelo de entidad-relación (ER) utilizado en el diseño de bases de datos. Este tipo de diagrama se usa para representar de manera gráfica las entidades, relaciones y atributos de un sistema de base de datos. Fue propuesto por el profesor Peter Chen en 1976 y es fundamental en la creación de modelos conceptuales para bases de datos relacionales.*

---

## ***Componentes del Diagrama de Chen***

1. **Entidades:** *Representan objetos o conceptos del mundo real que tienen una existencia independiente. En un diagrama de Chen, las entidades se representan con rectángulos.*

2. **Atributos:** *Son las propiedades o características de las entidades. Se representan con óvalos conectados a sus respectivas entidades.*

3. **Relaciones:** *Indican cómo están asociadas las entidades entre sí. Se representan con rombos conectados a las entidades implicadas en la relación.*

4. **Cardinalidades:** *Definen la cantidad de instancias de una entidad que pueden estar asociadas con instancias de otra entidad. Se representan mediante anotaciones en las líneas de relación.*

- **Representación de Cardinalidad**

- *La cardinalidad se refiere a la cantidad de instancias de una entidad que pueden estar asociadas con instancias de otra entidad en una relación. Existen varias formas de representar la cardinalidad:*

1. **Notación de Dos Puntos:**
   - **1:1:** *Indica que una instancia de la primera entidad se relaciona con exactamente una instancia de la segunda entidad, y viceversa.*

2. **Notación de Paréntesis:**
   - **(1,1):** *Representa la misma relación, especificando que se requiere exactamente una instancia de cada entidad en la relación.*

3. **Notación de Fracción:**
   - **1/1:** *Otra forma de mostrar que cada instancia de una entidad se asocia con una única instancia de la otra entidad.*

4. **Otras Notaciones:**
   - **1:N (uno a muchos):** *Una instancia de la primera entidad puede relacionarse con varias instancias de la segunda.*
   - **M:N (muchos a muchos):** *Varias instancias de la primera entidad pueden relacionarse con varias instancias de la segunda.*

*Cada una de estas notaciones tiene su utilidad en el diseño de diagramas de entidad-relación, y la elección de una sobre otra puede depender del contexto o de las preferencias del diseñador.*

- *![Image CardinalidadExample](/Images/CardinalidadExample.jpg "/Images/CardinalidadExample.jpg")*

---

### ***Uso del Diagrama de Chen***

- **Diseño Conceptual:** *Ayuda a crear una representación abstracta del sistema de base de datos sin preocuparse por los detalles de implementación.*
- **Comunicación:** *Facilita la comunicación entre los diseñadores de bases de datos y los usuarios finales, permitiendo una comprensión compartida del modelo.*
- **Documentación:** *Sirve como una herramienta de documentación para el diseño de la base de datos.*

---

### ***Editores para Diagramas de Chen***

1. **draw.io (ahora diagrams.net):** *Una herramienta gratuita en línea para crear diagramas, incluidos los diagramas ER.*
   - [diagrams.net](https://www.diagrams.net/ "https://www.diagrams.net/")

- *Estos editores proporcionan interfaces gráficas que facilitan la creación y modificación de diagramas ER, lo que permite a los diseñadores de bases de datos trabajar de manera más eficiente.*

---

### ***Instalación de Draw.io***

**GitHub:** *[https://github.com/jgraph/drawio-desktop](https://github.com/jgraph/drawio-desktop "https://github.com/jgraph/drawio-desktop")*
**GitHub Release:** *[https://github.com/jgraph/drawio-desktop/releases/tag/v24.7.8](https://github.com/jgraph/drawio-desktop/releases/tag/v24.7.8 "https://github.com/jgraph/drawio-desktop/releases/tag/v24.7.8")*
**Descarga de instalación:** *[drawio-amd64-24.7.8.deb](https://github.com/jgraph/drawio-desktop/releases/download/v24.7.8/drawio-amd64-24.7.8.deb "https://github.com/jgraph/drawio-desktop/releases/download/v24.7.8/drawio-amd64-24.7.8.deb")*

**Para instalar, utiliza el siguiente comando en la terminal:**

```bash
sudo dpkg -i drawio-amd64-24.7.8.deb
```

**Para verificar la instalación, ejecuta:**

```bash
drawio --version
```

- *Salida esperada:*

  ```bash
  Checking for beta autoupdate feature for deb/rpm distributions
  Found package-type: deb
  24.7.8
  ```

- **Para abrir la aplicación:**

```bash
drawio >/dev/null 2>&1 &
```

**Para Arch Linux:**

- *Consulta el recurso en Snapcraft: [https://snapcraft.io/install/drawio/arch](https://snapcraft.io/install/drawio/arch "https://snapcraft.io/install/drawio/arch")*

**Para instalar desde AUR, sigue estos pasos:**

```bash
git clone https://aur.archlinux.org/snapd.git --depth=1
cd ./snapd
makepkg -si

sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install drawio
```

---

### ***Ejercicio 1: Lista de Tareas***

**Objetivo:** *Crear una aplicación donde cada usuario tenga una lista para añadir tareas y marcarlas como completadas. Los usuarios se registrarán mediante correo electrónico y contraseña, y se almacenará su nombre completo.*

#### ***Entidades y Relaciones:***

1. **Entidades:**
   - *Usuario: atributos como correo electrónico, contraseña, nombre completo.*
   - *Tarea: atributos como título, descripción, estado (completada/no completada), y fecha límite.*

2. **Relaciones:**
   - *Un usuario puede tener **uno a muchos** (1:N) tareas.*
   - *Cada tarea pertenece a **un único usuario**.*
   - *Una tarea puede ser creada por **un solo usuario**.*

---

#### ***Atributos Únicos:***

- *Identificadores como `id` deben ser únicos.*

---

#### ***Cardinalidades:***

- **Tareas creadas por un usuario:**
  - *Mínimo: 0 (el usuario puede no tener tareas al registrarse).*
  - *Máximo: N (sin límite superior).*

- **Relación entre tareas y usuarios:**
  - *Cada tarea pertenece a **un único usuario** (1:1).*
  - *Una tarea no puede ser creada por más de un usuario.*

*![/Images/ImageRelacionesAtributos](/Images/ImageRelacionesAtributos.png "/Images/ImageRelacionesAtributos.png")*

---

### ***Combinación de Atributos para Identificadores Únicos***

- *En ocasiones, la combinación de dos o más atributos puede generar un identificador único para una entidad. Este enfoque es útil cuando ningún atributo individual es lo suficientemente distintivo por sí solo. Al fusionar los valores de estos atributos, se crea un identificador que garantiza la unicidad, permitiendo así una identificación precisa de cada registro en una base de datos.*

- *Por ejemplo, en una tabla de usuarios, la combinación de los atributos "nombre" y "apellido" podría formar un identificador único, siempre que no existan duplicados. Esto es especialmente valioso en situaciones donde los identificadores naturales no son adecuados por sí mismos.*

---

### ***Notas sobre los Ficheros Generados por Draw.io***

- **`.bkp`:** *Este tipo de archivo representa una copia de seguridad (backup) del diagrama. Se utiliza para restaurar el estado anterior del archivo en caso de que se necesite recuperar información perdida o revertir cambios no deseados.*

- **`.dtmp`:** *Este archivo es un archivo temporal creado por Draw.io durante el proceso de edición. Su propósito es almacenar información provisional mientras trabajas en el diagrama. Normalmente, estos archivos se eliminan automáticamente al cerrar la aplicación, pero pueden ser útiles en caso de un cierre inesperado o error.*
