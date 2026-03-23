## 关于 *AerynsOS* 和 `nfpm` 的打包格式

- *AerynsOS*: [Here](https://aerynos.dev/packaging/recipes/overview/)
- `nfpm`: [Here](https://nfpm.goreleaser.com/docs/configuration/)

### AerynsOS

AerynOS 是一个独立的新兴发行版，它的打包格式是使用 YAML 的声明式语法。它在保持极简的同时，还能提供完整的打包能力，可以作为“做减法”时的参考对象。

其包定义特点有：

1. 用 URL + checksum 声明上游
2. 用 field(name) 这样类似 RPM 的方式声明依赖
3. 子包和主包共享依赖

### nfpm

nfpm 是 fpm 的 Go 重写版本。能通过一套语法生成常见发行版的包，很接近 seek-for-ruyi 的目标，是 seek-for-ruyi 的理想参考对象。

其包定义特点有：

1. 手动列出 contents(files)
2. 不支持子包（貌似）