#!/bin/bash

#script criado por caio santos!

menu1="0)Inicializar a instalação"
menu2="1)Recusar Instalação"
menu3="2)Informações do script"

echo -e '\e[36m'$menu1'\e[0m';
echo -e '\e[36m'$menu2'\e[0m';
echo -e '\e[36m'$menu3'\e[0m';

ini="Inicializando instalação....."
recu="Script Cancelado com sucesso!"

info1="Script Criado por kaio santos"
info2="Script versão: 0.1"
info3="Github do kaio: https://github.com/KaioSant"

echo -p '\e[36m'Escolha uma Opção: '\e[0m'; OPCAO

case "$OPCAO" in
      0)
      echo ""
echo "> vamos instalar o apache..."
sudo apt update
sudo apt install apache2
sudo ufw app list
sudo ufw app info "Apache Full"
sudo ufw allow "Apache Full"
echo "> Servidor Apache2 instalado com sucesso! entre com seu subdominio para confirmar."
echo "instalando o curl & e verificando com icanhazip"
sudo apt install curl
curl http://icanhazip.com
echo "> instalado com sucesso. Agora vamos instalar o MySQL!"
sudo apt install mysql-server
sudo mysql_secure_installation
sudo exit
echo "> Vamos instalar o seu PHP, por favor aguarde."
sudo apt install php libapache2-mod-php php-mysql


echo "> A parte web foi instalada com sucesso, vamos instalar seu painel agora."

cd /var/www/html/
wget http://www.multicraft.org/download/linux64 -O multicraft.tar.gz
tar xvzf multicraft.tar.gz
cd multicraft
./setup.sh
      ;;
      
      1)
      echo -e '\e[36m'$recu'\e[0m';
      exit;
      ;;
      2)
      echo -e '\e[36m'$info1'\e[0m';
      echo -e '\e[36m'$info2'\e[0m';
      echo -e '\e[36m'$info3'\e[0m';
      ;;
      *)
      echo -e '\e[36m'Opção $OPCAO desconhecida!'\e[0m';
      exit 1
      ;;
esac
