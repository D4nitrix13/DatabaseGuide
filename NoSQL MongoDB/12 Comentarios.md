<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Comentarios***

- *En MongoDB (un sistema de base de datos NoSQL), no existe una sintaxis formal específica para los comentarios como ocurre en SQL o en lenguajes de programación. Sin embargo, hay algunas maneras en las que puedes añadir comentarios o explicaciones a tus consultas o scripts para mejorar la claridad y el mantenimiento del código.*

**Aquí te explico dos enfoques:**

## ***1. Comentarios en el Shell de MongoDB (`mongo` CLI)***

**En el *shell* de MongoDB, puedes utilizar la sintaxis de comentarios de JavaScript, ya que las consultas en MongoDB están basadas en sintaxis de JavaScript:**

- **Comentario en una línea:** **usa `//`**
  
  ```javascript
  // Esta consulta busca todos los documentos en la colección "usuarios"
  db.usuarios.find()
  ```

- **Comentario en varias líneas:** **usa `/* */`**
  
  ```javascript
  /*
   Esta consulta busca todos los documentos en la colección "usuarios"
   que tengan el campo "edad" mayor que 18.
  */
  db.usuarios.find({ edad: { $gt: 18 } })
  ```

### **2. Comentarios en Agregaciones con `$comment`**

**Cuando estás utilizando el framework de *agregación* de MongoDB, puedes agregar comentarios directamente dentro del *pipeline* usando la etapa `$comment`. Esto es útil cuando quieres incluir información adicional sobre una etapa de la agregación sin interrumpir el flujo de datos.**

Por ejemplo:

```javascript
db.usuarios.aggregate([
  {
    $match: { edad: { $gt: 18 } }
  },
  {
    $comment: "Este $match selecciona usuarios mayores de 18 años"
  },
  {
    $group: { _id: "$ciudad", total: { $sum: 1 } }
  }
])
```

### ***3. Comentarios en Drivers de MongoDB***

- *Si estás usando MongoDB con un lenguaje de programación (como Node.js, Python, etc.), puedes agregar comentarios al código del lado del cliente, ya que estarás escribiendo en ese lenguaje. La forma de hacer comentarios dependerá del lenguaje de programación que estés usando.*

- **Ejemplo en JavaScript:**
  
  ```javascript
  // Conexión a la base de datos MongoDB
  const client = new MongoClient(url);

  // Realizando una consulta para encontrar usuarios mayores de 18
  client.db("test").collection("usuarios").find({ edad: { $gt: 18 } });
  ```

### ***4. Comentarios en MongoDB Compass***

- *Si estás usando la interfaz gráfica MongoDB Compass, no puedes escribir comentarios directamente en las consultas. Sin embargo, puedes documentar el propósito de tus consultas en notas externas o con herramientas de gestión de código, ya que Compass no ofrece una funcionalidad directa para comentarios.*
