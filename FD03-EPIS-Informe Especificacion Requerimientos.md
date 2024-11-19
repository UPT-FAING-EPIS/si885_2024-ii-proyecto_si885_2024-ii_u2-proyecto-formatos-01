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
| 1.0     | RCG       | AAC          | AAC          | 18/11/2024 | Versión Original |
---

# INDICE GENERAL

1. [INTRODUCCION](#INTRODUCCION)  
   - I. Generalidades de la Empresa  
     - 1. Nombre de la Empresa
     - 2. Visión
     - 3. Misión
     - 4. Organigrama
   - II. Visionamiento de la Empresa  
     - 1. Descripción del Problema
     - 2. Objetivos de Negocios
     - 3. Objetivos de Diseño
     - 4. Alcance del proyecto
     - 5. Viabilidad del Sistema
     - 6. Información obtenida del Levantamiento de Información
   - III. Análisis de Procesos  
     - a) Diagrama del Proceso Actual – Diagrama de actividades
     - b) Diagrama del Proceso Propuesto – Diagrama de actividades Inicial
   - IV. Especificación de Requerimientos de Software  
     - a) Cuadro de Requerimientos funcionales Inicial
     - b) Cuadro de Requerimientos No funcionales
     - c) Cuadro de Requerimientos funcionales Final
     - d) Reglas de Negocio
   - V. Fase de Desarrollo  
     - 1. Perfiles de Usuario
     - 2. Modelo Conceptual  
       - a) Diagrama de Paquetes
       - b) Diagrama de Casos de Uso
       - c) Escenarios de Caso de Uso (narrativa)
     - 3. Modelo Lógico  
       - a) Análisis de Objetos
       - b) Diagrama de Actividades con objetos
       - c) Diagrama de Secuencia
       - d) Diagrama de Clases

