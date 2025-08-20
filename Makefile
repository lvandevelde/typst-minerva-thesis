VERSION=0.2.0
PACKAGEDIR=$(HOME)/.local/share/typst/packages/local/minerva-thesis/$(VERSION)
FILES=typst.toml lib img template

.PHONY: install

UPDATE=cp -uaPr

install: $(PACKAGEDIR)
	@ $(UPDATE) $(FILES) $(PACKAGEDIR)
	

$(PACKAGEDIR) : 
	@ mkdir -p $@
