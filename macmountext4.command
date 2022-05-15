#!/bin/zsh

# Locations to check if dependencies are installed:
macfuse_path="/Library/Filesystems/macfuse.fs"
e2label_path="/usr/local/opt/e2fsprogs/sbin/e2label"

# See if macFUSE is installed:
if [[ ! -d $macfuse_path ]]
then
    printf '%s\n' "${(%):-%F{red} X-- Couldn't find macFUSE; exiting. --X${(%):-%f}"
    exit 1
fi

# See if ext4fuse is installed:
if ! command -v ext4fuse &> /dev/null
then
    printf '%s\n' "${(%):-%F{red} X-- Couldn't find ext4fuse; exiting. --X${(%):-%f}"
    exit 1
fi

# See if e2fsprogs is installed; if not, warn user and continue without label support.
if ! command -v $e2label_path &> /dev/null
then
    printf '%s\n' "${(%):-%F{red} X-- Couldn't find e2fsprogs; exiting. --X${(%):-%f}"
    exit 1
fi

# Get and iterate over the list of all system detected disks.
diskutil list | while IFS= read -r line
do
	# For lines which contain the following match pattern:
    if [[ $line =~ "Linux Filesystem.*(disk.*)" ]]
    then
		# Get the label of the disk to be mounted,
        label=$(sudo /usr/local/opt/e2fsprogs/sbin/e2label /dev/$match[1])
        echo "$match[1] partition label read as '$label'..."
		# and mount it with ext4fuse.
        echo "Trying to mount '$label' at /Volumes/$label..."
        if sudo ext4fuse -o allow_other,defer_permissions,volname=$label /dev/$match[1] /Volumes/$label
        then
    	 	printf '%s\n' "${(%):-%F{green} <<- '$label' was successfully mounted. ->>${(%):-%f}"
    	else
            if [[ -d /Volumes/$label ]]
            then
                printf '%s\n' "${(%):-%F{yellow} O-- Skipped mounting '$label'. It may already be mounted. --O${(%):-%f}"
            else
    	 	    printf '%s\n' "${(%):-%F{red} X-- Failed to mount '$label'. --X${(%):-%f}"
            fi
        fi
    fi
done