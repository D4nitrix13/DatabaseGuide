<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Ejercicio final (SQL + Python)***

- **En SQLite, la función `CONCAT` no está soportada directamente. Sin embargo, puedes concatenar cadenas utilizando el operador `||` o la función `printf()`. Aquí te explico ambas formas.**

---

## ***Usando el Operador `||`***

**Puedes utilizar el operador `||` para concatenar cadenas en SQLite. Por ejemplo:**

```sql
SELECT FirstName || ' ' || FirstName AS Name
FROM Employees;
```

**Este ejemplo concatena el nombre y el apellido de los empleados, separándolos con un espacio.**

---

### ***Usando `printf()`***

**La función `printf()` también se puede usar para concatenar cadenas:**

```sql
SELECT printf('%s %s', FirstName, LastName) AS Name
FROM Employees;
```

---

### ***Concatenar Más de Dos Cadenas***

- **Si necesitas concatenar más de dos cadenas, simplemente puedes seguir usando el operador `||`:**

```sql
SELECT FirstName || ' ' || middle_name || ' ' || LastName AS Name
FROM Employees;
```

**O utilizando `printf()`:**

```sql
SELECT printf('%s %s %s', FirstName, middle_name, LastName) AS Name
FROM Employees;
```

---

### ***Ejemplo Completo***

**Aquí tienes un ejemplo que muestra cómo concatenar tres cadenas en una consulta completa:**

```sql
SELECT FirstName || ' ' || middle_name || ' ' || LastName AS Name
FROM Employees;
```

*Ambas formas son equivalentes y te permitirán lograr la concatenación de cadenas en SQLite.*

---

### ***Convertir a Cadena con `CAST`***

- **Para concatenar cadenas con otros tipos de datos (como enteros o fechas) en SQLite, debes convertir esos tipos de datos a cadenas antes de la concatenación. SQLite proporciona varias funciones para realizar conversiones.**

**Puedes utilizar la función `CAST` para convertir otros tipos de datos a cadenas antes de concatenarlos.**

---

#### ***Ejemplo de Concatenación de Enteros***

- **Supongamos que tienes una tabla llamada `orders` con un campo `order_id` (entero) y un campo `order_date` (fecha). Si quieres concatenar el `order_id` y la fecha, puedes hacer lo siguiente:**

```sql
SELECT 
    'Order ID: ' || CAST(OrderID AS TEXT) || ', Date: ' || DATE("OrderDate") AS OrderInfo
FROM Orders
LIMIT 10;
```

```sql
sqlite> SELECT
    'Order ID: ' || CAST(OrderID AS TEXT) || ', Date: ' || DATE("OrderDate") AS OrderInfo
FROM Orders
LIMIT 10;
Order ID: 10248, Date: 1996-07-04
Order ID: 10249, Date: 1996-07-05
Order ID: 10250, Date: 1996-07-08
Order ID: 10251, Date: 1996-07-08
Order ID: 10252, Date: 1996-07-09
Order ID: 10253, Date: 1996-07-10
Order ID: 10254, Date: 1996-07-11
Order ID: 10255, Date: 1996-07-12
Order ID: 10256, Date: 1996-07-15
Order ID: 10257, Date: 1996-07-16
```

---

### ***Convertir a Cadena con `printf()`***

**También puedes usar la función `printf()` para formatear y concatenar diferentes tipos de datos. Esta función es muy útil porque puedes especificar el formato de salida.**

---

#### ***Ejemplo de Uso de `printf()`***

- **Aquí hay un ejemplo utilizando `printf()` para concatenar un entero y una fecha:**

```sql
SELECT 
    PRINTF('Order ID: %d, Date: %s', "OrderID", DATE("OrderDate")) AS OrderInfo
FROM Orders
LIMIT 10;
```

```sql
SELECT 
    PRINTF('Order ID: %d, Date: %s', "OrderID", DATE("OrderDate")) AS OrderInfo
FROM Orders
LIMIT 10;
Order ID: 10248, Date: 1996-07-04
Order ID: 10249, Date: 1996-07-05
Order ID: 10250, Date: 1996-07-08
Order ID: 10251, Date: 1996-07-08
Order ID: 10252, Date: 1996-07-09
Order ID: 10253, Date: 1996-07-10
Order ID: 10254, Date: 1996-07-11
Order ID: 10255, Date: 1996-07-12
Order ID: 10256, Date: 1996-07-15
Order ID: 10257, Date: 1996-07-16
```

---

### ***Concatenación de Fechas***

- **Cuando trabajas con fechas, puedes formatearlas en el estilo que desees. Por ejemplo, si quieres mostrar la fecha en un formato específico:**

