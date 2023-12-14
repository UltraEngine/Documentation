# Steamworks.UnlockAchievement

This functions sets an achievement for a user's account for the game.

## Syntax

- boolean **UnlockAchievement**([string]() name)

| Parameter | Description |
|---|---|
| name | name of the achievement set in the Steamworks game settings |

## Returns

Returns true if the achievement was successfully added. If the achievement does not exist or could not be set then false is returned.

## Remarks

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/achievements/ach_guide) for more information on creating achievements for your game.
