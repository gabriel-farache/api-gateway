# Contributing to DCM API Gateway

## Before submitting a PR

1. **Validate KrakenD config**
   ```bash
   make validate-config
   ```
   Requires the [KrakenD](https://www.krakend.io/docs/overview/installing/) binary.

2. When you add or change routes, update the KrakenD config in `config/krakend.json` (and `config/krakend.json.tmpl` if using env overrides).

## CI

On push and pull requests to `main`, CI runs:

- **validate-krakend-config:** Validates `config/krakend.json` with `krakend check`.

Fix any failures before merging.