```sql
SELECT 
    'Order ID: ' || CAST(OrderID AS TEXT) || ', Date: ' || strftime('%Y-%m-%d', OrderDate) AS OrderInfo
FROM Orders 
LIMIT 10;
```

```sql
sqlite> SELECT 
    'Order ID: ' || CAST(OrderID AS TEXT) || ', Date: ' || strftime('%Y-%m-%d', OrderDate) AS OrderInfo
FROM Orders 
LIMIT 10;
Order ID: 10248, Date: 1996-07-04
Order ID: 10249, Date: 1996-07-05
Order ID: 10250, Date: 1996-07-08
Order ID: 10251, Date: 1996-07-08
Order ID: 10252, Date: 1996-07-09
Order ID: 10253, Date: 1996-07-10
Order ID: 10254, Date: 1996-07-11
Order ID: 10255, Date: 1996-07-12
Order ID: 10256, Date: 1996-07-15
Order ID: 10257, Date: 1996-07-16
```

---

### ***Resumen***

- **Para concatenar diferentes tipos de datos en SQLite:**

1. **Usa `CAST`** *para convertir tipos a texto antes de concatenar.*
2. **Usa `printf()`** *para formatear y concatenar tipos de datos diversos.*
3. **Asegúrate de que todas las partes de la concatenación sean cadenas** *para evitar errores.*

- *La expresión `strftime('%Y-%m-%d', OrderDate)` se utiliza en SQLite para formatear fechas.*

- **`strftime`:** *Esta es una función de formato de cadena que se utiliza para convertir una fecha en un formato específico.*
  
- **`'%Y-%m-%d'`:** *Este es el formato de salida que se desea. En este caso:*
  - *`%Y` representa el año con cuatro dígitos (por ejemplo, 2024).*
  - *`%m` representa el mes con dos dígitos (por ejemplo, 01 para enero, 02 para febrero, etc.).*
  - *`%d` representa el día del mes con dos dígitos (por ejemplo, 01, 02, etc.).*
  
  *Al usar este formato, la fecha se convierte en una cadena con el formato `YYYY-MM-DD`.*

- **`OrderDate`:** *Este es el campo o columna de la base de datos que contiene la fecha que se quiere formatear. Debe ser de tipo de dato `DATE` o `DATETIME`.*

- *En resumen, `strftime('%Y-%m-%d', OrderDate)` toma la fecha de `OrderDate` y la convierte en una cadena en el formato `Año-Mes-Día`, facilitando su lectura o comparación en consultas SQL.*

*Estos enfoques te permiten combinar cualquier tipo de dato en una sola cadena de texto.*

---

### ***Aplicación en Python 3 que utiliza SQLite para gestionar y analizar datos.***

