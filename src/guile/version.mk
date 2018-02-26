NAME           = sdsc-guile
VERSION        = 2.0.11
RELEASE        = 4
PKGROOT        = /opt/guile

SRC_SUBDIR     = guile

SOURCE_NAME    = guile
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

BDWGC_NAME     = bdwgc
BDWGC_SUFFIX   = tar.gz
BDWGC_VERSION  = 7.2alpha7
BDWGC_PKG      = $(BDWGC_NAME)-$(BDWGC_VERSION).$(BDWGC_SUFFIX)
BDWGC_DIR      = $(BDWGC_PKG:%.$(BDWGC_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG) $(BDWGC_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
