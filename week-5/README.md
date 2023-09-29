# Server Health Checkup Readme

This Bash script, named `server_health_checkup.sh`, is designed to perform a comprehensive health checkup on a server. It checks various aspects of server performance and provides valuable information for monitoring and troubleshooting. The script is authored by Khumoyun Rakhmonberdiev (Student ID: 12194949).

## Table of Contents
1. [Introduction](#introduction)
2. [Usage](#usage)
3. [Functions](#functions)
    - [Check Running Processes](#check-running-processes)
    - [Check CPU Utilization](#check-cpu-utilization)
    - [Check Memory Utilization](#check-memory-utilization)
    - [Check Zombie Processes](#check-zombie-processes)
    - [Check Load Average](#check-load-average)
    - [Check Disk/SAN/NAS Utilization](#check-disksannas-utilization)

## Introduction <a name="introduction"></a>

The server health checkup script is a versatile tool for monitoring and diagnosing server performance. It provides insights into various system metrics, including running processes, CPU and memory utilization, zombie processes, load averages, and disk storage. This information is crucial for maintaining the stability and efficiency of a server.

## Usage <a name="usage"></a>

To use the script, follow these steps:

1. **Download the Script**: Download the `server_health_checkup.sh` script to your server.

2. **Make the Script Executable**: Ensure that the script is executable by running the following command:

   ```bash
   chmod +x server_health_checkup.sh
   ```

3. **Run the Script**: Execute the script using the following command:

   ```bash
   ./server_health_checkup.sh
   ```

4. **Review the Output**: The script will perform various checks and display the results on your terminal.

## Functions <a name="functions"></a>

The script is organized into several functions, each responsible for a specific category of health checks.

### Check Running Processes <a name="check-running-processes"></a>

This function examines running processes and provides information about CPU-consuming processes, running 'java,' 'http,' and 'mysql' processes, as well as the total number of running processes.

### Check CPU Utilization <a name="check-cpu-utilization"></a>

This function checks CPU utilization and provides details on critical processes consuming CPU, average CPU load over the last minute, CPU information, top CPU-consuming users, and the CPU core count.

### Check Memory Utilization <a name="check-memory-utilization"></a>

This function focuses on memory utilization and includes tasks like freeing up cache, displaying free memory, showing swap usage, listing the top 5 memory-consuming processes, and displaying available memory in MB.

### Check Zombie Processes <a name="check-zombie-processes"></a>

The zombie processes function deals with identifying and handling zombie processes. It includes killing zombie processes, listing all zombie processes, counting zombie processes, identifying parent processes of zombies, and listing the users owning zombie processes.

### Check Load Average <a name="check-load-average"></a>

This function checks the server's load average and reports the current load average, load averages over the last 5 and 15 minutes, the number of users currently running processes, and the number of users currently logged in.

### Check Disk/SAN/NAS Utilization <a name="check-disksannas-utilization"></a>

This function examines disk, SAN, and NAS utilization. It provides information on disk I/O statistics, disk usage, inode usage, a list of mounted filesystems, and displays disk partitions and sizes.

## Conclusion

The `server_health_checkup.sh` script is a valuable tool for server administrators and system operators. Regularly monitoring server health is essential for ensuring optimal performance and diagnosing potential issues before they impact your services. Use this script to gain insights into your server's health and make informed decisions about maintenance and optimization.