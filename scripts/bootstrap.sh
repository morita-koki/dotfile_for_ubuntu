#!/bin/bash

ESC=$(printf '\033') 

big_info() {
  printf "${ESC}[34m
==============================
$1
==============================\n${ESC}[m"
}

info () {
  printf "\r  [ ${ESC}[00;34mINFO${ESC}[0m ] $1\n"
}

success () {
  printf "\r${ESC}[2K  [  ${ESC}[00;32mOK${ESC}[0m  ] $1\n"
}

error() {
  printf "[${ESC}[00;31mERROR${ESC}[0m] $1\n"
}



make_links() {

    mkdir -p $HOME/.config/
    ln -sf $(pwd)/wezterm $HOME/.config

    DOTFILES="""
        shell/.zshrc
        shell/.zprofile
        shell/paths
        shell/aliases
        shell/zinit
        shell/env
        shell/prompt
        """

    info "start create dotfile links"

    for dotfile in $DOTFILES
    do
        info "link $(pwd)/$dotfile to $HOME"
        ln -fns $(pwd)/$dotfile $HOME
    done

    success "Sucess create dotfile links"
}



isntall_essentials() {
    info 'install essentials'

    apt installl build-essentials cmake curl wget git zsh apt-transport-https software-properties-common\
    \
    && success 'installed successfully'
}


install_pyenv () {
    info 'install pyenv'
    
    type pyenv > /dev/null 2>&1 || {
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        return 0
    }

    info 'pyenv already installed'
}



install_wezterm() {
    
    info 'install wezterm'
    type wezterm > /dev/null 2>&1 || {
        curl -LO https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203-110809-5046fc22.Ubuntu22.04.deb
        sudo apt install -y ./wezterm-20240203-110809-5046fc22.Ubuntu22.04.deb
        rm ./wezterm-20240203-110809-5046fc22.Ubuntu22.04.deb
        success 'success installed wezterm'
    }
    
    info 'wezterm already installed'
}


install_vscode() {
    info 'install vscode'
    type /snap/bin/code > /dev/null 2>&1 || {
        sudo snap install --classic code
        success 'success installed vscode'
    }
    info 'vscode already installed'
}   


install_slack() {
    info 'install slack'
    type /snap/bin/slack > /dev/null 2>&1 || {
        sudo snap install slack
        success 'success install slack'
    }
    info 'slack installed already'
}



main() {
    big_info 'install essentials'
    isntall_essentials

    big_info 'install languages'
    install_pyenv

    big_info 'install GUI applications'
    install_wezterm
    isntall_vscode
    install_slack
}

main

