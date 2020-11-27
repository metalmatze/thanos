# Step 1 - Install kube-thanos as a dependency

Let's start by initializing our development environment by running `jb init`{{execute}}.
Under normal circumstances you would want to run this command in the repository/directory where the rest of your YAML is saved.

_If you see `bash: jb: command not found` retry the command in a few seconds, jb is still being installed._

Check the contents of the `jsonnetfile.json`:
```
cat jsonnetfile.json
```{{execute}}

### Add kube-thanos

Now we can add kube-thanos as our dependency:
```
jb install github.com/thanos-io/kube-thanos/jsonnet/kube-thanos
```{{execute}}

Jsonnet-bundler has pulled down the latest `master` branch and saved its contents to `vendor/github.com/thanos-io/kube-thanos`.
Additionally the version that has been written to disk has been saved in the `jsonnetfile.lock.json`.

```
cat jsonnetfile.lock.json
```{{execute}}
