#! /bin/bash

#updateextreciepes.sh 1.2 by Pablo Serrano
# Current : add commit update & sleep routines
# 1.1 : fix variables bad syntax
# 1.0 : Initial version  

#You can add repo name for all public cookbook on http://github.com/opscode-cookbooks
APPS=(tomcat java openssl apache2)

echo "Deleting old dirs..."

for i in "${APPS[@]}"; do rm -fr ${i}; done 
sleep 2

echo "Refresh repos..." 

for i in "${APPS[@]}"; do git clone git://github.com/opscode-cookbooks/${i}; done

sleep 2

echo "deleting crap for git ignores.."

for i in "${APPS[@]}" 
	do 
		cd ${i}
		rm -fr .gitignore .git/
		cd ..
	done

sleep 2

echo "add updates, commit and push..."

git add .
git commit -m "Refresh repos"
git push

sleep 2

echo "finish"
