#! /bin/sh
ORG_NAME=$1
DOMAIN="user@tangerman.org"
USERNAME=$ORG_NAME$DOMAIN

echo "********** Org Create - Begin **********"
sfdx force:org:create -f config/project-scratch-def.json -s -a $ORG_NAME username=$USERNAME --durationdays 30 
echo "********** Org Create - End **********"
echo "********** Source Push - Begin **********"
sfdx force:source:push 
echo "********** Source Push - End **********"
echo "********** Data Import - Begin **********"
sfdx force:data:tree:import --plan ./config/seed-data/seed-data-combined-plan.json 
echo "********** Data Import - End **********"
sfdx force:org:open