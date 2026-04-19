//! The standard static definition of a package.

use serde::{Deserialize, Serialize};
use std::collections::HashMap;

#[derive(Debug, Serialize, Deserialize)]
pub struct PackageStatic {
    name: String,
    version: String,
    release: String,
    license: String,
    url: String,
    vcs: String,
    #[serde(alias = "buildSystem" /* For KCL */)]
    build_system: String,
    #[serde(alias = "build_steps" /* For KCL */)]
    build_steps: Option<Vec<BuildStep>>,
    sources: HashMap<String, Source>,
    outputs: HashMap<String, Output>,
}

#[derive(Debug, Serialize, Deserialize)]
struct BuildStep {
    script: String,
    environment: HashMap<String, String>,
}

#[derive(Debug, Serialize, Deserialize)]
struct Source {
    #[serde(alias = "type" /* For KCL */)]
    type_: String,
    url: String,
    checksum: String,
    #[serde(alias = "checksumType" /* For KCL */)]
    checksum_type: String,
}

#[derive(Debug, Serialize, Deserialize)]
struct Output {
    summary: String,
    description: String,
    requires: Option<Vec<String>>,
    build_requires: Option<Vec<String>>,
    files: Option<Vec<String>>,
}
