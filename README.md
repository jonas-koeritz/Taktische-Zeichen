[![Build Status](https://travis-ci.org/jonas-koeritz/Taktische-Zeichen.svg?branch=master)](https://travis-ci.org/jonas-koeritz/Taktische-Zeichen) [![CC BY 4.0][cc-by-shield]][cc-by]

# Taktische-Zeichen
Taktische Zeichen für Hilfsorganisationen als Vektorgrafiken.

![Zugführer - THW](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/examples/Zugführer.png)
![Löschzug](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/examples/Löschzug.png)
![Leitstelle](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/examples/Leitstelle.png)
![Gerettete Person](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/examples/Gerettete_Person.png)
![Gefahr durch Explosivstoffe](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/examples/Gefahr_durch_Explosivstoffe.png)
![Zugtrupp - THW](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/examples/Zugtrupp.png)

## Fehlende Zeichen
Fehlende zeichen können als [issue](https://github.com/jonas-koeritz/Taktische-Zeichen/issues) eingereicht werden, Ich erstelle die Symbole dann.

## Aufbau der Symbole
Die .SVG Dateien haben die Maße 256x256 Einheiten, Alle Zeichen müssen in diesem Bereich dargestellt werden und mittig ausgerichtet sein.
Zeichen für Einheiten/Fahrzeuge/Personen etc. müssen untereinander Deckungsgleich sein.
Um die SVG-Dateien zu erzeugen werden Jinja2 Templates verwendet. Das beigefügte Makefile kann verwendet werden um alle SVG-Dateien zu erzeugen:

```
make svg
```

## PNG-Dateien
Die PNG-Dateien stehen in den Maßen 256x256, 512x512 und 1024x1024 zur Verfügung. Die fertigen PNG Dateien können unter [releases](https://github.com/jonas-koeritz/Taktische-Zeichen/releases) heruntergeladen werden.
Die Dateien können auch mit dem beiliegenenden Makefile erstellt werden:

```
make png
```

## Vollständiger Build
Alle SVG- und PNG-Dateien können mit dem beiliegenden Makefile in einem Schritt erzeugt werden:

```
make all
```

Ein Release-Zip Archiv kann ebenfalls erstellt werden:

```
make release
```

## Voraussetzungen
Als Voraussetzung für den Buildvorgang werden die Programme: [j2cli](https://github.com/kolypto/j2cli), [PhantomJS](http://phantomjs.org/), und [optipng](http://optipng.sourceforge.net/) im Systempfad vorausgesetzt. Zum erstellen der SVG-Dateien ist nur j2cli erforderlich.

## Lizenz

[Creative Commons Attribution 4.0 International License][cc-by]

[![CC BY 4.0][cc-by-image]][cc-by]

## Liste der Projekte die diesen Zeichensatz verwenden

* [draw.io Shapes von Martin Böhmer](https://github.com/MartinBoehmer/Taktische-Zeichen-drawio)
* [Taktische Zeichen Vorlagen Generator von Tristan Lins](https://tristanlins.gitlab.io/taktische-zeichen-vorlagen-generator/)

Fehlt dein Projekt auf der Liste? Bitte direkt mit mir Kontakt aufnehmen oder eine Änderung an dieser Datei per Pull-Request einsenden.

## Schriftart
Die verwendete Schriftart ist "RobotoSlab-Bold" lizenziert unter Apache 2.0 Lizenz.


[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg