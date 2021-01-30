PYTHON=.venv/bin/python
PY_VERSION=3.7
MANAGE_EXE=hasker/manage.py

.PHONY: dev venv migrate dev-apprun dev-pgstart dev-pgstop


venv:
	virtualenv -p python$(PY_VERSION) .venv
	$(PYTHON) -m pip install -r requirements.txt

migrate:
	$(PYTHON) $(MANAGE_EXE) migrate

dev-apprun:
	$(PYTHON) $(MANAGE_EXE) runserver

dev-pgstart:
	docker run -d -p 5432:5432 \
		-e POSTGRES_HOST_AUTH_METHOD=trust \
		-e POSTGRES_USER=hasker \
		-v ~/hasker_data/pgsql:/var/lib/postgresql/data \
		postgres

	sleep 5

dev-pgstop:
	docker ps -q --filter="ancestor=postgres" | xargs --no-run-if-empty docker stop

dev: venv dev-pgstop dev-pgstart migrate dev-apprun
