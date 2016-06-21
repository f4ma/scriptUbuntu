#!/bin/bash
arch=$(arch)
username=$(ls /home) #obtém o nome da pasta que tem em /home
username=${username^} #converte a primeira letra para maiúscula para assimilar-se a um nome próprio

#var

#define -i instPRG

#instPRG
# 1 - Google Chrome
# 2 - Sublime Text
# 3 - Spotify
# 4 - Skype
# 5-  Geany
# 6 - Codeblocks
# 7 - Albert 
# 8 - Gimp
# 9 - Kdenlive
# ? - Chamada de menu para instalação de novos ambientes gráficos


#DIALOG YESNO
# $? = 0 (SIM) : $? = 1 (NÃO) : A ; L 

basico_do_instalador () {
	espeak_vrf=$(which espeak)
	#Dialog para fazer a interface gráfica pro usuário
	zenity --info --title="Aviso" --text="Instalando dependências necessárias..."
	apt-get update && apt get install dialog -y > /dev/null 2>&1
	if [ $espeak_vrf == "/usr/bin/espeak" ];then
		dialog --title "Aviso" --msgbox "Dependências necessárias foram instaladas!"
		menu_principal
	fi
}

google_chrome () {
	verifi_google=$(which google-chrome)
	if [ $verifi_google = "/usr/bin/google-chrome" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Google Chrome instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalar do Google Chrome" --yesno "Você deseja instalar o Google Chrome? " 10 35
		if [ $? == 0 ];then
			if [ $arch == "x86_64" ];then
				dialog --title "Instalador" --msgbox "Instalando..." 10 25
				wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb > /dev/null 2>&1
				dpkg -i google-chrome.deb > /dev/null 2>&1
				apt-get -f install > /dev/null 2>&1
				apt-get update > /dev/null 2>&1
				dialog --title "Aviso" --msgbox "Google Chrome instalado!" 10 25
				instPRG=1
			else
				dialog --title "Erro" --msgbox "Verifique o site do fornecedor do programa para obter suporte para sua plataforma" 10 25
				instPRG=0
			fi
		fi
	fi
	unset arch
	menu_principal
}

sublime_text () {
	verifi_sublime=$(which subl)
	if [ $verifi_sublime = "/usr/bin/subl" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Sublime Text instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Sublime Text" --yesno "Você deseja instalar o Sublime Text? " 10 35
		if [ $? == 0 ];then
			dialog --title "Instalador" --msgbox "Instalando..." 10 25
			add-apt-repository -y ppa:webupd8team/sublime-text-3 && apt-get update && apt-get install -y sublime-text-installer > /dev/null 2>&1
			dialog --title "Aviso" --msgbox "Sublime Text instalado!" 10 25
			instPRG=2
		fi
	fi
	menu_principal
}

spotify () {
	verifi_spotify=$(which spotify)
	if [ $verifi_spotify = "/usr/bin/spotify" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Spotify instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Spotify" --yesno "Você deseja instalar o Spotify?" 10 35
		if [ $? == 0 ];then
			dialog --title "Instalador" --msgbox "Instalando" 10 25
			apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 > /dev/null 2>&1
            echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list > /dev/null 2>&1
            apt-get update && apt-get install -y spotify-client > /dev/null 2>&1
            dialog --title "Aviso" --msgbox "Spotify instalado!" 10 25
            instPRG=3
		fi
	fi
	menu_principal
}

skype () {
	verifi_skype=$(which skype)
	if [ $verifi_skype == "/usr/bin/skype" ];then
		dialog --title "Aviso" --msgbox "Você já posssui o Skype instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Skype" --yesno "Você deseja instalar o Skype? " 10 35
		if [ $? == 0 ];then
			if [ $arch == "x86_64" ];then
				dialog --title "Instalador" --msgbox "Instalando..." 10 25
				wget https://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb -O skype.deb > /dev/null 2>&1
				dpkg -i sype.deb && apt-get -f install && apt-get update > /dev/null 2>&1
				dialog --title "Aviso" --msgbox "Skype instalado!" 10 25
				instPRG=4
			elif [ $arch != "x86_64" ];then
				dialog --title "Instalador" --msgbox "Instalando..." 10 25
				wget https://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb -O skype.deb > /dev/null 2>&1
				dpkg -i sype.deb && apt-get update > /dev/null 2>&1
				dialog --title "Aviso" --msgbox "Skype instalado!" 10 25
				instPRG=4
			fi
		fi
	fi
	menu_principal
}

geany () {
	verifi_geany=$(which geany)
	if [ $verifi_geany == "/usr/bin/geany" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Geany instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Geany" --yesno "Você deseja instalar o Geany? " 10 35
		if [ $? == 0 ];then
			dialog --title "Instalador" --msgbox "Instalando..." 10 25
			apt-get install geany -y > /dev/null 2>&1
			dialog --title "Aviso" --msgbox "Geany instalado!" 10 25
			instPRG=5
		fi
	fi
	menu_principal
}

codeblocks () {
	verifi_geany=$(which codeblocks)
	if [ $verifi_geany == "/usr/bin/codeblocks" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Codeblocks instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Codeblocks" --yesno "Você deseja instalar o Codeblocks? " 10 35
		if [ $? == 0 ];then
			dialog --title "Instalador" --msgbox "Instalando..." 10 25
			apt-get install codeblocks -y > /dev/null 2>&1
			dialog --title "Aviso" --msgbox "Codeblocks instalado!" 10 25
			instPRG=6
		fi
	fi
	menu_principal
}

albert () {
	verifi_albert=$(which albert)
	if [ $verifi_albert == "/usr/bin/albert" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Albert instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Albert" --msgbox "Você deseja instalar o Albert? " 10 35
		if [ $? == 0 ];then
			dialog --title "Instalador" --msgbox "Instalando..." 10 25
			add-apt-repository ppa:nilarimogard/webupd8sudo && apt-get update && apt-get install albert -y > /dev/null 2>&1
			dialog --title "Aviso" --msgbox "Albert instalado!" 10 25
			instPRG=7
		fi
	fi
	menu_principal
}

gimp () {
	verifi_gimp=$(which gimp)
	if [ $verifi_gimp == "/usr/bin/gimp" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Gimp instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Gimp" --yesno "Você deseja instalar o Gimp? " 10 35
		if [ $? == 0 ];then
			dialog --title "Instalador" --msgbox "Instalando..." 10 25
			apt-get install gimp -y > /dev/null 2>&1
			dialog --title "Aviso" --msgbox "Gimp instalado!" 10 25
			instPRG=8
		fi
	fi
	menu_principal
}

kdenlive () {
	verifi_kdenlive=$(which kdenlive)
	if [ $verifi_kdenlive == "/usr/bin/kdenlive" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Kdenlive instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Kdenlive" --yesno "Você deseja instalar o Kdenlive? " 10 35
		if [ $? == 0 ];then
			dialog --title "Instalador" --msgbox "Instalando..." 10 25
			apt-get install kdenlive -y > /dev/null 2>&1
			dialog --title "Aviso" --msgbox "Kdenlive instalado!" 10 25
			instPRG=9
		fi
	fi
	menu_principal
}

multisystem () {
	verifi_multisystem=$(ls /usr/local/bin | grep multisystem)
	if [ $verifi_multisystem == "multisystem" ];then
		dialog --title "Aviso" --msgbox "Você já possui o Multisystem instalado!" 10 25
		instPRG=0
	else
		dialog --title "Instalador do Multisystem" --yesno "Deseja instalar o Multisystem? " 10 35
		if [ $? == 0 ];then
			dialog --title "Instalador" --msgbox "Instalando..." 10 25
			wget -O multisystem.tar.bz2 http://liveusb.info/multisystem/install-depot-multisystem.sh.tar.bz2 > /dev/null 2>&1
			if [ -e multisystem*.tar.bz2 ];then
				tar -xjpf multisystem.tar.bz2
				chmod +x install*.sh
				./install.sh > /dev/null 2>&1
				dialog --title "Instalador" --msgbox "Multisystem instalado!" 10 25
				instPRG=10
			else
				dialog --title --msgbox "Aconteceu algum erro! Não conseguimos encontrar o arquivo." 10 25
				instPRG=0
			fi
		fi
	fi
	menu_principal
}

escrever_log () {
	case $instPRG in
		1) 
			echo "Instalou Google Chrome" >> logIST.txt ;;
		2) 
			echo "Instalou Sublime Text" >> logIST.txt ;;
		3) 
			echo "Instalou Spotify" >> logIST.txt ;;
		4) 
			echo "Instalou Skype" >> logIST.txt ;;
		5) 
			echo "Instalou Geany" >> logIST.txt ;;
		6) 
			echo "Instalou Codeblocks" >> logIST.txt ;;
		7) 
			echo "Instalou Albert" >> logIST.txt ;;
		8) 
			echo "Instalou Gimp" >> logIST.txt ;;
		9) 
			echo "Instalou Kdenlive" >> logIST.txt ;;
		10) 
			echo "Instalou Multisystem" >> logIST.txt;;
		*) 
			echo "Código retornado: $instPRG. Programas não foram instalados.";;
	esac
}


