#!/bin/bash

set -xe

kind=$1

source $(dirname "$0")/tc-tests-utils.sh

set_ldc_sample_filename "16k"

download_material "${TASKCLUSTER_TMP_DIR}/ds"

mkdir -p ${TASKCLUSTER_ARTIFACTS} || true

export PATH=${TASKCLUSTER_TMP_DIR}/ds/:$PATH

if [ "${kind}" = "--basic" ]; then
  run_valgrind_basic
  run_valgrind_stream
fi

if [ "${kind}" = "--metadata" ]; then
  run_valgrind_extended
  run_valgrind_extended_stream
fi
