help: 
	@docker run -it --rm site-updates gh help

build:
	@docker build -t site-updates .

status:
	@docker run -it --rm site-updates gh status

version:
	@docker run -it --rm site-updates gh --version

run:
	@docker run -it --rm site-updates