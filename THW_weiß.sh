cd symbols
rm -rf THW_Einheiten_weiß
mkdir THW_Einheiten_weiß
cp -r THW_Einheiten/* THW_Einheiten_weiß

rm -rf THW_Fahrzeuge_weiß
mkdir THW_Fahrzeuge_weiß
cp -r THW_Fahrzeuge/* THW_Fahrzeuge_weiß

rm -rf THW_Gebäude_weiß
mkdir THW_Gebäude_weiß
cp -r THW_Gebäude/* THW_Gebäude_weiß

rm -rf THW_Personen_weiß
mkdir THW_Personen_weiß
cp -r THW_Personen/* THW_Personen_weiß

### Einheiten
cd THW_Einheiten_weiß

sed -i '' 's/rect x="10" y="64" width="236" height="128" fill="#003399" stroke="#FFFFFF" stroke-width="10" clip-path="url(#symbol)"/rect x="10" y="64" width="236" height="128" fill="#FFFFFF" stroke="#003399" stroke-width="10" clip-path="url(#symbol)"/g' *.j2
sed -i '' 's/rect x="11" y="65" width="234" height="25" fill="#FFFFFF"/rect x="11" y="65" width="234" height="25" fill="#003399"/g' *.j2
sed -i '' 's/rect x="11" y="166" width="234" height="25" fill="#FFFFFF"/rect x="11" y="166" width="234" height="25" fill="#003399"/g' *.j2

sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px; " fill="#FFFFFF" x="128" y="145"/font-weight: bold; text-anchor: middle; font-size: 48px; " fill="#003399" x="128" y="145"/g' *.j2
# Bugfix
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#FFFFFF" x="128" y="145"/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#003399" x="128" y="145"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: end;" fill="#FFFFFF" x="236" y="180"/font-weight: bold; text-anchor: end;" fill="#003399" x="236" y="180"/g' *.j2

sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px; " fill="#FFFFFF" x="128" y="128"/font-weight: bold; text-anchor: middle; font-size: 48px; " fill="#003399" x="128" y="128"/g' *.j2
# Bugfix
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#FFFFFF" x="128" y="128"/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#003399" x="128" y="128"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: end;" fill="#FFFFFF" x="236" y="160"/font-weight: bold; text-anchor: end;" fill="#003399" x="236" y="160"/g' *.j2
cd ..

### Fahrzeuge
cd THW_Fahrzeuge_weiß

# Fahrzeug-Grundsymbol
sed -i '' 's/d="M10,64 L10,192 L246,192 L246,64 Q128,100 10,64 Z" fill="#003399" stroke-width="10" stroke="#FFFFFF"/d="M10,64 L10,192 L246,192 L246,64 Q128,100 10,64 Z" fill="#FFFFFF" stroke-width="10" stroke="#003399"/g' *.j2

# Boot-Grundsymbol
sed -i '' 's/d="M10,64 l236,0 A118,118 180 0 1 10,64 Z" stroke="#FFFFFF" fill="#003399" stroke-width="10"/d="M10,64 l236,0 A118,118 180 0 1 10,64 Z" stroke="#003399" fill="#FFFFFF" stroke-width="10"/g' *.j2

sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px; " fill="#FFFFFF" x="128" y="145"/font-weight: bold; text-anchor: middle; font-size: 48px; " fill="#003399" x="128" y="145"/g' *.j2
# Bugfix
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#FFFFFF" x="128" y="145"/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#003399" x="128" y="145"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: end;" fill="#FFFFFF" x="236" y="180"/font-weight: bold; text-anchor: end;" fill="#003399" x="236" y="180"/g' *.j2

sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px; " fill="#FFFFFF" x="128" y="128"/font-weight: bold; text-anchor: middle; font-size: 48px; " fill="#003399" x="128" y="128"/g' *.j2
# Bugfix
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#FFFFFF" x="128" y="128"/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#003399" x="128" y="128"/g' *.j2
cd ..

### Gebäude
cd THW_Gebäude_weiß

# Gebäude-Grundsymbol
sed -i '' 's/rect x="10" y="64" width="236" height="128" fill="#003399" stroke="#FFFFFF" stroke-width="10"/rect x="10" y="64" width="236" height="128" fill="#FFFFFF" stroke="#003399" stroke-width="10"/g' *.j2
sed -i '' 's/d="M10 64 L128 16 L246 64" stroke="#FFFFFF" stroke-width="10" fill="#003399"/d="M10 64 L128 16 L246 64" stroke="#003399" stroke-width="10" fill="#FFFFFF"/g' *.j2
#sed -i '' 's/d="M10 64 L10 192 L246 192 L246 64 L128 16 L10 64" stroke="#000000" stroke-width="1" fill="none"/d="M10 64 L10 192 L246 192 L246 64 L128 16 L10 64" stroke="#000000" stroke-width="1" fill="none"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 80px;" fill="#FFFFFF" x="128" y="155"/font-weight: bold; text-anchor: middle; font-size: 80px;" fill="#003399" x="128" y="155"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: end;" fill="#FFFFFF" x="236" y="180"/font-weight: bold; text-anchor: end;" fill="#003399" x="236" y="180"/g' *.j2
cd ..

### Personen
cd THW_Personen_weiß

# Personen-Grundsymbol
sed -i '' 's/d="M69,128 L128,69 L187,128 L128,187 Z" stroke-width="5" stroke="#FFFFFF" fill="#003399"/d="M69,128 L128,69 L187,128 L128,187 Z" stroke-width="5" stroke="#003399" fill="#FFFFFF"/g' *.j2
# Führung
sed -i '' 's/d="M128,64 L152,88 L104,88 Z" stroke-width="0" fill="#FFFFFF"/d="M128,64 L152,88 L104,88 Z" stroke-width="0" fill="#003399"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 32px;" fill="#FFFFFF"/font-weight: bold; text-anchor: middle; font-size: 32px;" fill="#003399"/g' *.j2
# Sonderaufgabe
sed -i '' 's/d="M152,88 L104,88" stroke-width="5" stroke="#FFFFFF"/d="M152,88 L104,88" stroke-width="5" stroke="#003399"/g' *.j2
# Text
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 24px;" fill="#FFFFFF"/font-weight: bold; text-anchor: middle; font-size: 24px;" fill="#003399"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 28px;" fill="#FFFFFF"/font-weight: bold; text-anchor: middle; font-size: 28px;" fill="#003399"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 32px;" fill="#FFFFFF"/font-weight: bold; text-anchor: middle; font-size: 32px;" fill="#003399"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 37px;" fill="#FFFFFF"/font-weight: bold; text-anchor: middle; font-size: 37px;" fill="#003399"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 40px;" fill="#FFFFFF"/font-weight: bold; text-anchor: middle; font-size: 40px;" fill="#003399"/g' *.j2
sed -i '' 's/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#FFFFFF"/font-weight: bold; text-anchor: middle; font-size: 48px;" fill="#003399"/g' *.j2
cd ..

### Neuaufbau
cd ..
make svg