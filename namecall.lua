local gmt = getrawmetatable(game)
setreadonly(gmt, false) 
local oldNamecall = gmt.__namecall --prevents client from crashing 

gmt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if tostring(self) == "name of thing" and method == "FireServer" then --anything that is attached to a : can be referenced i.e. Kick" 
        args[1] = "Value"
        args[2] = true 
        args[3] = 2
        return self.FireServer(self, unpack(args))
    end 
    return oldNamecall(self, ...) 
end)
setreadonly(gmt, true) --unnecessary
