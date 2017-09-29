var fs = require('fs');
var path = require('path');
var spawn = require('child_process').spawn;
var spawnSync = require('child_process').spawnSync;

var async = require('async');

var Handlebars = require('handlebars');

var action = "create-svgs"
var config = JSON.parse(fs.readFileSync(process.argv[2]));

if(process.argv.length == 4) {
	action = process.argv[3];
}

switch(action) {
	case "create-svgs":
		createSVGs();
		break;
	case "render-all":
		renderAll();
		break;
}

function renderAll() {
	if (!fs.existsSync(path.join(__dirname, "128x128"))) {
		fs.mkdirSync(path.join(__dirname, "128x128"));
	}
	if (!fs.existsSync(path.join(__dirname, "256x256"))) {
		fs.mkdirSync(path.join(__dirname, "256x256"));
	}
	if (!fs.existsSync(path.join(__dirname, "512x512"))) {
		fs.mkdirSync(path.join(__dirname, "512x512"));
	}
	if (!fs.existsSync(path.join(__dirname, "1024x1024"))) {
		fs.mkdirSync(path.join(__dirname, "1024x1024"));
	}

	var jobs = [];


	for(var i = 0; i < config.sets.length; i++) {
		var set = config.sets[i];
		var data = set;

		if(!fs.existsSync(path.join(__dirname, '1024x1024', set.name))) {
			fs.mkdirSync(path.join(__dirname, '1024x1024', set.name));
		}
		if(!fs.existsSync(path.join(__dirname, '512x512', set.name))) {
			fs.mkdirSync(path.join(__dirname, '512x512', set.name));
		}
		if(!fs.existsSync(path.join(__dirname, '256x256', set.name))) {
			fs.mkdirSync(path.join(__dirname, '256x256', set.name));
		}
		if(!fs.existsSync(path.join(__dirname, '128x128', set.name))) {
			fs.mkdirSync(path.join(__dirname, '128x128', set.name));
		}

		for(var x = 0; x < set.symbols.length; x++) {
			var symbol = set.symbols[x];

			for(var variant in symbol.variants) {

				jobs.push({
					svgFile: path.join(__dirname, 'symbols', set.name, symbol.variants[variant] + ".svg"),
					pngFile: path.join(__dirname, '1024x1024', set.name, symbol.variants[variant] + ".png"),
					png512File: path.join(__dirname, '512x512', set.name, symbol.variants[variant] + ".png"),
					png256File: path.join(__dirname, '256x256', set.name, symbol.variants[variant] + ".png"),
					png128File: path.join(__dirname, '128x128', set.name, symbol.variants[variant] + ".png")
				});
			}
		}
	}

	async.eachLimit(jobs, 10, function(job, callback) {	
				console.log("Rendering " + job.svgFile + " -> " + job.pngFile);
				var render = spawn("wkhtmltoimage", ["--transparent", "--quality", "100", "--zoom", "4", "--crop-h", "1024", "--crop-w", "1024", job.svgFile, job.pngFile]);
				render.on('close', function(code) {
					
					console.log("Optimizing " + job.pngFile);
					spawnSync("optipng", [ job.pngFile ]);

					async.eachSeries([
						{ filename: job.png512File, factor: "50%" },
						{ filename: job.png256File, factor: "25%" },
						{ filename: job.png128File, factor: "12.5%" }
						],
						function(resizeJob, resizeFinished) {
							console.log("Resizing " + job.pngFile + " by " + resizeJob.factor + " to " + resizeJob.filename);
							var resize = spawn("magick", [ job.pngFile, "-resize", resizeJob.factor, resizeJob.filename ]);
							resize.on('close', function() {
								resizeFinished();
							});
					}, function() {
						async.eachSeries([
							{ filename: job.png512File },
							{ filename: job.png256File },
							{ filename: job.png128File }
							],
							function(optimizeJob, optimizeFinished) {
								console.log("Optimizing " + optimizeJob.filename);
								var optimize = spawn("optipng", [ optimizeJob.filename ]);
								optimize.on('close', function() {
									optimizeFinished();
								});
						}, function() {
							callback();
						});
					});
				});
		});
}

function createSVGs() {
	if (!fs.existsSync(path.join(__dirname, "symbols"))) {
		fs.mkdirSync(path.join(__dirname, "symbols"));
	}

	var fonts = config.fonts;

	for(var i = 0; i < config.sets.length; i++) {
		var set = config.sets[i];
		var data = set;

		console.log("Creating SVG Set: " + set.name);

		if(!fs.existsSync(path.join(__dirname, 'symbols', set.name))) {
			fs.mkdirSync(path.join(__dirname, 'symbols', set.name));
		}

		console.log("Copying fonts");
		for(var f = 0; f < fonts.length; f++) {
			console.log("Copying font: " + fonts[f]);
			fs.createReadStream(fonts[f]).pipe(fs.createWriteStream(path.join(__dirname, 'symbols', set.name, fonts[f])));
		}
		

		for(var x = 0; x < set.symbols.length; x++) {
			var symbol = set.symbols[x];

			var symbol_data = {};
			Object.assign(symbol_data, data, symbol);

			var template = fs.readFileSync(path.join(__dirname, "templates", symbol.template), { encoding: "utf8" });
			template = Handlebars.compile(template);
			for(var variant in symbol.variants) {
				var variant_data = {};
				variant_data[variant] = true;
				variant_data = Object.assign(variant_data, symbol_data);

				console.log("Generating Symbol: " + symbol.name + " [" + variant + "]");
				var compiled_symbol = template(variant_data);
				compiled_symbol = compiled_symbol.replace(/^\s*[\r\n]/gm, "");
				fs.writeFileSync(path.join('symbols', set.name, symbol.variants[variant] + ".svg"), compiled_symbol);
			}
		}
	}
}