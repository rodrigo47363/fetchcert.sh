#!/bin/bash

set -e

# URL para obtener el script desde un repositorio
REPO_URL="https://github.com/rodrigo47363/fetchcert.sh/raw/main/fetchcert.sh"
SCRIPT_NAME="fetchcert.sh"
LOCAL_PATH="/usr/local/bin/$SCRIPT_NAME"

# Muestra el menú principal
mostrar_menu() {
    clear
    echo "#############################################################"
    echo "#                                                           #"
    echo "#             fetchcert.sh                                  #"
    echo "#             Versión 1.0                                   #"
    echo "#             https://github.com/rodrigo47363/fetchcert.sh  #"
    echo "#############################################################"
    echo
    echo "1. Ejecutar el script"
    echo "2. Actualizar el script"
    echo "3. Salir"
    echo
    read -p "Selecciona una opción: " opcion

    case $opcion in
        1)
            ejecutar_script
            ;;
        2)
            actualizar_script
            ;;
        3)
            exit 0
            ;;
        *)
            echo "Opción inválida. Por favor, selecciona 1, 2 o 3."
            sleep 2
            mostrar_menu
            ;;
    esac
}

# Función para ejecutar el script principal
ejecutar_script() {
    # Pide al usuario que introduzca el nombre
    read -p "Introduce el nombre para el certificado: " NAME

    # Verifica si se proporcionó un nombre
    if [ -z "$NAME" ]; then
        echo "Error: No se proporcionó un valor para NAME."
        exit 1
    fi

    # Genera un identificador único
    PHPESSID=$(openssl rand -hex 16)

    # Define las URLs para generar el certificado y descargar el PDF
    URL_GENERAR_CERTIFICADO="http://example.com/generate_certificate"
    URL_DESCARGAR_PDF="http://example.com/download_pdf"

    # Codifica el nombre para usarlo en una URL
    NAME_ENCODED=$(echo "$NAME" | sed 's/ /%20/g')

    # Muestra los valores para depuración
    echo "PHPESSID: $PHPESSID"
    echo "NAME: $NAME_ENCODED"

    # Solicita la generación del certificado
    RESPONSE=$(curl -s -f -X POST "$URL_GENERAR_CERTIFICADO" -d "phpessid=$PHPESSID&name=$NAME_ENCODED")

    # Verifica si la solicitud fue exitosa
    if [ $? -ne 0 ]; then
        echo "Error: Fallo al realizar la solicitud para generar el certificado."
        exit 1
    fi

    # Muestra la respuesta de la generación del certificado
    echo "Respuesta de la generación del certificado: $RESPONSE"

    # Descarga el PDF
    curl -s -f -o "url.pdf" "$URL_DESCARGAR_PDF"

    # Verifica si la descarga fue exitosa
    if [ $? -ne 0 ]; then
        echo "Error: Fallo al descargar el PDF."
        exit 1
    fi

    # Confirma el éxito
    echo "Certificado generado y PDF descargado exitosamente."
    exit 0
}

# Función para actualizar el script
actualizar_script() {
    echo "Actualizando $SCRIPT_NAME desde $REPO_URL..."
    curl -s -o "$LOCAL_PATH" "$REPO_URL"

    if [ $? -ne 0 ]; then
        echo "Error: Fallo al actualizar el script."
        exit 1
    fi

    echo "$SCRIPT_NAME actualizado exitosamente."
    chmod +x "$LOCAL_PATH"
    echo "El script ahora se encuentra en $LOCAL_PATH"
    sleep 2
    mostrar_menu
}

# Llama al menú inicial para empezar
mostrar_menu
