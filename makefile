PYTHON=.venv/bin/python

.PHONY: devrun


devrun:
	$(PYTHON) hasker/manage.py runserver