```python
"""
    Aplicación en Python 3 que utiliza SQLite para gestionar y analizar datos.

    Esta aplicación se conecta a una base de datos SQLite y ejecuta consultas SQL
    para extraer información relevante. Utiliza la biblioteca Pandas para manejar
    datos de manera eficiente y Matplotlib para la visualización gráfica de los
    resultados, permitiendo un análisis visual de los productos y empleados más
    rentables de la base de datos Northwind.
"""


# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/D4nitrix13
# Correo electrónico: danielperezdev@proton.me

import sqlite3  # Biblioteca para manejar bases de datos SQLite

import matplotlib
import pandas as pd  # Biblioteca para manejar datos y generar DataFrames

matplotlib.use(
    backend="TkAgg"
)  # Configura el backend de Matplotlib para la visualización en Tkinter
import matplotlib.pyplot as plt  # Importa la biblioteca para crear gráficos


def main() -> None:
  """
    Obtiene los 10 productos más rentables de la base de datos.
    
    Esta función se conecta a la base de datos Northwind y ejecuta una consulta SQL que
    calcula los ingresos totales generados por cada producto a partir de la tabla de 
    `OrderDetails` y la tabla de `Products`. Se agrupan los resultados por `ProductID` 
    y se ordenan en orden descendente según los ingresos. Los 10 productos con mayores
    ingresos se visualizan en un gráfico de barras, mostrando el nombre del producto y
    su respectivo ingreso total.
    """

    # Establece una conexión a la base de datos SQLite Northwind
    connection: sqlite3.Connection = sqlite3.connect(database="./Northwind.db")

    # Define la consulta SQL para obtener los 10 productos con mayor ingreso
    query: str = """\
        SELECT ProductName,\
         SUM(p.Price * od.Quantity) AS Revenue\
        FROM [OrderDetails] od\
        INNER JOIN [Products] p\
        ON p.ProductID = od.ProductID\
        GROUP BY od.ProductID\
        ORDER BY Revenue DESC NULLS LAST\
        LIMIT 10;\
    """

    # Ejecuta la consulta y guarda el resultado en un DataFrame de pandas
    top_products: pd.DataFrame = pd.read_sql_query(sql=query, con=connection)

    # Realiza el commit de la conexión,
    # asegurando que todas las operaciones se guarden (aunque aquí no hay cambios)
    connection.commit()

    # Cierra la conexión a la base de datos
    connection.close()

    # Genera un gráfico de barras de los productos más rentables
    top_products.plot(
        x="ProductName",  # Eje X: nombre del producto
        y="Revenue",  # Eje Y: ingreso generado por el producto
        kind="bar",  # Tipo de gráfico: barras
        figsize=(20, 15),  # Tamaño de la figura (ancho, alto)
        legend=False,  # No muestra la leyenda
    )

    # Configura el título del gráfico
    plt.title(label="10 Productos más Rentables")
    plt.xlabel(xlabel="ProductName")  # Etiqueta del eje X
    plt.ylabel(ylabel="Revenue")  # Etiqueta del eje Y
    plt.xticks(rotation=90)  # Rota las etiquetas del eje X para mejor legibilidad
    plt.subplots_adjust(
        bottom=0.3
    )  # Ajusta el espacio en la parte inferior del gráfico
    plt.show()  # Muestra el gráfico
    return None


def second() -> None:
   """
    Obtiene los 10 empleados más rentables de la base de datos.
    
    Esta función se conecta a la base de datos Northwind y ejecuta una consulta SQL que
    identifica a los 10 empleados que han generado la mayor cantidad de ingresos a través
    de las ventas. Se utiliza una combinación de las tablas de `Orders` y `Employees`, 
    donde se cuenta el número total de pedidos realizados por cada empleado. Los resultados
    se presentan en un gráfico de barras, mostrando el nombre de cada empleado junto con
    el total de ventas generadas.
    """

    # Establece una conexión a la base de datos SQLite Northwind
    connection: sqlite3.Connection = sqlite3.connect(database="./Northwind.db")

    # Define la consulta SQL para obtener los 10 empleados con más ventas
    query: str = """\
        SELECT e.FirstName || " " || e.LastName AS Name,\
            COUNT(*) AS Total\
        FROM [Orders] o\
        INNER JOIN [Employees] e\
        ON e.EmployeeID = o.EmployeeID\
        GROUP BY o.EmployeeID\
        ORDER BY Total Desc NULLS LAST\
        LIMIT 10;\
    """

    # Ejecuta la consulta y guarda el resultado en un DataFrame de pandas
    top_employees: pd.DataFrame = pd.read_sql_query(sql=query, con=connection)

    # Realiza el commit de la conexión (aunque aquí no hay cambios)
    connection.commit()

    # Cierra la conexión a la base de datos
    connection.close()

    # Genera un gráfico de barras de los empleados más rentables
    top_employees.plot(
        x="Name",  # Eje X: nombre del empleado
        y="Total",  # Eje Y: total vendido por el empleado
        kind="bar",  # Tipo de gráfico: barras
        figsize=(20, 15),  # Tamaño de la figura (ancho, alto)
        legend=False,  # No muestra la leyenda
    )

    # Configura el título del gráfico
    plt.title(label="10 Empleados más Rentables")
    plt.xlabel(xlabel="Name")  # Etiqueta del eje X
    plt.ylabel(ylabel="Total Vendido")  # Etiqueta del eje Y
    plt.xticks(rotation=90)  # Rota las etiquetas del eje X para mejor legibilidad
    plt.subplots_adjust(
        bottom=0.3
    )  # Ajusta el espacio en la parte inferior del gráfico
    plt.show()  # Muestra el gráfico
    return None


if __name__ == "__main__":
    # main()  # Llama a la función main() para ejecutar el primer gráfico
    second()  # Llama a la función second() para ejecutar el segundo gráfico
```

---

### ***Resumen de los Métodos y Funciones***

- **`sqlite3.connect()`:** *Establece una conexión a una base de datos SQLite.*
- **`pd.read_sql_query()`:** *Ejecuta una consulta SQL y devuelve el resultado en un DataFrame de pandas.*
- **`DataFrame.plot()`:** *Crea un gráfico a partir de los datos del DataFrame.*
- **`plt.title()`**, **`plt.xlabel()`**, **`plt.ylabel()`:** *Configuran el título y las etiquetas de los ejes en el gráfico.*
- **`plt.xticks()`:** *Ajusta la rotación de las etiquetas del eje X.*
- **`plt.subplots_adjust()`:** *Ajusta los márgenes de la figura.*
- **`plt.show()`:** *Muestra el gráfico en una ventana emergente.*
