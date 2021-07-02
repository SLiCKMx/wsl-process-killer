# wsl-process-killer
A simple utility for killing running Windows processes from within WSL. Runs batch command `taskkill` with its `/F` and `/IM` parameters. 

Usage:
```
kill.sh [PROCESS_NAME]
```
with `PROCESS_NAME` being the name of the Windows process barring its `.exe` suffix.

Example:
```
./kill.sh chrome
./kill.sh spotify
```
