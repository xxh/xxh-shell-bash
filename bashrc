CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"

for pluginrc_file in $CURRENT_DIR/../../../plugins/**/*-bash-*/build/pluginrc.sh; do
  source $pluginrc_file
done