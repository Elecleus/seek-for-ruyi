let rec { makePackage, Package, .. } = import "lib/package.ncl",
in
{
  hello' =
    {
      name = "hello",
      version = "2.12.2",
      license = "GPL-3.0-or-later",
      url = "https://www.gnu.org/software/hello/",
      summary = "Program that produces a familiar, friendly greeting",
      description = m%"
      GNU Hello is a program that prints "Hello, world!" when you run it.
      It is fully customizable.
    "%,
      build-system = 'autotool,
    } | Package,
  hello = makePackage hello'
}
