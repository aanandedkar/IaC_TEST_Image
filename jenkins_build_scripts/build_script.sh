#!/bin/bash
set -e

export HTTPS_PROXY=http://10.44.25.42:8080
export HTTP_PROXY=http://10.44.25.42:8080

PYTHON=/bin/python3.9

echo "Using Python:"
$PYTHON --version

$PYTHON -m pip install --user \
	"setuptools==82.0.0"\
    "wheel==0.46.3" \
  	"build<1.0"

$PYTHON -m build --no-isolation