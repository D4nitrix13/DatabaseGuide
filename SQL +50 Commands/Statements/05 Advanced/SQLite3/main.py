# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

"""
Esta aplicación se conecta a una base de datos SQLite y simula procedimientos almacenados 
para gestionar usuarios en una tabla `users`. 

Contiene dos funciones:
1. `p_all_users`: Obtiene todos los registros de la tabla `users`.
2. `p_age_users`: Filtra los registros de usuarios según la edad proporcionada como parámetro.

La aplicación imprime en la consola los resultados de estas funciones.
"""

import sqlite3
import sys
from typing import Any, List, Tuple

# Conectar a la base de datos SQLite
conn: sqlite3.Connection = sqlite3.connect(database="./Database.db")
cursor: sqlite3.Cursor = conn.cursor()


def stored_procedure_all_users() -> List[Tuple[Any]]:
    """
    Simula el procedimiento almacenado `p_all_users` para obtener todos los usuarios.

    Retorna:
        List[Tuple[Any]]: Una lista de tuplas que contienen todos los registros de la tabla `users`.
    """
    cursor.execute("SELECT * FROM users")
    return cursor.fetchall()


def stored_procedure_age_users(age_param: int) -> List[Tuple[Any]]:
    """
    Simula el procedimiento almacenado `p_age_users` para obtener usuarios filtrados por edad.

    Args:
        age_param (int): La edad utilizada como criterio de filtrado.

    Retorna:
        List[Tuple[Any]]: Una lista de tuplas que contienen los registros de usuarios
        cuya edad coincide con `age_param`.
    """
    cursor.execute("SELECT * FROM users WHERE age = ?", (age_param,))
    return cursor.fetchall()


# Invocar la función `p_all_users`
print(p_all_users(), end="\n", file=sys.stdout)

# Invocar la función `p_age_users` con el parámetro `30`
print(p_age_users(age_param=30), end="\n", file=sys.stdout)

# Cerrar la conexión
conn.close()
sys.exit(0)
