#!/bin/bash
#
echo ":: going to deploy the current branch to goldfynch.com"
echo ":: ok to proceed? Press a key to continue ..."

read

CWD=$(pwd)
DEST=$CWD/_site

echo ":: cleaning old files ..."
if [ -d "$DEST" ] ; then
    rm -rf "$DEST"
fi

echo ":: building ..."
jekyll build --destination "$DEST"
RES=$?

if [[ "$RES" != "0" ]] ; then
    echo "Failed to build site."
    exit 1
fi

echo ":: staging ..."
rsync -azP -e "ssh -p 23432" _site/ mazira@www.goldfynch.com:/var/www/goldfynch.com/

echo ":: done."
