#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo $1;

if [ "$1" != "create" ] && [ "$1" != "update" ]; then
    echo -e "${RED}Argument 1 should be 'create' or 'update'${NC}" 1>&2
    exit 1;
fi

echo -e "${GREEN}cd to $2...${NC}"
cd ~/Sites/$2

# checkout to base release branch and get latest
echo ''
echo -e "${GREEN}Checkout and pull from $3...${NC}"

git checkout $3
git pull origin $3

# checkout to develop and get latest
echo '';
echo -e "${GREEN}Checkout and pull from develop...${NC}"

git checkout develop
git pull origin develop

# merge base release branch to develop
echo ''
echo -e "${GREEN}Merging $3 to develop...${NC}"

git merge $3

# check out new release branch and push
echo ''

if [ "$1" = "create" ]; then
    echo -e "${GREEN}Creating new branch $4...${NC}"
    git checkout -b $4
else
    echo -e "${GREEN}Checkout and pull from $4...${NC}"
    git checkout $4
    git pull origin $4

    echo ''
    echo -e "${GREEN}Merging develop to $4...${NC}"
    git merge develop
fi



echo ''
while true; do
    read -p "$(echo -e ${YELLOW}Do you want to push develop to origin? ${NC})" yn
    case $yn in
        [Yy]* )
                echo -e "${GREEN}Pushing develop to origin${NC}";
                git checkout develop
                git push origin develop
                break;;
        [Nn]* )
                break;;
        * ) echo -e "${RED}Please answer yes or no...${NC}";;
    esac
done

echo ''
while true; do
    read -p "$(echo -e ${YELLOW}Do you want to push $4 to origin? ${NC})" yn
    case $yn in
        [Yy]* )
                echo -e "${GREEN}Pushing $4 to origin${NC}";
                git checkout $4
                git push origin $4
                break;;
        [Nn]* )
                break;;
        * ) echo -e "${RED}Please answer yes or no...${NC}";;
    esac
done