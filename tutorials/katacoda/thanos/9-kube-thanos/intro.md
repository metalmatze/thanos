# Welcome to the kube-thanos Katacoda!

[Thanos](https://thanos.io) is a set of components that can be composed into a highly available metric system with unlimited storage capacity.
It can be added seamlessly on top of existing Prometheus deployments.

[kube-thanos](https://github.com/thanos-io/kube-thanos) collects [Kubernetes](https://kubernetes.io/) manifests combined with documentation and scripts to provide easy to deploy experience for Thanos on Kubernetes.

### Jsonnet

kube-thanos generates the YAML using [jsonnet](https://jsonnet.org/). Jsonnet is a data templating language based on JSON.
It adds some cool additional features to JSON like if-conditions, loops and functions. Most importantly we can generate default JSON, that in turn can later be customized to your needs without us having to tweak kube-thanos for every possible scenario!
This Katacoda comes with the `jsonnet`{{execute}} and `jsonnetfmt`{{execute}} binaries pre-installed (via go get).

### jsonnet-bundler

To fetch extra dependencies (like kube-thanos), we came up with a tool called [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler).
Once you initialized a project it's very simliar to [bundler](https://bundler.io/) or [npm](https://www.npmjs.com/).
It'll fetch dependencies via `git` and write them to a `jsonnetfile.json` and a `jsonnetfile.lock.json`.
The latter saves the specific revision/hash of the dependency you've added for max reproducibility.

Let's jump in! 🤓

### Feedback

Do you see any bug, typo in the tutorial or you have some feedback for us?
Let us know on https://github.com/thanos-io/kube-thanos or #thanos slack channel linked on https://thanos.io

### Contributed by:

* Matthias Loibl [@metalmatze](https://github.com/metalmatze)
