# Leaderboard::GetEntries

This method gets the specified number of entries from a leaderboard.

## Syntax

- std::vector<LeaderboardEntry\> **GetEntries**(const LeaderboardDataRequest request = LEADERBOARD_GLOBAL, const int start = 0, const int count = 20)

| Parameter | Description |
|---|---|
| request | can be LEADERBOARD_GLOBAL, LEADERBOARD_AROUNDUSER, or LEADERBOARD_FRIENDS |
| start | first index to retrieve |
| count | number of indexes to retrieve |

## Returns

Returns an array of LeaderboardEntry objects with the following data available:

| Property | Type | Description |
|---|---|---|
| userid | uint64_t | the user this score is for |
| score | int | the score for this entry |
