# GetLeaderboard

Namespace: [Steamworks](Steamworks.md)

This function gets a game's leaderboard.

## Syntax

- number **GetLeaderboard**([string](https://www.lua.org/manual/5.4/manual.html#6.4) name)

| Parameter | Description |
|---|---|
| name | leaderboard name |

## Returns

Returns the ID of the leaderboard if successful, otherwise zero is returned.

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
