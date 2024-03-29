# Configuration - Path to Titanfall2.exe
$pathTF2 = "D:\Spiele\Titanfall2\Titanfall2.exe"

# Check for administrative privileges
function CheckAdmin {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $isAdmin = (New-Object Security.Principal.WindowsPrincipal $currentUser).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    
    if (!$isAdmin) {
        Write-Host "---------------------------------------------------------------------"
        Write-Host "Administrator rights not found. Please start as an administrator!"
        Write-Host "---------------------------------------------------------------------"
        Pause
        exit
    }
}

# Check if EA Desktop is running
function CheckEARunning {
    $processName = "EADesktop" # Process name without ".exe"
    
    try {
        $process = Get-Process $processName -ErrorAction Stop
        Write-Host "EA Desktop is currently running. Please close it before proceeding."
        exit
    } catch {
        # Process not found, ok to proceed
    }
}

# Wait for Titanfall2 to start
function WaitForTitanfall2ToStart {
    $processName = "Titanfall2" # Process name without ".exe"
    Write-Host "Waiting for Titanfall 2 to start..."
    $isRunning = $false
    
    do {
        Start-Sleep -Seconds 1 # Wait a bit to limit polling
        $process = Get-Process $processName -ErrorAction SilentlyContinue
        if ($process) {
            $isRunning = $true
            Write-Host "Titanfall 2.exe detected."
        }
    } while (!$isRunning)
}

Clear-Host
CheckEARunning
CheckAdmin
Write-Host "------------------------------------------------------------------------------------------------"
Write-Host "Setting OPENSSL_ia32cap environment variable to help Titanfall 2 find multiplayer servers..."
Write-Host "------------------------------------------------------------------------------------------------"
[Environment]::SetEnvironmentVariable("OPENSSL_ia32cap", "~0x200000200000000", "Machine")

# Start Titanfall 2
Write-Host "------------------------------------------------------------------------------------------------"
Write-Host "Environment variable set, launching Titanfall 2..."
Write-Host "------------------------------------------------------------------------------------------------"

Start-Process -FilePath $pathTF2
WaitForTitanfall2ToStart

# Clean up environment variable after game launch
Write-Host "Cleaning up the environment variable..."
[Environment]::SetEnvironmentVariable("OPENSSL_ia32cap", "", "Machine")

exit
