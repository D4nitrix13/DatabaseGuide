"""
    Aplicación en Python 3 que utiliza SQLite para gestionar y analizar datos.

    Esta aplicación se conecta a una base de datos SQLite y ejecuta consultas SQL
    para extraer información relevante. Utiliza la biblioteca Pandas para manejar
    datos de manera eficiente y Matplotlib para la visualización gráfica de los
    resultados, permitiendo un análisis visual de los productos y empleados más
    rentables de la base de datos Northwind.
"""


# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
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
