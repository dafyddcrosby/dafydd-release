name=dafydd-release
version=2
release=1

clean:
	rm -rf $(name).spec *~ 

# Make a spec file out of a spec.in file
%.spec: %.spec.in
	sed -e 's/@VERSION@/$(version)/' -e 's/@RELEASE@/$(release)/' \
	$(name).spec.in > $(name).spec

rpm: clean $(name).spec
	rpmbuild -ba $(name).spec --target=noarch
