api:
	docker compose up

rebuild:
	docker build -t api-cashyou:latest .

bash:
	docker run -it api-cashyou:latest  

.PHONY:
	api