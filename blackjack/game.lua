monitor = peripheral.find("monitor")
if fs.exists("disk2/wallet.txt") then
    disk.eject("left")
    shell.run("reboot")
end
bet = 3
-- @ = Spades, # = Hearts, + = Clubs, O = Diamonds

-- Draw cards

deck = {{" _________ ", "|A        |", "|@   *    |", "|   / \\   |", "|  /_@_\\  |", "|    !    |", "|   ~ ~  @|",
         "|        V|", " ~~~~~~~~~ ", "A@", 11}, -- A@
{" _________ ", "|2        |", "|@        |", "|    @    |", "|         |", "|    @    |", "|        @|", "|        Z|",
 " ~~~~~~~~~ ", "2@", 2}, -- 2@
{" _________ ", "|3        |", "|@   @    |", "|         |", "|    @    |", "|         |", "|    @   @|", "|        E|",
 " ~~~~~~~~~ ", "3@", 3}, -- 3@
{" _________ ", "|4        |", "|@        |", "|  @   @  |", "|         |", "|  @   @  |", "|        @|", "|        b|",
 " ~~~~~~~~~ ", "4@", 4}, -- 4@
{" _________ ", "|5        |", "|@        |", "|  @   @  |", "|    @    |", "|  @   @  |", "|        @|", "|        S|",
 " ~~~~~~~~~ ", "5@", 5}, -- 5@
{" _________ ", "|6        |", "|@ @   @  |", "|         |", "|  @   @  |", "|         |", "|  @   @ @|", "|        9|",
 " ~~~~~~~~~ ", "6@", 6}, -- 6@
{" _________ ", "|7        |", "|@ @   @  |", "|    @    |", "|  @   @  |", "|         |", "|  @   @ @|", "|        L|",
 " ~~~~~~~~~ ", "7@", 7}, -- 7@
{" _________ ", "|8 @   @  |", "|@        |", "|  @   @  |", "|         |", "|  @   @  |", "|        @|", "|  @   @ 8|",
 " ~~~~~~~~~ ", "8@", 8}, -- 8@
{" _________ ", "|9 @   @  |", "|@        |", "|  @   @  |", "|    @    |", "|  @   @  |", "|        @|", "|  @   @ 6|",
 " ~~~~~~~~~ ", "9@", 9}, -- 9@
{" _________ ", "|10@   @  |", "|@   @    |", "|  @   @  |", "|         |", "|  @   @  |", "|    @   @|", "|  @   @0l|",
 " ~~~~~~~~~ ", "10@", 10}, -- 10@
{" _________ ", "|J /~~|_  |", "|@ ! -\\   |", "|  \\ -!   |", "|  ',\\',  |", "|   I- \\  |", "|   \\- I @|",
 "|  ~|__/ P|", " ~~~~~~~~~ ", "J@", 10}, -- J@
{" _________ ", "|Q |~~~|  |", "|@ \\- -/  |", "| o |-|   |", "|  I % I  |", "|   |-| o |", "|  /- -\\ @|",
 "|  |___| Q|", " ~~~~~~~~~ ", "Q@", 10}, -- Q@
{" _________ ", "|K |/|\\|  |", "|@ \\- -/  |", "| ! |-|   |", "|  % I %  |", "|   |-| ! |", "|  /- -\\ @|",
 "|  |\\|/| X|", " ~~~~~~~~~ ", "K@", 10}, -- K@
{" _________ ", "|A        |", "|# _   _  |", "| / ~V~ \\ |", "| \\ Bej / |", "|  \\ # /  |", "|   '.'  #|",
 "|        V|", " ~~~~~~~~~ ", "A#", 11}, -- A# 
{" _________ ", "|2        |", "|#        |", "|    #    |", "|         |", "|    #    |", "|        #|", "|        Z|",
 " ~~~~~~~~~ ", "2#", 2}, -- 2#
{" _________ ", "|3        |", "|#   #    |", "|         |", "|    #    |", "|         |", "|    #   #|", "|        E|",
 " ~~~~~~~~~ ", "3#", 3}, -- 3#
{" _________ ", "|4        |", "|#        |", "|  #   #  |", "|         |", "|  #   #  |", "|        #|", "|        b|",
 " ~~~~~~~~~ ", "4#", 4}, -- 4#
{" _________ ", "|5        |", "|#        |", "|  #   #  |", "|    #    |", "|  #   #  |", "|        #|", "|        S|",
 " ~~~~~~~~~ ", "5#", 5}, -- 5#
{" _________ ", "|6        |", "|# #   #  |", "|         |", "|  #   #  |", "|         |", "|  #   # #|", "|        9|",
 " ~~~~~~~~~ ", "6#", 6}, -- 6#
{" _________ ", "|7        |", "|# #   #  |", "|    #    |", "|  #   #  |", "|         |", "|  #   # #|", "|        L|",
 " ~~~~~~~~~ ", "7#", 7}, -- 7#
{" _________ ", "|8 #   #  |", "|#        |", "|  #   #  |", "|         |", "|  #   #  |", "|        #|", "|  #   # 8|",
 " ~~~~~~~~~ ", "8#", 8}, -- 8#
{" _________ ", "|9 #   #  |", "|#        |", "|  #   #  |", "|    #    |", "|  #   #  |", "|        #|", "|  #   # 6|",
 " ~~~~~~~~~ ", "9#", 9}, -- 9#
{" _________ ", "|10#   #  |", "|#   #    |", "|  #   #  |", "|         |", "|  #   #  |", "|    #   #|", "|  #   #0l|",
 " ~~~~~~~~~ ", "10#", 10}, -- 10#
{" _________ ", "|J /~~|_  |", "|# % *'.  |", "|  % <~   |", "| %% / %% |", "|   _> %  |", "|  ',* % #|", "|  ~|__/ P|",
 " ~~~~~~~~~ ", "J#", 10}, -- J#
{" _________ ", "|Q |~~~|  |", "|# %*,*%  |", "|  \\_o_/  |", "| -=<*>=- |", "|  /~o~\\  |", "|  %*'*% #|",
 "|  |___| Q|", " ~~~~~~~~~ ", "Q#", 10}, -- Q#
{" _________ ", "|K |/|\\|  |", "|# %*,*%  |", "|  \\_o_/  |", "| #>-=-<# |", "|  /~o~\\  |", "|  %*'*% #|",
 "|  |\\|/| X|", " ~~~~~~~~~ ", "K#", 10}, -- K#
{" _________ ", "|A        |", "|+   *    |", "|    !    |", "|  *-+-*  |", "|    |    |", "|   ~~~  +|", "|        V|",
 " ~~~~~~~~~ ", "A+", 11}, -- A+ 
{" _________ ", "|2        |", "|+        |", "|    +    |", "|         |", "|    +    |", "|        +|", "|        Z|",
 " ~~~~~~~~~ ", "2+", 2}, -- 2+
{" _________ ", "|3        |", "|+   +    |", "|         |", "|    +    |", "|         |", "|    +   +|", "|        E|",
 " ~~~~~~~~~ ", "3+", 3}, -- 3+
{" _________ ", "|4        |", "|+        |", "|  +   +  |", "|         |", "|  +   +  |", "|        +|", "|        b|",
 " ~~~~~~~~~ ", "4+", 4}, -- 4+
{" _________ ", "|5        |", "|+        |", "|  +   +  |", "|    +    |", "|  +   +  |", "|        +|", "|        S|",
 " ~~~~~~~~~ ", "5+", 5}, -- 5+
{" _________ ", "|6        |", "|+ +   +  |", "|         |", "|  +   +  |", "|         |", "|  +   + +|", "|        9|",
 " ~~~~~~~~~ ", "6+", 6}, -- 6+
{" _________ ", "|7        |", "|+ +   +  |", "|    +    |", "|  +   +  |", "|         |", "|  +   + +|", "|        L|",
 " ~~~~~~~~~ ", "7+", 7}, -- 7+
{" _________ ", "|8 +   +  |", "|+        |", "|  +   +  |", "|         |", "|  +   +  |", "|        +|", "|  +   + 8|",
 " ~~~~~~~~~ ", "8+", 8}, -- 8+
{" _________ ", "|9 +   +  |", "|+        |", "|  +   +  |", "|    +    |", "|  +   +  |", "|        +|", "|  +   + 6|",
 " ~~~~~~~~~ ", "9+", 9}, -- 9+
{" _________ ", "|10+   +  |", "|+   +    |", "|  +   +  |", "|         |", "|  +   +  |", "|    +   +|", "|  +   +0l|",
 " ~~~~~~~~~ ", "10+", 10}, -- 10+
{" _________ ", "|J /~~|_  |", "|+ | o',  |", "|  | -|   |", "| =~)+(_= |", "|   |- |  |", "|  '.o | +|", "|  ~|__/ P|",
 " ~~~~~~~~~ ", "J+", 10}, -- J+
{" _________ ", "|Q |~~~|  |", "|+ /o,o\\  |", "|  \\_-_/  |", "| _-~+_-~ |", "|  /~-~\\  |", "|  \\o'o/ +|",
 "|  |___| Q|", " ~~~~~~~~~ ", "Q#", 10}, -- Q+
{" _________ ", "|K |/|\\|  |", "|+ /o,o\\  |", "|  \\_-_/  |", "| ~-_-~-_ |", "|  /~-~\\  |", "|  \\o'o/ +|",
 "|  |\\|/| X|", " ~~~~~~~~~ ", "K+", 10}, -- K+
{" _________ ", "|A        |", "|O  /~\\   |", "|  / ^ \\  |", "| |  )  | |", "|  \\ v /  |", "|   \\_/  O|",
 "|        V|", " ~~~~~~~~~ ", "AO", 11}, -- AO 
{" _________ ", "|2        |", "|O        |", "|    O    |", "|         |", "|    O    |", "|        O|", "|        Z|",
 " ~~~~~~~~~ ", "2O", 2}, -- 2O
{" _________ ", "|3        |", "|O   O    |", "|         |", "|    O    |", "|         |", "|    O   O|", "|        E|",
 " ~~~~~~~~~ ", "3O", 3}, -- 3O
{" _________ ", "|4        |", "|O        |", "|  O   O  |", "|         |", "|  O   O  |", "|        O|", "|        b|",
 " ~~~~~~~~~ ", "4O", 4}, -- 4O
{" _________ ", "|5        |", "|O        |", "|  O   O  |", "|    O    |", "|  O   O  |", "|        O|", "|        S|",
 " ~~~~~~~~~ ", "5O", 5}, -- 5O
{" _________ ", "|6        |", "|O O   O  |", "|         |", "|  O   O  |", "|         |", "|  O   O O|", "|        9|",
 " ~~~~~~~~~ ", "6O", 6}, -- 6O
{" _________ ", "|7        |", "|O O   O  |", "|    O    |", "|  O   O  |", "|         |", "|  O   O O|", "|        L|",
 " ~~~~~~~~~ ", "7O", 7}, -- 7O
{" _________ ", "|8 O   O  |", "|O        |", "|  O   O  |", "|         |", "|  O   O  |", "|        O|", "|  O   O 8|",
 " ~~~~~~~~~ ", "8O", 8}, -- 8O
{" _________ ", "|9 O   O  |", "|O        |", "|  O   O  |", "|    O    |", "|  O   O  |", "|        O|", "|  O   O 6|",
 " ~~~~~~~~~ ", "9O", 9}, -- 9O
{" _________ ", "|10O   O  |", "|O   O    |", "|  O   O  |", "|         |", "|  O   O  |", "|    O   O|", "|  O   O0l|",
 " ~~~~~~~~~ ", "10O", 10}, -- 10O
{" _________ ", "|J /~~|_  |", "|O ( o\\   |", "|  ! \\l   |", "| ^^^Xvvv |", "|   l\\ I  |", "|   \\o ) O|",
 "|  ~|__/ P|", " ~~~~~~~~~ ", "JO", 10}, -- JO
{" _________ ", "|Q |~~~|  |", "|O |o.o|  |", "|   \\v/   |", "|  XXOXX  |", "|   /^\\   |", "|  |o'o| O|",
 "|  |___| Q|", " ~~~~~~~~~ ", "QO", 10}, -- QO
{" _________ ", "|K |/|\\|  |", "|O |o.o|  |", "|   \\v/   |", "|  XXXXX  |", "|   /^\\   |", "|  |o'o| O|",
 "|  |\\|/| X|", " ~~~~~~~~~ ", "KO", 10} -- KO
}

