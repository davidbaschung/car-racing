demo = Image.load("image/menu/demo.png")
carriere = Image.load("image/menu/carriere.png")
profil = Image.load("image/menu/profil.png")
options = Image.load("image/menu/options.png")
curseur = Image.load("image/menu/curseur.png")
fondmenu = Image.load("image/menu/fondmenu.png")
bloque = Image.load("image/menu/bloque.png")
bloquerouge = Image.load("image/menu/bloquerouge.png")
selquit = Image.load("image/menu/sel quit.png")
selret = Image.load("image/menu/sel ret.png")

menu = "0"
choix = 1
pos_curseur_y = 50

Mp3me.stop()

minrouge = Timer.new()

function impossible()
if pad:cross() then minrouge:start() end
if (tempsminrouge>0 and tempsminrouge<100) or (tempsminrouge>=200 and tempsminrouge<300) then
 if choix == 2 then
 screen:blit(120,90,bloquerouge)
 end
 if choix == 3 then
 screen:blit(120,130,bloquerouge)
 end
 if choix == 4 then
 screen:blit(120,170,bloquerouge)
 end
end
if tempsminrouge>100 and tempsminrouge<200 then
 if choix == 2 then
 screen:blit(120,90,bloque)
 end
 if choix == 3 then
 screen:blit(120,130,bloque)
 end
 if choix == 4 then
 screen:blit(120,170,bloque)
 end
end
if tempsminrouge>750 then
minrouge:stop()
minrouge:reset(0)
end
end

dofile("./DEMOK.lua")

while true do
pad = Controls.read()
screen:clear()

tempsminrouge = minrouge:time()

screen:blit(0,0,fondmenu)

Mp3me.load("sons/guano apes - open your eyes.mp3")
Mp3me.play()


if choix == 1 and pad:cross() and not oldpad:cross() then
menu = "1"
end
if choix == 2 and pad:cross() and not oldpad:cross() then
menu = "2"
impossible()
end
if choix == 3 and pad:cross() and not oldpad:cross() then
menu = "3"
impossible()
end
if choix == 4 and pad:cross() and not oldpad:cross() then
menu = "4"
impossible()
end

if good == 1 then
 if menu == "0" then
 screen:blit(0,240,selquit)
 screen:blit(120,50,demo)
 screen:blit(120,90,carriere)
 screen:blit(120,130,profil)
 screen:blit(120,170,options)
 screen:blit(50,pos_curseur_y,curseur)
 end
else
screen:blit(0,240,selquit)
screen:blit(120,50,demo)
screen:blit(120,90,carriere)
screen:blit(120,130,profil)
screen:blit(120,170,options)
screen:blit(50,pos_curseur_y,curseur)
end
 
if pad:circle() and not oldpad:circle() then
System.Quit()
end

if good ~= 1 and not impossible() then
screen:blit(120,90,bloque)
screen:blit(120,130,bloque)
screen:blit(120,170,bloque)
end

if pad:down() and not oldpad:down() then
pos_curseur_y = pos_curseur_y+40
choix = choix+1
end
if pad:up() and not oldpad:up() then
pos_curseur_y = pos_curseur_y-40
choix = choix-1
end
if menu == "1" then
dofile("./menu1.lua")
end
if menu  == "2" then
 if good == 1 then
 dofile("./menu2.lua")
 end
end
if menu == "3" then
 if good == 1 then
 dofile("./menu3.lua")
 end
end
if menu == "4" then
 if good == 1 then
 dofile("./menu4.lua")
 end
end

if pos_curseur_y > 170 then 
pos_curseur_y = 50
end
if pos_curseur_y < 50 then
pos_curseur_y = 170
end
if choix > 4 then
choix = 1
end 
if choix < 1 then
choix = 4
end


oldpad = pad

screen.waitVblankStart()
screen.flip()
end
