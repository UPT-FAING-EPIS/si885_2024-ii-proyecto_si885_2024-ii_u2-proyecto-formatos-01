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


Aquí está la documentación con los artefactos presentados en formato de tabla para incluir en tu archivo `README.md`:

```markdown
# Proyecto de Automatización AWS

Este repositorio contiene los artefactos necesarios para la automatización de tareas en AWS, así como herramientas de análisis de datos y procesamiento. A continuación, se detalla cada archivo y su propósito.

## 📂 Artefactos

| Archivo              | Descripción                                                                 | Propósito                                                                   | Notas                                                                                       |
|----------------------|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| **`G02_REDUPT.pbix`** | Reporte de análisis de datos desarrollado en Power BI.                     | Visualización y análisis interactivo de datos.                              | Requiere Power BI Desktop para abrir.                                                      |
| **`lambda_function.zip`** | Código comprimido de una función Lambda en AWS.                        | Implementación de lógica de negocio o automatización en AWS Lambda.         | Configurar variables de entorno y permisos necesarios antes de desplegar.                  |
| **`requirements.txt`** | Lista de dependencias de Python.                                          | Facilita la instalación de paquetes requeridos con `pip`.                   | Instalar usando `pip install -r requirements.txt`.                                          |
| **`s3bucket.py`**     | Script en Python para interactuar con Amazon S3.                           | Automatización de operaciones en S3 como carga o descarga de archivos.      | Requiere credenciales de AWS configuradas en el entorno.                                   |
| **`sqlcsv.py`**       | Script en Python para convertir datos SQL a formato CSV.                  | Extraer datos de SQL y transformarlos en archivos CSV.                       | Configurar conexión a la base de datos antes de ejecutar.                                  |

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

Este formato organizado facilita la lectura y permite encontrar información rápidamente. ¿Quieres añadir algo más? 😊
