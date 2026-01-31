## 路线图

1. 用 Nickel 实现一个基本的软件包定义的 Contract. 兼顾 spec 导出和后续自定义构建扩展。
2. 用 Rust 开发一个工具，做到通过二进制调用，从 Nickel 的导出配方，再转换到 spec. 尝试兼顾 RPM 构建工具的二进制调用。
3. 用 Nickel 实现一个基本的 BuildSystem Contract.
4. 在 spec 导出功能基本稳定的基础上，尝试打包更多软件包，改善 corner case.
5. 探索怎么扩展 Nickel 语言，集成到自定义工具内，做到能够不依赖外部工具进行软件包构建。
