#! /bin/bash
# Make Instance Ready for Remote Desktop or RDP
apt-get update
rm -rf win7.qcow2 win7 win7.gz ngrok ngrok.zip ng.sh > /dev/null 2>&1
echo "Download windows files"
wget -O win7.gz https://go.aank.me/win/w7.qcow2.gz
gunzip win7.gz
echo "Wait..."
echo "I m Working Now.."
mv win7 win7.qcow2
clear
echo "======================="
echo choose ngrok region
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
./ngrok tcp --region ap 3388 &>/dev/null &
clear
echo Downloading files from aank.me
apt-get install qemu-system-x86 -y
echo "Wait..."
echo "Starting Windows 7"
qemu-system-x86_64 -hda win7.qcow2 -m 8G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/de>
clear
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo "Username: aank"
echo "Password: Lingg@H0sting"
