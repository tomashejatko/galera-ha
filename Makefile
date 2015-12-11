default:
	install config start

install:
	/usr/sbin/useradd -m --system -s /bin/bash galeraha
	/usr/bin/install -o root -g root -m 755 galera-ha.init /etc/init.d/galera-ha
	/usr/bin/install -o root -g root -m 755 galera-ha /usr/local/bin
	/usr/bin/gem --no-ri --no-rdoc bundler
	/usr/local/bin/bundle install
	/usr/sbin/update-rc.d galera-ha defaults

config:
	/usr/bin/install -o galeraha -g root -m 644 galera-ha.yaml /etc/
start:
	/etc/init.d/galera-ha
