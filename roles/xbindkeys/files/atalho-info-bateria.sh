#!/bin/bash

# Obtendo a hora atual
HORA=$(date +"%H:%M")

# Obtendo a data atual
DATA=$(date +"%d/%m/%Y")

# Verificando se o sistema é um notebook
if [[ $(cat /sys/class/power_supply/*/type) == *"Battery"* ]]; then
  # Obtendo o status da bateria
  BATERIA=$(acpi | awk '{print $3, $4}' | tr -d ',')
else
  BATERIA="N/A"
fi

# Enviando a notificação
notify-send "Informações do Sistema" "Hora: $HORA\nData: $DATA\nBateria: $BATERIA"
