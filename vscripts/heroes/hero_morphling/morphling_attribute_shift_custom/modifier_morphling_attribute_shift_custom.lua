modifier_morphling_attribute_shift_custom = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_morphling_attribute_shift_custom:IsPassive()
	return true
end
function modifier_morphling_attribute_shift_custom:IsPurgable()
	return false
end
function modifier_morphling_attribute_shift_custom:RemoveOnDeath()
	return false
end
function modifier_morphling_attribute_shift_custom:IsDebuff()
	return false
end
function modifier_morphling_attribute_shift_custom:IsHidden()
	return true
end
function modifier_morphling_attribute_shift_custom:IsStackable()
	return false
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_morphling_attribute_shift_custom:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROCATTACK_BONUS_DAMAGE_PURE,
        MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
        MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        MODIFIER_PROPERTY_BASE_ATTACK_TIME_CONSTANT,
        MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE 
	}

	return funcs
end

-- Agility bonus
function modifier_morphling_attribute_shift_custom:GetModifierBonusStats_Agility()
	local value = self:GetAbility():GetSpecialValueFor("attributes_bonus")
	return value
end


-- Strength bonus
function modifier_morphling_attribute_shift_custom:GetModifierBonusStats_Strength()
	local value = self:GetAbility():GetSpecialValueFor("attributes_bonus")
	return value
end

-- Bonus attack damage = base coefficient attack damage * strength pct + base coefficient * agility
function modifier_morphling_attribute_shift_custom:GetModifierPreAttack_BonusDamage()
	local value = self:GetParent():GetAgility() * self:GetAbility():GetSpecialValueFor("attributes_to_damage_pct") * self:GetAbility():GetSpecialValueFor("attack_damage_coefficient") + self:GetParent():GetStrength() * self:GetAbility():GetSpecialValueFor("attributes_to_damage_pct") * self:GetAbility():GetSpecialValueFor("attack_damage_coefficient")
	return value
end

-- Bonus base attack time
function modifier_morphling_attribute_shift_custom:GetModifierBaseAttackTimeConstant()
    if self:GetParent():GetStrength() > self:GetParent():GetAgility() then
		local value = self:GetAbility():GetSpecialValueFor("attack_damage_is_pure_pct") * self:GetParent():GetAttackDamage()
   		return value
   	else
   		return nil
   	end
end

-- Bonus pure damage pct
function modifier_morphling_attribute_shift_custom:GetModifierProcAttack_BonusDamage_Pure()
	if self:GetParent():GetStrength() < self:GetParent():GetAgility() then
    	local value = self:GetAbility():GetSpecialValueFor("base_attack_time")
    else
   		return nil
   	end
end