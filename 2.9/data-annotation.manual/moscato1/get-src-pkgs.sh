#!/bin/bash
#
# get-src-pkgs.sh
#
# Get the "2.9-data-annotation" source packages from wilson2.
# The retrieved packages are locally stored in
#   D:\biocbld\bbs-2.9-data-annotation\src-pkgs
#
# Questions/help: hpages@fhcrc.org (ext. 5791)
# Last modified: 2011-07-27

REPOS_LABEL="2.9-data-annotation"
REPOS_DIR="2.9/data/annotation"

SRC_HOST="wilson2"
SRC_USER="biocadmin"
SRC_DIR="PACKAGES/$REPOS_DIR/src/contrib"

DEST_DIR="/cygdrive/d/biocbld/bbs-2.9-data-annotation/src-pkgs"

RSAKEY="/cygdrive/d/biocbld/.BBS/id_rsa"
SSH_CMD="/usr/bin/ssh -qi $RSAKEY -o StrictHostKeyChecking=no"


ask()
{
        agreed=
        while [ -z "$agreed" ]; do
            echo "Is that OK? [yes or no] "
            read reply leftover
            case $reply in
                "yes" | "ok" | [yYoOsS])
                    agreed=1
                    ;;
                "no" | [nN])
                    exit 1
                    ;;
            esac
        done
}


echo ""
echo "This script will get the \"$REPOS_LABEL\" source packages from $SRC_HOST."
echo ""

ask

/usr/bin/rsync -rtv --delete -e "$SSH_CMD" "$SRC_USER@$SRC_HOST:$SRC_DIR/" "$DEST_DIR"

