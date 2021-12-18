#!/bin/bash

menu="\e[36m'
0)Inicializar a instalação
1)Recusar Instalação
2)Informações do script'\e[0m"

echo "$menu"

ini="\e[36m'Inicializando instalação.....'\e[0m"
recu="Script Cancelado com sucesso!"

info="\e[36m'
==============================================
Script Criado por kaio santos
Script versão: 0.1
Github do kaio: https://github.com/KaioSant
=============================================='\e[0m"

read -p "Escolha uma Opção: " OPCAO

case "$OPCAO" in
      0)
      echo ""
output "> vamos instalar o apache..."
sudo apt update
sudo apt install apache2
sudo ufw app list
sudo ufw app info "Apache Full"
sudo ufw allow "Apache Full"
output "> Servidor Apache2 instalado com sucesso! entre com seu subdominio para confirmar."
output "instalando o curl & o icanhazip"
sudo apt install curl
curl http://icanhazip.com
output "> instalado com sucesso. Agora vamos instalar o MySQL!"
sudo apt install mysql-server
sudo mysql_secure_installation
sudo exit
output "> Vamos instalar o seu PHP, por favor aguarde."
sudo apt install php libapache2-mod-php php-mysql


output "> A parte web foi instalada com sucesso, vamos instalar seu painel agora."

cd /var/www/html/
wget http://www.multicraft.org/download/linux64 -O multicraft.tar.gz
tar xvzf multicraft.tar.gz
cd multicraft
./setup.sh
      ;;
      
      1)
      output "$recu"
      exit;
      ;;
      2)
      output "$info"
      ;;
      *)
      output "Opção $OPCAO desconhecida!"
      exit 1
      ;;
esac
