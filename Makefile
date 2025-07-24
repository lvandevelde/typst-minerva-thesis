VERSION=0.1.3
PACKAGEDIR=$(HOME)/.local/share/typst/packages/local/minerva-thesis/$(VERSION)
FILES=typst.toml lib img template

.PHONY: install

UPDATE=cp -uaPr

install: $(PACKAGEDIR)
	@ $(UPDATE) $(FILES) $(PACKAGEDIR)
	

$(PACKAGEDIR) : 
	@ mkdir -p $@
