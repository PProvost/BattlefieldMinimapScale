local addonName, ns = ...

local scale = 1.0
local min, max = 0.5, 3.0

local parent = BattlefieldMinimap
local f = CreateFrame("Frame", nil, parent)
f:SetFrameStrata("LOW")
f:EnableMouse(false)
f:SetPoint("TOPLEFT", parent, "TOPLEFT")
f:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT")
f:EnableMouseWheel(true)
f:SetScript("OnMouseWheel", function(frame, delta)
	if not IsAltKeyDown() then return end
	if delta > 0 then 
		scale = scale + 0.25
	elseif delta < 0 then 
		scale = scale - 0.25
	end
	if scale > max then scale = max end
	if scale < min then scale = min end
	parent:SetScale(scale)
end)


