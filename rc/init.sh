#!/bin/bash


# 数学
# ────────────────────────────────────────────────────────────

# Greatest common divisor
function gcd_() {
    if [ $# -ne 2 ]; then
      echo "Usage: gcd <number1> <number2>" 1>&2
      exit 1
    fi
    local a=$1
    local b=$2
    while [ "$b" -ne 0 ]; do
        local t=$b
        b=$((a % b))
        a=$t
    done
    echo "$a"
}

function ratio_() {
    if [ $# -ne 2 ]; then
      echo "Usage: gcd <number1> <number2>" 1>&2
      exit 1
    fi
    local a=$1
    local b=$2
    local gcd
    gcd=$(gcd_ "$a" "$b")
    echo "$((a / gcd)):$((b / gcd))"
}

# コマンド検索
# ────────────────────────────────────────────────────────────

# hisf
function hisf() {
  history | tac | fzf | cut -d " " -f3- | pbcopy
}

# ディレクトリ移動
# ────────────────────────────────────────────────────────────

# pushd
alias pd='pushd'
function showd() {
    local path
    path=$(dirs -p | /usr/local/bin/fzf)
    if [ -d "${path}" ]; then
        pushd "${path}" || exit
    fi
}

# with fzf
function cdf() {
  local path dir
  path=$(/usr/bin/find . -maxdepth 3 | /usr/local/bin/fzf)
  dir="$(/usr/bin/dirname "${path}")"
  if [ -d "${path}" ]; then
    cd "${path}" || exit
  elif [ -d "${dir}" ]; then
    cd "${dir}" || exit
  fi
}

# path marker
function cdm() {
  local marker_list output
  if marker_list=$(path-marker -- show); then
    if output=$(echo "${marker_list}" | /usr/local/bin/fzf); then
      cd "${output}" || exit
    fi
  fi
}
alias mp='path-marker -- mark'
alias ms='path-marker -- show'

# mkdir with cd
function mkcd() {
  if [ $# -ne 1 ]; then
    echo "Usage: mkcd <dirname>" 1>&2
    exit 1
  fi
  local dir="$1"
  mkdir -p "${dir}" && cd "${dir}" || exit
}


# ファイル作成
# ────────────────────────────────────────────────────────────

# date
alias da='date +%Y-%m-%d'
function nvd() {
  local _date
  _date=$(date +%Y-%m-%d)
  if [ -z "${_date}"  ] ; then
    return 1
  fi
  echo "Directory or file? [d/f] "
  read -r dn
  case $dn in
    [Dd]* ) mkdir "./${_date}"; return 0;;
    [Ff]* ) echo "Enter file extension:"; read -r f_extension; nvim "${_date}.${f_extension}"; return 0;;
    * ) echo "Please answer d or f.";;
  esac
}

# markdown to pdf
function md2pdf() {
  if [ $# -ne 1 ]; then
    echo "Usage: md2pdf <filename>" 1>&2
    exit 1
  fi
  local file="$1"
  pandoc "${file}".md -o "${file}".pdf -V documentclass=ltjarticle --pdf-engine=lualatex
}


# ファイル暗号化
# ────────────────────────────────────────────────────────────

# encrypt
function encrypt() {
  if [ $# -ne 1 ]; then
    echo "Usage: encrypt <file name of plaintext>" 1>&2
    exit 1
  fi
  local plaintext="$1"
  # local ciphertext="$2"
  echo "Enter password:"
  # -e : 暗号化
  # -aes-256-cbc : AES256をCBCモードで暗号化
  # -salt : saltを使用
  read -r password
  openssl enc -e -aes-256-cbc -salt -k "${password}" -in "${plaintext}" -out "${plaintext}.enc"
}

# decrypt
function decrypt() {
  if [ $# -ne 1 ]; then
    echo "Usage: decrypt <file name of ciphertext>" 1>&2
    exit 1
  fi
  local ciphertext="$1"
  # local plaintext="$2"
  echo "Enter password:"
  # -d : 復号化
  # -aes-256-cbc : AES256をCBCモードで暗号化
  # -salt : saltを使用
  read -r password
  openssl enc -d -aes-256-cbc -salt -k "${password}" -in "${ciphertext}" -out "${ciphertext}.dec"
}


# check if current directory is not behind from remote repository
# ────────────────────────────────────────────────────────────

function _behind() {
  local current_branch
  local remote_branch
  local count
  git fetch
  current_branch="$(git branch --show-current)"
  # remote_branch="$(git --no-pager branch -r | tail -n 1 | sed 's/^  //')"
  remote_branch="origin/main"
  count="$(git rev-list --count ^"${current_branch}" "${remote_branch}")"
  if [ "${count}" -gt 0 ]; then
    echo "behind ${count} commits from ${remote_branch}" 1>&2
  fi
}

function _c() {
  if [ $# -ne 1 ]; then
    echo "Usage: _c <directory name>" 1>&2
  else
    typeset -A assoc_array
    assoc_array=([all_year]="${HOME}/all_year" \
      [dotfile]="${HOME}/dotfile" \
      [org]="${HOME}/org" \
      [conf]="${HOME}/.config/nvim" \
      [memo]="${HOME}/tech-memo" \
      [dot]="${HOME}/dotfiles/dot" \
      [wez]="${HOME}/dotfiles/dot/.config/wezterm")
    for k in "${(@k)assoc_array}"; do
      if [ "$1" = "${k}" ]; then
        builtin cd "${assoc_array[$k]}" && eza --icons -a
        return 0
        # break
      fi
    done
    echo "No such alias" 1>&2
  fi
}

function c() {
  # _c "$@" &> /dev/null
  # if [ $? -ne 0 ]; then
  builtin cd "$@" && eza --icons -a
  if [ -d .git ]; then
    (_behind &) > /dev/null
  fi
  # fi
}


# check if current directory is not behind from remote repository
# ────────────────────────────────────────────────────────────

function gitu() {
  local res="update: "
  while read -r line; do
    local file_name
    file_name="$(basename "${line}")"
    res="${res}${file_name}, "
    git add "${line}"
  done < <(git status -s | awk '/ M / { print $2 }')
  git commit -m "${res}"
  local branch
  branch=$(git branch --show-current)
  git push origin "${branch}"
}
