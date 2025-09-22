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

#### ***1. Entidad User***

- **Atributos:**
  - **id:** *Identificador único del usuario.*
  - **email:** *Correo electrónico del usuario.*
  - **name:** *Nombre real del usuario.*
  - **password:** *Contraseña del usuario.*

#### ***2. Entidad Profile***

- **Atributos:**
  - **id:** *Identificador único del perfil.*
  - **username:** *Nombre de usuario (único).*
  - **profile_picture:** *Imagen de perfil (opcional).*

    **Relación:**

- **Has:** *Relación entre* **User** *y* **Profile.**
  - *Un usuario tiene como máximo y mínimo un perfil: (1,1).*
  - *Un perfil pertenece exclusivamente a un usuario: (1,1).*

---

#### ***3. Entidad Post***

- **Atributos:**
  - **id:** *Identificador único del post.*
  - **description:** *Descripción del post (opcional).*
  - **date:** *Fecha de creación del post.*
  - **images:** *Lista de imágenes (mínimo 1 y máximo 10).*

   **Relación:**  

- **Uploads:** *Relación entre* **Profile** *y* **Post.**
  - *Un perfil puede subir 0 a n posts: (0,n).*
  - *Un post solo puede ser subido por un único perfil: (1,1).*

---

#### ***4. Relación Follows***

- *Relación entre* **Profile** *y* **Profile.**
  - *Un perfil puede seguir entre 0 y n perfiles: (0,n).*
  - *Un perfil puede ser seguido por entre 0 y n perfiles: (0,n).*

---

#### ***5. Relación PostComment***

- **Atributos:**
  - **date:** *Fecha del comentario.*
  - **Content:** *Contenido del comentario.*

   **Relación:**  

- *Relación entre* **Profile** *y* **Post.**
  - *Un perfil puede comentar entre 0 y n posts: (0,n).*
  - *Un post puede recibir comentarios de 0 a n perfiles: (0,n).*

*![EjercicioSeis](/Images/EjercicioSeis.png "/Images/EjercicioSeis.png")*
