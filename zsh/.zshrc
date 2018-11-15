# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Setting PATH for Python 3.6
## The original version is saved in .bash_profile.pysave
##PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
##export PATH

export PYENV_ROOT=~/.pyenv

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
eval "$(pyenv init -)"

#RabbitMQ Config
export PATH=$PATH:/usr/local/sbin
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export PATH=$PATH:/Applications/GPAC.app/Contents/MacOS
export PATH=$PATH:~/bin:/Users/linchuan/workdir/bin
export PATH=$PATH:/Applications/MacVim.app/Contents/bin

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

alias start_mysql_tunnel="ssh -NCPf hunch@40.73.39.124 -L 3388:127.0.0.1:3306"
alias mysql_local_test="mysql -u root -p -h localhost -D test_db"
alias mysql_dev="mysql -u dev-user -h 139.219.1.196 -phunch_dev_db -D aivideo"
alias mysql_local_dev="mysql -u root -pasdf1234 -h localhost"
alias mysql_online="mysql -u aivideo -pbdNJX5XXsT -D aivideo -h rm-bp1l867aq21qq1l7h2o.mysql.rds.aliyuncs.com"
#alias mysql_db_server="mysql -u hunch -pasdf1234 -h 40.73.39.124"
alias mysql_db_server="mysql -u hunch -pasdf1234 -h 127.0.0.1 -P 3388"
alias ssh_build="ssh-agent; ssh-add ~/.ssh/id_rsa; ssh -i ~/.ssh/id_rsa -A root@40.125.172.62"
alias ssh_transit="ssh-agent; ssh-add ~/.ssh/id_rsa; ssh -i ~/.ssh/id_rsa -A root@121.196.213.142"
alias ssh_extractor="ssh-agent; ssh-add ~/.ssh/id_rsa; ssh -i ~/.ssh/id_rsa -A root@extractor.zenvideo.cn"
alias ssh_pre_worker1="ssh-agent; ssh-add ~/.ssh/id_rsa; ssh -i ~/.ssh/id_rsa -A hunch@139.219.104.30"
alias ssh_pre_worker2="ssh-agent; ssh-add ~/.ssh/id_rsa; ssh -i ~/.ssh/id_rsa -A hunch@42.159.81.183"
alias ssh_pre_worker3="ssh-agent; ssh-add ~/.ssh/id_rsa; ssh -i ~/.ssh/id_rsa -A hunch@42.159.80.48"
alias ssh_pre_worker4="ssh-agent; ssh-add ~/.ssh/id_rsa; ssh -i ~/.ssh/id_rsa -A hunch@42.159.85.184"
alias ssh_test_worker1="ssh lvqier@40.125.174.2"
alias ssh_test_worker2="ssh lvqier@139.219.107.13"
alias ssh_pro_render1="ssh hunch@139.219.108.22"
alias ssh_pro_render2="ssh hunch@139.219.98.236"
alias ssh_pro_render3="ssh hunch@139.219.100.105"
alias ssh_pro_render4="ssh hunch@139.219.101.166"
alias ssh_pro_render5="ssh hunch@139.219.97.246"
alias ssh_pro_render6="ssh hunch@40.125.212.20"
alias ssh_pro_render7="ssh hunch@40.125.171.77"
alias ssh_pro_render8="ssh hunch@40.125.207.30"
alias ssh_pro_render9="ssh hunch@40.125.162.117"
alias ssh_pro_render10="ssh hunch@40.125.164.133"
alias ssh_pro_render11="ssh hunch@139.219.110.91"
alias ssh_pro_render12="ssh hunch@139.219.69.174"
alias ssh_pro_render13="ssh hunch@139.219.101.33"
alias ssh_pro_render14="ssh hunch@40.125.175.34"
alias ssh_pro_render15="ssh hunch@40.125.162.96"
alias ssh_pro_render16="ssh hunch@139.219.68.174"
alias ssh_pro_render17="ssh hunch@139.219.65.202"
alias ssh_pro_render18="ssh hunch@40.125.168.247"
alias ssh_pro_render19="ssh hunch@40.125.212.9"
alias ssh_dev="ssh hunch@139.219.10.159"
alias ssh_svg_render1='ssh hunch@139.219.65.1'
alias ssh_svg_render2='ssh hunch@139.219.106.210'
alias ssh_daily='ssh hunch@139.219.10.159'
alias ssh_daily2='ssh hunch@139.219.11.75'
alias ssh_flow1='ssh -l hunch 40.73.112.177'
alias ssh_flow2='ssh -l hunch 40.73.103.150'
alias ssh_flow3='ssh -l hunch 40.73.113.111'
alias ssh_flow4='ssh -l hunch 40.73.36.22'
alias ssh_data='ssh hunch@40.73.37.81'
alias ssh_celery_beat='ssh hunch@40.73.36.43'
alias ssh_sql_server='ssh hunch@40.73.39.124'
alias ssh_azure_test1='ssh hunch@40.73.33.137'
alias ssh_hongkong='ssh -i ~/.ssh/hunch_hongkong.pem root@47.244.117.109'

alias viwork="find . -name \*.py -print | xargs ~/workdir/code/software_src_code/ptags.py; vim"
alias viweb="find . -name \*.py -print | xargs ~/workdir/code/software_src_code/ptags.py; vim"
alias set_online_db="export MYSQL_LOCATION=rm-bp1l867aq21qq1l7h2o.mysql.rds.aliyuncs.com"
alias unset_online_db="unset MYSQL_LOCATION"
# alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"
#########################################################################
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerline"
# ZSH_THEME="ys"
# ZSH_THEME="agnoster"
# ZSH_THEME="random"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git,
  vi-mode,
  python
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

export PATH=$PATH:$(go env GOPATH)/bin

defaults write TeXShop BringPdfFrontOnAutomaticUpdate NO
