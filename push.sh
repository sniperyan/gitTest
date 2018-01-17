#!/bin/bash
#########################################################################


BRANCH=$1    # branch 

echo `git push origin HEAD:$BRANCH`