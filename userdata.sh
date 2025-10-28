#!/bin/bash
set -e

# Update and install dependencies
sudo apt update -y
sudo apt install -y software-properties-common gnupg curl unzip

# -------------------------------
# Install AWS CLI v2
# -------------------------------
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
aws --version
rm -rf aws awscliv2.zip

# -------------------------------
# Install Terraform
# -------------------------------
echo "Installing Terraform..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update -y
sudo apt install -y terraform
terraform -version

# -------------------------------
# Install Ansible
# -------------------------------
echo "Installing Ansible..."
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
ansible --version

# -------------------------------
# Cleanup
# -------------------------------
sudo apt autoremove -y
echo "Installation completed successfully!"
