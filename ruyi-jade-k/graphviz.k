import jade.package

gcc = package.Package {
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
    ]
}
