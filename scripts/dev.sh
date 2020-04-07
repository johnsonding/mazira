#!/bin/bash
#
if [ "$1" = "--docker" ] ; then
    echo ":: starting dev mode (docker) ..."
    docker run -it --rm -p 4000:4000 -v $(pwd):/srv/goldfynch.com jekyll/jekyll sh -c "cd /srv/goldfynch.com && jekyll server -w --config _config.yml,_config.dev.yml"
else
    echo ":: starting dev mode ..."
    jekyll serve -w --config _config.yml,_config.dev.yml
fi
