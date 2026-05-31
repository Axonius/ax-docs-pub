#!/bin/bash
####################################
exit 1 # DO NOT RUN THIS SCRIPT!!! #
####################################

version="8_0_25"
cd /Users/ilya.ulis/git/ax-docs-pub
git checkout main
git pull
cd /Users/ilya.ulis/git/cortex
source venv/bin/activate
git checkout "release/${version}"
git pull
python /Users/ilya.ulis/git/cortex/devops/scripts/create_adapters_list.py
cp /Users/ilya.ulis/git/cortex/adapters.json /Users/ilya.ulis/git/ax-docs-pub/Files/adapters.json
rm -rf /Users/ilya.ulis/git/ax-docs-pub/img/adapter_icons
cp -r /Users/ilya.ulis/git/cortex/axonius-libs/src/libs/axonius-py/axonius/assets/logos/adapters /Users/ilya.ulis/git/ax-docs-pub/img/adapter_icons
cd /Users/ilya.ulis/git/ax-docs-pub
git add .
git commit -m "chore: update adapter list and icons from cortex release/${version}"
git push