imgCardStop = 9
codeCard = 10
valueCard = 11

x, y = monitor.getSize()

-- Functions
function getBal()
    wallet = fs.open("disk2/wallet.txt", "r")
    bal = wallet.readAll()
    wallet.close()
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

function reset()
    myPoints = 0
    DPoints = 0
    DPointsReal = 0

    myAceCount = 0
    DAceCount = 0

    faceDown = 0

    myCards = {}
    myCardsN = 0

    cardsDrawn = 0

    BlackJack = false
    DBlackJack = false

    messages = {}
    blank = " "
    for i = 2, x - 2 do
        blank = blank .. " "
    end
    for i = 12, y - 2 do
        messages[i - 11] = blank
    end

    firstTurn = true
end

function shuffle(t)
    local n = #t

    while n >= 2 do
        local k = math.random(n)
        t[n], t[k] = t[k], t[n]
        n = n - 1
    end

    return t
end

function clear()
    monitor.clear()
    monitor.setCursorPos(1, 1)
end

function drawScreen()
    clear()
    for j = 2, y - 1 do
        monitor.write("|")
        for i = 1, x - 2 do
            monitor.write(" ")
        end
        monitor.write("|")
    end
    monitor.setCursorPos(1,1)
    monitor.write("+-------------------------------------+")
    monitor.setCursorPos(1,19)
    monitor.write("+-------------------------------------+")
