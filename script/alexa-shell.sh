#!/bin/bash

source /opt/script/.env

while true 
do
    mosquitto_sub -h $MQTT_HOST -u $MQTT_USER -P $MQTT_PASSWORD -p $MQTT_PORT -t "#" -F "%t %p" | while read -r payload
    do
        # Callback
        topic=$(echo "$payload" | cut -d ' ' -f 1)
        msg=$(echo "$payload" | cut -d ' ' -f 2-)
        
        #echo "MQTT: $topic: ${payload}"
        #p=$(echo "$msg")
        #echo "Extracted property: $p for $topic"
        
        #json msg.cmd
        cmd=$( echo $msg | jq '.cmd' )
        
        case $topic in
        
        "computador/turnOff")
            [ $cmd = '"on"' ] && poweroff &
        ;;

        "computador/restart")
            [ $cmd = '"on"' ] && reboot &
        ;;
        
        "computador/hibernate")
            [ $cmd = '"on"' ] && systemctl suspend &
        ;;
        
        esac
    done
    sleep 10 
done
