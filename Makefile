help: 
	@docker run -it site-updates gh help

build:
	@docker build -t site-updates .

status:
	@docker run -it site-updates gh status

version:
	@docker run -it site-updates gh --version

run:
	@docker run -it site-updates