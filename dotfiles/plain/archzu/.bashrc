#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source my ASCII salutation
if [ -r .ascii ]; then
	cat .ascii
	echo 
fi

# PKGFILE includes a "command not found" hook that will automatically search the official repositories, when entering an unrecognized command.
if [ -f /usr/share/doc/pkgfile/command-not-found.bash ]; then
	source /usr/share/doc/pkgfile/command-not-found.bash
fi

# Cow Salutation
if [ -x /usr/bin/fortune ]; then
	if [ -x /usr/bon/cowsay ]; then
		fortune -a 25% starwars 75% all | cowsay -W 60 -f $(find /usr/share/cows -type f | shuf -n 1)
	else fortune -a 25% starwars 75% all
	fi
fi

#fortune -a 25% starwars 75% all | cowsay -W 60 -f $(find /usr/share/cows -type f | shuf -n 1)

# Bash prompt
PS1='[\u@\h \W]\$ '

# Powerline prompt
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
	powerline-daemon -q
	POWERLINE_BASH_CONTINUATION=1
	POWERLINE_BASH_SELECT=1
	. /usr/share/powerline/bindings/bash/powerline.sh
fi


## HISTORY variables
HISTSIZE=1000 # default is 500
HISTFILESIZE=1000 # default is 500
HISTCONTROL=ignoredups
HISTIGNORE=ls

## SHOPTS
# If set, the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histappend

# If set, Bash checks the window size after each command and, if necessary, updates the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, a command name that is the name of a directory is executed as if it were the argument to the cd command. This option is only used by interactive shells.
shopt -s autocd


# Start ssh-agent and create environmet variable
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# source my aliases
[ -r ~/.aliases ] && . ~/.aliases

# Import some standard variables
[ -r ~/.profile ] && . ~/.profile

# Apply pywal color scheme
[ -r ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)

## FUNCTIONS
[ -r ~/.bash_functions ] && . ~/.bash_functions

# Set Byobu prompt
[ -r /home/broly/.config/byobu/prompt ] && . /home/broly/.config/byobu/prompt    

# Enable tmuxp completion
[ -x /usr/bin/tmuxp ] && eval "$(_TMUXP_COMPLETE=source tmuxp)"

# Enable z, tracks your most used directories
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Enable fuck, corrects CLI typos
[[ -x /usr/bin/thefuck ]] && eval "$(thefuck --alias)"