end

function tutorialScreen()
    drawScreen()
    monitor.setCursorPos(x / 2 - 10, 2)
    monitor.write("How to play BlackJack")
    monitor.setCursorPos(2, 4)
    monitor.write("The object of the game is to reach more points")
    monitor.setCursorPos(2, 5)
    monitor.write("than the Dealer without exceding 21")
    monitor.setCursorPos(2, 6)
    monitor.write("Each player will start the game with 2 cards")
    monitor.setCursorPos(2, 7)
    monitor.write("Then you count the points of your cards:")
    monitor.setCursorPos(2, 8)
    monitor.write("o Cards from 2-10 = 2-10 points")
    monitor.setCursorPos(2, 9)
    monitor.write("o J, Q, K = 10 points each")
    monitor.setCursorPos(2, 10)
    monitor.write("o Aces = 11 or 1 points")
    monitor.setCursorPos(2, 11)
    monitor.write("If you have exactly 21 points you made")
    monitor.setCursorPos(2, 12)
    monitor.write("BlackJack and you have won!")
    monitor.setCursorPos(2, 13)
    monitor.write("Exept if the Dealer made BlackJack too")
    monitor.setCursorPos(x / 2 - 12, 15)
    monitor.write("Press any key to continue")
    sleep(.1)
    os.pullEventRaw("monitor_touch")
    drawScreen()
    monitor.setCursorPos(x / 2 - 7, 2)
    monitor.write("A regular turn")
    monitor.setCursorPos(2, 4)
    monitor.write("During your turn you can choose to:")
    monitor.setCursorPos(2, 5)
    monitor.write("o Call for another card:")
    monitor.setCursorPos(2, 6)
    monitor.write("You will get a new card and all its points")
    monitor.setCursorPos(2, 7)
    monitor.write("Is the only way to get points")
    monitor.setCursorPos(2, 8)
    monitor.write("but you could go over 21 pretty easly")
    monitor.setCursorPos(2, 9)
    monitor.write("o Stop:")
    monitor.setCursorPos(2, 10)
    monitor.write("You finish your turn with the points you have")
    monitor.setCursorPos(x / 2 - 12, 12)
    monitor.write("Press any key to continue")
    sleep(.1)
    os.pullEventRaw("monitor_touch")
    drawScreen()
    monitor.setCursorPos(x / 2 - 9, 2)
    monitor.write("Winnigs and Losings")
    monitor.setCursorPos(2, 4)
    monitor.write("At the end of the Dealer turns all the players")
    monitor.setCursorPos(2, 5)
    monitor.write("who have more points than the Dealer and less")
    monitor.setCursorPos(2, 6)
    monitor.write("than 22 points will win")
    monitor.setCursorPos(2, 7)
    monitor.write("People play against the Dealer and not against")
    monitor.setCursorPos(2, 8)
    monitor.write("each others")
    monitor.setCursorPos(2, 13)
    monitor.write("All earnings are divided by 3")
    monitor.setCursorPos(x / 2 - 12, 10)
    monitor.write("Press any key to continue")
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
            if p3 == 5 then
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
                                            return true
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
                            monitor.setCursorPos(1,1)
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
            elseif p3 == 9 then
                return tutorialScreen()
            end
        end
    end
