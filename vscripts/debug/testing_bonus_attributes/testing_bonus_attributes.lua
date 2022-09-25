testing_bonus_attributes = class ({})

LinkLuaModifier("modifier_testing_bonus_attributes", "debug/testing_bonus_attributes/testing_bonus_attributes", LUA_MODIFIER_MOTION_NONE)


--------------------------------------------------------------------------------
-- Ability Start
function testing_bonus_attributes:OnSpellStart()
	-- unit identifier
	local caster = self:GetCaster()

	-- load data
	local strength_bonus = self:GetSpecialValueFor( "strength_bonus" )
	local agility_bonus = self:GetSpecialValueFor( "agility_bonus" )

	-- add modifier
	caster:AddNewModifier(
		caster, -- player source
		self, -- ability source
		"modifier_testing_bonus_attributes", -- modifier name
		{ 
			strength_bonus = strength_bonus,
			agility_bonus = agility_bonus
		} -- kv
	)
end


--------------------------------------------------------------------------------
-- Modifiers
modifier_testing_bonus_attributes = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_testing_bonus_attributes:IsPassive()
	return true
end
function modifier_testing_bonus_attributes:IsHidden()
	return true
end
function modifier_testing_bonus_attributes:IsDebuff()
	return false
end
function modifier_testing_bonus_attributes:RemoveOnDeath()
	return false
end

--------------------------------------------------------------------------------
-- Initializations
function modifier_testing_bonus_attributes:OnCreated()
	-- references
	self.strength_bonus = self:GetAbility():GetSpecialValueFor( "strength_bonus" ) -- special value
	self.agility_bonus = self:GetAbility():GetSpecialValueFor( "agility_bonus" ) -- special value
end
function modifier_testing_bonus_attributes:OnRefresh()
	-- references
	self.strength_bonus = self:GetAbility():GetSpecialValueFor( "strength_bonus" ) -- special value
	self.agility_bonus = self:GetAbility():GetSpecialValueFor( "agility_bonus" ) -- special value
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_testing_bonus_attributes:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
	}

	return funcs
end

function modifier_testing_bonus_attributes:GetModifierBonusStats_Agility()
	return self.agility_bonus
end

function modifier_testing_bonus_attributes:GetModifierBonusStats_Strength()
	return self.strength_bonus
end
