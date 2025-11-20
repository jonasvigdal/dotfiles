# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

Currently this repo mainly contains:

- zsh
- tmux

---

## 1. System update

Run these first on a fresh install:

```bash
sudo apt update
sudo apt upgrade
sudo reboot now
```

After the reboot, continue with the next steps.

---

## Install programs

**Core development tools**

```bash
sudo apt install zsh vim git cmake tmux curl fzf stow
```


**Set zsh as your default shell**

```bash
chsh -s "$(which zsh)"
```

Then **log out and log back in** (or reboot) so that zsh becomes your login shell.

You can check with:

```bash
echo "$SHELL"
# Should show something like /usr/bin/zsh
```

---

## Clone this repository

Clone the dotfiles repo into your home directory (using `.dotfiles` as the folder name):

```bash
cd ~
git clone <REPO_URL> .dotfiles
cd .dotfiles
```

Replace `<REPO_URL>` with the actual URL of this repository.

---

## Apply dotfiles with stow

These dotfiles are managed with GNU Stow, which creates symlinks from this repo into your `$HOME`.

**Stow everything**

From inside `~/.dotfiles`:

```bash
cd ~/.dotfiles
stow .
```

This will create symlinks (for example, `.zshrc`) in your home directory.

**Stow specific packages (when you add them)**

```bash
cd ~/.dotfiles
stow zsh
# stow tmux
# stow vim
# stow vscode
```

**Unstow (remove) a package**

To remove the symlinks created by a specific package:

```bash
cd ~/.dotfiles
stow -D zsh
# stow -D tmux
# stow -D vim
# stow -D vscode
```

**If stow complains about existing files**

If you see an error like:

> existing target is not a symlink

It means there is already a file where stow wants to place a symlink (for example, `~/.zshrc`).

Fix it by backing up or removing the existing file and running stow again:

```bash
mv ~/.zshrc ~/.zshrc.backup
cd ~/.dotfiles
stow zsh
```

---

## Repository layout

```text
~/.dotfiles/
├── zsh/
│   └── .zshrc
├── git/
│   └── .gitconfig
├── tmux/
│   └── .tmux.conf
└── ...

```

- Each top-level directory (`zsh/`, `git/`, `tmux/`, `vscode/`, …) is a **stow package**.
- Inside each package, paths mirror their final location under `$HOME`.

If you’re only using zsh for now, you might just have:

```text
~/.dotfiles/
└── zsh/
    └── .zshrc
```

---

## zsh plugins (zinit)

### Install zinit

```bash
bash -c "$(curl -fsSL https://git.io/zinit-install)"
```

Restart the shell so the new config is loaded:

```bash
exec zsh
```

Can also have it auto install by adding it to the '.zshrc'.

### Update plugins

Later, to update all plugins managed by zinit:

```bash
zinit update --all
```

To update zinit itself:

```bash
zinit self-update
```


## Updating your dotfiles

1. Edit the files inside `~/.dotfiles/...`.
2. Commit and push the changes:

```bash
cd ~/.dotfiles
git status
git add .
git commit -m "Update dotfiles"
git push
```

If you add new files/directories that should be managed by stow, just add them to the appropriate package (e.g. `zsh/`, `vscode/`) and rerun `stow` for that package:

```bash
cd ~/.dotfiles
stow zsh
# stow <other-package>
```

---

## Troubleshooting

### zsh is not the default shell

Check:

```bash
echo "$SHELL"
```

If it’s not `zsh`, run:

```bash
chsh -s "$(which zsh)"
```

Then log out and back in.

### stow errors

- **Existing target is not a symlink**  
  Back up/remove the conflicting file and re-run `stow` for that package.


Feel free to fork and adapt this setup to your own needs.

