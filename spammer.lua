spam = true
message = "`bREME/BJ MIN 10 `5[COFUNS]" -- spam text here
message2 = "`bREME/BJ MIN 10 `c[COFUNS]"

function hook(vlist)
if vlist[0]:find("OnConsoleMessage") then
if vlist[1]:find("stopspam") then
spam = false
elseif vlist[1]:find("startspam") then
spam = true
end
end
end

addHook("onvarlist", "startstop", hook)

while true do
sleep(300)
if spam then
sendPacket("action|input\n|text|"..message, 2)
sleep(5000)
sendPacket("action|input\n|text|"..message2, 2)
sleep(5000)
end
end
-- to start spam write in chat startspam
-- to stop spam write in chat stopspam
-- to edit the interval  change the sleep(4400) to something you like i recommend keeping it as this anti spam detection
