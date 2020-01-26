[![Build Status](https://travis-ci.org/jonas-koeritz/Taktische-Zeichen.svg?branch=master)](https://travis-ci.org/jonas-koeritz/Taktische-Zeichen)

# Taktische-Zeichen
Taktische Zeichen für Hilfsorganisationen als Vektorgrafiken.

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
Die Dateien können auch mit dem beiligenenden Makefile erstellt werden:

```
make png
```

## Vollständiger Build
Alle SVG- und PNG-Dateien können mit dem beiligenden Makefile in einem Schritt erzeugt werden:

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
Die Zeichen können im Rahmen der Apache License 2.0 verwendet werden. Die Datei COPYRIGHT.md darf nur durch Angaben über eigene Änderungen erweitert werden.
Die Datei NOTICE muss in jeder Kopie unverändert beibehalten werden.
Die Kommerzielle Nutzung ist gestattet, sofern die Copyright Hinweise für den Benutzer klar ersichtlich sind, d.h. der Vollständige Inhalt der Datei COPYRIGHT.md muss über die Benutzeroberfläche (bei Anwendungen mit grafischer Benutzeroberfläche) oder im Programmverzeichnis (für Anwendungen ohne grafische Benutzeroberfläche) für jeden Benutzer einsehbar sein.
Der Druck und die Vervielfältigung von Ausdrucken ist ebenfalls gestattet.

## Liste der Projekte die diesen Zeichensatz verwenden

* [draw.io Shapes von Martin Böhmer](https://github.com/MartinBoehmer/Taktische-Zeichen-drawio)
* [Taktische Zeichen Vorlagen Generator von Tristan Lins](https://tristanlins.gitlab.io/taktische-zeichen-vorlagen-generator/)

Fehlt ein Projekt auf der Liste? Bitte direkt mit mir Kontakt aufnehmen oder eine Änderung an dieser Datei per Pull-Request einsenden.

## Schriftart
Die verwendete Schriftart ist "RobotoSlab-Bold" lizenziert unter Apache 2.0 Lizenz.
