#!/bin/bash
cd ~
mkdir $3
cp -r $1 ~/$3
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

func ~/$3
cd ~
tar -cf $4 $3
