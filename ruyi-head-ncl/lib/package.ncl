{
  makePackage
    | Package -> Package
    | not_exported
    = fun pkg => let BuildSystems = import "build-systems.ncl" in pkg & { build-steps = BuildSystems."%{pkg.build-system}".build-steps },
  BuildSystem = [| 'none, 'autotool |],
  BuildStep = {
    name | String,
    content | String,
    index
      | Number
      | doc m%"
          the priority of the build step
          The little one runs earlier. 
      "%,
  },
  Source
    | doc "source definition"
    = {
      url | String,
      type | default = 'remote,
      checksum
        | String
        | optional,
      checksum-type
        | default
        = 'sha256
    },
  Package
    | doc "Metadata needed to define a package"
    = {
      name | String,
      version | String,
      summary | String,
      description | String,
      license | String,
      url | String,

      # [TODO] At least one of build-system and build-steps
      build-system
        | optional
        | BuildSystem,
      build-steps
        | optional
        | Array BuildStep,

      requires
        | optional
        | Array String,
      build-requires
        | optional
        | Array String,

      sources
        | optional
        | Array Source,

      options
        | optional
        | doc "A dict containing all options for the package",
      extra
        | optional
        | doc "A dict containing extra data for various purposes",

      outputs
        | optional
        | doc "Sub-packages",
      platform
        | optional
        | doc "Extra metadata for different platform"
    },
}
