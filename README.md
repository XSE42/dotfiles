# dotfiles

## Editor

### Vim

```shell
# 0. directories
# shell
mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/vim/{undo,swap}
# powershell ~\AppData\Local
mkdir $env:LOCALAPPDATA\vim\undo
mkdir $env:LOCALAPPDATA\vim\swap

1. using `.vim`
ln -s /[path]/dotfiles/vim/vimrc ~/.vim/vimrc

2. using XDG Base Directory
ln -s /[path]/dotfiles/vim $XDG_CONFIG_HOME/vim
```

### Neovim

```shell
# 0. directories
# shell
mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/nvim/{undo,swap}
# powershell ~\AppData\Local
mkdir $env:LOCALAPPDATA\nvim-data\undo
mkdir $env:LOCALAPPDATA\nvim-data\swap

# 1. using `.config`
ln -s /[path]/dotfiles/nvim ~/.config/nvim

# 2. using XDG Base Directory
ln -s /[path]/dotfiles/nvim $XDG_CONFIG_HOME/nvim
```

## Shell

### Zsh + [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/)

- Switch to Zsh

  ```shell
  cat /etc/shells
  chsh -s $(which zsh)
  ```

- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/)

  ```shell
  # 1. using `.confg`
  ZSH="$HOME/.config/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ZSH="$HOME/.config/oh-my-zsh" sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ZSH="$HOME/.config/oh-my-zsh" sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # 2. using XDG Base Directory
  ZSH="$XDG_CONFIG_HOME/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ZSH="$XDG_CONFIG_HOME/oh-my-zsh" sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ZSH="$XDG_CONFIG_HOME/oh-my-zsh" sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

- `.zshrc`

  ```shell
  cp /[path]/dotfiles/zsh/.zshrc ~
  ```

- Plugins

  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

    ```shell
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```

  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

    ```shell
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```

- Themes

  - Need [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

  - [powerlevel10k](https://github.com/romkatv/powerlevel10k)

    ```shell
    # install:
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    # update:
    git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull
    ```

## Terminal Emulator

### Alacritty

```shell
# 1. using `.config`
ln -s /[path]/dotfiles/alacritty ~/.config/alacritty
# or
cp -r /[path]/dotfiles/alacritty ~/.config/alacritty

# 2. using XDG Base Directory
ln -s /[path]/dotfiles/alacritty $XDG_CONFIG_HOME/alacritty
# or
cp -r /[path]/dotfiles/alacritty $XDG_CONFIG_HOME/alacritty
```

### WezTerm

```shell
# 1. using `.config`
ln -s /[path]/dotfiles/wezterm ~/.config/wezterm
# or
cp -r /[path]/dotfiles/wezterm ~/.config/wezterm

# 2. using XDG Base Directory
ln -s /[path]/dotfiles/wezterm $XDG_CONFIG_HOME/wezterm
# or
cp -r /[path]/dotfiles/wezterm $XDG_CONFIG_HOME/wezterm
```

## Multiplexer

### tmux + [Oh my tmux!](https://github.com/gpakosz/.tmux)

```shell
# 1. using `.confg`
git clone https://github.com/gpakosz/.tmux.git ~/.config/oh-my-tmux
mkdir -p ~/.config/tmux
ln -s ~/.config/oh-my-tmux/.tmux.conf ~/.config/tmux/tmux.conf
ln -s /[path]/dotfiles/tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local

# 2. using XDG Base Directory
git clone https://github.com/gpakosz/.tmux.git $XDG_CONFIG_HOME/oh-my-tmux
mkdir -p $XDG_CONFIG_HOME/tmux
ln -s $XDG_CONFIG_HOME/oh-my-tmux/.tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
ln -s /[path]/dotfiles/tmux/.tmux.conf.local $XDG_CONFIG_HOME/tmux/tmux.conf.local
```
