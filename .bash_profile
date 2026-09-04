
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Kepler
export KEPLER_SDK_PATH=/Users/paul.molluzzo/kepler/sdk/0.20.3351
export PATH=$KEPLER_SDK_PATH/bin:$PATH
export PATH=$KEPLER_SDK_PATH/bin/tools:$PATH

################################
############# NVM ##############
################################
# Lazy-load NVM to save 3+ seconds on startup
# NVM will be loaded automatically when you use node, npm, nvm, etc.

export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.local/bin:$PATH"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Lazy-loading function
_nvm_lazy_load() {
  unset -f node npm npx nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  # Auto-switch to Node 20 after loading
  nvm use 20.19.2 >/dev/null 2>&1
}

# Create placeholder functions that trigger lazy loading
# node() { _nvm_lazy_load; node "$@"; }
# npm() { _nvm_lazy_load; npm "$@"; }
# npx() { _nvm_lazy_load; npx "$@"; }
# nvm() { _nvm_lazy_load; nvm "$@"; }

# But make node/npm available immediately in PATH if already installed
if [ -d "$NVM_DIR/versions/node/v20.19.2" ]; then
  export PATH="$NVM_DIR/versions/node/v20.19.2/bin:$PATH"
fi

################################
########## pat-manager #########
################################
# Added by pat-manager
# source /Users/paul.molluzzo/pat-manager/shell/pat-manager.bash

# Map pat-manager tokens to MCP server env vars
export JIRA_PAT="${JIRA_TOKEN}"
export CONFLUENCE_PAT="${CONFLUENCE_TOKEN}"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# aix shell completions
[ -f /Users/paul.molluzzo/.aix/completions/aix.bash ] && source /Users/paul.molluzzo/.aix/completions/aix.bash

# Added by aix setup
export PATH="$HOME/.aix/bin:$PATH"

# Claude Access CLI completion
[[ -f ~/.claude-access/completions/claude-access.bash ]] && source ~/.claude-access/completions/claude-access.bash