menu_principal () {
	user=$(whoami)
	if [ $user == "root" ];then
		dialog --title "Boas vindas" --msgbox "Bem vindo(a) $username.\nEsperamos que aproveite bem do nosso instalador! Agradecemos você estar utilizando-o.\n" 10 25
		menu=$(dialog --stdout --menu "Instalador simples" 20 45 10 \
		google "Instalar Google Chrome" \
		sublime "Instalar Sublime Text" \
		spotify "Instalar Spotify" \
		skype "Instalar Skype" \
		geany "Instalar Geany" \
		codeblocks "Instalar Codeblocks" \
		albert "Instalar Albert" \
		gimp "Instalar gimp" \
		multisystem "Instalar Multisystem" \
		kdenlive "Instalar kdenlive" )
		if [ $menu == google ];then
			google_chrome
		elif [ $menu == sublime ];then
			sublime_text
		elif [ $menu == spotify ];then
			spotify
		elif [ $menu == skype ];then
			skype
		elif [ $menu == geany ];then
			geany
		elif [ $menu == codeblocks ];then
			codeblocks
		elif [ $menu == albert ];then
			albert
		elif [ $menu == gimp ];then
			gimp
		elif [ $menu == kdenlive ];then
			kdenlive
		elif [ $menu == multisystem ];then
			multisystem
		else
			dialog --title "Erro" --msgbox "Parece que deu algum erro no script, provável que você não tenha selecionado nada. Tente novamente!" 10 25;sleep 2; clear;instPRG=0
		fi
		escrever_log
	elif [ $user != "root" ];then
		zenity --info --title="Aviso sobre permissão" --text="Entre com o usuário root para usar o script";sleep 4; clear
	fi
}

menu_principal #Inicia função principal
