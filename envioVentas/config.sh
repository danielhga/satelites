#!/bin/bash


MAHOU_HOST="ftp.msmfiles.net"
MAHOU_USU="tudespensa"
MAHOU_PASS="Des4080pr1"

NIELSEN_HOST="138.108.98.23"
NIELSEN_USU="tudespensa"
NIELSEN_PASS="3qq7#vPr"

FRONT4_USU="root"
FRONT4_PASS="&4mwh6D28&Aw192"

FICHERO_MAHOU="mahou.conf"
FICHERO_NIELSEN_TOTAL="nielsen_total"
FICHERO_NIELSEN_PROVINCIAS="nielsen_provincia"

RUTA_ORIGINALES="/mnt/tudespensa0/vhosts/tudespensa.com/httpdocsv4/var/rep/temp/"

RUTA_TMP="/mnt/tudespensa0/vhosts/satelitesTudespensa/envioVentas/archivos/tmp/"
RUTA_FAIL="/mnt/tudespensa0/vhosts/satelitesTudespensa/envioVentas/archivos/fallidos/"
RUTA_OK="/mnt/tudespensa0/vhosts/satelitesTudespensa/envioVentas/archivos/correctos/"


function procesoEnviarArchivo() {

    host="$1"
    user="$2"
    passwd="$3"
    file="$4"

archivoOrg=$RUTA_ORIGINALES$file
archivoTmp=$RUTA_TMP$file


if [ -f $archivoOrg ]
then

    cp $archivoOrg $archivoTmp

    if [ -f $archivoTmp ]
    then

        enviarArchivoFtp $host $user $passwd $archivoTmp $file

    else

        echo "ERROR ARCHIVO NO EXISTE 2: "$archivoTmp

    fi

else

    echo "ERROR ARCHIVO NO EXISTE 1: "$archivoOrg

fi

}

function enviarArchivoFtp() {

    host="$1"
    user="$2"
    passwd="$3"
    file_put="$4"
    file_get="$5"

    echo $host
    echo $user
    echo $passwd
    echo $file_put
    echo $file_get

sftp $user@$host:$passwd<<GET_FILES
put $file_put
quit
GET_FILES


}

function enviarArchivoFtpOLD() {

    host="$1"
    user="$2"
    passwd="$3"
    file_put="$4"
    file_get="$5"

ftp -n $host<<FTP_CONN
    quote USER $user
    quote PASS $passwd
    binary
    put $file_put
#    get $file_get
    quit
FTP_CONN
}
