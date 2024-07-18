#!/bin/bash


source_dir=$1
target_dir=$2
backup_filename="backup_$(date '+%Y-%m-%d__%H-%M-%S')"
echo $backup_filename

function create_backup {

	zip -rq "${target_dir}${backup_filename}.zip" "${source_dir}"

	if [ $? -eq 0 ]; then
		echo "Backup created successfully."
	else
		echo "Backup failed."
	fi
}

function perform_rotation {

	backups=($(ls -t ${target_dir}backup_*.zip))
#	echo "${backups[0]}"
#	echo "${backups[1]}"
	echo "Total files : ${#backups[@]}  "
	echo ${backups[@]}
	echo "---------------------------------------------------------"
	if [ ${#backups[@]} -gt 5 ]; then
		backups_to_be_deleted=(${backups[@]:5})
		echo "Files to be deleted : "
        	echo ${backups_to_be_deleted[@]}
		for file in ${backups_to_be_deleted[@]}
		do
			rm ${file}
			echo "Deleted : ${file} "
		done
		echo "Rotation performed successfully."
		
	else
		echo "You don't have more than 5 backups yet."
	fi
}

create_backup
perform_rotation

