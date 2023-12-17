# GetPacket

Namespace: [Steamworks](Steamworks.md)

This function retrieves the next available packet sent by another user.

## Syntax

- userdata **GetPacket**(number channel = 0)

| Parameter | Description |
|---|---|
| channel | channel ID |

## Returns 

If a new packet has been received, a Packet object is returned, with the following properties:

| Property | Type | Description |
|---|---|---|
| userid | uint64 | user ID of the sender |
| channel | int | channel the packet was received on |
| data | [Buffer](Buffer.md) | packet data |

If no new packet is available then NULL will be returned.

## Remarks

The data buffer for each packet should be evaluated immediately, as this buffer may be reused in the next packet returned.
