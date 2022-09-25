modifier_special_bonus_morphling_evasion_15pct = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_special_bonus_morphling_evasion_15pct:IsPassive()
	return true
end
function modifier_special_bonus_morphling_evasion_15pct:IsPurgable()
	return false
end
function modifier_special_bonus_morphling_evasion_15pct:RemoveOnDeath()
	return false
end
function modifier_special_bonus_morphling_evasion_15pct:IsDebuff()
	return false
end
function modifier_special_bonus_morphling_evasion_15pct:IsHidden()
	return true
end
function modifier_special_bonus_morphling_evasion_15pct:IsStackable()
	return false
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_special_bonus_morphling_evasion_15pct:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_EVASION_CONSTANT
	}

	return funcs
end

function modifier_special_bonus_morphling_evasion_15pct:GetModifierEvasion_Constant()
	local value = self:GetAbility():GetSpecialValueFor("evasion")
	return value
end