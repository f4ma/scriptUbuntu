#!/bin/bash
    mudar_voz () {
        numeroDaVoz=$[$RANDOM%2]
        vozesDisponiveis=(f m)
        vozAtual=${vozesDisponiveis[numeroDaVoz]}
    }    
    main () {
    user=$(whoami)
    arch=$(uname -m)
    userName=$(ls /home)
    dirAtual=$(pwd)
    algoDaVoz=1
    #função
    mudar_voz
    #checar root
    if [ $user = root ];then
        #verificar se existe o espeak
        verifi_espeak=$(which espeak)
        echo verifi_espeak
        clear
        echo "Processando..."
        if [ $verifi_espeak = "/usr/bin/espeak" ];then
        	clear
            espeak -vpt+$vozAtual$algoDaVoz "Você tem a dependência necessária para executar, vamos seguir em frente."
        else
        	clear
            echo "Temos que instalar uma dependência do script."
            apt-get install espeak -y
            clear
            main
        fi
        #voz, necessária do espeak
        clear
        echo "Você está como root"
        dpkg --configure -a
        #verificar arquitetura
        case $arch in
       "i686") echo "Versão do sisteam: 32 Bits."
             ;;
       "x86_64") echo "Versão do sistema: 64 Bits."
             ;;
       *) echo "Versão do sistema não avaliada"
          exit 1
          ;;
    esac
    #Instalando coisas necessárias para o script
    verifi_unzip=$(which unzip)
    if [ $verifi_unzip = "/usr/bin/unzip" ];then
        clear
        echo "Você tem a depend unzip instalada :D"
    else
        echo "Vamos instalar a dependência necessária (unzip)"
        apt-get install -y unzip&
        clear
    fi #unzip
    #AVISO
    espeak -vpt+$vozAtual$algoDaVoz "Bem vindo $userName"
    zenity --info --text="Este programa não foi desenvolvido por alguém experiente :P\n
