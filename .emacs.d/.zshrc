source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme



# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/.gem/ruby/2.5.0/bin


# Path to your oh-my-zsh installation.
export ZSH=/home/venky/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="ys"
# ZSH_THEME="random"

ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
#Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell"  "gnzh" )

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
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
plugins=(common-aliases  archlinux  dotenv   python  redis-cli history chucknorris git
	 last-working-dir pass pip sudo) 

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs'
else
  export EDITOR='nano'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

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

#PS1='\[\033[01;32m\]1337@venky\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# LANG="en_US.UTF-8"
# export LANG

# alias cat=$HOME/bin/ccat
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
alias python2ls="python2 -m SimpleHTTPServer "
alias pip3update="pip3 freeze --local | cut -d = -f 1  | xargs -n1 sudo -H  pip3 install -U"
alias pip2update="pip2 freeze --local | cut -d = -f 1  | xargs -n1 sudo -H  pip3 install -U"
alias pip3install="sudo -H pip3 install -U "
alias pipinstall="sudo -H pip2 install  -U"
alias turnoff="sudo shutdown -P now"
alias spaces="rename 's/ /_/g' "
alias rmcaps="rename 'y/A-Z/a-z/' "


# CLASSPATH=/usr/share/R/share/java


#export GOHOME=$HOME/go1.9.2.linux-amd64
#export PATH=$PATH:$GOHOME/bin
#export SLIMERJSLAUNCHER=/usr/bin/firefox


export VISUAL="nano"
alias start_redis="redis-server --loadmodule $HOME/Documents/GEEK_SK00L/Softwarez/redis_modules/redis_graph/src/redisgraph.so"

cowfortune
#screenfetch


## Neo4j path
alias start_neo4j="$HOME/Documents/GEEK_SK00L/Backend/DB/Graph_DB/warez/neo4j/neo4j-community-3.3.5/bin/neo4j console &"





# Powerlevel9k
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( user  ssh dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)

POWERLEVEL9K_TIME_FOREGROUND='green'
POWERLEVEL9K_TIME_BACKGROUND='black'
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M}"
POWERLEVEL9K_DIR_HOME_FOREGROUND='violet'
POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='orange'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='black'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='magenta'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126 '


POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_STATUS_CROSS=true

