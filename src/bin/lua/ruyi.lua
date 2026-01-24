local ruyi = {}

ruyi.flavor = {
    spdx = "ry_spdx"
}

function ruyi.newPackage(name)
    local package = { name = name }

    function package:addSpdx()
        self.spdx = ruyi.flavor.spdx
        return self
    end

    function package:display()
        local name_section = "Name: " .. self.name

        print(string.rep("=", #name_section))
        print("Name: " .. self.name)
        print()

        return self
    end

    return package
end

-- Expose some funtion to Global scope.
function ruyi.expose()
    _G.newPackage = ruyi.newPackage
end

return ruyi
