<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Relaciones Muchos a Muchos***

---

## ***Ejercicio 3: Salas de Chat***

- *Queremos desarrollar una aplicación donde los usuarios puedan crear salas de chat y asignar distintos roles a los miembros de cada sala. Los usuarios se registrarán con un correo electrónico y contraseña, además de almacenar su nombre completo y un nombre de usuario único.*
- *Cada sala tiene un propietario (el usuario que la creó inicialmente), un nombre y una descripción. La sala puede configurarse como privada, lo que significa que solo los usuarios con una invitación podrán unirse. La invitación debe ser un enlace generado automáticamente. Si la sala es pública, no será necesaria una invitación para unirse.*
- *Los propietarios de las salas podrán crear roles y asignarlos a otros usuarios. De cada rol se almacenará el nombre y una descripción.*
- *Además, queremos almacenar la fecha, incluyendo hora y minuto, de cada mensaje enviado en cada sala, así como el usuario que lo envió.*
- *Diseña el diagrama conceptual para almacenar esta información en una base de datos.*

---

### ***1. Entidad USER (Usuario)***

**Atributos:**

- *ID*
- *Nombre (Name)*
- *Correo electrónico (Email)*
- *Contraseña (Password)*
- *Nombre de usuario (Username)*

---

### ***2. Entidad ROOM (Sala)***

**Atributos:**

- *ID*
- *Privacidad (Is_Private)*
- *Nombre (Name)*
- *Descripción (Description)*

---

### ***Relaciones***

1. **Relación "Creates"** *(Crea)*

    *Esta relación vincula la entidad `USER` con la entidad `ROOM`.*

    **Cardinalidad:**

    - *Un usuario puede crear entre 0 y N salas. (0, N)*
    - *Una sala debe ser creada por un único usuario. (1, 1)*

2. **Relación "Joins"** *(Se Une)*

   - *Esta relación vincula la entidad `USER` con la entidad `ROOM`.*

   **Cardinalidad:**

   - *Un usuario puede unirse a entre 0 y N salas. (0, N)*
   - *Una sala puede tener entre 0 y N usuarios. (0, N)*

   **Notas:**  
   *Esta es una relación muchos a muchos, ya que un usuario puede unirse a varias salas y una sala puede tener varios usuarios.*

3. **Relación "SendMessages"** *(Envía Mensajes)*

   - *Esta relación vincula la entidad `USER` con la entidad `ROOM`.*

   **Cardinalidad:**

   - *Un usuario puede enviar entre 0 y N mensajes. (0, N)*
   - *Una sala puede recibir mensajes de entre 1 y N usuarios. (1, N)*

   **Atributos de la relación "SendMessages":**

   - *Contenido (Content)*
   - *Fecha y hora (Date)*

4. **Relación "IsInvited"** *(Es Invitado)*

**Cardinalidad:**

- *Un usuario puede ser invitado a entre 0 y N salas. (0, N)*
- *Una sala puede invitar a entre 0 y N usuarios. (0, N)*

**Atributo de la relación "IsInvited":**

- *Enlace de invitación (Link)*

---

### ***3. Entidad ROLE (Rol)***

**Atributos:**

- *ID*
- *Nombre (Name)*
- *Descripción (Description)*

---

### ***Otras Relaciones***

1. **Relación "IsAssigned"** *(Se Asigna)*

    *Esta relación vincula la entidad `USER` con la entidad `ROLE`.*

2. **Relación "Has"** *(Tiene)*

*Esta relación vincula la entidad `ROLE` con la entidad `ROOM`.*

**Cardinalidad:**

- *Un usuario puede tener entre 0 y N roles. (0, N)*
- *Una sala puede tener entre 0 y N roles. (0, N)*
- *Un rol pertenece a exactamente una sala. (1, 1)*
- *Un rol puede ser asignado a entre 0 y N usuarios. (0, N)*

*![Image ImageRelacionesMuchosAMuchos](/Images/ImageRelacionesMuchosAMuchos.png "/Images/ImageRelacionesMuchosAMuchos.png")*
