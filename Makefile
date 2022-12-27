up:
	docker compose up

down:
	docker compose down

db-create:
	docker compose run web bundle exec rails db:create

db-migrate: 
	docker compose run bundle exec rails db:migrate

db-drop:
	docker compose run bundle exec rails db:drop

rebuild:
	sudo docker compose run web bundle install
	sudo docker compose build

bash:
	docker run -it api-cashyou:latest  

.PHONY:
	up
	down