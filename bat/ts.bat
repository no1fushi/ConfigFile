net stop w32time
net start w32time
w32tm /config /syncfromflags:manual /manualpeerlist:ntp.jst.mfeed.ad.jp /update
w32tm /resync