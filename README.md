# AstroNvim 

仅个人自用方便

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

### Linux/MacOs

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
```

```shell
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

```shell
mv ~/.local/state/nvim ~/.local/state/nvim.bak
```

```shell
mv ~/.cache/nvim ~/.cache/nvim.bak
```



#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone git@github.com:yeshooooo/nvim.git ~/.config/nvim
```

### Windows(PowerShell)

**Make a backup of your current nvim folder**

```shell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
```

```shell
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```



**Clone the repository**

```shell
git clone git@github.com:yeshooooo/nvim.git $env:LOCALAPPDATA\nvim
```

