## Syntax

```csharp
bool **Disconnect**(bool force = false)
```

| Parameter | Description |
|---|---|
| force | if set to true all communication will cease immediately, otherwise the server will be notified it is being disconnected |

## Example

```csharp
bool isForceDisconnect = true;

bool isConnected = Disconnect(isForceDisconnect);
```