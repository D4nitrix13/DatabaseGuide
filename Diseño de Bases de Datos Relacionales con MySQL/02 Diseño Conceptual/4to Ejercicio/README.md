<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Jerarquías de Generalización***

---

## ***¿Qué es una jerarquía de generalización?***

- *Una **jerarquía de generalización** es un concepto utilizado en modelado de datos para representar relaciones entre entidades y sus subentidades, en las cuales las subentidades heredan atributos y comportamientos de una entidad general. En términos simples, es una forma de organizar datos donde se define una entidad padre (general) y entidades hijas (específicas) que comparten características comunes con la entidad padre pero también tienen atributos propios.*

---

### ***Características clave***

1. **Entidad general (Superentidad):** *Representa una categoría amplia, que agrupa entidades más específicas. Por ejemplo, un seguro puede ser un tipo de seguro de propiedad o de vehículo.*

2. **Subentidades (Entidades derivadas):** *Estas son entidades que heredan los atributos y comportamientos de la superentidad, pero agregan características específicas. Por ejemplo, los seguros de propiedad tienen atributos como área y dirección, mientras que los seguros de vehículos tienen atributos como el número de matrícula y el precio.*

3. **Jerarquía Total o Parcial:** *Define si todas las instancias de la entidad padre deben pertenecer a alguna subentidad (total) o si pueden existir instancias sin pertenecer a una subentidad (parcial).*

4. **Exclusividad o Superposición:** *Indica si una instancia puede pertenecer a una o varias subentidades al mismo tiempo. Si es exclusiva, una instancia pertenece a una única subentidad; si es superpuesta, puede pertenecer a más de una subentidad.*

---

## ***Ejercicio 4: Seguros***

**Descripción del problema:**

- *Nuestra empresa necesita almacenar datos sobre clientes y los seguros que han adquirido. De cada cliente, queremos saber el número de su documento de identidad y su nombre completo.*

---

### ***Seguros***

- *Los seguros pueden cubrir gastos de reparación en caso de daños en **propiedades** (casas, apartamentos, etc.) o en **vehículos**.*
- *Para las propiedades, almacenaremos los metros cuadrados totales y la dirección (compuesta por ciudad, calle, número, y unidad).*
- *Para los vehículos, almacenaremos el precio de compra y el número de matrícula.*
- *El cliente puede elegir el porcentaje de los gastos totales de reparación que cubrirá el seguro al contratarlo (ej. 40%). Este porcentaje es clave para calcular el coste anual del seguro.*

---

### ***Entidades y Relaciones***

---

#### ***Entidad Client***

- **Atributos:**
  - **`id_document_number`:** *Número de documento de identidad del cliente.*
  - **`name`:** *Nombre completo del cliente.*

---

#### ***Entidad Insurance***

- **Atributos:**
  - **`id`:** *Identificador único del seguro.*
  - **`percentage_covered`:** *Porcentaje de cobertura seleccionado por el cliente.*
  - **`start_date`:** *Fecha de inicio del seguro.*
  - **`end_date`:** *Fecha de finalización del seguro.*
  - **`annual_cost`:** *Costo anual del seguro.*

---

#### ***Relación Acquires (Cliente adquiere seguro)***

- **Relación entre** *`Insurance` y `Client`.*
- **Cardinalidad:**
  - *Un cliente puede adquirir 0 o más seguros. (0,n)*
  - *Cada seguro está vinculado a un único cliente. (1,1)*
  - *Es una relación de **uno a muchos**.*

---

### ***Jerarquía de Generalización***

- *En este caso, los seguros pueden ser de **propiedad** o de **vehículos**, y ambos heredan de la entidad general `Insurance`.*

---

#### ***Subentidad Property***

- **Atributos:**
  - **`area`:** *Metros cuadrados de la propiedad.*
  - **`address`:** *Dirección de la propiedad, compuesta por:*
    - **`city`:** *Ciudad.*
    - **`street`:** *Calle.*
    - **`number`:** *Número (con cardinalidad 0,1, es decir, puede ser nulo).*
    - **`unit`:** *Unidad.*

---

#### ***Subentidad Vehicle***

- **Atributos:**
  - **`plate_number`:** *Número de matrícula del vehículo.*
  - **`price`:** *Precio de compra del vehículo.*

---

### ***Cardinalidad en la Jerarquía***

---

#### ***`Total` vs `Parcial`***

- *En una jerarquía de **generalización total** (T), cada instancia de la entidad general debe pertenecer a una de las subentidades. En este ejemplo, un seguro debe ser de propiedad o de vehículo, sin excepciones.*
- *En una jerarquía de **generalización parcial** (P), no todas las instancias de la entidad general necesitan pertenecer a una subentidad. Un ejemplo sería si existieran seguros genéricos que no encajen en ninguna subentidad específica.*

---

#### ***Exclusividad vs. Superposición***

- **Exclusivo (E):** *Cada seguro pertenece a una única subentidad. En este caso, un seguro puede ser de **propiedad** o de **vehículo**, pero no de ambos al mismo tiempo.*
- **Superpuesto (S):** *Una instancia podría pertenecer a más de una subentidad. Por ejemplo, si existieran seguros que cubrieran tanto propiedades como vehículos simultáneamente, sería una jerarquía superpuesta.*

---

### ***Ejemplo de Jerarquía Parcial y Superpuesta***

- *Imaginemos un caso donde existe una entidad **Ordenador**, con dos subentidades: **Ordenador Gaming** y **Ordenador de Oficina**. En este escenario:*

- *Algunos ordenadores pueden ser solo de oficina, otros solo de gaming, y algunos pueden ser ambos (superpuestos).*
- *Además, puede haber ordenadores que no pertenezcan a ninguna subentidad (parcial), ya que pueden ser genéricos, no especializados ni en gaming ni en oficina.*

---

### ***Importante***

- *En muchos casos no es necesario que las subentidades tengan un identificador propio, ya que heredan el identificador de la entidad padre. Esto es un aspecto importante de las **jerarquías de generalización**.*

*En una **jerarquía de generalización**, las **subentidades no necesitan un identificador propio** porque ya heredan el **id** de la entidad padre (la superentidad). Esto sucede porque el identificador único de la entidad padre es suficiente para diferenciar instancias, ya que las subentidades son simplemente especializaciones de la entidad general.*

- *Por ejemplo, si tenemos una entidad general `Insurance` con un identificador `id`, las subentidades `Property` y `Vehicle` no necesitan tener un **id** propio, ya que heredan el identificador de `Insurance`. Esto mantiene la consistencia de los datos y evita redundancias.*

- *En resumen, en una jerarquía de generalización, las subentidades suelen **no tener identificador propio**, ya que heredan el identificador de la entidad general, lo que simplifica el modelo y asegura que cada instancia sea única en todo el sistema.*

*![Image JerarquíasDeGeneralización](/Images/JerarquíasDeGeneralización.png "/Images/JerarquíasDeGeneralización.png")*
