//! Handle the input of a static package.

use serde_json::from_reader;

use crate::package::PackageStatic;

use std::{fs::File, path::Path};

pub fn from_json_file(path: &Path) -> Result<PackageStatic, InputError> {
    let file = File::open(path)?;
    let result = from_reader(file)?;

    Ok(result)
}

#[derive(Debug)]
pub enum InputError {
    FileOpenError(std::io::Error),
    DeserializeError(serde_json::Error),
}

impl From<std::io::Error> for InputError {
    fn from(value: std::io::Error) -> Self {
        InputError::FileOpenError(value)
    }
}

impl From<serde_json::Error> for InputError {
    fn from(value: serde_json::Error) -> Self {
        InputError::DeserializeError(value)
    }
}
