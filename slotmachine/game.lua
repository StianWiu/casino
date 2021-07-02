monitor = peripheral.find("monitor")
speaker = peripheral.find("speaker")
monitor.clear()
bet = 3

x, y = monitor.getSize()

-- Functions
function getBal()
    wallet = fs.open("disk2/wallet.txt", "r")
    bal = wallet.readAll()
    wallet.close()
end

line1 = "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
line2 = "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
line3 = "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
line4 = "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
line = 1

function startGame()
    cardName = disk.getLabel("left")
    path = "disk/" .. cardName .. ".txt"
    path = path:gsub("%s+", "")
    wallet = fs.open("disk2/wallet.txt", "r")
    bal = wallet.readAll()
    wallet.close()
    num1 = math.random(1, 9)
    num2 = math.random(1, 9)
    num3 = math.random(1, 9)
    for i = 1, 30 do
        monitor.clear()
        speaker.playNote("guitar", 1, 70)
        if line == 1 then
            monitor.setCursorPos(1, 1)
            monitor.write(line1)
            monitor.setCursorPos(1, 19)
            monitor.write(line1)
            line = 2
        elseif line == 2 then
            monitor.setCursorPos(1, 1)
            monitor.write(line2)
            monitor.setCursorPos(1, 19)
            monitor.write(line2)
            line = 1
        end
        if num1 == 9 then
            num1 = 1
        elseif num2 == 9 then
            num2 = 1
        elseif num3 == 9 then
            num3 = 1
        else
            if i < 20 then
                num1 = num1 + 1
            end
            if i < 25 then
                num2 = num2 + 1
            end
            if i < 30 then
                num3 = num3 + 1
            end
        end
        monitor.setCursorPos(15, 9)
        monitor.write(num1 .. " | " .. num2 .. " | " .. num3)
        if i < 14 then
            sleep(0.3)
        elseif i < 16 then
            sleep(0.4)
        elseif i < 20 then
            sleep(0.5)
        elseif i < 25 then
            sleep(0.6)
        elseif i < 28 then
            sleep(0.8)
        else
            sleep(1)
        end
        if i == 30 then
            for a = 1, 3 do
                monitor.clear()
                monitor.setCursorPos(1, 1)
                monitor.write(line2)
                monitor.setCursorPos(1, 19)
                monitor.write(line2)
                monitor.setCursorPos(15, 9)
                sleep(0.5)
                monitor.write(num1 .. " | " .. num2 .. " | " .. num3)
                sleep(0.5)
            end
            sleep(2)
            monitor.clear()
            monitor.setCursorPos(1, 1)
            monitor.write(line2)
            monitor.setCursorPos(1, 19)
            monitor.write(line2)
            monitor.setCursorPos(15, 3)
            monitor.write(num1 .. " | " .. num2 .. " | " .. num3)
            if num1 == num2 and num2 == num3 then
                if num2 == 9 then
                    monitor.setCursorPos(15,9)
                    monitor.write("You Won!")
                    win1()
                elseif num2 >= 5 then
                    monitor.setCursorPos(15,9)
                    monitor.write("You Won!")
                    win2()
                else
                    monitor.setCursorPos(15,9)
                    monitor.write("You Won!")
                    win3()
                end
            elseif num1 == num2 or num2 == num3 then
                if num2 == 9 then
                    monitor.setCursorPos(15,9)
                    monitor.write("You Won!")
                    win3()
                elseif num2 >= 5 then
                    monitor.setCursorPos(15,9)
                    monitor.write("You Won!")
                    win4()
                else
                    monitor.setCursorPos(15,9)
                    monitor.write("You Won!")
                    win5()
                end
            else
                monitor.setCursorPos(15,9)
                monitor.write("You Lost!")
                lost()
            end
        end
    end
end

function drawStartupScreen()
    monitor.clear()
    monitor.setCursorPos(9, 5)
    monitor.write("Choose how much to bet.")
    monitor.setCursorPos(17, 13)
    monitor.write("Start")
    monitor.setCursorPos(17, 15)
    monitor.write("Reset")
    monitor.setCursorPos(17, 17)
    monitor.write("Exit")
    monitor.setCursorPos(23, 10)
    monitor.write("->")
    monitor.setCursorPos(13, 10)
    monitor.write("<-")
    monitor.setCursorPos(18, 10)
    if fs.exists("disk2/wallet.txt") then
        monitor.write(bet)
        getBal()
        monitor.setCursorPos(1, 1)
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

