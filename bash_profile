source ~/.bashrc

#rbenv used for mobile development
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#pyenv used for saltfab
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
