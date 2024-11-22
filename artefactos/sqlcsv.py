import re
import os
from openpyxl import Workbook

# Configuración de directorios y archivos
input_dir = "data"  # Directorio de entrada con archivos .sql
output_file = "datos_combinados.xlsx"  # Archivo de salida

# Expresión regular para extraer las inserciones SQL
insert_regex = re.compile(
    r"INSERT INTO `trafico_red`.*?VALUES\s*(\(.*?\));", re.DOTALL
)

# Definir encabezados del archivo
headers = [
    "id", "fecha", "ip", "clase", "horario", "dia", "turno", "laboratorio",
    "total_enviado_mb", "total_recibido_mb", "tema", "navegador", "seccion",
    "docente", "total_mbps", "total_GB", "tiempo_sesion", "consumo_energia_kwh"
]

# Lista para almacenar todas las filas de datos
all_data_rows = []

# Procesar todos los archivos .sql en el directorio de entrada
for file_name in os.listdir(input_dir):
    if file_name.endswith(".sql"):
        file_path = os.path.join(input_dir, file_name)
        print(f"Procesando archivo: {file_name}")
        with open(file_path, "r", encoding="utf-8") as file:
            sql_content = file.read()
        
        # Buscar las coincidencias con la expresión regular
        matches = insert_regex.findall(sql_content)
        
        for match in matches:
            # Dividir los valores en filas
            rows = match.strip().strip(";").split("),")
            for row in rows:
                row = row.strip() + ")" if not row.endswith(")") else row
                # Dividir los valores respetando las comas dentro de cadenas
                values = re.split(r",\s*(?=(?:[^']*'[^']*')*[^']*$)", row.strip("()"))
                # Limpiar valores y manejar NULL
                clean_values = [v.strip().strip("'") if v.strip() != "NULL" else "" for v in values]
                all_data_rows.append(clean_values)

# Crear un archivo Excel usando openpyxl
wb = Workbook()
ws = wb.active
ws.title = "Datos Combinados"

# Escribir encabezados en la primera fila
ws.append(headers)

# Escribir las filas de datos
for data_row in all_data_rows:
    ws.append(data_row)

# Guardar el archivo Excel
wb.save(output_file)

print(f"Archivo XLSX generado exitosamente: {output_file}")
