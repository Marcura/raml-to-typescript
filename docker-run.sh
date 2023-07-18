#!/bin/bash

echo "Usage docker-run.sh <raml url example https://raw.githubusercontent.com/Marcura/dadesk-module-table-management/master/src/main/resources/tablemanagement-api.raml?token=GHSA...>"

docker run -it -v ./:/opt2/raml-ts --env RAML_URL="$1" marcura/raml-ts
