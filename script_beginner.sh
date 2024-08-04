#!/bin/bash

# Commands printing in scripts:
<<comment
echo "Today's date is : $(date)"
echo "My system's total storage is : $(df -h | awk 'NR==2 {print $2}') and total RAM is : $(free -h | awk 'NR==2 {print $2}')"
comment



# Variables in scripts:
<<comment
rank=1
echo "Rancho ki rank $rank thi"
read -p "Chatur ki rank kya thi? " rank
echo "Chatur ki rank $rank thi"
comment



# Using arguments
<<comment
echo "Raju ki rank $1 thi"
echo "Farhan ki rank $2 thi"
echo "Rancho ki rank $3 thi"
echo "Chatur ki rank $4 thi"
comment



# if else
<<comment
if [ $1 -eq "1" ]; then
	echo "Rancho is topper"
elif [ $2 -eq "1" ]; then
	echo "Chatur is topper"
fi
comment



# Create a new user
<<comment
read -p "Enter new user :  " username
read -p "Enter password for $username : " password
sudo useradd -m $username -p $password
echo "New User $username created successfully"
comment



# Delete a user
<<comment
read -p "Enter name of the user to be deleted :  " username_to_be_deleted
sudo userdel -r $username_to_be_deleted # -r means remove home directory and mail spool.
echo "Username $username_to_be_deleted successfully deleted"
comment



# for loop
<<comment
for (( i=1; i<=10; i++ ))
do
	read -p "Tumhara naam kya he? :  " my_name
	echo "You entered $my_name"
done
comment



# Functions in shell script
<<comment
function create_user {   # function definition
	read -p "Enter new user :  " username
	read -p "Enter password for $username : " password
	sudo useradd -m $username -p $password
	echo "New User $username created successfully"
}

function delete_user {   # function definition
	read -p "Enter name of the user to be deleted :  " username_to_be_deleted
	sudo userdel -r $username_to_be_deleted # -r means remove home directory and mail spool.
	echo "Username $username_to_be_deleted successfully deleted"
}

for (( i=1; i<=5; i++ ))
do
	create_user    # function calling
	echo "Gonna delete the user in parallel....."
	delete_user    # function calling
done
comment



# General information
<<comment
echo "$#" # prints number of arguments
echo "$@" # prints all arguments
echo "$*" # same as @, prints all arguments
comment




# cases in shell scripting
# User Management system
<<comment
function create_user {   # function definition
        read -p "Enter new user :  " username
        read -p "Enter password for $username : " password
        sudo useradd -m $username -p $password
        echo "New User $username created successfully"
}

function delete_user {   # function definition
        read -p "Enter name of the user to be deleted :  " username_to_be_deleted
        sudo userdel -r $username_to_be_deleted # -r means remove home directory and mail spool.
        echo "Username $username_to_be_deleted successfully deleted"
}

case "$1" in    # case in shell scripting
	c)
		echo "Create user in progress..."
		create_user
		;;
	d)
		echo "Delete user in progress..."
		delete_user
		;;
	*)      # Default case
		echo "Match not found"
		;;
esac
comment

<<comment
variable=my_file
echo $variable
echo ${variable}
new_variable=${variable}_$(date '+%Y-%m-%d_%H-%M-%S')
echo $new_variable
comment

# Adding two numbers
<<comment
var1=7
var2=23
echo "Sum of two numbers : $((var1+var2))"
echo "Sum of two numbers : $(($1+$2))"
comment

# Wildcards
<<comment
ls
# a.txt a1.txt a2.txt a3.txt a4.txt a5.txt

ls a*.txt
# a.txt a1.txt a2.txt a3.txt a4.txt a5.txt

ls a?.txt
# a1.txt a2.txt a3.txt a4.txt a5.txt

ls a[2-4].txt
# a2.txt a3.txt a4.txt
comment
