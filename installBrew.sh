#!/bin/bash

####################
# Global Variables #
####################

repos=(
    oven-sh/bun
)

formulae=(
    bun
    gh
    git
    nvm
    pnpm
)

casks=(
    aldente
    arc
    discord
    notion
    raycast
    slack
    spotify
    stremio
    tableplus
    the-unarchiver
    visual-studio-code
    warp
    1password
    1password-cli
)

prevRepos=$(brew tap)
prevFormulae=$(brew list --formulae)
prevCasks=$(brew list --cask)

toInstallTaps=()
for tap in "${repos[@]}"; do
    if [[ ! $prevRepos =~ $tap ]]; then
        toInstallTaps+=("$tap")
    fi
done

toInstallFormulae=()
for formula in "${formulae[@]}"; do
    if [[ ! $prevFormulae =~ $formula ]]; then
        toInstallFormulae+=("$formula")
    fi
done

toInstallCasks=()
for cask in "${casks[@]}"; do
    if [[ ! $prevCasks =~ $cask ]]; then
        toInstallCasks+=("$cask")
    fi
done

alreadyInstalled=()

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
    echo -e "${GR}Installing Xcode${NC}"
    xcode-select --install
else 
    echo "Xcode CLI is installed"
fi

####################
# Install Homebrew #
####################

if ! command -v brew &> /dev/null
then
    echo -e "${GR}Installing Homebrew${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else 
    echo "Homebrew installed, updating"
    brew update -q
fi

######################
# Tap external repos #
######################

if ((${#toInstallTaps[@]} > 0)); then
    echo -e "${GR}Tapping external repos${NC}"
    brew tap "${toInstallTaps[@]}"
fi

####################
# Install formulae #
####################

if ((${#toInstallFormulae[@]} > 0)); then
    echo -e "${GR}Installing formulae${NC}"
    brew install --formula "${toInstallFormulae[@]}"
fi

#################
# Install casks #
#################

if ((${#toInstallCasks[@]} > 0)); then
    echo -e "${GR}Installing casks${NC}"
    brew install --cask "${toInstallCasks[@]}"
fi

###########################
# Print already installed #
###########################

if ((${#alreadyInstalled[@]} > 0)); then
    printf "${GR}Already installed: ${NC}%s\n" "${alreadyInstalled[@]}"
fi