end

function loginScreen()
    drawScreen()
    monitor.setCursorPos(x / 2 - 4, 5)
    monitor.write("New game")
    monitor.setCursorPos(x / 2 - 5, 9)
    monitor.write("How to play")
    monitor.setCursorPos(2, y - 3)
    if loginGUI() then
        return true
    else
        return false
    end
end

function gameScreen()
    drawScreen()
    monitor.setCursorPos(x / 2 - 5, 11)
    monitor.write("More   Stop")
    update()
end

function userlog(message)
    for count = 1, #messages - 1 do
        messages[#messages - count + 1] = messages[#messages - count]
    end
    messages[1] = message
    for count = 1, #messages do
        monitor.setCursorPos(2, 11 + count)
        monitor.write(blank)
        monitor.setCursorPos(2, 11 + count)
        monitor.write(messages[count])
    end
    sleep(1)
end

function update()
    monitor.setCursorPos(2, 11)
    if myPoints > 21 then
        if myAceCount > 0 then
            myAceCount = myAceCount - 1
            myPoints = myPoints - 10
            update()
        else
            monitor.write("You: XX")
        end
    else
        monitor.write("You: " .. myPoints)
    end
    monitor.setCursorPos(x - 11, 11)
    if DPoints > 21 then
        if DAceCount > 0 then
            DAceCount = DAceCount - 1
            DPoints = DPoints - 10
            update()
        else
            monitor.write("Dealer: XX")
        end
    else
        monitor.write("Dealer: " .. DPoints)
    end
end

function printCards(toPrint)
    for i = 1, #toPrint do
        for j = 1, imgCardStop do
            monitor.setCursorPos(2 + 5 * (i - 1), 1 + j)
            monitor.write(deck[toPrint[i]][j])
        end
    end
end

function givePlayer(card)
    myPoints = myPoints + deck[card][valueCard]
    if deck[card][valueCard] == 11 then
        myAceCount = myAceCount + 1
    end
    userlog("You recieved a " .. deck[card][codeCard])
    myCardsN = myCardsN + 1
    myCards[myCardsN] = card
    printCards(myCards)
    update()
end

function giveDealerFaceDown(card)
    DPointsReal = DPointsReal + deck[card][valueCard]
    if deck[card][valueCard] == 11 then
        DAceCount = DAceCount + 1
    end
    userlog("The Dealer received a face-down card")
    faceDown = card
end

function giveDealer(card)
    DPointsReal = DPointsReal + deck[card][valueCard]
    if deck[card][valueCard] == 11 then
        DAceCount = DAceCount + 1
    end
    DPoints = DPoints + deck[card][valueCard]
    userlog("The Dealer received a " .. deck[card][codeCard])
    update()
end

function drawCard()
    cardsDrawn = cardsDrawn + 1
    if cardsDrawn == 53 then
        userlog("No more cards, the deck will be reshuffled")
        deck = shuffle(deck)
        cardsDrawn = 1
    end
    return cardsDrawn
end

function deal()
    givePlayer(drawCard())
    giveDealerFaceDown(drawCard())
    givePlayer(drawCard())
    giveDealer(drawCard())
    if myPoints == 21 then
        userlog("BlackJack")
        BlackJack = true
    end
end

function turn()
    if myPoints < 21 then
        userlog("Is your turn")
        if firstTurn then
            firstTurn = false
        end
        while true do
            local event, p1, p2, p3 = os.pullEventRaw()
            if event == "char" then
                if p1 == "m" then
                    givePlayer(drawCard())
                    return true
                elseif p1 == "s" then
                    userlog("You stopped")
                    return false
                end
            elseif event == "mouse_click" or event == "monitor_touch" then
                if p2 >= (x / 2 - 5) and p2 <= (x / 2 - 2) then
                    givePlayer(drawCard())
                    return true
                elseif p2 >= (x / 2 + 1) and p2 <= (x / 2 + 4) then
                    userlog("You stopped")
                    return false
                end
            end
        end
    elseif myPoints > 21 then
        if not (BlackJack) then
            userlog("you are out")
            userlog("Your total is greater than 21,")
        end
        return false
    else
        userlog("Your total is 21, you have to stop")
        return false
    end
end

function reveal()
    userlog("The Dealer reveal the face down card")
    userlog("It's a " .. deck[faceDown][codeCard])
    DPoints = DPointsReal
    if DPoints == 21 then
        userlog("The dealer made BlackJack")
        DBlackJack = true
    end
    update()
end

function DTurn()
    if DPoints <= 15 then
        giveDealer(drawCard())
        return true
    elseif DPoints >= 16 and DPoints <= 21 then
        if not (DBlackJack) then
            userlog("The Dealer stopped")
            return false
        end
    elseif DPoints > 21 then
        userlog("than 21, she is out")
        userlog("The Dealer total is greater,")
        return false
    end
end

function winners()
    if DBlackJack or (DPoints <= 21 and myPoints <= 21 and DPoints >= myPoints) or myPoints > 21 then
        if fs.exists("disk2/wallet.txt") then
            userlog("You have lost")
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
        else
            path = "disk/" .. cardName .. ".txt"
            path = path:gsub("%s+", "")
            bal = bal - bet
            dataBase = fs.open(path, "w")
            dataBase.write(bal)
            dataBase.close()
            loginScreen()
        end
    else
        if fs.exists("disk2/wallet.txt") then
            userlog("You have won")
            wallet = fs.open("disk2/wallet.txt", "r")
            bal = wallet.readAll()
            bet = bet / 3
            bet = (math.floor(bet+0.5))
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
        else
            loginscreen()
        end
    end
    userlog("Press a key to continue")
end

function mainGame()
    gameScreen()
    deck = shuffle(deck)
    deal()
    if not (BlackJack) then
        while turn() do
        end
    end
    userlog("Is the Dealer turn")
    reveal()
    if not (DBlackJack) then
        while DTurn() do
        end
    end
    winners()
end

-- Main
while loginScreen() do
    reset()
    mainGame()
    os.pullEventRaw()
end
monitor.clear()
monitor.setCursorPos(1, 1)
