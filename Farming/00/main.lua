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

function replant()
    turtle.digDown();
    turtle.select(1);
    turtle.placeDown();
end

function plantForward()
    moveForward()
    local i,j = turtle.inspectDown();
    if i then
        local k = j.name;
        if k == "wheat" then
            if j.state.age == 7 then
                replant()
            end
        end
    else
        turtle.digDown();
        turtle.select(1)
        turtle.placeDown();
    end
end

function driveOverGround(xMax,yMax,plant)
    local x = 0
    local y = 0
    while y < yMax do
        while x < xMax do
            x=x+1
            if plant then
                plantForward()
            else
                moveForward()
            end
        end
        y=y+1
        if y % 2 == 0 then
            turtle.turnRight()
            if plant then
                plantForward()
            else
                moveForward()
            end
            turtle.turnRight()
        else
            turtle.turnLeft()
            if plant then
                plantForward()
            else
                moveForward()
            end
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
    driveOverGround(xMax,yMax,true)
    driveOverGround(xMax,yMax,true)
    os.sleep(60);
end


