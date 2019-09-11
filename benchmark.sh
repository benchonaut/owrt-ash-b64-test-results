
for testdevice in $(grep -e kernel -e rootfs /proc/mtd |cut -d":" -f1);do 

grep ^$testdevice /proc/mtd
echo raw dd  ;
echo -n size: ; 
expr $(cat /dev/${testdevice}ro |wc -c) "/" 1024  ;
TIMEFORMAT=%Es; time /bin/bash -c "dd if=/dev/${testdevice}ro of=/dev/null bs=1M";
echo raw cat time ;time /bin/bash -c "cat /dev/${testdevice}ro  >/dev/null ";
echo base64 markusfisch;time /bin/bash -c "cat /dev/${testdevice}ro | bash base64_markusfisch.sh >/dev/null ";
echo base64 matezusa ;time /bin/bash -c "cat /dev/${testdevice}ro | bash base64_mateuzsa.sh >/dev/null "

done
