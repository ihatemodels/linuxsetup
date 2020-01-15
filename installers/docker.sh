declare dockers=('docker' 'docker-engine' 'docker.io' 'containerd' 'runc')

function dependencies() {
    apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
}

function repo(){
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"
}

printf "Removing Old Versions...\n"

for i in "${dockers[@]}"; do
    apt remove $i &>/dev/null
done

printf "Getting dependencies...\n"
dependencies &>/dev/null
repo 
apt update &>/dev/null
apt install docker-ce docker-ce-cli containerd.io &>/dev/null
usermod -aG docker $(whoami)
which docker

if [ $? -ne 0 ]; then
	echo "problem whith docker"
        
else
	printf "Docker  installed.\n"
fi