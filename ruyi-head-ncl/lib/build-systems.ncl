let { BuildStep, .. } = import "package.ncl"
in
{
  autotool = {
    build-steps : Array BuildStep = [
      {
        name = "configure",
        content = "./configure",
        index = 300,
      } | BuildStep,
      {
        name = "build",
        content = "make",
        index = 500,
      } | BuildStep,
      {
        name = "test",
        content = "make test",
        index = 700,
      } | BuildStep,
    ]
  }
}
