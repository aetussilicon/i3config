#!/bin/bash

# Script de instalação de dependências para i3wm no Ubuntu 24.04
# Baseado na configuração do EndeavourOS i3wm

# Verificar se o usuário é root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script deve ser executado como root ou com sudo."
    exit 1
fi

# Atualizar repositórios
echo "Atualizando repositórios..."
apt update

# Instalar pacotes essenciais do i3wm
echo "Instalando pacotes principais do i3wm..."
apt install -y i3 i3blocks rofi dunst feh nitrogen picom xautolock xss-lock \
               polkit-gnome numlockx arandr xfce4-terminal thunar firefox \
               maim scrot playerctl pavucontrol qt5ct galculator xsane \
               bluetooth blueberry xfce4-clipman network-manager-gnome \
               lxappearance fonts-noto fonts-font-awesome

# Instalar dependências adicionais
echo "Instalando dependências adicionais..."
apt install -y libnotify-bin pulseaudio-utils alsa-utils setxkbmap \
               wmctrl xdotool xinput lm-sensors acpi

# Instalar autotiling (opcional)
echo "Instalando autotiling (opcional)..."
apt install -y python3-pip
pip3 install autotiling

# Configurar atalhos de teclado
echo "Configurando layouts de teclado..."
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Shift>Alt_L']"

# Mensagem final
echo ""
echo "Instalação concluída!"
echo "Recomendações:"
echo "1. Configure seu arquivo ~/.config/i3/config conforme necessário"
echo "2. Para temas e ícones, use lxappearance"
echo "3. Para configurar monitores, use arandr e salve em ~/.screenlayout/"
echo "4. Configure o picom (compositor) em ~/.config/picom.conf"
echo "5. Configure o dunst (notificações) em ~/.config/dunst/dunstrc"
