-- image.nfp needs to be uploaded to the computer.
local old_term = term.current()
mon = peripheral.wrap("monitor_6")
monitor = peripheral.wrap("monitor_6")
speaker = peripheral.wrap("speaker_0")

x, y = monitor.getSize()

function getBal()
    wallet = fs.open("disk2/wallet.txt", "r")
    bal = wallet.readAll()
    wallet.close()
end

function loginScreen()
    mon.setTextScale(1)
    monitor.clear()
    monitor.setCursorPos(11, 9)
    monitor.write("New game")
    monitor.setCursorPos(1, 1)
    monitor.write("")
    monitor.setCursorPos(10, 12)
    monitor.write("How to play")
    loginGUI()
end
function drawImage()
    mon.setTextScale(0.5)
    term.redirect(mon)
    local image = paintutils.loadImage("image.nfp")
    paintutils.drawImage(image, 2, 2)
    monitor.setCursorPos(29, 4)
    monitor.write("0")
    monitor.setCursorPos(34, 5)
    monitor.write("1")
    monitor.setCursorPos(38, 6)
    monitor.write("2")
    monitor.setCursorPos(43, 8)
    monitor.write("3")
    monitor.setCursorPos(47, 10)
    monitor.write("4")
    monitor.setCursorPos(50, 13)
    monitor.write("5")
    monitor.setCursorPos(52, 16)
    monitor.write("6")
    monitor.setCursorPos(52, 20)
    monitor.write("7")
    monitor.setCursorPos(52, 23)
    monitor.write("8")
    monitor.setCursorPos(49, 26)
    monitor.write("9")
    monitor.setCursorPos(47, 29)
    monitor.write("10")
    monitor.setCursorPos(42, 31)
    monitor.write("11")
    monitor.setCursorPos(38, 33)
    monitor.write("12")
    monitor.setCursorPos(33, 34)
    monitor.write("13")
    monitor.setCursorPos(28, 35)
    monitor.write("14")
    monitor.setCursorPos(24, 34)
    monitor.write("15")
    monitor.setCursorPos(19, 33)
    monitor.write("16")
    monitor.setCursorPos(15, 31)
    monitor.write("17")
    monitor.setCursorPos(11, 29)
    monitor.write("18")
    monitor.setCursorPos(7, 26)
    monitor.write("19")
    monitor.setCursorPos(6, 23)
    monitor.write("20")
    monitor.setCursorPos(5, 20)
    monitor.write("21")
    monitor.setCursorPos(6, 16)
    monitor.write("22")
    monitor.setCursorPos(8, 13)
    monitor.write("23")
    monitor.setCursorPos(11, 10)
    monitor.write("24")
    monitor.setCursorPos(15, 8)
    monitor.write("25")
    monitor.setCursorPos(19, 6)
    monitor.write("26")
    monitor.setCursorPos(23, 5)
    monitor.write("27")
end

function drawStartupScreen()
    mon.setTextScale(1)
    monitor.clear()
    monitor.setCursorPos(4, 5)
    monitor.write("Choose how much to bet.")
    monitor.setCursorPos(13, 13)
    monitor.write("Start")
    monitor.setCursorPos(13, 15)
    monitor.write("Reset")
    monitor.setCursorPos(13, 17)
    monitor.write("Exit")
    monitor.setCursorPos(19, 10)
    monitor.write("->")
    monitor.setCursorPos(10, 10)
    monitor.write("<-")
    monitor.setCursorPos(14, 10)
    if fs.exists("disk2/wallet.txt") then
        monitor.write(bet)
        getBal()
        monitor.setCursorPos(1, 19)
        monitor.write(bal)
        monitor.write("$")
    else
        loginScreen()
    end
end

function decreasBet()
    if bet > 3 then
        bet = bet - 1
        drawStartupScreen()
    end
end

function resetBet()
    bet = 3
    drawStartupScreen()
end

function inncreasBet()
    getBal()
    if tonumber(bal) > bet then
        bet = bet + 1
        drawStartupScreen()
    end
end

function clear()
    monitor.clear()
    monitor.setCursorPos(1, 1)
end

