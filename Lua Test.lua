-- SCRIPT DE PRUEBA - Sin dependencias complejas
print("===================================")
print("✅ SCRIPT DE PRUEBA CARGADO")
print("===================================")

-- 1. Verificar el jugador
local player = game:GetService("Players").LocalPlayer
if player then
    print("👤 Jugador encontrado: " .. player.Name)
else
    print("❌ No se encontró el jugador")
end

-- 2. Verificar el personaje
local character = player and player.Character
if character then
    print("✅ Personaje encontrado: " .. character.Name)
else
    print("⚠️ Personaje no disponible (esperando...)")
    if player then
        player.CharacterAdded:Wait()
        character = player.Character
        print("✅ Personaje cargado: " .. character.Name)
    end
end

-- 3. Contar jugadores en el juego
local totalPlayers = #game:GetService("Players"):GetPlayers()
print("👥 Jugadores en el servidor: " .. totalPlayers)

-- 4. Si hay otros jugadores, mostrar sus nombres
if totalPlayers > 1 then
    print("📋 Lista de jugadores:")
    for _, p in pairs(game:GetService("Players"):GetPlayers()) do
        if p ~= player then
            print("   - " .. p.Name)
        end
    end
else
    print("🔍 Solo estás tú en el servidor")
end

print("===================================")
print("💡 Prueba completada")
print("===================================")
