CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"

for pluginrc_file in $CURRENT_DIR/../../../plugins/*-bash-*/build/pluginrc.sh; do
  if [[ -f $pluginrc_file ]]; then
    if [[ $XXH_VERBOSE == '1' ]]; then
      echo Load plugin $pluginrc_file
    fi

    source $pluginrc_file
  fi
done

cd ~