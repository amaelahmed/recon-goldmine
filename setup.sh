#!/bin/bash

echo -e "\n🔧 Starting Recon Goldmine Setup..."

# Update system & install required packages
echo -e "\n📦 Installing dependencies..."
sudo apt update
sudo apt install -y wget unzip curl gnupg apt-transport-https software-properties-common git

# Install PowerShell
if ! command -v pwsh &> /dev/null; then
    echo -e "\n⚙️ Installing PowerShell..."
    wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt update
    sudo apt install -y powershell
else
    echo "✅ PowerShell is already installed."
fi

# Clone Recon Goldmine repository
if [ ! -d "recon-goldmine" ]; then
    echo -e "\n📥 Cloning Recon Goldmine Toolkit from GitHub..."
    git clone https://github.com/amaelahmed/recon-goldmine.git
    cd recon-goldmine
else
    echo -e "\n📂 Found existing recon-goldmine folder. Using it..."
    cd recon-goldmine
fi

# Create necessary folders
mkdir -p results downloads extracted

# Set execute permission on scripts (if any Bash files are present)
chmod +x *.sh 2>/dev/null

# Final Instructions
echo -e "\n✅ Setup Complete!"
echo -e "🔍 To start recon, use the following command:\n"
echo -e "    pwsh ./recon.ps1 -domain target.com\n"
echo -e "📂 Your results will be saved inside the 'results' folder."
echo -e "💡 Even non-coders can use this tool with just one command.\n"
