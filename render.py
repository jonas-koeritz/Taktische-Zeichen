import glob, os, sys
from subprocess import call

try:
	os.mkdir("128x128")
	os.mkdir("256x256")
	os.mkdir("512x512")
	os.mkdir("1024x1024")

except:
	pass

if len(sys.argv) == 2:
	filename, ext = os.path.splitext(str(sys.argv[1]))
	call(["wkhtmltoimage", "--transparent", "--quality", "100", "--zoom", "4", "--crop-h", "1024", "--crop-w", "1024", str(sys.argv[1]), "./1024x1024/" + filename + ".png"])
	
	call(["magick", "./1024x1024/" + filename + ".png", "-resize", "50%", "./512x512/" + filename + ".png"])
	call(["magick", "./1024x1024/" + filename + ".png", "-resize", "25%", "./256x256/" + filename + ".png"])
	call(["magick", "./1024x1024/" + filename + ".png", "-resize", "12.5%", "./128x128/" + filename + ".png"])

	call(["optipng", "./1024x1024/" + filename + ".png"])
	call(["optipng", "./512x512/" + filename + ".png"])
	call(["optipng", "./256x256/" + filename + ".png"])
	call(["optipng", "./128x128/" + filename + ".png"])
else:
	for file in glob.glob("*.svg"):
		filename, ext = os.path.splitext(file)

		call(["wkhtmltoimage", "--transparent", "--quality", "100", "--zoom", "4", "--crop-h", "1024", "--crop-w", "1024", str(sys.argv[1]), "./1024x1024/" + filename + ".png"])
	
		call(["magick", "./1024x1024/" + filename + ".png", "-resize", "50%", "./512x512/" + filename + ".png"])
		call(["magick", "./1024x1024/" + filename + ".png", "-resize", "25%", "./256x256/" + filename + ".png"])
		call(["magick", "./1024x1024/" + filename + ".png", "-resize", "12.5%", "./128x128/" + filename + ".png"])

		call(["optipng", "./1024x1024/" + filename + ".png"])
		call(["optipng", "./512x512/" + filename + ".png"])
		call(["optipng", "./256x256/" + filename + ".png"])
		call(["optipng", "./128x128/" + filename + ".png"])
