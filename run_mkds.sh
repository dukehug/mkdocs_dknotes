#~/bin/bash

mkdocs build
sleep 5
mkdocs serve --dev-addr=0.0.0.0:8000