function startGame()
    cardName = disk.getLabel("top")
    wallet = fs.open("disk2/wallet.txt", "r")
    bal = wallet.readAll()
    wallet.close()
    drawImage()
    term.redirect(old_term)
    monitor.setCursorPos(27, 17)
    monitor.write("Spin")
    monitor.setCursorPos(27, 19)
    monitor.write("Exit")
    monitor.setCursorPos(24, 22)
    guess = 0
    monitor.write("Selected: " .. guess .. " ")
    -- colors are 1 = black 2 = red
    while true do
        os.queueEvent("randomEvent")
        os.pullEvent()
        local event, p1, p2, p3 = os.pullEventRaw()
        if event == "mouse_click" or event == "monitor_touch" then
            if p2 == 29 then
                if p3 == 4 then
                    guess = 0
                    color = 0
                end
            end
            if p2 == 34 then
                if p3 == 5 then
                    guess = 1
                    color = 1
                end
            end
            if p2 == 38 then
                if p3 == 6 then
                    guess = 2
                    color = 2
                end
            end
            if p2 == 43 then
                if p3 == 8 then
                    guess = 3
                    color = 1
                end
            end
            if p2 == 47 then
                if p3 == 10 then
                    guess = 4
                    color = 2
                end
            end
            if p2 == 50 then
                if p3 == 13 then
                    guess = 5
                    color = 1
                end
            end
            if p2 == 52 then
                if p3 == 16 then
                    guess = 6
                    color = 2
                end
            end
            if p2 == 52 then
                if p3 == 20 then
                    guess = 7
                    color = 1
                end
            end
            if p2 == 52 then
                if p3 == 23 then
                    guess = 8
                    color = 2
                end
            end
            if p2 == 49 then
                if p3 == 26 then
                    guess = 9
                    color = 1
                end
            end
            if p2 == 47 then
                if p3 == 29 then
                    guess = 10
                    color = 2
                end
            end
            if p2 == 42 then
                if p3 == 31 then
                    guess = 11
                    color = 1
                end
            end
            if p2 == 38 then
                if p3 == 33 then
                    guess = 12
                    color = 2
                end
            end
            if p2 == 33 then
                if p3 == 34 then
                    guess = 13
                    color = 1
                end
            end
            if p2 == 28 then
                if p3 == 35 then
                    guess = 14
                    color = 2
                end
            end
            if p2 == 24 then
                if p3 == 34 then
                    guess = 15
                    color = 1
                end
            end
            if p2 == 19 then
                if p3 == 33 then
                    guess = 16
                    color = 2
                end
            end
            if p2 == 15 then
                if p3 == 31 then
                    guess = 17
                    color = 1
                end
            end
            if p2 == 11 then
                if p3 == 29 then
                    guess = 18
                    color = 2
                end
            end
            if p2 == 7 then
                if p3 == 26 then
                    guess = 19
                    color = 1
                end
            end
            if p2 == 6 then
                if p3 == 23 then
                    guess = 20
                    color = 2
                end
            end
            if p2 == 5 then
                if p3 == 20 then
                    guess = 21
                    color = 1
                end
            end
            if p2 == 6 then
                if p3 == 16 then
                    guess = 22
                    color = 2
                end
            end
            if p2 == 8 then
                if p3 == 13 then
                    guess = 23
                    color = 1
                end
            end
            if p2 == 11 then
                if p3 == 10 then
                    guess = 24
                    color = 2
                end
            end
            if p2 == 15 then
                if p3 == 8 then
                    guess = 25
                    color = 1
                end
            end
            if p2 == 19 then
                if p3 == 6 then
                    guess = 26
                    color = 2
                end
            end
            if p2 == 23 then
                if p3 == 5 then
                    guess = 27
                    color = 1
                end
            end
            if p2 == 28 then
                if p3 == 19 then
                    return loginScreen()
                end
            end
            if p2 == 28 then
                if p3 == 17 then
                    if fs.exists("disk2/wallet.txt") then
                        drawImage()
                        term.redirect(old_term)
                        rounds = math.random(80, 160)
                        number = 0
                        spinColor = 2
                        for i = 30, rounds do
                            if number == 27 then
                                number = 0
                            else
                                number = number + 1
                            end
                            if spinColor == 1 then
                                spinColor = 2
                            elseif spinColor == 2 then
                                spinColor = 1
                            end
                            
                            monitor.setCursorPos(28, 19)
                            monitor.write(" " .. number .. " ")
                            if i > rounds / 1.3 then
                                speaker.playNote("guitar", 1, 40)
                                sleep(0.22)
                            elseif i > rounds / 1.5 then
                                speaker.playNote("guitar", 1, 45)
                                sleep(0.2)
                            elseif i > rounds / 2 then
                                speaker.playNote("guitar", 1, 50)
                                sleep(0.18)
                            elseif i > rounds / 3 then
                                speaker.playNote("guitar", 1, 55)
                                sleep(0.16)
                            elseif i > rounds / 4 then
                                speaker.playNote("guitar", 1, 70)
                                sleep(0.14)
                            elseif i > rounds / 5 then
                                speaker.playNote("guitar", 1, 85)
                                sleep(0.12)
                            else
                                speaker.playNote("guitar", 1, 100)
                                sleep(0.1)
                            end
                        end
                    else
                        return loginScreen()
                    end
                    sleep(3)
                    if number == guess then
                        if number == 0 then
                            if fs.exists("disk2/wallet.txt") then
                                wallet = fs.open("disk2/wallet.txt", "r")
                                bal = wallet.readAll()
                                bet = bet * 3
                                bet = (math.floor(bet + 0.5))
                                bal = bal + bet
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
                                drawImage()
                                monitor.setCursorPos(26, 19)
                                monitor.write("You Win!")
                                sleep(3)
                                loginScreen()
                            else
                                loginScreen()
                            end
                        else
                            if fs.exists("disk2/wallet.txt") then
                                wallet = fs.open("disk2/wallet.txt", "r")
                                bal = wallet.readAll()
                                bet = bet * 2
                                bet = (math.floor(bet + 0.5))
                                bal = bal + bet
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
                                drawImage()
                                monitor.setCursorPos(26, 19)
                                monitor.write("You Win!")
                                sleep(3)
                                loginScreen()
                            else
                                loginScreen()
                            end
                        end
                    elseif spinColor == color then
                        drawImage()
                        monitor.setCursorPos(26, 19)
                        monitor.write("You Tied!")
                        sleep(3)
                        loginScreen()
                    else
                        if fs.exists("disk2/wallet.txt") then
                            wallet = fs.open("disk2/wallet.txt", "r")
                            bal = wallet.readAll()
                            bal = bal - bet
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
                            drawImage()
                            monitor.setCursorPos(26, 19)
                            monitor.write("You Lose!")
                            sleep(3)
                            loginScreen()
                        else
                            path = "disk/" .. cardName .. ".txt"
                            path = path:gsub("%s+", "")
                            bal = bal - bet
                            dataBase = fs.open(path, "w")
                            dataBase.write(bal)
                            dataBase.close()
                            loginScreen()
                        end
                    end
                end
            end
            monitor.setCursorPos(24, 22)
            monitor.write("Selected: " .. guess .. " ")
        end
    end
