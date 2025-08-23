# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/D4nitrix13
# Correo electrónico: danielperezdev@proton.me

"""
Este programa se conecta a una base de datos MySQL y permite realizar consultas
sobre la tabla 'employees'. Incluye una función llamada 'print_first_name' que recibe 
un nombre de usuario como argumento, ejecuta una consulta para buscar dicho 
usuario en la base de datos, y muestra la información correspondiente en la 
consola. La implementación actual es vulnerable a inyección SQL debido a la 
concatenación directa de cadenas al construir las consultas.

Se recomienda utilizar consultas preparadas para mejorar la seguridad y evitar 
posibles ataques de inyección SQL.

Requisitos:
-----------
- mysql-connector-python

Instalacion:
-----------
- sudo apt-get && sudo apt-get install -y python3-pip
- python3 -m pip install mysql-connector-python
- pip install python-dotenv

Ejemplo de uso:
---------------
print_first_name(first_name="Nancy")
"""

# CONNECTORS

import os

# Ejemplo de conexión desde Python a una base de datos local
# Se ejemplifica cómo evitar SQL INJECTION
import sys
from typing import Dict, List, Optional, Union

import mysql.connector
import mysql.connector.abstracts
import mysql.connector.cursor_cext
import mysql.connector.types
from dotenv import load_dotenv

# Cargar variables de entorno desde el fichero .env
load_dotenv()

# Obtener las variables de entorno
host: Optional[str] = os.getenv(key="MYSQL_ADDON_HOST")
user: Optional[str] = os.getenv(key="MYSQL_ADDON_USER")
database: Optional[str] = os.getenv(key="MYSQL_ADDON_DB")
port: Optional[str] = os.getenv(key="MYSQL_ADDON_PORT")
password: Optional[str] = os.getenv(key="MYSQL_ADDON_PASSWORD")
config: List[Optional[str]] = [host, user, database, port, password]


def print_first_name(first_name: str) -> None:
    """
    Imprime información de un usuario de la base de datos.

    Esta función se conecta a una base de datos MySQL, ejecuta una consulta
    para buscar un usuario específico en la tabla 'employees' basándose en el
    nombre proporcionado, y muestra los resultados en la consola.

    Parámetros:
    ----------
    first_name : str
        El nombre del usuario a buscar en la base de datos.

    Ejemplo:
    --------
    print_first_name(first_name="Nancy")
    """
    # Configuración de conexión a la base de datos
    # config: Dict[str, Union[str, int]] = {
    #     "host": "172.17.0.4",
    #     "port": 3306,
    #     "database": "DatabaseTest",
    #     "first_name": "root",
    #     "password": "root"
    # }

    config: Dict[str, Optional[str]] = {
        "host": host,
        "port": port,
        "database": database,
        "user": user,
        "password": password,
    }

    # Union[PooledMySQLConnection, MySQLConnectionAbstract]
    connection: Union[
        mysql.connector.abstracts.MySQLConnectionAbstract,
        mysql.connector.pooling.PooledMySQLConnection,
        mysql.connector.connection_cext.CMySQLConnection,
    ] = mysql.connector.connect(**config)

    cursor: Union[
        mysql.connector.cursor_cext.CMySQLCursor,
        mysql.connector.abstracts.MySQLCursorAbstract,
    ] = connection.cursor()

    # query: str = "SELECT * FROM employees;"
    # query: str = "SELECT * FROM employees WHERE name=%s;"
    query = (
        f"SELECT * FROM employees WHERE first_name='{first_name}';"  # ! SQL Injection
    )
    print("Executing query:", query, end="\n\n", file=sys.stdout)

    cursor.execute(query)  # ! SQL Injection
    # cursor.execute(query, (first_name,))

    result: Union[
        List[
            Union[
                mysql.connector.types.RowType,
                Dict[str, mysql.connector.types.RowItemType],
            ]
        ],
        List[mysql.connector.types.RowType],
    ] = cursor.fetchall()

    row: Optional[
        Union[
            mysql.connector.types.RowType, Dict[str, mysql.connector.types.RowItemType]
        ]
    ] = None

    for row in result:
        print(row, end="\n", file=sys.stdout)

    cursor.close()
    connection.close()

    return None


if __name__ == "__main__":
    # Verificamos si todas las claves de configuración contienen valores.
    # Si alguna está vacía o falta, imprimimos un mensaje de error en la salida de errores estándar (stderr)
    # y terminamos la ejecución con un código de salida 1, indicando un fallo.
    if not all(config):
        print(
            "Credenciales incorrectas: falta una o más configuraciones",
            end="\n",
            file=sys.stderr,
        )
        sys.exit(1)

    print_first_name(first_name="Nancy")
    print_first_name(
        first_name="'; UPDATE employees SET country_region = 'NIC' WHERE id = 1; COMMIT; -- "
    )  # ! SQL Injection
    print_first_name(first_name="Nancy")
    sys.exit(0)
