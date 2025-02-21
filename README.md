# Parallel Rsync

As filesystems become larger, migration of them becomes exponentially more complex.  The need for tools that
can operate on the filesystem in parallel are essential. It is no longer viable to try and walk the entire
file tree single threaded to move data.

## Command Options

Usage: psync server [options] | client [options] | log <pathname|token id> | tail <pathname|token id> | state   
        --port PORT                  Server/client port (default: 8812)  
        --source DIR                 Source directory (server)  
        --depth DEPTH                Depth to search (server, default: 3)  
        --remote SERVERS             Comma-separated list of remote servers or a file containing server list (server)  
        --remote-path PATH           Remote path for synchronization (server)  
        --server IP                  Server IP address (client)  
        --debug                      Enable debug mode   
        --dry-run                    Enable dry-run mode. No transfers. (server)  
        --help                       Display help  


## Getting started

You start off the process by initiating a psync server:

This will initiate a server to transfer the /archive/software tree to the dr-server:/disaster/backup directory:

psync server --source /archive/software --depth 3 --remote dr-server --remote-path /disaster/backup


Once the server has started, you can initiate clients to migrate the data. You can run multiple clients on a node,
and you can use multiple client nodes as well to fan out the sync.

psync client --server public-server --threads 12


If are using a parallel filesystem and have multiple target nodes, you can specify them in a file or on the command
line and the transfers will be rotated between all of the nodes in the list. For example:

psync server --source /archive/software --depth 3 --remote xfer01,xfer02,xfer03,xfer04 --remote-path /disaster/backup 

or

psync server --source /archive/software --depth 3 --remote xfernodes --remote-path /disaster/backup 

cat xfernodes
xfer01
xfer02
xfer03
xfer04


If you want to find the status of an individual transfer, you can:

psync log /path/of/directory or transfer token id

This will parse the server log to see which transfer id maps to that path and the displays the log.


If you want to watch the log of an individual transfer as it is running, you can:

psync tail /path/of/directory or transfer token id

This will parse the server log to see which transfer id maps to that path and the displays the log.


If you want to see the current server state:

psync state --server dr-server

## Author
Chad Kerner, Senior Storage Engineer  
National Center for Supercomputing Applications  
University of Illinois, Urbana-Champaign  
ckerner@illinois.edu    chad.kerner@gmail.com  


## Warranty
No warranty. If it breaks, fix it and send me a diff.
