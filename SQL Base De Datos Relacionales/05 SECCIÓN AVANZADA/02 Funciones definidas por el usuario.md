<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Funciones Definidas por el Usuario o en Inglés User Defined Functions (UDF)***

- *Las **funciones definidas por el usuario (UDF)** son funciones creadas por el propio usuario en SQL para realizar operaciones personalizadas que pueden integrarse directamente en consultas SQL. Estas funciones ofrecen flexibilidad adicional, permitiendo realizar cálculos o transformaciones que no están disponibles en las funciones nativas de SQL.*

---

## ***Diferencia entre UDF y Procedimientos Almacenados***

- *Las **UDF** y los **procedimientos almacenados** son diferentes:*

- **UDF:** *están diseñadas para utilizarse en expresiones dentro de consultas SQL y deben devolver un valor (como el cuadrado de un número en un conjunto de datos). Su objetivo es ayudar en operaciones rápidas y puntuales dentro de consultas.*
  
- **Procedimientos almacenados:** *son rutinas complejas almacenadas en la base de datos, diseñadas para ejecutar múltiples instrucciones SQL, pero no suelen usarse en expresiones de consultas. A diferencia de las UDF, los procedimientos almacenados pueden realizar tareas complejas, cambiar el estado de la base de datos (insertar, actualizar datos, etc.), y no necesariamente deben devolver un valor.*

---

### ***Implementación de UDF en SQLite3 usando Python como Código Anfitrión***

- *En el contexto de bases de datos y programación, un **código anfitrión** se refiere a un programa externo que interactúa con la base de datos, sirviendo como intermediario o "anfitrión" para ejecutar operaciones o extender la funcionalidad de la base de datos. En el caso de SQLite3, **Python actúa como anfitrión** al conectarse a la base de datos, ejecutar consultas, registrar funciones personalizadas (UDF) y procesar los datos obtenidos.*

---

### ***Ejemplo del rol de Python como código anfitrión en SQLite3***

1. **Conectar y ejecutar:** *Python establece la conexión con SQLite3, permitiendo realizar consultas SQL.*
2. **Registrar funciones:** *Python permite definir y registrar funciones personalizadas (como `square` en el ejemplo anterior), que SQLite3 usa dentro de las consultas.*
3. **Procesar y presentar datos:** *Python extrae los datos de SQLite3 y los presenta en un formato estructurado (como DataFrames de pandas).*

---

### ***Ventajas de usar un código anfitrión***

- **Mayor flexibilidad:** *Python puede realizar cálculos y transformaciones complejas que la base de datos no soporta de manera nativa.*
- **Integración y automatización:** *Python puede integrar el uso de SQLite3 en aplicaciones más amplias, automatizando operaciones de la base de datos como parte de flujos de trabajo.*

