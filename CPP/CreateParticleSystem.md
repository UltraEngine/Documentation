# CreateParticleSystem

This function creates a new particle system entity.

## Syntax

- shared_ptr<[ParticleSystem](ParticleSystem.md)\> **CreateParticleSystem**(shared_ptr<[World](World.md)\> world, const int capacity = 1000)

| Parameter | Description |
|---|---|
| world | world the entity belongs to |
| capacity | maximum number of particles that can be visible at once |

## Returns

Returns a new particle system entity.
