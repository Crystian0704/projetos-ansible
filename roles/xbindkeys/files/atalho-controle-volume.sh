#!/bin/bash

# Função para enviar notificação com notify-send e ícone de progresso
send_notification_with_progress() {
    local titulo="$1"
    local mensagem="$2"
    local progresso="$3"
    
    notify-send "$titulo" "$mensagem" -h int:value:"$progresso"
}

# Função para controlar o volume
control_volume() {
    local comando="$1"
    local titulo=""
    local mensagem=""
    
    case "$comando" in
        XF86AudioRaiseVolume)
            titulo="Aumentar Volume"
            mensagem="O volume foi aumentado."
            pactl set-sink-volume @DEFAULT_SINK@ +1000
            ;;
        XF86AudioLowerVolume)
            titulo="Diminuir Volume"
            mensagem="O volume foi diminuído."
            pactl set-sink-volume @DEFAULT_SINK@ -1000
            ;;
        XF86AudioMute)
            titulo="Mudo"
            mensagem="O volume foi silenciado."
            pactl set-sink-mute @DEFAULT_SINK@ toggle
            ;;
        XF86AudioMicMute)
            titulo="Microfone Mudo"
            mensagem="O microfone foi silenciado."
            pactl set-source-mute @DEFAULT_SOURCE@ toggle
            ;;
        *)
            echo "Comando não reconhecido"
            return 1
            ;;
    esac

    send_notification_with_progress "$titulo" "$mensagem" "100"
}

# Verificar o argumento passado
control_volume "$1"
