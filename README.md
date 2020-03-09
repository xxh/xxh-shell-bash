[Xxh](https://github.com/xxh/xxh) entrypoint for bash. 

## Install
```
cd ~/.xxh/xxh/shells/
git clone https://github.com/xxh/xxh-shell-bash-zero
./xxh-shell-bash-zero/build.xsh
xxh myhost +s xxh-shell-bash-zero
```
To avoid adding `+s` every time use xxh config in `~/.xxh/.xxhc`:
```
hosts:
  ".*":                     # Regex for all hosts
    +s: xxh-shell-bash-zero
```

## Plugins

🔎 [Search xxh plugins on Github](https://github.com/search?q=xxh-plugin-bash&type=Repositories) or [Bitbucket](https://bitbucket.org/repo/all?name=xxh-plugin-bash) or 💡 [Create xxh plugin](https://github.com/xxh/xxh-plugin-zsh-sample)