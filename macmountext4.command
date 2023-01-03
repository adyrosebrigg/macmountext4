#!/bin/zsh

# Mount point path
location="/Volumes"

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

# Locations to check if dependencies are installed:
macfuse_path="/Library/Filesystems/macfuse.fs"
e2label_path="/usr/local/opt/e2fsprogs/sbin/e2label"

# See if macFUSE is installed:
if [[ ! -d $macfuse_path ]]; then
  printf "$RED%s$NC\n" "X-- Couldn't find macFUSE; exiting. --X"
  exit 1
fi

# See if ext4fuse is installed:
if ! command -v ext4fuse &>/dev/null; then
  printf "$RED%s$NC\n" "X-- Couldn't find ext4fuse; exiting. --X"
  exit 1
fi

# See if e2fsprogs is installed; if not, warn user and continue without label support.
if ! command -v $e2label_path &>/dev/null; then
  printf "$RED%s$NC\n" "X-- Couldn't find e2fsprogs; exiting. --X"
  exit 1
fi

# Get and iterate over the list of all system detected disks.
diskutil list | while IFS= read -r line; do
  # For lines which contain the following match pattern:
  if [[ $line =~ Linux\ Filesystem.*(disk.*) ]]; then
    # Get the label of the disk to be mounted,
    label=$(sudo /usr/local/opt/e2fsprogs/sbin/e2label "/dev/${match[1]}")
    echo "${match[1]} partition label read as '$label'..."
    # and mount it with ext4fuse.
    echo "Trying to mount '$label' at $location/$label..."
    if sudo ext4fuse -o allow_other,defer_permissions,volname="$label" "/dev/${match[1]}" "$location/$label"; then
      printf "$GREEN%s$NC\n" "<<- '$label' was successfully mounted. ->>"
    else
      if [[ -d $location/$label ]]; then
        printf "$YELLOW%s$NC\n" "O-- Skipped mounting '$label'. It may already be mounted. --O"
      else
        printf "$RED%s$NC\n" "X-- Failed to mount '$label'. --X"
      fi
    fi
  fi
done
