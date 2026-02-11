
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Lines configured by zsh-newuser-install
# History Bullshit
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yazeed/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Running some shells on startup

source /usr/share/oh-my-zsh/oh-my-zsh.sh
source /usr/share/oh-my-zsh/themes/robbyrussell.zsh-theme

# colored man documents

export GROFF_NO_SGR=1
export LESS="-R"


# Changing locale for man and other bullshit

export LC_ALL=en_US.UTF-8

# Zsh Plugings

export ZSH_PLUGINS_PATH=/usr/share/zsh/plugins
source $ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(colored-man-pages)

# Aliases

alias l='lsd -A --sort size'
alias la='lsd -lA --sort size'
alias logo='qdbus org.kde.Shutdown /Shutdown org.kde.Shutdown.logout'
alias vim='nvim'
alias v='nvim'

# Function to clear the window and the scrollback with 

function clear_terminal_and_scrollback(){
	zle clear-screen
	printf '\e[3J'	
	zle .reset-prompt
	zle -R

}
zle -N clear_terminal_and_scrollback
bindkey '^L' clear_terminal_and_scrollback
 
