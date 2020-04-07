#!/bin/bash
#
echo ":: building using docker ..."
docker run -it --rm \
    -v $(pwd):/srv/goldfynch.com jekyll/jekyll sh -c "cd /srv/goldfynch.com && jekyll build --config _config.yml,_config.gcp-www1.yml && chown 1000:1000 _site"
