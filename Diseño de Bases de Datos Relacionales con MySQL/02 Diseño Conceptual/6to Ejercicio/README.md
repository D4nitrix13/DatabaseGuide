<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Ejercicio 6: Red Social***

> [!IMPORTANT]
> *Vamos a desarrollar una aplicación similar a Instagram donde los usuarios podrán subir publicaciones a su perfil y seguir a otros usuarios.*

---

## ***Características Generales:***

1. **Registro de Usuarios:**
   - **Los usuarios se registrarán utilizando su *correo electrónico* y una *contraseña*.**
   - **Deberán elegir un *nombre de usuario único*.**
   - **Podrán elegir una *imagen de perfil* (opcional).**
   - **Una vez completado el registro con datos válidos, se les creará automáticamente un perfil.**

2. **Publicaciones (Posts):**
   - **Los usuarios podrán subir publicaciones a su perfil.**
   - **Cada publicación puede tener de *1 a 10 imágenes* y una *descripción opcional*.**
   - **Se almacenará la *fecha de creación* de cada publicación.**

3. **Seguimiento (Follow):**
   - *Los usuarios podrán seguir los perfiles de otros usuarios para ver sus publicaciones.*

4. **Comentarios:**
   - **Los usuarios podrán escribir *comentarios* en los posts, tanto propios como de otros usuarios.**
   - **Cada comentario tendrá un *texto* y la *fecha de publicación*.**

---

### ***Modelo de Datos***

#### ***1. Entidad USER***

- **Atributos:**
  - **ID:** *Identificador único del usuario.*
  - **Email:** *Correo electrónico del usuario.*
  - **Name:** *Nombre real del usuario.*
  - **Password:** *Contraseña del usuario.*

#### ***2. Entidad PROFILE***

- **Atributos:**
  - **ID:** *Identificador único del perfil.*
  - **Username:** *Nombre de usuario (único).*
  - **Profile_Picture:** *Imagen de perfil (opcional).*

    **Relación:**

- **HAS:** *Relación entre* **USER** *y* **PROFILE.**
  - *Un usuario tiene como máximo y mínimo un perfil: (1,1).*
  - *Un perfil pertenece exclusivamente a un usuario: (1,1).*

---

#### ***3. Entidad POST***

- **Atributos:**
  - **ID:** *Identificador único del post.*
  - **Description:** *Descripción del post (opcional).*
  - **Date:** *Fecha de creación del post.*
  - **Images:** *Lista de imágenes (mínimo 1 y máximo 10).*

   **Relación:**  

- **UPLOADS:** *Relación entre* **PROFILE** *y* **POST.**
  - *Un perfil puede subir 0 a n posts: (0,n).*
  - *Un post solo puede ser subido por un único perfil: (1,1).*

---

#### ***4. Relación FOLLOWS***

- *Relación entre* **PROFILE** *y* **PROFILE.**
  - *Un perfil puede seguir entre 0 y n perfiles: (0,n).*
  - *Un perfil puede ser seguido por entre 0 y n perfiles: (0,n).*

---

#### ***5. Relación POST_COMMENT***

- **Atributos:**
  - **Date:** *Fecha del comentario.*
  - **Content:** *Contenido del comentario.*

   **Relación:**  

- *Relación entre* **PROFILE** *y* **POST.**
  - *Un perfil puede comentar entre 0 y n posts: (0,n).*
  - *Un post puede recibir comentarios de 0 a n perfiles: (0,n).*

*![EjercicioSeis](/Images/EjercicioSeis.png "/Images/EjercicioSeis.png")*
