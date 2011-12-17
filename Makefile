name=dafydd-release
version=1
release=3

clean:
	rm -rf $(name).spec *~ 

# Make a spec file out of a spec.in file
%.spec: %.spec.in
	sed -e 's/@VERSION@/$(version)/' -e 's/@RELEASE@/$(release)/' \
	$(name).spec.in > $(name).spec

rpm: $(name).spec
	rpmbuild -ba $(name).spec --target=noarch
