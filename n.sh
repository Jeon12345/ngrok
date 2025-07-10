#!/bin/bash

# Set your Ngrok authtoken here
NGROK_TOKEN="2Y1IOhGOtQjVSv8DafQ42D0Mhn0_6yhuzCqh1Myo24noVn2d8"

echo "[+] Installing ngrok..."

# Download and extract ngrok locally
if [ ! -f ./ngrok ]; then
    wget -q https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
    tar -xzf ngrok-v3-stable-linux-amd64.tgz
    chmod +x ngrok
    echo "[✓] ngrok downloaded and extracted."
else
    echo "[✓] ngrok already present in current directory."
fi

echo "[+] Setting authtoken..."
./ngrok config add-authtoken "$NGROK_TOKEN"

echo "[+] Starting ngrok tunnel on port 22..."
./ngrok tcp 22
