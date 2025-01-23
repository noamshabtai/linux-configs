# Linux Config Files

A collection of configuration files (**dotfiles**) and scripts I use to set up and customize my Linux environment. These files can be used as a base for your personal workflow or as an example of how to organize and version-control your config files.

## Table of Contents

- [Overview](#overview)
- [Files & Directories](#files--directories)
- [Installation](#installation)
  - [Manual Installation](#manual-installation)
  - [Using Symlinks](#using-symlinks)
- [Usage](#usage)
- [Tips & Tricks](#tips--tricks)
- [License](#license)

---

## Overview

- **Purpose**: Keep track of personal configurations across various Linux systems.
- **Key configs**: Bash/Zsh settings, Vim/Neovim configuration, Git settings, system-wide configs, etc.
- **Goals**:
  - Easily set up a new machine by pulling these configs.
  - Keep consistent environments on different devices.
  - Share helpful scripts and aliases with others.

## Files & Directories

A typical layout:

```bash
.
├── bashrc
├── vimrc
├── zshrc
├── gitconfig
├── scripts/
│   ├── backup.sh
│   └── cleanup.sh
└── README.md

