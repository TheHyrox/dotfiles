# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
bindkey "^[[A" up-history
bindkey "^[[B" down-history

alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias cl="clear"
alias ub="/var/folders/5s/t4g249s547gd9jh03rqcfp_w0000gn/T/multipass-gui.EJCZWt.command ; exit;"
alias zshsource="source ~/.zshrc"
alias runub="/var/folders/5s/t4g249s547gd9jh03rqcfp_w0000gn/T/multipass-gui.NqqbXd.command exit;"
alias gocode="cd ~/Documents/Code && nvim ./"
alias tocode="cd ~/Documents/Code"
alias tos4="cd ~/Documents/Cours/S4"
alias tosae="cd ~/Documents/Cours/S3/sae-3.01"
alias vsc="'/Applications/Visual Studio Code.app/Contents/Resources/app/bin'"
alias python3="/opt/homebrew/opt/python@3.9/bin/python3.9"
alias mirror="sudo cp /Users/hyrox/Documents/Code/iphone-mirroring-eu-activate/xezrunner/eligibility.plist /private/var/db/os_eligibility/ && python3 /Users/hyrox/Documents/Code/Iphonemirroring/hazemirror.py "
HOST="Macbook"
HOSTNAME="Macbook"

export PATH="/opt/homebrew/opt/libxml2/bin:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/opt/homebrew/opt/python@3.9/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.composer/vendor/bin"

