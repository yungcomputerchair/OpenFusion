print("Hello wtf!")

function onJoin(plr)
    print(plr.type .. " " .. plr.name .. " joined from LUA!!")

    local waifu = NPC.new(plr.x, plr.y, plr.z, 714)
    plr.onMove:listen(function(angle)
    	local dist = 500
    	local ang = math.rad(angle)
    	waifu:moveTo(plr.x - dist * math.cos(ang), plr.y - dist * math.sin(ang), plr.z)
    end)

    plr.onChat:listen(function(msg)
        print(plr.name .. " said : \'" .. msg .. "\'")

        if msg == "kickme" then
            plr:kick()
        elseif msg == "hi" then
            print("hello " .. plr.name)
        elseif msg == "pet" then
            local dog = NPC.new(plr.x, plr.y, plr.z, 3054)
            while wait(2) and plr:exists() do
                dog:moveTo(plr.x + math.random(-500, 500), plr.y + math.random(-500, 500), plr.z)
            end
        end
    end)
end

World.onPlayerAdded:listen(onJoin)

for i, plr in ipairs(World.players) do
    onJoin(plr)
end

wait(2)
print("Hello world ~2 seconds later! running protcol version " .. World.version)