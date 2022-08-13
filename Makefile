# Alle Jinja2 Templates im Ordner symbols finden
SOURCES = $(shell find symbols/ -name *.j2)
TEMPLATE = $(shell find symbols/ -name *.j2t)

# symbols/ prefix entfernen für die Ausgabedateien
TARGET_PATHS = $(SOURCES:symbols/%=%)

# Zieldateien für SVG und PNG Ausgabe festlegen
SVG_TARGETS = $(TARGET_PATHS:.j2=.svg)
PNG_TARGETS = $(TARGET_PATHS:.j2=.png)

SVG_FILES = $(addprefix build/svg/,$(SVG_TARGETS))
PNG_1024_FILES = $(addprefix build/png/1024/,$(PNG_TARGETS))
PNG_512_FILES = $(addprefix build/png/512/,$(PNG_TARGETS))
PNG_256_FILES = $(addprefix build/png/256/,$(PNG_TARGETS))
STICKERS = $(addprefix build/sticker/,$(PNG_TARGETS))

# Erstellt alle SVG Ausgabedateien
svg: $(SVG_FILES)

build/svg/%.svg: symbols/%.j2 $(TEMPLATE)
	mkdir -p $(@D)
	j2 $< -o $@

# Erstellt alle PNG Ausgabedateien
png: $(PNG_1024_FILES) $(PNG_512_FILES) $(PNG_256_FILES)

stickers: $(STICKERS)

build/png/1024/%.png: build/svg/%.svg
	mkdir -p $(@D)
	rsvg-convert -f png -w 1024 -h 1024 -o "$@" "$^"

build/png/512/%.png: build/svg/%.svg
	mkdir -p $(@D)
	rsvg-convert -f png -w 512 -h 512 -o "$@" "$^"

build/png/256/%.png: build/svg/%.svg
	mkdir -p $(@D)
	rsvg-convert -f png -w 256 -h 256 -o "$@" "$^"

build/sticker/%.png: build/png/512/%.png
	mkdir -p $(@D)
	convert $^ -bordercolor none -background white -alpha background -channel A -blur 20 -level 0,0%% $@

clean:
	rm -rf build
	rm Taktische-Zeichen.zip

all: svg png

release: all
	cp LICENSE build/
	cd build && zip -r ../Taktische-Zeichen.zip ./*

ci: all
	cp LICENSE build/
	cd build && zip -r ../release.zip ./*

web: all
	mkdir -p ./web/build
	cp -r ./build/ ./web/
	find build/ -name *.svg > ./web/symbols.lst
