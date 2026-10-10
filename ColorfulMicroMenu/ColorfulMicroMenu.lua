local RETAIL_TEXTURE = [[Interface\AddOns\ColorfulMicroMenu\media\UIMicroMenu2x.blp]]
-- Forever 支援暫停；相關代碼及素材保留，不載入。
-- local FOREVER_TEXTURE = [[Interface\AddOns\ColorfulMicroMenu\media\UIMicroMenuC602x.blp]]
-- local IS_FOREVER = (WOW_PROJECT_ID == WOW_PROJECT_CAMELOT)

-- if (WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE) and (WOW_PROJECT_ID ~= WOW_PROJECT_CAMELOT) then return end
if WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE then return end

-- Micro menu button colors / 按鈕顏色
local COLORS = {
	Character = {0.35, 0.65, 1},
	Profession = {0.1, 0.9, 0.9},
	Spellbook = {1, 0.58, 0.65},
	-- Talent = {0.21, 1, 0.95},
	-- Legacy = {1, 0.75, 0.25},
	Achievement = {1, 0.62, 0.1},
	QuestLog = {0.96, 1, 0},
	Housing = {0.75, 0.55, 1},
	Guild = {0, 1, 0.1},
	LFD = {0.7, 0.7, 1},
	EJ = {1, 1, 1},
	Collections = {1, 0.7, 0.58},
	Store = {1, 0.83, 0.5},
	MainMenu = {1, 0.4, 0.4},
	Help = {1, 1, 1},
}

