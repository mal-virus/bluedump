#! /bin/bash
bluetooth=`hcitool inq --flush | grep -v Inquiring | cut -c 2-`

if [ "$bluetooth" ]; then
echo "$bluetooth" | while read line; do
    time=`echo $(($(date +%s%N)/1000000))`
    addr=`echo "$line" | cut -c -17`
    class=`echo "$line" | cut -c 47-`
    name=`hcitool name $addr`
    services=`sdptool browse $addr | grep "Service\ Name" | cut -c 15- | sed -e "s/\(.*\)/\"\1\"/" | paste -s -d,`
    echo "{\"protocol\":\"bluetooth\",\"mac\":\"$addr\",\"class\":\"$class\",\"name\":\"$name\",\"timestamp\":$time,\"services\":[$services]}" >> /var/log/bluedump/bluetooth.log
done
fi
