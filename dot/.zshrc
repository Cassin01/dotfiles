# 重複パスを登録しない
typeset -U path PATH

export TERM="xterm-256color" # add by cassin
# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

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
  docker
  docker-compose
  heroku
)

source "${ZSH}/oh-my-zsh.sh"

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
export PATH="$PATH:$HOME/.bin"
export PATH="/Library/TeX/texbin:$PATH"
export PATH="$PATH:/Users/k1low/.cabal/bin"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Macのgcc, g++をHomebrewを使って最新版にする
export PATH="$PATH:/usr/local/bin"

# nodebrewのパス
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# # ncurses
# export PATH="/usr/local/opt/ncurses/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/ncurses/lib"
# export CPPFLAGS="-I/usr/local/opt/ncurses/include"
# export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

# # libtoolize
# export LIBTOOL=`which glibtool`
# export LIBTOOLIZE=`which glibtoolize`
# ln -s `which glibtoolize` /usr/local/bin/libtoolize
# ln -s /usr/lib/libncurses.dylib /usr/local/lib/libncursesw.dylib

# completion of kubennects
source <(kubectl completion zsh)

alias memo='cd ~/tech-memo'
alias conf='cd ~/.config/nvim'
alias plug='cd ~/2021/Vim'
alias dotfile='cd ~/dotfiles'
alias lab='cd ~/2022/lab'
alias project='cd ~/all_year'
alias org='cd ~/org'

alias c='cargo'
alias nconf='~/.config/nvim/init'

alias ls='exa --icons'
alias ll='exa --icons -l'
alias la='exa --icons -a'

# alias nv='nvim'
alias nvf='nvim $(fzf --height 40% --reverse --border)'
alias nvim='/usr/local/Cellar/neovim/HEAD-e336251/bin/nvim'
alias nv='/usr/local/Cellar/neovim/HEAD-e336251/bin/nvim'


# nvr(neovim plugin)
nvcd() {
    REALPATH=(realpath $1)
    nvr -c cd "$REALPATH"
}

# Stack {{{
# Stack経由でインストールしたライブラリなどは、~/.local/bin/以下に保存されるので
# ~/.local/binにパスを通して置く必要がある。(StackはHaskellのやつ)
export PATH="~/.local/bin:$PATH"

# Stack completion
# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
# eval "$(stack --bash-completion-script stack)"
# }}}

alias python3='$HOME/.pyenv/shims/python3'
alias python='$HOME/.pyenv/shims/python3'
alias pip3='$HOME/.pyenv/shims/pip3'
alias pip='$HOME/.pyenv/shims/pip3'

alias typora='open -a typora'
alias preview='open -a preview'

# lapce {{{
alias lapce='open -a /Applications/Lapce.app/Contents/MacOS/lapce'
# }}}

# Homebrew's sbin {{{
export PATH="/usr/local/sbin:$PATH"
# }}}

# openjdk {{{
export JAVA_HOME=$(/usr/libexec/java_home -v 15)
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

# gitkraken
# https://gist.github.com/dersam/0ec781e8fe552521945671870344147b
function krak () {
	/Applications/GitKraken.app/Contents/MacOS/GitKraken -p $(pwd)
}

# tcl-tk (python tkinterが依存している)
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

# kitty tab theme
# precmd () {print -Pn "\e]0;%~\a"}
export PATH="/usr/bin:$PATH"
# chpwd() {
#   # /bin/ls; echo -ne "\033]0;$(/bin/pwd | rev | /usr/bin/awk -F \/ '{print "/"$1"/"$2}' | /usr/bin/rev )\007"
#   /usr/local/bin/exa --icons; echo -ne "\033]0;$(/bin/pwd | /usr/bin/rev | /usr/bin/awk -F \/ '{print "/"$1"/"$2}' | /usr/bin/rev )\007"
# }

alias luamake=$HOME/build_space/lua-language-server/3rd/luamake/luamake

# skimで開いたpdfでcommand+shift+クリックでneovim上のtexファイルの該当行に移動
alias nvimtex="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"

