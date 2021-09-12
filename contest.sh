#!/bin/sh

A_PATH='./a_contest/'
PREFIX='weekly-contest-'

if [[ $2 = 'bi' ]]; then
    PREFIX='biweekly-contest-'
fi

PREFIX=$A_PATH$PREFIX

cp ./$PREFIX'template.rb' ./$PREFIX$1'.rb'
