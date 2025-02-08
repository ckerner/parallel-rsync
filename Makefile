CURDIR=$(shell pwd)
LOCLDIR=/usr/local/bin

install: psync

update: psync

psync:	.FORCE
	cp -fp $(CURDIR)/psync $(LOCLDIR)/psync

clean:
	rm -f server_logs/server.log
	rm -f client_logs/client_*.log
	rm -f transfer_logs/transfer_*.log

.FORCE:


