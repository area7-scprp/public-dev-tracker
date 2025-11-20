if (CLIENT) then
    local flags = {
        ["p"] = true,  -- physgun
        ["e"] = true,  -- prop spawning
        ["t"] = true   -- toolgun
    }

    function PLUGIN:SpawnMenuOpen()
        if CAMI.PlayerHasAccess(LocalPlayer(), "Helix - Spawnmenu & Context Menu Perms", nil) then return true end
        local charFlags = {}

        for i = 1, #LocalPlayer():GetCharacter():GetFlags() do
            charFlags[#charFlags + 1] = LocalPlayer():GetCharacter():GetFlags()[i]
        end

        for _, flag in pairs(charFlags or {}) do
            if flags[flag] then
                return true
            end
        end

        return false
    end

    function PLUGIN:ContextMenuOpen()
        if CAMI.PlayerHasAccess(LocalPlayer(), "Helix - Spawnmenu & Context Menu Perms", nil) then return true end
        return false
    end
end
