use std::path::Path;

use askama::Template as _;
use clap::{Arg, Command, arg};
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
        .subcommand(
            Command::new("export")
                .about("Export PackageStatic as FORMAT")
                .arg(arg!([FILE]))
                .arg(
                    Arg::new("format")
                        .short('f')
                        .help("The format in which to export")
                        .value_parser(["rpm-spec"])
                        .default_value("rpm-spec"),
                ),
        )
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
        Some(("export", export_matches)) => {
            let loaded: PackageStatic =
                if let Some(file_path) = export_matches.get_one::<String>("FILE") {
                    input::from_json_file(Path::new(file_path))?
                } else {
                    input::from_stdin()?
                };

            let rpm_spec = loaded.to_rpm_spec_template().unwrap().render().unwrap(); // All these unwrap should never panic.
            println!("{}", rpm_spec);
        }
        _ => unreachable!(),
    }

    Ok(())
}
