NAME        = guile-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/compilers/guile

VERSION_SRC = $(REDHAT.ROOT)/src/guile/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
