#! /bin/bash

#Lê o nome o nome do arquivo de instalação do Seismic Unix
echo "Digite o nome do arquivo baixado:"
read name

#Instalação dos pacotes necessários
apt-get install build-essential 
apt-get install gfortran
apt-get install libx11-dev
apt-get install libxt-dev

#Instalação de pacotes opcionais
apt-get install freeglu3-dev
apt-get install libxmu-dev
apt-get install libxi-dev
apt-get install libc6
apt-get install libmotif4
apt-get install x11proto-print-dev
apt-get install libmotif-dev

#Indica para o sistema o local onde o Seismic Unix será instalado:
echo "export CWPROOT=$HOME" >> $HOME/.bashrc
echo "export PATH=$PATH:$CWPROOT/bin">> $HOME/.bashrc

export CWPROOT=$HOME
export PATH=$PATH:$CWPROOT/bin

#Desempacota o arquivo
tar -xzf $name

cd src
rm Makefile.config
cd configs
mv Makefile.config_Linux_x86_64 ../Makefile.config

cd ..

#Instalação da parte essencial
make install
make xtinstall
make finstall

#Instalação da parte opcional
make mglinstall
make utils
make xminstall

#make sfinstall #precisa usar uma versão mais antiga do gcc. Esperando o CWP arrumar :P


#Uma possível solução pode estar neste link: https://mailman.mines.edu/pipermail/seisunix/2016-December/000058.html


exit 0




















exit
