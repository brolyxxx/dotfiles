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
    {item => ['urxvt',            'Terminal',     'utilities-terminal']},
    {item => ['xdg-open http://', 'Web Browser',  'web-browser']},
    {item => ['albert',            'Run command',  'system-run']},

    {sep => 'Categories'},

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
    
    {cat => ['desktopsettings','Desktop Settings', 'preferences-desktop-icons']},
    
    {beg => ['Advanced Settings', 'applications-engineering']},

      # Configuration files
      #{item => ["$editor ~/.conkyrc",              'conkyrc	',    'text-x-generic']},
      {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 RC', 'text-x-generic']},
      {item => ["$editor ~/.config/polybar/config", 'Polybar Config', 'text-x-generic']},

      # Openbox category
      {beg => ['Openbox', 'openbox']},
        {item => ["$editor ~/.config/openbox/autostart", 'Openbox Autostart',   'text-x-generic']},
        {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
        {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-x-generic']},
        {item => ['openbox --reconfigure',               'Reconfigure Openbox', 'openbox']},
      {end => undef},
      
      # obmenu-generator category
      {beg => ['Obmenu-Generator', 'accessories-text-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},
        {sep  => undef},
        {item => ['obmenu-generator -s -c',    'Generate a static menu',             'accessories-text-editor']},
        {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons',  'accessories-text-editor']},
        {sep  => undef},
        {item => ['obmenu-generator -p',       'Generate a dynamic menu',            'accessories-text-editor']},
        {item => ['obmenu-generator -p -i',    'Generate a dynamic menu with icons', 'accessories-text-editor']},
        {sep  => undef},
        {item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
      {end => undef},
      
       # NordVPN management
      #{beg => ['NordVPN', 'airvpn']},
      #  {item => ['vpn-status',		'VPN status',			'nm-vpn-standalone-lock']},
      #  {item => ['vpn-connect', 	'Connect to server',	'network-vpn-symbolic']},
      #  {item => ['nordvpn disconnect',	'Disconnect from server',	'network-vpn-disconnected-symbolic']},
      #  {item => ['vpn-settings',		'VPN settings',			'nm-vpn-standalone-lock']},
      #{end => undef},
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
