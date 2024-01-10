#!/bin/bash

# https://circleci.com/docs/orbs-best-practices/#accepting-parameters-as-strings-or-environment-variables
TESTS=$(circleci env subst "${PARAM_TESTS}")
API_KEY=$(circleci env subst "${PARAM_API_KEY}")

# Example: TESTS="TestId1\nTestId2\nTestId3"
payload="{ \"testIds\": ["

# Loop through the newline-delimited list, trim spaces, and construct the JSON array
while IFS= read -r line; do
  trimmed_line=$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
  payload="$payload \"$trimmed_line\","
done <<< "$TESTS"

# Remove the trailing comma and close the JSON array
payload="${payload%,} ] }"

curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${API_KEY}" \
  -d "$payload" \
  https://api.momentic.ai/v1/tests/queue