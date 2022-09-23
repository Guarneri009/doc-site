include .env

ls:
	ls

deploy:
	GIT_USER=${GIT_USER} npm run deploy

# git config --global user.email "driftinghide@gmail.com"
# git config --global user.name "Guarneri009"