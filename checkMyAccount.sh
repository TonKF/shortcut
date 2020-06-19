#!/bin/bash

#VARIABLES

##change these values
HOSTNAME="localhost"
USERNAME="root"

#FIXED VARIABLES
MY_RAW_ADDRESS=$(cat /home/$USERNAME/ton-keys/$HOSTNAME.addr)

#FUNCTION
function checkMyAccount () {
        ~/net.ton.dev/tonos-cli/target/release/tonos-cli account $MY_RAW_ADDRESS
}

checkMyAccount
