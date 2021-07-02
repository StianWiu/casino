local wifi = peripheral.wrap("right")
wifi.open(88)

-- false = door is closed
while true do
    local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    if message == "1111" then
        door = fs.open("door.txt","r")
        open = door.readAll("door.txt","r")
        door.close()
        if open == "2" then
            turtle.suckUp()
            door = fs.open("door.txt","w")
            door.write("1")
            door.close()
        elseif open == "1" then
            turtle.dropUp()
            door = fs.open("door.txt","w")
            door.write("2")
            door.close()
        end
    end
end
