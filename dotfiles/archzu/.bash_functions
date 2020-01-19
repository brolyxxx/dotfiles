## BASH FUNCTIONS

# cd into a directory and ls -l
cdl() {
	cd "$@" && ls -lh;
}

# List Compressed Stuff
extractlist () {
if [ -f "$1" ]; then
    case "$1" in
             *.tar.bz2)   tar tjf "$1"        ;;
             *.tar.gz)    tar tzf "$1"     ;;
             #*.bz2)      bunzip2 "$1"       ;;
             *.rar)       unrar l "$1"     ;;
             *.gz)        gunzip -l "$1"     ;;
             *.tar)       tar tf "$1"        ;;
             *.tbz2)      tar tjf "$1"      ;;
             *.tgz)       tar tzf "$1"       ;;
             *.zip)       unzip -l "$1"     ;;
             *.Z)         uncompress -l "$1"  ;;
             *.7z)        7z l "$1"    ;;
             *)           echo "'$1' content cannot be listed" ;;
         esac
else
         echo "'$1' is not a valid file"
fi
}

# Extract Stuff
extract () {
if [ -f "$1" ]; then
    case "$1" in
             *.tar.bz2)   tar xjf "$1"        ;;
             *.tar.gz)    tar xzf "$1"     ;;
             *.bz2)       bunzip2 "$1"       ;;
             *.rar)       unrar e "$1"     ;;
             *.gz)        gunzip "$1"     ;;
             *.tar)       tar xf "$1"        ;;
             *.tbz2)      tar xjf "$1"      ;;
             *.tgz)       tar xzf "$1"       ;;
             *.zip)       unzip "$1"     ;;
             *.Z)         uncompress "$1"  ;;
             *.7z)        7z x "$1"    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
else
         echo "'$1' is not a valid file"
fi
}

# Terminal colors
colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
