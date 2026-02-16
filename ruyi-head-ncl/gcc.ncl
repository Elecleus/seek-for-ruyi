let
  { makePackage, Package, .. } = import "lib/package.ncl",
  export-to-spec = (import "lib/templates/rpm-spec.ncl").from-package,
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
      sources = [
        {
          url = "test-url",
          checksum = "b1aa2bf4e12d6be72df9d4c16b81edd821b34692371cc10888dc22e80ea37767"
        },
        {
          url = "test-url2",
          checksum = "4af27629bfdd3d25c9cb20a7001ce5d12c103c8568975725b3cbaca52bec94e3"
        }
      ],
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
  gcc = makePackage (gcc' & { name | force = "gcc15" }),
  gcc-spec = export-to-spec gcc,
}
