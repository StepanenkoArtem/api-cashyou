up:
	docker compose up

down:
	docker compose down --remove-orphans

update:
	docker compose run --rm app bundle install

db-create:
	docker compose run app bundle exec rails db:create

db-migrate: 
	docker compose run --rm app bundle exec rails db:migrate

db-drop:
	docker compose run --rm app bundle exec rails db:drop

db-seed:
	docker compose run --rm app bundle exec rails db:seed	

db-refresh:
	make db-drop && make db-create && make db-migrate && make db-seed

build:
	docker compose build

bash:
	docker run -it api-cashyou:latest  

.PHONY:
	up
	down
	build
	bash
	update