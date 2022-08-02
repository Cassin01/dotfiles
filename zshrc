# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color" # add by cassin
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/cassin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#: Cassin Original start {{{

#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH_THEME="powerlevel9k/powerlevel9k"
#: Customise the Powerlevel9k prompts {{{
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#: }}}

# Load Nerd Fonts with Powerlevel9k theme for Zsh
# POWERLEVEL9K_MODE='nerdfont-complete'
# source ~/powerlevel9k/powerlevel9k.zsh-theme

#: Cassin Original end }}}

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true" # default
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=ja_JP.UTF-8        # by Cassin

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

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

# written by cassin
export PATH=/Library/TeX/texbin:$PATH
export PATH=$PATH:/Users/k1low/.cabal/bin

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Macのgcc, g++をHomebrewを使って最新版にする
export PATH=$PATH:/usr/local/bin

# nodebrewのパス
export PATH=$HOME/.nodebrew/current/bin:$PATH

# completion of kubennects
source <(kubectl completion zsh)

alias memo='cd ~/tech-memo'
alias conf='cd ~/.config/nvim'
alias plug='cd ~/2021/Vim'
alias dotfile='cd ~/dotfiles'
alias lab='cd ~/2022/lab'

alias c='cargo'
alias nconf='~/.config/nvim/init'
# alias ls='exa'
# alias ll='exa -l'

alias nv='nvim'
alias nvf='nvim $(fzf --height 40% --reverse --border)'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvr(neovim plugin)
nvcd() {
    REALPATH=(realpath $1)
    nvr -c cd $REALPATH
}

# Stack {{{
# Stack経由でインストールしたライブラリなどは、~/.local/bin/以下に保存されるので
# ~/.local/binにパスを通して置く必要がある。(StackはHaskellのやつ)
export PATH=~/.local/bin:$PATH

# Stack completion
# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
# eval "$(stack --bash-completion-script stack)"
# }}}

# typora {{{
alias typora='open -a typora'
# }}}

# Homebrew's sbin {{{
export PATH="/usr/local/sbin:$PATH"
# }}}

# openjdk {{{
export JAVA_HOME=`/usr/libexec/java_home -v 15`
# }}}

# pyenv
eval "$(pyenv init -)"

# pymgress
export GUILE_LOAD_PATH="/usr/local/syhare/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# idris
# export PATH=~/.cabal/bin:$PATH

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUSTC_WRAPPER=$(which sccache)

# cのヘッダファイルのパス
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

# skim: open -a skim hoge.pdf
alias skim='/Applications/Skim.app/Contents/MacOS/Skim'

export GITHUB_TOKEN="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"

# tcl-tk (python tkinterが依存している)
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

# kitty tab theme
# precmd () {print -Pn "\e]0;%~\a"}
export PATH=/usr/bin:$PATH
chpwd() {
  # /bin/ls; echo -ne "\033]0;$(/bin/pwd | rev | /usr/bin/awk -F \/ '{print "/"$1"/"$2}' | /usr/bin/rev )\007"
  /bin/ls; echo -ne "\033]0;$(/bin/pwd | /usr/bin/rev | /usr/bin/awk -F \/ '{print "/"$1"/"$2}' | /usr/bin/rev )\007"
}

alias luamake=/Users/cassin/build_space/lua-language-server/3rd/luamake/luamake

# cd to the path of the front Finder window
cdfi() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# find + fzf
function cdf() {
  local dir=$(find . -maxdepth 3 -type d | fzf)
  if [ "$(echo $dir)" ]; then
    echo $dir
    cd $dir
  fi
}

function cdfa() {
  local path=$(find . -maxdepth 3 | fzf)
  local dir="$(/usr/bin/dirname "${path}")"
  if [ -d "$dir" ]; then
    cd $dir
  fi
}

alias f='open -a Finder ./'

# cd無しでもディレクトリ移動
setopt auto_cd

# cd -で以前移動したディレクトリを表示
setopt auto_pushd

# コマンドのスペルをミスして実行した場合に候補を表示
setopt correct

# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

export LUA_PATH='/usr/local/Cellar/luarocks/3.8.0/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/Users/cassin/.luarocks/share/lua/5.4/?.lua;/Users/cassin/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/local/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;./?.so;/Users/cassin/.luarocks/lib/lua/5.4/?.so'

# export PATH='/Users/cassin/.luarocks/bin:/Users/cassin/.cargo/bin:/Users/cassin/.cabal/bin:/usr/local/sbin:/Users/cassin/.local/bin:/Users/cassin/.nodebrew/current/bin:/Library/TeX/texbin:/usr/local/opt/tcl-tk/bin:/Users/cassin/.pyenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Apple/usr/bin:/Applications/Wireshark.app/Contents/MacOS:/Applications/kitty.app/Contents/MacOS:/Users/cassin/Library/Application Support/Coursier/bin:/Users/k1low/.cabal/bin:/usr/local/opt/fzf/bin'

[ -f "/Users/cassin/.ghcup/env" ] && source "/Users/cassin/.ghcup/env" # ghcup-env
