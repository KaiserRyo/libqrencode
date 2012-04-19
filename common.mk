# This is an automatically generated record.
# The area between QNX Internal Start and QNX Internal End is controlled by
# the QNX IDE properties.

ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

#===== USEFILE - the file containing the usage message for the application. 
USEFILE=

#===== EXTRA_SILENT_VARIANTS - variants that are not appended to the result binary name (like MyBin_g)
EXTRA_SILENT_VARIANTS+=v7

include $(MKFILES_ROOT)/qmacros.mk
#===== INSTALL_DIRECTORY - Base directory where builder installs result binary files.
INSTALLDIR=lib

# Append flags from the command-line
CCFLAGS += $(QRENCODER_CCFLAGS)

define PINFO
PINFO name=QREncoder
endef

ifndef QNX_INTERNAL
QNX_INTERNAL=$(PROJECT_ROOT)/.qnx_internal.mk
endif
include $(QNX_INTERNAL)

include $(MKFILES_ROOT)/qtargets.mk

OPTIMIZE_TYPE_g=none
OPTIMIZE_TYPE=$(OPTIMIZE_TYPE_$(filter g, $(VARIANTS)))

