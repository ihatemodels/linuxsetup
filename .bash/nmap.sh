## -oN Output Normal
# -sS TCP SYN scan
# -sT Connect scan
# -sA ACK scan
# -sW Window scan
# -sM Maimon scan


function sscan() {
    nmap -A -sV -sC -v -oN "$1-scan.nmap" $1
}

function pscan() {
    nmap -sP -oN "$1-ping-scan.nmap" "$1/24"
}

function stscan() {
    sudo nmap -v -sS -A -T4 -oN "$1-st-scan.nmap" $1 
}