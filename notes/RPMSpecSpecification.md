# RPM Spec 格式标准

本文档主要作为 RPM Spec 生成器的语法、语义和模板参考，
亦可用于手动打包参考。

**注意**：本文档中部分代码块语法高亮可能会出现错误，这是为了满足文档展示需求所用的自定义表示法导致的。

## 输出模板

一个 RPM Spec 文件的基本语法模板，所有可能出现的语法都应列出在这一部分，并在后续章节详细介绍。

可能出现多次的语法结构应该在此模板内重复两遍，以示可能多次出现。

其中 `{{ Some }}` 语法标注字符串填充，对应字符串的生成规则见下文。

```specfile
Name:           {{ Name }}
Version:        {{ Version }}
Release:        {{ Release }}
Summary:        {{ Summary }}
License:        {{ License }}
URL:            {{ Url }}
VCS:            {{ Vcs }}
Source{{ n }}:  {{ Source(n) }}
Source{{ m }}:  {{ Source(m) }}
BuildSystem:    {{ BuildSystem }}

BuildRequires:  {{ BuildRequires }}
BuildRequires:  {{ BuildRequires }}
Requires:       {{ Requires }}
Requires:       {{ Requires }}

%description
{{ Description }}

%files
{{ Files }}

%files
{{ Files }}

%changelog
{{ Changelog }}
```

主要字段，即上方 `{{` 标识位于每行的第 17 列。

## 字段

以下无特殊声明的字符串均应满足：末尾无换行；

### Name

字符串；单行；

### Version

字符串；单行；满足 `Version` 约束；

### Release

字符串；单行；满足 `Release` 约束；

### Summary

字符串；单行；

### License

字符串；单行；满足 `License` 约束；

### Url

字符串；单行；满足 `Url` 约束；
 
### Vcs

字符串；单行；满足 `Vcs` 约束；

### n ... Source(n)

字符串；单行；满足 `Source` 约束；`n` 应为阿拉伯数字

### BuildSystem

字符串；单行；满足 `BuildSystem` 约束；

### BuildRequires

字符串；单行；满足 `BuildRequires` 约束；

### Requires

字符串；单行；满足 `Requires` 约束；

### Description

字符串；单行或多行；

### Files

字符串；单行或多行；

### Changelog

字符串；单行或多行；

## 约束

在大部分语言中，都可以进行自动或手动的检查，借此，定义约束来用于对实际数据进行检查。

TODO

## 推荐设计

### 架构

`前端编写（手写 / 工具） -> 动态表 -> 静态表 -> 模板后端`

### 动态表

能够提供部分动态语义，用于生成静态表。推荐的结构如下：

```plaintext
{
    name,
    version,
    release,
    license,
    url,
    vcs,
    buildSystem,
    sources: {
        anyName1: {
            url,
            urlType,
            checksum,
            checksumType,
        }
        anyName2: {
            url,
            urlType,
            checksum,
            checksumType,
        }
    }
    outputs: [
        main: {    <1>
            summary,
            buildRequires: [ string1, string2 ]
            requires: [ string1, string2 ]
            description,
            files: [ string1 string2 ]
        }
        anyName1: {    <2>
            summary,
            buildRequires: [ string1, string2 ]
            requires: [ string1, string2 ]
            description,
            files: [ string1 string2 ]
        }
    ]
    options: {    <3>
        anyKey: anyValue
    }
}
```

其中，

- `<1>` 处 `main` 字段对应主包的定义
- `<2>` 处对应各子包的定义
- `<3>` 处 `options` 表作为参数，供包定义使用

### 静态表

用于通过字符串插值或模板库直接向模板填充。推荐的结构如下：

```plaintext
{
    name,
    version,
    release,
    license,
    url,
    vcs,
    buildSystem,
    sources: {
        anyName1: {
            url,
            urlType,
            checksum,
            checksumType,
        }
        anyName2: {
            url,
            urlType,
            checksum,
            checksumType,
        }
    }
    outputs: [
        main: {    <1>
            summary,
            buildRequires: [ string1, string2 ]
            requires: [ string1, string2 ]
            description,
            files: [ string1 string2 ]
        }
        anyName1: {    <2>
            summary,
            buildRequires: [ string1, string2 ]
            requires: [ string1, string2 ]
            description,
            files: [ string1 string2 ]
        }
    ]
}
```

即上述动态表经解析去除 `options` 字段后的结果。
