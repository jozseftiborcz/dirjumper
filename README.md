# dirjumper
Bash directory traversal for easy navigation between directories.

## Problem to solve
During programming and system administration one should navigate between different and "far-away" directories. Typically you have two options to navigate from one place to another: use absolute path or relative starting where you are now.

But this is cumbersome if target directory is both very far from root and starting directory. 

dirjumper tries to help in this situation.

## Installation

### Prerequisite
Python 2
 
### Configuration

1. Put dirjumper to a directory which is on the search path (eg. ~/bin)
1. Add dirjumper.sh to your bash startup script or run ''source dirjumper.sh''. This will create dj command.

## Usage

There are two commands: ''dj'' to replace command ''cd'' and ''dirjumper'' to manage dirjumper cache. dirjumper is also used by dj. dirjumper commands has the following format
```
dirjumper - <command name> <optional parameters+>
```

Commands are:
init: initialize .dirjumper cache in the current directory
discover: list available caches from the current directory up to root. If no cache is found it will try ~/.dirjumper too.
scan: add subdirectories to the closest cache
complete: propose directory base name candidates based on prefixes (eg. dirjumper - complete var log 
default: print help

To start using dirjumper you should initialize dirjumper cache file with command
```
dirjumper - init
```
This will create a file named .dirjumper.

Then in directories issue 
```
dirjumper - scan
```

After that you can navigate between scanned directories by using directory names along the scanned directory paths. For examples suppose you scanned ''/var'', then you can jump to ''/var/log/audit'' by typing ''dj var audit''. dj supports bash completion for directory names. If you add more than one directory name to dj then each prefix narrows the list of candidate directories to those of which path end with matching directory path plus their subdirectories.

If there are more than one candidate dj shows the options.

Dash has a special meaning as prefix: it will jump to the shortest matching candidate.

### Some examples 
```
scanned directories (showed only leafs):
/root/aaa/bb/cc/dd
/root/aaa/bbb/cc/dd
/root/aaa/bbb/ccc/dd
/root/eee/bb/cc/dd
/root/eee/bbb/cc/dd
/root/eee/bbb/ccc/dd

dj dd -> shows 6 candidates
dj ccc -> shows 2 candidates
dd aaa ccc -> jumps to /root/aaa/bbb/ccc
dj dd - -> will jump to /root/aaa/bb/cc/dd 
```

## License

Copyright © 2017 József Tiborcz 

Distributed under the Apache 2.0 license. See the file LICENSE.


