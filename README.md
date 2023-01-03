# macmountext4

 A script to automatically mount Linux disks in macOS with ext4fuse.

## Description

I wanted to automount my Linux disk at boot, so I made a little script to do that.

This tool will attempt to mount any volume that's seen by `diskutil` as having a '`Linux Filesystem`'. It does this through [`ext4fuse`](https://github.com/gerard/ext4fuse), a read-only ext4 plugin for [`macFUSE`](https://osxfuse.github.io/).

## Getting Started

### Dependencies

I've included a script to install any dependencies using [`Homebrew`](https://brew.sh/) (including Homebrew itself, if you don't already have it); however you can also install these manually. What's needed:

* macOS (Monterey tested; others tbd.)

* `macFUSE` - for mounting userspace filesystems

* `ext4fuse` - plugin for ext4

* `e2fsprogs` - to read partition labels

### Installing

For now, simply:

* ```shell
  git clone https://github.com/adyrosebrigg/macmountext4.git
  ```
  
  * I might make a release once I flesh this out a little more. We'll see 😊
  
  * I haven't tested this on other systems yet, so I'm not sure how permissions will need to be dealt with. If all else fails, try control-clicking and opening the .command files the first time or running
    
    ```shell
    chmod +x install_deps.command macmountext4.command
    ```

* Then, install any dependencies you need by running `install-deps.command`; it should interactively walk you through the installs. Run this (and later, the main script,) as a normal user; you'll be prompted for a password if necessary.

### Mounting volumes

The main script, `macmountext4.command`, is non-interactive. No arguments are needed; it simply attempts to mount every linux volume it can when you double click the icon or run it with:

```shell
./macmountext4.command
```
If do you want to change the mount path (by default is `/Volumes`), just replace the variable `location` in the `macmountext4.command` file.

It will present some basic info about what's being done; here's what a successful mount looks like:  
![Screen Shot 2022-05-15 at 6 24 43 AM](https://user-images.githubusercontent.com/615609/168471985-c916b028-b51e-4b5b-ac28-7f4ebcc28a79.png)

If something fails, you'll get a bit of info on that too:

![Screen Shot 2022-05-15 at 6 40 32 AM](https://user-images.githubusercontent.com/615609/168471968-11fef435-2085-4c8f-bc39-8edfcb0ebccc.png)

Once your volumes are mounted, they should be available for read-only access at `/Volumes/` or in the Finder.

## Unmounting

- Volumes can be unmounted with the standard `umount` command, or by ejecting them in Finder.

## What's next?

* I want to add a [`launchd`](https://www.launchd.info/) file at some point so this can be configured to autorun at boot; that's a project for another day.

## Authors

little ole me (AdyRosebrigg)

## Version History

* 0.1
  
  * Initial commit

## License

  This project is licensed under the cc0 License - see the LICENSE.md file for details.
