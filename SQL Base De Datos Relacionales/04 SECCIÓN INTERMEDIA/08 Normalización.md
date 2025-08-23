<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Normalización en SQL***

- **¿Qué es la Normalización?**

- *La normalización es un proceso en la modelación de bases de datos relacionales que tiene como objetivo reducir la redundancia de datos y mejorar la integridad y eficiencia de la base de datos. Esto se logra organizando los datos en varias tablas y definiendo relaciones entre ellas, de modo que los datos repetidos o dependientes se eliminen y se mantengan en una estructura más lógica y manejable. La normalización también ayuda a prevenir problemas como las anomalías de inserción, actualización y eliminación.*

- *La normalización se divide en varias **formas normales (Normal Forms, NF)**, que son reglas o directrices que una tabla debe cumplir. Las formas normales más comunes son la Primera, Segunda y Tercera Forma Normal (1NF, 2NF y 3NF), pero existen más niveles (4NF, 5NF) para situaciones de mayor complejidad. Cada nivel de normalización incrementa la estructura y organización de los datos.*

---

## ***Primera Forma Normal (1NF)***

**¿En qué consiste la Primera Forma Normal (1NF)?**

- *La Primera Forma Normal establece que una tabla debe tener celdas con datos atómicos, lo que significa que cada celda debe contener un solo valor, no conjuntos de valores. Además, todos los valores en una columna deben ser del mismo tipo de datos.*

---

### ***Ejemplo de una tabla en 1NF***

- **Considera una tabla llamada `Empleados` que almacena información básica de los empleados:**

**Correcto:**

| *ID* | *Nombre*   | *Apellido* | *Teléfono*     |
| ---- | ---------- | ---------- | -------------- |
| *1*  | *Daniel*   | *Perez*    | *555-555-1234* |
| *2*  | *Benjamin* | *Morales*  | *555-555-5678* |
| *3*  | *Carol*    | *Silva*    | *555-555-9012* |

- **En este caso, la tabla cumple con la 1NF ya que cada columna contiene solo un valor y los valores en cada columna son del mismo tipo.**

**Incorrecto:**

- **Si la información se almacena en una sola columna, violaría la 1NF, ya que los datos no son atómicos:**

| *ID* | *Información de Empleados*        |
| ---- | --------------------------------- |
| *1*  | *Daniel, Perez, 555-555-1234*     |
| *2*  | *Benjamin, Morales, 555-555-5678* |
| *3*  | *Carol, Silva, 555-555-9012*      |

- *Aquí, una sola columna almacena el nombre, apellido y teléfono del empleado, lo que dificulta el acceso a cada dato por separado.*

---

Aquí tienes una explicación detallada y corregida para la Segunda Forma Normal (2NF):

---

## ***Segunda Forma Normal (2NF)***

**¿En qué consiste la Segunda Forma Normal (2NF)?**

**La Segunda Forma Normal establece que, para cumplir con 2NF, una tabla debe:**

1. *Estar en **Primera Forma Normal (1NF)**, lo que significa que no debe contener valores repetidos o conjuntos de valores en una sola celda.*
2. ***Todos los atributos no clave deben depender completamente de la clave primaria.** Esto significa que los datos en la tabla no deben depender parcialmente de una clave compuesta (es decir, una clave que consta de dos o más columnas). En otras palabras, cada columna que no es clave debe depender únicamente de toda la clave primaria.*

- *La clave primaria es el conjunto mínimo de columnas necesarias para identificar de manera única una fila en la tabla. Si alguna columna depende solo de una parte de la clave primaria (en lugar de toda), entonces la tabla viola la 2NF.*

---

### ***Ejemplo de una tabla que cumple con 2NF***

- *Imagina una tabla de pedidos donde cada pedido contiene información del cliente y del producto solicitado.*

**Tabla `Pedidos`:**

| *PedidoID* | *Cliente*      | *FechaPedido* | *ProductoID* | *Cantidad* |
| ---------- | -------------- | ------------- | ------------ | ---------- |
| *1*        | *Daniel Pérez* | *2023-10-01*  | *101*        | *2*        |
| *2*        | *Ana García*   | *2023-10-02*  | *102*        | *1*        |
| *3*        | *Daniel Pérez* | *2023-10-03*  | *101*        | *3*        |

