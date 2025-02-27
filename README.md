# mydotfiles
---

# **Dotfiles Setup & Restore Guide**  

## **📥 Installing Dotfiles on a New System**  

1️⃣ **Clone the Bare Repository**  
```sh
git clone --bare git@github.com:movbou/mydotfiles.git $HOME/.dotfiles
```

2️⃣ **Create an Alias for Easy Management**  
```sh
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

3️⃣ **Checkout the Dotfiles**  
```sh
dotfiles checkout
```
If you get errors about existing files, remove them and retry:  
```sh
dotfiles checkout 2>&1 | grep "already exists" | awk '{print $3}' | xargs rm -rf
dotfiles checkout
```

4️⃣ **Set Git to Hide Untracked Files**  
```sh
dotfiles config --local status.showUntrackedFiles no
```

5️⃣ **Make the Alias Permanent**  
```sh
echo "alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> ~/.zshrc
source ~/.zshrc  # Reload shell config
```

🎉 **Done!** Now your dotfiles are restored, and you can manage them using:  
```sh
dotfiles add ~/.zshrc  # Add new files  
dotfiles commit -m "Updated zsh config"  
dotfiles push origin main  # Sync changes  
```

---
