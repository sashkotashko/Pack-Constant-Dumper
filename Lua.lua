--[[

   _____           _          _____                _              _       _____                                  
 |  __ \         | |        / ____|              | |            | |     |  __ \                                 
 | |__) |_ _  ___| | __    | |     ___  _ __  ___| |_ __ _ _ __ | |_    | |  | |_   _ _ __ ___  _ __   ___ _ __ 
 |  ___/ _` |/ __| |/ /    | |    / _ \| '_ \/ __| __/ _` | '_ \| __|   | |  | | | | | '_ ` _ \| '_ \ / _ \ '__|
 | |  | (_| | (__|   <     | |___| (_) | | | \__ \ || (_| | | | | |_    | |__| | |_| | | | | | | |_) |  __/ |   
 |_|   \__,_|\___|_|\_\     \_____\___/|_| |_|___/\__\__,_|_| |_|\__|   |_____/ \__,_|_| |_| |_| .__/ \___|_|   
                                                                                               | |              
                                                                                               |_|              

]]

local old_env = _ENV
local bkey = {
-- Blacklisted constants, if you want you could edit them.
    "getfenv",
    "string",
    "bit32",
    "pairs",
    "select",
    "math",
    "rawset",
    "rawequal",
    "rawget",
    "pairs",
    "next",
    "setfenv",
    "error",
    "assert",
    "pcall",
    "getmetatable",
    "debug",
    "unpack",
    "setmetatable",
    "tonumber",
    "math",
    "type",
    "bit32",
    "table",
    "tostring",
    "bit"
}
_ENV = {["old_env"]=old_env,["bkey"]=bkey}

old_env["setmetatable"](_ENV,{
    __index = function(t,i)
        local isfound = false
        for _,v in old_env["pairs"](bkey) do
            if v == i then isfound = true end
        end
        if not isfound then 
        old_env["print"](i)
        end
        return old_env[i]
    end
})

old_env['pcall'](function()
-- Script here
end)
