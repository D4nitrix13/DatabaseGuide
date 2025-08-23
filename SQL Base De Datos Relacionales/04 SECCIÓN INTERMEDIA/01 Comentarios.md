<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Comentarios***

---

## ***1. Comentarios de una sola línea:***

- *Utiliza dos guiones (`--`) para agregar comentarios en una sola línea. Todo lo que aparezca después de `--` será ignorado por SQLite.*

```sql
-- Este es un comentario de una sola línea
SELECT * FROM Employees; -- Consulta todos los empleados
```

---

### ***2. Comentarios de varias líneas:***

*Para escribir comentarios de varias líneas, utiliza la sintaxis `/* ... */`. Puedes incluir comentarios largos o dividirlos en varias líneas.*

```sql
/*
  Este es un comentario
  de varias líneas
*/
SELECT * FROM Employees LIMIT 3;

/* Este comentario 
   también es válido */
SELECT * FROM Products LIMIT 3;
```