local MICRO_TEXTURE, MICRO_BUTTONS, ATLAS_COORDS
-- Forever 分支完整保留於註釋中；下方只啟用 Retail。
--[=[
if IS_FOREVER then
	MICRO_TEXTURE = FOREVER_TEXTURE
	MICRO_BUTTONS = {
		{"CharacterMicroButton", COLORS.Character},
		{"ProfessionMicroButton", COLORS.Profession},
		{"SpellbookMicroButton", COLORS.Spellbook},
		{"TalentMicroButton", COLORS.Talent},
		{"LegacyMicroButton", COLORS.Legacy},
		{"QuestLogMicroButton", COLORS.QuestLog},
		{"HousingMicroButton", COLORS.Housing},
		{"GuildMicroButton", COLORS.Guild},
		{"LFDMicroButton", COLORS.LFD},
		{"CollectionsMicroButton", COLORS.Collections},
		{"EJMicroButton", COLORS.EJ},
		{"HelpMicroButton", COLORS.Help},
		{"StoreMicroButton", COLORS.Store},
		{"MainMenuMicroButton", COLORS.MainMenu},
	}

	ATLAS_COORDS = {
		["UI-HUD-MicroMenu-AdventureGuide-Disabled"] = {0.0009765625, 0.0634765625, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-AdventureGuide-Down"] = {0.0009765625, 0.0634765625, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-AdventureGuide-Mouseover"] = {0.0009765625, 0.0634765625, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-AdventureGuide-Up"] = {0.0009765625, 0.0634765625, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Collections-Disabled"] = {0.0654296875, 0.1279296875, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Collections-Down"] = {0.0654296875, 0.1279296875, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Collections-Mouseover"] = {0.0654296875, 0.1279296875, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Collections-Up"] = {0.0654296875, 0.1279296875, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-GameMenu-Disabled"] = {0.0654296875, 0.1279296875, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-GameMenu-Down"] = {0.0654296875, 0.1279296875, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-GameMenu-Mouseover"] = {0.1298828125, 0.1923828125, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-GameMenu-Up"] = {0.1298828125, 0.1923828125, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Groupfinder-Disabled"] = {0.1298828125, 0.1923828125, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Groupfinder-Down"] = {0.1298828125, 0.1923828125, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Groupfinder-Mouseover"] = {0.1298828125, 0.1923828125, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-Groupfinder-Up"] = {0.1298828125, 0.1923828125, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-GuildCommunities-Disabled"] = {0.1943359375, 0.2568359375, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-GuildCommunities-Down"] = {0.1943359375, 0.2568359375, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-GuildCommunities-GuildColor-Disabled"] = {0.1943359375, 0.2568359375, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-GuildCommunities-GuildColor-Down"] = {0.1943359375, 0.2568359375, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-GuildCommunities-GuildColor-Mouseover"] = {0.1943359375, 0.2568359375, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-GuildCommunities-GuildColor-Up"] = {0.1943359375, 0.2568359375, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-GuildCommunities-Mouseover"] = {0.2587890625, 0.3212890625, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-GuildCommunities-Up"] = {0.2587890625, 0.3212890625, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Legacy-Disabled"] = {0.2587890625, 0.3212890625, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Legacy-Down"] = {0.2587890625, 0.3212890625, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-Legacy-mouseover"] = {0.2587890625, 0.3212890625, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Legacy-UP"] = {0.3232421875, 0.3857421875, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Professions-Disabled"] = {0.3232421875, 0.3857421875, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Professions-Down"] = {0.3232421875, 0.3857421875, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Professions-Mouseover"] = {0.3232421875, 0.3857421875, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Professions-Up"] = {0.3232421875, 0.3857421875, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-Questlog-Disabled"] = {0.3232421875, 0.3857421875, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Questlog-Down"] = {0.3876953125, 0.4501953125, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Questlog-Mouseover"] = {0.3876953125, 0.4501953125, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Questlog-Up"] = {0.3876953125, 0.4501953125, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Shop-Disabled"] = {0.3876953125, 0.4501953125, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Shop-Down"] = {0.3876953125, 0.4501953125, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-Shop-Mouseover"] = {0.3876953125, 0.4501953125, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Shop-Up"] = {0.4521484375, 0.5146484375, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-SpecTalents-Disabled"] = {0.4521484375, 0.5146484375, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-SpecTalents-Down"] = {0.4521484375, 0.5146484375, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-SpecTalents-Mouseover"] = {0.4521484375, 0.5146484375, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-SpecTalents-Up"] = {0.4521484375, 0.5146484375, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-SpellbookAbilities-Disabled"] = {0.4521484375, 0.5146484375, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-SpellbookAbilities-Down"] = {0.5166015625, 0.5791015625, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-SpellbookAbilities-Mouseover"] = {0.5166015625, 0.5791015625, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-SpellbookAbilities-Up"] = {0.5166015625, 0.5791015625, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-ButtonBG-Down"] = {0.0009765625, 0.0634765625, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-ButtonBG-Up"] = {0.0009765625, 0.0634765625, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Highlightalert"] = {0.2587890625, 0.3212890625, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Achievements-Disabled"] = {0.0009765625, 0.0634765625, 0.001953125, 0.162109375, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Achievements-Down"] = {0.0009765625, 0.0634765625, 0.166015625, 0.326171875, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Achievements-Mouseover"] = {0.0009765625, 0.0634765625, 0.330078125, 0.490234375, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Achievements-Up"] = {0.0009765625, 0.0634765625, 0.494140625, 0.654296875, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Communities-Icon-Notification"] = {0.8388671875, 0.8759765625, 0.001953125, 0.076171875, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-StreamDLGreen-Down"] = {0.5810546875, 0.6435546875, 0.494140625, 0.654296875, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-StreamDLGreen-Up"] = {0.5810546875, 0.6435546875, 0.658203125, 0.818359375, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-StreamDLRed-Down"] = {0.5810546875, 0.6435546875, 0.822265625, 0.982421875, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-StreamDLRed-Up"] = {0.6455078125, 0.7080078125, 0.001953125, 0.162109375, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-StreamDLYellow-Down"] = {0.7099609375, 0.7724609375, 0.001953125, 0.162109375, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-StreamDLYellow-Up"] = {0.7744140625, 0.8369140625, 0.001953125, 0.162109375, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Portrait-Shadow"] = {0.3876953125, 0.4501953125, 0.001953125, 0.162109375, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Portrait-Down"] = {0.3232421875, 0.3857421875, 0.822265625, 0.982421875, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Housing-Disabled"] = {0.3232421875, 0.3857421875, 0.166015625, 0.326171875, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Housing-Down"] = {0.3232421875, 0.3857421875, 0.330078125, 0.490234375, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Housing-Mouseover"] = {0.3232421875, 0.3857421875, 0.494140625, 0.654296875, RETAIL_TEXTURE},
		["UI-HUD-MicroMenu-Housing-Up"] = {0.3232421875, 0.3857421875, 0.658203125, 0.818359375, RETAIL_TEXTURE},
	}
else
]=]
do
	MICRO_TEXTURE = RETAIL_TEXTURE
	MICRO_BUTTONS = {
		{"CharacterMicroButton", COLORS.Character},
		{"ProfessionMicroButton", COLORS.Profession},
		{"PlayerSpellsMicroButton", COLORS.Spellbook},
		{"AchievementMicroButton", COLORS.Achievement},
		{"QuestLogMicroButton", COLORS.QuestLog},
		{"HousingMicroButton", COLORS.Housing},
		{"GuildMicroButton", COLORS.Guild},
		{"LFDMicroButton", COLORS.LFD},
		{"CollectionsMicroButton", COLORS.Collections},
		{"EJMicroButton", COLORS.EJ},
		{"HelpMicroButton", COLORS.Help},
		{"StoreMicroButton", COLORS.Store},
		{"MainMenuMicroButton", COLORS.MainMenu},
	}

	-- Retail 12.1.0.69933：UIMicroMenu2x 的完整座標。
	ATLAS_COORDS = {
		["UI-HUD-MicroMenu-Achievements-Disabled"] = {0.0009765625, 0.0634765625, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Achievements-Down"] = {0.0009765625, 0.0634765625, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Achievements-Mouseover"] = {0.0009765625, 0.0634765625, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Achievements-Up"] = {0.0009765625, 0.0634765625, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-AdventureGuide-Disabled"] = {0.0009765625, 0.0634765625, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-AdventureGuide-Down"] = {0.0009765625, 0.0634765625, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-AdventureGuide-Mouseover"] = {0.0654296875, 0.1279296875, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-AdventureGuide-Up"] = {0.0654296875, 0.1279296875, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Collections-Disabled"] = {0.0654296875, 0.1279296875, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-Collections-Down"] = {0.0654296875, 0.1279296875, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Collections-Mouseover"] = {0.1298828125, 0.1923828125, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Collections-Up"] = {0.1298828125, 0.1923828125, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Communities-Icon-Notification"] = {0.8388671875, 0.8759765625, 0.001953125, 0.076171875},
		["UI-HUD-MicroMenu-GameMenu-Disabled"] = {0.1298828125, 0.1923828125, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-GameMenu-Down"] = {0.1298828125, 0.1923828125, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-GameMenu-Mouseover"] = {0.1298828125, 0.1923828125, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-GameMenu-Up"] = {0.1298828125, 0.1923828125, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Groupfinder-Disabled"] = {0.1943359375, 0.2568359375, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Groupfinder-Down"] = {0.1943359375, 0.2568359375, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Groupfinder-Mouseover"] = {0.1943359375, 0.2568359375, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Groupfinder-Up"] = {0.1943359375, 0.2568359375, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-GuildCommunities-Disabled"] = {0.1943359375, 0.2568359375, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-GuildCommunities-Down"] = {0.1943359375, 0.2568359375, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-GuildCommunities-Mouseover"] = {0.2587890625, 0.3212890625, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-GuildCommunities-Up"] = {0.2587890625, 0.3212890625, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Highlightalert"] = {0.3232421875, 0.3857421875, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Questlog-Disabled"] = {0.3876953125, 0.4501953125, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Questlog-Down"] = {0.4521484375, 0.5146484375, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Questlog-Mouseover"] = {0.4521484375, 0.5146484375, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Questlog-Up"] = {0.4521484375, 0.5146484375, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Shop-Disabled"] = {0.4521484375, 0.5146484375, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Shop-Mouseover"] = {0.4521484375, 0.5146484375, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-Shop-Down"] = {0.4521484375, 0.5146484375, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-Shop-Up"] = {0.5166015625, 0.5791015625, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-SpecTalents-Disabled"] = {0.5166015625, 0.5791015625, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-SpecTalents-Down"] = {0.5166015625, 0.5791015625, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-SpecTalents-Mouseover"] = {0.5166015625, 0.5791015625, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-SpecTalents-Up"] = {0.5166015625, 0.5791015625, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-SpellbookAbilities-Disabled"] = {0.5166015625, 0.5791015625, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-SpellbookAbilities-Down"] = {0.5810546875, 0.6435546875, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-SpellbookAbilities-Mouseover"] = {0.5810546875, 0.6435546875, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-SpellbookAbilities-Up"] = {0.5810546875, 0.6435546875, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-StreamDLGreen-Down"] = {0.5810546875, 0.6435546875, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-StreamDLGreen-Up"] = {0.5810546875, 0.6435546875, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-StreamDLRed-Down"] = {0.5810546875, 0.6435546875, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-StreamDLRed-Up"] = {0.6455078125, 0.7080078125, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-StreamDLYellow-Down"] = {0.7099609375, 0.7724609375, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-StreamDLYellow-Up"] = {0.7744140625, 0.8369140625, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-ButtonBG-Down"] = {0.0654296875, 0.1279296875, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-ButtonBG-Up"] = {0.0654296875, 0.1279296875, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Portrait-Shadow"] = {0.3876953125, 0.4501953125, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-Portrait-Down"] = {0.3232421875, 0.3857421875, 0.822265625, 0.982421875},
		["UI-HUD-MicroMenu-GuildCommunities-GuildColor-Disabled"] = {0.2587890625, 0.3212890625, 0.001953125, 0.162109375},
		["UI-HUD-MicroMenu-GuildCommunities-GuildColor-Down"] = {0.2587890625, 0.3212890625, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-GuildCommunities-GuildColor-Mouseover"] = {0.2587890625, 0.3212890625, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-GuildCommunities-GuildColor-Up"] = {0.2587890625, 0.3212890625, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Professions-Disabled"] = {0.3876953125, 0.4501953125, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Professions-Down"] = {0.3876953125, 0.4501953125, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Professions-Mouseover"] = {0.3876953125, 0.4501953125, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Professions-Up"] = {0.3876953125, 0.4501953125, 0.658203125, 0.818359375},
		["UI-HUD-MicroMenu-Housing-Disabled"] = {0.3232421875, 0.3857421875, 0.166015625, 0.326171875},
		["UI-HUD-MicroMenu-Housing-Down"] = {0.3232421875, 0.3857421875, 0.330078125, 0.490234375},
		["UI-HUD-MicroMenu-Housing-Mouseover"] = {0.3232421875, 0.3857421875, 0.494140625, 0.654296875},
		["UI-HUD-MicroMenu-Housing-Up"] = {0.3232421875, 0.3857421875, 0.658203125, 0.818359375},
	}
