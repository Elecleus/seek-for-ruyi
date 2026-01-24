use anyhow::Result;
use mlua::{Lua, Table};

fn main() -> Result<()> {
    println!("hello,ruyi");

    let lua = Lua::new();

    let module_ruyi = include_str!("lua/ruyi.lua");
    let table_ruyi: Table = lua.load(module_ruyi).eval()?;
    lua.register_module("ruyi", table_ruyi)?;

    let package_lua = include_str!("lua/hello.ruyi.lua");
    lua.load(package_lua).exec()?;

    Ok(())
}
