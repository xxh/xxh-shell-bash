[xxh](https://github.com/xxh/xxh) entrypoint for bash. The "zero" means using bash shell installed on host without any additional installations. 

## Install
```
xxh +I xxh-shell-bash-zero 
xxh myhost +s bash-zero
```
To avoid adding `+s` every time use xxh config in `~/.config/xxh/config.xxhc` (`$XDG_CONFIG_HOME`):
```
hosts:
  ".*":                     # Regex for all hosts
    +s: bash-zero
```

## Plugins

Pinned: [xxh-plugin-bash-vim](https://github.com/xxh/xxh-plugin-bash-vim)

🔎 [Search xxh plugins on Github](https://github.com/search?q=xxh-plugin-bash&type=Repositories) or [Bitbucket](https://bitbucket.org/repo/all?name=xxh-plugin-bash) or 💡 [Create xxh plugin](https://github.com/xxh/xxh-plugin-bash-example)
