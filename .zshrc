# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/venky/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="ys"
ZSH_THEME="random"



# Set list of themes to load
#Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell"  "gnzh" "ys" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(common-aliases  archlinux  dotenv   python  redis-cli history chucknorris 
	 last-working-dir pass pip redis-cli sublime sudo) 

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



### Aliases from bash

alias woman=eg

alias myip="hostname -I"
alias publicip="wget http://ipinfo.io/ip -qO - "
alias ipcity="wget http://ipinfo.io/city -qO - "
alias utube22="youtube-dl --write-srt --sub-lang en --sub-format srt -f 22 -o $HOME/Videos/youtube/%\(title\)s.%\(ext\)s "
alias utube18="youtube-dl --write-srt --sub-lang en --sub-format srt -f 18 -o $HOME/Videos/youtube/%\(title\)s.%\(ext\)s "
alias utubelist="youtube-dl -F "
alias utubepl22="youtube-dl --write-srt --sub-lang en --sub-format srt -f 22 --yes-playlist -o $HOME/Videos/youtube/%\(title\)s.%\(ext\)s "
alias utubepl18="youtube-dl --write-srt --sub-lang en --sub-format srt -f 18 --yes-playlist -o $HOME/Videos/youtube/%\(title\)s.%\(ext\)s "
alias utubemp3="youtube-dl -x --audio-format 'mp3' --audio-quality 0 -o $HOME/Music/youtube-dl/%\(title\)s.%\(ext\)s"
alias utubeplmp3="youtube-dl -x --audio-format 'mp3' --audio-quality 0 --yes-playlist -o $HOME/Music/youtube-dl/%\(title\)s.%\(ext\)s"
alias emptytrash="rm -rf ~/.local/share/Trash/*"
alias powersaveon="sudo pm-powersave true"
alias powersaveoff="sudo pm-powersave false"
alias x="chmod +x "
alias get="sudo pacman  -S  "
alias remove="sudo pacman -Rs   "
alias python3ls="python3 -m http.server"
alias python2ls="python -m SimpleHTTPServer "
alias pip3update="pip3 freeze --local | cut -d = -f 1  | xargs -n1 sudo -H  pip3 install -U"
alias pip2update="pip3 freeze --local | cut -d = -f 1  | xargs -n1 sudo -H  pip3 install -U"
alias pip3install="sudo -H pip3 install -U "
alias pipinstall="sudo -H pip install  -U"
alias turnoff="sudo shutdown -P now"
alias spaces="rename 's/ /_/g' "
alias rmcaps="rename 'y/A-Z/a-z/' "

PATH=$PATH:$HOME/bin:$HOME/bin/adb-fastboot

export VISUAL="nano"
alias start_redis="redis-server --loadmodule $HOME/Documents/GEEK_SK00L/Softwarez/redis_modules/redis_graph/src/redisgraph.so"

cowfortune
#screenfetch


## Neo4j path
alias start_neo4j="$HOME/Documents/GEEK_SK00L/Backend/DB/Graph_DB/warez/neo4j/neo4j-community-3.3.5/bin/neo4j console &"
