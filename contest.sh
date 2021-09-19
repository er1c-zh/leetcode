#!/bin/sh

A_PATH='./a_contest/'
PREFIX='weekly-contest-'

if [[ $2 = 'bi' ]]; then
    PREFIX='biweekly-contest-'
fi

cp ./$A_PATH$PREFIX'template.rb' ./$PREFIX$1'.rb'
