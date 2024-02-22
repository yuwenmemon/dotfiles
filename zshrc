## VM Aliases
alias vmlist="VBoxManage list vms"
alias vmup="VBoxManage startvm 'ExpensiVM' --type headless"
alias vmin="ssh dev"
alias vmhalt="VBoxManage controlvm 'ExpensiVM' savestate"
alias vmoff="VBoxManage controlvm 'ExpensiVM' poweroff"
alias vmmount="mount_nfs -o port=9111,mountport=9112 127.0.0.1:/expensify ~/expensify"
alias sshvm='ssh -A yuwen@dev -p 2222'

## bastion
alias sshtun='ssh -At -t bastion1.sjc ssh -A'
alias log="ssh -At -t bastion1.sjc ssh -A log1.uw1"

## rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

## Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="$(/usr/libexec/java_home -v 11.0)" #13 is for maven/IS, Andrid might need this to be 1.8
export AXIS2_HOME=/Users/yuwen/axis2-1.7.7

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

## Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

## Personal shortcuts
alias webexp="cd /Users/yuwen/Expensidev/Web-Expensify"
alias integrations="cd /Users/yuwen/Expensidev/Integration-Server"
alias ngrokk="ngrok http --region=us --hostname=expensify-yuwen.ngrok.io --host-header rewrite www.expensify.com.dev:80"
alias logs="vssh 'less /var/log/syslog'"
if [ -f ~/.bash_custom ]; then
  . ~/.bash_custom 
fi

# Prompt shit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{48}(%b) %F{240}%r%f'
zstyle ':vcs_info:*' enable git

# Taken from this tutorial: https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# The numbers are colors: https://jonasjacek.github.io/colors/
PROMPT='%B%F{231}$USER@%m%f%b %B%F{183}%~%f%b %B%F{48}$vcs_info_msg_0_%f%b %# '

# grep
alias grep="grep --exclude=\*.git\* -n --color=always"

# Git short cuts
function gg { git grep "$1" -- './*' ':!*_support*' ':!*site/external*' ':!*vendor*' ':!*externalLib*'; }
alias gitbranch="git for-each-ref --sort=-committerdate refs/heads/"
alias gitb="git for-each-ref --sort='-committerdate' --format='%(refname)%09%(committerdate)' refs/heads | sed -e 's-refs/heads/--'"

alias dbtestingtunnel='ssh -f -L 3306:db-testing.expensify.com:3306 172.16.3.253 -N'
alias islogs='tail -f /var/log/system.log'

# IS
function isbox {
	ssh -At bastion1.sjc ssh -A integrations$1.expensify.com
}

function isdownload {
	if [ -z '$2' ]
  		then
		    echo 'No File supplied'
		    exit 1
	fi
	re='^[0-9]$'
	if ! [[ $1 =~ $re ]]
		then
	   		echo 'No IS Server number given'
	   		exit 1
	fi
	ssh -At bastion1.sjc 'cd ~/; scp integrations$1.expensify.com:~/$2 .; exit;'
	scp bastion1.sjc:~/$2 .
}
export GPG_TTY=$(tty)

# nvm Stuff - see https://stackoverflow.com/c/expensify/questions/5438/5439#5439
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
nvm use 14.19.3

# Automatic node version switching - this must be placed after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Python setup for saltfab
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Sublime Text Command Line
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Cert-linking that resulted from WARP
export NODE_EXTRA_CA_CERTS="$HOME/Expensidev/Ops-Configs/saltfab/cacert.pem"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home;
