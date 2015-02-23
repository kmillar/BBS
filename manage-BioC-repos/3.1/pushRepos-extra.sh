#!/bin/sh

cd "$HOME/manage-BioC-repos/3.1"

. ./config.sh

REPOS_ROOT="$HOME/PACKAGES/$BIOC_VERSION/extra"

rsync --delete -ave ssh $REPOS_ROOT webadmin@master.bioconductor.org:/extra/www/bioc/packages/$BIOC_VERSION
