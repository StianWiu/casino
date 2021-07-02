local wifi = peripheral.wrap("right")
wifi.open(55)

while true do
    local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    if message > 64 then
        for i = 1, message do
            turtle.suck(1)
            turtle.dropUp(1)
        end
    else 
        turtle.suck(message)
        turtle.dropUp(message)
    end
end
