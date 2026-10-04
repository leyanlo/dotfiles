# dotfiles

## Node versions

Install `fnm` with Homebrew (`brew install fnm`). `.zprofile` initializes it for
non-interactive login shells such as `zsh -lc 'npm run build'`; `.zshrc` handles
interactive shells and switches versions when changing directories. Both use
the nearest `.nvmrc`, falling back to the fnm default outside a pinned project.

Install `.zprofile` alongside `.zshrc`. If an existing `~/.zprofile` contains
other settings or links to a framework such as Prezto, merge these blocks into
it instead of replacing it. Keep Homebrew initialization before fnm.

Build helpers should use the configured login shell (`"$SHELL" -lc '…'`) or
select Node explicitly. A hardcoded `bash -lc` does not load this Zsh setup.
Verify selection from the project directory with `zsh -lc 'node --version'`.
