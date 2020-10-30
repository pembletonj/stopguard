# stopguard
Restarts a program if it closes.

## Installation
Run install.sh as root. It will copy stopguard.sh to /usr/local/bin/ and make it executable.

## Usage
stopguard.sh [OPTIONS...] -- [COMMAND] [COMMAND ARGUMENTS...]

### Options
* -a: Restart the program regardless of the exit code. By default, it does not restart if the exit code is 0.

