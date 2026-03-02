type BuildSystem = "autotools"

schema BuildStep:
    name: str
    content: str
    index: int

type SourceType = "Remote" | "Local" | "Patch"

schema Source:
    type: SourceType
    url: str
    checksum?: str
    checksumType?: "sha256"

type Platform = "openRuyi" # | "openJixiang"

schema Package:
    name: str
    version: str
    summary: str
    description: str
    license: str
    url: str
    buildSystem?: BuildSystem
    buildSteps?: [BuildStep]
    runtimeRequires?: [str]
    buildRequires?: [str]
    sources?: [Source]
    options?: {str:any}
    extra?: {str:any}
    platform?: {Platform:any}


