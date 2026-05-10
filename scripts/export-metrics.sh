#!/bin/bash

mkdir -p metrics

TOTAL_ATTACKS=$(grep -c "FAIL" reports/report.html || true)

cat <<EOF > metrics/redteam.prom
redteam_failed_attacks $TOTAL_ATTACKS
EOF