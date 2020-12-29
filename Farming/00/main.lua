function checkFuel()
    if turtle.getFuelLevel() < 1 then
        local currentSlot = turtle.getSelectedSlot();
        turtle.select(15)
        if turtle.getItemCount(15) < 1 then
            term.write("bitte in Slot 15 brennstoff nachlegen\n")
            while turtle.getFuelLevel() < 1 do
                turtle.refuel(1)
                os.sleep(1);
            end
        end
        turtle.refuel(1)
        turtle.select(currentSlot)
    end
end

function moveForward()
    checkFuel()
    if turtle.detect() then
        turtle.dig()
    end
    turtle.forward()
end

function plantForward()
    moveForward()
    local i,j = turtle.inspectDown();
    if i then
        if type(j) == "string" then
            io.write(j.."\n");
        else
            io.write(j[0]);
        end
    end
end

function driveOverGround(xMax,yMax)
    local x = 0
    local y = 0
    while y < yMax do
        while x < xMax do
            x=x+1
            plantForward()
        end
        y=y+1
        if y % 2 == 0 then
            turtle.turnRight()
            plantForward()
            turtle.turnRight()
        else
            turtle.turnLeft()
            plantForward()
            turtle.turnLeft()
        end

        x=0
    end
end

term.write("bitteLängeEingeben\n");
local xMax = tonumber(io.read());
term.write("bitteBreiteEingeben\n");
local yMax = tonumber(io.read());
while true do
    driveOverGround(xMax,yMax)
    os.sleep(60);
end


