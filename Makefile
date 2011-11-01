all:
	git pull -u origin master
	git add .
	git commit -m "Automatic Commit via Makefile"
	git push -u origin master

update:
	git pull -u origin master

commit: 
	git pull -u origin master
	git add .
	git commit -m "Automatic Commit via Makefile"
	git push -u origin master
