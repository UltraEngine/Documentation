# BroadcastPacket

Namespace: [Steamworks](Steamworks.md)

This function sends a packet of data to all other members in the specified lobby.

## Syntax

- boolean **BroadcastPacket**(number lobby, [string](https://www.lua.org/manual/5.4/manual.html#6.4) data, number channel = 0, number sendtype = P2PSEND_UNRELIABLE)
- boolean **BroadcastPacket**(number lobby, [Buffer](Buffer.md) data, number channel = 0, number sendtype = P2PSEND_UNRELIABLE)
- boolean **BroadcastPacket**(number lobby, userdata data, number size, number channel = 0, number sendtype = P2PSEND_UNRELIABLE)

| Parameter | Description |
|---|---|
| lobby | other members of this lobby will be send the packet |
| data | data to send |
| channel | packet channel to use |
| size | size of data to send |
| sendtype | can be P2PSEND_UNRELIABLE, P2PSEND_UNRELIABLENODELAY, P2PSEND_RELIABLE, or P2PSEND_RELIABLEBUFFERED |

## Returns

Returns true of the packet was successfully sent. (This does not necessarily mean the packet was successfully received.)
