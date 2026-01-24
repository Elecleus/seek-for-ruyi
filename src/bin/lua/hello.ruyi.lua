local ruyi = require("ruyi")

ruyi.expose()

local hello = newPackage("hello")
    :addSpdx()
    :display()
