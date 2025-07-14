VERSION=0.1.0
PACKAGEDIR=$(HOME)/.local/share/typst/packages/local/ugentthesis/$(VERSION)
FILES=typst.toml lib img

.PHONY: install

UPDATE=cp -uaPr

install: $(PACKAGEDIR)/lib 
	@ $(UPDATE) $(FILES) $(PACKAGEDIR)
	

$(PACKAGEDIR)/lib: 
	@ mkdir -p $@
