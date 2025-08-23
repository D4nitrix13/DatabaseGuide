<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Ejercicios con Diagramas ER***

---

## ***Ejemplo 1: Entidad "Persona"***

![EntidadEjemplo Imagen 1](/Images/EntidadEjemplo1.png "/Images/EntidadEjemplo1.png")

- **Entidad:** *Persona*
- **Atributos:**
  - **Atributo simple:** *nombre, altura, edad*
  - **Atributo clave (key):** *DNI (identificador único)*
  - **Atributo multivalor:** *hobbies (una persona puede tener más de un hobby)*

---

### ***Ejemplo 2: Entidad "Empleado"***

![EntidadEjemplo Imagen 2](/Images/EntidadEjemplo2.png "/Images/EntidadEjemplo2.png")

- **Entidad:** *Empleado*
- **Atributos:**
  - **Atributos simples:** *apellido, fecha de nacimiento, ciudad, estado, nombre, código postal, estado civil, género, número de teléfono, correo electrónico, dirección*
  - **Atributo derivado:** *edad (calculado a partir de la fecha de nacimiento)*
  - **Atributo clave (key):** *id_empleado (identificador único)*
  - **Atributo compuesto:** *información de contacto (contiene número de teléfono, correo electrónico, dirección)*
  - **Atributo multivalor:** *habilidades (el empleado puede tener más de una habilidad)*

---

### **Nota importante**

- *Al diseñar diagramas ER, es esencial ser conciso, preciso y evitar la redundancia.*
