#!/bin/bash

#erro hanlding
set -e 

echo "Staring documentation build and deployment...."


#mkdocs build
echo "Building documentation...."
mkdocs build --clean

sleep 10

#github
echo "Pushing to github....."
git add .

# check if there are changes to comit 
if ! git diff-index --quiet HEAD --; then
    git commit -m "upadte notes: $(date)"
    git push origin main
    echo "Pushed to Github Successfully"
else
    echo "No change to comit"
fi

sleep 10

mkdocs gh-deploy
