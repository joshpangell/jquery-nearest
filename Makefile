SRC = src/jquery.nearest.js
MIN = src/jquery.nearest.min.js
VERSION = $(shell cat VERSION.txt)

install:
	npm install -g uglifyjs

uglify:
	@uglifyjs $(SRC) -c -m --comments '/^\!/' > $(MIN)

version:
	@sed -i '' 's/\("version": \)"\(.*\)"/\1"$(VERSION)"/g' *.json
	@sed -i '' 's/\(plugin v\).*$\/\1$(VERSION)/' src/*.js

.PHONY: uglify