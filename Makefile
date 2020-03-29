build:
	docker-compose build

bash:
	docker-compose run --rm web bash

up:
	docker-compose up

test:
	docker-compose run --rm web bash -c 'bin/rails test'

.PHONY: test