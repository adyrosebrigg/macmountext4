#!/bin/zsh

# base64 data for script to install ext4fuse:
rbfile="Y2xhc3MgTWFjRnVzZVJlcXVpcmVtZW50IDwgUmVxdWlyZW1lbnQKICBmYXRhbCB0cnVlCgogIHNhdGlzZnkoYnVpbGRfZW52OiBmYWxzZSkgeyBzZWxmLmNsYXNzLmJpbmFyeV9tYWNfZnVzZV9pbnN0YWxsZWQ/IH0KCiAgZGVmIHNlbGYuYmluYXJ5X21hY19mdXNlX2luc3RhbGxlZD8KICAgIEZpbGUuZXhpc3Q/KCIvdXNyL2xvY2FsL2luY2x1ZGUvZnVzZS9mdXNlLmgiKSAmJgogICAgICAhRmlsZS5zeW1saW5rPygiL3Vzci9sb2NhbC9pbmNsdWRlL2Z1c2UiKQogIGVuZAoKICBlbnYgZG8KICAgIEVOVi5hcHBlbmRfcGF0aCAiUEtHX0NPTkZJR19QQVRIIiwgSE9NRUJSRVdfTElCUkFSWS8iSG9tZWJyZXcvb3MvbWFjL3BrZ2NvbmZpZy9mdXNlIgoKICAgIHVubGVzcyBIT01FQlJFV19QUkVGSVgudG9fcyA9PSAiL3Vzci9sb2NhbCIKICAgICAgRU5WLmFwcGVuZF9wYXRoICJIT01FQlJFV19MSUJSQVJZX1BBVEhTIiwgIi91c3IvbG9jYWwvbGliIgogICAgICBFTlYuYXBwZW5kX3BhdGggIkhPTUVCUkVXX0lOQ0xVREVfUEFUSFMiLCAiL3Vzci9sb2NhbC9pbmNsdWRlL2Z1c2UiCiAgICBlbmQKICBlbmQKCiAgZGVmIG1lc3NhZ2UKICAgICJtYWNGVVNFIGlzIHJlcXVpcmVkLiBQbGVhc2UgcnVuIGBicmV3IGluc3RhbGwgLS1jYXNrIG1hY2Z1c2VgIGZpcnN0LiIKICBlbmQKZW5kCgpjbGFzcyBFeHQ0ZnVzZSA8IEZvcm11bGEKICBkZXNjICJSZWFkLW9ubHkgaW1wbGVtZW50YXRpb24gb2YgZXh0NCBmb3IgRlVTRSIKICBob21lcGFnZSAiaHR0cHM6Ly9naXRodWIuY29tL2dlcmFyZC9leHQ0ZnVzZSIKICB1cmwgImh0dHBzOi8vZ2l0aHViLmNvbS9nZXJhcmQvZXh0NGZ1c2UvYXJjaGl2ZS92MC4xLjMudGFyLmd6IgogIHNoYTI1NiAiNTUwZjFlMTUyYzRkZTdkNGVhNTE3ZWUxYzcwOGY1N2JmZWJiMDg1NjI4MWM1MDg1MTE0MTlkYjQ1YWEzY2E5ZiIKICBsaWNlbnNlICJHUEwtMi4wIgogIGhlYWQgImh0dHBzOi8vZ2l0aHViLmNvbS9nZXJhcmQvZXh0NGZ1c2UuZ2l0IgoKICBib3R0bGUgZG8KICAgIHNoYTI1NiBjZWxsYXI6IDphbnksIGNhdGFsaW5hOiAgICAiNDQ2ZGRlNWU4NGIwNTg5NjZlYWQwY2RlNWUzOGU5NDExZjQ2NTczMjUyN2Y2ZGVjZmExYzBkY2RiZDRhYmJlZiIKICAgIHNoYTI1NiBjZWxsYXI6IDphbnksIG1vamF2ZTogICAgICAiODhjNDkxOGJmNTIxOGY5OTI5NWU1MzlmZTQ0OTkxNTJlZGIzYjYwYjY2NTllNDRkZGQ2OGIyMjM1OWY1MTJhZSIKICAgIHNoYTI1NiBjZWxsYXI6IDphbnksIGhpZ2hfc2llcnJhOiAiZmM2OWM4OTkzYWZkMGZmYzE2YTczYzljMDM2Y2E4ZjgzYzc3YWMyYTE5YjMyMzdmNzZmOWNjZWU4YjMwYmJjOSIKICAgIHNoYTI1NiBjZWxsYXI6IDphbnksIHNpZXJyYTogICAgICAiZmU4YmJlN2NkNTM2MmYwMGZmMDZlZjc1MDkyNmJmMzQ5ZDYwNTYzYzIwYjBlY2YyMTI3Nzg2MzFjODkxMmJhMiIKICAgIHNoYTI1NiBjZWxsYXI6IDphbnksIGVsX2NhcGl0YW46ICAiMjkxMDQ3YzgyMWI3YjIwNWQ4NWJlODUzZmIwMDU1MTBjNmFiMDFiZDRjMmEyMTkzYzE5MjI5OWI2ZjA0OWQzNSIKICAgIHNoYTI1NiBjZWxsYXI6IDphbnksIHlvc2VtaXRlOiAgICAiYjExZjU2NGI3ZTdjMDhhZjBiMGEzZTk4NTQ5NzNkMzk4MDliZjJkOGE1NjAxNGY0ODgyNzcyYjJmNzMwN2FjMSIKICBlbmQKCiAgZGVwZW5kc19vbiAicGtnLWNvbmZpZyIgPT4gOmJ1aWxkCgogIG9uX21hY29zIGRvCiAgICBkZXBlbmRzX29uIE1hY0Z1c2VSZXF1aXJlbWVudCA9PiA6YnVpbGQKICBlbmQKCiAgb25fbGludXggZG8KICAgIGRlcGVuZHNfb24gImxpYmZ1c2UiCiAgZW5kCgogIGRlZiBpbnN0YWxsCiAgICBzeXN0ZW0gIm1ha2UiCiAgICBiaW4uaW5zdGFsbCAiZXh0NGZ1c2UiCiAgZW5kCmVuZA=="

