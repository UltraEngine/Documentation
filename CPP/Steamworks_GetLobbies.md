# GetLobbies

Namespace: [Steamworks](Steamworks.md)

This function is used to fetch a list of lobbies. These can be displayed in the game interface as servers the user can select from.

## Syntax

std::vector<uint64> **GetLobbies**([table](table)& properties)

| Parameter | Description |
|---|---|
| properties | key/value pairs to match |

## Returns

Returns an array of lobbies that match the specified properties.
