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

## pull all packages

```
git submodule update --init --recursive
```

# Deps

ag

utils

jq

# How add new package

```
mkdir .vim/pack/<org>/start
git submodule add <git-url> .vim/pack/<org>/start/<pack>
```

