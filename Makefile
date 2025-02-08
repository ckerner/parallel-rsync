CURDIR=$(shell pwd)

#install: python ssacl utils

#update: purge_links ssacl python utils

#ssacl:	.FORCE
#	cp -fp $(CURDIR)/ssacl $(LOCLDIR)/ssacl

#python:	.FORCE
#	$(PYTHON) $(CURDIR)/setup.py install

#utils:	.FORCE
#	cp -fp $(CURDIR)/backup_acls.sh $(LOCLDIR)/backup_acls.sh
#	cp -fp $(CURDIR)/backup_acls.py $(LOCLDIR)/backup_acls.py

clean:
	rm -f server.log
	rm -f client_*.log
	rm -f transfer_*.log

.FORCE:


