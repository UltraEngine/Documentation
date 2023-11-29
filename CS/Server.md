# Server

Base class: [`Object`](Object.md)

This class handles network server functionality.

| Property | Type | Description |
|---|---|---|
| [`Broadcast`](Server_Broadcast.md) | Method | sends a message to all clients |
| [`Disconnect`](Server_Disconnect.md) | Method | disconnects a client |
| [`Send`](Server_Send.md) | Method | sends a message to one client |
| [`Update`](Server_Update.md) | Method | updates the server and checks for messages |
| [`CreateServer`](CreateServer.md) | Function | creates a new server |

## Syntax

```csharp
class Server
{
    public void Broadcast(string message);
    public void Disconnect(int clientID);
    public void Send(int clientID, string message);
    public void Update();
    public static Server CreateServer();
}
```

## Example

```csharp
Server server = Server.CreateServer();
server.Broadcast("Hello, everyone!");
server.Send(123, "Welcome to the server!");
server.Update();
server.Disconnect(456);
```