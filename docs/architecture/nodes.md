# Node Roles

## Gateway Node
Validates identity, rate limits ingress, and propagates signed orders.

## Matching Node
Maintains local/off-chain books and proposes matches.

## Settlement Node
Finalizes matched trades and anchors settlement events.

## Audit Node
Replays and verifies state transitions independently.

## Clearinghouse Node
Optional netting, collateral, and reconciliation layer.
