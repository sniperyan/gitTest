#!/bin/bash
#########################################################################


BRANCH=$1    # branch 
echo "push start"
echo `git push origin HEAD:$BRANCH`