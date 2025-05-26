#!/bin/bash

# Inicia SQL Server en segundo plano
/opt/mssql/bin/sqlservr &

# Esperar a que SQL Server esté listo
echo "Esperando que SQL Server esté listo..."
for i in {1..20}; do
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "SELECT 1" &> /dev/null
  if [ $? -eq 0 ]; then
    echo "SQL Server está listo."
    break
  fi
  echo "Esperando... ($i)"
  sleep 2
done

# Ejecutar scripts
echo "Ejecutando script DDLMonedas.sql..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i /scripts/DDLMonedas.sql

echo "Ejecutando script DMLMonedas.sql..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -i /scripts/DMLMonedas.sql

# Mantener contenedor activo
wait

