VERSION=0.1.0
PACKAGEDIR=$(HOME)/.local/share/typst/packages/local/ugentthesis/$(VERSION)
FILES=typst.toml lib img template

.PHONY: install

UPDATE=cp -uaPr

install: $(PACKAGEDIR)
	@ $(UPDATE) $(FILES) $(PACKAGEDIR)
	

$(PACKAGEDIR) : 
	@ mkdir -p $@
