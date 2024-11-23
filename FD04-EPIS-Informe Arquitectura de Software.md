<center>

![Logo de Mi Empresa](./media/logo-empresa.png)
![Logo de mi Cliente](./media/logo-cliente.png)

# UNIVERSIDAD PRIVADA DE TACNA  
## FACULTAD DE INGENIERÍA  
### Escuela Profesional de Ingeniería de Sistemas

**Sistema de Monitoreo y Gestión de Red para Laboratorios UPT (SIMGR-UPT)**

Curso: *Inteligencia de Negocios*  
Docente: *Mag. Patrick Cuadros Quiroga*

**Integrantes:**

- Escobar Rejas, Carlos Andrés (2021070016)
- Apaza Ccalle, Albert Kenyi (2021071075)
- Cutipa Gutierrez, Ricardo (2021069827)
- Churacutipa Blass, Erick (2020067578)
- Huallpa Maron, Jesús Antonio (2021071085)

**Tacna – Perú**  
***2024***

</center>

---

# Sistema de Monitoreo y Gestión de Red para Laboratorios UPT (SIMGR-UPT)*

**Documento de Especificación de Requerimientos de Software**

Versión *{1.0}*

---

## CONTROL DE VERSIONES

| Versión | Hecha por | Revisada por | Aprobada por | Fecha      | Motivo           |
| :-----: | --------- | ------------ | ------------ | ---------- | ---------------- |
| 1.0     | CER       | RDCG          | AAC         | 18/11/2024 | Versión Original |
---

# INDICE GENERAL

1. **INTRODUCCIÓN**
   - 1.1. Propósito (Diagrama 4+1)
   - 1.2. Alcance
   - 1.3. Definición, siglas y abreviaturas
   - 1.4. Organización del documento
2. **OBJETIVOS Y RESTRICCIONES ARQUITECTÓNICAS**
   - 2.1. Requerimientos Funcionales
   - 2.2. Requerimientos No Funcionales – Atributos de Calidad
3. **REPRESENTACIÓN DE LA ARQUITECTURA DEL SISTEMA**
   - 3.1. Vista de Caso de uso
     - 3.1.1. Diagramas de Casos de uso
   - 3.2. Vista Lógica
     - 3.2.1. Diagrama de Subsistemas (paquetes)
     - 3.2.2. Diagrama de Secuencia (vista de diseño)
     - 3.2.3. Diagrama de Colaboración (vista de diseño)
     - 3.2.4. Diagrama de Objetos
     - 3.2.5. Diagrama de Clases
     - 3.2.6. Diagrama de Base de datos (relacional o no relacional)
   - 3.3. Vista de Implementación (vista de desarrollo)
     - 3.3.1. Diagrama de arquitectura software (paquetes)
     - 3.3.2. Diagrama de arquitectura del sistema (Diagrama de componentes)
   - 3.4. Vista de procesos
     - 3.4.1. Diagrama de Procesos del sistema (diagrama de actividad)
   - 3.5. Vista de Despliegue (vista física)
     - 3.5.1. Diagrama de despliegue
4. **ATRIBUTOS DE CALIDAD DEL SOFTWARE**
   - Escenario de Funcionalidad
   - Escenario de Usabilidad
   - Escenario de Confiabilidad
   - Escenario de Rendimiento
   - Escenario de Mantenibilidad
   - Otros Escenarios

---

# INTRODUCCIÓN

### 1.1 Propósito (Diagrama 4+1)

Con la incorporación de nuevas tecnologías y servicios, el propósito del sistema SIMGR-UPT evoluciona para incluir capacidades de procesamiento y análisis de datos basadas en la nube. Estas adiciones permiten:

