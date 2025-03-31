#!/bin/bash
source_d=/home/my/Downloads

destination=/home/my/Documents
timestamp=$(date +"%Y%m%d%H%M%S")
backup_file="backup_$timestamp.tar.gz"
tar -czf $destination/$backup_file $source_d
echo "backup of $source_d completed at $timestamp ">$destination/backup.log
