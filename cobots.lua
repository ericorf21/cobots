-- Masukkan list bot
bot = {
	"COOBOTS1",
	"COOBOTS2",
	"COOBOTS3",
    "COOBOTS4",
    "COOBOTS5",
    "COOBOTS6",
	"COOBOTS7",
	"COOBOTS8",
    "COOBOTS9",
    "COOBOTS10",
    "COOBOTS11",
    "COOBOTS12",
	"COOBOTS13",
    "COOBOTS14",
    "COOBOTS15",
	"COOBOTS16",
	"COOBOTS17",
    "COOBOTS18",
    "COOBOTS19",
	"COOBOTS20",
    "COOBOTS21",
    "COOBOTS22",
    "COOBOTS23",
	"COOBOTS24",
	"COOBOTS25" }
jumlah = 25  --jumlah bot

function placeTile(x,y,id)
    pkt = {}
    pkt.type = 3
    pkt.int_data = id
    pkt.pos_x = getLocal().pos.x
    pkt.pos_y = getLocal().pos.y
    pkt.int_x = x
    pkt.int_y = y
    sendPacketRaw(pkt)
    sleep(50)
end

function hit_tile(x, y)
    pkt = {}
    pkt.type = 3
    pkt.int_data = 18
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = getLocal().pos.x
    pkt.pos_y = getLocal().pos.y
    sendPacketRaw(pkt)
    sleep(50)
end

playerX = 0
playerY = 0
idBlock = 0
brek = false
brek1 = 0
brek2 = 0

function collectItems()
        pos = getLocal().pos
        for _, obj in pairs(getObjects()) do
        posx = math.abs(pos.x - obj.pos.x)
        posy = math.abs(pos.y - obj.pos.y)
        if posx <= 32 and posy <= 32 then
                pkt = {}
                pkt.type = 11
                pkt.int_data = obj.oid
                pkt.pos_x = obj.pos.x
                pkt.pos_y = obj.pos.y
                sendPacketRaw(pkt)
                sleep(50)
        end
        end
        pos = getLocal().pos
        for _, obj in pairs(getObjects()) do
        posx = math.abs(pos.x - obj.pos.x)
        posy = math.abs(pos.y - obj.pos.y)
        if posx <= 32 and posy <= 32 then
                pkt = {}
                pkt.type = 11
                pkt.int_data = obj.oid
                pkt.pos_x = obj.pos.x
                pkt.pos_y = obj.pos.y
                sendPacketRaw(pkt)
                sleep(50)
        end
        end
        pos = getLocal().pos
        for _, obj in pairs(getObjects()) do
        posx = math.abs(pos.x - obj.pos.x)
        posy = math.abs(pos.y - obj.pos.y)
        if posx <= 32 and posy <= 32 then
                pkt = {}
                pkt.type = 11
                pkt.int_data = obj.oid
                pkt.pos_x = obj.pos.x
                pkt.pos_y = obj.pos.y
                sendPacketRaw(pkt)
                sleep(50)
        end
        end
end

color = {}
color.x = 4
color.y = 0
color.z = 0