2. [CONCLUSIONES](#CONCLUSIONES)
3. [RECOMENDACIONES](#RECOMENDACIONES)
4. [BIBLIOGRAFÍA](#BIBLIOGRAFIA)
5. [WEBGRAFÍA](#WEBGRAFIA)

---

## I. Introducción <a id="introducción"></a>

El desempeño de la red en los laboratorios de informática de la Universidad Privada de Tacna es un elemento crucial para garantizar la calidad del aprendizaje y la eficiencia operativa de las actividades académicas. Actualmente, los laboratorios enfrentan desafíos significativos relacionados con la falta de monitoreo en tiempo real, lo que dificulta la detección temprana de problemas y limita la capacidad de respuesta ante incidentes que afectan la conectividad.

En este contexto, el desarrollo de un sistema de monitoreo de red se presenta como una solución integral para abordar estas limitaciones. Este sistema no solo permitirá supervisar continuamente el estado de la red en los laboratorios, sino que también facilitará la identificación de cuellos de botella, el análisis de tendencias de uso y la optimización del ancho de banda.

La herramienta propuesta recopilará datos clave sobre el rendimiento de la red, como velocidad de conexión, latencia y consumo de recursos. A través de la ingesta de estos datos en tiempo real, el sistema generará alertas automáticas ante fallos o anomalías, brindando a los administradores información detallada para la toma de decisiones rápidas y fundamentadas.

Este documento de especificación de requerimientos establece una descripción completa del sistema, detallando sus objetivos, alcance, funcionalidades y las necesidades técnicas que debe cumplir. Con esta base, se busca garantizar una implementación exitosa que responda a las expectativas de la institución y beneficie directamente a los estudiantes y docentes.


### I. Generalidades de la Empresa

### 1. Nombre de la Empresa
Universidad Privada de Tacna

### 2. Visión
La visión del proyecto es convertir los laboratorios de informática de la universidad en un modelo de gestión eficiente de redes, mediante el uso de herramientas tecnológicas avanzadas que promuevan un entorno académico conectado, estable y proactivo.

### 3. Misión
La misión del sistema es garantizar un monitoreo efectivo y continuo del rendimiento de la red en los laboratorios, proporcionando a los usuarios un acceso confiable a los recursos tecnológicos y optimizando la infraestructura para responder a las necesidades de aprendizaje.

### 4. Organigrama

![Logo de Mi Empresa](./media/organigrama2.png)

### II. Visionamiento de la Empresa

#### 1. Descripción del Problema

El rendimiento actual de la red en los laboratorios de la UPT enfrenta limitaciones significativas que impactan directamente en la experiencia de los usuarios:

- **Falta de visibilidad y monitoreo proactivo:** No existe un sistema que permita rastrear el estado de la red en tiempo real, lo que dificulta identificar problemas como caídas o picos de consumo antes de que afecten el servicio.

- **Resolución reactiva de incidentes:** La identificación de fallos se produce únicamente después de que los usuarios los reportan, lo que retrasa la respuesta y amplifica el impacto de los problemas.

- **Desperdicio de recursos tecnológicos:** La asignación del ancho de banda no está optimizada, lo que genera ineficiencias en el uso de los recursos disponibles.

- **Dificultades para identificar tendencias de uso:** Sin datos históricos organizados, es complejo analizar patrones que podrían prevenir problemas recurrentes o mejorar el rendimiento de la red.


#### 2. Objetivos de Negocios

- **Optimizar el uso de recursos de red:** Asegurar una distribución eficiente del ancho de banda en los laboratorios, maximizando la capacidad de la red para soportar las actividades académicas sin interrupciones.

- **Detectar problemas de red en tiempo real:** Implementar un sistema que permita identificar rápidamente fallas, cuellos de botella o interrupciones en la conectividad, reduciendo tiempos de inactividad y mejorando la continuidad del servicio.

- **Reducir costos operativos:** Minimizar el gasto innecesario en soporte técnico reactivo o en soluciones temporales mediante un monitoreo continuo que permita actuar de manera preventiva.

- **Mejorar la toma de decisiones:** Proporcionar información detallada y reportes analíticos que ayuden a los administradores a planificar el mantenimiento de la red, realizar ajustes y justificar inversiones futuras en infraestructura tecnológica.

- **Fortalecer la experiencia de los usuarios:** Garantizar que estudiantes y docentes cuenten con una red confiable y de alto rendimiento para sus actividades académicas, mejorando la calidad del aprendizaje y la productividad en los laboratorios.


#### 3. Objetivos de Diseño

- **Ingesta continua de datos:** Diseñar una plataforma que permita la recopilación y procesamiento continuo de datos críticos sobre el rendimiento de la red, como velocidad de conexión y consumo de ancho de banda, asegurando que esta información esté disponible en tiempo real.

- **Interactividad y facilidad de uso:** Crear una interfaz interactiva e intuitiva que facilite la navegación y gestión del sistema por parte de los técnicos responsables, independientemente de su nivel de experiencia técnica.

- **Visualización de datos clara y precisa:** Incorporar gráficos dinámicos, tablas detalladas y reportes personalizados que presenten el estado de la red de forma comprensible y visualmente accesible, destacando métricas como velocidad y consumo.

- **Personalización:** Proveer herramientas que permitan a los usuarios ajustar las visualizaciones según sus necesidades específicas, como intervalos de tiempo definidos o métricas relevantes para sus tareas.

- **Accesibilidad y disponibilidad:** Asegurar que la plataforma funcione de manera óptima en entornos de escritorio y sea accesible desde ubicaciones con conexión a Internet, permitiendo el monitoreo y la gestión de la red en cualquier momento.


#### 4. Alcance del proyecto

**Inclusiones:**

- **Recopilación y análisis de datos en tiempo real:** El sistema estará diseñado para recopilar y analizar datos relevantes sobre el rendimiento de la red en tiempo real. Esto incluirá parámetros clave como la velocidad de conexión y los niveles de uso del ancho de banda, proporcionando una visión completa y precisa del estado de la red en cualquier momento.

- **Generación de alertas automáticas:** El sistema contará con capacidades para generar alertas automáticas cuando se detecten anomalías o caídas en el servicio. Esto permitirá a los administradores y técnicos tomar decisiones rápidas y proactivas para resolver problemas antes de que afecten significativamente a los usuarios.

- **Creación de reportes visuales y exportables:** La plataforma incluirá herramientas para la creación de reportes visuales detallados, que incluirán gráficos y tablas sobre el rendimiento de la red, así como informes sobre incidentes. Estos reportes podrán ser exportados en formatos estándar como PDF o Excel, lo que facilitará la documentación y el análisis fuera de la plataforma.

- **Dashboard interactivo:** Se implementará un dashboard interactivo que permitirá a los administradores y técnicos ver en tiempo real el estado de la red y las tendencias históricas del rendimiento. Este dashboard será fácil de navegar y proporcionará una visión clara de los puntos críticos de la red, permitiendo a los responsables tomar decisiones informadas y oportunas.

**Exclusiones:**
- **Administración de dispositivos o usuarios individuales fuera de los laboratorios:** El sistema se enfocará exclusivamente en el monitoreo de la red en los laboratorios de informática, sin incluir la administración de dispositivos o usuarios fuera de este ámbito.

- **Funcionalidades relacionadas con otros aspectos de TI:** El sistema no abordará funcionalidades como la seguridad de la red o la gestión de software, ya que estos aspectos serán gestionados por otros sistemas especializados de la universidad.

#### 5. Viabilidad del Sistema

##### 5.1. Viabilidad Técnica

**Hardware Disponible**

- **Equipos de desarrollo:** Se necesitan equipos capaces de ejecutar las herramientas necesarias para la creación y mantenimiento del sistema de monitoreo. Los requisitos mínimos incluyen:
  - **Procesador:** Intel Core i5 o superior, que garantice un rendimiento eficiente en tareas de desarrollo y pruebas.
  - **Memoria RAM:** Entre 8 y 16 GB DDR4, adecuada para ejecutar múltiples procesos en paralelo.
  - **Almacenamiento:** Un disco SSD de al menos 256 GB para tiempos de respuesta rápidos y estabilidad operativa.
  - **Tarjeta gráfica:** Uso de gráficos integrados en el procesador, suficiente para el desarrollo de aplicaciones estándar.

**Software Disponible**

- **Aplicaciones y Herramientas de Desarrollo:**
  - **AWS (Amazon Web Services):** Proveedor de servicios en la nube utilizado para almacenamiento, análisis y despliegue del sistema.
  - **Terravision:** Integración para la visualización y monitoreo de la red a través de representaciones geoespaciales.
  - **Terraform:** Herramienta de infraestructura como código para la configuración y automatización del entorno de desarrollo en la nube.
  - **Python con HCL2:** Lenguaje usado para procesar configuraciones de Terraform y ejecutar scripts personalizados que gestionen la interacción con AWS y la infraestructura de red.

**Infraestructura de Red**

- **Conectividad estable:** Es esencial contar con una conexión a internet confiable y de alta velocidad en los laboratorios para garantizar la ingesta continua de datos y el funcionamiento del sistema en tiempo real.
- **Equipos de red gestionados:** Dispositivos como switches y routers con capacidades avanzadas que soporten el monitoreo de tráfico y permitan ajustes dinámicos según las necesidades detectadas.

**Automatización y Configuración**

- El uso de Terraform asegura la consistencia en la configuración de entornos de desarrollo, pruebas y producción, reduciendo errores manuales y acelerando los despliegues.
- Scripts desarrollados en Python con HCL2 automatizan la interacción entre los nodos de monitoreo y el servidor central, optimizando la recolección y análisis de datos en tiempo real.

##### 5.2. Viabilidad Económica

El análisis de costos totaliza los recursos necesarios para el desarrollo e implementación del sistema, considerando los siguientes conceptos:

| **Concepto** | **Costo Total (S/.)** |
|--------------|-----------------------|
| **Costos Generales** | 3,222.00 |
| **Costos Operativos durante el Desarrollo** | 500.00 |
| **Costos del Ambiente** | 450.00 |
| **Costos del Personal** | 6,000.00 |
| **Total** | 10,172.00 |

Este presupuesto permite cubrir todos los aspectos esenciales del proyecto, asegurando una relación costo-beneficio favorable y sostenibilidad a largo plazo.

##### 5.3. Viabilidad Operativa

**Factibilidad Operativa**

- **Optimización de Recursos:** La herramienta permitirá maximizar la utilización de los recursos tecnológicos al proporcionar datos detallados sobre el uso de la red en tiempo real. Esto ayudará a la universidad a planificar con mayor precisión el mantenimiento, la actualización o la redistribución de los recursos disponibles.
  
- **Mejora en la Toma de Decisiones:** Con acceso a información precisa sobre el desempeño de la infraestructura tecnológica, los administradores podrán adoptar decisiones informadas y basadas en datos, mejorando tanto la eficiencia operativa como la calidad del servicio ofrecido a estudiantes y docentes.
  
- **Facilidad de Uso e Integración:** Diseñada para ser intuitiva, la herramienta minimizará la curva de aprendizaje del personal técnico y administrativo, además de integrarse sin problemas con los sistemas existentes, reduciendo el impacto en las operaciones cotidianas.


#### 6. Información obtenida del levantamiento de información

Durante el levantamiento de información para el desarrollo del sistema, se identificaron los siguientes aspectos clave:

**Necesidades de los Técnicos de Soporte:**

- Requieren una herramienta centralizada para monitorear el estado de la red en tiempo real, con alertas automáticas que les permitan identificar problemas antes de que afecten a los usuarios.

**Requerimientos de los Administradores:**

- Necesitan reportes claros y personalizados sobre el rendimiento de la red para tomar decisiones informadas y planificar mantenimientos o actualizaciones futuras.

Esta información valida la necesidad del sistema como una solución integral para optimizar el rendimiento y la gestión de la red en los laboratorios de la universidad.


### III. Análisis de Procesos

- Diagrama del Proceso Actual – Diagrama de actividades
- Diagrama del Proceso Propuesto – Diagrama de actividades Inicial

### IV. Especificación de Requerimientos de Software

1. Cuadro de Requerimientos funcionales Inicial


|  ID   | Descripción                                                                                           | Prioridad |
| :---: | :---------------------------------------------------------------------------------------------------- | :-------: |
| RF-01 | Monitorear en tiempo real el uso de CPU, RAM, GPU, tráfico de red y consumo energético de los equipos. |   Alta    |
| RF-02 | Generar reportes detallados y personalizables sobre el rendimiento de los equipos y patrones de uso.   |   Alta    |
| RF-03 | Detectar, notificar y registrar anomalías en el rendimiento de los recursos tecnológicos.              |   Alta    |
| RF-04 | Exportar datos en formatos compatibles con Tableau (CSV, Excel) y JSON.                               |   Alta    |
| RF-05 | Almacenar datos históricos para análisis a largo plazo y comparativas de rendimiento.                  |   Alta    |
| RF-06 | Proporcionar un panel de control interactivo para visualizar datos clave en tiempo real.               |   Alta    |
| RF-07 | Permitir la integración con otros sistemas de gestión de la universidad mediante API REST.             |  Media    |

2. Cuadro de Requerimientos No funcionales


|  ID   | Descripción                                                                                   | Prioridad |
| :---: | :-------------------------------------------------------------------------------------------- | :-------: |
| RNF-01 | El sistema debe ser compatible con sistemas operativos Windows y distribuciones de Linux.     |   Alta    |
| RNF-02 | La interfaz debe ser intuitiva y accesible desde navegadores web modernos.                    |   Alta    |
| RNF-03 | Los datos recolectados deben estar protegidos mediante protocolos de seguridad (HTTPS, TLS).  |   Alta    |
| RNF-04 | La solución debe ser escalable para nuevos laboratorios sin comprometer el rendimiento.       |   Alta    |
| RNF-05 | El tiempo de respuesta para operaciones críticas debe ser menor a 2 segundos.                 |   Alta    |
| RNF-06 | El almacenamiento debe incluir respaldo automático y procedimientos de recuperación ante fallos. |   Alta    |
| RNF-07 | El consumo de recursos del sistema debe ser mínimo para no afectar el rendimiento de los equipos monitorizados. |  Media    |


3. Cuadro de Requerimientos funcionales Final
4. Reglas de Negocio

- Los datos recolectados deben ser accesibles únicamente por personal autorizado.
- El sistema debe generar reportes automáticos en intervalos regulares (semanales).
- Las alertas deben activarse cuando el rendimiento de la red caiga por debajo de ciertos umbrales definidos.


### V. Fase de Desarrollo

1. Perfiles de Usuario
2. Modelo Conceptual
   - Diagrama de Paquetes
   - Diagrama de Casos de Uso
   - Escenarios de Caso de Uso (narrativa)
3. Modelo Lógico
   - Análisis de Objetos
   - Diagrama de Actividades con objetos
   - Diagrama de Secuencia
   - Diagrama de Clases

---

# CONCLUSIONES

Viabilidad Integral del Proyecto: El análisis realizado demuestra que el proyecto es viable en términos técnicos, económicos, operativos, legales y sociales. La infraestructura existente de la UPT es suficiente para soportar el sistema, y los beneficios económicos y operativos superan ampliamente los costos asociados.

Optimización de Recursos: La herramienta de monitoreo permitirá gestionar de manera eficiente los recursos tecnológicos de la universidad, asegurando un mejor rendimiento de las redes y computadoras en los laboratorios. Esto se traducirá en una reducción de tiempos de inactividad y un uso más efectivo de los equipos.

Mejora de la Experiencia Educativa: Los estudiantes y docentes serán beneficiarios directos del proyecto al contar con una infraestructura tecnológica confiable y de alto desempeño, lo que contribuirá a mejorar la calidad del aprendizaje y la enseñanza.

Toma de Decisiones Basada en Datos: El sistema proporcionará información detallada y en tiempo real sobre el rendimiento de los recursos tecnológicos, permitiendo al área de TI y a la administración tomar decisiones proactivas e informadas para optimizar la operación.

Cumplimiento Normativo y Ético: El proyecto cumple con las normativas legales relacionadas con la protección de datos personales, garantizando la privacidad de la información recolectada. Además, fomenta un impacto positivo en la comunidad universitaria al priorizar la sostenibilidad y la eficiencia.

Impacto en la Sostenibilidad: La implementación de la herramienta no solo optimizará el rendimiento operativo, sino que también contribuirá a la reducción del consumo energético y a la utilización responsable de los recursos tecnológicos, alineándose con las metas de sostenibilidad de la UPT.

Base para Innovaciones Futuras: Este proyecto establece un marco tecnológico sólido que puede ser escalado e integrado en otras áreas de la universidad, abriendo oportunidades para futuros desarrollos tecnológicos y educativos.

---

# RECOMENDACIONES

Realizar Pruebas Piloto: Implementar el sistema inicialmente en uno o dos laboratorios para identificar problemas potenciales antes del despliegue completo. Esto permitirá optimizar la configuración y abordar cualquier desafío técnico.

Capacitación del Personal: Brindar formación a los equipos de soporte técnico y TI en el uso y mantenimiento del sistema para garantizar una operación eficiente y una transición sin contratiempos.

Monitoreo y Evaluación Inicial: Durante los primeros meses de operación, realizar un monitoreo constante del sistema para ajustar parámetros, optimizar su rendimiento y asegurar su estabilidad.

Plan de Contingencia: Diseñar un plan de contingencia para mitigar riesgos durante la implementación y operación, asegurando la continuidad de las actividades de los laboratorios.

Recoger Feedback de los Usuarios: Incorporar un mecanismo para recopilar comentarios de los usuarios finales (estudiantes, docentes y personal técnico) que permitan evaluar la eficacia del sistema y realizar mejoras continuas.

Escalabilidad del Sistema: Planificar la futura integración del sistema en otros laboratorios y áreas tecnológicas de la universidad, asegurando que pueda crecer junto con las necesidades de la UPT.

---

# BIBLIOGRAFÍA

Fuentes bibliográficas utilizadas en el desarrollo del documento.

---

# WEBGRAFÍA

Listado de referencias web consultadas.

