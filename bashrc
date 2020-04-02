CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for pluginrc_file in $(find $CURRENT_DIR/../../../plugins/*-bash-*/build -type f -name '*pluginrc.sh' -printf '%f\t%p\n' 2>/dev/null | sort -k1 | cut -f2); do
  if [[ -f $pluginrc_file ]]; then
    plugin_name=`basename $(dirname $(dirname $pluginrc_file))`

    # Search EXE environment variables for plugin and execute
    plugin_env_name=`echo $plugin_name | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
    prefix="$plugin_env_name"_EXE_
    if [[ $XXH_VERBOSE == '2' ]]; then
      echo "Search $prefix*** environment for $plugin_name"
    fi
    for l in `env | grep $prefix`; do
      if [[ $XXH_VERBOSE == '2' ]]; then
        echo ENV $plugin_name: $l
      fi
      data="$( cut -d '=' -f 2- <<< "$l" )";
      code=`echo $data | base64 -d`
      if [[ $XXH_VERBOSE == '2' ]]; then
        echo ENV $plugin_name RUN: $code
      fi
      eval $code
    done

    if [[ $XXH_VERBOSE == '1' ]]; then
      echo Load plugin $pluginrc_file
    fi
    cd $(dirname $pluginrc_file)
    source $pluginrc_file
  fi
done

cd ~
