# dotfiles

## zsh

- Need [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/)

  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

  or

  ```
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

- plugins

  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

    ```
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```

  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

    ```
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```

- theme

  - Need [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) or [MesloLGS NF](https://github.com/romkatv/powerlevel10k#fonts)

  - [powerlevel10k](https://github.com/romkatv/powerlevel10k)

    ```
    install:
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    update:
    git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull
    ```

## tmux

- Need [Oh my tmux!](https://github.com/gpakosz/.tmux)
