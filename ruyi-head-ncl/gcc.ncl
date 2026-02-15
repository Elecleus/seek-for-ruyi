let rec { makePackage, Package, .. } = import "lib/package.ncl",
in
{
  gcc' =
    {
      name = "gcc",
      version = "15",
      license = "GPL-3.0-or-later",
      url = "http://gcc.gnu.org/",
      summary = "The system GNU C Compiler",
      description = m%"
      The system GNU C Compiler.
    "%,
      build-system = 'none,
      options = {
        build-ada
          | doc "Set to 1 to build the Ada compiler"
          = false,
        build-d
          | doc "Set to 1 to build the D compiler"
          = false,
      }
    } | Package,
  gcc = makePackage (gcc' & { name | force = "gcc15" })
}
