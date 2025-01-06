build:
	docker build --pull --no-cache=false -t airspec-app .

run:
	docker run -p 3838:3838 airspec-app