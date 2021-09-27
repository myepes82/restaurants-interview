#!/bin/bash
sudo /etc/init.d/postgresql restart

 
# -- CONFIGURACIÓN DE VARIABLES GLOBALES
APP_HOME="."
APP_OUTPUT="import.log"
 

 
PG_DBUSER_ADM="postgres"
PG_DBUSER="postgres"
PG_DBPASS="1234"
PG_DBNAME="restaurants"
DBADMIN_SECRET_PASSWD
 
# -- SE LIMPIA LA CONSOLA Y SE DESPLIEGA EL TITULO DEL PROGRAMA.
clear
echo "IMPORT"
echo "======"
 
# -- SE VERIFICA QUE LOS DOS PARAMETROS QUE INDICAN EL TIPO DE BASE 
# DE DATOS A UTILIZAR (MYSQL O POSTGRESQL) Y EL ARCHIVO DUMP DE DONDE
# IMPORTAR LA BASE DE DATOS HAYAN SIDO PASADOS POR EL USUARIO.
if [ -z $1 ] || [ -z $2 ]; then
    echo "Error en la ejecución! Faltan parámetros.."
    echo "Ejemplo ejecución:"
    echo
    echo "  $ sh import.sh [mysql|pg] dump.sql"
    echo
    exit
fi
 
# -- SE COMPRUEBA QUE EL PRIMER PARÁMETRO RECIBIDO CORRESPONDA 
# A LAS OPCIONES VÁLIDAS QUE SON mysql Y pg.
if [ $1 != "pg" ]; then
    echo "Error en la ejecución! las opciones para el primer parámetro 'pg' (postgres)."
    echo "Ejemplo ejecución:"
    echo
    echo "  $ sh import.sh [mysql|pg] dump.sql"
    echo
exit
fi
 
# -- SE VERIFICA LA EXISTENCIA DEL ARCHIVO DUMP.
if ! [ -f $APP_HOME/$2 ]; then
    echo "Error en la ejecución! El archivo dump '$2' no existe."
    echo
    exit
fi

if [ -z $3 ]; then
    echo "Db Password Not Found"
    echo 
    echo
    exit
fi

DBADMIN_SECRET_PASSWD = $3


echo "" > $APP_HOME/$APP_OUTPUT
if [ $1 == "pg" ]; then
    export PGUSER=$PG_DBUSER_ADM
    export PGPASSWORD=$DBADMIN_SECRET_PASSWD
    echo "Imporing database  PostgreSQL. This can take any minutes..."
    psql -L $APP_HOME/$APP_OUTPUT -d $PG_DBNAME -f $APP_HOME/$2 >> $APP_HOME/$APP_OUTPUT
    unset PGUSER
    unset PGPASSWORD
    echo "Database were imported '$APP_HOME/$APP_OUTPUT'."
    echo
else
    echo "Opción no soportada!"
    echo
    exit
fi