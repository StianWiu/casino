while true do
    os.queueEvent("randomEvent")
    os.pullEvent()
    shell.run("code.lua")
end