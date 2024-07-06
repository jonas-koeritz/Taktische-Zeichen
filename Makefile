# Alle Jinja2 Templates im Ordner symbols finden
SOURCES = $(shell find symbols/ -name *.j2)
#TEMPLATE = $(shell find symbols/ -name *.j2t)

# symbols/ prefix entfernen für die Ausgabedateien
TARGET_PATHS = $(SOURCES:symbols/%=%)

# Zieldateien für SVG und PNG Ausgabe festlegen
SVG_TARGETS = $(TARGET_PATHS:.j2=.svg)
PNG_TARGETS = $(TARGET_PATHS:.j2=.png)

SVG_FILES = $(addprefix build/svg/,$(SVG_TARGETS))
SVG_PRINT_FILES = $(addprefix build/print/svg/,$(SVG_TARGETS))
PNG_1024_FILES = $(addprefix build/png/1024/,$(PNG_TARGETS))
PNG_512_FILES = $(addprefix build/png/512/,$(PNG_TARGETS))
PNG_256_FILES = $(addprefix build/png/256/,$(PNG_TARGETS))
PNG_PRINT_1024_FILES = $(addprefix build/print/png/1024/,$(PNG_TARGETS))
PNG_PRINT_512_FILES = $(addprefix build/print/png/512/,$(PNG_TARGETS))
PNG_PRINT_256_FILES = $(addprefix build/print/png/256/,$(PNG_TARGETS))
STICKERS = $(addprefix build/sticker/,$(PNG_TARGETS))

# Erstellt alle SVG Ausgabedateien
svg: $(SVG_FILES)
print: $(SVG_PRINT_FILES)

build/svg/%.svg: symbols/%.j2 
#$(TEMPLATE)
	mkdir -p $(@D)
	j2 $< themes/default.json -o $@

build/print/svg/%.svg: symbols/%.j2 $(TEMPLATE)
	mkdir -p $(@D)
	j2 $< themes/print.json -o $@

# Erstellt alle PNG Ausgabedateien
png: $(PNG_1024_FILES) $(PNG_512_FILES) $(PNG_256_FILES)
png_print: $(PNG_PRINT_1024_FILES) $(PNG_PRINT_512_FILES) $(PNG_PRINT_256_FILES)

stickers: $(STICKERS)

build/png/1024/%.png: build/svg/%.svg
	mkdir -p $(@D)
	unshare --user inkscape -w 1024 -h 1024 $^ -o $@ > /dev/null
	optipng $@
	
build/print/png/1024/%.png: build/print/svg/%.svg
	mkdir -p $(@D)
	unshare --user inkscape -w 1024 -h 1024 $^ -o $@ > /dev/null
	optipng $@

build/png/512/%.png: build/svg/%.svg
	mkdir -p $(@D)
	unshare --user inkscape -w 512 -h 512 $^ -o $@ > /dev/null
	optipng $@

	
build/print/png/512/%.png: build/print/svg/%.svg
	mkdir -p $(@D)
	unshare --user inkscape -w 512 -h 512 $^ -o $@ > /dev/null
	optipng $@

build/png/256/%.png: build/svg/%.svg
	mkdir -p $(@D)
	unshare --user inkscape -w 256 -h 256 $^ -o $@ > /dev/null
	optipng $@
	
build/print/png/256/%.png: build/print/svg/%.svg
	mkdir -p $(@D)
	unshare --user inkscape -w 256 -h 256 $^ -o $@ > /dev/null
	optipng $@


build/sticker/%.png: build/png/512/%.png
	mkdir -p $(@D)
	convert $^ -bordercolor none -background white -alpha background -channel A -blur 20 -level 0,0%% $@

clean:
	rm -rf build
	rm Taktische-Zeichen.zip

all: svg print png png_print

release: all
	cd build && zip -r ../Taktische-Zeichen.zip ./*

ci: all
	cd build && zip -r ../release.zip ./*

web: all
	mkdir -p ./web/build
	cp -r ./build/ ./web/
	find build/ -name *.svg > ./web/symbols.lst
