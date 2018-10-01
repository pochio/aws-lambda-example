OUT_FILE?=./deployment-package.zip
DELIVERABLE=$(abspath $(OUT_FILE))

install:
	pipenv install --three

uninstall:
	pipenv --rm

run:
	pipenv run python ./hello_lambda.py

clean:
	rm -f ${DELIVERABLE}

build:
	$(eval VENV = $(shell pipenv --venv))
	cd ${VENV}/lib/python3.6/site-packages && zip -r9 ${DELIVERABLE} ./*
	zip -r9 ${DELIVERABLE} *.py
