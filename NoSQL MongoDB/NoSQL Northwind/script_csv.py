# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/DanielPerezMoralesDev13
# Correo electrónico: danielperezdev@proton.me

"""
Este script convierte todos los ficheros JSON en un directorio a CSV.

Cargará todos los ficheros JSON desde un directorio específico y los guardará como ficheros CSV
en otro directorio indicado. Utiliza pandas para la lectura y escritura de los ficheros.
"""

import glob
import os
import sys
from typing import List

from pandas import DataFrame, read_json


def convertir_json_a_csv(json_file: str, output_dir: str) -> None:
    """
    Convierte un fichero JSON a un fichero CSV.

    Args:
        json_file (str): Ruta del fichero JSON de entrada.
        output_dir (str): Directorio donde se guardará el fichero CSV.
    """
    # Leer el fichero JSON
    data: DataFrame = read_json(path_or_buf=json_file)

    # Obtener el nombre base del fichero JSON sin la extensión
    base_name: str = os.path.basename(p=json_file).replace(".json", "")

    # Ruta completa para guardar el fichero CSV
    csview_file: str = os.path.join(output_dir, f"{base_name}.csv")

    # Guardar el DataFrame como un CSV
    data.to_csv(path_or_buf=csview_file, index=False)
    print(f"Fichero convertido: {csview_file}", end="\n", file=sys.stdout)
    return None


def main() -> None:
    """
    Convierte todos los ficheros JSON de un directorio a CSV.

    Carga todos los ficheros JSON desde un directorio y los guarda como ficheros CSV
    en otro directorio.
    """
    # Directorio donde están los ficheros JSON
    input_dir: str = "./Json"  # Reemplaza con la ruta a tu directorio JSON

    # Directorio donde se guardarán los ficheros CSV
    output_dir: str = "./Csv"  # Reemplaza con la ruta a tu directorio CSV

    # Crear el directorio de salida si no existe
    if not os.path.exists(path=output_dir):
        os.makedirs(name=output_dir)

    # Obtener la lista de todos los ficheros JSON en el directorio
    json_files: List[str] = glob.glob(os.path.join(input_dir, "*.json"))

    # Convertir cada fichero JSON a CSV
    for json_file in json_files:
        convertir_json_a_csv(json_file, output_dir)

    print("Conversión completada.", end="\n", file=sys.stdout)


if __name__ == "__main__":
    main()
    sys.exit(0)
