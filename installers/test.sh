go env

if [ $? -ne 0 ]; then
	echo "problem while installing Golang"
        
else
	printf "Golang version ${VERSION} installed.\n"
fi
