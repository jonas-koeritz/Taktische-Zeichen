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
Um die SVG-Dateien aus den Templates zu erzeugen wird ein Node.JS Skript verwendet.

`npm run create-svgs`

## PNG-Dateien
Die PNG Dateien stehen in den Maßen 128x128, 256x256, 512x512 und 1024x1024 zur Verfügung. Die fertigen PNG Dateien können unter [releases](https://github.com/jonas-koeritz/Taktische-Zeichen/releases) heruntergeladen werden.
Die Dateien können auch mit dem beiligenenden Node.JS Skript erstellt werden:

`npm run render-all`

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
Die Zeichen können im Rahmen der Apache License 2.0 verwendet werden. Die Datei COPYRIGHT.md darf nur durch Angaben über eigenen Änderungen erweitert werden.
Die Kommerzielle Nutzung ist gestattet, sofern die Copyright Hinweise für den Benutzer klar ersichtlich sind.
Der Druck und die Vervielfältigung von Ausdrucken ist ebenfalls gestattet.
