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
  if [ -z "$_date"  ] ; then
    return 1
  fi
  echo "Enter file extension:"
  read -r f_extension
  nvim "${_date}.${f_extension}"
}

