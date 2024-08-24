#!/bin/bash

# Define the servers and their credentials
declare -A servers
servers=(
  ["server1"]="**.**.**.144"
  ["server2"]="**.**.**.234"
  ["server3"]="**.**.**.137"
  ["server4"]="**.**.**.184"
  ["server5"]="**.**.**.253"
  ["server6"]="**.**.**.102"
)

username="cloud-user"
password="**.**.**"

# Function to copy SSH key to a server
copy_ssh_key() {
  local server_ip=$1
  expect << EOF
  spawn ssh-copy-id $username@$server_ip
  expect {
    "yes/no" { send "yes\r"; exp_continue }
    "password:" { send "$password\r" }
  }
  expect eof
EOF
}

# Iterate over the servers and copy the SSH key
for server in "${!servers[@]}"; do
  echo "Copying SSH key to ${server} (${servers[$server]})"
  copy_ssh_key "${servers[$server]}"
done