modifier_special_bonus_morphling_magic_resistance15pct = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_special_bonus_morphling_magic_resistance15pct:IsPassive()
	return true
end
function modifier_special_bonus_morphling_magic_resistance15pct:IsPurgable()
	return false
end
function modifier_special_bonus_morphling_magic_resistance15pct:RemoveOnDeath()
	return false
end
function modifier_special_bonus_morphling_magic_resistance15pct:IsDebuff()
	return false
end
function modifier_special_bonus_morphling_magic_resistance15pct:IsHidden()
	return true
end
function modifier_special_bonus_morphling_magic_resistance15pct:IsStackable()
	return false
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_special_bonus_morphling_magic_resistance15pct:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_BONUS
	}

	return funcs
end

function modifier_special_bonus_morphling_magic_resistance15pct:GetModifierMagicalResistanceBonus()
	local value = self:GetAbility():GetSpecialValueFor("magic_resistance_pct")
	return value
end