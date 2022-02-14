function hook(varlist)
if varlist[0]:find("OnConsoleMessage") then
if varlist[1]:find("!growscan") then
    block = 0
    for _, obj in pairs(getObjects()) do
    if obj.id == 5666 then  --ID BLOCK
    block = block + obj.count
    end
    end


    seed = 0
    for _, obj in pairs(getObjects()) do
    if obj.id == 5667 then -- ID SEED
    seed = seed + obj.count
    end
    end

    gems = 0
    for _, obj in pairs(getObjects()) do
    if obj.id == 112 then -- ID GEMS
    gems = gems + obj.count
    end
    end

    count = 0
    for _, tile in pairs(getTiles()) do
    if tile.fg == 12 then
    count = count + 1
    end
    end

    path = 0
    for _, tile in pairs(getTiles()) do
    if tile.fg == 1684 then
    path = path + 1
    end
    end


sendPacket("action|input\n|text|`#ELSTORE LGRID : `0[`2SEED = `9"..seed.."`0] [`2BLOCK = `9"..block.."`0] [`2GEMS = `9"..gems.."`0] `0 Thanks", 2)

end
end
end

addHook("onvarlist", "startstop", hook)
