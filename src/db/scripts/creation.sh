#!/bin/bash
 
# -- CONFIGURACIÓN DE VARIABLES GLOBALES
APP_HOME="."
APP_OUTPUT="import.log"
 
MYSQL_DBUSER_ADM="root"
MYSQL_DBUSER="admin"
MYSQL_DBPASS="admin"
MYSQL_DBNAME="mi_db"
 
PG_DBUSER_ADM="postgres"
PG_DBUSER="admin"
PG_DBPASS="admin"
PG_DBNAME="mi_db"
 
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
if [ $1 != "mysql" ] && [ $1 != "pg" ]; then
    echo "Error en la ejecución! las opciones para el primer parámetro pueden ser solamente 'mysql' y 'pg' (postgres)."
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
 
# -- SE LE SOLICITA AL OPERADOR QUE INGRESE LA CONTRASEÑA DEL USUARIO
# ADMINISTRADOR DE LA BASE DE DATOS.
STTY_SAVE=$(stty -g)
stty -echo
if [ $1 == "mysql" ]; then
    echo "Favor de introducir a continuación la contraseña del usuario '$MYSQL_DBUSER_ADM', administrador del motor de base de datos 'MySQL'."
elif [ $1 == "pg" ]; then
    echo "Favor de introducir a continuación la contraseña del usuario '$PG_DBUSER_ADM', administrador del motor de base de datos 'PostgreSQL'."
else
    echo "Favor de introducir a continuación la contraseña del usuario administrador del motor de base de datos."
fi
echo
echo -n "Introduzca Password: "
read DBADMIN_SECRET_PASSWD
stty $STTY_SAVE
echo
echo
 
# -- SEGÚN LA BASE DE DATOS ESPECIFICADA SE PROCEDE A IMPORTAR EL DUMP.
echo "" > $APP_HOME/$APP_OUTPUT
if [ $1 == "mysql" ]; then
    echo -n "Desea eliminar la base de datos $MYSQL_DBNAME y el usuario $MYSQL_DBUSER antes de importar la copia de seguridad? OPCIONES (S|N): "
    read ELIMINA_DB_USER
    if [ $ELIMINA_DB_USER == "S" ] || [ $ELIMINA_DB_USER == "s" ]; then
        echo "Eliminando la base de datos y el usuario del sistema del motor MySQL. Aguarde un momento..."
        mysql -v -u $MYSQL_DBUSER_ADM -p$DBADMIN_SECRET_PASSWD -e "drop database $MYSQL_DBNAME;" >> $APP_HOME/$APP_OUTPUT
        mysql -v -u $MYSQL_DBUSER_ADM -p$DBADMIN_SECRET_PASSWD -e "drop user $MYSQL_DBUSER@localhost;" >> $APP_HOME/$APP_OUTPUT
        echo
    fi
    echo "Importando Base de Datos del sistema en MySQL. Aguarde un momento..."
    mysql -v -u $MYSQL_DBUSER_ADM -p$DBADMIN_SECRET_PASSWD < $APP_HOME/$2 >> $APP_HOME/$APP_OUTPUT
    mysql -v -u $MYSQL_DBUSER_ADM -p$DBADMIN_SECRET_PASSWD -e "grant all on $MYSQL_DBNAME.* to $MYSQL_DBUSER@localhost identified by '$MYSQL_DBPASS'" >> $APP_HOME/$APP_OUTPUT
    echo "Fin del proceso de importación! Puede ver la salida del proceso en el archivo '$APP_HOME/$APP_OUTPUT'."
    echo
elif [ $1 == "pg" ]; then
    export PGUSER=$PG_DBUSER_ADM
    export PGPASSWORD=$DBADMIN_SECRET_PASSWD
    echo -n "Desea eliminar la base de datos $PG_DBNAME y el usuario $PG_DBUSER antes de importar la copia de seguridad? OPCIONES (S|N): "
    read ELIMINA_DB_USER
    if [ $ELIMINA_DB_USER == "S" ] || [ $ELIMINA_DB_USER == "s" ]; then
        echo "Eliminando la base de datos y el usuario del sistema del motor PostgreSQL. Aguarde un momento..."
        psql -L $APP_HOME/$APP_OUTPUT -c "drop database $PG_DBNAME;" >> $APP_HOME/$APP_OUTPUT
        psql -L $APP_HOME/$APP_OUTPUT -c "drop user $PG_DBUSER;" >> $APP_HOME/$APP_OUTPUT
        echo
    fi
    echo "Importando Base de Datos del sistema en PostgreSQL. Aguarde un momento..."
    psql -L $APP_HOME/$APP_OUTPUT -c "create user $PG_DBUSER createdb createuser createrole;" >> $APP_HOME/$APP_OUTPUT
    psql -L $APP_HOME/$APP_OUTPUT -c "alter user $PG_DBUSER with password '$PG_DBPASS';" >> $APP_HOME/$APP_OUTPUT
    psql -L $APP_HOME/$APP_OUTPUT -c "create database $PG_DBNAME;" >> $APP_HOME/$APP_OUTPUT
    psql -L $APP_HOME/$APP_OUTPUT -c "alter database $PG_DBNAME owner to $PG_DBUSER;" >> $APP_HOME/$APP_OUTPUT
    psql -L $APP_HOME/$APP_OUTPUT -d $PG_DBNAME -f $APP_HOME/$2 >> $APP_HOME/$APP_OUTPUT
    unset PGUSER
    unset PGPASSWORD
    echo "Fin del proceso de importación! Puede ver la salida del proceso en el archivo '$APP_HOME/$APP_OUTPUT'."
    echo
else
    echo "Opción no soportada!"
    echo
fi