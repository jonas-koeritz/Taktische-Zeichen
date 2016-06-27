import glob, os
from subprocess import call

try:
	os.mkdir("128x128")
	os.mkdir("256x256")
	os.mkdir("512x512")
	os.mkdir("1024x1024")

except:
	pass

for file in glob.glob("*.svg"):
	filename, ext = os.path.splitext(file)

	# Generate 256x256 image
	call(["wkhtmltoimage", "--transparent", "--quality", "100", "--crop-h", "256", "--crop-w", "256", file, "./256x256/" + filename + ".png"])
	call(["convert", "./256x256/" + filename + ".png", "-resize", "50%", "./128x128/" + filename + ".png"])
	call(["optipng", "./256x256/" + filename + ".png"])
	call(["optipng", "./128x128/" + filename + ".png"])

	# Generate 512x512 image
	call(["wkhtmltoimage", "--transparent", "--quality", "100", "--zoom", "2", "--crop-h", "512", "--crop-w", "512", file, "./512x512/" + filename + ".png"])
	call(["optipng", "./512x512/" + filename + ".png"])

	# Generate 512x512 image
	call(["wkhtmltoimage", "--transparent", "--quality", "100", "--zoom", "4", "--crop-h", "1024", "--crop-w", "1024", file, "./1024x1024/" + filename + ".png"])
	call(["optipng", "./1024x1024/" + filename + ".png"])
