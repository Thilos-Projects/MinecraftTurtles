i = tonumber(io.read())
while i > -1 do
    while turtle.detect() do
        turtle.dig()
    end
    while turtle.detectUp() do
        turtle.digUp()
    end
    turtle.up()
    while turtle.detectUp() do
        turtle.digUp()
    end
    turtle.placeUp(1)
    turtle.down()
    while turtle.detectDown() do
        turtle.digDown()
    end
    turtle.placeDown(1)
    turtle.forward()
    i=i-1
end