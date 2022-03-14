function zoomimg(axeX,axeY,image,zoom,rotation)
a_ = image:width()/10 
b_ = image:height()/10 
axeX = axeX - (480/2) 
axeY = axeY - (272/2) 
axeX = axeX + image:width()/2 
axeY = axeY + image:height()/2 
axeX = axeX/10 
axeY = axeY/10 
X_ = 0-axeX+ a_/2/10 
Y_ = 0-axeY+ b_/2/10 
Z_ = zoom + 50 
Rot = rotation+180 -- modif
Gu.start3d()
--Gu.clearDepth(0) 
--Gu.clear(Gu.COLOR_BUFFER_BIT+Gu.DEPTH_BUFFER_BIT)
Gum.matrixMode(Gu.PROJECTION) 
Gum.loadIdentity() 
Gum.perspective(30, 16/9, 3, 10000)
Gum.matrixMode(Gu.VIEW)        
Gum.loadIdentity()
Gum.lookAt(0,0,0,0,0,Z_,0,1,0) 
Gu.enable(Gu.TEXTURE_2D)
Gu.texImage(image)
Gu.texFunc(Gu.TFX_MODULATE, Gu.TCC_RGBA)
Gu.texEnvColor(Color.new(255,255,255))
Gu.texFilter(Gu.LINEAR, Gu.LINEAR)
Gu.texScale(0.56,1)
Gu.texOffset(0, 0)
Gu.ambientColor(Color.new(255,255,255)) 
Gum.matrixMode(Gu.MODEL) 
Gum.loadIdentity()
Gum.translate(X_ , Y_ , Z_);
Gum.rotateXYZ(0,0,math.rad(0-Rot)) 
Gum.drawArray(Gu.TRIANGLES, Gu.TEXTURE_32BITF+Gu.VERTEX_32BITF+Gu.TRANSFORM_3D, {{1,1,  a_/2,  b_/2, 0},{0,0,  -a_/2,  -b_/2,  0},{1,0, a_/2,  -b_/2,  0}, {0,0,  -a_/2,  -b_/2, 0},{1,1, a_/2,  b_/2, 0},{0,1, -a_/2,  b_/2, 0},})
Gu.end3d() 
end 
-- remarques à propos de cette fonction:

--  1)  les DIMENSIONS de l'image doivent être de 1 ou 2 ou 4 ou 8 ou 16 ou 32 ou 64 etc. L'image peut être rectangulaire (pas carrée) . MAIS: On peut utiliser n'importe quelles dimensions si on modifie leur pourcentage avec "texScale( %x,%y) " (il est vers le bas de la fonction)  (1 = 100% d'une dimension)          exemple: image de 128x100 --> ça donne texScale(1,0.78)       explications: 128 est le double du double... etc. ...de 1 ,  (comme on l'a vu au début du point 2), les dimensions de base sont repectées donc c'est ok on laisse à 1.        Tandis que: 100 n'est pas un double du double du double... etc. ...de 1 !    voyons donc:  128 est le prochain double du... etc ...de 1. (je ne parle pas de l'autre 128 d'avant)       100 par rapport à 128 c'est : 78%   --> donc au lieu de 1 on met 0.78
--  2) comme montré dans cette fonction il faut ENLEVER GU.CLEAR (j'ai fait pour les deux) sinon:   1.vous êtes obligé de mettre la 3d en dessous des backgrounds mais on le verra dessus par decoupage automatique de la transparence et ça fera d'énormes cochonneries sur les bords de l'image.
--																2.si vous devez justement la mettre en dessous cette 3d c'est parce que si on la met dessus on ne voit plus rien du reste!

voiture = Image.load("image/cars/renaulttwingo1.png")
virage1 = Image.load("image/fonds/circuits/virage1.png")
virage2 = Image.load("image/fonds/circuits/virage2.png")
virage3 = Image.load("image/fonds/circuits/virage3.png")
virage4 = Image.load("image/fonds/circuits/virage4.png")
droite1 = Image.load("image/fonds/circuits/droite1.png")
droite2 = Image.load("image/fonds/circuits/droite2.png")
herbe = Image.load("image/fonds/circuits/herbe.png")
axeX = 0
axeY = 0
vecteur = 0
vitesse = 0
vmax = 2
acceleration = 0.001
ics = 0
igrec = 0


Mp3me.stop()

while true do
pad = Controls.read()
screen:clear()

axeX = axeX + math.sin(math.rad(vecteur))*vitesse
axeY = axeY + math.cos(math.rad(vecteur))*vitesse
x = axeX
y = axeY
ics = axeX + math.sin(math.rad(vecteur))*vitesse
igrec = axeY + math.cos(math.rad(vecteur))*vitesse


screen:blit(x,y,virage2)
screen:blit(x,y-272,virage1)
screen:blit(x+270,y-274,droite2)
screen:blit(x+270+270,y-272,virage4)
screen:blit(x+270+270,y,virage3)
screen:blit(x+270,y,droite2)
screen:blit(ics,igrec,herbe)
if ics>=480 then
ics = ics-480
end


zoomimg(220,100,voiture,0,vecteur)


if pad:right() then vecteur = vecteur-1
elseif pad:left() then vecteur = vecteur+1
end

if pad:cross() then
statut = "go"
else
statut = "neutre"
end

if statut == "go" then
 if vitesse<vmax then
 vitesse = vitesse+acceleration
 end
end
if statut == "neutre" then
 if vitesse>0 then
 vitesse = vitesse-acceleration
 end
end
 

screen.flip()
screen.waitVblankStart()
end
