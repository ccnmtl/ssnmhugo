WEBPACK_UTIL=./node_modules/webpack/bin/webpack.js
OUTPUT_PATH=static/lib/

webpack:  $(JS_SENTINAL)
	rm -rf static/lib/*
	$(WEBPACK_UTIL) --output-path $(OUTPUT_PATH)ssnm-pack/ --config ./node_modules/ssnm-pack/webpack.config.js
