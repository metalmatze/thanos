# Step 2 - Simple example - generating Thanos Query YAML

Now that we have installed kube-thanos as a dependency, we can start using it.
We want to create a first jsonnet file where we import kube-thanos and then call its `query()` function.

<pre class="file" data-filename="simple.jsonnet" data-target="replace">
local thanos = import 'github.com/thanos-io/kube-thanos/jsonnet/kube-thanos/thanos.libsonnet';

local query = thanos.query({
  namespace: 'monitoring',
  version: 'v0.17.1',
  image: 'quay.io/thanos/thanos',
  replicas: 1,
  replicaLabels: ['replica'],
});

{
  apiVersion: 'v1',
  kind: 'List',
  items: [
    query[name] for name in std.objectFields(query)
  ],
}
</pre>

Now, for the first time we are going to use the `jsonnet` binary to actually generate something.
Because we have a import statement we need to tell jsonnet where to find these imports from.
Jsonnet-bundler is saving these dependencies to `vendor/` and therefore we have to run `jsonnet` with the `-J vendor` flag.

```
jsonnet -J vendor simple.jsonnet > simple.yaml
```{{execute}}

As you can see, we get a Kubernetes _List_ object that contains several other Kubernetes objects like _Services_, _Deployments_ and more.
All of this is JSON though, so wouldn't it be great to generate YAML instead?

Turns out it's easy to convert JSON to YAML and there is a simple tool called `gojsontoyaml`.

```
jsonnet -J vendor simple.jsonnet | gojsontoyaml > simple.yaml
```{{execute}}

Perfect. There is our first example. 
You can try adjusting the `replica` count in the simple.jsonnet and generate again. It should update :)
