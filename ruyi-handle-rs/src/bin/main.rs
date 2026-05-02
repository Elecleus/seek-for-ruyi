use std::path::Path;

use askama::Template;
use ruyi_handle::{input, outpus::rpm_spec::RpmSpecTemplate};

fn main() -> Result<(), input::InputError> {
    let path = Path::new("../temp/graphviz.json");
    let imported = ruyi_handle::input::from_json_file(path)?;
    let rpm_spec: RpmSpecTemplate = (&imported).try_into().unwrap();

    println!("Raw:\n\n{:?}", imported);
    println!("\n----------\n");
    println!(
        "Re-jsonify:\n\n{}",
        serde_json::to_string_pretty(&imported)?
    );
    println!("\n----------\n");
    println!("{}", rpm_spec.render().unwrap());

    Ok(())
}
