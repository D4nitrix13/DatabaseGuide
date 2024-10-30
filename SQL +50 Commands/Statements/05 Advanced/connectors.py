"""
Este programa se conecta a una base de datos MySQL y permite realizar consultas
sobre la tabla 'users'. Incluye una función llamada 'print_user' que recibe 
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

Ejemplo de uso:
---------------
print_user(user="Alice Smith")
"""

# CONNECTORS

# Ejemplo de conexión desde Python a una base de datos local
# Se ejemplifica cómo evitar SQL INJECTION
import sys
from typing import Dict, List, Optional, Union

import mysql.connector
import mysql.connector.abstracts
import mysql.connector.cursor_cext
import mysql.connector.types


def print_user(user: str) -> None:
    """
    Imprime información de un usuario de la base de datos.

    Esta función se conecta a una base de datos MySQL, ejecuta una consulta
    para buscar un usuario específico en la tabla 'users' basándose en el
    nombre proporcionado, y muestra los resultados en la consola.

    Parámetros:
    ----------
    user : str
        El nombre del usuario a buscar en la base de datos.

    Ejemplo:
    --------
    print_user(user="Alice Smith")
    """
    # Configuración de conexión a la base de datos
    config: Dict[str, Union[str, int]] = {
        "host": "172.17.0.4",
        "port": 3306,
        "database": "DatabaseTest",
        "user": "root",
        "password": "root",
    }

    # config = {
    #     "host": "bpw0hq9h09e7mqicjhtl-mysql.services.clever-cloud.com",
    #     "port": "3306",
    #     "database": "bpw0hq9h09e7mqicjhtl",
    #     "user": "uqzby88erlhvkrty",
    #     "password": "oePXiCOHdU1WRV80NPyv"
    # }

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

    # query: str = "SELECT * FROM users;"
    # query: str = "SELECT * FROM users WHERE name=%s;"
    query = "SELECT * FROM users WHERE name='" + user + "';"  # ! SQL Injection
    print("Executing query:", query, end="\n\n", file=sys.stdout)

    cursor.execute(query)  # ! SQL Injection
    # cursor.execute(query, (user,))

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


print_user(user="Alice Smith")
print_user(
    user="'; UPDATE users SET age = '25' WHERE id = 1; COMMIT; -- "
)  # ! SQL Injection
print_user(user="Alice Smith")

"""

>>> https://planetscale.com/

>>> https://www.clever-cloud.com/
"""