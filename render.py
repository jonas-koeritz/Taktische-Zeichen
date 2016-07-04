import glob, os, sys
from subprocess import call

def render_raster_images(svg_file):
	create_output_folders()

	filename, ext = os.path.splitext(str(svg_file))
	
	call(["wkhtmltoimage", "--transparent", "--quality", "100", "--zoom", "4", "--crop-h", "1024", "--crop-w", "1024", str(svg_file), "./1024x1024/" + filename + ".png"])
	
	call(["magick", "./1024x1024/" + filename + ".png", "-resize", "50%", "./512x512/" + filename + ".png"])
	call(["magick", "./1024x1024/" + filename + ".png", "-resize", "25%", "./256x256/" + filename + ".png"])
	call(["magick", "./1024x1024/" + filename + ".png", "-resize", "12.5%", "./128x128/" + filename + ".png"])

	call(["optipng", "./1024x1024/" + filename + ".png"])
	call(["optipng", "./512x512/" + filename + ".png"])
	call(["optipng", "./256x256/" + filename + ".png"])
	call(["optipng", "./128x128/" + filename + ".png"])


def create_output_folders():
	try:
		os.mkdir("128x128")
		os.mkdir("256x256")
		os.mkdir("512x512")
		os.mkdir("1024x1024")
	except:
		pass

def create_magnet_svg(svg_file):
	with open('Magnet.svg', 'r') as magnet:
		template = magnet.read()
		with open(str(svg_file), 'r') as symbol:
			symbol_data = symbol.read()
			symbol_data = symbol_data.replace('<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">', "")
			magnet_data = template.replace('%SYMBOL%', symbol_data)

			filename, ext = os.path.splitext(svg_file)
			with open(filename + " - Magnet.svg", 'w') as output_file:
				output_file.write(magnet_data)

def render_all():
	for file in glob.glob("*.svg"):
		filename, ext = os.path.splitext(file)

		call(["wkhtmltoimage", "--transparent", "--quality", "100", "--zoom", "4", "--crop-h", "1024", "--crop-w", "1024", file, "./1024x1024/" + filename + ".png"])
	
		call(["magick", "./1024x1024/" + filename + ".png", "-resize", "50%", "./512x512/" + filename + ".png"])
		call(["magick", "./1024x1024/" + filename + ".png", "-resize", "25%", "./256x256/" + filename + ".png"])
		call(["magick", "./1024x1024/" + filename + ".png", "-resize", "12.5%", "./128x128/" + filename + ".png"])

		call(["optipng", "./1024x1024/" + filename + ".png"])
		call(["optipng", "./512x512/" + filename + ".png"])
		call(["optipng", "./256x256/" + filename + ".png"])
		call(["optipng", "./128x128/" + filename + ".png"])

def create_all_magnet_svg():
	for file in glob.glob("*.svg"):
		filename, ext = os.path.splitext(file)
		filename = filename.lower()
		if "magnet" not in filename and "führer" not in filename:
			if "fgr" in filename:
				print("Erzeuge Magnet-SVG fuer '" + file + "'")
				create_magnet_svg(file)
			elif "gruppe" in filename:
				print("Erzeuge Magnet-SVG fuer '" + file + "'")
				create_magnet_svg(file)
			elif "zug" in filename:
				print("Erzeuge Magnet-SVG fuer '" + file + "'")
				create_magnet_svg(file)
			elif "einheit" in filename:
				print("Erzeuge Magnet-SVG fuer '" + file + "'")
				create_magnet_svg(file)

if len(sys.argv) == 3:
	action = str(sys.argv[1]).lower()
	print("Running action " + action + " on file '" + str(sys.argv[2]) + "'")
	if action == "render":
		render_raster_images(sys.argv[2])
	elif action == "magnet":
		create_magnet_svg(sys.argv[2])
elif len(sys.argv) == 2:
	action = str(sys.argv[1]).lower()
	print("Running action " + action)
	if action == "all-magnets":
		create_all_magnet_svg()
	elif action == "render-all":
		render_all()