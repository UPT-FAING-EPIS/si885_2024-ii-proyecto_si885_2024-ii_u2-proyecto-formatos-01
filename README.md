[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=17040174)


# Sistema de Monitoreo y Gestión de Red para Laboratorios UPT (SIMGR-UPT)

**Descripción:**  
El **Sistema de Monitoreo y Gestión de Red para Laboratorios UPT (SIMGR-UPT)** tiene como objetivo supervisar en tiempo real el uso y desempeño de la red en los laboratorios de la Universidad Privada de Tacna. El sistema recopila datos sobre el consumo de ancho de banda, estabilidad de la conexión y otros aspectos relacionados con el rendimiento de la red. Esto permite identificar problemas de conectividad, optimizar el uso de los recursos de red y proporcionar soporte técnico proactivo, asegurando así un entorno educativo eficiente y libre de interrupciones.

### Integrantes

| Nombre                             | Insights Totales |
|------------------------------------|-------------------|
| Escobar Rejas, Carlos Andrés  | (2021070016) |
| Apaza Ccalle, Albert Kenyi   | (2021071075) |
| Ricardo Cutipa Gutierrez     | (2021069827) |
| Erick Churacutipa Blass     | (2020067578) |
| Jesus Huallpa Maron          | (2021071085) |

Aquí tienes un ejemplo de cómo documentar los artefactos mencionados en un archivo `README.md` para tu repositorio. Asegúrate de personalizarlo con detalles adicionales según sea necesario.

```markdown
# Proyecto de Automatización AWS

Este repositorio contiene los artefactos necesarios para la automatización de tareas en AWS, así como herramientas de análisis de datos y procesamiento. A continuación, se detallan los archivos y su propósito.

## 📂 Artefactos

### `G02_REDUPT.pbix`
- **Descripción**: Reporte de análisis de datos desarrollado en Power BI.
- **Propósito**: Visualización y análisis interactivo de datos procesados en el proyecto.
- **Notas**: Se requiere Power BI Desktop para abrir este archivo.

### `lambda_function.zip`
- **Descripción**: Código comprimido de una función Lambda en AWS.
- **Propósito**: Implementación de lógica de negocio o automatización en la nube utilizando AWS Lambda.
- **Notas**: Antes de desplegar, asegúrate de configurar las variables de entorno y los permisos necesarios en el entorno Lambda.

### `requirements.txt`
- **Descripción**: Lista de dependencias de Python para el proyecto.
- **Propósito**: Facilita la instalación de los paquetes requeridos mediante `pip`.
- **Uso**: Ejecutar el siguiente comando para instalar las dependencias:
  ```bash
  pip install -r requirements.txt
  ```

### `s3bucket.py`
- **Descripción**: Script en Python para interactuar con Amazon S3.
- **Propósito**: Automatización de operaciones relacionadas con almacenamiento en la nube, como la carga o descarga de archivos.
- **Notas**: Requiere las credenciales de AWS configuradas en el entorno.

### `sqlcsv.py`
- **Descripción**: Script en Python para convertir datos SQL a formato CSV.
- **Propósito**: Extraer datos desde una base de datos SQL y transformarlos en archivos CSV para su análisis o almacenamiento.
- **Notas**: Configurar correctamente la conexión a la base de datos en el script.

---

## 🚀 Instrucciones de Uso

1. **Instalar Dependencias**:
   Asegúrate de tener instalado Python y ejecuta:
   ```bash
   pip install -r requirements.txt
   ```

2. **Configuración**:
   - Configura tus credenciales de AWS en `~/.aws/credentials` o mediante variables de entorno.
   - Edita los scripts (`s3bucket.py`, `sqlcsv.py`) para personalizar las conexiones o parámetros necesarios.

3. **Ejecución**:
   - Para ejecutar un script:
     ```bash
     python <nombre_del_script>.py
     ```

---

## 👥 Contribuciones
Para contribuir, sigue los pasos habituales de creación de un fork, realiza los cambios en una nueva rama y haz un pull request con una descripción detallada.

---

## 🛠 Tecnología Utilizada
- **Lenguaje**: Python
- **Servicios en la nube**: AWS (Lambda, S3)
- **Visualización de datos**: Power BI
- **Bases de datos**: Soporte para SQL

---

## 📄 Licencia
Este proyecto está bajo la licencia [MIT](LICENSE). 
```

Si necesitas algo más detallado o específico, dime y lo ajustamos. 😊
