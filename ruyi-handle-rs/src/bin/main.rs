use std::path::Path;

use ruyi_handle::input;

fn main() -> Result<(), input::InputError> {
    let path = Path::new("./package.json");
    let imported = ruyi_handle::input::from_json_file(path)?;

    println!("Raw: {:?}", imported);
    println!("Re-jsonify: {}", serde_json::to_string_pretty(&imported)?);

    Ok(())
}
