# Installation process
# Based on https://docs.lino.network/tutorial/full_node.html#install-gnu-wget

# Package update
`sudo apt-get install wget make`

# Go install 
`wget https://dl.google.com/go/go1.12.9.linux-amd64.tar.gz`
`sudo tar -xvf go1.12.9.linux-amd64.tar.gz`
`sudo mv go /usr/local`

# Set gopath
`export GOROOT=/usr/local/go`
`export GOPATH=$HOME/go`
`export PATH=$GOPATH/bin:$GOROOT/bin:$PATH`
`source ~/.bashrc`

# Install lino core
`mkdir -p $GOPATH/src/github.com/lino-network/`
`cd $GOPATH/src/github.com/lino-network/`
`git clone https://github.com/lino-network/lino`
`cd lino`
`git checkout v0.6.6`
`make get_tools && make install`

# Run lino 
`/home/ubuntu/go/bin/lino init`
`/home/ubuntu/go/bin/lino start`

# Increase number of connections
ulimit -n 4096

# Create systemd

# Create systemd unit file
echo "[Unit]
Description=Lino Validator
After=network-online.target
[Service]
User=ubuntu
ExecStart=/home/ubuntu/go/bin/lino start 
Restart=always
RestartSec=3
LimitNOFILE=4096
[Install]
WantedBy=multi-user.target" > lino.service

sudo mv lino.service /etc/systemd/system/
sudo systemctl enable lino.service
