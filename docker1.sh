#!/bin/bash

# Mihai IDU - 2020
# --
# Description:
#   this is a script that will check if the docker1 interface is up and configure it if not
# --

# reading the inputs from the keyboard
read -p "Enter the subnet : " IFADDR
read -p "Enter the machine physical interface : " IFINTERFACE
read -p "Enter the name of the bridge docker interface you want to create : " IFDOCKERINTERFACE

if ip a show "$IFINTERFACE" up 
then
    echo "--------------------------------------------------------"
    echo "The $IFINTERFACE exists and is up"
    if echo "$IFADDR" | grep -qP "$REGEX"
    then 
        echo "--------------------------------------------------------"
        echo "The $IFADDR is OK"
        if sudo /sbin/ethtool "$IFDOCKERINTERFACE" | grep -q "Link detected: yes"; then
            echo "--------------------------------------------------------"
            echo "The $IFDOCKERINTERFACE interface exists"
            echo ""
            echo "Status of $IFDOCKERINTERFACE : Online"
            echo "--------------------------------------------------------"
        else
            echo "--------------------------------------------------------"
            echo "Not Online. Configuration it will proceed. Please wait.."
            echo ""
            sudo brctl addbr "$IFDOCKERINTERFACE"
            sudo brctl addif "$IFDOCKERINTERFACE" "$IFINTERFACE"
            sudo ip link add "$IFDOCKERINTERFACE" type bridge
            sudo ip link set "$IFDOCKERINTERFACE" up
            sudo iptables -t nat -A POSTROUTING -s "$IFADDR" ! -d "$IFADDR" -j MASQUERADE
            echo "Printing the docker network:"
            echo ""
            sudo docker network ls
            echo ""
            echo "--------------------------------------------------------"
        fi
        exit 0
    else
        echo "The $IFADDR is NOT OK"
        exit 1
    fi
else
    echo "The $IFINTERFACE does NOT EXISTS or is NOT UP"
    echo "--------------------------------------------------------"
fi

    
