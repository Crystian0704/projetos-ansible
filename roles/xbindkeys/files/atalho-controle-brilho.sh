#!/bin/bash

# Função para enviar notificação com notify-send e ícone de progresso
send_notification_with_progress() {
    local titulo="$1"
    local mensagem="$2"
    local progresso="$3"
    
    notify-send "$titulo" "$mensagem" -h int:value:"$progresso"
}

# Função para controlar o brilho
control_brightness() {
    local comando="$1"
    local titulo=""
    local mensagem=""
    local progresso="0"
    
    case "$comando" in
        XF86MonBrightnessUp)
            titulo="Aumentar Brilho"
            mensagem="O brilho foi aumentado."
            xrandr --output $(xrandr | grep " connected" | awk '{ print$1 }') --brightness 1.1
            progresso="100"
            ;;
        XF86MonBrightnessDown)
            titulo="Diminuir Brilho"
            mensagem="O brilho foi diminuído."
            xrandr --output $(xrandr | grep " connected" | awk '{ print$1 }') --brightness 0.9
            progresso="100"
            ;;
        *)
            echo "Comando não reconhecido"
            return 1
            ;;
    esac

    send_notification_with_progress "$titulo" "$mensagem" "$progresso"
}

# Verificar o argumento passado
control_brightness "$1"
