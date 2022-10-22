include .env

help: 
	@docker run -it --rm site-updates gh help

build:
	@docker build --build-arg TOKEN=${TOKEN} -t site-updates .

status:
	@docker run -it --rm site-updates gh status

version:
	@docker run -it --rm site-updates gh --version

run:
	@docker run -it --rm --env TOKEN=${TOKEN} site-updates 

update:
	@docker run -it --rm site-updates sh -c "gh repo clone ${GITHUB_REPO} && \
	cd ${GITHUB_REPO} && \
	git config user.name '${GITHUB_USER_NAME}' && \
	git config user.email '${GITHUB_USER_EMAIL}' && \
	git checkout -b update && \
	yarn upgrade --latest -y && \
	cd frontend && \
	yarn upgrade --latest -y && \
	cd ../ && \
	git add . && \
	git commit -m 'Update dependencies' && \
	git push --force https://${TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.git update && \
	gh pr create --title 'Update dependencies' --body 'Update dependencies' --base master --head update"