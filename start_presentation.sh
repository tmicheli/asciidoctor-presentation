#!/usr/bin/env bash

# default values
adoc='presentation.adoc'

if [ $# -ne 0 ]; then
  while getopts "hf:" opt; do
    case ${opt} in
      h)
        echo "This script converts yur adoc presentation to a revealjs"
        echo "presentation and opens a tab in your favourite browser."
        echo "Usage:"
        echo ""
        echo "$(basename $0) [-f FILENAME]"
        echo ""
        echo "were FILENAME is the name of your presentation without path"
        echo "and is located in ./slides directory."
        ;;
      f)
        adoc=${OPTARG}
        ;;
      ?)
        echo "Usage: start_presentation.sh [-f FILENAME] "
        exit 1
        ;;
    esac
  done
  shift $((OPTIND -1))
fi
# convert adoc to slides
podman run -e ADOC_FILE="${adoc}" -v $(pwd)/slides:/slides:Z -p 2342:2342 quay.io/tobias.michelis/asciidoctor-revealjs:latest 2>&1 >/dev/null &
#podman run -e ADOC_FILE="${adoc}" -v $(pwd)/slides:/slides:Z -p 2342:2342  localhost/asciidoctor/revealjs 2>&1 >/dev/null &

# Give the server some time to come up
sleep 2

# connect with your favourite browser
xdg-open http://localhost:2342/"${adoc%.adoc}".html
