#!/bin/bash
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
TESTS=$(circleci env subst "${PARAM_TESTS}")
API_KEY=$(circleci env subst "${PARAM_API_KEY}")

echo "Running tests: ${TESTS} ${API_KEY}"