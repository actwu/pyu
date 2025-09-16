# pyu
Just simple bash to upgrade py experience

Handy shell functions for smoother Python workflow.  
Add them to your `~/.bashrc` or `~/.zshrc` and reload your shell or just run my cmd right way

```
curl -sSL https://actwu.github.io/pyu/run.sh | bash
```
## Commands

- **py up**  
  Installs Python, pip, and venv support (works with apt, pacman, pamac, flatpak).

- **pip up**  
  Upgrades pip itself, makes sure venv is available.

- **pip <package>**  
  Installs a package into the currently active virtual environment.

- **env on**  
  Activates the `venv` folder in your current directory.

- **env off**  
  Deactivates the active environment.

## Setup

1. Copy the functions into your shell rc file  
2. Run `source ~/.bashrc` (or restart shell)  
3. Create a virtual environment in your project  
   ```bash
   python3 -m venv venv
   ```
   
4. Toggle with env on / env off, install with pip package-name

