#!/bin/sh
NOW=`date +%Y-%b-%d@%H-%M-%S`
mkdir /tmp/gitlab_backup_$NOW
tar -czf /tmp/gitlab_backup_$NOW/backup.$NOW.tar.gz REPOSITORIES_PATH
tar -cz /tmp/gitlab_backup_$NOW/ | gpg -e -r --trust-model always YOUR_GPG_KEY_NAME > /tmp/gitlab_backup_.$NOW.tar.zip.gpg
s3cmd put /tmp/gitlab_backup_.$NOW.tar.zip.gpg s3://S3_BACKUPS_BUCKET/gitlab_backup_.$NOW.tar.zip.gpg
rm -R /tmp/gitlab_backup_$NOW
rm /tmp/gitlab_backup_.$NOW.tar.zip.gpg