function getArgs(str)
    local args={}
    for i in str:gmatch('[^%s]+') do
        args[#args+1]=i
    end
    return args
end

function hook(v)
    if v[0]:find("OnConsoleMessage") then
        name = v[1]:match('<`.[^`]+'):sub(4)
        text = v[1]:match('`$[^`]+'):sub(3)
        if(text:sub(1,1)=='!') then
                memo = getArgs(text:sub(2))
                if(memo[1] == "id") then
                        hasils = string.gsub(memo[2],"`","")
                        idBlock = tonumber(hasils)
                        sendPacket("action|input\n|text|Block Telah Di Set Ke `2"..getItemInfo(idBlock).name, 2)
                elseif(memo[1] == "update") then
                        playerX = math.floor(getLocal().pos.x / 32)
                        playerY = math.floor(getLocal().pos.y / 32)
                        brek1 = playerY - 2
                        brek2 = playerY + 2
                        update = true
                        sendPacket("action|input\n|text|Updated X : "..playerX.." Y : "..playerY, 2)
                elseif(memo[1] == "startpnb") then
                        if mode == "atas" then
                                mode2 = true
                        elseif mode == "bawah" then
                                mode3 = true
                        elseif mode == "atasbawah" then
                                mode1 = true
                        end
                        sendPacket("action|input\n|text|Okeyy Siap `4START PNB..", 2)
                elseif(memo[1] == "pnb") then
                        if memo[2] == "atas" then
                                mode = "atas"
                        elseif memo[2] == "bawah" then
                                mode = "bawah"
                        elseif memo[2] == "atasbawah" then
                                mode = "atasbawah"
                        end
                        sendPacket("action|input\n|text|PNB Mode Di Set Ke "..mode, 2)
                elseif(memo[1] == "stoppnb") then
                        if mode == "atas" then
                                mode2 = false
                        elseif mode == "bawah" then
                                mode3 = false
                        elseif mode == "atasbawah" then
                                mode1 = false
                        end
                        sendPacket("action|input\n|text|Okeyy Siap `4STOP PNB..", 2)
                elseif(memo[1] == "warp") then
                        sendPacket("action|input\n|text|Gas Ke World "..memo[2], 2)
						sleep(1000)
                        sendPacket("action|join_request\nname|"..memo[2], 3)
				elseif(memo[1] == "patokan") then
                        patokans = string.gsub(memo[2],"`","")
                        setItem = tonumber(patokans)
                        sendPacket("action|input\n|text|Block Telah Di Set Ke `2"..getItemInfo(patokans).name, 2)
				elseif(memo[1] == "hancur") then
                        removeHooks()
                        duar = true
                        sendPacket("action|input\n|text|`4SC PNB Sudah Dihancurkan Ngabb", 2)
                end
        end
    end
end
addHook('OnVarlist', 'cmd', hook)
update = false
duar = false
sendPacket("action|input\n|text|SC PNB Sudah Aktif Masseh, `1Icooo Growtopia", 2)
mode = ""
mode1 = false
mode2 = false
mode3 = false

message = "Bariss?? Siap Bang Icooo"
message2 = "Disinikah?? Siap Bang Icoo"



function hook(varlist)
if varlist[0]:find("OnConsoleMessage") then
if varlist[1]:find("!baris") then
autosetbot = true
sendPacket("action|input\n|text|"..message, 2)
elseif varlist[1]:find("!cukup") then
autosetbot = false
sendPacket("action|input\n|text|"..message2, 2)
end
end
end

addHook("OnVarlist", "startstop", hook)
autosetbot = false
	setItem = 20	--2978 is vending -- untk posisi bot
while true do
        sleep(100)
        if update and mode1 then
                collectItems()
                sleep(100)
                for i=0,100 do
                        if mode1 then
                                placeTile(playerX,brek1,idBlock)
                                sleep(125)
                                placeTile(playerX,brek2,idBlock)
                                sleep(125)
                                while(getTile(playerX,brek1).fg ~= 0 or getTile(playerX,brek2).fg ~= 0 or getTile(playerX,brek1).bg ~= 0 or getTile(playerX,brek2).bg ~= 0) do
                                        hit_tile(playerX, brek1)
                                        sleep(125)
                                        hit_tile(playerX, brek2)
                                        sleep(125)
                                end
                        else
                                break
                        end
                        if duar then
                                break
                        end
                end
        end
        sleep(50)
        if update and mode2 then
                collectItems()
                sleep(100)
                for i=0,100 do
                        if mode2 then
                                placeTile(playerX,brek1,idBlock)
                                sleep(50)
                                while(getTile(playerX,brek1).fg ~= 0 or getTile(playerX,brek1).bg ~= 0) do
                                        hit_tile(playerX, brek1)
                                        sleep(50)
                                end
                        else
                                break
                        end
                        sleep(50)
                        if duar then
                                break
                        end
                end
        end
        sleep(50)
        if update and mode3 then
                collectItems()
                sleep(100)
                for i=0,100 do
                        if mode3 then
                                placeTile(playerX,brek2,idBlock)
                                sleep(50)
                                while(getTile(playerX,brek2).fg ~= 0 or getTile(playerX,brek2).bg ~= 0) do
                                        hit_tile(playerX, brek2)
                                        sleep(50)
                                end
                        else
                                break
                        end
                        sleep(50)
                        if duar then
                                break
                        end
                end
        end
        sleep(100)
			if autosetbot then
	tbl={}
	n=0
	for _,tile in pairs(getTiles()) do
		if tile.fg == setItem or tile.bg == setItem then			
			n=n+1
			if getLocal().name == bot[n] then
				findPath(tile.pos.x,tile.pos.y)
				savex = tile.pos.x
				savey = tile.pos.y
				sleep(100)
break				
			end
		end
	end
end
sleep(100)
        if duar then
                break
        end
end
