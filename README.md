# Buildpacks

Cloud Native Buildpacks

```
pushd stacks
./build.sh
popd
pack create-builder caicloud-nodejs:bionic --builder-config builders/builder.toml --no-pull
pack build example-app --builder caicloud-nodejs:bionic --path apps/NodeJs/simple-express --no-pull
```

### Requirements

- 每个项目建议放置一个 `buildpack.json` 文件在项目根目录下。规则如下：

``` json
{
  "name": "", // 项目名字
  "language": {
    "name": "", // 语言
    "version": "" // 语言运行时的版本
  },
  "command": "", // 项目启动命令
}
```
