# GetLeaderboardEntries

Namespace: [Steamworks](Steamworks.md)

This function retrieves the leaderboard scores.

## Syntax

- std::vector<LeaderboardEntry\> **GetLeaderboardEntries**(const uint64 id, const LeaderboardDataRequest request = LEADERBOARD_GLOBAL, const int start = 0, const int count = 20)

| Parameter | Description |
|---|---|
| id | Leaderboard ID |
| request | can be LEADERBOARD_GLOBAL, LEADERBOARD_AROUNDUSER, or LEADERBOARD_FRIENDS | 
| start | |
| count | |

## Returns

Returns an array of LeaderboardEntry objects, each with the following properties:

| Property | Type | Description |
|---|---|---|
| userid | uint64 | user ID of the player for this entry |
| score | int | user's score |

## Remarks

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/leaderboards) for more information about Steam leaderboards.
