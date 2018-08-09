#! /bin/sh
ORG_NAME=$1
sfdx force:org:create -f config/project-scratch-def.json --setalias $ORG_NAME --setdefaultusername \
&& sfdx force:source:push \
&& sfdx force:data:tree:import --plan seed-data/seed-data-combined-plan.json \
&& sfdx force:org:open