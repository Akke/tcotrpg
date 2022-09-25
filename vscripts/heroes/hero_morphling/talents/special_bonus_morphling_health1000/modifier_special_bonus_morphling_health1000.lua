modifier_special_bonus_morphling_health1000 = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_special_bonus_morphling_health1000:IsPassive()
	return true
end
function modifier_special_bonus_morphling_health1000:IsPurgable()
	return false
end
function modifier_special_bonus_morphling_health1000:RemoveOnDeath()
	return false
end
function modifier_special_bonus_morphling_health1000:IsDebuff()
	return false
end
function modifier_special_bonus_morphling_health1000:IsHidden()
	return true
end
function modifier_special_bonus_morphling_health1000:IsStackable()
	return false
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_special_bonus_morphling_health1000:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_BONUS
	}

	return funcs
end

function modifier_special_bonus_morphling_health1000:GetModifierHealthBonus()
	local value = self:GetAbility():GetSpecialValueFor("health")
	return value
end