# Locations to check if dependencies are installed:
macfuse_path="/Library/Filesystems/macfuse.fs"
e2label_path="/usr/local/opt/e2fsprogs/sbin/e2label"

# See if Homebrew is installed:
if ! command -v brew &> /dev/null
then
	# If not, install it.
	echo
	echo " ->> Attempting to install Homebrew... <<-"
	if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null
	then
 	   printf '%s\n' "${(%):-%F{green} <<- Successfully installed Homebrew! ->>${(%):-%f}"
 	else
 	   printf '%s\n' "${(%):-%F{red} X-- Failed to install Homebrew; exiting. --X${(%):-%f}"
	   printf '%s\n' "${(%):-%F{red} ( Try visiting https://brew.sh and installing manually. )${(%):-%f}"
	   exit 1
 	fi
fi

# Make sure homebrew is up to date:
echo
echo " ->> Updating Homebrew... <<-"
brew update

# See if macFUSE is installed:
if [[ ! -d $macfuse_path ]]
then
	# If not, install it.
	echo
	echo " ->> Attempting to install macFUSE... <<-"
	if brew install --cask macfuse &> /dev/null
	then
	   printf '%s\n' "${(%):-%F{green} <<- Successfully installed macFUSE! ->>${(%):-%f}"
	else
	   printf '%s\n' "${(%):-%F{red} X-- Failed to install macFUSE; exiting. --X${(%):-%f}"
	   printf '%s\n' "${(%):-%F{red} ( Try visiting https://osxfuse.github.io/ and installing manually. )${(%):-%f}"
	   exit 1
	fi
fi

# See if ext4fuse is installed:
if ! command -v ext4fuse &> /dev/null
then
	# If not, install it.
	echo
	echo " ->> Attempting to install ext4fuse... <<-"
    echo $rbfile | base64 --decode -o ./ext4fuse.rb
	if brew install --formula --build-from-source ./ext4fuse.rb &> /dev/null
	then
        rm ./ext4fuse.rb
	 	printf '%s\n' "${(%):-%F{green} <<- Successfully installed ext4fuse! ->>${(%):-%f}"
	else
        rm ./ext4fuse.rb
	 	printf '%s\n' "${(%):-%F{red} X-- Failed to install ext4fuse; exiting. --X${(%):-%f}"
		printf '%s\n' "${(%):-%F{red} ( Try visiting https://github.com/gerard/ext4fuse and installing manually. )${(%):-%f}"
        exit 1
    fi
fi

# See if e2fsprogs is installed:
if ! command -v $e2label_path &> /dev/null
then
	# If not, install it.
	echo
	echo " ->> Attempting to install e2fsprogs... <<-"
	if brew install e2fsprogs &> /dev/null
	then
 	   printf '%s\n' "${(%):-%F{green} <<- Successfully installed e2fsprogs! ->>${(%):-%f}"
 	else
 	   printf '%s\n' "${(%):-%F{red} X-- Failed to install e2fsprogs; exiting. --X${(%):-%f}"
	   printf '%s\n' "${(%):-%F{red} ( Try visiting https://formulae.brew.sh/formula/e2fsprogs and installing manually. )${(%):-%f}"
	   exit 1
 	fi
fi

echo
echo "All dependencies installed!"
echo 'Press any key to exit...'; read -k1 -s