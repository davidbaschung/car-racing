img = Image.load("image/menu/controles.png")
controles = "0"

voiture = Image.load("image/cars/renaulttwingo1.png")
ligne = Image.load("image/fonds/ligne.png")
attention = Image.load("image/fonds/attention.png")
tableaudebord = Image.load("image/fonds/tableau de bord.png")
x = 230
vitesse = 0
acceleration = 0
route = Image.load("image/fonds/fond1.png")
huile = Image.load("image/fonds/huile.png")
statut = "0"
vertical = 0
arbre = Color.new(59,144,21)
brun = Color.new(121,71,6)
noir = Color.new(0,0,0)
minuteur = Timer.new()
randomhuile_d = 0
randomhuile_f = 0
nouveau = Image.createEmpty(480,272)
nouveau:clear(noir)
minutes = 0
tempsminuteur = Timer.new()
tempscolorV = 0
tempscolorB = 255
cache = Image.createEmpty(20,10)
cache:clear(noir)
red = Color.new(255,0,0)
blancnored = Color.new(254,255,255)
colorVstatut = "0"
colorBstatut = "0"
herse = Image.load("image/fonds/herse.png")
final = "0"

Mp3me.stop()

if controles == "1" then
vertical = 0
acceleration = 0
vitesse = 0
end

while true do
pad = Controls.read() 
screen:clear()

currentTime = minuteur:time()
temps = tempsminuteur:time()
secondes = temps/1000
if final ~= "arrive" then
tempscolor = Color.new(0,tempscolorV,tempscolorB)
end

screen:blit(0,0,nouveau)
nouveau:blit(0,vitesse,route)
nouveau:blit(0,vitesse-272,route)
screen:print(200,vertical+50,"GO",red)
screen:print(200,vertical-200,"bonne chance",red)
nouveau:blit(160,vertical-1300,huile)
nouveau:blit(340,vertical-2500,huile)
nouveau:blit(235,vertical-3100,huile)
nouveau:blit(150,vertical-3600,huile)
nouveau:blit(350,vertical-3670,huile)
nouveau:blit(130,vertical-4000,huile)
nouveau:blit(400,vertical-4000,huile)
nouveau:blit(235,vertical-4350,huile)
screen:blit(230,vertical-4500,attention)
nouveau:blit(130,vertical-5000,huile)
nouveau:blit(235,vertical-5000,huile)
nouveau:blit(400,vertical-5000,huile)
nouveau:blit(150,vertical-5300,huile)
nouveau:blit(255,vertical-5300,huile)
nouveau:blit(420,vertical-5300,huile)
nouveau:blit(100,vertical-5500,huile)
nouveau:blit(205,vertical-5500,huile)
nouveau:blit(370,vertical-5500,huile)
nouveau:blit(120,vertical-5700,huile)
nouveau:blit(255,vertical-5700,huile)
nouveau:blit(400,vertical-5700,huile)
nouveau:blit(100,vertical-5800,attention)
nouveau:blit(400,vertical-5800,attention)
nouveau:blit(230,vertical-5900,herse)
nouveau:blit(170,vertical-6050,herse)
nouveau:blit(300,vertical-6100,herse)
nouveau:blit(170,vertical-6250,herse)
nouveau:blit(270,vertical-6250,herse)
nouveau:blit(370,vertical-6250,herse)
nouveau:blit(220,vertical-6400,huile)
nouveau:blit(320,vertical-6400,huile)
nouveau:blit(120,vertical-6550,herse)
nouveau:blit(420,vertical-6550,herse)
nouveau:blit(140,vertical-6570,herse)
nouveau:blit(400,vertical-6570,herse)
nouveau:blit(160,vertical-6590,herse)
nouveau:blit(380,vertical-6590,herse)
nouveau:blit(180,vertical-6610,herse)
nouveau:blit(360,vertical-6610,herse)
nouveau:blit(200,vertical-6630,herse)
nouveau:blit(340,vertical-6630,herse)
nouveau:blit(220,vertical-6650,herse)
nouveau:blit(320,vertical-6650,herse)
nouveau:blit(240,vertical-6850,herse) --
nouveau:blit(70,vertical-7000,herse)
nouveau:blit(170,vertical-7000,herse)
nouveau:blit(270,vertical-7000,herse)
nouveau:blit(370,vertical-7000,herse)
nouveau:blit(120,vertical-7150,herse)
nouveau:blit(220,vertical-7150,herse)
nouveau:blit(320,vertical-7150,herse)
nouveau:blit(20,vertical-7150,herse)
nouveau:blit(420,vertical-7150,herse)
nouveau:blit(70,vertical-7297,herse)
nouveau:blit(170,vertical-7297,herse)
nouveau:blit(270,vertical-7297,herse)
nouveau:blit(370,vertical-7297,herse)
nouveau:blit(120,vertical-7441,herse)
nouveau:blit(220,vertical-7441,herse)
nouveau:blit(320,vertical-7441,herse)
nouveau:blit(20,vertical-7441,herse)
nouveau:blit(420,vertical-7441,herse)
nouveau:blit(70,vertical-7582,herse)
nouveau:blit(170,vertical-7582,herse)
nouveau:blit(270,vertical-7582,herse)
nouveau:blit(370,vertical-7582,herse)
nouveau:blit(120,vertical-7720,herse)
nouveau:blit(220,vertical-7720,herse)
nouveau:blit(320,vertical-7720,herse)
nouveau:blit(20,vertical-7720,herse)
nouveau:blit(420,vertical-7720,herse)
nouveau:blit(70,vertical-7855,herse)
nouveau:blit(170,vertical-7855,herse)
nouveau:blit(270,vertical-7855,herse)
nouveau:blit(370,vertical-7855,herse)
nouveau:blit(120,vertical-7987,herse)
nouveau:blit(220,vertical-7987,herse)
nouveau:blit(320,vertical-7987,herse)
nouveau:blit(20,vertical-7987,herse)
nouveau:blit(420,vertical-7987,herse)
nouveau:blit(70,vertical-8117,herse)
nouveau:blit(170,vertical-8117,herse)
nouveau:blit(270,vertical-8117,herse)
nouveau:blit(370,vertical-8117,herse)
screen:blit(0,vertical-8500,ligne)

