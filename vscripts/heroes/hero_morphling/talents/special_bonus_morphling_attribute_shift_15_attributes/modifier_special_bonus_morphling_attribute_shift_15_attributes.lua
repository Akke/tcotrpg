modifier_special_bonus_morphling_attribute_shift_15_attributes = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_special_bonus_morphling_attribute_shift_15_attributes:IsPassive()
	return true
end
function modifier_special_bonus_morphling_attribute_shift_15_attributes:IsPurgable()
	return false
end
function modifier_special_bonus_morphling_attribute_shift_15_attributes:RemoveOnDeath()
	return false
end
function modifier_special_bonus_morphling_attribute_shift_15_attributes:IsDebuff()
	return false
end
function modifier_special_bonus_morphling_attribute_shift_15_attributes:IsHidden()
	return true
end
function modifier_special_bonus_morphling_attribute_shift_15_attributes:IsStackable()
	return false
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_special_bonus_morphling_attribute_shift_15_attributes:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS
	}

	return funcs
end

-- Agility bonus
function modifier_special_bonus_morphling_attribute_shift_15_attributes:GetModifierBonusStats_Agility()
	local value = self:GetAbility():GetSpecialValueFor("attributes_bonus")
	return value
end


-- Strength bonus
function modifier_special_bonus_morphling_attribute_shift_15_attributes:GetModifierBonusStats_Strength()
	local value = self:GetAbility():GetSpecialValueFor("attributes_bonus")
	return value
end