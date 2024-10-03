#!/bin/bash

# Update the package list
echo "Updating package list..."
apt update
sleep 1  # Wait for 1 second

# Upgrade the installed packages
echo "Upgrading installed packages..."
apt upgrade -y
sleep 1  # Wait for 1 second

# Install sudo and curl
echo "Installing sudo and curl..."
apt install -y sudo curl
sleep 1  # Wait for 1 second

# Enable IPv4 forwarding
echo "Enabling IPv4 forwarding..."
sudo sysctl -w net.ipv4.ip_forward=1
sleep 1  # Wait for 1 second

# Enable IPv6 forwarding
echo "Enabling IPv6 forwarding..."
sudo sysctl -w net.ipv6.conf.all.forwarding=1
sleep 1  # Wait for 1 second

# Install Tailscale
echo "Installing Tailscale..."
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list >/dev/null
sudo apt-get update
sudo apt-get install tailscale -y
sleep 1  # Wait for 1 second

# Start Tailscale
echo "Starting Tailscale..."
sudo tailscale up
sleep 1  # Wait for 1 second

# Display the Tailscale IP (IPv4)
echo "Tailscale IP (IPv4):"
tailscale ip -4
sleep 1  # Wait for 1 second

# Start Tailscale daemon with persistent state
echo "Starting Tailscale daemon..."
sudo tailscaled --state=/var/lib/tailscale/tailscaled.state &
sleep 1  # Wait for 1 second

# Install Netbird dependencies
echo "Installing Netbird dependencies..."
sudo apt-get install ca-certificates curl gnupg -y
sleep 1  # Wait for 1 second

# Add Netbird keyring and repository
echo "Adding Netbird repository..."
curl -sSL https://pkgs.netbird.io/debian/public.key | sudo gpg --dearmor --output /usr/share/keyrings/netbird-archive-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/netbird-archive-keyring.gpg] https://pkgs.netbird.io/debian stable main' | sudo tee /etc/apt/sources.list.d/netbird.list >/dev/null
sudo apt-get update
sleep 1  # Wait for 1 second

# Install Netbird
echo "Installing Netbird..."
sudo apt-get install netbird -y
sleep 1  # Wait for 1 second

# Start Netbird service
echo "Starting Netbird service..."
sudo netbird service start

# Installation and setup complete
echo "Tailscale and Netbird have been successfully installed and configured."

