local wifi = peripheral.wrap("right")
shell.run("clear")
wifi.open(33)
while true do
    -- Wait until message recieved.
    local event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
    -- Run program to copy wallet.txt and rename card.
    shell.run('card.lua "', message, '"')
    term.clear()
    shell.run("clear")
end
