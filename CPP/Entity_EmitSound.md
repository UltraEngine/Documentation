# Entity::EmitSound

## Syntax

- shared_ptr<[Speaker](Speaker.md)\> **EmitSound**(shared_ptr<[Sound](Sound.md)> sound, const float range = 10, const float volume = 1.0f, const float pitch = 1.0f, const bool loopmode = false)

| Parameter | Description |
|---|---|
| sound | sound to play |
| range | distance within which the sound is audible |
| volume | sound volume |
| pitch | sound pitch |
| loopmode | set to true for looping or false to play once |

## Returns

Returns a speaker that can be used to control the sound.
