#!/bin/bash

source ./config.sh

ventasMauho=`cat $RUTA_ORIGINALES$FICHERO_MAHOU`
ventasNielsenTotal=`cat $RUTA_ORIGINALES$FICHERO_NIELSEN_TOTAL`
ventasNielsenProvincia=`cat $RUTA_ORIGINALES$FICHERO_NIELSEN_PROVINCIAS`

#cp $RUTA_ORIGINALES$ventasMauho $RUTA_TMP$ventasMauho
#cp $RUTA_ORIGINALES$ventasNielsenTotal $RUTA_TMP$ventasNielsenTotal
#cp $RUTA_ORIGINALES$ventasNielsenProvincia $RUTA_TMP$ventasNielsenProvincia

host=$MAHOU_HOST
user=$MAHOU_USU
passwd=$MAHOU_PASS
archivo=$ventasMauho

#echo $host
#echo $user
#echo $passwd
#echo $archivo

procesoEnviarArchivo $host $user $passwd $archivo

echo "FIN"

