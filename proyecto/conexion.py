import pyodbc

def conectar():
    server = 'DESKTOP-PABBKTH'
    #server = 'DESKTOP-GKFB17P' trabajo
    database = 'Vet_ElBuenProductor'
    driver= '{ODBC Driver 17 for SQL Server}'

    # crear la cadena de conexión
    connection_string = f"DRIVER={driver};SERVER={server};DATABASE={database};Trusted_Connection=yes;"

    # conectar a la base de datos utilizando la autenticación integrada de Windows
    conn = pyodbc.connect(connection_string)
    return conn