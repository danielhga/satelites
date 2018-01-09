#!/bin/bash
function enviarArchivoFtp() {

    HOST="$1"
    USER="$2"
    PASSWD="$3"
    ARCHIVO="$4"

    echo $HOST
    echo $USER
    echo $PASSWD
    echo $ARCHIVO

ftp -n <<FTP_CONN
    quote USER $USER
    quote PASS $PASSWD
    binary
    put $FILE
    quit
FTP_CONN
}