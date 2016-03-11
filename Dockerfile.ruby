FROM quay.io/travisci/travis-ruby

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D ;\
    echo "deb https://apt.dockerproject.org/repo ubuntu-precise main" |tee /etc/apt/sources.list.d/docker.list ;\
    apt-get update ;\
    echo "#!/bin/sh\nexit 101\nEOF" > /usr/sbin/policy-rc.d ;\
    chmod 755 /usr/sbin/policy-rc.d ;\
    apt-get install docker-engine ;\
    rm -f /usr/sbin/policy-rc.d
