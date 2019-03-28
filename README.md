# dotfiles

Set up in home directory with

```bash
# Ignore everything to avoid unintentional mutations
echo "*" > .gitignore

# Initialize repo
git init

# Set this repo as a remote
git remote add origin https://github.com/leyanlo/dotfiles.git

# Fetch all commits from remote
git fetch --all

# Track origin/master to start
git reset --soft origin/master
```

Copy or change files as needed locally
