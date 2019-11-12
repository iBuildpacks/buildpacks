# Buildpacks

Cloud Native Buildpacks

```
pushd stacks
./build.sh
popd
pack create-builder caicloud-nodejs:bionic --builder-config builders/builder.toml --no-pull
pack build example-app --builder caicloud-nodejs:bionic --path apps/NodeJs/simple-express --no-pull

```
