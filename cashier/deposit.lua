local wifi = peripheral.wrap("right")
while true do
    os.queueEvent("randomEvent")
    os.pullEvent()
    turtle.suckUp()
    for i = 1, 16 do
        turtle.select(i)
        while turtle.getItemDetail() do
            if turtle.getItemDetail()["name"] == "minecraft:diamond_block" then
                turtle.drop(1)
                wifi.transmit(44, 444, true)
            else
                turtle.turnRight()
                turtle.drop()
                turtle.turnLeft()
            end
        end
    end
    sleep(2)
end
