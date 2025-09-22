<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Proyecto Final: App de Pagos***

> *Este proyecto busca desarrollar una aplicación similar a PayPal, donde los usuarios pueden gestionar cuentas con saldo y realizar transferencias a otros usuarios o a sus cuentas bancarias.*

---

## ***Características Principales:***

1. **Registro de Usuarios:**
   - **Los usuarios se registrarán en la aplicación utilizando su *correo electrónico* y una *contraseña*.**
   - **Se almacenará también el *nombre completo* de los usuarios para poder identificarlos dentro del sistema.**

2. **Cuentas en la Aplicación:**
   - **Cada usuario podrá crear múltiples *cuentas*, que pueden ser de dos tipos: *cuentas normales* y *cuentas de empresa*.**

   **Atributos comunes de las cuentas:**
   - **Nombre:** *El nombre de la cuenta, proporcionado por el usuario.*
   - **Descripción:** *Texto opcional para describir la cuenta.*
   - **Saldo:** *El saldo actual de la cuenta en euros (€).*

   - **Para las *cuentas normales*, no se requiere información adicional.**
   - **Para las *cuentas de empresa*, se almacenarán atributos adicionales:**
     - **Nombre de la empresa:** *Razón social de la empresa.*
     - **Tax id:** *Número de identificación fiscal de la empresa.*

3. **Transferencias entre Cuentas:**
   - *Los usuarios podrán realizar transferencias de dinero entre sus propias cuentas o hacia las cuentas de otros usuarios en la aplicación.*

   **Atributos de las transferencias:**
   - **Cantidad:** *El monto transferido.*
   - **Fecha:** *La fecha y hora exacta en la que se realizó la transferencia.*
   - **Estado:** *El estado de la transferencia, que puede ser "pagado" o "reembolsado".*

4. **Transferencias con Cuentas Bancarias:**
   - **Los usuarios podrán asociar *cuentas bancarias* a sus cuentas en la aplicación para transferir dinero hacia y desde su banco.**
   - **Cada usuario puede asociar varias cuentas bancarias a sus cuentas de la aplicación.**

   **Atributos de las cuentas bancarias:**
   - **Número de cuenta:** *Identificador único de la cuenta bancaria.*

   **Transferencias entre la app y el banco:**
   - **Las transferencias bancarias pueden realizarse en dos direcciones:**
     - **Desde la app hacia el banco:** *Transferencia de saldo de la aplicación hacia la cuenta bancaria del usuario.*
     - **Desde el banco hacia la app:** *Transferencia de fondos desde la cuenta bancaria del usuario hacia la app para aumentar su saldo.*

   **Atributos de las transferencias bancarias:**
   - **Fecha de inicio:** *La fecha en la que se inició la transferencia.*
   - **Fecha de finalización:** *La fecha en la que se completó o canceló la transferencia.*
   - **Cantidad:** *El monto transferido.*
   - **Estado:** *El estado de la transferencia, que puede ser "procesando", "completada" o "cancelada".*
   - **Dirección:** **Indica si el dinero fue transferido *desde* la app *hacia* el banco o *desde* el banco *hacia* la app.**

---

### ***Modelo de Datos***

---

#### ***1. Entidad User***

- **Atributos:**
  - **id:** *Identificador único del usuario.*
  - **name:** *Nombre completo del usuario.*
  - **email:** *Correo electrónico del usuario (identificador).*

   **Relación:**

- **Creates:** *Relaciona **User** con **Account**.*
  - *Un usuario puede crear entre 0 y n cuentas: (0,n).*
  - *Una cuenta pertenece a un solo usuario: (1,1).*

---

#### ***2. Entidad Account***

- **Atributos:**
  - **id:** *Identificador único de la cuenta.*
  - **balance:** *Saldo actual en euros (€).*
  - **description:** *Descripción opcional de la cuenta.*
  - **name:** *Nombre de la cuenta.*

   **Relación:**

- **Transfers:** *Relaciona **Account** con **Account** para realizar transferencias entre cuentas de usuarios.*
  - *Un usuario puede hacer entre 0 y n transferencias desde su cuenta: (0,n).*
  - *Una cuenta puede recibir entre 0 y n transferencias: (0,n).*

   **Atributos de la relación Transfers:**
  - **amount:** *Cantidad transferida.*
  - **date:** *Fecha y hora de la transferencia.*
  - **status:** *Estado de la transferencia (pagado, reembolsado).*

---

#### ***3. Entidad BankAccount***

- **Atributos:**
  - **account_number:** *Número de cuenta bancaria (identificador).*

   **Relación:**

- **IsAssociated:** *Relaciona **Account** con **BankAccount**.*
  - *Una cuenta de la app puede estar asociada con varias cuentas bancarias: (0,n).*
  - *Una cuenta bancaria puede estar asociada con una sola cuenta de la app: (1,1).*

   **Relación:**

- **Transfers:** *Relaciona **Account** con **BankAccount** para transferencias entre la app y el banco.*
  - *Una cuenta de la app puede hacer entre 0 y n transferencias con el banco: (0,n).*
  - *Una cuenta bancaria puede recibir o enviar transferencias entre 0 y n veces: (0,n).*

   **Atributos de la relación Transfers:**
  - **start_date:** *Fecha de inicio de la transferencia.*
  - **end_date:** *Fecha de finalización (completada o cancelada).*
  - **amount:** *Monto transferido.*
  - **status:** *Estado de la transferencia (procesando, completada, cancelada).*
  - **direction:** *Dirección de la transferencia (desde app a banco, desde banco a app).*

---

#### ***4. Jerarquización: CorporateAccount***

- *Este tipo de cuenta hereda de **Account** pero tiene atributos adicionales específicos para empresas.*

   **Atributos:**

- **name:** *Nombre de la empresa.*
- **tax_id:** *Número de identificación fiscal de la empresa (NIF o CIF).*

   **Jerarquía:**

- *Relaciona una **CorporateAccount** con **Account**.*
  - *Una cuenta puede ser normal o corporativa, con atributos adicionales si es una cuenta de empresa.*
  - **La cardinalidad `(p, e)` en este contexto significa lo siguiente:**

  - **(p -> parcial):** **La relación es *parcial* porque no todas las cuentas tienen que ser corporativas. Es decir, una cuenta puede ser **normal** o **corporativa**, pero no todas las cuentas serán corporativas.**
  
  - **(e -> exclusivo):** **La relación es *exclusiva* porque una cuenta solo puede ser de un tipo. Una cuenta no puede ser a la vez normal y corporativa, debe ser solo uno de estos dos tipos.**

  - **Por lo tanto, una cuenta será *exclusivamente* normal o *exclusivamente* corporativa, pero no ambas, y la categoría corporativa aplica solo a algunas cuentas (*parcialmente*).**

*![EjercicioOcho](/Images/EjercicioOcho.png "/Images/EjercicioOcho.png")*
