let { BuildStep, .. } = import "package.ncl"
in
{
  autotool = {
    build-steps : Array BuildStep = [
      {
        name = "configure",
        index = 300,
        content = "./configure",
      } | BuildStep,
      {
        name = "build",
        index = 500,
        content = "make",
      } | BuildStep,
      {
        name = "test",
        index = 700,
        content = "make test",
      } | BuildStep,
    ]
  }
}
