#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    #          COMMAND                 LABEL              ICON
    {item => ['xdg-open .',       'File Manager', 'system-file-manager']},
    {item => ['alacritty',            'Terminal',     'utilities-terminal']},
    {item => ['xdg-open http://', 'Web Browser',  'web-browser']},
    {item => ['albert show',            'Run command',  'system-run']},

    {beg => ['Applications','applications']},
    
		{sep => 'All apps'},
    	#          NAME            LABEL                ICON
    	{cat => ['utility',     'Accessories', 'applications-utilities']},
    	{cat => ['development', 'Development', 'applications-development']},
    	{cat => ['education',   'Education',   'applications-science']},
    	{cat => ['game',        'Games',       'applications-games']},
    	{cat => ['graphics',    'Graphics',    'applications-graphics']},
    	{cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    	{cat => ['network',     'Network',     'applications-internet']},
    	{cat => ['office',      'Office',      'applications-office']},
    	{cat => ['other',       'Other',       'applications-other']},
    	{cat => ['settings',    'Settings',    'applications-accessories']},
    	{cat => ['system',      'System',      'applications-system']},
    	{cat => ['desktopsettings','Desktop Settings', 'preferences-desktop-icons']},

    {end => undef},

    {beg => ['CLI Utilities', 'cli_utilities']},
		{item => ['alacritty -e bash -c \'pacman -Qi aurvote && bash\'', 'aurvote - vote for favourite AUR packages']},
		{item => ['alacritty -e bash -c \'tldr bat && bash\'', 'bat - cat clone with syntax highlighting']},
		{item => ['alacritty -e bash -c \'cava -h && bash\'', 'cava - console-based audio visualizer for alsa']},
		{item => ['alacritty -e bash -c \'clyrics --help && bash\'', 'clyrics - lyrics fetcher with daemon support for cmus and mocp']},
		{item => ['alacritty -e bash -c \'pacman -Qi cpupower && bash\'', 'cpupower - kernel tool for power management']},
		{item => ['alacritty -e bash -c \'tldr dmidecode && bash\'', 'dmidecode - display the dmi (smbios) table contents in a human-readable format']},
		{item => ['alacritty -e bash -c \'pacman -Qi dotgit && bash\'', 'dotgit - dotfiles utility']},
		{item => ['alacritty -e bash -c \'tldr fd && bash\'', 'fd - an alternate to find']},
		{item => ['alacritty -e bash -c \'pacman -Qi dr14_tmeter && bash\'', 'dr14_tmeter - compute the dynamic range of audio files']},
		{item => ['alacritty -e bash -c \'tldr glances && bash\'', 'glances - system monitoring tool']},
		{item => ['alacritty -e bash -c \'tldr gt5 && bash\'', 'gt5 - diff-capable du browser']},
		{item => ['alacritty -e bash -c \'tldr htop && bash\'', 'htop - system monitoring tool']},
		{item => ['alacritty -e bash -c \'tldr iperf3 && bash\'', 'iperf3 - traffic generator for testing network bandwidth']},
		{item => ['alacritty -e bash -c \'tldr lolcat && bash\'', 'lolcat - rainbow output']},
		{item => ['alacritty -e bash -c \'tldr fzf && bash\'', 'fzf - command-line fuzzy finder']},
		{item => ['alacritty -e bash -c \'tldr ranger && bash\'', 'ranger - console file manager']},
		{item => ['alacritty -e bash -c \'tldr sl && bash\'', 'sl - steam locomotive running through your terminal']},
		{item => ['alacritty -e bash -c \'tldr strace && bash\'', 'strace - trace system calls']},
		{item => ['alacritty -e bash -c \'spt --help && bash\'', 'spt - terminal user interface for Spotify']},
		{item => ['alacritty -e bash -c \'tldr tldr && bash\'', 'tldr - simple help page for CLI tools']},
		{item => ['alacritty -e bash -c \'tldr z && bash\'', 'z - tracks your most used directories']},
	{end => undef},
    
    {sep => undef},
    
    {pipe => ['ob-places-pipemenu', 'Places']},
    {pipe => ['al-kb-pipemenu', 'Keybindings']},
    
     # NordVPN management
     {beg => ['VPN Client', 'airvpn']},
       {item => ['nordvpn-connect', 	'Connect to server',	'network-vpn-symbolic']},
       {item => ['nordvpn disconnect',	'Disconnect from server',	'network-vpn-disconnected-symbolic']},
       {sep => undef},
       {item => ['nordvpn-status',		'VPN status',			'nm-vpn-standalone-lock']},
       #{item => ['vpn-settings',		'VPN settings',			'nm-vpn-standalone-lock']},
       {item => ['nordvpn-account-info',		'VPN Account Info',			'nm-vpn-standalone-lock']},
     {end => undef},
     
     # Music menu
     {beg => ['Music']},
     #{pipe => ['ob-music-now-playing','Cicca']},
		{sep => 'Music services'},
		{item => ['mpd-status',	'MPD service']},
		{item => ['spotifyd-status',	'Spotifyd service']},
     {end => undef},


	#             LABEL          ICON
	#{beg => ['My category',  'cat-icon']},
	#          ... some items ...
	#{end => undef},
	
	#            COMMAND     LABEL        ICON
	#{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},
	
	## Generic advanced settings
	#{sep       => undef},
	#{obgenmenu => ['Openbox Settings', 'applications-engineering']},
	#{sep       => undef},
	
	## Custom advanced settings
	{sep => undef},
    
	{beg => ['Preferences', 'applications-engineering']},
	
		# Change background
		{item => ['nitrogen', 'Change background']},

		# manage compositing manager
		{pipe => ['ob-compositor', 'Compositor']},

		# Openbox category
		{beg => ['Openbox', 'openbox']},
			{sep => 'Config files'},	
			{item => ["$editor ~/.config/openbox/autostart", 'Edit autostart',   'text-x-generic']},
			{item => ["$editor ~/.config/openbox/rc.xml",    'Edit rc.xml',          'text-x-generic']},
			{item => ["$editor ~/.config/openbox/menu.xml",  'Edit menu.xml',        'text-x-generic']},
			{sep => 'GUI tools'},
			{item => ['obconf', 'Configuration Manager']},
			{item => ['obtheme', 'Theme Editor']},
			# obmenu-generator category
			{beg => ['Obmenu-Generator', 'accessories-text-editor']},
				{item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
				{item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},
				{sep  => undef},
				{item => ['obmenu-generator -s -c', 'Generate a static menu', 'accessories-text-editor']},
				{item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons', 'accessories-text-editor']},
				{sep  => undef},
				{item => ['obmenu-generator -p', 'Generate a dynamic menu', 'accessories-text-editor']},
				{item => ['obmenu-generator -p -i', 'Generate a dynamic menu with icons', 'accessories-text-editor']},
				{sep  => undef},
				{item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
			{end => undef},
			{sep => undef},
			{item => ['openbox --reconfigure','Reconfigure Openbox', 'openbox']},
		{end => undef},
		
		# Tint2 category
		{beg => ['Tint2', 'tint2']},
			{item => ["$editor ~/.config/tint2/tint2rc", 'Edit tint2rc', 'text-x-generic']},
			{item => ['tint2conf', 'Settings GUI']},
		{end => undef},

		# Configuration files
		{beg => ['Miscellaneous conf']},
			{item => ["$editor ~/.config/alacritty/alacritty.yml", 'Alacritty', 'text-x-generic']},
			#{item => ["$editor ~/.conkyrc",              'conkyrc	',    'text-x-generic']},
			{item => ["$editor ~/.config/picom/picom.conf", 'Picom compositor', 'text-x-generic']},
			{item => ["$editor ~/.config/polybar/config", 'Polybar', 'text-x-generic']},
			{item => ["$editor ~/.vimrc", 'VimRC', 'text-x-generic']},
			{item => ["$editor ~/.Xresources", 'Xresources', 'text-x-generic']},
		{end => undef},
		
	{end => undef},

	{sep => undef},

    ## The lock command
    {item => ['betterlockscreen -l dimblur & betterlockscreen -u ~/pics/backgrounds/', 'Lock', 'system-lock-screen']},

    ## This option uses the default Openbox's "Exit" action
    #{exit => ['Exit', 'application-exit']},

    ## This uses the 'oblogout' menu
    # {item => ['oblogout', 'Exit', 'application-exit']},
    
    ## This uses a custom shutdown command
    ##{item => ['systemctl poweroff', 'Poweroff', 'system-shutdown']},   
    
    {beg => ['Exit', 'application-exit']},
		{exit => ['Log Out', 'application-exit']},
		{item => ['systemctl poweroff', 'Poweroff', 'system-shutdown']},
		{item => ['systemctl reboot', 'Reboot', 'system-reboot']},
		{item => ['systemctl suspend', 'Suspend', 'system-suspend']},
	{end => undef},
]
