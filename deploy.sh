#!/bin/bash

#erro hanlding
set -e 

#mkdocs build
mkdocs build

sleep 10

#github
git add .
git commit -m "upadte notes: $(date)"
git push origin main

sleep 10

mkdocs gh-deploy
