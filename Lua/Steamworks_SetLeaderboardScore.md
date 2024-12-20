# SetLeaderboardScore

Namespace: [Steamworks](Steamworks.md)

This function sets the user's score for the specified leaderboard.

## Syntax

- boolean **SetLeaderboardScore**(number leaderboard, number score)

| Parameter | Description |
|---|---|
| leaderboard | ID of the leaderboard |
| score | new score to set |

## Returns

Returns true if the score is successfully set, otherwise false is returned.

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

-- Get user input for the score
local userInput = Input("\nEnter your score:")
local userScore = tonumber(userInput)

-- Set the user's score on the leaderboard
Steamworks.SetLeaderboardScore(leaderboard, userScore)

-- Get leaderboard entries and print them
local entries = Steamworks.GetLeaderboardEntries(leaderboard, Steamworks.LEADERBOARD_AROUNDUSER)
for n = 1, #entries do
    local name = Steamworks.GetUserName(entries[n].userid)
    Print(name .. ": " .. tostring(entries[n].score))
end

-- Shutdown Steam
Steamworks.Shutdown()
```