screen:blit(0,vertical+29,ligne)
screen:blit(x+math.random(randomhuile_d,randomhuile_f),180,voiture)
screen:blit(0,245,tableaudebord)

if tempscolorV <= 0 then colorVstatut = "plusV" elseif tempscolorV >= 255 then colorVstatut = "moinsV" end
if tempscolorB <= 0 then colorBstatut = "plusB" elseif tempscolorB >= 255 then colorBstatut = "moinsB" end

if colorVstatut == "plusV" then tempscolorV = tempscolorV+10 elseif colorVstatut == "moinsV" then tempscolorV = tempscolorV-10 end
if colorBstatut == "plusB" then tempscolorB = tempscolorB+10 elseif colorBstatut == "moinsB" then tempscolorB = tempscolorB-10 end

if minutes < 2 then screen:print(10,250,minutes.." minute, "..secondes,tempscolor)
elseif minutes >= 2 then screen:print(10,250,minutes.." minutes,"..secondes,tempscolor)
end
if secondes < 10 then
screen:blit(114,250,cache)
screen:print(130,250,"secondes",tempscolor)
elseif secondes >= 10 then
screen:blit(120,250,cache)
screen:print(130,250,"secondes",tempscolor)
end

if controles == "0" then screen:blit(0,0,img)
 if pad:l() and pad:r() then
 tempsminuteur:reset(0)
 controles = "1"
 end
end

if controles == "1" then
Mp3me.load("sons/spellbound.mp3")
Mp3me.play()
 if pad:cross() then
 tempsminuteur:start()
 end
end

if temps >= 60000 then
tempsminuteur:reset(0)
tempsminuteur:start()
minutes = minutes+1
end

vitesse = vitesse + acceleration
vertical = vertical + acceleration

if final ~= "fini" then
if pad:cross() then
statut = "go" else
statut = "neutre"
end

if pad:cross() and pad:l() and pad:r() and pad:square() and pad:down() and pad:analogY() < -70 then
vertical = 5750
vitesse =  5750
end


if pad:left() then
 if currentTime == 0 then
  if x > 1 then
  x = x-4
  end
 end
end

if pad:right() then
 if currentTime == 0 then
  if x < 443 then
  x = x+4
  end
 end
end
elseif final == "fini" then
statut = "stop"
if acceleration < 1 then 
screen:print(150,30,"pneus creves!!! fin de la partie.",red)
screen:print(150,100,"appuyez sur l et r",red)
 if pad:l() and pad:r() then
 Mp3me.stop()
 dofile("./menu.lua")
 end
end
end

if pad:square() then
statut = "stop"
end

if pad:r() then
statut = "stopforce"
end

if statut == "go" then
acceleration = acceleration + 0.03
 if x > 380 or x < 57 then
 acceleration = acceleration - 0.02
 end
end

if statut == "neutre" then
acceleration = acceleration - 0.02
end

if statut == "stop" then
acceleration = acceleration - 0.08
end

if vitesse >= 272 then
vitesse = 0
end

if statut == "stopforce" then
acceleration = acceleration-0.2
end

if x > 380 or x < 57 then
 if acceleration >= 6 then
 acceleration = 6
 elseif acceleration <= 0 then
 acceleration = 0
 end
else
 if acceleration >= 8 then
 acceleration = 8
 elseif acceleration <= 0 then
 acceleration = 0
 end
end

if vertical >= 8500+32 then
tempsminuteur:stop()
final = "arrive"
acceleration = 0
end

if final == "arrive" then
file = io.open("DEMOK.lua","w")
file:write("good = 1")
file:close()
tempscolor = red
screen:print(50,50,"felicitations, tu es arrive!!!",red)
screen:print(50,60,"ton temps est marque en bas a gauche,",red)
screen:print(50,70,"appuie sur l et r pour revenir au menu",red)
 if pad:l() and pad:r() then
 Mp3me.stop()
 dofile("./menu.lua")
 end
end


if currentTime > 2500 then
minuteur:stop()
minuteur:reset(0)
randomhuile_d = 0
randomhuile_f = 0
elseif currentTime <= 2500 and currentTime > 1 then
randomhuile_d = -2
randomhuile_f = 2
end

pixelh = nouveau:pixel(x+17,149)
pixelhg = nouveau:pixel(x+1,158)
pixelhd = nouveau:pixel(x+33,158)
pixelbg = nouveau:pixel(x+2,212)
pixelbd = nouveau:pixel(x+35,212)

if pixelh == arbre or pixelhg == arbre or pixelhd == arbre then
 if acceleration >= 1 then acceleration = 1
 end
end

if pixelh == brun or pixelhg == brun or pixelhd == brun then
minuteur:start()
end

if pixelhg == blancnored or pixelhd == blancnored or pixelbg == blancnored or pixelbd == blancnored then
final = "fini"
end


screen.flip()
screen.waitVblankStart()
end
