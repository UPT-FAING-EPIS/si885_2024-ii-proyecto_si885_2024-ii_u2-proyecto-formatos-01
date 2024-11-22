import re
import csv
import os

input_dir = "data"
output_file = "datos_combinados.csv"

insert_regex = re.compile(
    r"INSERT INTO `trafico_red`.*?VALUES\s*(\(.*?\));", re.DOTALL
)

headers = [
    "`id`", "`fecha`", "`ip`", "`clase`", "`horario`", "`dia`", "`turno`", "`laboratorio`",
    "`total_enviado_mb`", "`total_recibido_mb`", "`tema`", "`navegador`", "`seccion`",
    "`docente`", "`total_mbps`", "`total_GB`", "`tiempo_sesion`", "`consumo_energia_kwh`"
]

all_data_rows = []

for file_name in os.listdir(input_dir):
    if file_name.endswith(".sql"):
        file_path = os.path.join(input_dir, file_name)
        print(f"Procesando archivo: {file_name}")
        with open(file_path, "r", encoding="utf-8") as file:
            sql_content = file.read()

        matches = insert_regex.findall(sql_content)
        print(f"Se encontraron {len(matches)} sentencias INSERT en {file_name}")

        for match in matches:
            rows = match.strip().strip(";").split("),")
            for row in rows:
                row = row.strip() + ")" if not row.endswith(")") else row
                
                values = re.split(r",\s*(?=(?:[^']*'[^']*')*[^']*$)", row.strip("()"))
                
                clean_values = [
                    v.strip().strip("'") if v.strip() != "NULL" else "NULL" for v in values
                ]
                
                quoted_values = [f'"{v}"' for v in clean_values]
                
                all_data_rows.append(quoted_values)

if all_data_rows:
    with open(output_file, "w", newline="", encoding="utf-8") as csv_file:
        writer = csv.writer(csv_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

        writer.writerow(headers)  
        
        for row in all_data_rows:
            writer.writerow(row)
    
    print(f"Archivo CSV generado exitosamente: {output_file}")
else:
    print("No se encontraron datos para escribir en el archivo CSV.")
