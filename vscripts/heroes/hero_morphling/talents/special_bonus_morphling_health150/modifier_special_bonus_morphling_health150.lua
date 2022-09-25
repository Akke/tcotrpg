modifier_special_bonus_morphling_health150 = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_special_bonus_morphling_health150:IsPassive()
	return true
end
function modifier_special_bonus_morphling_health150:IsPurgable()
	return false
end
function modifier_special_bonus_morphling_health150:RemoveOnDeath()
	return false
end
function modifier_special_bonus_morphling_health150:IsDebuff()
	return false
end
function modifier_special_bonus_morphling_health150:IsHidden()
	return true
end
function modifier_special_bonus_morphling_health150:IsStackable()
	return false
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_special_bonus_morphling_health150:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_BONUS
	}

	return funcs
end

function modifier_special_bonus_morphling_health150:GetModifierHealthBonus()
	local value = self:GetAbility():GetSpecialValueFor("health")
	return value
end