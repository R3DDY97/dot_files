#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi




#########################################################################################################



# Termite new_tab opening config

source /etc/profile.d/vte.sh


alias woman=eg


PS1='\[\033[01;32m\]1337@venky\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# LANG="en_US.UTF-8"
# export LANG

# alias cat=$HOME/bin/ccat
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
# alias finstall="sudo apt -f install -y "
alias remove="sudo pacman -Rs   "
# alias getdeb="sudo dpkg -i  "
alias python3ls="python3 -m http.server"
alias python2ls="python -m SimpleHTTPServer "
alias pip3update="pip3 freeze --local | cut -d = -f 1  | xargs -n1 sudo -H  pip3 install -U"
alias pip2update="pip3 freeze --local | cut -d = -f 1  | xargs -n1 sudo -H  pip3 install -U"
alias pip3install="sudo -H pip3 install -U "
alias pipinstall="sudo -H pip install  -U"
alias turnoff="sudo shutdown -P now"
alias spaces="rename 's/ /_/g' "
alias rmcaps="rename 'y/A-Z/a-z/' "
PATH=$PATH$HOME/bin:$HOME/bin/adb-fastboot
#
# CLASSPATH=/usr/share/R/share/java
#
#
# #export GOHOME=$HOME/go1.9.2.linux-amd64
# #export PATH=$PATH:$GOHOME/bin
# export SLIMERJSLAUNCHER=/usr/bin/firefox

export VISUAL="nano"

alias start_redis="redis-server --loadmodule $HOME/Documents/GEEK_SK00L/Softwarez/redis_modules/redis_graph/src/redisgraph.so"

cowfortune
#screenfetch
