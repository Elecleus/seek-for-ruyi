{
  BuildStep = {
    name | String,
    content | String,
  },
  Package = {
    name | String,
    version | String,
    summary | String,
    description | String,
    license | String,
    url | String,
    vcs | optional,
    build-steps | optional,
  }
}
