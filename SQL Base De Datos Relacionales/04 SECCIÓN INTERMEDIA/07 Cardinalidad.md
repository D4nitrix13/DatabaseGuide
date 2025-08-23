<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Cardinalidad***

*La cardinalidad se refiere a la relación entre dos tablas en una base de datos, indicando cuántas instancias de una entidad pueden relacionarse con instancias de otra entidad. Comprender la cardinalidad es crucial para diseñar correctamente la estructura de una base de datos, ya que afecta la forma en que se organizan y acceden los datos.*

---

## ***Tipos de Cardinalidad***

**Existen cuatro tipos principales de cardinalidad:**

1. **Uno a Uno (1:1)**  
   - *En esta relación, una fila de una tabla se relaciona con **exactamente una** fila de otra tabla. Por ejemplo, una persona puede tener solo un pasaporte y un pasaporte pertenece a solo una persona.*

2. **Uno a Muchos (1:N)**  
   - *En esta relación, una fila de una tabla puede relacionarse con **muchas** filas de otra tabla, pero cada fila de la segunda tabla se relaciona con **solo una** fila de la primera. Por ejemplo, un autor puede haber escrito varios libros, pero cada libro tiene un solo autor.*

3. **Muchos a Uno (N:1)**  
   - *Esta es la relación inversa de la anterior. Muchas filas de una tabla pueden relacionarse con una sola fila de otra tabla. Por ejemplo, muchos estudiantes pueden estar inscritos en una sola clase, pero cada clase tiene muchos estudiantes.*

4. **Muchos a Muchos (N:M)**  
   - *En esta relación, una fila de una tabla puede relacionarse con **muchas** filas de otra tabla y viceversa. Por ejemplo, los estudiantes pueden estar inscritos en múltiples clases y cada clase puede tener múltiples estudiantes.*

### ***Notación de Chen y Notación de Mark***

- **Notación de Chen:**  
  - *Esta notación utiliza un diagrama entidad-relación (ER) para representar la cardinalidad de las relaciones. En este tipo de diagramas, las entidades se representan como rectángulos, las relaciones como rombos, y se anotan los tipos de cardinalidad cerca de las líneas que conectan las entidades y las relaciones.*

- **Notación de Mark:**  
  - *También utiliza diagramas ER, pero se enfoca en la claridad visual y simplicidad. En la notación de Mark, las cardinalidades se representan mediante símbolos específicos en las líneas que conectan las entidades, facilitando la interpretación rápida de las relaciones.*

### ***Importancia de la Cardinalidad en SQL***

- **Diseño de Base de Datos:** *Comprender la cardinalidad ayuda a diseñar relaciones adecuadas entre tablas, lo que mejora la integridad de los datos y la eficiencia de las consultas.*

- **Consultas Eficientes:** *La cardinalidad afecta cómo se pueden estructurar las consultas SQL. Conocer las relaciones entre las tablas permite crear consultas más efectivas y optimizadas.*

*![Image NotacionMark](/Images/ImageNotacionMark.png "/Images/ImageNotacionMark.png")*
*![Image NotacionMarkExample](/Images/ImageNotacionMarkExample.jpg "/Images/ImageNotacionMarkExample.jpg")*
