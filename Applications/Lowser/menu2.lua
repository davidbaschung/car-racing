screen:blit(0,240,selret)
screen:blit(0,pos_curseur_y,curseur)

if pad:circle() and not oldpad:circle() then
menu = "0"
end

if pad:cross() and not oldpad:cross() then
menu = "2a"
end

if menu == "2a" then
dofile("./rotation.lua")
end