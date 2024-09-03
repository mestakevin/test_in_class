#!/bin/bash
time_now=$(date)
cur_time=$(date +"%FT%T")
backup_path=backups/src_$cur_time.tar.gz


if [ ! -d "backups" ]
then
    mkdir backups
    echo "'backups' directory has been created "
fi

echo "'backups' directory already exists, tar file will be created"    
tar -czvf src.tar.gz  src
mv src.tar.gz backups
mv backups/src.tar.gz $backup_path
if (( $(ls backups | wc -l) > 3 ))
then
    cd backups
    ls -1 -t | tail -1 | xargs rm
    cd ..
fi
