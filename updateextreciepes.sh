#! /bin/bash

APPS=(tomcat java openssl apache2)

echo "Deleting old dirs..."

for i in "${APPS[@]}"; do rm -fr ${i}; done 

echo "Refresh repos..." 

for i in "${APPS[@]}"; do git clone git://github.com/opscode-cookbooks/${i}; done

echo "deleting crap for git ignores.."

for i in "${APPS[@]}" 
	do 
		cd ${i}
		rm -fr .gitignore .git/
		cd ..
	done
echo "finish"
