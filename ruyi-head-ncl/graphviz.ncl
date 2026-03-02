let
  { makePackage, Package, .. } = import "lib/package.ncl",
  export-to-spec = (import "lib/templates/rpm-spec.ncl").from-package,
in
{
  graphviz' =
    {
      name = "graphviz",
      version = "14.0.4",
      summary = "Graph Visualization Tools",
      url = "http://www.graphviz.org/",
      license = "EPL-1.0 AND CPL-1.0 AND BSD-3-Clause AND MIT AND GPL-3.0-or-later",
      platform.openRuyi.vcs = "git:https://gitlab.com/graphviz/graphviz",
      description = "<ommited>",
      build-system = 'autotool,
      sources = [
        {
          type = 'remote,
          url = "https://gitlab.com/graphviz/graphviz/-/archive/${version}/graphviz-${version}.tar.gz",
          checksum = "<...fake...>",
        },
        {
          type = 'remote,
          url = "fake://i.am.fake/",
        }
      ],
      build-requires = [
        "autoconf",
        "pkgconfig(zlib)",
        "pkgconfig(cairo) >= 1.1.10",
      ],
      outputs = {
        devel = {
          summary = "Development package for graphviz",
          description = "This package contains development files for graphviz.",
          files = ["fake 1", "fake 2"],
        },
        libs = {
          summary = "Graphviz libraries",
          description = "Graphviz libraries.",
          build-requires = [
            "fake build require1",
            "fake build require2",
          ],
        }
      }
    } | Package,
  graphviz = makePackage graphviz',
  graphvizSpec = export-to-spec graphviz,
}
