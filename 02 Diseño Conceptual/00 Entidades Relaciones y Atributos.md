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

Github <https://github.com/jgraph/drawio-desktop>
Github release  <https://github.com/jgraph/drawio-desktop/releases/tag/v24.7.8>
Instalar <https://github.com/jgraph/drawio-desktop/releases/download/v24.7.8/drawio-amd64-24.7.8.deb>

sudo dpkg -i drawio-amd64-24.7.8.deb

drawio --version
Checking for beta autoupdate feature for deb/rpm distributions
Found package-type: deb
24.7.8

drawio &

arch linux recurso <https://snapcraft.io/install/drawio/arch>

```bash
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si

sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install drawio
```

---

Luego de crear las entidades hay que ver como se relacionan

luego hay que ver los atributos y identificar cual son unicos osea que no se pueden repetir si no existe el atributo lo creamos por ejemplo el id

un usuario puede crear una relacion de uno a muchos
existen varias relaciones

de uno a uno
y esta muchos a muchos

cuantas ocurrencia de una entidada puede haber para cada una de las entidades que participa en la relacion

cuantas tareas puede crear el usuario un usuario puede crear muchas tareas
cuantas tareas como minimo puede crear el usuario como minimo 0 por que al crear el usuario no tendra trarea asignada y como minimo como no sabemos y no lo limitamos hacemos n

como participa la entidad tarea
una sola tarea por cuantas usuarios puede ser creada
como minimo una sola tarea puede ser creada por un usuario
y como maximo una sola tarea puede ser creada por un solo usuario
cada tarea pertenece a un unico usuario en una relacion de 1 a muchos
cada tarea pertence a un unico usuario
