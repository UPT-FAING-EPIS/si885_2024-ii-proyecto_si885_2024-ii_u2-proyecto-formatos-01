import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

s3 = boto3.client('s3', region_name='us-east-1')

bucket_name = 'netuptinteligencianegocios'
folder_name = 'datosimportantes/'  # Carpeta virtual (nota el '/' al final)
file_name = 'datos_combinados.csv'  # El nombre del archivo a subir
file_path = './datos_combinados.csv'  # Asumiendo que el archivo está en el mismo directorio que el script

def lambda_handler(event, context):
    try:
        # Subir el archivo a la carpeta en S3
        s3.upload_file(file_path, bucket_name, folder_name + file_name)
        print(f'Archivo "{file_name}" cargado con éxito a S3://{bucket_name}/{folder_name}{file_name}.')
    except FileNotFoundError:
        print(f'El archivo {file_path} no fue encontrado.')
    except NoCredentialsError:
        print('No se encontraron credenciales de AWS.')
    except PartialCredentialsError:
        print('Credenciales de AWS incompletas.')
    except Exception as e:
        print(f'Ocurrió un error: {e}')
