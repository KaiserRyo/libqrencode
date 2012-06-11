ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

#####################################
# Preset make macros go here
#####################################

#===== USEFILE - the file containing the usage message for the application. 
USEFILE=

#===== EXTRA_SILENT_VARIANTS - variants that are not appended to the result binary name (like MyBin_g)
EXTRA_SILENT_VARIANTS+=v7

EXTRA_INCVPATH+=$(PRODUCT_ROOT)
EXTRA_INCVPATH+=$(PRODUCT_ROOT)/..
EXTRA_INCVPATH+=$(PRODUCT_ROOT)/../..

define PINFO
PINFO DESCRIPTION=test_split
endef
INSTALLDIR=usr/bin

NAME=test_split

#ifndef QNX_INTERNAL
#QNX_INTERNAL=../../../../.qnx_internal.mk
#endif
#include $(QNX_INTERNAL)

include $(MKFILES_ROOT)/qtargets.mk

#####################################
# Post-set make macros go here
#####################################

include ../../../rim_postset.mk
