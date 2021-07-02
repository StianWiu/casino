password = false
while password == false do
    term.clear()
    term.setCursorPos(1, 1)
    print("Please Input Password")
    code = read("*")
    if code == "1111" then
        password = true
    end
end
while password == true do
    wifi = peripheral.wrap("back")
    term.clear()
    term.setCursorPos(1, 1)
    print("Press 1 to open Staff door")
    print("Press 3 to open Vault")
    print("Press X to lock tablet")
    local event, p1, p2, p3 = os.pullEventRaw()
    if event == "char" then
        if p1 == "1" then
            wifi.transmit(88, 888, "sadge")
            sleep(5)
            wifi.transmit(88, 888, "sadge")
        end
        if p1 == "3" then
            wifi.transmit(99, 999, "pogchamp")
            sleep(5)
            wifi.transmit(99, 999, "pogchamp")
        end
        if p1 == "x" then
            password = false
        end
    end
end
shell.run("reboot")
