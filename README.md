# galera-ha
Small Thin server monitoring Galera cluster members state - useful for HAProxy HTTP check

This small (better, it's Thin') Ruby server written to work with HAProxy and ensure High Availability of Galera cluster server (balanced) behind HAProxy.

## Why?
Layer 4 check on HAProxy is not enough. When server comes up and is not provisioned (preparing for SST/IST after outage or when joining the cluster i.e.) L4 (TCP port) is already listening, but machine is incapable of serving data. At this time, HAProxy check is "green", but all commands will fail with some cryptic errors like "Command not found".

##How?
We will run HTTP server (on port 3336 by default) and we will check if our node is already in Synced state, thus have all data in sync and will process our requests, this information is stored in status variable called 'wsrep_local_state_comment', if it's value is 'Synced' we will return HTTP/1.1 200, otherwise HTTP/1.1 504.
Now we can setup HAProxy to make Layer 7 (HTTP) check on Galera nodes, so haproxy.cfg server lines will look somehow like this :
```
  server node1 192.168.110.3:3306  check port 3336 inter 15s fastinter 2s downinter 1s rise 5 fall 3
  server node2 192.168.110.4:3306  backup check port 3336 inter 15s fastinter 2s downinter 1s rise 5 fall 3
  server node3 192.168.110.8:3306  backup check port 3336 inter 15s fastinter 2s downinter 1s rise 5 fall 3
```

You can install it with Makefile :

```
make
make install
make start
```
