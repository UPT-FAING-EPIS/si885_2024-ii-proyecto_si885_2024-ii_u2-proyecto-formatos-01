import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

s3 = boto3.client('s3', region_name='us-east-1')

bucket_name = 'netuptinteligencianegocios'
folder_name = 'datosimportantes/'  # Carpeta virtual (nota el '/' al final)

def lambda_handler(event, context):
    try:
        # Crear un objeto vacío con el nombre de la carpeta
        s3.put_object(Bucket=bucket_name, Key=folder_name)
        print(f'Carpeta "{folder_name}" creada con éxito en el bucket {bucket_name}.')
    except NoCredentialsError:
        print('No se encontraron credenciales de AWS.')
    except PartialCredentialsError:
        print('Credenciales de AWS incompletas.')
    except Exception as e:
        print(f'Ocurrió un error: {e}')