- *En este caso, cada fila representa un pedido específico de un cliente y contiene la clave primaria compuesta `PedidoID` + `ProductoID` (o en algunos casos, solo `PedidoID` si cada pedido es único). Esta tabla cumple con la 2NF, ya que no hay datos redundantes y todos los campos no clave dependen completamente de `PedidoID` + `ProductoID`.*

---

### ***Ejemplo de una tabla que no cumple con 2NF***

- **Si en la tabla se agregan campos que no dependen completamente de la clave primaria, la tabla violaría la 2NF. Por ejemplo:**

| *PedidoID* | *Cliente*      | *FechaPedido* | *ProductoID* | *Cantidad* | *NombreProducto* | *PrecioProducto* |
| ---------- | -------------- | ------------- | ------------ | ---------- | ---------------- | ---------------- |
| *1*        | *Daniel Pérez* | *2023-10-01*  | *101*        | *2*        | *Lápiz*          | *0.50*           |
| *2*        | *Ana García*   | *2023-10-02*  | *102*        | *1*        | *Cuaderno*       | *1.50*           |
| *3*        | *Daniel Pérez* | *2023-10-03*  | *101*        | *3*        | *Lápiz*          | *0.50*           |

- *En este ejemplo, `NombreProducto` y `PrecioProducto` dependen solo de `ProductoID` y no de toda la clave primaria (en este caso `PedidoID + ProductoID`). Esto viola la 2NF, ya que estas columnas deberían estar en una tabla separada llamada `Productos` que solo depende de `ProductoID`. Esto eliminaría la redundancia y permitiría actualizar los precios de cada producto sin afectar otras tablas.*

- **Para corregir esta violación de 2NF, podemos dividir la tabla en dos:**

**Tabla `Pedidos`:**

| *PedidoID* | *Cliente*      | *FechaPedido* | *ProductoID* | *Cantidad* |
| ---------- | -------------- | ------------- | ------------ | ---------- |
| *1*        | *Daniel Pérez* | *2023-10-01*  | *101*        | *2*        |
| *2*        | *Ana García*   | *2023-10-02*  | *102*        | *1*        |
| *3*        | *Daniel Pérez* | *2023-10-03*  | *101*        | *3*        |

**Tabla `Productos`:**

| *ProductoID* | *NombreProducto* | *PrecioProducto* |
| ------------ | ---------------- | ---------------- |
| *101*        | *Lápiz*          | *0.50*           |
| *102*        | *Cuaderno*       | *1.50*           |

- *Ahora, ambas tablas cumplen con la Segunda Forma Normal, ya que todos los campos en `Pedidos` dependen completamente de la clave primaria, y `Productos` contiene la información relacionada exclusivamente con `ProductoID`.*

---

## ***Tercera Forma Normal (3NF)***

**¿En qué consiste la Tercera Forma Normal (3NF)?**

- *La Tercera Forma Normal establece que una tabla debe cumplir con las siguientes condiciones para estar en 3NF:*

1. ***Debe estar en Segunda Forma Normal (2NF)**, es decir, todos los atributos no clave deben depender completamente de la clave primaria.*
2. ***No debe haber dependencias transitivas**, lo que significa que cada atributo no clave debe depender **directamente** de la clave primaria y no de otro atributo no clave.*

- *Una dependencia transitiva ocurre cuando un atributo `A` depende de un atributo `B`, y `B` depende de la clave primaria `C`. En este caso, `A` depende indirectamente de `C` a través de `B`. La 3NF elimina estas dependencias indirectas o transitivas para evitar redundancias y mejorar la integridad de los datos.*

---

### ***Ejemplo de una tabla que viola la 3NF***

- *Imagina una tabla que almacena información de clientes, incluyendo el **ID del cliente**, **nombre del cliente**, **código postal**, **ciudad** y **estado**.*

| *ID Cliente* | *Nombre*   | *Código Postal* | *Ciudad*   | *Estado*   |
| ------------ | ---------- | --------------- | ---------- | ---------- |
| *1*          | *Daniel*   | *0303456*       | *Lima*     | *Lima*     |
| *2*          | *Benjamin* | *505011*        | *Arequipa* | *Arequipa* |

- *En este ejemplo, `Ciudad` y `Estado` tienen una relación funcional (es decir, cada ciudad pertenece a un estado específico). Por lo tanto, `Ciudad` depende de `Estado` en lugar de depender directamente de `ID Cliente`, creando una dependencia transitiva: `Ciudad` depende de `Estado`, y `Estado` depende de la clave primaria `ID Cliente`. Esto viola la 3NF.*

