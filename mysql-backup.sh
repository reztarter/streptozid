#!/bin/bash

cd /root/backup/sql-backup

rm ./sql-dump-3.gz

mv sql-dump-2.gz sql-dump-3.gz

mv sql-dump-1.gz sql-dump-2.gz

mv sql-dump-0.gz sql-dump-1.gz

mysqldump --opt -uroot -pyoursqlpassword --all-databases | gzip -c -9 > /root/backup/sql-backup/sql-dump-0.gz
