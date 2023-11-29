## Syntax

```csharp
bool Disconnect(Peer client, bool force = false)
```

| Parameter | Description |
|---|---|
| client | client to disconnect |
| force | if set to true all communication will cease immediately, otherwise the client will be notified it is being disconnected |

## Example

```csharp
bool result = server.Disconnect(client, true);
```