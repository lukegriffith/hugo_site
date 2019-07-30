


default:

	rm -rf public/*
	rm -rf themes/cocoa/*
	git submodule init && git submodule update

deploy: 
	./deploy.sh

cv:
	pandoc lukegriffith_cv.md -o lukegriffith_cv.pdf
