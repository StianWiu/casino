monitor = peripheral.wrap("monitor_1")
monitor.setTextScale(0.9)
monitor.clear()
monitor.setCursorPos(3, 3)
monitor.write("Insert Card")
while true do
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        wallet.close()
        cardName = disk.getLabel("right")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        if fs.exists(path) then
            dataBaseData = fs.open(path, "r")
            trueBal = dataBaseData.readAll()
            dataBaseData.close()
            if trueBal == bal then
                monitor.clear()
                monitor.setCursorPos(1, 1)
                monitor.write(bal .. "$")
                monitor.setCursorPos(5, 2)
                monitor.write("Deposit")
                monitor.setCursorPos(5, 6)
                monitor.write("Cashout")
                monitor.setCursorPos(6, 9)
                monitor.write("Exit")
                while fs.exists("disk2/wallet.txt") == true do
                    wallet = fs.open("disk2/wallet.txt", "r")
                    bal = wallet.readAll()
                    wallet.close()
                    local event, p1, p2, p3 = os.pullEventRaw()
                    if event == "mouse_click" or event == "monitor_touch" then
                        if p3 == 2 then
                            reading = true
                            while reading do
                                monitor.clear()
                                monitor.setCursorPos(5, 1)
                                monitor.write("Deposit")
                                monitor.setCursorPos(1, 3)
                                monitor.write("Diamond Blocks")
                                monitor.setCursorPos(7, 5)
                                monitor.write("in")
                                monitor.setCursorPos(3, 7)
                                monitor.write("Red shulker")
                                monitor.setCursorPos(6, 9)
                                monitor.write("Exit")
                                local event, p1, p2, p3 = os.pullEventRaw()
                                if event == "mouse_click" or event == "monitor_touch" then
                                    if p3 == 9 then
                                        wallet = fs.open("disk2/wallet.txt", "r")
                                        bal = wallet.readAll()
                                        wallet.close()
                                        reading = false
                                        monitor.clear()
                                        monitor.setCursorPos(1, 1)
                                        monitor.write(bal .. "$")
                                        monitor.setCursorPos(5, 2)
                                        monitor.write("Deposit")
                                        monitor.setCursorPos(5, 6)
                                        monitor.write("Cashout")
                                        monitor.setCursorPos(6, 9)
                                        monitor.write("Exit")
                                    end
                                end
                            end
                        elseif p3 == 6 then
                            monitor.clear()
                            monitor.setCursorPos(2, 2)
                            monitor.write("Are you sure?")
                            monitor.setCursorPos(8, 5)
                            monitor.write("Y")
                            monitor.setCursorPos(8, 9)
                            monitor.write("N")
                            local event, p1, p2, p3 = os.pullEventRaw()
                            if event == "mouse_click" or event == "monitor_touch" then
                                if p3 == 5 then
                                    wallet = fs.open("disk2/wallet.txt", "r")
                                    bal = wallet.readAll()
                                    if tonumber(bal) > 1 then
                                        bal = bal - 1
                                        local wifi = peripheral.wrap("bottom")
                                        wifi.transmit(55, 555, bal)
                                        wallet = fs.open("disk2/wallet.txt", "w")
                                        wallet.write("0")
                                        wallet.close()
                                        cardName = disk.getLabel("right")
                                        path = "disk/" .. cardName .. ".txt"
                                        path = path:gsub("%s+", "")
                                        dataBase = fs.open(path, "w")
                                        dataBase.write("0")
                                        dataBase.close()
                                        monitor.clear()
                                        monitor.setCursorPos(1,1)
                                        monitor.write("Green Shulker")
                                        sleep(4)
                                        monitor.clear()
                                        monitor.setCursorPos(1, 1)
                                        monitor.write(bal .. "$")
                                        monitor.setCursorPos(5, 2)
                                        monitor.write("Deposit")
                                        monitor.setCursorPos(5, 6)
                                        monitor.write("Cashout")
                                        monitor.setCursorPos(6, 9)
                                        monitor.write("Exit")
                                    else
                                        monitor.clear()
                                        monitor.setCursorPos(1,1)
                                        monitor.write("Not enough")
                                        monitor.setCursorPos(1,3)
                                        monitor.write("to deposit.")
                                        monitor.setCursorPos(1,5)
                                        monitor.write("minimum 2$")
                                        sleep(4)
                                    end
                                elseif p3 == 9 then
                                    monitor.clear()
                                    monitor.setCursorPos(1, 1)
                                    monitor.write(bal .. "$")
                                    monitor.setCursorPos(5, 2)
                                    monitor.write("Deposit")
                                    monitor.setCursorPos(5, 6)
                                    monitor.write("Cashout")
                                    monitor.setCursorPos(6, 9)
                                    monitor.write("Exit")
                                end
                            end
                        elseif p3 == 9 then
                            disk.eject("right")
                        end
                    end
                end
            else
                monitor.clear()
                monitor.setCursorPos(1, 1)
                monitor.write("error")
                monitor.setCursorPos(1, 3)
                monitor.write("404")
                newBal = fs.open("disk2/walletOld.txt", "w")
                newBal.write(bal)
                newBal.close()
                wallet = fs.open("disk2/wallet.txt", "w")
                wallet.write(trueBal)
                wallet.close()
                disk.eject("right")
                sleep(4)
            end
        end
    else
        disk.eject("right")
        monitor.clear()
        monitor.setCursorPos(3, 3)
        monitor.write("Insert Card")
        sleep(1)
    end
    -- return false
end
