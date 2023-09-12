# client:disconnect

This method disconnects the client from the server.

```lua
function client:disconnect(force)
```

#### Parameters

- **force** (optional): if set to true all communication will cease immediately, otherwise the server will be notified it is being disconnected

#### Returns

- **boolean**: true if the client was successfully disconnected, false otherwise