# cd to the path of the front Finder window
function cdfi() {
  target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
    if [ "$target" != "" ]; then
        cd "$target" || exit; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# icloud driveに移動
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

alias f='open -a Finder ./'

# クリップボードに保存するとともに確認する.
alias teee='tee >(pbcopy)'

# schemeスクリプトを実行
function runscheme() {
  # $1: schemeスクリプトのパス(.scm)
  scheme --quiet < "$1"
}

# GitHub CLI: {{{
eval "$(gh completion -s zsh)"

# Start to write a new repo
function gh_start() {
    /bin/echo -n "Input repo name: "
    read -r repo_name
    /bin/echo -n "Input repo desc: "
    read -r repo_desc
    gh repo create "${repo_name}" --private -d "${repo_desc}"
    sleep 2
    ghq get "Cassin01/${repo_name}"
    cd $(ghq list --full-path -e "Cassin01/${repo_name}") || exit
}

# Clone github repo
function gh_clone() {
  if local repo_name=$(gh repo list | awk '{print $1}' | fzf); then
    git clone "https://github.com/${repo_name}.git"
  else
    echo "error"
  fi
}

# Clone github repo
function ghq_clone() {
  local repo_name
  if repo_name=$(gh repo list | awk '{print $1}' | fzf); then
    ghq get "${repo_name}"
    cd $(ghq list --full-path -e "${repo_name}") || exit
  else
    echo "error"
  fi
}

# Create repo and push
function gh_cleate() {
    /bin/echo -n "Input repo name: "
    read -r repo_name
    gh repo create "${repo_name}" --private --push --source ./
}

# Press Ctrl- to display the list of repositories and go to the selected repository.
function ghq_src() {
    local repo
    repo=$(ghq list | fzf --query "$LBUFFER")
    if [ -n "${repo}" ]; then
      repo=$(ghq list --full-path -e "${repo}")
      BUFFER="cd ${repo}"
      # zle accpet-line
      zle end-of-line
    fi
    zle clear-screen
}
zle -N ghq_src
bindkey '^]' ghq_src

# Go to the ghq dir {{{
function ghq_cd() {
  if [ -n "$1" ]; then
    dir="$(ghq list --full-path --exact "$1")"
    if [ -z "${dir}" ]; then
      echo "no directories found for '$1'"
      return 1
    fi
    cd "${dir}" || exit
    return
  fi
  echo 'usage: ghq_cd <repo>'
  return 1
}
function _ghq_cd() {
  _values $(ghq list)

}
compdef _ghq_cd ghq_cd
# }}}
# }}}

# git utils {{{
# rcz
function gitz() {
  local output
  if output=$(rcz); then
    git commit -m "${output}"
  else
    echo "Err: failed to generate a commit message"
  fi
}

function gitu() {
  local res="update: "
  git status -s | awk '/ M / { print $2 }' | {
    while read line; do
      local file_name="$(basename "${line}")"
      res="${res}${file_name}, "
      git add "${line}"
    done
  }
  git commit -m "${res}"
  local branch=$(git branch --show-current)
  git push origin "${branch}"
}
# }}}

# fzf color
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#d0d0d0,bg:#121212,hl:#5f87af --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/dotfiles/seacret/rc.sh ] && source ~/dotfiles/seacret/rc.sh
[ -f ~/dotfiles/rc/init.sh ] && source ~/dotfiles/rc/init.sh
[ -f ~/dotfiles/rc/z.sh ] && . ~/dotfiles/rc/z.sh


# cd無しでもディレクトリ移動
setopt auto_cd

# cd -で以前移動したディレクトリを表示
setopt auto_pushd

# コマンドのスペルをミスして実行した場合に候補を表示
setopt correct

# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups

export LUA_PATH='/usr/local/Cellar/luarocks/3.8.0/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;$HOME/.luarocks/share/lua/5.4/?.lua;$HOME/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/local/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;./?.so;$HOME/.luarocks/lib/lua/5.4/?.so'

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

eval "$(starship init zsh)"

