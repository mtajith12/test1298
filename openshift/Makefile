DC_CMD=docker-compose -f docker-compose-build.yml 


config: 
	$(DC_CMD) config

build: 
	$(DC_CMD) build

push:
	$(DC_CMD) push

clean:
	$(DC_CMD) down --rmi all


