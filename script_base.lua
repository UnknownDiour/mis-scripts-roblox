-- ============================================
-- Script Base para Roblox
-- Autor: UnknownDiour
-- Repositorio: mis-scripts-roblox
-- ============================================

print("🚀 Script cargado correctamente!")
print("👤 Usuario: " .. game.Players.LocalPlayer.Name)

-- ============================================
-- FUNCIÓN: Detectar jugadores cercanos
-- ============================================
local function getNearbyPlayers(radius)
    local players = {}
    local character = game.Players.LocalPlayer.Character
    if not character then return players end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return players end
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local targetChar = player.Character
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                local distance = (rootPart.Position - targetChar.HumanoidRootPart.Position).Magnitude
                if distance <= radius then
                    table.insert(players, {
                        Player = player,
                        Distance = distance,
                        Character = targetChar
                    })
                end
            end
        end
    end
    
    -- Ordenar por distancia (más cercano primero)
    table.sort(players, function(a, b) 
        return a.Distance < b.Distance 
    end)
    
    return players
end

-- ============================================
-- FUNCIÓN: Obtener posición de la cabeza
-- ============================================
local function getHeadPosition(character)
    if not character then return nil end
    local head = character:FindFirstChild("Head")
    if head then
        return head.Position
    end
    return nil
end

-- ============================================
-- EJEMPLO DE USO (descomentar para probar)
-- ============================================
--[[
while wait(1) do
    local nearby = getNearbyPlayers(50)
    if #nearby > 0 then
        local closest = nearby[1]
        local headPos = getHeadPosition(closest.Character)
        if headPos then
            print("🎯 Jugador más cercano: " .. closest.Player.Name .. 
                  " | Distancia: " .. math.floor(closest.Distance) .. " studs")
            print("📌 Posición de cabeza: " .. tostring(headPos))
        end
    else
        print("🔍 No hay jugadores cerca")
    end
end
--]]

print("✅ Script listo para usar!")
