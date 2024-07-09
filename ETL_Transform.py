import logging
import pyodbc

logging.basicConfig(level=logging.INFO)

try:
    server = "ALEX"
    database = "ETL_IND"
    username = "sa"
    password = "123"

    # Configurar la conexión a SQL Server usando pyodbc
    connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
    conn = pyodbc.connect(connection_string)

    logging.info("Conexión a la base de datos establecida con éxito.")

    # Leer el archivo SQL
    with open('TransformData.sql', 'r') as file:
        sql_commands = file.read()

    logging.info(f"Archivo SQL 'TransformData.sql' leído con éxito.")

    # Ejecutar el archivo SQL
    cursor = conn.cursor()
    cursor.execute(sql_commands)
    conn.commit()

    logging.info("Consultas SQL ejecutadas con éxito.")

except Exception as e:
    logging.error(f"Error ejecutando consultas SQL: {e}")
    raise

finally:
    if 'conn' in locals():
        conn.close()
        logging.info("Conexión a la base de datos cerrada.")