Automatización del flujo de datos: Desde la extracción de datos hasta la generación de reportes listos para análisis en Power BI.
Escalabilidad en el procesamiento: Uso de servicios como AWS Lambda y Athena para manejar grandes volúmenes de datos de red sin afectar el rendimiento.
Integración continua: La incorporación de AWS IAM Roles, Lambda y S3 garantiza la interoperabilidad entre los servicios, mientras que Power BI permite una visualización interactiva y dinámica de los datos.
El nuevo flujo incluye:

 - Repositorio (IAM Role): Los archivos CSV se almacenan en un repositorio.
 - Procesamiento (Lambda): Los scripts en Python se ejecutan automáticamente en AWS Lambda para procesar los datos.
 - Almacenamiento (S3 Bucket): Los datos procesados se almacenan en un bucket S3.
 - Configuración (Glue Crawler): AWS Glue configura automáticamente los datos recibidos y genera tablas de metadatos.
 - Consulta (Athena): Las tablas se consultan mediante SQL en Athena.
 - Visualización (Power BI): Los resultados procesados se integran con Power BI para una visualización avanzada y generación de informes.
   
Estas mejoras refuerzan la funcionalidad del sistema y lo alinean con estándares modernos de arquitectura de datos, asegurando un flujo continuo desde la recopilación hasta el análisis.



### 1.2 Alcance
El sistema ahora incluye los siguientes componentes clave:

Repositorio inicial: Recepción de datos en formato CSV desde distintas fuentes.
AWS Lambda: Ejecución automatizada de scripts en Python para procesar los datos de red.
AWS S3 y Glue: Almacenamiento y configuración automática de los datos, generando tablas para consulta y análisis.
AWS Athena: Plataforma de consulta para procesar los datos mediante SQL y generar métricas clave.
Power BI: Visualización avanzada e interactiva de los datos en tiempo real.
El alcance sigue centrado en el análisis del desempeño de la red en los laboratorios, pero ahora abarca:

Automatización del flujo de datos en la nube.
Mayor capacidad para manejar volúmenes crecientes de datos y nuevos requisitos.
Se omiten vistas o componentes que no estén alineados con este enfoque, como integraciones directas con hardware físico o desarrollo de aplicaciones móviles.

### 1.3 Definición, siglas y abreviaturas

|  Término/Acrónimo  | Definición                                                                                  |
| :-----------------: | :------------------------------------------------------------------------------------------ |
| IAM Role           | Rol de identidad y acceso en AWS que otorga permisos para interactuar con recursos en la nube. |
| Lambda             | Servicio sin servidor de AWS que ejecuta scripts en respuesta a eventos.                    |
| S3 Bucket          | Servicio de almacenamiento en la nube de AWS utilizado para guardar y recuperar datos.      |
| Glue Crawler       | Herramienta de AWS Glue que escanea datos y genera automáticamente metadatos para su análisis. |
| Athena             | Servicio de consultas SQL sin servidor en AWS que permite explorar datos almacenados en S3. |
| Power BI           | Herramienta de Microsoft para la visualización interactiva y generación de informes.         |
| CSV                | Formato de archivo que almacena datos tabulares separados por comas.                        |


### 1.4 Organización del documento

El documento incluye ahora los nuevos flujos y tecnologías integrados en el sistema, con la siguiente estructura:

- INTRODUCCIÓN: Contexto del proyecto, propósito, alcance y definiciones clave.
- OBJETIVOS Y RESTRICCIONES ARQUITECTÓNICAS: Actualizado para incluir los nuevos servicios y tecnologías implementados.
- REPRESENTACIÓN DE LA ARQUITECTURA DEL SISTEMA: Diagramas UML actualizados, como diagramas de flujo de datos, vistas lógicas, de procesos y físicas.
- ATRIBUTOS DE CALIDAD DEL SOFTWARE: Evaluación del impacto de las nuevas tecnologías en la funcionalidad, confiabilidad y rendimiento.
- CONCLUSIONES Y RECOMENDACIONES: Beneficios de la integración con AWS y sugerencias para futuras mejoras.

---

# OBJETIVOS Y RESTRICCIONES ARQUITECTÓNICAS

### 2.1 Requerimientos Funcionales

