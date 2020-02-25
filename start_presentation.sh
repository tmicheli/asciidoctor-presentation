#!/usr/bin/env bash
podman run -e ADOC_FILE='presentation.adoc' -v $(pwd)/slides:/slides:Z -p 2342:2342 localhost/asciidoctor/revealjs 2>&1 >/dev/null &
sleep 15
xdg-open http://localhost:2342
