local name = ...
turtle.suckDown()
turtle.drop()
shell.run('label set front"',name,'"')
shell.run("cp wallet.txt disk")
turtle.suck()
turtle.dropUp()