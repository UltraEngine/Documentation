# Server:Disconnect

This function disconnects a connected client.

## Syntax

```lua
function Server:Disconnect(client, force)
```

## Parameters

- `client` (table): The client to disconnect.
- `force` (boolean, optional): If set to `true`, all communication will cease immediately. Otherwise, the client will be notified it is being disconnected. Default is `false`.

## Returns

- (boolean): Returns `true` if the client was successfully disconnected, otherwise `false`.