end

local ATLAS_METHODS = {
	{"SetNormalAtlas", "GetNormalTexture"},
	{"SetPushedAtlas", "GetPushedTexture"},
	{"SetDisabledAtlas", "GetDisabledTexture"},
	{"SetHighlightAtlas", "GetHighlightTexture"},
}

local function StyleTexture(texture, color)
	if not texture or texture:GetObjectType() ~= "Texture" then return end
	if texture:IsForbidden() then return end

	local atlas = texture:GetAtlas()
	if atlas then
		local coords = ATLAS_COORDS[atlas]
		texture.ColorfulMicroMenuAtlas = coords and atlas or nil
		if not coords then return end

		local width, height = texture:GetSize()
		texture:SetTexture(coords[5] or MICRO_TEXTURE)
		texture:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		if width > 0 and height > 0 then
			texture:SetSize(width, height)
		end
	else
		-- SetTexture 會清掉 atlas；需要重新套用
		local savedAtlas = texture.ColorfulMicroMenuAtlas
		if not savedAtlas then return end
		local coords = ATLAS_COORDS[savedAtlas]
		if texture:GetTexture() ~= (coords[5] or MICRO_TEXTURE) then
			texture.ColorfulMicroMenuAtlas = nil
			return
		end
	end

	texture:SetVertexColor(color[1], color[2], color[3])
