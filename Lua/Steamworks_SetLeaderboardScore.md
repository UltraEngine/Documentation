# SetLeaderboardScore

Namespace: [Steamworks](Steamworks.md)

This function sets the user's score for the specified leaderboard.

## Syntax

- bool **SetLeaderboardScore**(const uint64 leaderboard, const int score)

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
Print("Leaderboard: " .. String(leaderboard))

-- Get leaderboard entries and print them
local entries = Steamworks.GetLeaderboardEntries(leaderboard)
for n = 1, #entries do
    local name = Steamworks.GetUserName(entries[n].userid)
    Print(name .. ": " .. String(entries[n].score))
end

-- Get user input for the score
local userInput = Input("\nEnter your score:")
local userScore = userInput:ToInt()

-- Set the user's score on the leaderboard
Steamworks.SetLeaderboardScore(leaderboard, userScore)

-- Shutdown Steam
Steamworks.Shutdown()
```