|  ID   | Descripción                                                                                           | Prioridad |
| :---: | :---------------------------------------------------------------------------------------------------- | :-------: |
| RF-01 | Monitorear en tiempo real el uso del tráfico de red de los equipos. |   Alta    |
| RF-02 | Generar reportes detallados y personalizables sobre el rendimiento de los equipos y patrones de uso.   |   Alta    |
| RF-03 | Detectar, notificar y registrar anomalías en el rendimiento de los recursos tecnológicos.              |   Alta    |
| RF-04 | Exportar datos en formatos compatibles con Tableau (CSV, Excel) y JSON.                               |   Alta    |
| RF-05 | Almacenar datos históricos para análisis a largo plazo y comparativas de rendimiento.                  |   Alta    |
| RF-06 | Proporcionar un panel de control interactivo para visualizar datos clave en tiempo real.               |   Alta    |
| RF-07 | Permitir la integración con otros sistemas de gestión de la universidad mediante API REST.             |  Media    |

### 2.2 Requerimientos No Funcionales – Atributos de Calidad

|  ID   | Descripción                                                                                   | Prioridad |
| :---: | :-------------------------------------------------------------------------------------------- | :-------: |
| RNF-01 | El sistema debe ser compatible con sistemas operativos Windows y distribuciones de Linux.     |   Alta    |
| RNF-02 | La interfaz debe ser intuitiva y accesible desde navegadores web modernos.                    |   Alta    |
| RNF-03 | Los datos recolectados deben estar protegidos mediante protocolos de seguridad.  |   Alta    |
| RNF-04 | La solución debe ser escalable para nuevos laboratorios sin comprometer el rendimiento.       |   Alta    |
| RNF-05 | El tiempo de respuesta para operaciones críticas debe ser menor a 2 segundos.                 |   Alta    |
| RNF-06 | El almacenamiento debe incluir respaldo automático y procedimientos de recuperación ante fallos. |   Alta    |
| RNF-07 | El consumo de recursos del sistema debe ser mínimo para no afectar el rendimiento de los equipos monitorizados. |  Media    |

### 2.3 Restricciones
[Restricciones específicas del proyecto.]

---

# REPRESENTACIÓN DE LA ARQUITECTURA DEL SISTEMA

### 3.1 Vista de Caso de uso
[Descripción de casos de uso del sistema, actores y funcionalidades.]

#### 3.1.1 Diagramas de Casos de uso
[Escenarios representados mediante diagramas de casos de uso.]

### 3.2 Vista Lógica
[Representación de los requerimientos funcionales del sistema.]

#### 3.2.1 Diagrama de Subsistemas (paquetes)
[Diagrama mostrando límites del sistema y entidades que interactúan con él.]

#### 3.2.2 - 3.2.6 Otros diagramas
[Incluir diagramas de secuencia, colaboración, objetos, clases y base de datos.]

### 3.3 Vista de Implementación (vista de desarrollo)
[Mapa de los subsistemas, paquetes y clases de la Vista Lógica.]

#### 3.3.1 Diagrama de arquitectura software (paquetes)
[Descripción de la arquitectura del sistema, distribución y funciones.]

### 3.4 Vista de procesos
[Descomposición del sistema en procesos pesados y su interacción.]

#### 3.4.1 Diagrama de Procesos del sistema
[Diagrama mostrando actividades del sistema propuesto.]

### 3.5 Vista de Despliegue (vista física)
[Escenarios de distribución física del sistema y comunicación entre nodos.]

#### 3.5.1 Diagrama de despliegue
[Diagrama de despliegue mostrando contenedores del sistema.]

---

# ATRIBUTOS DE CALIDAD DEL SOFTWARE

### Escenario de Funcionalidad
[Evaluación de características y capacidades del sistema.]

### Escenario de Usabilidad
[Facilidad de uso y aprendizaje del sistema.]

### Escenario de Confiabilidad
[Confidencialidad, integridad y disponibilidad de los datos del sistema.]

### Escenario de Rendimiento
[Velocidad de procesamiento y uso de recursos.]

### Escenario de Mantenibilidad
[Extensibilidad, adaptabilidad y servicialidad del sistema.]

### Otros Escenarios
[Otros atributos de calidad, como rendimiento o performance.]

