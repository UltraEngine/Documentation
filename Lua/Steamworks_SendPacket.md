# SendPacket

Namespace: [Steamworks](Steamworks.md)

This function sends a packet of data to another user who is in the same lobby.

## Syntax

- bool **SendPacket**(const uint64 userid, const [WString](WString)& data, const int channel = 0, const P2PSendMode sendtype = P2PSEND_UNRELIABLE)
- bool **SendPacket**(const uint64 userid, std::shared_ptr<[Buffer](Buffer.md)\> data, const int channel = 0, const P2PSendMode sendtype = P2PSEND_UNRELIABLE)
- bool **SendPacket**(const uint64 userid, const void* data, const uint32 size, const int channel = 0, const P2PSendMode sendtype = P2PSEND_UNRELIABLE)

| Parameter | Description |
|---|---|
| userid | user ID to send the data to |
| data | data to send |
| channel | packet channel to use |
| size | size of data to send |
| sendtype | can be P2PSEND_UNRELIABLE, P2PSEND_UNRELIABLENODELAY, P2PSEND_RELIABLE, or P2PSEND_RELIABLEBUFFERED |

## Returns

Returns true of the packet was successfully sent. (This does not necessarily mean the packet was successfully received.)
