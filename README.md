## Wed 25 Jan 2023

My latest config using `LazyVim/starter` 👍 

![screenshot1](https://i.imgur.com/wsYmL2e.png)

![screenshot2](https://i.imgur.com/bRz4bNs.png)


# LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim)

## 🚀 Getting Started

This repo contains an example setup for
[LazyVim](https://github.com/LazyVim/LazyVim)

### 1. Make a backup of your current Neovim files:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

### 2. Clone the starter

```sh
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

### 3. Start Neovim!

```sh
nvim
```

Refer to the comments in the files on how to customize **LazyVim**.

## 📂 File Structure

<pre>
~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       └── example.lua
├── init.lua
└── stylua.toml
</pre>
