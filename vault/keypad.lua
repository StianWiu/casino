wifi = peripheral.wrap("front")
monitor = peripheral.find("monitor")

monitor.clear()
while true do
    monitor.setCursorPos(1, 1)
    monitor.write("1  2  3 ")
    monitor.setCursorPos(1, 3)
    monitor.write("4  5  6 ")
    monitor.setCursorPos(1, 5)
    monitor.write("7  8  9 ")
    monitor.setCursorPos(12, 1)
    monitor.write("RESET")
    a = k
    b = k
    c = k
    d = k

    function checkpassword()
        if a == "1" then
            if b == "1" then
                if c == "1" then
                    if d == "1" then
                        wifi.transmit(99, 999, "pogchamp")
                        sleep(5)
                        wifi.transmit(99, 999, "pogchamp")
                        shell.run("reboot")
                    else
                        shell.run("reboot")
                    end
                else
                    shell.run("reboot")
                end
            else
                shell.run("reboot")
            end
        else
            shell.run("reboot")
        end
    end

    while a == k do
        local event, p1, p2, p3 = os.pullEventRaw()
        if event == "mouse_click" or event == "monitor_touch" then
            monitor.setCursorPos(12, 3)
            if p3 == 1 then
                if p2 == 1 then
                    monitor.write("*")
                    a = "1"
                end
            end
            if p3 == 1 then
                if p2 == 4 then
                    monitor.write("*")
                    a = "2"
                end
            end
            if p3 == 1 then
                if p2 == 7 then
                    monitor.write("*")
                    a = "3"
                end
            end
            if p3 == 3 then
                if p2 == 1 then
                    monitor.write("*")
                    a = "4"
                end
            end
            if p3 == 3 then
                if p2 == 4 then
                    monitor.write("*")
                    a = "5"
                end
            end
            if p3 == 3 then
                if p2 == 7 then
                    monitor.write("*")
                    a = "6"
                end
            end
            if p3 == 5 then
                if p2 == 1 then
                    monitor.write("*")
                    a = "7"
                end
            end
            if p3 == 5 then
                if p2 == 4 then
                    monitor.write("*")
                    a = "8"
                end
            end
            if p3 == 5 then
                if p2 == 7 then
                    monitor.write("*")
                    a = "9"
                end
            end
            if p3 == 1 then
                if p2 == 12 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 13 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 14 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 15 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 16 then
                    shell.run("reboot")
                end
            end
        end
    end
    while b == k do
        local event, p1, p2, p3 = os.pullEventRaw()
        if event == "mouse_click" or event == "monitor_touch" then
            monitor.setCursorPos(13, 3)
            if p3 == 1 then
                if p2 == 1 then
                    monitor.write("*")
                    b = "1"
                end
            end
            if p3 == 1 then
                if p2 == 4 then
                    monitor.write("*")
                    b = "2"
                end
            end
            if p3 == 1 then
                if p2 == 7 then
                    monitor.write("*")
                    b = "3"
                end
            end
            if p3 == 3 then
                if p2 == 1 then
                    monitor.write("*")
                    b = "4"
                end
            end
            if p3 == 3 then
                if p2 == 4 then
                    monitor.write("*")
                    b = "5"
                end
            end
            if p3 == 3 then
                if p2 == 7 then
                    monitor.write("*")
                    b = "6"
                end
            end
            if p3 == 5 then
                if p2 == 1 then
                    monitor.write("*")
                    b = "7"
                end
            end
            if p3 == 5 then
                if p2 == 4 then
                    monitor.write("*")
                    b = "8"
                end
            end
            if p3 == 5 then
                if p2 == 7 then
                    monitor.write("*")
                    b = "9"
                end
            end
            if p3 == 1 then
                if p2 == 12 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 13 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 14 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 15 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 16 then
                    shell.run("reboot")
                end
            end
        end
    end
    while c == k do
        local event, p1, p2, p3 = os.pullEventRaw()
        if event == "mouse_click" or event == "monitor_touch" then
            monitor.setCursorPos(14, 3)
            if p3 == 1 then
                if p2 == 1 then
                    monitor.write("*")
                    c = "1"
                end
            end
            if p3 == 1 then
                if p2 == 4 then
                    monitor.write("*")
                    c = "2"
                end
            end
            if p3 == 1 then
                if p2 == 7 then
                    monitor.write("*")
                    c = "3"
                end
            end
            if p3 == 3 then
                if p2 == 1 then
                    monitor.write("*")
                    c = "4"
                end
            end
            if p3 == 3 then
                if p2 == 4 then
                    monitor.write("*")
                    c = "5"
                end
            end
            if p3 == 3 then
                if p2 == 7 then
                    monitor.write("*")
                    c = "6"
                end
            end
            if p3 == 5 then
                if p2 == 1 then
                    monitor.write("*")
                    c = "7"
                end
            end
            if p3 == 5 then
                if p2 == 4 then
                    monitor.write("*")
                    c = "8"
                end
            end
            if p3 == 5 then
                if p2 == 7 then
                    monitor.write("*")
                    c = "9"
                end
            end
            if p3 == 1 then
                if p2 == 12 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 13 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 14 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 15 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 16 then
                    shell.run("reboot")
                end
            end
        end
    end
    while d == k do
        local event, p1, p2, p3 = os.pullEventRaw()
        if event == "mouse_click" or event == "monitor_touch" then
            monitor.setCursorPos(15, 3)
            if p3 == 1 then
                if p2 == 1 then
                    monitor.write("*")
                    d = "1"
                end
            end
            if p3 == 1 then
                if p2 == 4 then
                    monitor.write("*")
                    d = "2"
                end
            end
            if p3 == 1 then
                if p2 == 7 then
                    monitor.write("*")
                    d = "3"
                end
            end
            if p3 == 3 then
                if p2 == 1 then
                    monitor.write("*")
                    d = "4"
                end
            end
            if p3 == 3 then
                if p2 == 4 then
                    monitor.write("*")
                    d = "5"
                end
            end
            if p3 == 3 then
                if p2 == 7 then
                    monitor.write("*")
                    d = "6"
                end
            end
            if p3 == 5 then
                if p2 == 1 then
                    monitor.write("*")
                    d = "7"
                end
            end
            if p3 == 5 then
                if p2 == 4 then
                    monitor.write("*")
                    d = "8"
                end
            end
            if p3 == 5 then
                if p2 == 7 then
                    monitor.write("*")
                    d = "9"
                end
            end
            if p3 == 1 then
                if p2 == 12 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 13 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 14 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 15 then
                    shell.run("reboot")
                end
            end
            if p3 == 1 then
                if p2 == 16 then
                    shell.run("reboot")
                end
            end
        end
        checkpassword()
    end
end