end

local function StyleButton(button)
	local color = button.ColorfulMicroMenuColor
	if not color then return end

	for _, methods in ipairs(ATLAS_METHODS) do
		StyleTexture(button[methods[2]](button), color)
	end
	for _, texture in ipairs({button:GetRegions()}) do
		StyleTexture(texture, color)
	end
end

local function StyleAllButtons()
	for _, buttonInfo in ipairs(MICRO_BUTTONS) do
		StyleButton(_G[buttonInfo[1]])
	end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self)
	self:UnregisterEvent("PLAYER_LOGIN")

	for _, buttonInfo in ipairs(MICRO_BUTTONS) do
		local button = _G[buttonInfo[1]]
		button.ColorfulMicroMenuColor = buttonInfo[2]

		for _, methods in ipairs(ATLAS_METHODS) do
			local getTexture = button[methods[2]]
			hooksecurefunc(button, methods[1], function(owner)
				StyleTexture(getTexture(owner), owner.ColorfulMicroMenuColor)
			end)
		end
		button:HookScript("OnShow", StyleButton)
	end

	-- Forever 傳承的預留閃爍圖層特例一併停用。
	--[=[
	if IS_FOREVER then
		-- 原生的傳承閃爍用了成就的圖示，改回去
		LegacyMicroButton.FlashContent:SetAtlas("UI-HUD-MicroMenu-Legacy-Mouseover")
	end
	]=]

	hooksecurefunc("UpdateMicroButtons", StyleAllButtons)
	-- 公會顏色需在重新套用
	hooksecurefunc("LoadMicroButtonTextures", StyleButton)
	StyleAllButtons()
end)
