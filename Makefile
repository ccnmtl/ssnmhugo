STAGING_URL=https://ssnmhugo.stage.ccnmtl.columbia.edu/
PROD_URL=https://ssnm.ctl.columbia.edu/
STAGING_BUCKET=ssnmhugo.stage.ccnmtl.columbia.edu
PROD_BUCKET=ssnm.ctl.columbia.edu
INTERMEDIATE_STEPS ?= echo nothing
HUGO=/usr/local/bin/hugo-0.25.1

JS_FILES=static/js/


all: eslint

include *.mk

$(PUBLIC)/js/all.json: $(PUBLIC)/json/all/index.html
	mkdir $(PUBLIC)/js/ || true
	mv $< $@ && ./checkjson.py

runserver-kodos:
	hugo --buildDrafts --verboseLog=true -v
	hugo server --baseUrl=http://kodos.ccnmtl.columbia.edu/ --bind=0.0.0.0 --port=13093 --watch --buildDrafts --verboseLog=true -v