```python
"""
Aplicación en Python 3 para Funciones Definidas por el Usuario (UDF) en SQLite

>>> Esta aplicación en Python 3 utiliza SQLite para implementar
>>> y ejecutar funciones definidas por el usuario (UDFs) dentro de consultas SQL.
>>> La aplicación registra una función personalizada (`square`)
>>> que permite realizar operaciones específicas en los datos de la base de datos,
>>> mejorando la flexibilidad y potencia de las consultas. Además, 
>>> emplea pandas para estructurar y presentar los resultados en formato de DataFrame,
>>> facilitando el análisis de datos.
"""

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

import sqlite3  # Biblioteca para manejar bases de datos SQLite
import sys
from typing import Any, Callable, List, Optional, Tuple

import pandas as pd  # Biblioteca para manejar datos y generar DataFrames

# Variable opcional que puede ser un entero o None (sin valor asignado)
n: Optional[int] = None

# Define una función lambda `square` que toma un entero `n` y devuelve su cuadrado
square: Callable[[int], int] = lambda n: n**2


def main() -> None:
    """
    Funcion Principal que conecta a la base de datos,
    registra una UDF (función definida por el usuario)
    llamada `square`, consulta todos los productos y muestra el resultado en formato de DataFrame.
    """
    # Establece una conexión con la base de datos SQLite
    connection: sqlite3.Connection = sqlite3.connect(database="./Northwind.db")

    # Agrega la función `square` a la conexión, para poder llamarla en consultas SQL.
    # `create_function` permite definir funciones personalizadas (UDFs)
    # que se pueden usar en las consultas SQL.
    connection.create_function(name="square", narg=1, func=square)

    # Crea un cursor, que es un objeto para ejecutar comandos SQL sobre la base de datos
    cursor: sqlite3.Cursor = connection.cursor()

    # Ejecuta una consulta SQL que selecciona todos los registros de la tabla `Products`
    cursor.execute(
        """\
        SELECT * FROM Products;\
        """
    )

    # `fetchall()` obtiene todos los resultados de la consulta como una lista de tuplas
    resultado: List[Tuple[Any]] = cursor.fetchall()

    # `commit()` guarda cualquier cambio pendiente en la base de datos.
    # Aunque aquí no estamos haciendo cambios, es buena práctica incluirlo
    connection.commit()

    # Cierra el cursor para liberar recursos
    cursor.close()

    # Cierra la conexión a la base de datos
    connection.close()

    # Muestra los resultados como un DataFrame de pandas, en la salida estándar (stdout)
    print(pd.DataFrame(data=resultado), end="\n", file=sys.stdout)

    return None


def second() -> None:
    """
    Segunda función principal que utiliza una consulta SQL más compleja con la UDF `square`.
    """
    # Inicia la conexión como None, para luego usarla en el bloque `with`
    connection: Optional[sqlite3.Connection] = None

    # Utiliza un contexto `with` para manejar automáticamente la apertura y cierre de la conexión
    with sqlite3.connect(database="./Northwind.db") as connection:
        # Registra la función `square` en esta conexión, tal como en `main`
        connection.create_function(name="square", narg=1, func=square)

        # Crea un cursor para ejecutar comandos SQL
        cursor: sqlite3.Cursor = connection.cursor()

        # Intenta ejecutar una consulta SQL que usa la función `square`
        # para calcular el precio al cuadrado
        try:
            cursor.execute(
                """\
                SELECT "ProductID",\
                    "ProductName",\
                    square(Price) AS "Precio Al Cuadrado"\
                FROM Products\
                WHERE Price > 0\
                LIMIT 100\
                """
            )
        except sqlite3.OperationalError:
            # En caso de error (como si la columna `Price` no existiera),
            # se muestra un mensaje de error
            print(f"Error: {sqlite3.OperationalError}", end="\n", file=sys.stderr)
            sys.exit(1)  # Finaliza el programa si ocurre un error

        # Imprime los resultados de la consulta en un DataFrame de pandas
        print(pd.DataFrame(data=cursor.fetchall()), end="\n", file=sys.stdout)

        # Guarda cualquier cambio en la base de datos
        # (buena práctica aunque aquí no se hagan cambios)
        connection.commit()

        # Cierra el cursor
        cursor.close()

    # La conexión se cierra automáticamente al salir del bloque `with`,
    # pero se asegura el cierre explícito
    connection.close()

    return None


# `if __name__ == "__main__":` permite ejecutar el código solo si se ejecuta directamente el fichero
if __name__ == "__main__":
    # Ejecuta la función `second()` como función principal (se puede cambiar a `main()`)
    # main()
    second()
```

---

### ***Explicación de términos clave***

1. **Cursor:** *El cursor en SQLite permite ejecutar comandos SQL y obtener resultados. Es necesario porque administra las operaciones SQL y permite un acceso secuencial a los datos de la consulta.*
2. **create_function():** *Define una función personalizada (UDF) en la base de datos para usar en consultas SQL, como `square` en este caso, que calcula el cuadrado de un número.*
3. **commit():** *Asegura que los cambios hechos en la base de datos se guarden permanentemente.*