---

### ***Ejemplo de una tabla en 3NF***

- **Para que esta tabla cumpla con la 3NF, podemos dividirla en dos tablas, eliminando las dependencias transitivas:**

**Tabla `Clientes`:**

| *ID Cliente* | *Nombre*   | *ID Ubicación* |
| ------------ | ---------- | -------------- |
| *1*          | *Daniel*   | *1*            |
| *2*          | *Benjamin* | *2*            |

**Tabla `Ubicaciones`:**

| *ID Ubicación* | *Ciudad*   | *Estado*   | *Código Postal* |
| -------------- | ---------- | ---------- | --------------- |
| *1*            | *Lima*     | *Lima*     | *0303456*       |
| *2*            | *Arequipa* | *Arequipa* | *505011*        |

- *Ahora, la información de `Ciudad` y `Estado` se almacena en una tabla separada (`Ubicaciones`), eliminando las dependencias transitivas. Cada entrada en `Clientes` solo tiene una referencia directa a `ID Ubicación`, que es la clave primaria en la tabla `Ubicaciones`.*

---

### ***Diferencia entre 2NF y 3NF***

- *Aunque la 2NF y la 3NF buscan eliminar redundancias, la diferencia principal radica en el tipo de dependencia que eliminan:*

- **2NF:** *Elimina dependencias parciales, donde un atributo depende solo de parte de una clave compuesta.*
- **3NF:** *Elimina dependencias transitivas, donde un atributo no clave depende indirectamente de la clave primaria a través de otro atributo no clave.*

- *La 3NF es un nivel más avanzado de normalización, ya que elimina las dependencias entre atributos no clave para mejorar aún más la integridad y la eficiencia de la base de datos.*

---

## ***Cuarta Forma Normal (4NF)***

**¿En qué consiste la Cuarta Forma Normal (4NF)?**

- *La Cuarta Forma Normal establece que una tabla debe cumplir con las siguientes condiciones:*

1. *Debe estar en **Tercera Forma Normal (3NF)**.*
2. *Debe evitar **dependencias multivaluadas**, es decir, situaciones en las que una columna tiene múltiples valores independientes que se relacionan con otra columna.*

- *Para eliminar dependencias multivaluadas, cada tabla debe tener una **clave primaria compuesta** (constituida por múltiples columnas) en casos donde sea necesario. Esto ayuda a reducir redundancias y garantiza que los datos sean coherentes, ya que las dependencias multivaluadas pueden generar datos duplicados y problemas de integridad.*

### ***Ejemplo de dependencia multivaluada***

- *Supongamos que tenemos productos que pertenecen a una categoría principal y tienen varias subcategorías. En este caso, un producto puede estar en una categoría (como "Electrónica") y tener múltiples subcategorías (como "Teléfono", "Pantalla", "Alta Gama"). Si intentamos almacenar esto en una sola tabla, generamos una dependencia multivaluada, donde una misma categoría tiene múltiples subcategorías, lo que puede causar duplicación y redundancia.*

**Ejemplo de una tabla con dependencia multivaluada:**

| *ID Producto* | *Nombre*  | *Categoría*    | *Subcategoría* |
| ------------- | --------- | -------------- | -------------- |
| *1*           | *TV*      | *Electrónica*  | *Pantallas*    |
| *2*           | *Mouse*   | *Computadoras* | *Accesorios*   |
| *3*           | *Teclado* | *Computadoras* | *Accesorios*   |
| *4*           | *Celular* | *Electrónica*  | *Teléfonos*    |
| *4*           | *Celular* | *Electrónica*  | *Pantallas*    |
| *4*           | *Celular* | *Electrónica*  | *Alta Gama*    |

- *En este ejemplo, el producto "Celular" tiene varias subcategorías ("Teléfonos", "Pantallas", "Alta Gama"), lo que genera una dependencia multivaluada entre `Categoría` y `Subcategoría`. Esta estructura no cumple con la 4NF debido a las múltiples relaciones independientes de subcategorías con el mismo producto.*

---

### ***Estructura en 4NF***

- *Para cumplir con la 4NF y evitar dependencias multivaluadas, dividimos la tabla en dos tablas independientes:*

**Tabla `Productos` (Categorías principales):**

