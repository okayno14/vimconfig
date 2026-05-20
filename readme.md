# install

Make folder for swp-files:

```
mkdir .vim/swp
```

## Files

.vim
.vimrc
.vsnip/
.templates

# Deps

ag

utils

jq

# vimwiki

Смотри репозиторий utils, (.local/lib/utils/common/style.css).

# package

## add new package

```bash
mkdir -p .vim/pack/<org>/start
git submodule add <git-url> .vim/pack/<org>/start/<pack>
```

## pull all

```bash
git submodule update --init --recursive
```

## remove

```bash
# Remove the submodule entry from .git/config
git submodule deinit -f .vim/pack/<org>/start/<pack>

# Remove the submodule directory from the superproject's .git/modules directory
rm -rf .git/modules/.vim/pack/<org>/start/<pack>

# Remove the entry in .gitmodules and remove the submodule directory located at path/to/submodule
git rm -f .vim/pack/<org>/start/<pack>
```

