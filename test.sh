#!/bin/bash
#########################################################################
# $?   代表上一个命令执行是否成功的标志，如果执行成功则$? 为0，否则不为0
#  使用  保存结果的变量名=`需要执行的linux命令` 这种方式来获取命令的输出时，注意的情况总结如下：

# 1）保证反单引号内的命令执行时成功的，也就是所命令执行后$?的输出必须是0，否则获取不到命令的输出

# 2）即便是命令的返回值是0，也需要保证结果是通过标准输出来输出的，而不是标准错误输出，否则需要重定向

# 因此我们推荐使用  保存结果的变量名=`需要执行的linux命令 2>&1 `的方式来获取命令的执行结果。   

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
    # 保存结果的变量名=`需要执行的linux命令 2>&1 `的方式来获取命令的执行结果
    abc=`./push.sh master 2>&1`
    echo $?
    echo "push返回值: "${abc}  
    # echo ">>>>>> 6) end to push"
    echo $?
    if [[ "$?" != "0" ]]; then
      echo ">>>>>> GIT PUSH Failed!!! ...."
      doErrorExit
    fi
    echo ">>>>>> PUSH ok!!"
  fi

  echo ">>>>>> SUCCESS!!"

