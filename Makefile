MINERVA=package.mk
include $(MINERVA)
PACKAGEDIR=$(HOME)/.local/share/typst/packages/local/$(PACKAGE)/$(VERSION)
FILES=typst.toml lib img template

.PHONY: install

UPDATE=cp -auL

typst.toml: tmplt/typst.toml $(MINERVA)
	@ sed -e 's/§package§/$(PACKAGE)/g' -e 's/§version§/$(VERSION)/g' -e 's/§typst-version§/$(TYPST-VERSION)/g' $< > $@	

install: $(PACKAGEDIR) $(FILES)
	@ $(UPDATE) $(FILES) $(PACKAGEDIR)
	

$(PACKAGEDIR) : 
	@ mkdir -p $@
