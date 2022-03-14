minuteur = Timer.new()
positionactu = "1"
presentation = Image.load("image/start/presentation.png")
start = Image.load("image/start/start.png")
start2 = Image.load("image/start/start2.png")

while true do
pad = Controls.read()
screen:clear()
currentTime = minuteur:time()

if positionactu == "1" then
 if currentTime == 0 then
 minuteur:start()
 end
screen:blit(0,0,presentation)
 if currentTime > 1000 then
 screen:blit(5,245,start)
 end
 if currentTime < 1000 then
 screen:blit(5,245,start2)
 end
 if currentTime > 2000 then 
 minuteur:reset(0)
 end
end

if pad:start() then
minuteur:stop()
positionactu = "2"
end

if positionactu == "2" then
dofile("./menu.lua")
end

screen.waitVblankStart()
screen.flip()
end
