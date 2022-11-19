# Server::Disconnect

This method disconnects a connected client.

## Syntax

- bool **Disconnect**(shared_ptr<[Peer](Peer.md)\> client, const bool force = false)

| Parameter | Description |
|---|---|
| client | client to disconnect |
| force | if set to true all communication will cease immediately, otherwise the client will be notified it is being disconnected |

