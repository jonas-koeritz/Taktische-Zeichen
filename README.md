# Taktische-Zeichen
Taktische Zeichen für Hilfsorganisationen als Vektorgrafiken.

![Zugführer - THW](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/symbols/THW%20Personen/Zugführer.svg)
![Löschzug](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/symbols/Feuerwehr%20Einheiten/Löschzug.svg)
![Leitstelle](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/symbols/Einrichtungen/Leitstelle.svg)
![Gerettete Person](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/symbols/Personen/Gerettete%20Person.svg)
![Gefahr durch Explosivstoffe](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/symbols/Gefahren/Gefahr%20durch%20Explosivstoffe.svg)
![Brückenbau](https://rawgit.com/jonas-koeritz/Taktische-Zeichen/master/symbols/Maßnahmen/Brückenbau.svg)

## Fehlende Zeichen
Fehlende zeichen können als [issue](https://github.com/jonas-koeritz/Taktische-Zeichen/issues) eingereicht werden, Ich erstelle die Symbole dann.

## Aufbau der Symbole
Die .SVG Dateien haben die Maße 256x256 Einheiten, Alle Zeichen müssen in diesem Bereich dargestellt werden und mittig ausgerichtet sein.
Zeichen für Einheiten/Fahrzeuge/Personen etc. müssen untereinander Deckungsgleich sein, hierbei hilft das System aus Templates und `config.json`.
Um die SVG-Dateien aus den Templates zu erzeugen wird ein Grunt Task verwendet.

```
grunt create-svgs
```

## PNG-Dateien
Die PNG Dateien stehen in den Maßen 128x128, 256x256, 512x512 und 1024x1024 zur Verfügung. Die fertigen PNG Dateien können unter [releases](https://github.com/jonas-koeritz/Taktische-Zeichen/releases) heruntergeladen werden.
Die Dateien können auch mit dem beiligenenden Skript erstellt werden:

```
grunt render-all
```
Als Voraussetzung für das Skript werden die Programme: [wkhtmltoimage](https://wkhtmltopdf.org/), [Imagemagick Version 7](https://www.imagemagick.org/), [optipng](http://optipng.sourceforge.net/) im Systempfad vorausgesetzt.


## Installation mit bower oder npm
Die Symbole können auch über bower und npm bezogen werden. Das Paket heißt jeweils `taktische-zeichen`.

```
bower install taktische-zeichen
```
bzw.
```
npm install --save taktische-zeichen
```

## Lizenz
Die Zeichen können im Rahmen der Apache License 2.0 verwendet werden. Die Datei COPYRIGHT.md darf nur durch Angaben über eigene Änderungen erweitert werden.
Die Kommerzielle Nutzung ist gestattet, sofern die Copyright Hinweise für den Benutzer klar ersichtlich sind, d.h. der Vollständige Inhalt der Datei COPYRIGHT.md muss über die Benutzeroberfläche (bei Anwendungen mit grafischer Benutzeroberfläche) oder im Programmverzeichnis (für Anwendungen ohne grafische Benutzeroberfläche) für jeden Benutzer einsehbar sein.
Der Druck und die Vervielfältigung von Ausdrucken ist ebenfalls gestattet.

## Liste der Projekte die diesen Zeichensatz verwenden

* [draw.io Shapes von Martin Böhmer](https://github.com/MartinBoehmer/Taktische-Zeichen-drawio)

Fehlt ein Projekt auf der Liste? Bitte direkt mit mir Kontakt aufnehmen oder eine Änderung an dieser Datei per Pull-Request einsenden.

## Schriftart
Die verwendete Schriftart ist "Roboto Slab Bold" lizenziert unter Apache 2.0 Lizenz.
