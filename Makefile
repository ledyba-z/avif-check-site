.PHONY: FORCE all deploy;

all: images.html;

images.html: FORCE decoded/* encoded/*
	bash gen.sh > images.html

deploy:
	rsync -auz --delete -e ssh . yorozu:/opt/www/resources.link-u.co.jp/avif
