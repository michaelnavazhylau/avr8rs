#!/usr/bin/env bash
# Fail-closed gate for the avr8rs engine and its own regressions. Node is not
# required and neither is the upstream submodule: the converted AVR8js contract
# is generated and verified in the avr8js-parity repository, whose gate rejects
# any converted scenario that is `#[ignore]`d.
set -euo pipefail
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

# The citation is part of the public surface, so a stale one must fail the gate
# rather than quietly describing the wrong release. version in CITATION.cff has
# to track the crate version; bump both together when releasing.
crate_version="$(sed -n 's/^version *= *"\([^"]*\)".*/\1/p' Cargo.toml 2>/dev/null | head -1 || true)"
cited_version="$(sed -n 's/^version: *"\([^"]*\)".*/\1/p' CITATION.cff 2>/dev/null | head -1 || true)"
if [ -z "$crate_version" ]; then
  echo 'Could not read a version from Cargo.toml.' >&2
  exit 1
fi
if [ -z "$cited_version" ]; then
  echo 'Could not read a version from CITATION.cff; is it present?' >&2
  exit 1
fi
if [ "$crate_version" != "$cited_version" ]; then
  echo "CITATION.cff cites $cited_version but the crate is $crate_version." >&2
  exit 1
fi

cargo fmt --check
cargo clippy --all-targets --locked --offline -- -D warnings
# Include ignored tests in both runs as defense in depth, rather than trusting a
# green default if one is ever added here.
cargo test --all-targets --locked --offline -- --include-ignored
cargo test --all-targets --release --locked --offline -- --include-ignored
