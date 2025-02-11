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


## Author
Chad Kerner, Senior Storage Engineer
National Center for Supercomputing Applications
University of Illinois, Urbana-Champaign
ckerner@illinois.edu    chad.kerner@gmail.com


## Warranty
No warranty. If it breaks, fix it and send me a diff.
