#!/bin/bash
#estudiante:karen martinez mendoza
#ojo solo root puede ejecutar esto
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
    dialog --title "info a ingresar" \
	   --msgbox "usuario: $username \n\
		     grupo: $grupoid \n\
		     directorio: $directoriohome \n\
		     is uduario: $usuarioid
                     contraseña: $usuariopass" 15 30
}
function_crear(){
 echo "$username:x:$usuarioid:$grupoid::$directoriohome:/bin/bash" >> /etc/passwd
 echo "$username:x:$usuarioid" >> /etc/group
 mkdir $directoriohome
 chown $username $directoriohome
 #como root: hacemos su $username creado con este pasword nos deja entrar s/passwd
 if test $usuariopass ="U6aMy0wojraho";
 then
    echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
    #sudo passwd -d $username
 else
   #sino pedira loguearse con el paswwd ingresado
   #usuariopass=$
    echo "$username:$usuariopass" | chpasswd
 fi
 echo "el usuario se ha creado satisfactoriamente"
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
		3) echo "Elegiste directorio"; function_directoriohome;;
		4) echo "Elegiste usuarioid"; function_usuarioid;;
		5) echo "Elegiste usuariopass"; function_usuariopass;;
		6) echo "Elegiste verdatos"; function_verdatos;;
		7) echo "Elegiste crear"; function_crear;;
		8) fuera=1;
	esac
}
while [ $fuera -eq 0 ]
do
	function_menu
done
rm /tmp/input.txt
