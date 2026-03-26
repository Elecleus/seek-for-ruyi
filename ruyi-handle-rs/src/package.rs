//! The standard static definition of a package.

use serde::{Deserialize, Serialize};
use std::collections::HashMap;

#[derive(Serialize, Deserialize)]
struct PackageStatic {
    name: String,
    version: String,
    release: String,
    license: String,
    url: String,
    vcs: String,
    build_system: String,
    build_steps: Vec<BuildStep>,
    sources: HashMap<String, Source>,
    outputs: HashMap<String, Output>,
}

#[derive(Serialize, Deserialize)]
struct BuildStep {
    script: String,
    environment: HashMap<String, String>,
}

#[derive(Serialize, Deserialize)]
struct Source {
    type_: String,
    url: String,
    checksum: String,
    checksum_type: String,
}

#[derive(Serialize, Deserialize)]
struct Output {
    summary: String,
    description: String,
    requires: String,
    build_requires: String,
    files: String,
}
