# Source NVM
source /opt/homebrew/opt/nvm/nvm.sh

# Path exports
export DOTNET_ROOT="/opt/homebrew/opt/dotnet@6/libexec"
export BUN_INSTALL="$HOME/.bun"

# Consolidating PATH updates
export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$HOME/.dotnet/tools:$PATH"
