monitor = peripheral.find("monitor")
monitor.clear()
monitor.setCursorPos(1,1)
monitor.setTextScale(0.9)
while true do
    os.queueEvent("randomEvent")
    os.pullEvent()
    monitor.clear()
    monitor.setCursorPos(1,1)
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        wallet.close()
        cardName = disk.getLabel("left")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        if fs.exists(path) then
            dataBaseData = fs.open(path,"r")
            trueBal = dataBaseData.readAll()
            dataBaseData.close()
            if trueBal == bal then
                monitor.setCursorPos(1,1)
                monitor.write("Your balance is " .. bal .. "$")
                sleep(4)
                disk.eject("left")
            else
                monitor.write("Something has gone wrong.")
                monitor.setCursorPos(1,3)
                monitor.write("Numbers not matching up.")
                newBal = fs.open("disk2/walletOld.txt","w")
                newBal.write(bal)
                newBal.close()
                wallet = fs.open("disk2/wallet.txt","w")
                wallet.write(trueBal)
                wallet.close()
                disk.eject("left")
                sleep(6)
            end
        else
            monitor.write("Something went wrong.")
            monitor.setCursorPos(1,3)
            monitor.write("Card not found in database!")
            disk.eject("left")
            sleep(4)
        end
    end
    
end