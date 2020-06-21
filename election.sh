#!/bin/bash

#VARIABLES
PUBKEY=$(cat ~/ton-keys/elections/$localhost-request-dump2 | grep 'public key' | awk '{print $11}' | tr '[:upper:]' '[:lower:]')
PUBLICKEY=$(printf "0x%s" "$PUBKEY")
checkPreparedElection=$(cd ~/net.ton.dev/tonos-cli/target/release && ./tonos-cli runget -1:3333333333333333333333333333333333333333333333333333333333333333 participates_in $PUBLICKEY | grep Result | awk '{print $2}' | tr -d '[' | tr -d '"' | tr -d ']')
ACTIVE_ELECTION_ID=$(cat ~/ton-keys/elections/active-election-id)

function stakedTokens () {
        printf "%d\n" "$checkPreparedElection"
}

echo "Election participation confirmed!"
printf "Active Election ID: "
echo "$ACTIVE_ELECTION_ID"
printf "Staked Tokens: "
stakedTokens
