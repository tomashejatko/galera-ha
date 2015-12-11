default:
	/usr/sbin/useradd -m --system -s /bin/bash galeraha

install:
	/usr/bin/install -o root -g root -m 755 galera-ha.init /etc/init.d/galera-ha
	/usr/bin/install -o root -g root -m 755 galera-ha /usr/local/bin
	/usr/bin/install -o galeraha -g root -m 644 galera-ha.yaml /etc/
	/usr/bin/gem install --no-ri --no-rdoc bundler
	/usr/local/bin/bundle install
	/usr/sbin/update-rc.d galera-ha defaults

start:
	/etc/init.d/galera-ha
