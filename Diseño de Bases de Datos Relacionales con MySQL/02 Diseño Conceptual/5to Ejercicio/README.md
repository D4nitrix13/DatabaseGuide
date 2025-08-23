<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Entidades Débiles e Identificadores Compuestos***

---

## ***Ejercicio 5: Departamentos y Empleados***

> [!NOTE]
> *Nuestra empresa cuenta con varias oficinas situadas en edificios diferentes, y en cada una de ellas se encuentran distintos departamentos. Los edificios tienen un número asociado que es único dentro de la misma ciudad, pero puede repetirse en edificios de ciudades distintas.*

- **Queremos almacenar información sobre los departamentos: su nombre, que es único, su número de departamento, que también es único, y su presupuesto anual. Además, queremos saber en qué departamento trabaja cada empleado. Cada empleado tiene un número único dentro de su departamento, aunque este número puede repetirse para empleados de distintos departamentos. Finalmente, también necesitamos almacenar qué empleados están a cargo de otros empleados.**

---

### ***Entidades y Relaciones***

---

#### ***Entidad BUILDING (Edificio)***

- **Atributos:**
  - *`city` (Ciudad): Representa la ciudad donde está ubicado el edificio.*
  - *`number` (Número): Número del edificio. En combinación con `city`, estos atributos forman un **identificador compuesto** que es único para cada edificio.*

---

#### ***Entidad DEPARTMENT (Departamento)***

- **Atributos:**
  - *`Number` (Número de Departamento): Identificador único del departamento.*
  - *`Name` (Nombre del Departamento): Nombre único.*
  - *`Annual_Budget` (Presupuesto Anual): El presupuesto anual asignado al departamento.*

---

#### ***Relación IS_LOCATED** (Está ubicado en)*

- *Relaciona las entidades `BUILDING` y `DEPARTMENT`.*
- **Cardinalidad:**
  - *Un edificio puede albergar **de 1 a n** departamentos. (1,n)*
  - *Un departamento está ubicado en **exactamente un edificio**. (1,1)*
  - *Es una relación de **uno a muchos** (1:n).*

---

#### ***Entidad EMPLOYEE (Empleado)***

- **Atributos:**
  - *`Number` (Número de Empleado): Número único del empleado **dentro de su departamento**, pero este número puede repetirse en otros departamentos. El identificador de un empleado es un **identificador compuesto**, ya que se forma combinando el número del empleado con el identificador del departamento al que pertenece.*

---

#### ***Relación WORKS** (Trabaja en)*

- *Relaciona `EMPLOYEE` y `DEPARTMENT`.*
- **Cardinalidad:**
  - *Un departamento tiene **al menos 1 empleado y como máximo n empleados**. (1,n)*
  - *Un empleado trabaja **en un único departamento**. (1,1)*
  - *Es una relación de **uno a muchos** (1:n).*

---

### ***Concepto de Entidad Débil***

- **Entidad débil:** *Es una entidad que no tiene un identificador propio y depende de otra entidad (su entidad fuerte) para ser identificada. En este caso, la entidad `EMPLOYEE` puede considerarse débil, ya que su identificador está compuesto por el número de empleado y el identificador del departamento. No puede identificarse por sí misma sin referencia a la entidad `DEPARTMENT`.*
  
- **Entidad fuerte:** *Es una entidad que puede identificarse por sí sola sin depender de otra. Un ejemplo es la entidad `DEPARTMENT`, ya que tiene su propio identificador (`Number` y `Name`), único y suficiente para distinguirla de otras.*

---

#### ***Consideraciones sobre entidades débiles***

> [!CAUTION]
> *Aunque no es recomendable que una entidad no tenga identificador propio, en sistemas antiguos de bases de datos, las entidades débiles eran comunes debido a las limitaciones de espacio en disco. Hoy en día, con el avance en la capacidad de almacenamiento, es más eficiente y seguro que cada entidad tenga su propio identificador único.*

---

### ***Relación IS_IN_CHARGE_OF (Está a cargo de)***

- *Esta relación conecta la entidad `EMPLOYEE` consigo misma, permitiendo modelar jerarquías de supervisión donde un empleado puede estar a cargo de otros empleados.*

- **Cardinalidad**:
  - *Un empleado supervisor puede estar a cargo de **al menos 1 empleado y como máximo n empleados**. (1,n)*
  - *Un empleado solo puede ser supervisado por **un único supervisor**. (1,1)*
  - *Es una relación de **uno a muchos** (1:n).*

---

### ***Resumen Visual (Representación en Diagrama Chen)***

- *En este diagrama, se muestra cómo las entidades `BUILDING`, `DEPARTMENT` y `EMPLOYEE` están relacionadas, destacando la **entidad débil** (`EMPLOYEE`) y las relaciones jerárquicas entre los empleados mediante la relación **IS_IN_CHARGE_OF**.*

*![/Image EntidadesDébilesEIdentificadoresCompuestos](/Images/EntidadesDébilesEIdentificadoresCompuestos.png "/Images/EntidadesDébilesEIdentificadoresCompuestos.png")*
