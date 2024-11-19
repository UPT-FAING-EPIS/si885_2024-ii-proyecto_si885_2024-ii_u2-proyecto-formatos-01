# table.py

import mysql.connector

db_config = {
    host=os.environ['DB_ENDPOINT'],
    user=os.environ['DB_USER'],
    password=os.environ['DB_PASSWORD'],
    port=int(os.environ['DB_PORT'])
}

def create_connection():
    cnxn = mysql.connector.connect(**db_config)
    return cnxn

def create_table():
    cnxn = create_connection()
    cursor = cnxn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS trafico_red (
            id INT,
            fecha DATE NOT NULL,
            ip VARCHAR(255) NOT NULL,
            clase VARCHAR(255) NOT NULL,
            horario VARCHAR(255) NOT NULL,
            dia VARCHAR(255) NOT NULL,
            turno VARCHAR(255) NOT NULL,
            laboratorio VARCHAR(255) NOT NULL,
            total_enviado_mb DECIMAL(10,2) NOT NULL,
            total_recibido_mb DECIMAL(10,2) NOT NULL,
            tema VARCHAR(255) NOT NULL,
            navegador VARCHAR(255) NOT NULL,
            seccion VARCHAR(255) NOT NULL,
            docente VARCHAR(255) NOT NULL,
            total_mbps DECIMAL(20,6) DEFAULT NULL,
            total_GB DECIMAL(20,6) DEFAULT NULL,
            tiempo_sesion TIME DEFAULT NULL,
            consumo_energia_kwh DECIMAL(20,6) DEFAULT NULL
        )
    """)

    # Confirmar la creación de la tabla
    cnxn.commit()

    # Cerrar la conexión
    cursor.close()
    cnxn.close()

    print("Tabla creada correctamente.")

# Ejecutar la creación de la tabla al ejecutar este script
if __name__ == '__main__':
    create_table()
