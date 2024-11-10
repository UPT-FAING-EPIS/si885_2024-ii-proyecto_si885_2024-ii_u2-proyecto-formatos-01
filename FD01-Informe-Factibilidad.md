<center>

![./media/logo-upt.png](./media/logo-upt.png)

**UNIVERSIDAD PRIVADA DE TACNA**

**FACULTAD DE INGENIERÍA**

**Escuela Profesional de Ingeniería de Sistemas**

**Proyecto: "Infraestructura en AWS con Terraform"**

**Curso:** Inteligencia de Negocios

**Docente:** Mag. Patrick Cuadros Quiroga

**Integrantes:**

- Apaza Ccalle, Albert Kenyi (2021071075)  
- Huallpa Maron, Jesús Antonio (2021071085) 

**Tacna – Perú**

**2024**

</center>

---

## Informe de Factibilidad

**Sistema:** *Infraestructura en AWS con Terraform*

**Versión:** *1.0*

| Versión | Hecha por | Revisada por | Aprobada por | Fecha       | Motivo            |
|:-------:|:---------:|:------------:|:------------:|:-----------:|:------------------:|
| 1.0     | MPV       | ELV          | ARV          | 24/08/2024  | Versión Original   |

---

## Índice General

- [1. Introducción](#1-introducción)
- [2. Servicios Configurados](#2-servicios-configurados)
- [3. Recursos de Terraform](#3-recursos-de-terraform)
  - [3.1 Variables Definidas (variables.tf)](#31-variables-definidas-variablestf)
  - [3.2 Recursos Principales (main.tf)](#32-recursos-principales-maintf)
- [4. Análisis de Factibilidad](#4-análisis-de-factibilidad)
  - [4.1 Factibilidad Técnica](#41-factibilidad-técnica)
  - [4.2 Factibilidad Económica](#42-factibilidad-económica)
  - [4.3 Factibilidad Operativa](#43-factibilidad-operativa)
  - [4.4 Factibilidad Legal](#44-factibilidad-legal)
- [5. Conclusiones y Recomendaciones](#5-conclusiones-y-recomendaciones)
- [6. Anexos](#6-anexos)

---

# 1. Introducción
Este proyecto despliega una infraestructura en AWS utilizando Terraform para gestionar servicios como MongoDB, Grafana y aplicaciones web (React y Flutter). El objetivo es crear una estructura escalable y mantenible que facilite la gestión de aplicaciones en la nube.

---

# 2. Servicios Configurados

## 2.1 Entorno de Ejecución
- **Shell**: `/usr/bin/bash -e {0}`
- **Python Location**: `/opt/hostedtoolcache/Python/3.9.20/x64`
- **LD_LIBRARY_PATH**: `/opt/hostedtoolcache/Python/3.9.20/x64/lib`

## 2.2 Archivos Terraform Procesados
Se analizaron los archivos `.tf` y se identificaron los siguientes recursos y variables.

---

# 3. Recursos de Terraform

## 3.1 Variables Definidas (variables.tf)
- **aws_region**: AWS region to deploy resources. Default: `us-west-2`
- **mongodb_region**: MongoDB region for deployment. Default: `US_WEST_2`
- **environment**: Deployment environment. Default: `dev`
- **react_app_bucket_name**: Name of the S3 bucket for the React app
- **flutter_app_bucket_name**: Name of the S3 bucket for the Flutter app
- **api_gateway_name**: Name of the API Gateway
- **grafana_instance_type**: Instance type for Grafana server. Default: `t2.micro`

## 3.2 Recursos Principales (main.tf)
Los siguientes proveedores y módulos están definidos en `main.tf`:

### Proveedores Requeridos
- **AWS**: `hashicorp/aws`, versión `~> 4.0`
- **MongoDB Atlas**: `mongodb/mongodbatlas`, versión `~> 1.0`
- **Grafana**: `grafana/grafana`, versión `~> 1.28.0`

### Recursos Definidos
- **AWS S3 Bucket**: `react_app_bucket` y `flutter_app_bucket` para almacenamiento de aplicaciones.
- **MongoDB Atlas Cluster**: Configuración para el cluster MongoDB.
- **Grafana Cloud Stack**: `my_stack` para monitoreo.
- **AWS Instance**: `docker_host` configurado para ejecutar Docker.
- **AWS Security Group**: `allow_http` permite tráfico HTTP.

---

# 4. Análisis de Factibilidad

## 4.1 Factibilidad Técnica
La infraestructura propuesta utiliza servicios probados como AWS, MongoDB Atlas y Grafana para asegurar un rendimiento óptimo. El uso de instancias de `t2.micro` en AWS para servicios como Grafana y Docker es viable para el entorno de desarrollo.

## 4.2 Factibilidad Económica
### Costos estimados:
- **AWS S3 Buckets**: Costo estimado según almacenamiento y tráfico.
- **MongoDB Atlas Cluster**: Nivel gratuito para entornos de desarrollo.
- **AWS EC2**: Instancia `t2.micro` con Docker, estimado en `$10-15/mes`.

## 4.3 Factibilidad Operativa
La configuración utiliza `bash` y `Python 3.9`, con variables que permiten replicar el despliegue en distintos entornos (`dev`, `prod`). Los recursos son gestionados con Terraform, facilitando despliegues y gestión.

## 4.4 Factibilidad Legal
La configuración debe cumplir con normativas de seguridad y privacidad de datos, especialmente en MongoDB Atlas, donde se almacenarán datos sensibles.

---

# 5. Conclusiones y Recomendaciones
El proyecto es viable bajo la configuración actual. Los costos estimados son bajos y la infraestructura es escalable, asegurando capacidad para el crecimiento del proyecto.

---

# 6. Anexos

## A. Variables en Terraform
Listado detallado de las variables de `variables.tf`.

## B. Diagrama de Arquitectura (si aplica)

## C. Referencias
- [AWS Pricing](https://aws.amazon.com/pricing/)
- [Terraform Documentation](https://www.terraform.io/docs/)
