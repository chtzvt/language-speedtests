#!/bin/bash

# Records execuion times of GPF.

# Prime.c  Prime.java  Prime.js  Prime.py  Prime.rb

# Collect system and language information.

OS="$(uname -a)"
if [[ "$(uname -a | grep Linux)" == "" ]]
then
	CPU=$(sysctl -n machdep.cpu.brand_string)
	C="$(gcc --version 2>&1 | tail -n +2)" &> /dev/null 2>&1
else
	CPU=$(lscpu)
	C="$(gcc --version 2>&1 | grep gcc)" &> /dev/null 2>&1
fi

JAVA="$(java -version 2>&1)"
PYTHON="$(python3 --version 2>&1)"
RUBY="$(ruby --version 2>&1)"
NODE="$(node --version 2>&1)"
GO="$(go version 2>&1)"
CBAT="2a6d82bcd15f3160203ad716eadbe8050ae44d73" # HEAD

echo -e "

---------------------------------
`date +'%A %b %d %Y %r'`:
---------------------------------

System information:
	   OS:
		`echo $OS`

 	   CPU:
		`echo $CPU`


Language versions:
	C:
		`echo $C`
	Java:
		`echo $JAVA`
	Python:
		`echo $PYTHON`
	Ruby:
		`echo $RUBY`
	NodeJS:
		`echo $NODE`
	Go:
		`echo $GO`
	CBAT:
		`echo $CBAT`
"

echo "Testing C..."
(time ./bin/Prime.c)
echo -e "\n"

echo "Testing Java..."
cd ./bin
(time java Prime)
cd ..
echo -e "\n"

echo "Testing Python..."
(time python3 ./src/Prime.py)
echo -e "\n"

echo "Testing Ruby..."
(time ruby --yjit ./src/Prime.rb)
echo -e "\n"

echo "Testing JavaScript..."
(time node ./src/Prime.js)
echo -e "\n"

echo "Testing Go..."
(time ./bin/Prime.go)
echo -e "\n"

echo "Testing CBAT..."
cd ~/Developer/BBS_VM/cbat/
(time ruby exec.rb /tmp/language-speedtests/src/Prime.cbat)
echo -e "\n"

echo -e "Testing complete! \n-----------------"

