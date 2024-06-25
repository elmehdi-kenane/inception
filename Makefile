all:
	docker-compose -f ./src/docker-compose.yml up --build
clean:
	docker-compose -f ./src/docker-compose.yml down --rmi all
vclean:
	docker volume prune -a