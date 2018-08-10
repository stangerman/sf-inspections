#! /bin/sh
ORG_NAME=$1
sfdx force:org:create -f config/project-scratch-def.json -a $ORG_NAME username=stephentangermandx@gmail.com --durationdays 30 \
&& sfdx force:source:push \
&& sfdx force:data:tree:import --plan seed-data/seed-data-combined-plan.json \
&& sfdx force:org:open