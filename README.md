# galera-ha
Small Thin server monitoring Galera cluster members state - useful for HAProxy HTTP check

Temporary install snippet :

```
cp galera-ha.yaml /etc/
cp galera-ha.init /etc/init.d/galera-ha
cp galera-ha /usr/local/bin
bundle install
/etc/init.d/galera-ha start
```
