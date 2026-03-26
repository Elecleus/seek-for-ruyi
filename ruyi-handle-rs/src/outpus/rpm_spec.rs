use askama::Template;
use std::collections::HashMap;

// 此部分字段直接对应模板填充
#[derive(Template)]
#[template(path = "rpm-template.spec", escape = "none")]
struct RpmSpecTemplate<'a> {
    name: &'a str,
    version: &'a str,
    release: &'a str,
    license: &'a str,
    url: &'a str,
    vcs: &'a str,
    build_system: &'a str,
    build_steps: Vec<BuildStepTemplate<'a>>,
    sources: Vec<SourceTemplate<'a>>,
    output_main: OutputTemplate<'a>,
    output_others: Vec<OutputTemplate<'a>>,
    changelog: Option<&'a str>,
}

struct BuildStepTemplate<'a> {
    script: &'a str,
    environment: HashMap<&'a str, &'a str>,
}

struct SourceTemplate<'a> {
    name: &'a str,
    type_: &'a str,
    url: &'a str,
    checksum: &'a str,
    checksum_type: &'a str,
}

struct OutputTemplate<'a> {
    name: &'a str,
    summary: &'a str,
    description: &'a str,
    requires: &'a str,
    build_requires: &'a str,
    files: &'a str,
}
