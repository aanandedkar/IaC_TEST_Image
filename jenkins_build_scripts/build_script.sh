#!/bin/bash
set -ex

source "${WORKSPACE}/jenkins_build_scripts/variables"

docker build -t ${full_image_names} .
