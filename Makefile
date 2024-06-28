COMPOSE_FILE_PATH=./src/docker-compose.yml
VOL_WPDB_PATH=/home/ekenane/data/vol-wpdb/*
VOL_WPF_PATH=/home/ekenane/data/vol-wpf/*

all:
	sudo docker-compose -f ${COMPOSE_FILE_PATH} up --build

clean:
	sudo docker-compose -f ${COMPOSE_FILE_PATH} down --rmi all

rmvol: clean
	@if [ "$$(sudo docker volume ls -q)" ]; then \
		sudo docker volume rm $$(sudo docker volume ls -q); \
	else \
		echo "No volumes to remove"; \
	fi

clearvol:
	rm -rf ${VOL_WPDB_PATH} && rm -rf ${VOL_WPF_PATH}

clearall: rmvol clearvol