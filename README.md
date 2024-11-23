# Neovim configuration

## Brief

This repository contains my current neovim configuration. It is mostly
based on lua scripts, and is project agnostic. One major concern for this
configuration is to try to prevent a plugin bloat: only the strict minimum
is used here (ie: when I did not find how to perform the targeted
configuration with Lua/vim commands, or when I judged it was not worth the
effort)

## Main features

- Fuzzy finder for files and word search
- Some interface tuning (theme, code layout)
- LSP configuration for my day-to-day languages
- Basic project-local configuration through a .env file, providing local
  environment variables to use and some make tooling (eg: TARGET variable
  giving the default make target
- A few useful editing shortcuts

## Installation

`git clone git@github.com:Tropicao/nvim-conf.git .config/nvim`

## Notes

This configuration is the result of a recent initiative to improve my
workflow. I have been working for a few years with a mix of vim and VSCode,
and got more and more frustrated by the setup (vim is a pain to configure,
and VSCode needs as much system ressources as if it was steering a rocket)
