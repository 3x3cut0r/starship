# ohmyzsh

### [github.com/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/tree/master)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# starship

starship.rs configuration files

## install starship

1. install

```bash
# install starship
curl -sS https://starship.rs/install.sh | sh

# install fonts for MacOS
brew install font-hack-nerd-font
brew install font-jetbrains-mono-nerd-font

# ubuntu
sudo apt update
sudo apt install fonts-firacode
```

2. add this to your favourite shell

`~/.bashrc`

```bash
# starship
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init bash)"
```

`~/.zshrc`

```bash
# starship
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"
```
