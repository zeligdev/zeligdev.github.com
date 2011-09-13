all:

update:
	git pull origin master

commit: 
	git pull
	git add .
	git commit -m "Automatic Commit via Makefile"
	git push origin master
