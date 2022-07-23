#!/bin/bash

echo "Download wkhtmltox" 

wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos7.x86_64.rpm

echo "安装依赖: xorg-x11-fonts-75dpi"
yum install -y xorg-x11-fonts-75dpi

echo "安装依赖: xorg-x11-fonts-Type1"
yum install -y xorg-x11-fonts-Type1

echo "安装依赖: libXext"
yum install -y libXext

echo "安装依赖: libjpeg"
yum install -y libjpeg

echo "安装依赖: libXrender"
yum install -y libXrender

echo "Install wkhtmltox"
rpm -ivh wkhtmltox-0.12.6-1.centos7.x86_64.rpm

echo "Delete File wkhtmltox"
rm -f wkhtmltox-0.12.6-1.centos7.x86_64.rpm

echo "下载字体文件: simsun.ttc"

while true
do
    read -r -p "Chinese font download? [Y/n] " input
 
    case $input in
        [yY][eE][sS]|[yY])
            echo "Font file save directory: /usr/share/fonts/"
            cd /usr/share/fonts/
            wget https://github.com/zw-space/fonts/blob/main/Windows/simsun.ttc
            echo "Download complete: simsun.ttc"
            exit 1
            ;;
 
        [nN][oO]|[nN])
            echo "Download cancelled!"
            exit 1               
            ;;
 
        *)
            echo "Invalid input..."
            ;;
    esac
done