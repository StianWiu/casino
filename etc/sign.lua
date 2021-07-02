while true do
    monitor = peripheral.wrap("front")
    while peripheral.wrap("front") do
        monitor.clear()
        monitor.setTextScale(0.5)
        monitor.setCursorPos(3, 5)
        monitor.write("Restricted")
        monitor.setCursorPos(5, 6)
        monitor.write("acces")
        os.pullEvent = os.pullEventRaw
        os.queueEvent("randomEvent")
        os.pullEvent()
        sleep(30)
    end
end
