modifier_special_bonus_morphling_wave_twice_attack = class({})

--------------------------------------------------------------------------------
-- Classifications
function modifier_special_bonus_morphling_wave_twice_attack:IsPassive()
	return true
end
function modifier_special_bonus_morphling_wave_twice_attack:IsPurgable()
	return false
end
function modifier_special_bonus_morphling_wave_twice_attack:RemoveOnDeath()
	return false
end
function modifier_special_bonus_morphling_wave_twice_attack:IsDebuff()
	return false
end
function modifier_special_bonus_morphling_wave_twice_attack:IsHidden()
	return true
end
function modifier_special_bonus_morphling_wave_twice_attack:IsStackable()
	return false
end

--------------------------------------------------------------------------------
-- Modifier Effects
function modifier_special_bonus_morphling_wave_twice_attack:DeclareFunctions()
	local funcs = {
		return nil
	}

	return funcs
end