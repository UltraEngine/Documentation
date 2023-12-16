# AppInstalled

Namespace: [Steamworks](Steamworks.md)

This function checks to see if an application is installed.

## Syntax

- bool **AppInstalled**(const uint64 appid)

| Parameter | Description |
|---|---|
| appid | the Steam app ID to check |

## Returns

Returns true if the specified application can be run by the user. This usually means the application is owned by the user, but will also return true if the app is being loaned or is free to play for a temporary period.

See the [Steamworks documentation](https://partner.steamgames.com/doc/features/auth) for additional information about autnentication and ownership of games.
