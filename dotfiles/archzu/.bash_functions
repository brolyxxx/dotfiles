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


# Run command/application and choose paths/files with fzf.                      
# Always return control of the terminal to user (e.g. when opening GUIs).       
# The full command that was used will appear in your history just like any      
# other (N.B. to achieve this I write the shell's active history to             
# ~/.bash_history)                                                                
#                                                                               
# Usage:                                                                        
# f cd (hit enter, choose path)                                                 
# f cat (hit enter, choose files)                                               
# f vim (hit enter, choose files)                                               
# f vlc (hit enter, choose files)                                               
                                                                                
f() {                                                                           
    # Store the arguments from fzf                                              
    IFS=$'\n' arguments=($(fzf --query="$2" --multi))                           
                                                                                
    # If no arguments passed (e.g. if Esc pressed), return to terminal          
    if [ -z "${arguments}" ]; then                                              
        return 1                                                                
    fi                                                                          
                                                                                
    # We want the command to show up in our bash history, so write the shell's  
    # active history to ~/.bash_history. Then we'll also add the command from   
    # fzf, then we'll load it all back into the shell's active history          
    history -w                                                                  
                                                                                
    # RUN THE COMMANDS ######################################################## 
    # The cd command has no effect when run as background, and doesn't show up  
    # as a job the can be brought to the foreground. So we make sure not to add 
    # a '&' (more programs can be added separated by a '|')                       
    if ! [[ $1 =~ ^(cd)$ ]]; then                                               
        $1 "${arguments[@]}" &                                                  
    else                                                                        
        $1 "${arguments[@]}"                                                    
    fi                                                                          

    # If the program is not on the list of GUIs (e.g. vim, cat, etc.) bring it  
    # to foreground so we can see the output. Also put cd on this list          
    # otherwise there will be errors)                                           
    if ! [[ $1 =~ ^(cd|zathura|vlc|eog|kolourpaint)$ ]]; then                   
        fg %%                                                                   
    fi                                                                          
                                                                                
    # ADD A REPEATABLE COMMAND TO THE BASH HISTORY ############################ 
    # Store the arguments in a temporary file for sanitising before being       
    # entered into bash history                                                 
    : > /tmp/fzf_tmp                                                            
    for file in ${arguments[@]}; do                                             
        echo $file >> /tmp/fzf_tmp                                              
    done                                                                        
                                                                                
    # Put all input arguments on one line and sanitise the command such that    
    # spaces and parentheses are properly escaped. More sanitisation            
    # substitutions can be added if needed                                      
    sed -i 's/\n//g; s/ /\\ /g; s/(/\\(/; s/)/\\)/' /tmp/fzf_tmp                
                                                                                
    # If the program is on the GUI list add a '&' to the command history        
    if [[ $1 =~ ^(zathura|vlc|eog|kolourpaint|mpv|smplayer)$ ]]; then                        
        sed -i '${s/$/ \&/}' /tmp/fzf_tmp                                       
    fi                                                                          
                                                                                
    # Grab the sanitised arguments                                              
    arguments=$(cat /tmp/fzf_tmp)                                               
                                                                                
    # Add the command with the sanitised arguments to our .bash_history         
    echo ${1} ${arguments} >> ~/.bash_history                                   
                                                                                
    # Reload the ~/.bash_history into the shell's active history                
    history -r                                                                  
                                                                                
    # Clean up temporary variables                                              
    rm /tmp/fzf_tmp                                                             
}                                                                               