| *ID Producto* | *Nombre*  |
| ------------- | --------- |
| *1*           | *TV*      |
| *2*           | *Mouse*   |
| *3*           | *Teclado* |
| *4*           | *Celular* |

**Tabla `Subcategorías`:**

| *ID Subcategoría* | *ID Producto* | *Categoría*    | *Subcategoría* |
| ----------------- | ------------- | -------------- | -------------- |
| *1*               | *1*           | *Electrónica*  | *Pantallas*    |
| *2*               | *2*           | *Computadoras* | *Accesorios*   |
| *3*               | *3*           | *Computadoras* | *Accesorios*   |
| *4*               | *4*           | *Electrónica*  | *Teléfonos*    |
| *5*               | *4*           | *Electrónica*  | *Pantallas*    |
| *6*               | *4*           | *Electrónica*  | *Alta Gama*    |

*En esta estructura, la tabla `Productos` contiene únicamente información sobre el producto principal, mientras que la tabla `Subcategorías` relaciona cada producto con sus respectivas subcategorías de manera independiente, eliminando la dependencia multivaluada y cumpliendo con la 4NF.*

---

### ***Diferencia entre 3NF y 4NF***

- *Mientras que la 3NF se enfoca en eliminar dependencias transitivas, la 4NF va un paso más allá al eliminar **dependencias multivaluadas**. Esto es esencial en casos donde una columna contiene múltiples valores independientes relacionados con otra columna, como en el ejemplo de productos y subcategorías.*

- *Este nivel de normalización es útil para evitar redundancias cuando una tabla contiene relaciones múltiples y complejas, asegurando una estructura más eficiente y libre de duplicación.*

---

## ***Quinta Forma Normal (5NF)***

**¿En qué consiste la Quinta Forma Normal (5NF)?**

- *La Quinta Forma Normal (5NF) establece que una tabla debe estar libre de **dependencias de unión**. Esto significa que ningún conjunto de datos debe depender de la combinación de otros atributos de varias tablas. En 5NF, cada atributo en la tabla debe ser **independiente** de los demás atributos, evitando la necesidad de dividir una tabla en múltiples relaciones para que las combinaciones de sus datos sean consistentes y no redundantes.*

- *La 5NF es particularmente útil en casos donde existen **relaciones complejas y multidimensionales**. Se asegura de que todas las relaciones posibles entre atributos estén representadas sin duplicación y que las combinaciones de valores en una tabla no dependan de ninguna combinación parcial de datos de otras tablas.*

---

### ***Ejemplo de Dependencia de Unión***

- *Supongamos que tenemos una empresa de tecnología que vende productos a distintas regiones y que, para cada combinación de producto y región, la empresa trabaja con distintos proveedores. Estos proveedores suministran productos específicos en ciertas regiones, y cada producto se asocia de forma diferente con cada proveedor según la región de venta.*

**Ejemplo de una tabla que no cumple con la 5NF:**

| *ID Producto* | *Producto*    | *Región*       | *Proveedor*           |
| ------------- | ------------- | -------------- | --------------------- |
| *1*           | *MacBook Pro* | *Norteamérica* | *Apple Inc.*          |
| *1*           | *MacBook Pro* | *Europa*       | *Apple Europe*        |
| *2*           | *Galaxy S21*  | *Norteamérica* | *Samsung Electronics* |
| *2*           | *Galaxy S21*  | *Asia*         | *Samsung Asia*        |
| *3*           | *ThinkPad X1* | *Europa*       | *Lenovo Europe*       |
| *3*           | *ThinkPad X1* | *Norteamérica* | *Lenovo US*           |

- *En este ejemplo, existe una dependencia de unión porque cada producto depende de una combinación de `Región` y `Proveedor`. Si una región o proveedor cambia, actualizar esta tabla podría ser difícil y redundante, ya que requiere mantener la consistencia de combinaciones de producto, región y proveedor.*

### ***Estructura en 5NF***

- *Para cumplir con la 5NF y eliminar la dependencia de unión, podemos dividir esta tabla en tres tablas independientes que capturan cada relación sin dependencias complejas:*

**Tabla `Productos`:**

| *ID Producto* | *Producto*    |
| ------------- | ------------- |
| *1*           | *MacBook Pro* |
| *2*           | *Galaxy S21*  |
| *3*           | *ThinkPad X1* |

**Tabla `Regiones`:**

