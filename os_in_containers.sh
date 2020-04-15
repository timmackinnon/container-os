#! /bin/bash

for container in `docker ps --format '{{.Names}}'`; do
   docker exec $container ls /etc/os-release > /dev/null 2>&1
   status=$?
   if [ ${status} -eq 0 ];then
       os_in_container=$(docker exec $container cat /etc/os-release | egrep ^NAME\= | awk -F "=" '{print $2}' | sed -e 's/^"//' -e 's/"$//')
       os_version_id_in_container=$(docker exec $container cat /etc/os-release | egrep ^VERSION_ID\= | awk -F "=" '{print $2}' | sed -e 's/^"//' -e 's/"$//')
       os_version_in_container=$(docker exec $container cat /etc/os-release | egrep ^VERSION\= | awk -F "=" '{print $2}' | sed -e 's/^"//' -e 's/"$//')
       echo "${container} is running ${os_in_container} ${os_version_id_in_container} ${os_version_in_container}"
   else
       echo "${container} is running some rogue os - you may want to dig a bit deeper"
   fi
done
