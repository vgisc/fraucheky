# Fraucheky make rules.

ifneq ($(BFDNAME_OBJ),)
ARG_BFDNAME = -O $(BFDNAME_OBJ)
endif

ifneq ($(BFDARCH),)
ARG_BFDARCH = -B $(BFDARCH)
endif

OBJCOPY_BINARY_DATA=$(OBJCOPY) -I binary $(ARG_BFDNAME) $(ARG_BFDARCH) \
	--rename-section .data=.rodata.file,alloc,load,readonly,data,contents

$(BUILDDIR)/COPYING.o: COPYING
	$(OBJCOPY_BINARY_DATA) $< $@

$(BUILDDIR)/README.o: README
	$(OBJCOPY_BINARY_DATA) $< $@

$(BUILDDIR)/INDEX.o: INDEX
	$(OBJCOPY_BINARY_DATA) $< $@

distclean::
	-rm -f README INDEX COPYING \
	       fraucheky-vid-pid-ver.c.inc fraucheky-usb-strings.c.inc disk-on-rom.h
