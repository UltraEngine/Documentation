# SetLeaderboardScore

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

```c++
#include "UltraEngine.h"
#include "Steamworks/Steamworks.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
    // Initialize Steam
    if (not Steamworks::Initialize())
    {
        RuntimeError("Steamworks failed to initialize.");
        return 1;
    }

    auto leaderboard = Steamworks::GetLeaderboard("Feet Traveled");
    Print("Leaderboard: " + String(leaderboard));

    auto entries = Steamworks::GetLeaderboardEntries(leaderboard);
    for (int n = 0; n < entries.size(); ++n)
    {
        auto name = Steamworks::GetUserName(entries[n].userid);
        Print(name + ": " + String(entries[n].score));        
    }

    auto s = Input("\nEnter your score:");
    Steamworks::SetLeaderboardScore(leaderboard, s.ToInt());

    Steamworks::Shutdown();
    return 0;
}
```
