# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/D4nitrix13
# Correo electrónico: danielperezdev@proton.me

"""
Este script se conecta a una base de datos, ejecuta una consulta SQL (SELECT *), 
y exporta los resultados a un fichero JSON.

Funcionamiento:
1. Conecta a una base de datos (en el ejemplo, SQLite).
2. Realiza una consulta SELECT * en una tabla indicada.
3. Convierte el resultado en un formato de Lista de diccionarios, donde cada fila es un diccionario.
4. Exporta el resultado a un fichero JSON con formato legible.

Es fácil de adaptar a otras bases de datos como MySQL o PostgreSQL cambiando la configuración 
de la conexión a la base de datos.
"""

import json
import sqlite3
import sys
from io import TextIOWrapper
from typing import Dict, List, Optional, Tuple, Union


def conectar_bd(ruta_bd: str) -> Optional[sqlite3.Connection]:
    """
    Conecta a la base de datos SQLite.

    Args:
        ruta_bd (str): La ruta de la base de datos SQLite.

    Returns:
        sqlite3.Connection: Conexión a la base de datos.
    """
    try:
        conexion: sqlite3.Connection = sqlite3.connect(database=ruta_bd)
        print("Conexión exitosa a la base de datos.", end="\n", file=sys.stdout)
        return conexion
    except sqlite3.Error as error:
        print(
            f"Error al conectar a la base de datos: {error}", end="\n", file=sys.stdout
        )
    return None


def consulta_bd(
    conexion: sqlite3.Connection, consulta: str
) -> Optional[List[Dict[str, Union[str, int]]]]:
    """
    Ejecuta una consulta SQL y devuelve los resultados.

    Args:
        conexion (sqlite3.Connection): Conexión a la base de datos.
        consulta (str): Consulta SQL a ejecutar.

    Returns:
        List: Resultados de la consulta.
    """
    cursor: sqlite3.Cursor = conexion.cursor()
    try:
        cursor.execute(consulta)
        filas: List[Tuple[int, str, str]] = cursor.fetchall()
        # Obtener nombres de columnas
        columnas: List[str] = [descripcion[0] for descripcion in cursor.description]
        # Convertir cada fila a un diccionario
        return [dict(zip(columnas, fila)) for fila in filas]
    except sqlite3.Error as error:
        print(f"Error al ejecutar la consulta: {error}", end="\n", file=sys.stdout)
    return None


def exportar_a_json(datos: List, nombre_fichero: str) -> None:
    """
    Exporta los datos obtenidos de la base de datos a un fichero JSON.

    Args:
        datos (List): Datos a exportar.
        nombre_fichero (str): Nombre del fichero JSON de salida.
    """
    try:
        fichero_json: Optional[TextIOWrapper] = None
        with open(file=nombre_fichero, mode="w", encoding="utf-8") as fichero_json:
            json.dump(obj=datos, fp=fichero_json, indent=4, ensure_ascii=False)
        print(
            f"Datos exportados exitosamente a {nombre_fichero}",
            end="\n",
            file=sys.stdout,
        )
    except IOError as error:
        print(f"Error al escribir el fichero JSON: {error}", end="\n", file=sys.stderr)
    return None


def main() -> None:
    """
    Función principal del script.

    Esta función realiza los siguientes pasos:
    1. Define la ruta de la base de datos SQLite a la que se conectará.
    2. Establece una conexión a la base de datos.
    3. Ejecuta una consulta SQL para seleccionar todos los registros de una tabla específica.
    4. Exporta los resultados de la consulta a un fichero JSON.
    5. Cierra la conexión a la base de datos.

    Asegúrate de cambiar la ruta de la base de datos y el nombre de la tabla según tu configuración.
    """
    # Ruta de la base de datos SQLite
    # Cambia esta ruta por la ubicación de tu base de datos
    ruta_bd: str = "/home/vscode/NoSQL.db"
    # Conectar a la base de datos
    conexion: Optional[sqlite3.Connection] = conectar_bd(ruta_bd=ruta_bd)

    if conexion is not None:
        # Consulta SQL
        tables: List[str] = [
            "Categories",
            "Customers",
            "Employees",
            "OrderDetails",
            "Orders",
            "Products",
            "Shippers",
            "Suppliers",
        ]
        i: Optional[str] = None
        for i in tables:
            # Cambia 'Categories' por tu tabla real
            consulta: str = f"SELECT * FROM {i}"
            # Ejecutar la consulta y obtener los resultados
            resultados = consulta_bd(conexion=conexion, consulta=consulta)

            if resultados is not None:
                # Exportar los resultados a JSON
                exportar_a_json(datos=resultados, nombre_fichero=f"{i}.json")

        # Cerrar la conexión
        conexion.close()
    return None


if __name__ == "__main__":
    main()
