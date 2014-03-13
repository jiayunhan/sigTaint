# $Id: Makefile,v 1.4 2007/07/07 13:41:23 rjones Exp $

PACKAGE := cil-testing
VERSION := 1.1

CC	:= gcc
CFLAGS	:= -Wall -Werror

LIBVIRTDIR := /home/rjones/d/libvirt-cil

OCAMLCFLAGS := 
OCAMLCPACKAGES := -package unix,str,cil

OCAMLOPTFLAGS := $(OCAMLCFLAGS)
OCAMLOPTINCS := $(OCAMLCINCS)
OCAMLOPTPACKAGES := $(OCAMLCPACKAGES)
OCAMLOPTLIBS := -linkpkg

all:	test cilprint ciltest1 cilimportvirt

test:	main.o test1.o
	$(CC) $(CFLAGS) $^ -o $@

cilprint: cilprint.cmx
	ocamlfind ocamlopt $(OCAMLOPTFLAGS) $(OCAMLOPTINCS) $(OCAMLOPTPACKAGES) $(OCAMLOPTLIBS) $^ -o $@

run-cilprint: cilprint test1.i main.i
	@./cilprint

ciltest1: ciltest1.cmx
	ocamlfind ocamlopt $(OCAMLOPTFLAGS) $(OCAMLOPTINCS) $(OCAMLOPTPACKAGES) $(OCAMLOPTLIBS) $^ -o $@

parse: code/parse.cmx
	ocamlfind ocamlopt $(OCAMLOPTFLAGS) $(OCAMLOPTINCS) $(OCAMLOPTPACKAGES) $(OCAMLOPTLIBS) $^ -o $@

run-ciltest1: ciltest1 test1.i main.i
	./ciltest1

cilimportvirt: cilimportvirt.cmx
	ocamlfind ocamlopt $(OCAMLOPTFLAGS) $(OCAMLOPTINCS) $(OCAMLOPTPACKAGES) $(OCAMLOPTLIBS) $^ -o $@

run-cilimportvirt: build-libvirt libvirt-files libvirt-syms cilimportvirt
	./cilimportvirt

build-libvirt:
	if [ ! -f $(LIBVIRTDIR)/Makefile ]; then \
	  cd $(LIBVIRTDIR) && ./autogen.sh; \
	fi
	if [ ! -f $(LIBVIRTDIR)/tests/virshtest.i ]; then \
	  make -C $(LIBVIRTDIR) CC="gcc -save-temps"; \
	  rm -f libvirt-files; \
	fi

libvirt-files:
	find $(LIBVIRTDIR) -name '*.i' | \
	  egrep '/(qemud|src)/' | \
	  egrep -v 'virsh.i' > $@

libvirt-syms:
	egrep -io '\bvir[a-z0-9]+' \
	  < $(LIBVIRTDIR)/src/libvirt_sym.version > $@

# Run the C files through the C preprocessor.

.c.i:
	$(CPP) $< > $@

# Common rules for building OCaml objects.

.mli.cmi:
	ocamlfind ocamlc $(OCAMLCFLAGS) $(OCAMLCINCS) $(OCAMLCPACKAGES) -c $<
.ml.cmo:
	ocamlfind ocamlc $(OCAMLCFLAGS) $(OCAMLCINCS) $(OCAMLCPACKAGES) -c $<
.ml.cmx:
	ocamlfind ocamlopt $(OCAMLOPTFLAGS) $(OCAMLOPTINCS) $(OCAMLOPTPACKAGES) -c $<

# Clean.

clean:
	rm -f *~ *.bak core *.cmi *.cmo *.cmx *.cma *.cmxa *.o *.so *.a code/*.cmi code/*.cmo code/*.cmx code/*.cma code/*.cmxa code/*.a code/*.o\
	  test cilprint *.i ciltest1 *.dot cilimportvirt parse

# Distribution.

dist:
	$(MAKE) check-manifest
	rm -rf $(PACKAGE)-$(VERSION)
	mkdir $(PACKAGE)-$(VERSION)
	tar -cf - -T MANIFEST | tar -C $(PACKAGE)-$(VERSION) -xf -
	tar zcf $(PACKAGE)-$(VERSION).tar.gz $(PACKAGE)-$(VERSION)
	rm -rf $(PACKAGE)-$(VERSION)
	ls -l $(PACKAGE)-$(VERSION).tar.gz

check-manifest:
	@for d in `find -type d -name CVS | grep -v '^\./debian/'`; \
	do \
	b=`dirname $$d`/; \
	awk -F/ '$$1 != "D" {print $$2}' $$d/Entries | \
	sed -e "s|^|$$b|" -e "s|^\./||"; \
	done | sort > .check-manifest; \
	sort MANIFEST > .orig-manifest; \
	diff -u .orig-manifest .check-manifest; rv=$$?; \
	rm -f .orig-manifest .check-manifest; \
	exit $$rv

.SUFFIXES: .c .i .cmo .cmi .cmx .ml .mli

.PHONY:	run-cilprint run-ciltest1 run-cilimportvirt build-libvirt
