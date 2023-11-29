#!/bin/bash

###############
# Color Codes #
###############

GR='\033[1;32m'
BL='\033[0;36m'
NC='\033[0m'

#####################
# Install Xcode CLI #
#####################
if ! command -v xcode-select &> /dev/null
then
    echo -e "${BL}Xcode CLI is not installed. Installing Xcode CLI${NC}"
    xcode-select --install
else 
    echo -e "${GR}Xcode CLI is installed${NC}"
fi

####################
# Install Homebrew #
####################

if ! command -v brew &> /dev/null
then
    echo -e "${BL}Homebrew is not installed. Installing Homebrew${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontentcom/Homebrew/install/HEAD/installsh)"
else 
    echo -e "${GR}Updating Homebrew${NC}"
    brew update &> /dev/null
fi

######################
# Tap external repos #
######################

repos=(
    oven-sh/bun
)

for repo in "${repos[@]}"
do
    echo -e "${BL}Tapping $repo...${NC}"
    brew tap "$repo" &> /dev/null
done

echo -e "${GR}External repositories have been tapped.${NC}"

####################
# Install formulae #
####################

formulae=(
    aldente
    bun
    docker
    docker-compose
    gh
    git
    nvm
    python
    unzip
)

for formula in "${formulae[@]}"
do
    echo -e "${BL}Installing $formula...${NC}"
    brew install --formula "$formula" &> /dev/null
done

echo -e "${GR}Formulae have been installed${NC}"

#################
# Install casks #
#################

casks=(
    arc
    jetbrains-toolbox
    figma
    firefox-developer-edition
    raycast
    slack
    spotify
    visual-studio-code
    warp
    1password
)

for cask in "${casks[@]}"
do
    echo -e "${BL}Installing $cask${NC}"
    brew install --cask "$cask" &> /dev/null
done

echo -e "${GR}Casks have been installed${NC}"
