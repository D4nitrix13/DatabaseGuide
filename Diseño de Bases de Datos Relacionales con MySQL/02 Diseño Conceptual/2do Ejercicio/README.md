<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Relaciones Uno a Uno y Atributos Compuestos***

---

## ***Ejercicio 2: Taxis***

> [!NOTE]
> *Queremos almacenar información sobre los taxistas (DRIVER) y los vehículos (VEHICLE) que conducen en nuestra provincia. De cada taxista queremos saber su nombre (Name) y número de teléfono (Phone Number), y de cada vehículo queremos saber su marca (Brand), modelo (Model) y número de matrícula (Plate Number). Además, necesitamos almacenar varias imágenes (Image) del vehículo para tener un seguimiento de los accidentes o desperfectos.*

- **En la provincia existen varios garajes/parkings (PARKING) donde se estacionarán los vehículos una vez terminada la jornada laboral. Cada parking tiene una dirección (Address) y nos interesa saber qué vehículos están estacionados en los parkings en un momento dado.**
- **Cada vehículo solo puede ser utilizado al mismo tiempo por un taxista, y nuestra aplicación permitirá definir el periodo en el cual dicho taxista conduce el vehículo, por ejemplo, desde el 12 de abril de 2022 hasta el 16 de octubre de 2022.**

---

### ***Traducción de Términos***

- *DRIVER (CONDUCTOR)*
- *VEHICLE (VEHÍCULO)*
- *PARKING (GARAGE/PARKING)*
- *DRIVES (CONDUCTORES)*

---

### ***Sintaxis de Cardinalidad (min, max)***

**Entidades:**

- *DRIVER - VEHICLE*

**Relaciones:**

- **La relación entre un conductor (DRIVER) y el vehículo (VEHICLE) que conduce se puede representar como:**
  
  **DRIVER -> DRIVES (CONDUCE) -> VEHICLE**

---

### ***¿Qué es la cardinalidad?:***

*En modelado de datos (ER, UML), la **cardinalidad** describe **cuántas instancias de una entidad pueden (y deben) asociarse** con una instancia de otra entidad a través de una relación. Responde dos preguntas para cada lado de la relación:*

- **Mínimo (participación):** *¿cuántas instancias como mínimo? (0 = opcional, 1 = obligatoria)*
- **Máximo:** *¿cuántas instancias como máximo? (1, N, o un número fijo como 13)*

## **Notaciones más usadas**

- **Pies de cuervo (crow’s foot):** *`0..1`, `1..1`, `0..*`, `1..*`*
- **Chen (min,max):** *(0,1), (1,1), (0,N), (1,N)*
- **Simplificada:** *1:1, 1:N, M:N (o N:M)*
- **Específicas:** *1:13, 2:5, etc. (rara vez se usan, pero existen)*

- **La cardinalidad se deduce de la información proporcionada:**
  - **Cada vehículo solo puede ser utilizado al mismo tiempo por un taxista.**
    - *Un solo vehículo puede estar relacionado con un taxista, lo que se expresa como (1, 1).*
    - *Sin embargo, al registrar un vehículo, puede que no tenga asignado un conductor, lo que sería (0, 1).*
  
  - **Un solo taxista conduce un vehículo:**
    - *Mínimo: 1 taxista debe conducir un vehículo, por lo que es (1, 1).*
    - *Al registrarse, un taxista puede no tener asignado un vehículo, lo que sería (0, 1).*

> *Nota: Estos son ejemplos básicos y pueden variar según el contexto.*

---

### **Entidad Parking:**

- **Además, los garajes/parkings donde se estacionan los vehículos se modelan como una nueva entidad:**

**Relación:**

```bash
VEHICLE -> PARK -> PARKING
```

---

### ***Cardinalidad***

- **Un vehículo puede estar estacionado en un parking:**
  - *Mínimo: 1 parking (1, 1).*
  - *Al registrar un vehículo, puede que no se le asigne un parking, lo que sería (0, 1).*
  
- *Un parking puede tener:*
  - *Mínimo: 0 vehículos, lo que se expresa como (0, n).*

---

### ***Atributos:***

**De cada taxista queremos saber su nombre y número de teléfono:**

**DRIVER:**

- *ID*
- *Name (Nombre)*
- *Phone_Number (Número de Teléfono)*

**De cada vehículo queremos saber su marca, modelo y número de matrícula:**

**VEHICLE:**

- *Plate_Number (Número de Matrícula, que será el identificador único)*
- *Brand (Marca)*
- *Model (Modelo)*

**Atributo de Imágenes:**

- *Para el seguimiento de accidentes o desperfectos, necesitamos almacenar imágenes:*

**Image:**

- *Cardinalidad: (1, n) - Mínimo 1 imagen y máximo n imágenes.*
- *Si no se especifica cardinalidad, se asume (1, 1), es decir, el atributo es obligatorio y no puede ser nulo.*

> *Cuando hablamos de la cardinalidad de un atributo, no nos referimos a los posibles valores. Por ejemplo, si pedimos la edad del conductor, esta puede tener un rango (20, 35), lo que indica que el conductor solo tiene una edad, pero puede estar en un rango de valores.*

---

### ***Atributo Compuesto:***

**Cada parking tiene una dirección.**

**Atributo:**

- *Address (Dirección) – un poco genérico, ya que se compone de varios elementos:*
  - *ID*
  - *Address 1 -> City (Ciudad), Street (Calle), Number (Número)*

**Un atributo compuesto puede tener cardinalidad, dependiendo de cómo se defina.**

---

### ***Fechas de Conducción:***

**Nuestra aplicación permitirá definir el periodo en el cual un taxista conduce un vehículo.**

- **Para modelar esto, debemos tener:**
  - *Start_Date (Fecha de Inicio)*
  - *End_Date (Fecha de Fin)*

- **Dado que tanto el vehículo como el conductor tienen relación con estas fechas, debemos incluir estos atributos como parte de la relación:**

**DRIVES:**

- *Start_Date*
- *End_Date*

*![Image RelacionesUnoAUnoAtributosCompuestos](/Images/RelacionesUnoAUnoAtributosCompuestos.png "/Images/RelacionesUnoAUnoAtributosCompuestos.png")*

- *[Recurso](https://ewebik.com/base-de-datos/modelo-entidad-relacion "https://ewebik.com/base-de-datos/modelo-entidad-relacion")*