| *ID Región* | *Región*       |
| ----------- | -------------- |
| *1*         | *Norteamérica* |
| *2*         | *Europa*       |
| *3*         | *Asia*         |

**Tabla `Proveedores`:**

| *ID Proveedor* | *Proveedor*           |
| -------------- | --------------------- |
| *1*            | *Apple Inc*.          |
| *2*            | *Apple Europe*        |
| *3*            | *Samsung Electronics* |
| *4*            | *Samsung Asia*        |
| *5*            | *Lenovo Europe*       |
| *6*            | *Lenovo US*           |

**Tabla `Distribución`:**

- *Esta tabla representa las combinaciones de `ID Producto`, `ID Región` y `ID Proveedor` de manera independiente, eliminando la dependencia de unión.*

| *ID Producto* | *ID Región* | *ID Proveedor* |
| ------------- | ----------- | -------------- |
| *1*           | *1*         | *1*            |
| *1*           | *2*         | *2*            |
| *2*           | *1*         | *3*            |
| *2*           | *3*         | *4*            |
| *3*           | *2*         | *5*            |
| *3*           | *1*         | *6*            |

- *En esta estructura, cada tabla mantiene sus propias relaciones sin dependencias de combinación con otras tablas. Ahora, si cambiamos un proveedor o región para un producto, solo necesitamos actualizar la tabla `Distribución` sin afectar el resto de la estructura.*

### ***Diferencia entre 4NF y 5NF***

- *La 4NF elimina dependencias multivaluadas, mientras que la 5NF elimina dependencias de unión. Estas dependencias en 5NF pueden surgir en escenarios complejos con relaciones tridimensionales o más, donde los datos se organizan en varias combinaciones. Este nivel de normalización asegura la independencia completa de cada atributo y evita redundancias en relaciones complejas, permitiendo una estructura óptima y libre de duplicación.*

- *Esta estructura en 5NF garantiza que la base de datos sea eficiente y fácil de mantener, sin depender de combinaciones redundantes de atributos en las tablas.*

---

## ***Aplicación de la Normalización***

- *A continuación, veremos un ejemplo de cómo se aplica la normalización en una base de datos de clientes y ventas. Primero, crearemos una tabla de ejemplo y analizaremos su estructura para ver cómo cumple con las formas normales (1NF, 2NF y 3NF).*

---

### ***Ejemplo de Tabla de Clientes***

- *Esta tabla almacena información básica de clientes, pero en un solo lugar. Cada columna almacena un solo tipo de dato, cumpliendo con la Primera Forma Normal (1NF).*

| *ClientID* | *Nombre*       | *Dirección*            | *Teléfono* | *Correo Electrónico*       | *Ciudad*      | *Estado*        |
| ---------- | -------------- | ---------------------- | ---------- | -------------------------- | ------------- | --------------- |
| *1*        | *Daniel Pérez* | *Calle Bolívar 123*    | *555-1234* | `daniel.perez@example.com` | *Springfield* | *Massachusetts* |
| *2*        | *Ana García*   | *Av. Siempre Viva 456* | *555-5678* | `ana.garcia@example.com`   | *Albuquerque* | *Nuevo México*  |
| *3*        | *Carlos López* | *Plaza Central 789*    | *555-9012* | `carlos.lopez@example.com` | *Albuquerque* | *Nuevo México*  |
| *4*        | *Laura Torres* | *Calle del Sol 321*    | *555-3456* | `laura.torres@example.com` | *Saná*        | *Yemen*         |

---

### ***Ejemplo de Tabla de Ventas***

- *Para las ventas, inicialmente tenemos una tabla que almacena todos los detalles de la transacción, pero en esta tabla hay redundancias (por ejemplo, los datos del cliente se repiten en cada venta) y dependencias parciales que debemos eliminar para normalizar la estructura.*

| *VentaID* | *Fecha*      | *ClienteID* | *Nombre del Cliente* | *Dirección del Cliente* | *Ciudad del Cliente* | *Estado del Cliente* | *ProductoID* | *Nombre del Producto* | *Precio del Producto* | *Cantidad* |
| --------- | ------------ | ----------- | -------------------- | ----------------------- | -------------------- | -------------------- | ------------ | --------------------- | --------------------- | ---------- |
| *101*     | *2024-10-01* | *1*         | *Daniel Pérez*       | *Calle Bolívar 123*     | *Springfield*        | *Massachusetts*      | *501*        | *Televisor LED*       | *400.00*              | *2*        |
| *102*     | *2024-10-05* | *2*         | *Ana García*         | *Av. Siempre Viva 456*  | *Albuquerque*        | *Nuevo México*       | *502*        | *Laptop*              | *1200.00*             | *1*        |
| *103*     | *2024-10-10* | *3*         | *Carlos López*       | *Plaza Central 789*     | *Albuquerque*        | *Nuevo México*       | *503*        | *Smartphone*          | *700.00*              | *3*        |

