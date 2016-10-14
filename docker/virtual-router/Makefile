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

	sudo ovs-docker add-port ovs-lan1 eth1 $(CONTAINER) --ipaddress=192.168.12.1/24
	docker exec $(CONTAINER) iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
	# docker exec $(CONTAINER) iptables -t nat -A POSTROUTING -s 192.168.12.0/255.255.255.0 -j MASQUERADE
	docker exec $(CONTAINER) service isc-dhcp-server start

shell:
	docker exec -it $(CONTAINER) /bin/bash
clean: rm
	docker rmi $(IMAGE)
rm:
	-sudo ovs-docker del-port ovs-lan1 eth1 $(CONTAINER)
	docker rm -f $(CONTAINER)
rerun: rm run
stop:
	docker stop $(CONTAINER)
start:
	docker start $(CONTAINER)
restart: stop start

