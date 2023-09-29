#!/bin/sh

# Enhanced server health checkup
# Author: Khumoyun Rakhmonberdiev 12194949

echo "======= Server Health Checkup ========"

# Function to check running process
check_running_processes(){
    echo "---- Checking Running Process ----"

    # Top 5CPU-consuming processes
    echo "1. Processes consuming more than 10% CPU:"
    ps aux --sort=-%cpu | awk 'NR<=5 {print $0}'

    # List all running 'java' processes
    echo "2. List all running 'java' processes:"
    ps aux | grep 'java'

    # List all running 'http' processes
    echo "3. List all runnging 'http' processes:"
    ps aux | grep 'http'

    # List all running 'mysql' processes
    echo "4. List all running 'mysql' processes:"
    ps aux | grep 'mysql'

    # Count of all running processes
    echo "5. Total number of running processes:"
    ps -e | wc -l
}

# Function to check CPU utilization
check_cpu_utilization(){
    echo "----- Checking CPU Utilization ------"

    # CPU utilization of critical processes
    echo "1. CPU utilization of critical processes:"
    ps -eo %cpu, command  | egrep '(java|http|mysql)' | awk '$1 > 10 {print $0}'

    # Average cPU load in the last minute
    echo "2. Average CPU load in the last minute:"
    uptime | awk '{print $10}'

    # CPU info
    echo "3. CPU info:"
    lscpu

    # Top 5 CPU-consuming users
    echo "4. Top 5 CPU-consuming users:"
    top -b -b 1 | grep '^%Cpu' | tail -n 5

    # Check CPU core count
    echo "5. CPU core count:"
    nproc
}

# Function to check memory utilization
check_memory_utilization(){
    echo "----- Checking Memory Utilization ------"
    
    # Freeing up cache
    echo "1. Freeing up cache:"
    sync && echo 3 > /proc/sys/vm/drop_caches

    # Display free memory
    echo "2. Display free memory:"
    free -h

    # Display swap usage
    echo "3. Display swap usage:"
    swapon --show

    # Display top 5 memory-consuming processes
    echo "4. top 5 memory-consuming processes:"
    ps aux --sort=-%mem  | awk 'NR<=5 {print $0}'

    # Display available memory in MB
    echo "5. Display available memory in MB:"
    free -m  | awk 'NR==2 {print $7}'

}

# Function to check for zombie processes
check_zombie_processes(){
    echo "---- Checking Zombie Porcesses----"

    # Killing zombie processes
    echo "1. Killing zombie processes:"
    ps aux | awk '$8=="Z" {print "kill -9 " $2}' | sh

    # List all zombie processes
    echo "2. List all zombie processes:"
    ps aux | awk '$8=="Z"'

    # Count zombie processes
    echo "3. Count zombie processes:"
    ps aux | awk '$8=="Z"' | wc -l

    # Parent of zombies
    echo "4. Parent of zombies:"
    ps aux | awk '$8=="Z" {print $3}'

    # User owning zombie processes
    echo "5. User owning zombie processes:"
    ps aux | awk '$8=="Z" {print $1}'
}

# Function to check for load average
check_load_average(){
    echo "---- Checking Load Average ----"

    # Current load average
    echo "1. Current load average:"
    uptime 

    # Load average of the last 5 minutes
    echo "2. Load average of the last 5 minutes:"
    uptime | awk '{print $11}'

    # Load average of the last 15 minutes
    echo "3. Load average of the last 15 minutes:"
    uptime | awk '{print $12}'

    # Number of users currently running processes
    echo "4. Number of users currently running processes:"
    uptime | awk '{print $6}'

    # Number of users currently logged in
    echo "5. Number of users currently logged in:"
    uptime | awk '{print $4}'
}

# Function to check Disk/SAN/NAS utilization
check_disk_utilization(){
    echo "---- Checking Disk/SAN/NAS utilization ----"
    
    # Disk I/O statistics:
    echo "1. Disk I/O statistics:"
    iostat

    # Disk usage
    echo "2. Disk usage:"
    df -h

    # Inode usage
    echo "3. Inode usage:"
    df -i

    # List mounted filesystems
    echo "4. List mounted filesystems:"    
    mount | column -t

    # Display disk partions and size
    echo "5. Display disk partions and sizes:"
    fdisk -l
}

# Main function to call all checks
main(){
    check_running_processes
    check_cpu_utilization
    check_memory_utilization
    check_zombie_processes
    check_load_average
    check_disk_utilization
}

# Execute main function
main
