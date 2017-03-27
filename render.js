var fs = require('fs');
var path = require('path');

var Handlebars = require('handlebars');

var config = JSON.parse(fs.readFileSync(process.argv[2]));

if (!fs.existsSync("symbols")) {
	fs.mkdirSync("symbols");
}

var fonts = config.fonts;

for(var i = 0; i < config.sets.length; i++) {
	var set = config.sets[i];
	var data = set;

	console.log("Rendering Set: " + set.name);

	if(!fs.existsSync(path.join('symbols', set.name))) {
		fs.mkdirSync(path.join('symbols', set.name));
	}

	console.log("Copying fonts");
	for(var f = 0; f < fonts.length; f++) {
		console.log("Copying font: " + fonts[f]);
		fs.createReadStream(fonts[f]).pipe(fs.createWriteStream(path.join('symbols', set.name, fonts[f])));
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
			fs.writeFileSync(path.join('symbols', set.name, symbol.variants[variant] + ".svg"), compiled_symbol);
		}
	}
}