# GetLeaderboardEntries

Namespace: [Steamworks](Steamworks.md)

This function retrieves the leaderboard scores.

## Syntax

- userdata **GetLeaderboardEntries**(const uint64 id, const LeaderboardDataRequest request = LEADERBOARD_GLOBAL, const int start = 0, const int count = 20)

| Parameter | Description |
|---|---|
| id | Leaderboard ID |
| request | can be LEADERBOARD_GLOBAL, LEADERBOARD_AROUNDUSER, or LEADERBOARD_FRIENDS | 
| start | starting index |
| count | number of entries |

## Returns

Returns an array of LeaderboardEntry objects, each with the following members:

| Property | Type | Description |
|---|---|---|
| userid | uint64 | user ID of the player for this entry |
| score | int | user's score |

## Remarks

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/leaderboards) for more information about Steam leaderboards.

## Example

```lua
-- Initialize Steam
if not Steamworks.Initialize() then
    RuntimeError("Steamworks failed to initialize.")
    return
end

-- Get the leaderboard
local leaderboard = Steamworks.GetLeaderboard("Feet Traveled")
Print("Leaderboard: " .. tostring(leaderboard))

-- Get leaderboard entries and print them
local entries = Steamworks.GetLeaderboardEntries(leaderboard)
for n = 1, #entries do
    local name = Steamworks.GetUserName(entries[n].userid)
    Print(name .. ": " .. tostring(entries[n].score))
end

-- Shutdown Steam
Steamworks.Shutdown()
```
