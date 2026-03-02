import jade.package
import jade.targets

graphviz = package.Package {
    name: "graphviz"
    version: "14.0.4"
    summary: "Graph Visualization Tools"
    license: "EPL-1.0 AND CPL-1.0 AND BSD-3-Clause AND MIT AND GPL-3.0-or-later"
    url: "http://www.graphviz.org/"
    platform.openRuyi.vcs: "git:https://gitlab.com/graphviz/graphviz"
    description: "<ommited>"
    buildSystem: "autotools"
    sources: [
        package.Source {
            type: "Remote"
            url: "https://gitlab.com/graphviz/graphviz/-/archive/${version}/graphviz-${version}.tar.gz"
        }
        package.Source {
            type: "Remote"
            url: "fake://i.am.fake/"
        }
    ]
    buildRequires: [
        "autoconf"
        "pkgconfig(zlib)"
        "pkgconfig(cairo) >= 1.1.10"
    ]
    outputs: {
        devel: {
            summary: "Development package for graphviz"
            description: "This package contains development files for graphviz."
            files: [ "fake 1" "fake 2"]
        }
        libs: {
            summary: "Graphviz libraries"
            description: "Graphviz libraries."
        }
    }
}

graphvizSpec = targets.packageToRpmSpec(graphviz)
