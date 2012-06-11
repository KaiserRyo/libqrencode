# Post-set make macros common to the recursive makefiles

#OPTIMIZE_TYPE_g=none
#OPTIMIZE_TYPE=$(OPTIMIZE_TYPE_$(filter g, $(VARIANTS)))

# Use the QNX build system's $(VARIANT_LIST) to determine whether to use
# debugging libraries, etc.
ifeq ($(CPU),arm)
    ifeq ($(filter g,$(VARIANT_LIST)),g)
      EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../$(CPU)/so-le-v7-g
      LIBS+=QREncoder_g
    else
      # Non-debug build.
      #
      EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../$(CPU)/so-le-v7
      LIBS+=QREncoder
    endif
else
    ifeq ($(CPU),x86)
        ifeq ($(filter g,$(VARIANT_LIST)),g)
          EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../$(CPU)/so-g
          LIBS+=QREncoder_g
        else
          # Non-debug build.
          #
          EXTRA_LIBVPATH+=$(PRODUCT_ROOT)/../$(CPU)/so
          LIBS+=QREncoder
        endif
    endif
endif
