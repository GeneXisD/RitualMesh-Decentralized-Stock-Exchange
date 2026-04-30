#!/usr/bin/env bash
PRIMARY=$1
SECONDARY=$2

echo "Comparing state between $PRIMARY and $SECONDARY"
ssh $PRIMARY "ls /" > /tmp/primary_state.txt
ssh $SECONDARY "ls /" > /tmp/secondary_state.txt
diff /tmp/primary_state.txt /tmp/secondary_state.txt || echo "Mismatch detected"
