#!/bin/bash

cd $HOME/TT

file=$HOME/upload/`ls -tr $HOME/upload | tail -1`

if [ -f "$file" ]
then
    ./mw.do "$file"
fi 
