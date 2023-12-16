# BroadcastPacket

Namespace: [Steamworks](Steamworks.md)

This function sends a packet of data to all other members in the specified lobby.

## Syntax

- bool **BroadcastPacket**(const uint64 lobby, const [WString](WString)& data, const int channel, const P2PSendMode sendtype)
- bool **BroadcastPacket**(const uint64 lobby, std::shared_ptr<[Buffer](Buffer.md)\> data, const int channel, const P2PSendMode sendtype)
- bool **BroadcastPacket**(const uint64 lobby, const void* data, const uint32 size, const int channel, const P2PSendMode sendtype)

| Parameter | Description |
|---|---|
| lobby | other members of this lobby will be send the packet |
| data | data to send |
| channel | packet channel to use |
| size | size of data to send |
| sendtype | can be P2PSEND_UNRELIABLE, P2PSEND_UNRELIABLENODELAY, P2PSEND_RELIABLE, or P2PSEND_RELIABLEBUFFERED |

## Returns

Returns true of the packet was successfully sent. (This does not necessarily mean the packet was successfully received.)

## Remarks

String data will be converted to UTF-8 before sending.
