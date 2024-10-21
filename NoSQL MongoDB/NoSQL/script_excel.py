# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

"""
Este script convierte todos los ficheros JSON en un directorio a Excel.

Cargará todos los ficheros JSON desde un directorio específico y los guardará como ficheros Excel
en otro directorio indicado. Utiliza pandas para la lectura y escritura de los ficheros.
"""

import glob
import os
import sys
from typing import List

from pandas import DataFrame, read_json


def convertir_json_a_excel(json_file: str, output_dir: str) -> None:
    """
    Convierte un fichero JSON a un fichero Excel (.xlsx).

    Args:
        json_file (str): Ruta del fichero JSON de entrada.
        output_dir (str): Directorio donde se guardará el fichero Excel.
    """
    # Leer el fichero JSON
    data: DataFrame = read_json(path_or_buf=json_file)

    # Obtener el nombre base del fichero JSON sin la extensión
    base_name: str = os.path.basename(p=json_file).replace(".json", "")

    # Ruta completa para guardar el fichero Excel
    excel_file: str = os.path.join(output_dir, f"{base_name}.xlsx")

    # Guardar el DataFrame como un archivo Excel
    data.to_excel(excel_writer=excel_file, index=False)
    print(f"Fichero convertido: {excel_file}", end="\n", file=sys.stdout)
    return None


def main() -> None:
    """
    Convierte todos los ficheros JSON de un directorio a Excel.

    Carga todos los ficheros JSON desde un directorio y los guarda como ficheros Excel
    en otro directorio.
    """
    # Directorio donde están los ficheros JSON
    input_dir: str = "./Json"  # Reemplaza con la ruta a tu directorio JSON

    # Directorio donde se guardarán los ficheros Excel
    output_dir: str = "./Excel"  # Reemplaza con la ruta a tu directorio Excel

    # Crear el directorio de salida si no existe
    if not os.path.exists(path=output_dir):
        os.makedirs(name=output_dir)

    # Obtener la lista de todos los ficheros JSON en el directorio
    json_files: List[str] = glob.glob(os.path.join(input_dir, "*.json"))

    # Convertir cada fichero JSON a Excel
    for json_file in json_files:
        convertir_json_a_excel(json_file, output_dir)

    print("Conversión completada.", end="\n", file=sys.stdout)


if __name__ == "__main__":
    main()
    sys.exit(0)
