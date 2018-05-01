#!/bin/bash

# Initialize
OUTPUT="$( { vault init -key-shares=1 -key-threshold=1 | head -n2; } 2> /dev/null )"

VAULT_KEY=$(echo "$OUTPUT" | grep 'Key' | awk -F': ' '{print $2}')

export VAULT_TOKEN=$(echo "$OUTPUT" | grep 'Root Token' | awk -F': ' '{print $2}' )

# Unseal
vault unseal $VAULT_KEY