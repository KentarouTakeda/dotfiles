autoload -U compinit
compinit

setopt COMPLETE_IN_WORD
setopt NOBGNICE
setopt NO_BEEP
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

## history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

## automatically decide when to page a list of completions
#LISTMAX=0

MAILCHECK=0

export PATH=/usr/local/pgsql/bin:$HOME/sbin:$HOME/local/bin:$HOME/bin:$HOME/local/npm/bin:$HOME/.config/composer/vendor/bin:$PATH:/usr/local/bin
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

if [ "$TERM" = "kterm" ] || [ "$TERM" = "xterm" ]|| [ "$TERM" = "screen" ] || [ "$TERM" = "xterm-256color" ]; then 
precmd() { 
TITLE=`print -P $USER@%m` 
echo -n "\ek{$TITLE}\e\\" 
} 
fi 

autoload colors
colors
PROMPT="%{${fg[yellow]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[yellow]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[yellow]}%}[%~]%{${reset_color}%}"

export LANG=ja_JP.UTF-8
export LANGVAR=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export PAGER=more
export EDITOR=vim
export PGCLIENTENCODING=utf8
export XDG_CONFIG_HOME=$HOME/.config
export COMPOSER_MEMORY_LIMIT=-1

alias less=$PAGER
alias zless=$PAGER
alias grep='grep --color=auto'
alias ..='cd ..'
alias ~='cd ~'
alias la='ls --color=auto -alF'
alias ll='ls --color=auto -lF'
alias ls='ls --color=auto -F'

umask 0002

[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
[ -f ~/.zshrc.aws  ] && source ~/.zshrc.aws

if [[ ${OSTYPE} =~ linux ]] && test -z ${WSL_DISTRO_NAME} ; then
	if [ -z $TMUX ]; then
		if $(tmux has-session 2>/dev/null); then
			exec tmux attach
		else
			exec tmux
		fi
	fi
fi

bindkey -e

function do_enter() {
	if [ -n "$BUFFER" ]; then
		zle accept-line
		return 0
	fi
	echo
	ls -F
	zle reset-prompt
	return 0
}
zle -N do_enter
bindkey '^m' do_enter

function chpwd() {
	ls
}

mkdir -p   $HOME/tmp     2> /dev/null
chmod 3777 $HOME/tmp     2> /dev/null
mkdir -p   $HOME/tmp/vim 2> /dev/null
chmod 0700 $HOME/tmp/vim 2> /dev/null
touch      $HOME/tmp/vim

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
