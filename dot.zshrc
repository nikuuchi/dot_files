# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall



# If this is an xterm set the title to user@host:dir
autoload colors
colors
PROMPT="%{${fg[cyan]}%}zsh> %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ks='ls'
    alias lsd='ls'
    alias sl='ls'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some git aliases
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias glo='git log -p'
alias gm='git commit'
alias ga='git add .'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias le='less'

alias sd='pushd'
alias pd='popd'

alias rm='rm -i'
alias ema='TERM=xterm-256color emacs -nw'
alias em='TERM=xterm-256color emacsclient -nw'
alias e='em'

alias tmux='TERM=xterm-256color tmux'
alias tmu='TERM=xterm-256color tmux'
alias tm='TERM=xterm-256color tmux'
alias tmuxa='tmux attach'
alias tmua='tmux attach'
alias tma='tmux attach'
alias ifconfig='/sbin/ifconfig'
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=$PATH:/opt/eclipse:$HOME/.cabal/bin:$HOME/.bin:/opt/firefox

# nvm と指定されたバージョンの Node.js がインストール済みの場合だけ
# 設定を有効にする
if [[ -f ~/.nvm/nvm.sh ]]; then
  source ~/.nvm/nvm.sh

  if which nvm >/dev/null 2>&1 ;then
    _nodejs_use_version="v0.4.0"
    if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
      nvm use "${_nodejs_use_version}" >/dev/null
    fi
    unset _nodejs_use_version
  fi
fi

export PERL_LOCAL_LIB_ROOT="/home/atsushi/perl5";
export PERL_MB_OPT="--install_base /home/atsushi/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/atsushi/perl5";
export PERL5LIB="/home/atsushi/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/atsushi/perl5/lib/perl5";
export PATH="/home/atsushi/perl5/bin:$PATH";
