BRANCH=$(shell git status|grep "On branch" | cut -f4 -d" ")

default:
	@echo $(BRANCH)

pull:
	rsync --exclude-from=rsync.exclude -rcv root@173.255.215.54:/srv/www/isitsunnyinpdx ./

fakepull:
	rsync --exclude-from=rsync.exclude -rcvn root@173.255.215.54:/srv/www/isitsunnyinpdx ./

push:
ifeq ($(BRANCH),master)
	rsync --exclude-from=rsync.exclude -rcv --delete ./ root@173.255.215.54:/srv/www/isitsunnyinpdx
else
	@echo "Let me save you from yourself. DO NOT push a non-prod-branch to production. The client will thank you later. :)"
endif

fakepush:
	rsync --exclude-from=rsync.exclude -rcvn --delete ./ root@173.255.215.54:/srv/www/isitsunnyinpdx
