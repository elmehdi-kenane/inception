COMPOSE_FILE_PATH=./src/docker-compose.yml
VOL_WPDB_PATH=src/vols/vol-wpdb/*
VOL_WPF_PATH=src/vols/vol-wpf/*

all:
	docker-compose -f ${COMPOSE_FILE_PATH} up --build

clean:
	docker-compose -f ${COMPOSE_FILE_PATH} down --rmi all

rmvol: clean
	@if [ "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	else \
		echo "No volumes to remove"; \
	fi

clearvol:
	rm -rf ${VOL_WPDB_PATH} && rm -rf ${VOL_WPF_PATH}

clearall: rmvol clearvol