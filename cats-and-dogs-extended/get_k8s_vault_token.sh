login_result=$(curl -s --request POST --data '{"role": "demo", "jwt": "'"${K8S_TOKEN}"'"}' ${VAULT_ADDR}/v1/auth/${VAULT_K8S_BACKEND}login)

# Read cats-and-dogs secret from Vault
vault_token=$(echo $login_result | python3 -c "import sys, json; print(json.load(sys.stdin)['auth']['client_token'])")

echo $vault_token
