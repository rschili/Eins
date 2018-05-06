print("Unitframes loading")

local function MoveFrame(frame)
    if frame == nil then
        print("Did not find frame!")
        return false
    end

    -- frame:SetPoint("BOTTOMLEFT", UIParent, "TOPLEFT", -400, 500)]]
    frame:SetMovable(true)
    frame:SetUserPlaced(true)
    frame:SetDontSavePosition(true)
    frame:SetMovable(false)

    --frame:SetParent(hiddenParent)

    local name = frame:GetName()

    local health = PlayerFrameHealthBar --frame.healthbar
    if not (health) then
        print("Did not find healthbar!")
        return false
    end
    health:Hide()

    health:SetStatusBarColor(1, 0, 1, 0.5)

    local power = frame.manabar
    power:SetStatusBarColor(1, 0, 1, 0.5)

    local spell = frame.spellbar

    local altpowerbar = frame.powerBarAlt
end

MoveFrame(PlayerFrame)


local   UnitIsPlayer, UnitIsConnected, UnitClass, RAID_CLASS_COLORS =
        UnitIsPlayer, UnitIsConnected, UnitClass, RAID_CLASS_COLORS
local _, class, c

local function colour(statusbar, unit)
    if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
        _, class = UnitClass(unit)
        c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
        statusbar:SetStatusBarColor(c.r, c.g, c.b)
    end
end

hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
	colour(self, self.unit)
end)

local sb = _G.GameTooltipStatusBar
local addon = CreateFrame("Frame", "StatusColour")
addon:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
addon:SetScript("OnEvent", function()
	colour(sb, "mouseover")
end)

for k, v in pairs(RAID_CLASS_COLORS) do
    print(k)
    for k2, v2 in pairs(v) do
        print("  "..k2.." "..v2)
    end
  end

print("Unitframes loaded")