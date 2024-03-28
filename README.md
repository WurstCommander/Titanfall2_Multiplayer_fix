# Titanfall 2 Server Connection Fix for 10th & 11th Gen Intel CPUs

## Overview

Players with 10th and 11th generation Intel CPUs may sometimes see a "Contacting Respawn servers.../Data Center: Searching..." message that persists, preventing them from joining servers in Titanfall 2. This issue is not exclusive to Titanfall 2 and can impact other applications as well.

## Running the Script

To run this script (titanfall2_multifix.ps1) to resolve the server connection issue in Titanfall 2, follow the steps outlined below:

### 1. Run as Administrator

The script needs to be executed with Administrator privileges to make the necessary changes to the enviromental variables. To do this:

- Right-click on PowerShell and select "Run as administrator" or hit Winkey + X, A
- Navigate to the folder containing the script using the `cd` command.
- Execute the script by typing its name and pressing Enter (.\titanfall2_multifix.ps1).

### 2. Modify the Script Path

Before you run the script, it's important to adjust the path to your Titanfall 2 executable (`Titanfall2.exe`) within the script to reflect its location on your system. By default, the script includes the following line:

```powershell
$pathTF2 = "D:\Spiele\Titanfall2\Titanfall2.exe"

About this script:

This Script will change an environment variable, start EA Desktop App and Titanfall 2, remove the environment variable and close.
So you won't have any side effects of constantly have the environment variable active.
