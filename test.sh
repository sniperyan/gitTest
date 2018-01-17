#!/bin/bash
#########################################################################


abc = ""
doErrorExit () {
  
  exit 1
}

echo ">>>>>> push changes to iOS git"
  
  echo ">>>>>> 1) git add files..."
  git add .
  echo ">>>>>> 2) git commit..."
  git commit -m "rn debug"
  echo ">>>>>> 3) git remote update..."
#   git remote update
  if [[ "$?" != "0" ]]; then
    echo ">>>>>> git remote update Failed!!! ...."
    doErrorExit
  fi
  echo ">>>>>> git remote update ok!!! ...."
  echo ">>>>>> 4) git rebase..."
#   git rebase origin/master
  if [ true ]; then
    echo ">>>>>> 5) start to push"
    abc=`./push.sh master`
    echo "push返回值: "${abc}  
    echo ">>>>>> 6) end to push"
    if [[ "$?" != "0" ]]; then
      echo ">>>>>> GIT PUSH Failed!!! ...."
      doErrorExit
    fi
    echo ">>>>>> PUSH ok!!"
  fi

  echo ">>>>>> SUCCESS!!"

