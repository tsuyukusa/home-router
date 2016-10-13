IMAGE=virtual-router-image
CONTAINER=virtual-router

build:
	docker build -t $(IMAGE) .
run:
	docker run -it \
		-d \
		--privileged \
        --name=$(CONTAINER) \
        --hostname=$(CONTAINER) \
        $(IMAGE) /bin/bash

shell:
	docker exec -it $(CONTAINER) /bin/bash
clean: rm
	docker rmi $(IMAGE)
rm:
	docker rm -f $(CONTAINER)
rerun: rm run
stop:
	docker stop $(CONTAINER)
start:
	docker start $(CONTAINER)
restart: stop start

