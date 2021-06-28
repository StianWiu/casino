term.clear()
wifi = peripheral.wrap("right")
while true do
    sleep(2)
    os.queueEvent("randomEvent")
    os.pullEvent()
    if fs.exists("disk") then
        if fs.exists("disk/passwd.txt") then
            file = fs.open("disk/passwd.txt","r")
            code = file.readAll()
            file.close()
            if code == "ftBfwuZhPaVtUys9caJkPbiPZEWJb6K3NdvTxoh6aEaANGmUwusDa8NMXqq2SyeWFK3hHdFn2LjMHutdXJSeJSztyy34L3iLEJ3yWxQTbmoZVgPMjQJs4sixsA5AE9V3" then
                wifi.transmit(3333,3,"ftBfwuZhPaVtUys9caJkPbiPZEWJb6K3NdvTxoh6aEaANGmUwusDa8NMXqq2SyeWFK3hHdFn2LjMHutdXJSeJSztyy34L3iLEJ3yWxQTbmoZVgPMjQJs4sixsA5AE9V3")
                sleep(1)
                disk.eject("back")
                sleep(10)
                wifi.transmit(3333,3,"ftBfwuZhPaVtUys9caJkPbiPZEWJb6K3NdvTxoh6aEaANGmUwusDa8NMXqq2SyeWFK3hHdFn2LjMHutdXJSeJSztyy34L3iLEJ3yWxQTbmoZVgPMjQJs4sixsA5AE9V3")
            else
                disk.eject("back")
            end
        end
    else
        disk.eject("back")
    end
end