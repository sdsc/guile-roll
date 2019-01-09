NAME           = sdsc-guile
VERSION        = 2.2.4
RELEASE        = 0
PKGROOT        = /opt/guile

SRC_SUBDIR     = guile

SOURCE_NAME    = guile
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

BDWGC_NAME     = gc
BDWGC_SUFFIX   = tar.gz
BDWGC_VERSION  = 8.0.2
BDWGC_PKG      = $(BDWGC_NAME)-$(BDWGC_VERSION).$(BDWGC_SUFFIX)
BDWGC_DIR      = gc-$(BDWGC_VERSION)

TAR_GZ_PKGS    = $(SOURCE_PKG) $(BDWGC_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
