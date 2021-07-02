wifi = peripheral.wrap("back")
print("Choose what channel to start from")
channel1 = read()
print("Choose what channel to end at")
channel2 = read()
for i = channel1, channel2 do
    chars = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
             "v", "w", "x", "y", "z"}
    tableName = {0}

    function tableAdd(tabl)
        if tabl[1] < #chars then
            tabl[1] = tabl[1] + 1
        else
            for i = 1, #tabl do
                if tabl[1] == #chars or tabl[i] + 1 > (#chars + 1) then
                    tabl[i] = 1
                    if i + 1 > #tabl then
                        tabl[i + 1] = 1
                    else
                        tabl[i + 1] = tabl[i + 1] + 1
                    end
                end
            end
        end
    end

    function tableToChars(tabl)
        local result = {0}
        setmetatable(result, {
            __len = function()
                return #tabl
            end
        })
        for i, v in pairs(tabl) do
            result[i] = chars[v]
        end
        return (string.reverse(table.concat(result)))
    end

    for l = 1, 5000000 do
        os.queueEvent("randomEvent")
        os.pullEvent()
        tableAdd(tableName)
        s = tableToChars(tableName)
        print("Channel:".. i .. " | " .. s)
        wifi.transmit(i, 3333, s)
    end
end
