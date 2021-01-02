term.write("length: ")
length = tonumber(io.read())
term.write("\ndoWallsLeft: ")
doWallsLeft = tonumber(io.read())
term.write("\ndoWallsRight: ")
doWallsRight = tonumber(io.read())

startLength = length

function testFuel()
    while turtle.getFuelLevel() < 1 do
        local i = 16
        while i > 0 do
            turtle.select(i)
            turtle.refuel();
            i=i-1
        end
    end
end

function saveForward()
    while turtle.detect() do
        turtle.dig()
    end
    testFuel()
    turtle.forward()
end

function returnHome()
    local toRet = startLength - length
    turtle.turnLeft()
    turtle.turnLeft()
    while toRet > -1 do
        saveForward()
    end

    local i = 16
    while i > 1 do
        if not turtle.getItemDetail(i)[name] == "minecraft:coal" then
            turtle.dropDown(64)
        end
    end

    turtle.turnLeft()
    turtle.turnLeft()
    local toRet = startLength - length
    while toRet > -1 do
        saveForward()
    end
end

function doStep()
    while turtle.detectUp() do
        turtle.digUp()
    end
    testFuel()
    turtle.up()
    while turtle.detectUp() do
        turtle.digUp()
    end
    turtle.placeUp()

    if doWallsRight == 1 then
        turtle.turnRight()
        if not turtle.detect() then
            turtle.place()
        end
        turtle.turnLeft()
    end
    
    if doWallsLeft == 1 then
        turtle.turnLeft()
        if not turtle.detect() then
            turtle.place()
        end
        turtle.turnRight()
    end

    testFuel()
    turtle.down()
    if not turtle.detectDown() then
        turtle.placeDown()
    end

    if doWallsRight == 1 then
        turtle.turnRight()
        if not turtle.detect() then
            turtle.place()
        end
        turtle.turnLeft()
    end
    
    if doWallsLeft == 1 then
        turtle.turnLeft()
        if not turtle.detect() then
            turtle.place()
        end
        turtle.turnRight()
    end
end

while length > -1 do

    doStep()
    saveForward()

    length = length - 1;
end