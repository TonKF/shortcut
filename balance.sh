#!/bin/bash

#VARIABLES

##change these values
HOSTNAME="localhost"
USERNAME="root"

#FIXED VARIABLES
MY_RAW_ADDRESS=$(cat /home/$USERNAME/ton-keys/$HOSTNAME.addr)
checkMyAccount=$(cd ~/net.ton.dev/tonos-cli/target/release/ && ./tonos-cli account $MY_RAW_ADDRESS)
checkMyBalance=$(echo "$checkMyAccount" | grep balance | awk '{print $2}')
convertedTokens=$(expr "$checkMyBalance" / 1000000000)

function balance () {
        printf "Wallet Balance: "
        echo $convertedTokens
}

balance