- ***Cumple con 1NF** porque cada columna contiene un único valor y cada fila representa un registro único.*

---

### ***Aplicación de 2NF***

- *Para cumplir con la **Segunda Forma Normal (2NF)**, eliminaremos las dependencias parciales. Esto implica que toda columna debe depender únicamente de la clave primaria (en este caso, `VentaID`). Para lograrlo, dividimos la tabla `Ventas` en dos tablas: una para las ventas (detalles de la venta) y otra para los clientes (datos básicos de cada cliente).*

---

#### ***Tabla `Ventas`***

- *Esta tabla contiene solo la información directamente relacionada con cada venta, eliminando los detalles de cliente y producto que no dependen únicamente de `VentaID`:*

| *VentaID* | *Fecha*      | *ClienteID* | *ProductoID* | *Precio del Producto* | *Cantidad* |
| --------- | ------------ | ----------- | ------------ | --------------------- | ---------- |
| *101*     | *2024-10-01* | *1*         | *501*        | *400.00*              | *2*        |
| *102*     | *2024-10-05* | *2*         | *502*        | *1200.00*             | *1*        |
| *103*     | *2024-10-10* | *3*         | *503*        | *700.00*              | *3*        |

---

#### ***Tabla `Clientes`***

- *La tabla `Clientes` contiene los detalles del cliente y se relaciona con la tabla `Ventas` a través de `ClienteID`:*

| *ClienteID* | *Nombre del Cliente* | *Dirección*            | *Ciudad*      | *Estado*        |
| ----------- | -------------------- | ---------------------- | ------------- | --------------- |
| *1*         | *Daniel Pérez*       | *Calle Bolívar 123*    | *Springfield* | *Massachusetts* |
| *2*         | *Ana García*         | *Av. Siempre Viva 456* | *Albuquerque* | *Nuevo México*  |
| *3*         | *Carlos López*       | *Plaza Central 789*    | *Albuquerque* | *Nuevo México*  |

- *Con esta estructura, **cumplimos con la 2NF** al eliminar la redundancia en los datos del cliente en cada registro de venta.*

---

### ***Aplicación de 3NF***

- *Para cumplir con la **Tercera Forma Normal (3NF)**, eliminaremos las **dependencias transitivas**. Esto significa que toda columna en una tabla debe depender únicamente de la clave primaria de esa tabla y no de ninguna otra columna indirectamente.*

- *En este caso, eliminamos el detalle del producto de la tabla `Ventas` y creamos una nueva tabla `Productos` para que cada producto solo se registre una vez y se relacione con `ProductoID`:*

---

#### ***Tabla `Productos`***

| *ProductoID* | *Nombre del Producto* | *Precio del Producto* |
| ------------ | --------------------- | --------------------- |
| *501*        | *Televisor LED*       | *400.00*              |
| *502*        | *Laptop*              | *1200.00*             |
| *503*        | *Smartphone*          | *700.00*              |

---

#### ***Tabla `Ventas` (final)***

| *VentaID* | *Fecha*      | *ClienteID* | *ProductoID* | *Cantidad* |
| --------- | ------------ | ----------- | ------------ | ---------- |
| *101*     | *2024-10-01* | *1*         | *501*        | *2*        |
| *102*     | *2024-10-05* | *2*         | *502*        | *1*        |
| *103*     | *2024-10-10* | *3*         | *503*        | *3*        |

- *Con esta estructura final, hemos eliminado todas las dependencias parciales y transitivas, cumpliendo así con las 1NF, 2NF y 3NF. Ahora cada tabla tiene una estructura optimizada, sin redundancias ni dependencias indirectas, y se relaciona a través de claves primarias y foráneas.*

*Esta aplicación de normalización mejora la consistencia y optimiza el almacenamiento, facilitando además la actualización y mantenimiento de los datos.*
