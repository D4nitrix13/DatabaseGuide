<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Reto: Ecommerce***

> [!NOTE]
> *Vamos a crear un marketplace similar a Amazon donde los usuarios puedan gestionar tiendas y vender productos online. Los usuarios se registrarán con su correo electrónico, contraseña y nombre completo.*

---

## ***Características Principales:***

1. **Registro de Usuarios:**
   - **Los usuarios podrán registrarse proporcionando su *correo electrónico*, una *contraseña* y su *nombre completo*.**
   - **Este registro será necesario tanto para quienes deseen vender productos como para aquellos que solo quieran realizar compras.**

2. **Tiendas y Productos:**
   - **Cada usuario puede crear y gestionar una tienda, en la que podrá listar productos para la venta.**
   - **Para cada tienda, almacenaremos su *nombre* y la referencia del *usuario propietario*.**
   - **Los productos son únicos para cada tienda, es decir, si varias tiendas venden el mismo producto, cada tienda deberá registrarlo por separado con su propio nombre, imágenes, etc.**

   **Atributos de los productos:**
   - **Nombre:** **Nombre único dentro de la tienda.**
   - **Descripción:** **Texto que describe el producto.**
   - **stock:** **Cantidad disponible en inventario.**
   - **Precio:** **Precio actual del producto.**
   - **Descuento:** **Porcentaje de descuento aplicado al precio.**
   - **Tamaño y color (opcional):** **Algunos productos pueden tener variantes de *tamaño* (ej. diferentes pulgadas) o *color*.**
   - **Imágenes:** **Cada producto debe tener al menos una imagen, pero puede tener múltiples imágenes.**

3. **Compras y Pedidos:**
   - **Los usuarios pueden realizar compras en cualquier tienda del marketplace.**
   - **Al realizar una compra, se crea un *pedido* que contiene los detalles del producto y la cantidad adquirida.**
   - **Se almacenará el *precio* y el *descuento* en el momento de la compra, ya que estos pueden cambiar con el tiempo.**

   **Atributos del pedido:**
   - **Productos:** **Lista de productos comprados, con detalles como la cantidad, tamaño (si aplica), color (si aplica), precio y descuento al momento de la compra.**
   - **Cantidad:** **Número de unidades de cada producto.**
   - **Precio total:** **Suma del valor de los productos comprados, incluyendo descuentos.**
   - **Número de factura:** **Identificador único del pedido para futuras referencias.**
   - **Estado del pedido:** **El estado del pedido puede ser: "procesando", "enviado", "entregado" o "cancelado".**

4. **Direcciones de Envío:**
   - *Cada usuario puede asociar múltiples direcciones de envío a su cuenta, las cuales podrán ser seleccionadas al momento de realizar un pedido.*
   - *La dirección de envío será almacenada junto con los detalles del pedido.*

   **Atributos de la dirección:**
   - **País:** **País de destino.**
   - **Provincia:** **Provincia o estado de destino.**
   - **Ciudad:** **Ciudad de destino.**
   - **Calle:** **Nombre de la calle.**
   - **Número:** **Número de la dirección.**
   - **Unidad:** **Unidad opcional (ej. apartamento, puerta).**

---

### ***Modelo de Datos***

---

#### ***1. Entidad User***

- **Atributos:**
  - **id:** **Identificador único del usuario.**
  - **name:** **Nombre completo del usuario.**
  - **email:** **Correo electrónico (también será su identificador).**
  - **password:** **Contraseña.**

   **Relación:**

- **Makes:** **Relaciona `User` con `Order`.**
  - *Un usuario puede hacer entre 0 y n pedidos: (0,n).*
  - *Un pedido pertenece a un solo usuario: (1,1).*

---

#### ***2. Entidad Store***

- **Atributos:**
  - **id:** **Identificador único de la tienda.**
  - **name:** **Nombre de la tienda.**

   **Relación:**

- **Creates:** **Relaciona `User` con `Store`.**
  - *Un usuario puede crear entre 0 y n tiendas: (0,n).*
  - *Una tienda debe ser creada por un solo usuario: (1,1).*

---

#### ***3. Entidad Product***

- **Atributos:**
  - **id:** **Identificador único del producto.**
  - **name:** **Nombre del producto.**
  - **description:** **Descripción del producto.**
  - **stock:** **Cantidad disponible en inventario.**
  - **price:** **Precio actual.**
  - **discount:** **Descuento actual (porcentaje).**
  - **size:** **Tamaño opcional (ej. pulgadas o dimensiones).**
  - **color:** **Color opcional (ej. negro, blanco).**
  - **Images:** **Una o más imágenes del producto (1,n).**

   **Relación:**

- **Sells:** **Relaciona `Store` con `Product`.**
  - *Una tienda puede vender entre 0 y n productos: (0,n).*
  - *Un producto solo puede ser vendido por una tienda: (1,1).*

---

#### **4. Entidad Order**

- **Atributos:**
  - **id:** **Identificador único del pedido.**
  - **Status:** **Estado del pedido (procesando, enviado, entregado, cancelado).**
  - **total_price:** **Precio total del pedido.**
  - **invoice_number:** **Número de factura.**

   **Relación:**

- **Includes:** **Relaciona `Order` con `Product`.**
  - *Un pedido puede incluir entre 1 y n productos: (1,n).*
  - *Un producto puede estar en 0 a n pedidos: (0,n).*

   **Atributos de la relación Includes:**
  - **quantity:** **Cantidad de productos comprados.**
  - **price:** **Precio del producto al momento de la compra.**
  - **discount:** **Descuento aplicado en la compra.**
  - **size:** **Tamaño del producto (si aplica).**
  - **color:** **color del producto (si aplica).**

---

#### ***5. Entidad Address***

- **Atributos:**
  - **id:** **Identificador único de la dirección.**
  - **Country:** **País.**
  - **province:** **Provincia o estado.**
  - **city:** **Ciudad.**
  - **street:** **Calle.**
  - **number:** **Número de la dirección.**
  - **unit:** **Unidad (opcional).**

   **Relación:**

- **Has:** **Relaciona `User` con `Address`.**
  - *Un usuario puede tener entre 0 y n direcciones: (0,n).*
  - *Cada dirección pertenece a un único usuario: (1,1).*

   **Relación:**

- **ShipsTo:** **Relaciona `Order` con `Address`.**
  - *Un pedido puede tener una dirección de envío: (1,1).*
  - *Una dirección puede estar asociada con varios pedidos: (0,n).*

*![EjercicioSiete](/Images/EjercicioSiete.png "/Images/EjercicioSiete.png")*
