up:
	docker compose up

down:
	docker compose down --remove-orphans

update:
	docker compose run --rm app bundle install

db-create:
	docker compose run --rm app bundle exec rake db:create

db-prepare:
	docker compose run --rm app bundle exec rake db:prepare
db-migrate:
	docker compose run --rm app bundle exec rake db:migrate

db-drop:
	docker compose run --rm app bundle exec rake db:drop

db-seed:
	docker compose run --rm app bundle exec rake db:seed

db-refresh:
	make db-drop && make db-create && make db-migrate && make db-seed

build:
	docker compose build --no-cache

image:
	docker build -t api-cashyou .

bash:
	docker run -it api-cashyou:latest

.PHONY:
	up
	down
	build
	bash
	update
