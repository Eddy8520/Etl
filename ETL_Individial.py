import logging
import pandas as pd
from sqlalchemy import create_engine

# Configurar logging
logging.basicConfig(level=logging.INFO)

try:
    server = "ALEX"
    database = "ETL_IND"
    username = "sa"
    password = "123"

    # Crear la cadena de conexión
    connection_string = f"mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server"
    engine = create_engine(connection_string)

    logging.info("Conexión a la base de datos establecida con éxito.")
    
    sql_file_path = 'SelectAllRealEstate.sql'
    with open(sql_file_path, 'r') as file:
        query = file.read()
        
    logging.info(f"Archivo SQL '{sql_file_path}' leído con éxito.")

    # Ejecutar la consulta SQL y leer los datos en un DataFrame de pandas
    data = pd.read_sql(query, engine)
    logging.info("Consulta SQL ejecutada con éxito.")
    
    print(data.head())

except Exception as e:
    logging.error(f"Error extrayendo datos: {e}")
    raise
finally:
    # Cerrar la conexión si fue abierta
    if 'engine' in locals():
        engine.dispose()
        logging.info("Conexión a la base de datos cerrada.")