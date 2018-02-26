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

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.

The guile build process requires a number of other packages be installed on the
build system, including the gmp, libffi, and libunistring libraries, as well as
the latest versions of autoconf/make, binutils, and texinfo.  All these packages
are included in SDSC's gnucompiler and gnutools rolls.


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
```

Subsequent installs of compute and login nodes will then include the contents
of the guile-roll.  To avoid cluttering the cluster frontend with unused
software, the guile-roll is configured to install only on compute and
login nodes. To force installation on your frontend, run this command after
adding the guile-roll to your distro

```shell
% rocks run roll guile host=NAME | bash
```

where NAME is the DNS name of a compute or login node in your cluster.

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
