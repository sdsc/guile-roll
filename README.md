# SDSC "guile" roll

## Overview

This roll bundles the GNU scheme compiler/interpreter, guile.  For more
information about guile, please visit
<a href="https://www.gnu.org/software/guild/guile.html">the project web page</a>.

## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

The guile build process requires a number of other GNU packages be installed
on the build system, including the bdwgc, libffi and libunistring libraries,
as well as the latest versions of autoconf/make, binutils, and texinfo.  All
these GNU packages are included in SDSC's gnutools roll.

## Building

To build the guile-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `guile-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.

If a "gnu" environment module is available on the system, the roll loads it
before building each software package.

## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll guile
% cd /export/rocks/install
% rocks create distro
% rocks run roll guile | bash
```

In addition to the software itself, the roll installs guile environment
module files in:

```shell
/opt/modulefiles/compilers/guile
```


## Testing

The guile-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/guile.t 
```
