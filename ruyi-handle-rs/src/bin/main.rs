use std::path::Path;

use clap::{Command, arg};
use ruyi_handle::{input, package::PackageStatic};

fn main() -> Result<(), input::InputError> {
    let matches = Command::new("ruyi")
        .version("0.0.0")
        .propagate_version(true)
        .subcommand_required(true)
        .arg_required_else_help(true)
        .subcommand(
            Command::new("import")
                .about("Import a file as PackageStatic (JSON), only prints to stdout")
                .long_about("")
                .arg(arg!(<FILE>)),
        )
        .subcommand(Command::new("export"))
        .get_matches();

    match matches.subcommand() {
        Some(("import", import_matches)) => {
            let path = Path::new(
                import_matches
                    .get_one::<String>("FILE")
                    .expect("This should never panic."),
            );
            let ext = path.extension().and_then(|ext| ext.to_str()).unwrap_or("");

            // Load the file, according to the file format.
            let loaded: PackageStatic = match ext {
                "k" => input::from_kcl_file(path)?,
                "json" => input::from_json_file(path)?,
                _ => {
                    panic!("[Error] Failed to infer FILE type.")
                }
            };

            println!("{}", serde_json::to_string_pretty(&loaded)?)
        }
        _ => unreachable!(),
    }

    Ok(())
}
