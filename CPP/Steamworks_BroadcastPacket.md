# BroadcastPacket

This function sends a packet of data to all other members in the specified lobby.

## Syntax

- bool **BroadcastPacket**(const uint64_t lobbyid, const [WString](WString)& data, const int channel, const P2PSendMode sendtype)
- bool **BroadcastPacket**(const uint64_t lobbyid, std::shared_ptr<[Buffer](Buffer.md)\> data, const int channel, const P2PSendMode sendtype)
- bool **BroadcastPacket**(const uint64_t lobbyid, const void* data, const uint32_t size, const int channel, const P2PSendMode sendtype)

| Parameter | Description |
|---|---|
| data | data to send |
| channel | packet channel to use |
| size | size of data to send |
| sendtype | can be P2PSEND_UNRELIABLE, P2PSEND_UNRELIABLENODELAY, P2PSEND_RELIABLE, or P2PSEND_RELIABLEBUFFERED |

## Returns

Returns false if the packet fails to send to any other member in the lobby, otherwise true us returned.

## Remarks

String data will be converted to UTF-8 before sending.
