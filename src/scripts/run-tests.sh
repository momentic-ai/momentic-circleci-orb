#!/bin/bash
# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
TESTS=$(circleci env subst "${PARAM_TESTS}")
MOMENTIC_API_KEY=$(circleci env subst "${PARAM_MOMENTIC_API_KEY}")

echo "Running tests: ${TESTS}"