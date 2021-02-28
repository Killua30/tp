#!/bin/bash

path=$(pwd)
mkdir $3
cp -r $1 $path/$3
x=$2
func(){
 cd $1
 for file in $(ls)
 do
  if [ -d $file ]
  then
   func $1/$file
  else
   if [[ $file != *.$x ]]
   then
    rm $1/$file
   fi
  fi
 done
}

func $path/$3
cd $path
tar -cf $4 $3
