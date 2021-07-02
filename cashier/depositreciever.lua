local wifi = peripheral.wrap("bottom")
wifi.open(44)

while true do
    local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        bal = bal + 1
        wallet.close()
        wallet = fs.open("disk2/wallet.txt", "w")
        wallet.write(bal)
        wallet.close()
        cardName = disk.getLabel("top")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        term.clear()
    end
end
