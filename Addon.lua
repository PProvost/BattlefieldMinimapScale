--[[
Copyright 2010 Quaiche of Dragonblight

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--]]

local addonName, ns = ...

local scale = 1.0
local min, max = 0.5, 3.0

local parent = BattlefieldMinimap
if not parent then return end

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