end

function tutorialScreen()
    mon.setTextScale(0.9)
    monitor.clear()
    monitor.setCursorPos(2, 2)
    monitor.write("The object of the game is to bet on the correct number.")
    monitor.setCursorPos(2, 4)
    monitor.write("You will choose how much to bet before the game starts.")
    monitor.setCursorPos(2, 6)
    monitor.write("The higher the number you get the more you get paid.")
    monitor.setCursorPos(2, 8)
    monitor.write("If you bet on green and win you gain 3x what you bet.")
    monitor.setCursorPos(2, 10)
    monitor.write("If you bet on red or black but lose, if the color")
    monitor.setCursorPos(2, 11)
    monitor.write("it landed on.")
    monitor.setCursorPos(2, 13)
    monitor.write("is the same color, you won't gain or lose anything.")
    monitor.setCursorPos(2, 15)
    monitor.write("If you guess the correct number you will get 2x")
    monitor.setCursorPos(2, 16)
    monitor.write("what you bet.")
    monitor.setCursorPos(x / 2 - 12, 19)
    monitor.write("Press any key to continue")
    monitor.setCursorPos(x / 2 - 12, 21)
    monitor.write("  Delivered by PignuuuINC")
    sleep(.1)
    os.pullEventRaw("monitor_touch")
    return loginScreen()
end

function loginGUI()
    while true do
        local event, p1, p2, p3 = os.pullEventRaw()
        if event == "char" then
            if p1 == "x" then
                shell.run("reboot")
            end
        elseif event == "mouse_click" or event == "monitor_touch" then
            if p3 == 9 then
                bet = 3
                if fs.exists("disk2/wallet.txt") then
                    wallet = fs.open("disk2/wallet.txt", "r")
                    bal = wallet.readAll()
                    wallet.close()
                    cardName = disk.getLabel("top")
                    if fs.exists("disk/", cardName) then
                        path = "disk/" .. cardName .. ".txt"
                        path = path:gsub("%s+", "")
                        dataBaseData = fs.open(path, "r")
                        trueBal = dataBaseData.readAll()
                        dataBaseData.close()
                        if trueBal == bal then
                            if tonumber(bal) < 3 then
                                disk.eject("right")
                                disk.eject("front")
                                disk.eject("back")
                                disk.eject("left")
                                disk.eject("top")
                                disk.eject("down")
                            else
                                while true do
                                    os.queueEvent("randomEvent")
                                    os.pullEvent()
                                    drawStartupScreen()
                                    local event, p1, p2, p3 = os.pullEventRaw()
                                    if event == "mouse_click" or event == "monitor_touch" then
                                        if p3 == 10 then
                                            if p2 == 9 then
                                                decreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 10 then
                                                decreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 11 then
                                                decreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 18 then
                                                inncreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 19 then
                                                inncreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 20 then
                                                inncreasBet()
                                            end
                                        end
                                        if p3 == 13 then
                                            return startGame()
                                        end
                                        if p3 == 15 then
                                            resetBet()
                                        end
                                        if p3 == 17 then
                                            monitor.clear()
                                            return loginScreen()
                                        end
                                    end
                                end
                            end
                        else
                            monitor.clear()
                            monitor.setCursorPos(1, 1)
                            monitor.write("Something has gone wrong. Numbers not matching up.")
                            newBal = fs.open("disk2/walletOld.txt", "w")
                            newBal.write(bal)
                            newBal.close()
                            wallet = fs.open("disk2/wallet.txt", "w")
                            wallet.write(trueBal)
                            wallet.close()
                            disk.eject("top")
                            loginScreen()
                        end
                    end
                end
            elseif p3 == 12 then
                return tutorialScreen()
            end
        end
    end
end

while loginScreen() do
    loginGUI()
    os.pullEventRaw()
    monitor.clear()
    monitor.setCursorPos(1, 1)
end
