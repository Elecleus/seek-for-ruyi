## Lua frontend and Rust backend

## Status: deprecated

Lua 的数据处理能力很强，但因为 Lua 是一门动态类型语言，所以在 Lua 前端和
静态类型后端的数据交换上会有很多问题，需要进行细致的提前设计。可是在包管
理器/构建系统这样的高动态需求下，提前设计很大程度上是不现实的。
