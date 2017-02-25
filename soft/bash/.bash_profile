#run
source ~/.bashrc

echo -e "\n hostname"
hostname
echo -e "\n Users logged in at the same time"
w
echo -e "\n Character code"
echo $LANG
echo -e "\n Disk capacity"
df -h

echo -e "\n Confirming the Discord Bot"
ps ax | grep ruby

