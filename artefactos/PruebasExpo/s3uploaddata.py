import tkinter as tk
from tkinter import filedialog, messagebox
import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError
from tkinterdnd2 import TkinterDnD, DND_FILES

# Configuración de boto3 para AWS
s3 = boto3.client('s3', region_name='us-east-1')
glue = boto3.client('glue', region_name='us-east-1')

# Función para obtener el estado del crawler
def get_crawler_status():
    try:
        response = glue.get_crawler(Name="netuptinteligencianegocios-crawler")
        status = response['Crawler']['State']
        return status
    except Exception as e:
        messagebox.showerror("Error", f'Error al obtener el estado del crawler: {e}')
        return None

# Función para ejecutar el crawler de AWS Glue
def run_crawler():
    try:
        # Verificar el estado del crawler antes de ejecutar
        current_status = get_crawler_status()
        
        if current_status == 'RUNNING':
            messagebox.showinfo("Crawler en ejecución", "El crawler ya está en ejecución.")
            return

        # Si el crawler está detenido o en otro estado, iniciarlo
        response = glue.start_crawler(Name="netuptinteligencianegocios-crawler")
        messagebox.showinfo("Éxito", "El crawler ha sido ejecutado con éxito.")
    except Exception as e:
        messagebox.showerror("Error", f'Ocurrió un error al ejecutar el crawler: {e}')

# Función para subir el archivo a S3
def upload_file_to_s3(file_path, bucket_name, folder_name, status_label):
    try:
        # Subir el archivo a la carpeta en S3
        file_name = file_path.split('/')[-1]
        s3.upload_file(file_path, bucket_name, f"{folder_name}/{file_name}")
        messagebox.showinfo("Éxito", f'Archivo {file_path} cargado con éxito a S3://{bucket_name}/{folder_name}/{file_name}.')

        # Mostrar el estado actual del crawler
        status = get_crawler_status()
        if status:
            status_label.config(text=f"Estado del Crawler: {status}")

        # Preguntar si desea ejecutar el crawler
        if messagebox.askyesno("Ejecutar Crawler", "¿Deseas ejecutar el crawler para actualizar los datos?"):
            run_crawler()

    except FileNotFoundError:
        messagebox.showerror("Error", f'El archivo {file_path} no fue encontrado.')
    except NoCredentialsError:
        messagebox.showerror("Error", 'No se encontraron credenciales de AWS.')
    except PartialCredentialsError:
        messagebox.showerror("Error", 'Credenciales de AWS incompletas.')
    except Exception as e:
        messagebox.showerror("Error", f'Ocurrió un error: {e}')

# Función para seleccionar archivo con el explorador de archivos
def select_file(status_label):
    file_path = filedialog.askopenfilename(title="Selecciona un archivo", filetypes=[("Archivos CSV", "*.csv")])
    if file_path:
        upload_file_to_s3(file_path, 'netuptinteligencianegocios', 'netuptinteligencianegocios', status_label)

# Función que maneja el archivo arrastrado
def drop(event, status_label):
    file_path = event.data
    upload_file_to_s3(file_path, 'netuptinteligencianegocios', 'netuptinteligencianegocios', status_label)

# Crear la ventana de la interfaz gráfica
def create_gui():
    root = TkinterDnD.Tk()

    root.title("Subir archivos a S3")
    root.geometry("400x350")

    label = tk.Label(root, text="Arrastra tu archivo aquí o selecciona desde el explorador.")
    label.pack(pady=20)

    # Etiqueta que mostrará el estado del Crawler
    status_label = tk.Label(root, text="Estado del Crawler: Desconocido", font=("Arial", 12), fg="blue")
    status_label.pack(pady=10)

    # Botón para seleccionar archivo
    select_button = tk.Button(root, text="Seleccionar archivo", command=lambda: select_file(status_label))
    select_button.pack(pady=10)

    # Área donde se pueden arrastrar los archivos
    drop_area = tk.Label(root, text="Arrastra tu archivo CSV aquí", width=40, height=10, relief="solid", bd=2)
    drop_area.pack(pady=20)
    drop_area.drop_target_register(DND_FILES)
    drop_area.dnd_bind('<<Drop>>', lambda event: drop(event, status_label))

    # Actualizar el estado del crawler periódicamente cada 10 segundos
    def update_crawler_status():
        status = get_crawler_status()
        if status:
            status_label.config(text=f"Estado del Crawler: {status}")
        root.after(10000, update_crawler_status)  # Actualiza cada 10 segundos

    # Iniciar la actualización periódica del estado del crawler
    update_crawler_status()

    root.mainloop()

# Función principal que ejecuta la interfaz
def main():
    create_gui()

if __name__ == '__main__':
    main()
