#!/bin/bash
sudo /etc/init.d/postgresql restart

 
# -- CONFIGURACIÓN DE VARIABLES GLOBALES
APP_HOME="."
APP_OUTPUT="import.log"
PG_DBUSER_ADM="restaurants"
PG_DBUSER="ghost"
PG_DBPASS="1234"
PG_DBNAME="restaurants"

 
# -- SE LIMPIA LA CONSOLA Y SE DESPLIEGA EL TITULO DEL PROGRAMA.
clear
echo "=========================================="
echo "*********Database importation*************"
echo "=========================================="
 
# -- SE VERIFICA QUE LOS DOS PARAMETROS QUE INDICAN EL TIPO DE BASE 
# DE DATOS A UTILIZAR (MYSQL O POSTGRESQL) Y EL ARCHIVO DUMP DE DONDE
# IMPORTAR LA BASE DE DATOS HAYAN SIDO PASADOS POR EL USUARIO.
if [ -z $1 ] || [ -z $2 ]; then
    echo "Execution error, missing parameters."
    echo "Execution example:"
    echo
    echo "$ sh creation.sh <pg> <sql_file>" "<db_password>"
    echo
    exit
fi
 
# -- SE COMPRUEBA QUE EL PRIMER PARÁMETRO RECIBIDO CORRESPONDA 
# A LAS OPCIONES VÁLIDAS QUE SON mysql Y pg.
if [ $1 != "pg" ]; then
    echo "Execution error, first parameter = 'pg' (postgres)."
    echo "Execution example"
    echo
    echo "  $ sh creation.sh pg <data_base>.sql <db_password>"
    echo
exit
fi
 
# -- SE VERIFICA LA EXISTENCIA DEL ARCHIVO DUMP.
if ! [ -f $APP_HOME/$2 ]; then
    echo "Execuition error, '$2'  does not exists."
    echo
    exit
fi

if [ -z $3 ]; then
    echo "Execution error, data base password not found."
    echo 
    echo
    exit
fi



echo "" > $APP_HOME/$APP_OUTPUT
if [ $1 == "pg" ]; then
    export PGUSER=$PG_DBUSER_ADM
    export PGPASSWORD=$3
    echo "passoword"
    echo $3
    echo "====="
    psql -L $APP_HOME/$APP_OUTPUT -c "create user $PG_DBUSER createdb createuser createrole;" >> $APP_HOME/$APP_OUTPUT
    psql -L $APP_HOME/$APP_OUTPUT -c "alter user $PG_DBUSER with password '$PG_DBPASS';" >> $APP_HOME/$APP_OUTPUT
    psql -L $APP_HOME/$APP_OUTPUT -c "create database $PG_DBNAME;" >> $APP_HOME/$APP_OUTPUT
    psql -L $APP_HOME/$APP_OUTPUT -c "alter database $PG_DBNAME owner to $PG_DBUSER;" >> $APP_HOME/$APP_OUTPUT
    psql -L $APP_HOME/$APP_OUTPUT -d $PG_DBNAME -f $APP_HOME/$2 >> $APP_HOME/$APP_OUTPUT
    unset PGUSER
    unset PGPASSWORD
    echo "Fin del proceso de importación! Puede ver la salida del proceso en el archivo '$APP_HOME/$APP_OUTPUT'."
    echo
    unset PGUSER
    echo "Database were imported '$APP_HOME/$APP_OUTPUT'."
    echo
else
    echo "Opción no soportada!"
    echo
    exit
fi