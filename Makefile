STAGING_URL=https://ssnmhugo.stage.ccnmtl.columbia.edu/
PROD_URL=https://ssnm.ctl.columbia.edu/
STAGING_BUCKET=ssnmhugo.stage.ccnmtl.columbia.edu
PROD_BUCKET=ssnm.ctl.columbia.edu
INTERMEDIATE_STEPS ?= echo nothing
HUGO=/usr/local/bin/hugo-0.25.1

JS_FILES=static/js/


all: webpack

include *.mk

$(PUBLIC)/js/all.json: $(PUBLIC)/json/all/index.html
	mkdir $(PUBLIC)/js/ || true
	mv $< $@ && ./checkjson.py

clean:
	rm -rf node_modules

.PHONY: clean
