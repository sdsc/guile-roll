# Get the guile version from its version.mk file. See Makefile
VERSION.MK.MASTER = version.mk
VERSION.MK.MASTER.DIR = ../guile
VERSION.MK.INCLUDE = guile.version.mk
include $(VERSION.MK.INCLUDE)

NAME       = guile-modules
RELEASE    = 0

RPM.EXTRAS = AutoReq:No
