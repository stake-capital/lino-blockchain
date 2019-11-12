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