import csv
import os

input_dir = "data"
output_file = "datos_combinados.csv"

all_data_rows = []
header_written = False

# Iterar sobre todos los archivos en el directorio de entrada
for file_name in os.listdir(input_dir):
    if file_name.endswith(".csv"):
        file_path = os.path.join(input_dir, file_name)
        print(f"Procesando archivo: {file_name}")
        
        with open(file_path, "r", encoding="utf-8") as file:
            reader = csv.reader(file)
            # Leer las filas del archivo CSV
            rows = list(reader)
            
            if not header_written:
                # Si aún no se ha escrito el encabezado, lo hacemos ahora
                all_data_rows.extend(rows)
                header_written = True
            else:
                # Si el encabezado ya ha sido escrito, omitimos la primera fila (encabezado)
                all_data_rows.extend(rows[1:])

if all_data_rows:
    with open(output_file, "w", newline="", encoding="utf-8") as csv_file:
        writer = csv.writer(csv_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

        # Escribir todas las filas combinadas en el archivo de salida
        writer.writerows(all_data_rows)
    
    print(f"Archivo CSV combinado generado exitosamente: {output_file}")
else:
    print("No se encontraron archivos CSV para combinar.")
