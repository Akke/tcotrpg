morphling_adaptive_strike_custom = class({})
LinkLuaModifier( "modifier_morphling_adaptive_strike_custom", "hero/hero_morphling/morphling_adaptive_strike_custom/modifier_morphling_adaptive_strike_custom", LUA_MODIFIER_MOTION_NONE )

--------------------------------------------------------------------------------
-- Ability Start
function morphling_adaptive_strike_custom:OnSpellStart()
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()

	-- references
	self.radius = self:GetSpecialValueFor( "damage_radius" )
	self.bounce_radius = self:GetSpecialValueFor( "bounce_radius" )
	local jumps = self:GetSpecialValueFor( "max_targets" )
	self.damage = self:GetSpecialValueFor( "damage_base" ) + self:GetParent():GetStrength() * self:GetAbility():GetSpecialValueFor("attributes_to_damage_pct") + self:GetParent():GetAgility() * self:GetAbility():GetSpecialValueFor("attributes_to_damage_pct")

	-- precache damage
	self.damageTable = {
		-- victim = target,
		attacker = caster,
		damage = self.damage,
		damage_type = DAMAGE_TYPE_PHYSICAL,
		ability = self, --Optional.
	}

	-- unit groups
	self.healedUnits = {}
	table.insert( self.healedUnits, caster )

	-- Jump
	self:Jump( jumps, caster, target )

	-- Play effects
	local sound_cast = "Hero_Morphling.Adaptive_Strike"
	EmitSoundOn( sound_cast, caster )
end


function morphling_adaptive_strike_custom:Jump( jumps, source, target )
	-- Find enemy nearby
	local enemies = FindUnitsInRadius(
		source:GetTeamNumber(),	-- int, your team number
		source:GetOrigin(),	-- point, center point
		nil,	-- handle, cacheUnit. (not known)
		self.radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
		DOTA_UNIT_TARGET_TEAM_ENEMY,	-- int, team filter
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
		DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES,	-- int, flag filter
		0,	-- int, order filter
		false	-- bool, can grow cache
	)

	-- Damage
	for _,enemy in pairs(enemies) do
		self.damageTable.victim = enemy
		ApplyDamage( self.damageTable )

		-- Play effects
		self:PlayEffects2( enemy )
	end

	-- counter
	local jump = jumps-1
	if jump <0 then
		return
	end

	-- next target
	local nextTarget = nil
	if target and target~=source then
		nextTarget = target
	else
		-- Find ally nearby
		local allies = FindUnitsInRadius(
			source:GetTeamNumber(),	-- int, your team number
			source:GetOrigin(),	-- point, center point
			nil,	-- handle, cacheUnit. (not known)
			self.bounce_radius,	-- float, radius. or use FIND_UNITS_EVERYWHERE
			DOTA_UNIT_TARGET_TEAM_FRIENDLY,	-- int, team filter
			DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,	-- int, type filter
			0,	-- int, flag filter
			FIND_CLOSEST,	-- int, order filter
			false	-- bool, can grow cache
		)
		
		for _,ally in pairs(allies) do
			local pass = false
			for _,unit in pairs(self.healedUnits) do
				if ally==unit then
					pass = true
				end
			end

			if not pass then
				nextTarget = ally
				break
			end
		end
	end

	if nextTarget then
		table.insert( self.healedUnits, nextTarget )
		self:Jump( jump, nextTarget )
	end

	-- Play effects
	self:PlayEffects1( source, nextTarget )

end

--------------------------------------------------------------------------------
function morphling_adaptive_strike_custom:PlayEffects1( source, target )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_morphling/morphling_adaptive_strike.vpcf"

	if not target then
		target = source
	end

	-- Create Particle
	-- local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, source )
	local effect_cast = assert(loadfile("lua_abilities/rubick_spell_steal_lua/rubick_spell_steal_lua_arcana"))(self, particle_cast, PATTACH_ABSORIGIN_FOLLOW, source )
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		0,
		source,
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		source:GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		1,
		target,
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		target:GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:ReleaseParticleIndex( effect_cast )
end

function morphling_adaptive_strike_custom:PlayEffects2( target )
	-- Get Resources
	local particle_cast = "particles/units/heroes/hero_morphling/morphling_adaptive_strike.vpcf"

	-- Create Particle
	-- local effect_cast = ParticleManager:CreateParticle( particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
	local effect_cast = assert(loadfile("lua_abilities/rubick_spell_steal_lua/rubick_spell_steal_lua_arcana"))(self, particle_cast, PATTACH_ABSORIGIN_FOLLOW, target )
	ParticleManager:SetParticleControlEnt(
		effect_cast,
		0,
		target,
		PATTACH_POINT_FOLLOW,
		"attach_hitloc",
		target:GetOrigin(), -- unknown
		true -- unknown, true
	)
	ParticleManager:ReleaseParticleIndex( effect_cast )
end