--[[
the index metamethod is necessary for spoofing 
values or tricking anti cheats


]]

local metatable = getrawmetatable(game) --gets the entire game's metatable 
setreadonly(metatable, false) --necessary for editing the game's metatable 
local oldIndex = metatable.__index -- useful for later

metatable.__index = newcclosure(function(self, value) --newcclosure should only be available for synapse users. This function is built in synapse's library, it prevents certain metamethod manip. detection
    if tostring(value) == "WalkSpeed" then 
        return 16 --if the anticheat tries to check the value of WalkSpeed, we will return it with 16. NOTE: self is the table that was called 
    end
    
    return oldIndex(self, value) -- prevents client from crashing 
end)

game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 100 
