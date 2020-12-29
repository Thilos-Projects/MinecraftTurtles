local i = tonumber(io.read())
while i > -1 do
    while turtle.detectUp() do
        turtle.digUp()
    end
    turtle.up()
    if not turtle.detect() then
        turtle.place()
    end
    turtle.turnLeft()
    if not turtle.detect() then
        turtle.place()
    end
    turtle.turnLeft()
    if not turtle.detect() then
        turtle.place()
    end
    turtle.turnLeft()
    if not turtle.detect() then
        turtle.place()
    end
    turtle.turnLeft()
end