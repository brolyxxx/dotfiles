# Define environment valriables here
# This file should be sourced by ~/.bashrc and ~/.bash_profile

# XDG Base directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Miscellaneous
export EDITOR=vim

# LESS variables for color output (https://wiki.archlinux.org/index.php/Color_output_in_console)
export LESS='-R '

# Other useful variables
#export LS_COLORS='ow=30;43'
#export GREP_COLORS="ms=01;32:mc=01;32:sl=:cx=:fn=35:ln=32:bn=32:se=36"

# Kunst avariables (MPD album art visualizer)
# The size of the album art to be displayed
export KUNST_SIZE="1000x1000"
# The position where the album art should be displayed
#export KUNST_POSITION="+0+0"
# Where your music is located
export KUNST_MUSIC_DIR="$HOME/music"

# Bemenu options
export BEMENU_OPTS="--list 10 \
    --fn 'Iosevka Regular 10' \
    --nb $background"d2" \
    --nf $color5 \
    --tb $color1"d2" \
    --tf $color2 \
    --fb $background"d2" \
    --ff $color2 \
    --hb $color5"d2" \
    --hf $color2" 
