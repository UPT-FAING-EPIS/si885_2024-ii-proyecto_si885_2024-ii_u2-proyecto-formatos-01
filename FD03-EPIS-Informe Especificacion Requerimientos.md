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
--------------------------------------------------------------------------------------editar

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


3. Objetivos de Diseño
4. Alcance del proyecto
5. Viabilidad del Sistema
6. Información obtenida del Levantamiento de Información

### III. Análisis de Procesos

- Diagrama del Proceso Actual – Diagrama de actividades
- Diagrama del Proceso Propuesto – Diagrama de actividades Inicial

### IV. Especificación de Requerimientos de Software

1. Cuadro de Requerimientos funcionales Inicial
2. Cuadro de Requerimientos No funcionales
3. Cuadro de Requerimientos funcionales Final
4. Reglas de Negocio

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

Explicación de los resultados y conclusiones derivadas de la especificación de requerimientos.

---

# RECOMENDACIONES

Listado de recomendaciones basadas en el análisis de requerimientos.

---

# BIBLIOGRAFÍA

Fuentes bibliográficas utilizadas en el desarrollo del documento.

---

# WEBGRAFÍA

Listado de referencias web consultadas.