Se você quiser pode usar o Ctrl+C para cancelar o script à qualquer momento"
        clear
        espeak -vpt+$vozAtual$algoDaVoz "Para responder digite S ou N"
        echo "Digite S ou N,  para aceitar ou não."
        espeak -vpt+$vozAtual$algoDaVoz "Lembre-se, S ou N"&
        echo "Quer instalar o Google Chrome? "
        read deseja_instalar_chrome
        if [ $deseja_instalar_chrome = 'S' ];then
            if [ $arch = 'x86_64' ];then
                echo "Instalando Google Chrome..."
                cd $HOME/Downloads
                wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                dpkg -i google-chrome-stable_current_amd64.deb
                apt-get install -f -y && dpkg --configure -a
                echo "Google Chrome Instalado!"
                echo "Consertando um erro..."
                cd /etc/apt/sources.list.d && rm chrome*
            elif [ $arch != 'x86_64' ];then
                echo "Instalando Google Chrome..."
                cd $HOME/Downloads
                wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
                dpkg -i google-chrome-stable_current_i386.deb
                apt-get install -f -y && dpkg --configure -a
                echo "Google Chrome Instalado!"
                echo "Consertando um erro..."
                cd /etc/apt/sources.list.d && rm chrome*
            fi
        elif [ $deseja_instalar_chrome = 's' ];then
            if [ $arch = 'x86_64' ];then
                echo "Instalando Google Chrome..."
                cd $HOME/Downloads
                wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
                dpkg -i google-chrome-stable_current_amd64.deb
                apt-get install -f -y && dpkg --configure -a
                echo "Google Chrome Instalado!"
                echo "Consertando um erro..."
                cd /etc/apt/sources.list.d && rm chrome*
            elif [ $arch != 'x86_64' ];then
                echo "Instalando Google Chrome..."
                cd $HOME/Downloads
                wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
                dpkg -i google-chrome-stable_current_i386.deb
                apt-get install -f -y && dpkg --configure -a
                echo "Google Chrome Instalado!"
                echo "Consertando um erro..."
                cd /etc/apt/sources.list.d && rm chrome*
            fi
        else
            echo "Não vamos instalar Google Chrome."
        fi
        echo "Quer instalar o Compiz? "
        read deseja_instalar_compiz
        if [ $deseja_instalar_compiz = 'S' ];then
            echo "Instalando Compiz..."
            apt-get install -y compiz-plugins-extra compiz compiz-fusion-bcop compiz-gnome compizconfig-settings-manager
            echo "Compiz Instalado!"
        elif [ $deseja_instalar_compiz = 's' ];then
            echo "Instalando Compiz..."
            apt-get install -y compiz-plugins-extra compiz compiz-fusion-bcop compiz-gnome compizconfig-settings-manager
            echo "Compiz Instalado!"
        else
            echo "Não vamos instalar Compiz."
        fi
        echo "Quer instalar indicador de pesquisa? "
        read deseja_instalar_synapse
        if [ $deseja_instalar_synapse = 'S' ];then
            echo "Instalando Synapse Indicator..."
            add-apt-repository ppa:noobslab/apps -y && apt-get update && apt-get install -y indicator-synapse
            echo "Indicador de pesquisa Instalado!"
        elif [ $deseja_instalar_synapse = 's' ];then
            echo "Instalando Synapse Indicator..."
            add-apt-repository ppa:noobslab/apps -y && apt-get update && apt-get install -y indicator-synapse
            echo "Indicador de pesquisa Instalado!"
        else
            echo "Não vamos instalar indicador de pesquisa."
        fi
        echo "Quer instalar o Conky Manager? "
        read deseja_instalar_conky
        if [ $deseja_instalar_conky = 'S' ];
            then
            if [ $deseja_instalar_synapse 'S' ];then
                echo "Instalando Conky Manager..."
                apt-get install -y conky-manager
                echo "Conky Manager Instalado!"
            elif [ $deseja_instalar_synapse = 's' ];then
                echo "Instalando Conky Manager..."
                apt-get install -y conky-manager
                echo "Conky Manager Instalado!"
            elif [ $deseja_instalar_synapse = 'N' ];then
                echo "Instalando Conky Manager..."
                add-apt-repository ppa:noobslab/apps -y && apt-get update && apt-get install -y conky-manager
                echo "Conky Manager Instalado!"
            elif [ $deseja_instalar_synapse = 'n' ];then
                echo "Instalando Conky Manager..."
                add-apt-repository ppa:noobslab/apps -y && apt-get update && apt-get install -y conky-manager
                echo "Conky Manager Instalado!"
            fi
        elif [ $deseja_instalar_conky = 's' ];then
            if [ $deseja_instalar_synapse = 'S' ];then
                echo "Instalando Conky Manager..."
                apt-get install -y conky-manager
                echo "Conky Manager Instalado!"
            elif [ $deseja_instalar_synapse = 's' ];then
                echo "Instalando Conky Manager..."
                apt-get install -y conky-manager
                echo "Conky Manager instalado!"
            elif [ $deseja_instalar_synapse = 'N' ];then
                echo "Instalando Conky Manager..."
                add-apt-repository ppa:noobslab/apps -y && apt-get update && apt-get install -y conky-manager
                echo "Conky Manager Instalado!"
            elif [ $deseja_instalar_synapse = 'n' ];then
                echo "Instalando Conky Manager..."
                add-apt-repository ppa:noobslab/apps && apt-get update && apt-get install -y conky-manager 
                echo "Conky Manager Instalado!"
            fi
        else
            echo "Não vamos instalar Conky Manager"
        fi
        echo "Quer instalar o Spotify? "
        read deseja_instalar_spotify
        if [ $deseja_instalar_spotify = 'S' ];then
            echo "Instalando Spotify..."
            apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
            echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
            apt-get update && apt-get install -y spotify-client
            echo "Spotify Instalado"
        elif [ $deseja_instalar_spotify = 's' ];then
            echo "Instalando Spotify..."
            apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
            echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
            apt-get update && apt-get install -y spotify-client
            echo "Spotify Instalado!"
        else
            echo "Não vamos instalar Spotify"
        fi
        echo "Quer instalar o Sublime Text? "
        read deseja_instalar_sublime
        if [ $deseja_instalar_sublime = 'S' ];then
            echo "Instalando Sublime Text 3..."
            add-apt-repository -y ppa:webupd8team/sublime-text-3 && apt-get update && apt-get install -y sublime-text-installer
            echo "Sublime Text 3 Instalado!"
        elif [ $deseja_instalar_sublime = 's' ];then
            echo "Instalando Sublime Text 3..."
            add-apt-repository -y  ppa:webupd8team/sublime-text-3 && apt-get update && apt-get install -y sublime-text-installer
            echo "Sublime Text 3 Instalado!"
        else
            echo "Não vamos instalar Sublime Text"
        fi
        echo "Quer instalar o Audacity? "
        read deseja_instalar_audacity
        if [ $deseja_instalar_audacity = 'S' ];then
            echo "Instalando Audacity..."
            apt-get install -y audacity
            echo "Audacity Instalado!"
        elif [ $deseja_instalar_audacity = 's' ];then
            echo "Instalando Audacity..."
            apt-get install -y audacity
            echo "Audacity Instalado!"
        else
            echo "Não vamos instalar Audacity"
        fi
        echo "Quer instalar Kdenlive? "
        read deseja_instalar_kdenlive
        if [ $deseja_instalar_kdenlive = 'S' ];then
            echo "Instalando Kdenlive..."
            apt-get install -y kdenlive
            echo "Kdenlive Instalado!"
        elif [ $deseja_instalar_kdenlive = 's' ];then
            echo "Instalando Kdenlive..."
            apt-get install -y kdenlive
            echo "Kdenlive Instalado!"
        else
            echo "Não vamos instalar Kdenlive"
        fi
        echo "Quer instalar o Gimp? "
        read deseja_instalar_gimp
        if [ $deseja_instalar_gimp = 'S' ];then
            echo "Instalando Gimp..."
            apt-get update && apt-get install -y gimp
            echo "Gimp Instalado!"
        elif [ $deseja_instalar_gimp = 's' ];then
            echo "Instalando Gimp..."
            apt-get update && apt-get install -y gimp
            echo "Gimp Instalado!"
        else
            echo "Não vamos instalar Gimp"
        fi
        echo "Quer instalar CodeBlocks? "
        read deseja_instalar_codeblocks
        if [ $deseja_instalar_codeblocks = 'S' ];then
            echo "Instalando CodeBlocks..."
            apt-get update && apt-get install -y codeblocks
            echo "CodeBlocks Instalado!"
        elif [ $deseja_instalar_codeblocks = 's' ];then
            echo "Instalando CodeBlocks..."
            apt-get update && apt-get install -y codeblocks
            echo "CodeBlocks Instalado!"
        else
            echo "Não vamos instalar CodeBlocks"
        fi
        echo "Quer instalar o Htop? "
        read deseja_instalar_htop
        if [ $deseja_instalar_htop = 'S' ];then
            echo "Instalando Htop..."
            apt-get update && apt-get install htop
            echo "Htop Instalado!"
        elif [ $deseja_instalar_htop = 's' ];then
            echo "Instalado Htop..."
            apt-get update && apt-get install htop
            echo "Htop Instalado!"
        else
            echo "Não vamos instalar o Htop"
        fi
        echo "Quer instalar MultiSystem? "
        read deseja_instalar_multisystem
        if [ $deseja_instalar_multisystem = 'S' ];then
            cd $HOME/Downloads
            wget -c http://liveusb.info/multisystem/install-depot-multisystem.sh.tar.bz2
            tar -jxvf install-depot-multisystem.sh.tar.bz2
            chmod +x install-depot-multisystem.sh
            ./install-depot-multisystem.sh
        elif [ $deseja_instalar_multisystem = 's' ];then
            cd $HOME/Downloads
            wget -c http://liveusb.info/multisystem/install-depot-multisystem.sh.tar.bz2
            tar -jxvf install-depot-multisystem.sh.tar.bz2
            chmod +x install-depot-multisystem.sh
            ./install-depot-multisystem.sh
        else
            echo "Não vamos instalar MultiSystem"
        fi
        
        echo "Quer instalar o Visual Code? "
        read deseja_instalar_vscode
        
        if [ $deseja_instalar_vscode = 'S' ];then
        	cd /usr/share/applications
            if [ -e  visual-code.desktop ];then
                echo "Você já tem instalado."
                exit
            fi #Verificando instalação
            if [ $arch = "x86_64" ];then
            	cd ~/Downloads
                wget -c https://az764295.vo.msecnd.net/stable/db71ac615ddf9f33b133ff2536f5d33a77d4774e/VSCode-linux-x64-stable.zip
                unzip VSCode* -d ~/Documentos/VSCode && rm VSCode*.zip
                cp ~/Documentos/VSCode/VSCode*/resources/app/resources/linux/code.png /usr/share/icons/code.png
                cd /usr/share/applications && touch visual-code.desktop
                ln -s ~/Documentos/VSCode*/VSCode*/Code /usr/bin/vscode
                echo "[Desktop Entry]" >> visual-code.desktop
                echo "Version=1.0" >> visual-code.desktop
                echo "Type=Application" >> visual-code.desktop
                echo "Name=Visual Code" >> visual-code.desktop
                echo "Comment=Visual Code da Microsoft" >> visual-code.desktop
                echo "Exec=vscode" >> visual-code.desktop
                echo "Terminal=False" >> visual-code.desktop
                echo "MimeType=text/plain" >> visual-code.desktop
                echo "Icon=/usr/share/icons/code.png" >> visual-code.desktop
                echo "Categories=TextEditor;Development;Utility" >> visual-code.desktop
                echo "Visual Code Instalado!"
            elif [ $arch = "i686" ];then
            	cd ~/Downloads
                wget -c https://az764295.vo.msecnd.net/stable/5b5f4db87c10345b9d5c8d0bed745bcad4533135/VSCode-linux-ia32-stable.zip
                unzip VSCode* -d ~/Documentos/VSCode && rm VSCode*.zip 
                cp ~/Documentos/VSCode/VSCode*/resources/app/resources/linux/code.png /usr/share/icons/code.png
                cd /usr/share/applications && touch visual-code.desktop
                ln -s ~/Documentos/VSCode*/VSCode*/Code /usr/bin/vscode
                echo "[Desktop Entry]" >> visual-code.desktop
                echo "Version=1.0" >> visual-code.desktop
                echo "Type=Application" >> visual-code.desktop
                echo "Name=Visual Code" >> visual-code.desktop
                echo "Comment=Visual Code da Microsoft" >> visual-code.desktop
                echo "Exec=vscode" >> visual-code.desktop
                echo "Terminal=False" >> visual-code.desktop
                echo "MimeType=text/plain" >> visual-code.desktop
                echo "Icon=/usr/share/icons/code.png" >> visual-code.desktop
                echo "Categories=TextEditor;Development;Utility" >> visual-code.desktop
                echo "Visual Code Instalado!"
            fi #arch VSCODE
        elif [ $deseja_instalar_vscode = 's' ];then
        	cd /usr/share/applications
        	if [ -e  visual-code.desktop ];then
        		echo "Você já tem instalado."
        		exit
        	fi #Verificando instalação
        	if [ $arch = "x86_64" ];then
        		cd ~/Downloads
                wget -c https://az764295.vo.msecnd.net/stable/db71ac615ddf9f33b133ff2536f5d33a77d4774e/VSCode-linux-x64-stable.zip
                unzip VSCode* -d ~/Documentos/VSCode && rm VSCode*.zip
                cp ~/Documentos/VSCode/VSCode*/resources/app/resources/linux/code.png /usr/share/icons/code.png
                cd /usr/share/applications && touch visual-code.desktop
                ln -s ~/Documentos/VSCode*/VSCode*/Code /usr/bin/vscode
                echo "[Desktop Entry]" >> visual-code.desktop
                echo "Version=1.0" >> visual-code.desktop
                echo "Type=Application" >> visual-code.desktop
                echo "Name=Visual Code" >> visual-code.desktop
                echo "Comment=Visual Code da Microsoft" >> visual-code.desktop
                echo "Exec=vscode" >> visual-code.desktop
                echo "Terminal=False" >> visual-code.desktop
                echo "MimeType=text/plain" >> visual-code.desktop
                echo "Icon=/usr/share/icons/code.png" >> visual-code.desktop
                echo "Categories=TextEditor;Development;Utility" >> visual-code.desktop
                echo "Visual Code Instalado!"
            elif [ $arch = "i686" ];then
            	cd ~/Downloads
                wget -c https://az764295.vo.msecnd.net/stable/5b5f4db87c10345b9d5c8d0bed745bcad4533135/VSCode-linux-ia32-stable.zip
                unzip VSCode* -d ~/Documentos/VSCode && rm VSCode*.zip 
                cp ~/Documentos/VSCode/VSCode*/resources/app/resources/linux/code.png /usr/share/icons/code.png
                cd /usr/share/applications && touch visual-code.desktop
                ln -s ~/Documentos/VSCode*/VSCode*/Code /usr/bin/vscode
                echo "[Desktop Entry]" >> visual-code.desktop
                echo "Version=1.0" >> visual-code.desktop
                echo "Type=Application" >> visual-code.desktop
                echo "Name=Visual Code" >> visual-code.desktop
                echo "Comment=Visual Code da Microsoft" >> visual-code.desktop
                echo "Exec=vscode" >> visual-code.desktop
                echo "Terminal=False" >> visual-code.desktop
                echo "MimeType=text/plain" >> visual-code.desktop
                echo "Icon=/usr/share/icons/code.png" >> visual-code.desktop
                echo "Categories=TextEditor;Development;Utility" >> visual-code.desktop
                echo "Visual Code Instalado!"
            fi #arch VSCODE
        else 
        	echo "Não vamos instalar o Visual Code"
       	fi #VSCode

		echo "Quer instalar o Soundnode? "
		read deseja_instalar_soundnode
		if [ $deseja_instalar_soundnode = 'S'  ];then
			cd /usr/share/applications
			if [ -e Soundnode.desktop  ];then
				echo "Você já me tem instalado"
				exit
			fi #verificar se tem instalado
			if [ $arch = "x86_64"  ];then
				wget -c http://www.soundnodeapp.com/downloads/linux64/Soundnode-App.zip && unzip Soundnode*
				cd ~/Documentos && mkdir Soundnode && cd ~/Downloads && cp -R  Soundnode* -d ~/Documentos/Soundnode
				ln -s ~/Documentos/Soundnode/Soundnode* /usr/bin/soundnode
				cd /usr/share/icons && wget -c http://icons.iconarchive.com/icons/bokehlicia/pacifica/128/soundcloud-icon.png -O soundcloud.png
				cd /usr/share/applications && touch Soundnode.desktop
				echo "[Desktop Entry]" >> Soundnode.desktop
				echo "Name=Soundnode" >> Soundnode.desktop
				echo "Comment=Um cliente para o Soundcloud" >> Soundnode.desktop
				echo "Exec=soundnode" >> Soundnode.desktop
				echo "Icon=/usr/share/icons/soundcloud.png" >> Soundnode.desktop
				echo "Type=Application" >> Soundnode.desktop
				echo "Terminal=False" >> Soundnode.desktop
				echo "Categories=AudioVideo" >> Soundnode.desktop
            elif [ $arch = "i686" ];then
                wget -c http://www.soundnodeapp.com/downloads/linux32/Soundnode-App.zip && unzip Soundnode*
                cd ~/Documentos && mkdir Soundnode && cd ~/Downloads && cp -R  Soundnode* -d ~/Documentos/Soundnode
                ln -s ~/Documentos/Soundnode/Soundnode* /usr/bin/soundnode
                cd /usr/share/icons && wget -c http://icons.iconarchive.com/icons/bokehlicia/pacifica/128/soundcloud-icon.png -O soundcloud.png
                cd /usr/share/applications && touch Soundnode.desktop
                echo "[Desktop Entry]" >> Soundnode.desktop
                echo "Name=Soundnode" >> Soundnode.desktop
                echo "Comment=Um cliente para o Soundcloud" >> Soundnode.desktop
                echo "Exec=soundnode" >> Soundnode.desktop
                echo "Icon=/usr/share/icons/soundcloud.png" >> Soundnode.desktop
                echo "Type=Application" >> Soundnode.desktop
                echo "Terminal=False" >> Soundnode.desktop
                echo "Categories=AudioVideo" >> Soundnode.desktop
			fi #arch SOUNDNODE
        elif [ $deseja_instalar_soundnode = 's' ];then
            cd /usr/share/applications
            if [ -e Soundnode.desktop ];then
                echo "Você já me tem instalado"
                exit
            fi #verificar sem tem instalado
            if [ $arch = "x86_64"  ];then
                wget -c http://www.soundnodeapp.com/downloads/linux64/Soundnode-App.zip && unzip Soundnode*
                cd ~/Documentos && mkdir Soundnode && cd ~/Downloads && cp -R  Soundnode* -d ~/Documentos/Soundnode
                ln -s ~/Documentos/Soundnode/Soundnode* /usr/bin/soundnode
                cd /usr/share/icons && wget -c http://icons.iconarchive.com/icons/bokehlicia/pacifica/128/soundcloud-icon.png -O soundcloud.png
                cd /usr/share/applications && touch Soundnode.desktop
                echo "[Desktop Entry]" >> Soundnode.desktop
                echo "Name=Soundnode" >> Soundnode.desktop
                echo "Comment=Um cliente para o Soundcloud" >> Soundnode.desktop
                echo "Exec=soundnode" >> Soundnode.desktop
                echo "Icon=/usr/share/icons/soundcloud.png" >> Soundnode.desktop
                echo "Type=Application" >> Soundnode.desktop
                echo "Terminal=False" >> Soundnode.desktop
                echo "Categories=AudioVideo" >> Soundnode.desktop
            elif [ $arch = "i686" ];then
                wget -c http://www.soundnodeapp.com/downloads/linux32/Soundnode-App.zip && unzip Soundnode*
                cd ~/Documentos && mkdir Soundnode && cd ~/Downloads && cp -R  Soundnode* -d ~/Documentos/Soundnode
                ln -s ~/Documentos/Soundnode/Soundnode* /usr/bin/soundnode
                cd /usr/share/icons && wget -c http://icons.iconarchive.com/icons/bokehlicia/pacifica/128/soundcloud-icon.png -O soundcloud.png
                cd /usr/share/applications && touch Soundnode.desktop
                echo "[Desktop Entry]" >> Soundnode.desktop
                echo "Name=Soundnode" >> Soundnode.desktop
                echo "Comment=Um cliente para o Soundcloud" >> Soundnode.desktop
                echo "Exec=soundnode" >> Soundnode.desktop
                echo "Icon=/usr/share/icons/soundcloud.png" >> Soundnode.desktop
                echo "Type=Application" >> Soundnode.desktop
                echo "Terminal=False" >> Soundnode.desktop
                echo "Categories=AudioVideo" >> Soundnode.desktop
            fi #arch SOUNDNODE
        else
            echo "Não vamos instalar o Soundnode"
		fi #SOUNDNODE
        echo "Quer instalar o 4K Youtube to mp3? "
        read deseja_instalar_4kyoutube
        if [ $deseja_instalar_4kyoutube  = 'S'  ];then
            cd ~/Downloads
            if [ $arch = "x86_64" ];then
                wget -c https://downloads.4kdownload.com/app/4kyoutubetomp3_3.0-1_amd64.deb && dpkg -i 4kyoutube*.deb
            elif [ $arch = "i686" ];then
            	wget -c https://downloads.4kdownload.com/app/4kyoutubetomp3_3.0-1_i386.deb && dpkg -i 4kyoutube*.deb   
            fi
            cd /usr/share/icons && wget -c http://icons.iconarchive.com/icons/raindropmemory/artificial-girl/128/Music-icon.png
            mv Music*.png music.png && cd /usr/share/applications && wget -c https://ghostbin.com/paste/mkerp/download
            mv download 4kyoutubetomp3.desktop
            echo "4K Youtube to m3p Instalado!"
            #verificar arch 4k youtube
        elif [ $deseja_instalar_4kyoutube = 's' ];then
            cd ~/Downloads
            if [ $arch = "x86_64" ];then
                wget -c https://downloads.4kdownload.com/app/4kyoutubetomp3_3.0-1_amd64.deb && dpkg -i 4kyoutube*.deb
            elif [ $arch = "i686" ];then
                wget -c https://downloads.4kdownload.com/app/4kyoutubetomp3_3.0-1_i386.deb && dpkg -i 4kyoutube*.deb   
            fi
            cd /usr/share/icons && wget -c http://icons.iconarchive.com/icons/raindropmemory/artificial-girl/128/Music-icon.png
            mv Music*.png music.png && cd /usr/share/applications && wget -c https://ghostbin.com/paste/mkerp/download
            mv download 4kyoutubetomp3.desktop
            echo "4K Youtube to m3p Instalado!"
            #verificar arch 4k youtube
        else
            echo "Não vamos instalar o 4K Youtube to mp3"
        fi #4K YOUTUBE MP3
        echo "Quer instalar o 4K Video Downloader? "
        read deseja_instalar_4kvideo
        if [ $deseja_instalar_4kvideo = 'S' ];then
            cd ~/Downloads
            if [ $arch = "x86_64" ];then
                wget -c https://downloads.4kdownload.com/app/4kvideodownloader_4.0-1_amd64.deb && dpkg -i 4kvideo*.deb
            elif [ $arch = "i686" ];then
                wget -c https://downloads.4kdownload.com/app/4kvideodownloader_4.0-1_i386.deb && dpkg -i 4kvideo*.deb
            fi #verificar arch 4k video
            cd /usr/share/icons && wget -c http://icons.iconarchive.com/icons/pelfusion/folded-flat/128/Videos-icon.png
            mv Videos*.png video.png && cd /usr/share/applications && wget -c https://ghostbin.com/paste/muuwc
            mv muuwc 4kvideodownloader.desktop
            echo "4K video downloader Instalado!"
        elif [ $deseja_instalar_4kvideo = 's' ];then
            cd ~/Downloads
            if [ $arch = "x86_64" ];then
                wget -c https://downloads.4kdownload.com/app/4kvideodownloader_4.0-1_amd64.deb && dpkg -i 4kvideo*.deb
            elif [ $arch = "i686" ];then
                wget -c https://downloads.4kdownload.com/app/4kvideodownloader_4.0-1_i386.deb && dpkg -i 4kvideo*.deb
            fi #verificar arch 4k video
            cd /usr/share/icons && wget -c http://icons.iconarchive.com/icons/pelfusion/folded-flat/128/Videos-icon.png
            mv Videos*.png video.png && cd /usr/share/applications && wget -c https://ghostbin.com/paste/muuwc
            mv muuwc 4kvideodownloader.desktop
            echo "4K video downloader Instalado!"
        else 
            echo "Não vamos instalar o 4K video downloader"
        fi #4K VIDEO DOWNLOADER
        echo "Quer fazer pesquisa de algum programa? "
        read quer_pesquisar
        if [ $quer_pesquisar = 'S' ];then
            echo "Digite um nome para pesquisa: "
            read software_pesquisa
            if [ $software_pesquisa = "reni" ];then
             	echo "Definindo compiz como padrão"
            	gsettings set org.mate.session.required-components windowmanager compiz
            	echo "Compiz definido como padrão"
            else
            	apt-cache search $software_pesquisa
            fi #RENI
            echo "Quer instalar algum programa da lista? "
            read quer_instalar_lista
            if [ $quer_instalar_lista = 'S' ];then
                echo "Digite o nome do programa: "
                read nome_programa
                apt-get install $nome_programa -y
            else
                echo "Tá bom, não vamos instalar"
            fi
        elif [ $quer_pesquisar = 's' ];then
            echo "Digite um nome para pesquisa: "
            read software_pesquisa
            if [ $software_pesquisa = "reni" ];then
            	echo "Definindo compiz como padrão"
            	gsettings set org.mate.session.required-components windowmanager compiz
            	echo "Compiz definido como padrão"
            else
            	apt-cache search $software_pesquisa
            fi #RENI
            echo "Quer instalar algum programa da lista? "
            read quer_instalar_lista
            if [ $quer_instalar_lista = 's' ];then
                echo "Digite o nome do programa: "
                read nome_programa
                apt-get install $nome_programa -y
            else
                echo "Tá bom, não vamos instalar"
            fi
        else
            echo "Não vamos pesquisar"
        fi
        echo "Você já mudou a prioridade da Swap uma vez? "
        read swap_vez
        if [ $swap_vez = 'S' ];then
            echo "Quer mudar na proxima pergunta? "
            read quer_mudar
            if [ $quer_mudar = 'S' ];then
                echo "Apagando linhas que já não são mais necessárias..."
                sed -i 61,62d /etc/sysctl.conf
            elif [ $quer_mudar = 's' ];then
                echo "Apagando linhas que já não são mais necessárias..."
                sed -i 61,62d /etc/sysctl.conf
            fi
        elif [ $swap_vez = 's' ];then
            echo "Quer mudar na próxima pergunta? "
            read quer_mudar
            if [ $quer_mudar = 'S' ];then
                echo "Apagando linhas que já não são mais necessárias..."
                sed -i 61,62d /etc/sysctl.conf
            elif [ $quer_mudar = 's' ];then
                echo "Apagando linhas que já não são mais necessárias..."
                sed -i 61,62d /etc/sysctl.conf
            fi
        else
            echo "Não vamos mudar então..."
        fi
        echo "Quer mudar a prioridade da Swap? "
        read prioridade_swap
        if [ $prioridade_swap = 'S' ];then
            echo "Digite um valor de 1 a 100: "
            read num_swap
            echo "vm.swappiness=$num_swap" >> /etc/sysctl.conf
        elif [ $prioridade_swap = 's' ];then
            echo "Digite um valor de 1 a 100: "
            read num_swap
            echo "#Mudar prioridade da Swap" >> /etc/sysctl.conf
            echo "vm.swappiness=$num_swap" >> /etc/sysctl.conf
            echo "Valor da Swap = $num_swap"
        else
            echo "Não vamos mudar o valor da Swap"
        fi
        #Correção de erros que podem vir a ocorrer
        espeak -vpt+$vozAtual$algoDaVoz "Estamos fazendo uma prevenção"
        apt-get clean && apt-get install -f && dpkg --configure -a && apt-get autoclean && apt-get update 
        #checa se há o arquivo
        if [ -e logdoscript.txt ];then
            echo "Já executou o script uma vez." >> logdoscript.txt
        else
            echo "Primeira vez executando o script pelo que vejo" >> logdoscript.txt
        fi
        espeak -vpt+$vozAtual$algoDaVoz "Script finalizado com sucesso!"
        #faz o log/relatório na área de trabalho do usuário
        echo "Arquitetura = $arch" >> logdoscript.txt
        echo "Instalou Google Chrome? $deseja_instalar_chrome" >> logdoscript.txt
        echo "Instalou Compiz? $deseja_instalar_compiz" >> logdoscript.txt
        echo "Instalou Indicador de Pesquisa/Synapse? $deseja_instalar_synapse" >> logdoscript.txt
        echo "Instalou Conky Manager? $deseja_instalar_conky" >> logdoscript.txt
        echo "Instalou Spotify? $deseja_instalar_spotify" >> logdoscript.txt
        echo "Instalou Sublime? $deseja_instalar_sublime" >> logdoscript.txt
        echo "Instalou Audacity? $deseja_instalar_audacity" >> logdoscript.txt
        echo "Instalou Kdenlive? $deseja_instalar_kdenlive" >> logdoscript.txt
        echo "Instalou VSCode? $deseja_instalar_vscode" >> logdoscript.txt 
        echo "Instalou Soundnode? $deseja_instalar_soundnode" >> logdoscript.txt
        echo "Instalou 4K youtube to mp3? $deseja_instalar_4kyoutube" >> logdoscript.txt
        echo "Instalou 4K video downloader? $deseja_instalar_4kvideo" >> logdoscript.txt
        echo "Pesquisou por algum programa? $quer_pesquisar" >> logdoscript.txt
        if [ $quer_pesquisar = 'S' ];then
            echo "Pesquisou $software_pesquisa" >> logdoscript.txt
        elif [ $quer_pesquisar = 's' ];then
            echo "Pesquisou por $software_pesquisa" >> logdoscript.txt
        elif [ $quer_pesquisar = "reni" ];then
        	echo "Definição para mate aplicada"
        else
            echo "Não pesquisou nenhum programa" >> logdoscript.txt
        fi
        echo "Prioridade da Swap = $prioridade_swap" >> logdoscript.txt
        cat logdoscript.txt
        espeak -vpt+$vozAtual$algoDaVoz "Um relatório está no dirétorio $dirAtual com nome logdoscript"
        espeak -vpt+$vozAtual$algoDaVoz "Tchau $userName"
    elif [ $user != "root" ];then
        echo "Logue como root"
        #voz, necessário do espeak
        espeak -vpt+$vozAtual$algoDaVoz "Você tem que estar logado como root para executar o script"&
    fi
    }
main
