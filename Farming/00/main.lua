function checkFuel()
    if turtle.getFuelLevel() < 1 then
        local currentSlot = turtle.getSelectedSlot();
        turtle.select(15)
        if turtle.getItemCount(15) < 1 then
            term.write("bitte in Slot 15 brennstoff nachlegen\n")
            while turtle.getItemCount(15) < 1 do
                os.sleep(10);
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

function buildGround(xMax,yMax)
    x = 0
    y = 0
    while y < yMax do
        while x < xMax do
            x=x+1
            moveForward()
        end
        y=y+1
        turtle.turnRight()
        moveForward()
        turtle.turnRight()
        x=xMax
    end
end

term.write("bitteLängeEingeben\n");
local xMax = tonumber(io.read());
term.write("bitteBreiteEingeben\n");
local yMax = tonumber(io.read());
buildGround(xMax,yMax)



