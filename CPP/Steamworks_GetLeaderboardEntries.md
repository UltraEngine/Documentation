# GetLeaderboardEntries

This function retrieves the leaderboard scores.

## Syntax

- std::vector<LeaderboardEntry> **GetLeaderboardEntries**(const uint64_t leaderboardid, const LeaderboardDataRequest request = LEADERBOARD_GLOBAL, const int start = 0, const int count = 20)

| Parameter | Description |
|---|---|
| leaderboardid | |
| request | can be LEADERBOARD_GLOBAL, LEADERBOARD_AROUNDUSER, or LEADERBOARD_FRIENDS | 
| start | |
| count | |

## Returns

Returns an array of LeaderboardEntry objects, each with the following properties:

| Property | Type | Description |
|---|---|---|
| userid | uint64_t | user ID of the player for this entry |
| score | int | user's score |
