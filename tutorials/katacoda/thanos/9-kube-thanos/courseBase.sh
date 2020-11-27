#!/usr/bin/env bash

GO111MODULE="on" go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@v0.4.0
GO111MODULE="on" go get github.com/brancz/gojsontoyaml
GO111MODULE="on" go get github.com/google/go-jsonnet/cmd/jsonnet@v0.17.0
GO111MODULE="on" go get github.com/google/go-jsonnet/cmd/jsonnetfmt@v0.17.0
