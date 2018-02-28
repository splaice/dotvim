#!/bin/bash

mv bundle/$1 bundle/${1}_tmp
git submodule deinit -f -- bundle/$1
rm -rf .git/modules/bundle/$1
git rm -f bundle/$1
rm -rf bundle/${1}_tmp
