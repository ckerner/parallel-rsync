# Parallel Rsync

As filesystems become larger, migration of them becomes exponentially more complex.  The need for tools that
can operate on the filesystem in parallel are essential. It is no longer viable to try and walk the entire
file tree single threaded to move data.

## Getting started

You start off the process by initiating a psync server:

This will initiate a server to transfer the /archive/software tree to the dr-server:/disaster/backup directory:

psync --source /archive/software --depth 3 --remote dr-server --remote-path /disaster/backup


Once the server has started, you can initiate clients to migrate the data. You can run multiple clients on a node,
and you can use multiple client nodes as well to fan out the sync.

psync --server public-server


If are using a parallel filesystem and have multiple target nodes, you can specify them in a file or on the command
line and the transfers will be rotated between all of the nodes in the list. For example:

psync --source /archive/software --depth 3 --remote xfer01,xfer02,xfer03,xfer04 --remote-path /disaster/backup 

or

psync --source /archive/software --depth 3 --remote xfernodes --remote-path /disaster/backup 

cat xfernodes
xfer01
xfer02
xfer03
xfer04


If you want to find the status of an individual transfer, you can:

psync log /path/of/directory

This will parse the server log to see which transfer id maps to that path and the displays the log.


If you want to watch the log of an individual transfer as it is running, you can:

psync tail /path/of/directory

This will parse the server log to see which transfer id maps to that path and the displays the log.

## Author
Chad Kerner, Senior Storage Engineer  
National Center for Supercomputing Applications  
University of Illinois, Urbana-Champaign  
ckerner@illinois.edu    chad.kerner@gmail.com  


## Warranty
No warranty. If it breaks, fix it and send me a diff.