function tutorialScreen()
    monitor.clear()
    monitor.setCursorPos(8, 2)
    monitor.write("How to play Slotmachines")
    monitor.setCursorPos(2, 4)
    monitor.write("The object of the game is to")
    monitor.setCursorPos(2, 5)
    monitor.write("reach the highest number possible")
    monitor.setCursorPos(2, 6)
    monitor.write("You will choose how much to bet")
    monitor.setCursorPos(2, 7)
    monitor.write("before the game starts. The higher")
    monitor.setCursorPos(2, 8)
    monitor.write("the number you get the more you get")
    monitor.setCursorPos(2, 9)
    monitor.write("paid. So if you bet low and win low")
    monitor.setCursorPos(2, 10)
    monitor.write("you most likely won't gain anything.")
    monitor.setCursorPos(x / 2 - 12, 15)
    monitor.write("Press any key to continue")
    monitor.setCursorPos(x / 2 - 12, 17)
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
                return
            end
        elseif event == "mouse_click" or event == "monitor_touch" then
            if p3 == 3 then
                bet = 3
                if fs.exists("disk2/wallet.txt") then
                    wallet = fs.open("disk2/wallet.txt", "r")
                    bal = wallet.readAll()
                    wallet.close()
                    cardName = disk.getLabel("left")
                    if fs.exists("disk/", cardName) then
                        path = "disk/" .. cardName .. ".txt"
                        path = path:gsub("%s+", "")
                        dataBaseData = fs.open(path, "r")
                        trueBal = dataBaseData.readAll()
                        dataBaseData.close()
                        if trueBal == bal then
                            if tonumber(bal) < 3 then
                                disk.eject("left")
                            else
                                while true do
                                    os.queueEvent("randomEvent")
                                    os.pullEvent()
                                    drawStartupScreen()
                                    local event, p1, p2, p3 = os.pullEventRaw()
                                    if event == "mouse_click" or event == "monitor_touch" then
                                        if p3 == 10 then
                                            if p2 == 13 then
                                                decreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 14 then
                                                decreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 12 then
                                                decreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 23 then
                                                inncreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 24 then
                                                inncreasBet()
                                            end
                                        end
                                        if p3 == 10 then
                                            if p2 == 22 then
                                                inncreasBet()
                                            end
                                        end
                                        if p3 == 13 then
                                            cardName = disk.getLabel("left")
                                            wallet = fs.open("disk2/wallet.txt", "r")
                                            bal = wallet.readAll()
                                            wallet.close()
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
                            disk.eject("left")
                            loginScreen()
                        end
                    end
                end
            elseif p3 == 5 then
                return loginScreen()
            elseif p3 == 7 then
                return tutorialScreen()
            end
        end
    end
end

function loginScreen()
    monitor.clear()
    monitor.setCursorPos(16, 3)
    monitor.write("New game")
    monitor.setCursorPos(16, 5)
    monitor.write("")
    monitor.setCursorPos(15, 7)
    monitor.write("How to play")
    monitor.setCursorPos(2, y - 3)
    if loginGUI() then
        return true
    else
        return false
    end
end
function lost()
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        bal = bal - bet
        wallet.close()
        wallet = fs.open("disk2/wallet.txt", "w")
        wallet.write(bal)
        wallet.close()
        cardName = disk.getLabel("left")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        term.clear()
        sleep(3)
        loginScreen()
    else
        bal = bal - bet
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        loginScreen()
    end
end
function win1()
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        bet = bet / 2
        bet = (math.floor(bet + 0.5))
        bal = bal + bet
        wallet.close()
        wallet = fs.open("disk2/wallet.txt", "w")
        wallet.write(bal)
        wallet.close()
        cardName = disk.getLabel("left")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        term.clear()
        sleep(3)
        loginScreen()
    else
        lloginScreen()
    end
end
function win2()
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        bet = bet / 3
        bet = (math.floor(bet + 0.5))
        bal = bal + bet
        wallet.close()
        wallet = fs.open("disk2/wallet.txt", "w")
        wallet.write(bal)
        wallet.close()
        cardName = disk.getLabel("left")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        term.clear()
        sleep(3)
        loginScreen()
    else
        loginScreen()
    end
end
function win3()
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        bet = bet / 4
        bet = (math.floor(bet + 0.5))
        bal = bal + bet
        wallet.close()
        wallet = fs.open("disk2/wallet.txt", "w")
        wallet.write(bal)
        wallet.close()
        cardName = disk.getLabel("left")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        term.clear()
        sleep(3)
        loginScreen()
    else
        loginScreen()
    end
end
function win4()
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        bet = bet / 5
        bet = (math.floor(bet + 0.5))
        bal = bal + bet
        wallet.close()
        wallet = fs.open("disk2/wallet.txt", "w")
        wallet.write(bal)
        wallet.close()
        cardName = disk.getLabel("left")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        term.clear()
        sleep(3)
        loginScreen()
    else
        loginScreen()
    end
end
function win5()
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        bet = bet / 6
        bet = (math.floor(bet + 0.5))
        bal = bal + bet
        wallet.close()
        wallet = fs.open("disk2/wallet.txt", "w")
        wallet.write(bal)
        wallet.close()
        cardName = disk.getLabel("left")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        term.clear()
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
        loginScreen()
    end
end
function win6()
    if fs.exists("disk2/wallet.txt") then
        wallet = fs.open("disk2/wallet.txt", "r")
        bal = wallet.readAll()
        bet = bet / 7
        bet = (math.floor(bet + 0.5))
        bal = bal + bet
        wallet.close()
        wallet = fs.open("disk2/wallet.txt", "w")
        wallet.write(bal)
        wallet.close()
        cardName = disk.getLabel("left")
        path = "disk/" .. cardName .. ".txt"
        path = path:gsub("%s+", "")
        dataBase = fs.open(path, "w")
        dataBase.write(bal)
        dataBase.close()
        term.clear()
        sleep(3)
        loginScreen()
    else
        loginScreen()
    end
end

-- Main
while loginScreen() do
    drawStartupScreen()
    os.pullEventRaw()
    monitor.clear()
    monitor.setCursorPos(1, 1)
end
