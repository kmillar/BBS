#!/bin/sh

REPOS_ROOT="$HOME/PACKAGES/1.9/omegahat"

rsync --delete -ave ssh $REPOS_ROOT webadmin@cobra:/extra/www/bioc/packages/1.9
