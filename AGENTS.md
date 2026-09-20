# neural-db — AI Guide

## Overview

GPU-accelerated database engine. Executable program (like CockroachDB), not a Go package.

**Language:** Go (server/CLI/storage) + CUDA C kernels (GPU compute) via CGO.

**Architecture inspiration:**
- **CockroachDB** — Go executable, distributed SQL, Raft consensus, embedded storage engine
- **NVIDIA RAPIDS cuDF** — GPU DataFrame patterns, columnar processing, memory management on device

**Status:** Early development. Currently a hello-world skeleton.

## Design notes (GPU)

- Go binary with embedded CUDA kernels (`.so` via CGO)
- GPU compute layer: query execution, joins, aggregations, sorting on device
- CPU layer: CLI, HTTP/gRPC server, WAL, storage, networking
- No Python runtime dependency — standalone executable
- Future: desktop mode (embedded) + server mode (networked)

## Quick reference

| Topic | Location |
|-------|----------|
| Entry point | `main.go` |
| Go module | `github.com/natuleadan/neural-db` |
| Docker | `Dockerfile` (multi-stage, Alpine) |
| CI | `.github/workflows/ci.yml` |

## Commands

```bash
go build ./...        # Build
go test ./...         # Test
go vet ./...          # Lint
```

## License

Apache 2.0. See `LICENSE` and `NOTICE`.
