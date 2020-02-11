#!/bin/bash
#estudiante:karen martinez mendoza

OUTPUT="/tmp/input.txt"
let fuera=0
#variables globales
let username
let grupoid
let directoriohome
let usuarioid
let usuariopass

#FUNCIONES
function_username(){
    rm /tmp/calc.tmp
    rm /tmp/calc2.tmp
    # Dibuja funcion username
    dialog --inputbox "Indica el nombre del usuario" 0 0 2>$OUTPUT
    # lee lo que  escribe Y ASIGNA A 
    username=$(<$OUTPUT)
}
function_grupoid(){
    rm /tmp/calc.tmp
    rm /tmp/calc2.tmp
    # Dibuja funcion grupoid
    dialog --inputbox "Indica el grupo id(1000)" 0 0 2>$OUTPUT
    # lee lo que  escribe Y ASIGNA A 
    grupoid=$(<$OUTPUT)
}
function_directoriohome(){
    rm /tmp/calc.tmp
    rm /tmp/calc2.tmp
    # Dibuja funcion directoriohome
    dialog --inputbox "Indica el directorio del usuario(/home/usuario)" 0 0 2>$OUTPUT
    # lee lo que  escribe Y ASIGNA A 
    directoriohome=$(<$OUTPUT)
}
function_usuarioid(){
    rm /tmp/calc.tmp
    rm /tmp/calc2.tmp
    # Dibuja funcion usuarioid
    dialog --inputbox "Indica el id del usuario (1001)" 0 0 2>$OUTPUT
    # lee lo que  escribe Y ASIGNA A 
    usuarioid=$(<$OUTPUT)
}
function_usuariopass(){
    rm /tmp/calc.tmp
    rm /tmp/calc2.tmp
    # Dibuja funcion usuariopass
    dialog --inputbox "Indica la contraseña" 0 0 2>$OUTPUT
    # lee lo que  escribe Y ASIGNA A 
    usuariopass=$(<$OUTPUT)
}
function_verdatos(){
    rm /tmp/calc.tmp
    rm /tmp/calc2.tmp
    # Dibuja funcion verdatos
    dialog --msgbox "usuario: $username \n\
		     grupo: $grupoid " 15 20
}

#Menu principal
function_menu(){
        dialog --clear --title "PROGRAMA -- gestion usuarios" \
	--backtitle "Menu" \
	--menu "Elige una opcion" 20 50 10 \
		 "1" " NOMBRE DE USUARIO" \
		 "2" "GRUPO (GID)" \
		 "3" "DIRECTORIO (/home/nombre de usuario)" \
		 "4" "ID USUARIO (UID) " \
		 "5" "CONTRASEÑA" \
		 "6" "VER DATOS" \
		 "7" "CREAR" \
		 "8" "Salir del Script" 2>$OUTPUT

	#lee lo q escriben
	#menuitem=$(<"${INPUT}")
	menuitem=$(<$OUTPUT)
#	echo $menuitem
	#entra en el case
	case $menuitem in
		1) function_username;;
		2) echo "Elegiste grupoid"; function_grupoid;;
#		3) echo "Elegiste multiplicar"; function_;;
#		4) echo "Elegiste dividir"; function_division;;
#		5) echo "Elegiste modulo"; function_modulo;;
#		6) echo "Elegiste modulo"; function_modulo;;
#		7) echo "Elegiste modulo"; function_modulo;;
#		8) fuera=1;
	esac
}
while [ $fuera -eq 0 ]
do
	function_menu
done
rm /tmp/input.txt
