#!sh
echo "installing shit Docker fucks up hard"
pwd
cd frontend && yarn install --pure-lockfile --network-timeout 1000000 && yarn cache clean
cd ..
go mod download
go get github.com/stretchr/testify/testify
go get github.com/GeertJohan/go.rice/rice
go get github.com/cortesi/modd/cmd/modd
echo "Starting!"
echo "Serving Vue frontend first..."
cd frontend && yarn serve &
echo "Now serving Vue, lets build the golang backend now..."
modd -f dev/modd.conf
