-- ============================================
-- Script Base Mejorado para Roblox
-- Autor: UnknownDiour
-- Repositorio: mis-scripts-roblox
-- ============================================

print("🔄 Iniciando script...")

-- ============================================
-- ESPERAR A QUE EL JUGADOR ESTÉ LISTO
-- ============================================
local player = game.Players.LocalPlayer
if not player then
    print("⏳ Esperando al jugador...")
    player = game.Players:WaitForChild("LocalPlayer")
end

local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

print("🚀 Script cargado correctamente!")
print("👤 Usuario: " .. player.Name)

-- ============================================
-- FUNCIÓN MEJORADA: Detectar jugadores cercanos
-- ============================================
local function getNearbyPlayers(radius)
    local players = {}
    if not rootPart or not rootPart.Parent then 
        print("⚠️ Personaje no disponible")
        return players 
    end
    
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local targetChar = otherPlayer.Character
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                local targetRoot = targetChar.HumanoidRootPart
                local distance = (rootPart.Position - targetRoot.Position).Magnitude
                
                if distance <= radius then
                    table.insert(players, {
                        Player = otherPlayer,
                        Distance = distance,
                        Character = targetChar,
                        RootPart = targetRoot
                    })
                end
            end
        end
    end
    
    table.sort(players, function(a, b) 
        return a.Distance < b.Distance 
    end)
    
    return players
end

-- ============================================
-- FUNCIÓN: Obtener posición de la cabeza
-- ============================================
local function getHeadPosition(targetChar)
    if not targetChar then return nil end
    local head = targetChar:FindFirstChild("Head")
    if head then
        return head.Position
    end
    return nil
end

-- ============================================
-- FUNCIÓN: Verificar si el script está en un juego
-- ============================================
local function isInGame()
    return game.Players.NumPlayers > 0
end

-- ============================================
-- EJEMPLO DE USO (descomentar para probar)
-- ============================================
--[[
while task.wait(2) do
    if not isInGame() then
        print("⏳ Esperando jugadores...")
        continue
    end
    
    local nearby = getNearbyPlayers(50)
    if #nearby > 0 then
        local closest = nearby[1]
        local headPos = getHeadPosition(closest.Character)
        if headPos then
            print("🎯 Jugador: " .. closest.Player.Name .. 
                  " | Distancia: " .. math.floor(closest.Distance) .. " studs")
        end
    else
        print("🔍 No hay jugadores cerca (radio: 50 studs)")
    end
end
--]]

print("✅ Script listo para usar!")
print("💡 Para activar el escaneo, elimina los comentarios --[[ y ]]-- al final")
