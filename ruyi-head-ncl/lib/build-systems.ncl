let { BuildStep, .. } = import "package.ncl"
in
{
  Autotool = {
    build-steps : Array BuildStep = [
      {
        name = "configure",
        content = "./configure",
      } | BuildStep,
      {
        name = "build",
        content = "make",
      } | BuildStep,
      {
        name = "test",
        content = "make test"
      } | BuildStep,
    ]
  }
}
