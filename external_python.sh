#!/usr/bin/bash
sudo apt-get install build-essential checkinstall

sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev

cd /usr/src

sudo wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz

sudo tar xzf Python-3.7.3.tgz

cd Python-3.7.3

sudo ./configure --enable-optimizations

# make altinstall is used to prevent replacing the default python binary file /usr/bin/python.
sudo make altinstall
