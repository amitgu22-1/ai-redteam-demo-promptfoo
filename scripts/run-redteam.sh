#!/bin/bash

mkdir -p reports

echo "Running Promptfoo Red Teaming..."

docker exec promptfoo bash -c "
promptfoo eval \
  -c promptfooconfig.yaml \
  --output reports/report.html
"

echo "Report Generated:"
echo "reports/report.html"