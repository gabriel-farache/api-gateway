# Egress (outbound traffic)

Egress is **documented** and **placeholders** only in this deliverable; no active outbound routes.

## Intended model

When implemented, the gateway will be the single **exit** point for outbound traffic from DCM. That gives one place for policy, logging, and TLS to external systems.

When the egress flow is implemented, extend `krakend.json` with endpoints that proxy to the appropriate backends.
